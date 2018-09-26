--------------------------------------------------------
--  File created - Wednesday-September-26-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PCK_MARKDOWN_REGION_PLUGIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PLUGINS"."PCK_MARKDOWN_REGION_PLUGIN" as

  -----------------------------------------------------------------------------
  -- FUNCTION f_render
  -- %usage: plugin render function
  function f_render (p_region              in apex_plugin.t_region
                   , p_plugin              in apex_plugin.t_plugin
                   , p_is_printer_friendly in boolean)
    return apex_plugin.t_region_render_result
  is
    v_result  apex_plugin.t_region_render_result;
    v_js_code varchar2(4000);    
  begin
    -- debug
    if v('DEBUG') = 'YES' then
      apex_plugin_util.debug_region (p_plugin => p_plugin
                                   , p_region => p_region);
    end if;                             
                
    -- by default HTML is escaped            
    if p_region.escape_output then                                     
      sys.htp.prn('<div class="markdown-region-wrapper" style="display:none">'||apex_escape.html(apex_plugin_util.replace_substitutions(p_region.source, true))||'</div>');
    else
      sys.htp.prn('<div class="markdown-region-wrapper" style="display:none">'||apex_plugin_util.replace_substitutions(p_region.source, false)||'</div>');
    end if;
    
    -- add JS files
    apex_javascript.add_library (
       p_name                    => 'lib/showdown/showdown'
      ,p_directory               => p_plugin.file_prefix
      ,p_version                 => null
      ,p_check_to_add_minified   => true
      ,p_skip_extension          => false
      );

    apex_javascript.add_library (
       p_name                    => 'js/markdown_region/markdown_region'
      ,p_directory               => p_plugin.file_prefix
      ,p_version                 => null
      ,p_check_to_add_minified   => true
      ,p_skip_extension          => false
      );      
      
    apex_css.add_file (
       p_name           => 'css/markdown_region/markdown_region'
      ,p_directory      => p_plugin.file_prefix
      ,p_version        => null
      ,p_skip_extension => false);      
      
    v_js_code := 'apex.jQuery("#'||p_region.static_id||'").markdown_region_plugin({"config":';
    
    -- add init code
    if p_region.init_javascript_code is not null then
      v_js_code := v_js_code||'('||p_region.init_javascript_code||')';
    end if;  
    
    v_js_code := v_js_code||'({}),'||
    apex_javascript.add_attribute('ajaxId', apex_plugin.get_ajax_identifier, p_add_comma => true)||
    apex_javascript.add_attribute('regionId', p_region.static_id, p_add_comma => false)||
    '});';
    apex_javascript.add_onload_code (p_code => v_js_code);          
      
    return v_result;
  end f_render;  

end pck_markdown_region_plugin;
