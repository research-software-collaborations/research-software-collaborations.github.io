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
     {% assign person = site.data.people[member] %}
       <div class="card" style="width: 12rem;">
         <img class="card-img-top" src="{{person.photo}}" alt="Card image cap">
         <div class="card-body d-flex flex-column">
         <div class="card-text">
         <b><a href="{{person.website}}">{{person.name}}</a></b><br>
         <small>{{person.institution}}</small><br><br>
         {% if person.e-mail %}
           <small>
             <a href="mailto:{{person.e-mail}}">
               <em>{{person.e-mail}}</em>
             </a>
           </small><br><br>
         {% endif %}
         </div>
         <div class="card-text mt-auto"><i>{{person.title}}</i><br></div>
         </div>
       </div>
  {% endfor %}
  </div>
  <br>
</div>

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

