---
permalink: /projects.csv
layout: plaintext
---
{%- capture contentForQuerystring -%}{{ content_for_header }}{%- endcapture -%}
{%- assign pageUrl = contentForQuerystring | split:'"pageurl":"' | last | split:'"' | first | split:'.myshopify.com' | last |
   replace:'\/','/' | 
   replace:'%20',' ' | 
   replace:'\u0026','&'
-%}

{%- assign id = 0 -%}
{%- assign projects = site.data.project_database.projects | values | sort: 'postdate' | reverse -%}
{%- capture content -%}
{{ content_for_header }}
<br>
{{ pageUrl }}
<br>
Project Name, Mentor Names, Mentor emails
<br>
{%- for project in projects -%}
  {%- assign namesArr = '' -%}
  {%- assign emailsArr = '' -%}
  {%- for contact in project.contacts -%}
    {%- assign namesArr = namesArr | append: contact.name -%}
    {%- assign emailsArr = emailsArr | append: contact.email -%}
    {%- if forloop.last == false -%}
       {%- assign namesArr = namesArr | append: ", " -%}
       {%- assign emailsArr = emailsArr | append: ", " -%}
    {%- endif -%}
  {%- endfor -%}
{% assign id = id | plus:1 -%}
\"{{project.name }}\",\"{{namesArr}}\",\"{{emailsArr}}\"
<br>
{%- endfor -%}
{%- endcapture -%}
{{ content | strip_html }}
