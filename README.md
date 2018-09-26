# APEX Markdown Region Plugin
APEX 18.1+  Region Plugin for converting [Markdown](https://en.wikipedia.org/wiki/Markdown) static source to the HTML. It uses [ShowdownJS converter](http://showdownjs.com/) (v1.8.6).

# Features
 - converting static Markdown to the HTML
 - easily customizable with JavaScript Initialization Code attribute

# Changelog
  - v1.0.0 20180924 - Initial Release
  - v1.0.1 20180926 - Support for &ITEM. substitution

# Install
  - Import plugin file region_type_plugin_com_apexbyg_blogspot_markdownregion.sql from source directory
  - (Optional) To optimize performance upload static files (CSS and JS) from server/nitro/dist directory to Webserver and change File Prefix to point on server directory
  - (Optional) Compile package pck_markdown_region_plugin (from source directory) in DB schema (available to APEX parsing schema) and change parameter Render Function Name to pck_markdown_region_plugin.f_render

# Settings

You can customize region with additional parameters by using Initialization Code attribute. Additional options are available here: [https://github.com/showdownjs/showdown/wiki/Showdown-options](https://github.com/showdownjs/showdown/wiki/Showdown-options).

Example of Initialization Code attribute:
```javascript
function (options){
  options.literalMidWordUnderscores = false;
  options.noHeaderId = true;
  return options;
}
```

# Usage
Put Markdown code into the static source of the region.

# Notes
GitHub project [https://github.com/mgoricki/apex-plugin-markdown-region](https://github.com/mgoricki/apex-plugin-markdown-region).


# Demo
Demo is available [here](https://apex.oracle.com/pls/apex/f?p=apexbyg:markdownregion)
