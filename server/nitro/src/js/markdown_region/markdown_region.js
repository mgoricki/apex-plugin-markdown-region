/*
* Plugin:  Mardown Region Plugin
* Version: 1.0.0 (24.09.2018.)
*
* Author:  Marko Goricki, BiLog
* Mail:    mgoricki@gmail.com
* Twitter: @mgoricki
* Blog:    apexbyg.blogspot.com 
*
* Depends:
*    apex/debug.js
*
* Changes:
*
* v1.0.0 - 20180924 - Initial version
*
* Public Methods:
*
*
* Notes:
*   You can use JavaScript Initialization Code for additional configuration:
*   More options can be find here: https://github.com/showdownjs/showdown/wiki/Showdown-options
*   Example:
*   function (options){
*     options.literalMidWordUnderscores = false;
*     options.noHeaderId = true;
*     return options;
*   }
*/
(function ($, util) {
  "use strict";

  $.widget("apex.markdown_region_plugin", {
    options : {
      regionId: null,      
      config: {
        "literalMidWordUnderscores":true
      }
    },
    _init:function(){
      var uiw = this,
          vRegionId$ = $('#'+uiw.options.regionId),
          vConverter = new showdown.Converter(uiw.options.config),
          vMarkdownWrapper$ = vRegionId$.find('.markdown-region-wrapper'),
          vText = vMarkdownWrapper$.html(),
          vHtml = vConverter.makeHtml(vText);

    // get HTML dynamically   
    /* 
    apex.server.plugin (uiw.options.ajaxId, {}, {
      success: function(pData) {
        console.log(pData);
      }
    });
    */  

      vMarkdownWrapper$.html(vHtml);    
      vMarkdownWrapper$.show();    
            
      apex.region.create(uiw.options.regionId, {
        refresh: function() {
          apex.debug.log('Markdown Region Refresh', 'Not implemented');
        }
      });       
    }
  });
})(apex.jQuery, apex.util);

  