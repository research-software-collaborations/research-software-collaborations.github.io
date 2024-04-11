---
permalink: /projects.csv
layout: none
---
{%- assign id = 0 -%}
{%- assign projects = site.data.project_database.projects | values | sort: 'postdate' | reverse -%}
pp
{%- capture content -%}
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
{{ content | markdownify | strip_html }}
pp
