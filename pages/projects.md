---
permalink: /projects.html
layout: default
title: Project database
mermaid: true
---

# Open project database

This page is a prototype project database instance.. Very much a work in progress...

<img src="/assets/images/coming-soon-g994b7410f_1280.png" width="100">

<script>  
function dropdownMenu2() {  

{%- assign projects = site.data.projects | values -%}
var id = 0;
{%- for project in projects -%}
  var show_item = 'unset';
  var projectDiv = document.getElementById(++id);

  {%- for item_hash in site.data.project_metadata -%}
    {%- assign item_id = "option_" | append: item_hash[0] -%}
    var list_item = "{{ item_id }}";
    var item_name = "{{ item_hash[0] }}";
    {%- assign item_hash_0 = item_hash[0] -%}
    var list = document.getElementById(list_item);
    var selectedCategory = list.options[list.selectedIndex].text;
    var cats = {{ project[item_hash_0] | jsonify }};
    if ( !( selectedCategory =='---'+item_name+'---' || cats.includes(selectedCategory) ) ) {
      show_item = 'none'
    }
  {%- endfor -%}
  projectDiv.style.display = show_item;
{%- endfor -%}

}  
</script>


<script>  
function dropdownMenu(which_menu,which_item) {  
   var list = document.getElementById(which_menu);
   var options = list.options;
   var selectedCategory = options[list.selectedIndex].text;
   var id = 0;
   {%- assign projects = site.data.projects | values -%}
   {% for project in projects %}
      var cats = {{ project.categories | jsonify }}
      var projectDiv = document.getElementById(++id);
      projectDiv.style.display = ( selectedCategory == '---'+which_item+'---' || cats.includes(selectedCategory) ) 
        ? 'unset' 
        : 'none';
   {%- endfor -%}
}  
</script>

{%- for item_hash in site.data.project_metadata -%}
{%- assign categories = item_hash[1] | sort -%}
{%- assign item_id = "option_" | append: item_hash[0] -%}
<select id = {{item_id}} onchange = "dropdownMenu2()" >  
<option> ---{{item_hash[0]}}--- </option>  
{%- for category in categories -%}
{%- assign cat = category  -%}
<option> {{cat}} </option>  
{%- endfor -%}
</select>
{%- endfor -%}


{% assign id = 0 %}
{%- assign projects = site.data.projects | values -%}
{% for project in projects %}
  {% assign id = id | plus:1 %}
  <div id="{{id}}">
   <li> {{project.name }} </li>
  </div> 
{% endfor %}





