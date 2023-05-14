---
permalink: /presentations/byperson.html
layout: presentations
title: Presentations by Person
---

{% assign empty-list = "" | split: "," %}

<h2>Presentations related to HSF-India</h2>
{% assign prescount = 0 %}

{% assign members = site.collaborators | where_exp:"item", "item.active and item.hidden != true"
                                     | last_name_sort: "name" %}
{% for member in members %}
  {%- assign presentationlist = member.presentations | default: empty-list | sort: "date" | reverse -%}
  {%- if presentationlist.size > 0 -%}
    <h4 align="left">{{member.name}} - {{member.institution}}</h4>
    <ul>
      {%- for talk in presentationlist -%}
        {%- assign prescount = prescount | plus: "1" -%}
        <li align="left">
          {%- include print_pres.html talk=talk -%}
        </li>
      {%- endfor- %}
    </ul>
  {%- endif -%}
{%- endfor -%}

Total presentations: {{ prescount }}

