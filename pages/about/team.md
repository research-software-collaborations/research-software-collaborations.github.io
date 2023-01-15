---
permalink: /about/team.html
layout: people
title: HSF-India Collaborators
---

{%- comment -%}
{% include institution_list.html %}
{%- endcomment -%}
{% assign institution_list = site.data.universities | keys | sort %}
{% assign univs = institution_list | hash_fetch: site.institutes %}

<h1>HSF-India Collaborators</h1><br>

<div class="container-fluid">
  <div class="row">
    {% for univ in univs %}
<h2>{{univ.title}}</h2>
{%- comment -%}
      {% assign members = univ.personnel | hash_fetch: site.collaborators
                                         | where_exp:"item", "item.active and item.hidden != true"
                                         | last_name_sort: "name" %}
      {% for person in members %}
        {% include standard_person_card.md person=person %}
      {% endfor %}
{%- endcomment -%}

    {% endfor %}
  </div>
</div>

{%- comment -%}
<br>
<h1>Former Team Members</h1><br>

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

