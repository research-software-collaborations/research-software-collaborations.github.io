---
permalink: /about/executive-committee.html
layout: default
title: PI Team
---

<div class="container-fluid">
  <h1>PI Team</h1><br>
<!--
  <p><b>The project Executive Committee manages the day to day activities of the project.</b></p>
-->
  <div class="row">
  {% for member in site.data.orgs.exec-board.personnel  %}
     {% assign collaborator = site.data.people[member] %}
        {% if collaborator.active and collaborator.hidden != true %}
          {% include standard_person_card.md person=collaborator %}
        {% endif %}
  {% endfor %}
  </div>
  <br>
</div>

