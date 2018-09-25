--------------------------------------------------------
--  File created - Tuesday-September-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PCK_MARKDOWN_REGION_PLUGIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PLUGINS"."PCK_MARKDOWN_REGION_PLUGIN" as 

  -----------------------------------------------------------------------------
  -- FUNCTION f_render
  -- %usage: plugin render function
  function f_render (p_region              in apex_plugin.t_region
                   , p_plugin              in apex_plugin.t_plugin
                   , p_is_printer_friendly in boolean)
    return apex_plugin.t_region_render_result;

end pck_markdown_region_plugin;
