---
permalink: /projects_dev.csv
layout: plaintext
---
function getQueryParams(qs) {
    qs = qs.split('+').join(' ');

    var params = {},
        tokens,
        re = /[?&]?([^=]+)=([^&]*)/g;

    while (tokens = re.exec(qs)) {
        params[decodeURIComponent(tokens[1])] = decodeURIComponent(tokens[2]);
    }

    return params;
}

{%- assign id = 0 -%}
{%- assign projects = site.data.project_database.projects | values | sort: 'postdate' | reverse -%}
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
{{ content | strip_html }}
