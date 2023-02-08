---
permalink: /projects.html
layout: default
title: Project database
mermaid: true
pulldown_defaults:
  program: IRIS-HEP fellow
---

# Open project database

We want to make finding projects easier for students and advertising projects easier for scientists
with research opportunities. Today, this is very much a work in progress... eventually you will be able
to search for perspective project ideas and easily add new project opportunities to this repository.

This page is a prototype project database. Use the menu bars to select projects based on their attributes. Projects with no value
specified for a given attribute will not be included if a selection is made on that attribute. Projects may instead specify
that they are appropriate for multiple options (or any option) for a given attribute.
Click the triangle next to each project for more information (if provided by the project mentors).


<img src="/assets/images/coming-soon-monsoon.png" width="100">

<script>  
function dropdownMenu2() {  

{%- assign projects = site.data.project_database.projects | values -%}
var id = 0;
{%- for project in projects -%}
  var show_item = 'unset';
  var projectDiv = document.getElementById(++id);

  {%- for item_hash in site.data.project_database.project_metadata -%}
    {%- assign item_id = "option_" | append: item_hash[0] -%}
    var list_item = "{{ item_id }}";
    var item_name = "{{ item_hash[0] }}";
    {%- assign item_hash_0 = item_hash[0] -%}
    var list = document.getElementById(list_item);
    var selectedCategory = list.options[list.selectedIndex].text;
    {%- if project[item_hash_0] -%}
       var cats = {{ project[item_hash_0] | jsonify }};
       if ( !( selectedCategory =='--'+item_name+'--' || cats.includes("Any") || cats.includes(selectedCategory) ) ) {
         show_item = 'none';
       }
  {%- else -%}
       if ( !( selectedCategory =='--'+item_name+'--' ) ) {
         show_item = 'none';
       }	 
  {%- endif -%}
  {%- endfor -%}
  projectDiv.style.display = show_item;
{%- endfor -%}

}  
</script>
{%- assign debug = "nothing" -%}
{%- for item_hash in site.data.project_database.project_metadata -%}
{%- assign categories = item_hash[1] | sort -%}
{%- assign item_id = "option_" | append: item_hash[0] -%}
<select id = {{item_id}} onchange = "dropdownMenu2()" >  
{%- if page.pulldown_defaults and page.pulldown_defaults[item_hash[0]] -%}
{%- assign debug = page.pulldown_defaults[item_hash[0]] -%}
<option> page.pulldown_defaults["{{item_hash[0]}}"] </option>
<option> --{{item_hash[0]}}-- </option>
{%- else -%}
<option> --{{item_hash[0]}}-- </option>
{%- endif -%}
{%- for category in categories -%}
{%- assign cat = category  -%}
{%- if page.pulldown_defaults and page.pulldown_defaults[item_hash[0]] and page.pulldown_defaults[item_hash[0]] == "{{cat}}" -%}
{%- assign dummy = "do nothing" -%}
{%- else -%}
<option> {{cat}} </option>  
{%- endif -%}
{%- endfor -%}
</select>
{%- endfor -%}

{{debug}}

{% assign id = 0 %}
{%- assign projects = site.data.project_database.projects | values -%}
{% for project in projects %}

  {%- assign namesArr = '' -%}
  {%- assign emailsArr = '' -%}  
  {%- for contact in project.contacts -%}
    {%- assign namesArr = namesArr | append: contact.name %}
    {%- assign emailsArr = emailsArr | append: contact.email %}
    {%- if forloop.last == false -%}
       {% assign namesArr = namesArr | append: "," -%}
       {% assign emailsArr = emailsArr | append: "," -%}
    {%- endif -%}
  {%- endfor -%}

  {% assign id = id | plus:1 %}
  <div id="{{id}}">
   {%- capture details -%} {{project.description}} {%- endcapture -%}
   {%- capture summary -%}{{project.name }}: {{project.shortdescription}}. <a href="mailto:{{emailsArr}}">Email the mentors ({{namesArr}})</a>{%- endcapture -%}
   {%- include details.html -%}
  </div>
{% endfor %}





