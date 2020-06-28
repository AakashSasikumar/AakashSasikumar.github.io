---
title: Building A Chatbot For Dummies
tags: [Java, Chatbot, Tutorial]
style: fill
color: light
description: I will teach you the basics of making an Echo Bot using the famous Telegram Bot API in Java.
---

![BuildingChatbot]({{site.baseurl}}/images/building-chatbot/feature.jpg)

## What's a Chatbot?

What if you could text a robot like you do with your friends and have it text back just like a human? This is basically what a Chatbot is. A chatbot is an artificial entity that you can interact with however you see fit. It can be programmed to do things such as giving you weather updates all the way to behaving like a fake girlfriend/boyfriend. Chatbots are the future when it comes to customer service; people are already using artificial intelligence and learning algorithms to satisfy a customer’s needs.

## What I'll Be Covering

Chatbots are pretty common these days, there are a lot of APIs out there for people to test out and use. Some of the famous ones are the [Telegram Bot API](https://core.telegram.org/), [Facebook Messenger API](https://developers.facebook.com/docs/messenger-platform/guides/) etc. I will be going over the Telegram Bot API briefly and get into the coding part where I’ll teach you how to make a simple chatbot and deploy it.

## Before we Start Coding

To be honest, we can actually control the TBA (Telegram Bot API) with a browser alone. This is because TBA works using HTTP GET and POST requests.

#### How to set it Up

Download Telegram and start a conversation with BotFather.

![BotFather]({{site.baseurl}}/images/building-chatbot/thebotfather.png)

With the help of the Botfather, you can register your chatbot with the telegram servers. A token number (don’t lose it) will be given and we will have to use it pretty much everywhere.

#### Testing it out

Go to this website.  https://api.telegram.org/bottoken/getme. Replace the `token` with your unique token.

It should look something like this
`https://api.telegram.org/bot123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11/getMe`

This will show you all the information about your bot in the form of a JSON. Next, send a message to your bot and go to this URL https://api.telegram.org/bottoken/getUpdates. This will give a JSON response which has all the messages that have been received by the bot.

If we go to this URL [https://api.telegram.org/bottoken/sendMessage?chat_id=&text=TestReply](!), the bot will send you a message.

From this, we can understand that to control the bot by accessing the https://api.telegram.org/bot we can control the chatbot. Basically, we need to write code that handles HTTP request, and we need a JSON parser from which we retrieve data and act upon it.

## Coding

Well, now that we know the basics of the Telegram API let’s get down to the coding part.

#### What do we need?

- [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
- [TelegramBots](https://github.com/rubenlagus/TelegramBots/releases) by Ruben Bermudez

TelegramBots is an amazing library that makes it very simple to work with the TBA.

#### 1. Setting it up

After adding the TelegramBots.jar file to out project path, we need to create two classes. Let’s name them Main, and Bot.

**Bot.java**
```java
class Bot extends TelegramLongPollingBot {
@Override
    public void onUpdateReceived(Update update) {
        //This is where all the code goes
    }
    @Override
    public String getBotUsername() {
        return "Your Bot's Username";
    }
    @Override
    public String getBotToken() {
        return "Your Bot's Token";
    }
}
```

**Main.java**
```java
class Main {
    static {
        ApiContextInitializer.init();
    }
    public static void main(String[] args) {
        TelegramBotsApi myBot = new TelegramBotsApi();
        try {
            myBot.registerBot(new Bot());
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }
}
```

Now that we’re done setting up the basic things, we can start defining out bot.

#### 2. Definition

All the code shown below will be inside the onUpdateReceived() method. Whenever an event or update happens to our bot, this method will be invoked.

```java
if (update.hasMessage() && update.getMessage().hasText()) {
    SendMessage message = new SendMessage().setChatId(update.getMessage().getChatId()).setText(update.getMessage().getText());
    try {
        sendMessage(message);
    } catch (TelegramApiException e) {
        e.printStackTrace();
    }
}
```

The Update class has all the information regarding the update that the bot received. We are mainly concerned with getChatId() and getMessage(). A chat ID is a unique ID given to each person chatting with the bot and is used to reply to the correct person. Just like SendMessage, there are other classes like SendAudio, SendVideo etc to specify the type of data we are going to transmit.

#### 3. Running the code

After running it, there won’t be anything displayed on the console. Open up telegram and send a message to your bot. If it replies back successfully, that’s it, you’ve made your first chatbot or an Echobot to be precise.

![Output]({{site.baseurl}}/images/building-chatbot/chatbotsForDummiesOutput.png)

## Final Words

This tutorial barely scratched the surface of what a chatbot can do. You can maybe try and build on this chatbot my making a lyric chatbot, by incorporating my previous AZ lyrics tutorial and this one. Some of the chatbots I’ve made are the song downloading chatbot (will upload on GitHub soon) and a chatbot that replies based on what you wrote or commonly called as a contextual chatbot(will upload on GitHub soon). I hope this gave you enough information to help you on your path of making awesome chatbots.
