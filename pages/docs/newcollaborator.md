---
permalink: /docs/newteammember.html
layout: default
title: Information for new HSF-India collaborators
pagetype: doc
---

### Things new HSF-India collaborators should do

New HSF-India collaborators need to do some number of things to get connected.
This webpage documents the things that need to be done. If you find there 
are steps not mentioned here, or missing/unclear information, 
please [contribute an improvement][]!

#### HSF-India website

* Request membership in the [research software collaborations GitHub organization](https://github.com/research-software-collaborations/research-software-collaborations.github.io).
* Add a photo named `First-Last.jpg` or `.png` to the [assets/images/team folder][]. It should be 320x240 pixels and in general should be less than 100kB. 
* Add a "`<your github username>.yml`" file to the [_collaborators folder in the website repository][_collaborators]. Here is an example:

```yml
active: true
focus-area:
- <primary focus area(s), a list>
institution: <Your University>
name: <Your name>
photo: /assets/images/team/<First name>-<Last name>.jpg
shortname: <Your GitHub user ID>
title: <Can be blank - will show a title under your picture>
website: <Optional, your website>
presentations:
  - title: How to make green eggs and ham
    date: 2018-09-10
    url: https://indico.cern.ch/event/697389/contributions/3062046/attachments/1712602/2761531/ROOT2018-Union.pdf
    meeting: ROOT 2018 Users Workshop
    meetingurl: https://cern.ch/root2018
    project: greeneggs
    focus-area: as
    location: Virtual
```

* Add your GitHub username to the proper [university file][]. Note that you will *not* show up in the full team page if you are not in a university file!

<!--
#### Communication

* Have an existing team member add your email address to the [IRIS-HEP Slack][] team.
* Subscribe to the relevant [Google mailing lists][], at the very least "IRIS-HEP Full Team" and "IRIS-HEP Announcements".

[contribute an improvement]:    https://github.com/iris-hep/iris-hep.github.io/pulls
[IRIS-HEP GitHub organization]: https://github.com/iris-hep
[assets/images/team folder]:    https://github.com/iris-hep/iris-hep.github.io/tree/master/assets/images/team
[people]:                       https://github.com/iris-hep/iris-hep.github.io/tree/master/_data/people
[university file]:              https://github.com/iris-hep/iris-hep.github.io/tree/master/_data/universities
[IRIS-HEP Slack]:               https://iris-hep.slack.com
[Google mailing lists]:         https://groups.google.com/a/iris-hep.org

-->

#### Presentations

There is a section for presentations in the file you created above. We would
like to keep track of the presentations made by IRIS-HEP team members, with
the following criteria:

  * Only presentations related to HSF-India itself should be included.
  * Any presentation in a "public" meeting should be included. This includes
    presentations made in experiment meetings, even if they are protected such
    that the presentation and meeting links are not world visible.
  * Presentations in the HSF-India topical meetings should be included.
  * Minor presentations in internal "working" meetings of HSF-India do not
    need to be added.
  * Presentations, lectures, etc. as part of training events should be included.
  * Posters at workshops and conferences can also be included. You can add "(poster)" at the end of the title. Include a link to a pdf of the poster.

The meaning of the fields is the following:

  * title - the title of the talk: you made need to place it in double quotes if certain characters like a colon space ": " are included in the title.
  * date - the date on which the presentation was made, in the numeric format "YYYY-MM-DD".
  * url - this should be a direct URL to the presentation or page containing the presentation. For Indico, link to the contribution, not the PDF or other links.
  * meeting - the name of the meeting.
  * meetingurl - the URL for the meeting in which the presentation was made.
  * location - optionally list the location of a meeting if it was a workshop or dedicated gathering. Meetings that are mostly in Vidyo can use "Virtual".
  * focus-area - optionally list the relevant focus area for this presentation, using its short name, i.e. one of [ia,ssl,ssc,doma,as,osglhc,blueprint,core]. Can be a list, leave blank if none.
  * project - optionally list the relevant project for this presentation, using its short name, i.e. those found in the [pages/projects/](https://github.com/iris-hep/iris-hep.github.io/tree/master/pages/projects) area. Can be a list, leave blank if none.
