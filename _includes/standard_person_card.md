{%- unless include.person -%}
    {% raise_error "Empty person card! Please check." %}
{%- endunless %}

       <div class="card" style="width: 12rem;">
         <a href="{{include.person.url}}"><img class="card-img-top" src="{{ include.person.photo }}" alt="Card image cap"></a>
         <div class="card-body d-flex flex-column">
         <div class="card-text">
         {% if include.person.website and include.person.website != blank %}
            <b><a href="{{include.person.url}}">{{ include.person.name }}</a></b><br>
         {% else %}
            <b>{{ include.person.name }}</b><br>
         {% endif %}
         <small>{{ include.person.institution }}</small><br><br>
         </div>
         <!--
         <div class="card-text mt-auto"><i>{{ include.person.title }}</i></div>
         -->

          <div class="footer-buttons">

           {% if include.person.e-mail and include.person.e-mail != blank %}
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="mailto:{{include.person.e-mail}}"><i class="fas fa-envelope-square"></i></a>
            </button>
           {% endif %}

           {% if include.person.website and include.person.website != blank %}
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="{{include.person.website}}"><i class="fas fa-desktop"></i></a>
            </button>
           {% endif %}

           {% if include.person.github-username and include.person.github-username != blank %}
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="https://github.com/{{ include.person.github-username }}"> <span class="fab fa-github"></span></a>
            </button>
           {% endif %}


           {% if include.person.gitlab-url and include.person.gitlab-url != blank %}
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="{{ include.person.gitlab-url }}"> <span class="fab fa-gitlab"></span></a>
            </button>
           {% endif %}

           {% if include.person.linkedin-profile and include.person.linkedin-profile != blank %}
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="{{ include.person.linkedin-profile }}"> <span class="fab fa-linkedin"></span></a>
            </button>
           {% endif %}

<!--
          {% if include.person.twitter and include.person.twitter != blank %}
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="{{ include.person.twitter }}"><i class="fab fa-twitter"></i></a>
            </button>
           {% endif %}
-->

            </div>
          </div>
       </div>

