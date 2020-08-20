---
layout: page
title: About
permalink: /about/
weight: 1
---

# **About Me**

<!-- Hi I am **{{ site.author.name }}** :wave:,<br> -->

First of all, you might ask why this website is called **GSAK**. Those letters are the initials of my awkwardly long name **G**uruvayoor **S**asikumar **A**akash **K**rishna.

I am a 23 year old Computer Science undergrad from Coimbatore, India. I have traveled to a lot of places , done my schooling from 9 schools across the world and what I have procured from it, is my passion for coding. It all started when I got my first laptop at the age of nine and made my first website when I was 11 years old. What inspired me the most at the first place is the potential computer science has. To appease my curiosity, I strive to know how things work; I am determined to innovate in this field.

{% include elements/button.html link="/documents/FormalResume/aakashResume.pdf" text="Download my Resume" style="outline-dark" size="lg" %}
<!-- {% include elements/button.html link="/documents/resume.pdf" text="Download my Fun Resume" style="primary" size="lg" %} -->

<div class="row">
{% include about/skills.html title="Skills" source=site.data.programming-skills %}
{% include about/skills.html title="hidden" source=site.data.other-skills %}
</div>

## Work Experience

<div class="row">
{% include about/workExperience.html %}
</div>

## Education

<div class="row">
{% include about/education.html %}
</div>
