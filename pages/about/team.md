---
permalink: /about/team.html
layout: people
title: HSF-India Collaborators
---

{% assign univs = site.institutes %}

<h1>HSF-India Collaborators</h1><br>

<div class="container-fluid">
  <div class="row">
    {% for univ in univs %}
      {% for person in univ.personnel %}
        {% assign collaborator = site.collaborators | where_exp:"collaborator", "collaborator.shortname == person"
    | first %}
        {% if collaborator.active and collaborator.hidden != true %}
          {% include standard_person_card.md person=collaborator %}
        {% endif %}
      {% endfor %}
    {% endfor %}
  </div>
</div>

{%- comment -%}
<br>
<h1>Former Collaborators</h1><br>

<div class="container-fluid">
  <div class="row">
    {% for univ in univs %}
      {% assign members = univ.personnel | hash_fetch: site.data.people
                                         | where_exp: "item", "item.active == nil or item.active == false and item.hidden != true"
                                         | last_name_sort: "name" %}

      {% for person in members %}
        {% include standard_person_card.md person=person %}
      {% endfor %}
    {% endfor %}
  </div>
</div>
{%- endcomment -%}

