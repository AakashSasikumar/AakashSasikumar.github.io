---
name: AnokhaBot
tools: [Python, NLP, AI, Neural Networks, Chatbot]
image: images/projects/anokhabot/anokhabot2.png
description: A chatbot that I designed for our college's tech fest, Anokha 2018
weight: 5
date_range: Sept 2017 - Feb 2018
---

# AnokhaBot

## What is it?

Anokha is the annual TechFest of Amrita University. Each year all the departments participate by hosting events, games, seminars, hackathons, competitions, workshops, and a lot more. It is a three day festival where people within and from other universities participate to win prizes.

A significant obstacle is to keep track of all the events that happen over the course of three days, where you have to go to register for such events, and to get any updates for events if any changes were made.

For Anokha 2018, I was put in-charge to develop a chatbot that could give information about the festival, event timings, contact information, etc. The open source AnokhaBot API was developed and deployed on the official Anokha 2018 website as well as a chatbot on Telegram. This chatbot was used by a large number of people and the feedback was very positive.

## Implementation

This chatbot was built using a simple sentence classification architecture where the user's sentence would be classified into a set of pre-defined classes and an answer from the list of possible replies for that class would be randomly chosen.

Another cool feature for this chatbot is contextualization. An elementary form of contextualization has been built into the bot where it remembers what subject is being talked about. Here is an example of contextualization...

{% include elements/figure.html image="images/projects/anokhabot/anokhabot1.png" caption="Specific details and contextualization" width="50%" height="50%"%}

This chatbot also comes with an admin interface, where specific people could update information that the chatbot replied with, such as phone numbers, persons of contact, etc. The admin could even add some training data by typing it in and remotely trigger a training job, and update the bot's model.

Here are a few examples,

## Tools Used

1. Python 3
2. TensorFlow
3. nltk
4. tflearn

## Some Other Examples

{% include elements/figure.html image="images/projects/anokhabot/anokhabot3.png" caption="First interaction" width="50%" height="50%"%}

{% include elements/figure.html image="images/projects/anokhabot/anokhabot2.png" caption="A little bit of sass" width="50%" height="50%"%}

{% include elements/button.html link="https://github.com/AakashSasikumar/AnokhaBot" text="View in GitHub" block="true"%}
