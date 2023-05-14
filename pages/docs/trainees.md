---
permalink: /docs/trainees.html
layout: default
title: Information to add or update trainees/fellows
pagetype: doc
---

### Adding a page about yourself to our website

In order to add your information, we request you to please supply a photo ( First_Name-Last_Name.jpg or .png - 320x240 pixels) and a paragraph summarizing your project’s goals.

You should submit a pull request with the photo, a markdown file with the summary information above, and your proposal to this repo:

<https://github.com/research-software-collaborations/research-software-collaborations.github.io>


* Add a photo named `First-Last.jpg` or `.png` to the [assets/images/team folder](https://github.com/research-software-collaborations/research-software-collaborations.github.io/tree/master/assets/images/team). It should be 320x240 pixels and in general should be 150kB or less.
* Uploaded a short description of your project. This might be the proposal generated for your project to [assets/pdf/trainees folder](https://github.com/research-software-collaborations/research-software-collaborations.github.io/tree/master/assets/pdf/trainees). Remember the exact filename as you will need that below.
* Add a "`<your github username>.md`" file to the [trainees folder in the website repository](https://github.com/research-software-collaborations/research-software-collaborations.github.io/tree/master/pages/trainees). To do this, start from the template file found [here](https://github.com/research-software-collaborations/research-software-collaborations.github.io/blob/master/pages/trainees/template.md.txt)

*Please Note*:  In the markdown file you create, ensure you set the “active” attribute to true – (i.e.  active: true).  Otherwise, your entry will not appear on our page.

Be sure to include your project summary in the project_goal field.

You can leave the “presentations” and “current_status” fields blank for now.  (Make sure to include the fields)

### Dates
Date format for start and end dates should be -- YYYY-MM-DD -- i.e. 2021-12-31

### Presentations

Add any related presentation to your profile. The meaning of the fields is the following:
  * title - the title of the talk: you made need to place it in double quotes, if certain characters like a colon (":") are included in the title
  * date - the date on which the presentation was made, in the numeric format "YYYY-MM-DD"
  * url - this should be a direct URL to the presentation or page containing the presentation. For Indico, link to the contribution, not the PDF or other links.
  * meeting - the name of the meeting
  * meetingurl - the URL for the meeting in which the presentation was made
