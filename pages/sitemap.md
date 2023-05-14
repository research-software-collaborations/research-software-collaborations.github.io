---
permalink: /sitemap.html
layout: default
title: Sitemap
---
<h3>HSF-India Website Sitemap</h3>

{% comment %}
Go through the list of pages and create an index of them, separating by
different page categories (using our custom frontmatter tag "pagetype").
{% endcomment %}

<br>
<b>Documentation pages:</b>
<ul>
{% assign sorted = site.pages | where: 'pagetype', 'doc' | sort_natural: 'title' %}
{% for mypage in sorted %}
  <li><a href="{{mypage.permalink}}">{{ mypage.title }}</a></li>
{% endfor %}
</ul>

<br>
<b>HSF-India Fellow pages:</b>
<ul>
{% assign sorted = site.pages | where: 'pagetype', 'fellow' | sort_natural: 'title' %}
{% for mypage in sorted %}
  <li><a href="{{mypage.permalink}}">{{ mypage.title }}</a></li>
{% endfor %}
</ul>

<br>
<b>Focus Area pages:</b>
<ul>
{% assign sorted = site.pages | where: 'pagetype', 'focus-area' | sort_natural: 'title' %}
{% for mypage in sorted %}
  <li><a href="{{mypage.permalink}}">{{ mypage.title }}</a></li>
{% endfor %}
</ul>


<br>
<b>Other pages:</b>
<ul>
{% assign sorted = site.pages | select: 'title' | sort_natural: 'title' %}
{% for mypage in sorted %}
  {% if mypage.pagetype != 'doc' and mypage.pagetype != 'focus-area' and mypage.pagetype != 'project' and mypage.pagetype != 'fellow' %}
  <li><a href="{{mypage.permalink}}">{{ mypage.title }}</a></li>
  {% endif %}
{% endfor %}
</ul>

<br>
<b>Institutes:</b>
<ul>
{% for post in site.institutes %}
  <li><a href="{{post.url}}">{{ post.title }}</a></li>
{% endfor %}
</ul>

<br>
<b>Networks:</b>
<ul>
{% for post in site.networks %}
  <li><a href="{{post.url}}">{{ post.title }}</a></li>
{% endfor %}
</ul>

<br>
<b>Collaborators:</b>
<ul>
{% for post in site.collaborators %}
  <li><a href="{{post.url}}">{{ post.name }}</a></li>
{% endfor %}
</ul>

