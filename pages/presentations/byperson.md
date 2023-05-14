---
permalink: /presentations/byperson.html
layout: presentations
title: Presentations by Person
---

{% assign empty-list = "" | split: "," %}

<h2>Presentations related to HSF-India</h2>
{% assign prescount = 0 %}

{% assign members = site.collections['collaborators'] | where_exp:"item", "item.active and item.hidden != true"
                                     | last_name_sort: "name" %}
{% for member in members %}
  {%- assign presentationlist = member.presentations | default: empty-list | sort: "date" | reverse -%}
  <h4>{{member.name}} - {{member.institution}}</h4>
  {%- if presentationlist.size > 0 -%}
    <ul>
      {%- for talk in presentationlist -%}
        {%- assign prescount = prescount | plus: "1" -%}
        <li>
          {%- include print_pres.html talk=talk -%}
        </li>
      {%- endfor- %}
    </ul>
  {%- else -%}
    <p>No presentations found.</p>
  {%- endif -%}
{%- endfor -%}

Total presentations: {{ prescount }}

