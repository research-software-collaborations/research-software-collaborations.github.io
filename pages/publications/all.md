---
permalink: /publications/all.html
layout: presentations
title: Publications
draft: false
---

## Publications associated with HSF-India

{% assign sorted_publications = site.data['sorted_publications'] %}

<ul>
  {% for pub in sorted_publications %}
    {%- unless pub.related-work %}
      <li> {% include print_pub.html pub=pub %} </li>
    {%- endunless %}
  {% endfor %}
</ul>



