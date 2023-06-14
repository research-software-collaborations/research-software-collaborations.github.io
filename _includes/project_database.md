<script>
function dropdownMenu2() {

var search_box = document.getElementById("searchprojects");
var search_box_text = search_box.value;



{%- assign projects = site.data.project_database.projects | values | sort: 'postdate' | reverse -%}

var id = 0;
{%- for project in projects -%}
  var show_item = 'unset';
  var projectDiv = document.getElementById(++id);

  {%- for item_hash in site.data.project_database.project_metadata -%}
    {%- assign item_id = "option_" | append: item_hash[0] -%}
    var list_item = "{{ item_id }}";
    var item_name = "{{ item_hash[0] }}";
    {%- assign item_hash_0 = item_hash[0] -%}
    var list = document.getElementById(list_item);
    var selectedCategory = list.options[list.selectedIndex].text;
    {%- if project[item_hash_0] -%}
       var cats = {{ project[item_hash_0] | jsonify }};
       if ( !( selectedCategory =='--'+item_name+'--' || cats.includes("Any") || cats.includes(selectedCategory) ) ) {
         show_item = 'none';
       }
  {%- else -%}
       if ( !( selectedCategory =='--'+item_name+'--' ) ) {
         show_item = 'none';
       }
  {%- endif -%}
  {%- endfor -%}

  if ( (show_item == 'unset') && (search_box_text.length > 0)  ) {
     var project_description = {{project["description"]  | jsonify }};
     var project_short = {{project["shortdescription"] | jsonify }};
     var project_name = {{project["name"] | jsonify }};
     var project_search = project_description+' '+project_short+' '+project_name;
     if ( !(project_search.toLowerCase().includes(search_box_text.toLowerCase()) ) ) {
       show_item = 'none';
     }
  }

  projectDiv.style.display = show_item;
{%- endfor -%}

}
</script>

## Project selection menus
<br>

{%- for item_hash in site.data.project_database.project_metadata -%}
{%- assign categories = item_hash[1] | sort -%}
{%- assign item_id = "option_" | append: item_hash[0] -%}
<select id = {{item_id}} onchange = "dropdownMenu2()" >
{%- if page.pulldown_defaults and page.pulldown_defaults contains item_hash[0] -%}
{%- for iter in page.pulldown_defaults -%}
{%- if item_hash[0] == iter[0] -%}
{%- assign default_val = iter[1] -%}
{%- endif -%}
{%- endfor -%}
<option> {{default_val}} </option>
<option> --{{item_hash[0]}}-- </option>
{%- else -%}
<option> --{{item_hash[0]}}-- </option>
{%- endif -%}
{%- for category in categories -%}
{%- assign cat = category  -%}
{%- if page.pulldown_defaults and page.pulldown_defaults contains item_hash[0] and default_val == cat -%}
{%- assign dummy = "do nothing" -%}
{%- else -%}
<option> {{cat}} </option>
{%- endif -%}
{%- endfor -%}
</select>
{%- endfor -%}

<br>
<form name="searchprojectsform" onsubmit="dropdownMenu2();return false">
  Text search: <input type="text" name="name" id="searchprojects"/>
  <input type="submit">
</form>

<br>

## Selected projects

{% assign id = 0 %}
{%- assign projects = site.data.project_database.projects | values | sort: 'postdate' | reverse -%}

{% for project in projects %}

  {%- assign namesArr = '' -%}
  {%- assign emailsArr = '' -%}
  {%- for contact in project.contacts -%}
    {%- assign namesArr = namesArr | append: contact.name %}
    {%- assign emailsArr = emailsArr | append: contact.email %}
    {%- if forloop.last == false -%}
       {% assign namesArr = namesArr | append: "," -%}
       {% assign emailsArr = emailsArr | append: "," -%}
    {%- endif -%}
  {%- endfor -%}

  {%- assign menteeInfo = '' -%}
  {%- for contact in project.mentees -%}
    {%- if forloop.first == true -%}
       {%- if forloop.last == true -%}
          {% assign menteeInfo = menteeInfo | append: 'Mentee: ' -%}
       {%- else -%}	  
          {% assign menteeInfo = menteeInfo | append: 'Mentees: ' -%}
       {%- endif -%}
    {%- endif -%}
    {%- assign menteeInfo = menteeInfo | append: '<a href="' -%}
    {%- assign menteeInfo = menteeInfo | append: contact.link -%}
    {%- assign menteeInfo = menteeInfo | append: '">' -%}
    {%- assign menteeInfo = menteeInfo | append: contact.name -%}
    {%- assign menteeInfo = menteeInfo | append: '</a>' -%}
    {%- if forloop.last == false -%}
       {% assign menteeInfo = menteeInfo | append: ',' -%}
    {%- else -%}
       {% assign menteeInfo = menteeInfo | append: '.' -%}
    {%- endif -%}
  {%- endfor -%}

  {% assign id = id | plus:1 %}
  <div style="margin-bottom:4px;" id="{{id}}">
   {% assign details = project.description %}
   {%- capture summary -%}{{project.name }}: {{project.shortdescription}}. {{menteeInfo}} <a href="mailto:{{emailsArr}}">Email the mentors ({{namesArr}})</a>{%- endcapture -%}
   {%- include details.html -%}
  </div>
{% endfor %}





