---
permalink: /institutes.html
layout: default
title: Collaborating Universities and Institutes
---

## Collaborating Universities and Institutes

<ul>
{% for post in site.institutes%}
  {% assign nummembers = post.personnel | size %} 
  {% if nummembers > 0 %}
  <li><a href="{{post.url}}">{{ post.title }}</a></li>
  {% endif %}
{% endfor %}
</ul>

