---
name: AInstein
tools: [Python, NLP, AI, Neural Networks, Chatbot]
image: images/projects/ainstein/voiceDemo.png
description: A chatbot made for universities. Find out about faculty research interests, department details and much more with this chatbot.
weight: 4
date_range: Aug 2018 - Jan 2019
---

# AInstein

## What is it?

Most of the time, when people enter college, they are overwhelmed by the number of things that are available to them. One of the most important things to do in college is to figure out what interests you the most and seek out others that share the same interests. One major issue for people entering university is the gap between the professors and the teachers. Information about the professor's research interest, courses they take, the projects they have done, their publications, etc., may not be readily available to students.

Motivated by the pervasiveness of virtual assistants like Google Assistant, Siri and Alexa, we set out to create a virtual assistant that caters specifically for university students. Using this virtual assistant, people can ask about practically anything, similar to contemporaries, but with the added advantage of having information about the university, such as the faculty and their research interests.

You can ask questions to AInstein about faculty, their contact details, and even ask general questions. Using NLP and Artificial Neural Networks, we managed to make AInstein an all purpose assistant like Siri or Google Assistant.

## Implementation

The virtual assistant has the following features,

1. General question answering capability
2. Replying with information about the university and faculty
3. Voice to text and text to voice for better interaction

This chatbot was designed as a simple sentence classifier. Similar to another project I had worked on, the AnokhaBot, this bot would classify user input and reply with semi-predefined answers. This bot however has additional features such as intent recognition, identifying keywords, subjects, etc., in the sentence so as to form an appropriate reply. This assistant also had a speech to text and text to speech modules where the user could interact with the bot through voice alone. When asked general questions or questions for which the assistant does not have knowledge about, it will use the internet to form appropriate replies. Since websites tend to have very long answers, this bot uses text summarization to shorten the answer to a desirable length before replying.

The assistant was built with the idea of being able to add additional features/skills at any later point. A new skill, such as saving notes, reminders, etc., could easily be added by the API we had made.

Multiple types of classifiers with different forms of word embeddings were built into the system. The best performing model was a custom Word2Vec embedding and a CNN based classifier.

The assistant was built into a REST API and deployed as a Telegram Chatbot.

## Tools Used

1. Python3
2. TensorFlow
3. tflearn
4. nltk

## Demo

{% include elements/figure.html image="images/projects/ainstein/generalQuestions.png" caption="Faculty Details. Note that there is contextualization as well" width="50%" height="50%"%}

{% include elements/figure.html image="images/projects/ainstein/voiceDemo.png" caption="Replies when asked 'who are you?' and 'Who is Narendra Modi?'" width="50%" height="50%"%}

{% include elements/figure.html image="images/projects/ainstein/universityQuestions.png" caption="General QA capability" width="25%" height="25%"%}

## Future Work

We had planned to incorporate additional features such as students being able to subscribe to professors they are working under to keep themselves updated with their latest work. The professor could also send notifications to all the students subscribed to him with regards to open positions, vacant spots in classes etc. These features however, could not be implemented due to a lack of time.

{% include elements/button.html link="https://github.com/AakashSasikumar/AInstein" text="View in Github" block=true %}
