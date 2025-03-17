---
permalink: /trainees.html
layout: default
title: Research Software Trainees and Fellowships
---

**March 17, 2025: [2025 Trainee program is looking for students and mentors](https://research-software-collaborations.org/trainee_program.html)
  

## Research Software Trainees

People are the key to successful software. The HSF-India project aims to promote the
development of international research software collaborations in physics
by providing opportunities for undergraduate and graduate (both masters and PhD candidate)
trainees to connect with expert mentors from the particle physics, nuclear physics and astroparticle physics communities
as well as from the Computational/Data Science community.
Our program aims to help students to gain experience working in a unique scientific and collaborative environment and to
learn new programming, research and analysis skills that are important for future careers in science and technology.

We maintain a list currently open available ideas can be found [here](http://research-software-collaborations.org/projects).
Get inspired by these and contact us with questions. To add your own project idea, please see
the instructions [in our GitHub](https://github.com/research-software-collaborations/project_database?tab=readme-ov-file#adding-a-new-project).

Are you interested in building research software skills and gaining experience working as part of
a research team and contributing to cutting edge
open source research software projects? Then the HSF-India program could be for you. Find more information about our
program and how to appy
[here](/trainee_program.html). 


{% assign trainees = site.pages | where: "pagetype", "trainee"
                               | last_name_sort: "name"
                               | reverse %}
{% assign active-trainees = trainees | select: "active" | where_exp: "item", "item.hidden != true" %}
{% assign inactive-trainees = trainees | reject: "active" | where_exp: "item", "item.hidden != true" %}


{%- if active-trainees.size > 0 %}
## Current and Former Trainees

<div id="current" class="container-fluid">
  <div class="row">
    {% for person in trainees %}
      <div class="card" style="width: 12rem;">
         <img class="card-img-top" src="{{person.photo}}" alt="Card image cap">
         <div class="card-body d-flex flex-column">
           <div class="card-text">
              <b><a href="{{person.permalink}}">{{person.myname}}</a></b><br>
              <small>{{person.institution}}</small><br><br>
           </div>
           <div class="card-text mt-auto"><i>
             {% include fellow_dates.html dates=person.dates %}
           </i><br></div>
         </div>
      </div>
    {% endfor %}
  </div>
  <br>
</div>
{%- endif -%}


