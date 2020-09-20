---
name: mAIncraft
tools: [Python, AI, Neural Networks, Computer Vision]
image:
description: An ANN based agent I made to play Minecraft on its own
weight: 6
date_range: Oct 2017 - Dec 2017
---

# mAIncraft

mAIncraft is a CNN based agent that can play minecraft on its own. As of now, this agent knows only how to navigate a map without hitting obstacles. I plan on enhancing this agent by adding features such as chopping wood, combat, etc.

This agent was trained on saved gameplay of me playing and avoiding obstacles. The data records what keys I tend to press given the screen. This is converted into a basic classification algorithm where the model tries to classify the current environment to a key press.

The agent can be enhanced to support additional tasks by converting this into a reinforcement learning based system. A different RL system for different tasks, and a central logic system that decides which sub-system to use can be employed to make a fully-fledged Minecraft agent.

### Sample Gameplay

The movement of the bot was done autonomously, no human intervention was there.

![game-gif]({{site.baseurl}}/images/projects/maincraft/gameplay.gif)

{% include elements/button.html link="https://github.com/AakashSasikumar/mAInstein" text="View On Github" block=true %}