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

<h2>Presentations related to HSF-India</h2>
{% assign prescount = 0 %}

{% assign univs = site.institutes %}
  {% for univ in univs %}
<h4>{{univ.title}}</h4>
<ul>
  {% for talk in sorted_presentations %}
    {% if site.institutions[talk.member].institution contains univ.title %}
      <li>
        {%- include print_pres.html talk=talk -%}
      </li>

      {% assign prescount = prescount | plus: "1" %}
    {% endif %}
  {% endfor %}
</ul>

{% endfor %}

Total presentations: {{ prescount }}.
