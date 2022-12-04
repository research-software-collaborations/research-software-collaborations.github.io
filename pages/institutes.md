---
permalink: /institutes.html
layout: default
title: Collaborating Universities and Institutes
---

## Collaborating Universities and Institutes

<ul>
{% for post in site.institutes%}
  <li><a href="{{post.url}}">{{ post.title }}</a></li>
{% endfor %}
</ul>

