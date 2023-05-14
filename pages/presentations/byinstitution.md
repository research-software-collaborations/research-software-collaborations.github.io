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

<div align="left">   
{% assign univs = site.institutes %}
{% for univ in univs %}
  {% assign prescount = 0 %}
  {% for talk in sorted_presentations %}
    {% if univ.personnel contains talk.member %}
      {% assign prescount = prescount | plus: "1" %}
    {% endif %}
  {% endfor %}

  {% if prescount > 0 %}
  <h4>{{univ.title}}</h4>
  <ul>
    {% for talk in sorted_presentations %}
      {% if univ.personnel contains talk.member %}
        <li>
          {%- include print_pres.html talk=talk -%}
        </li>

        {% assign prescount = prescount | plus: "1" %}
      {% endif %}
    {% endfor %}
  </ul>
  {% endif %}

{% endfor %}

<br>
Total presentations: {{ sorted_presentations.size }} .
</div>