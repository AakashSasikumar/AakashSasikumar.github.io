---
name: StockMate
tools: [Python, AI, Neural Networks, Reinforcement Learning, Stock Trading, Automated Trading]
image: images/projects/stockmate/feature.png
description: An application that makes training stock price predictors and trading agents easy.
weight: 1
date_range: June 2020 -
---

# StockMate

{% include elements/figure.html image="images/projects/stockmate/title.png" caption="An Agent's Decision" width="100%" height="100%"%}

When I first started getting into the world of trading stocks, I always wondered why AI wasn't used in this field. Turns out, I wasn't the first person to come up with this idea. The finance industry has secretly been advancing the field of AI under the radar and using it for its personal gains. In the US stock market alone, more than 50% of trades are done algorithmically. I wanted to change all the secrecy and was determined to change the esoteric nature of algorithmic trading. I set out to make an application that was easy to use and would help anyone start off algorithmic trading; This project is a result of that vision.

This project has two of key components,

### Forecasters

Forecasters are basically regression based stock price predictors. I have built a framework around making forecasters so training, saving, and loading can all be done in a few lines of code. You can see an example of forecasters below.

{% include elements/figure.html image="images/projects/stockmate/prediction.png" caption="A Forecaster" width="75%" height="75%"%}

### Agents

Agents are reinforcement learning based models that decide what action to take (buy, sell, hold, short...) based on the current or past trend of prices. Similar to forecasters, I've built a framework for agents that makes creating and using agents only a couple of lines of code. How will agents trade for you, you might ask? Well, I've have created a chatbot that pairs with agents that messages you any decisions agents might make. You even have the freedom to pick and choose which agent you want to be able to send messages to you.

{% include elements/figure.html image="images/projects/stockmate/BotAgentAction.png" caption="The Chatbot" width="75%" height="75%"%}

This page doesn't even scratch the surface of all the features this project has. Please check out the github page, and try it out yourself.

{% include elements/button.html link="https://github.com/AakashSasikumar/StockMate" text="View On Github" block=true %}