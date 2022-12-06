{%- unless include.person -%}
    {% raise_error "Empty person card! Please check." %}
{%- endunless %}

       <div class="card" style="width: 12rem;">
         <img class="card-img-top" src="{{ include.person.photo }}" alt="Card image cap">
         <div class="card-body d-flex flex-column">
         <div class="card-text">
         {% if include.person.website and include.person.website != blank %}
            <b><a href="{{ include.person.website }}">{{ include.person.name }}</a></b><br>
         {% else %}
            <b>{{ include.person.name }}</b><br>
         {% endif %}
         <small>{{ include.person.institution }}</small><br><br>
         </div>
         <div class="card-text mt-auto"><i>{{ include.person.title }}</i></div>
         </div>

          <div class="footer-buttons">
<!--            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="https://twitter.com/iris_hep"><i class="fab fa-twitter"></i></a>
            </button> -->
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="https://github.com/research-software-collaborations"> <span class="fab fa-github"></span></a>
            </button>
            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="https://www.youtube.com/channel/UC8Dmx4MYjp6RQ9ngc58Ujmg?view_as=subscriber"> <i class="fab fa-youtube"></i></a>
            </button>
<!--            <button type="button" class="btn btn-outline-secondary btn-sm">
              <a href="https://groups.google.com/a/iris-hep.org/forum/#!forum/announcements"> <span class="fab fa-google"></span></a>
            </button> -->
            </div>

       </div>

