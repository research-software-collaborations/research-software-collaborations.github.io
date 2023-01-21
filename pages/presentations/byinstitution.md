---
permalink: /presentations/byinstitution.html
layout: presentations
title: Presentations by Institution
---

{% assign sorted_presentations = site.data['sorted_presentations'] %}

<!--
  0     1       2      3       4          5           6          7            8
date | name | title | url | meeting | meetingurl | project | focus_area | institution
-->

{%- comment -%}
{% include institution_list.html %}
{%- endcomment -%}

<h2>Presentations related to HSF-India</h2>
{% assign prescount = 0 %}

{%- comment -%}
{% for uniindex in institution_list %}
  {% assign univ = site.data.universities[uniindex] %}
{%- endcomment -%}

{% assign univs = site.institutes %}
  {% for univ in univs %}
<h4>{{univ.name}}</h4>
<ul>
  {% for talk in sorted_presentations %}
    {% if site.data.people[talk.member].institution contains univ.name %}
      <li>
        {%- include print_pres.html talk=talk -%}
      </li>

      {% assign prescount = prescount | plus: "1" %}
    {% endif %}
  {% endfor %}
</ul>

{% endfor %}

Total presentations: {{ prescount }}.
