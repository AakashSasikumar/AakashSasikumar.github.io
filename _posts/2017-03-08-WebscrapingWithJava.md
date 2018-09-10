---
layout: page
title:  "Web Scraping with Java"
date:   2017-03-08
displayDate: March 8, 2017
categories: [java, web-scraping]
tags: [coding, Eclipse, Intellij-Idea, Java, jdk, jre, Oracle, scraping]
featuredImage: webscraping-with-java.png
---
In this blog I will explain the basics of webscraping and the best tools you can use.

## What is Web Scraping?

Everyday a lot of time is wasted when you visit the same website again and again for getting information. What if you could write a few lines of code and get all the information you need delivered to you instantly? Web scraping paves the way for a person to get what they want, when they want, from any website.

There are a lot of ways you can scrape the web; I prefer to do it with Java because, well, it’s the best language out there, period. Jokes aside, it has lots of amazing libraries out there which makes it easy to scrape with.

## Requirements

- The latest version of [Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
- [ui4j](https://mvnrepository.com/artifact/com.ui4j/ui4j-ide/1.1.0)
- [jsoup](https://jsoup.org/download)
- An IDE (Eclipse/IntelliJ/NetBeans)

## What you need to know

You need to know the basics of Java, as well as a bit of HTML. On the Java side, you need to be familiar with the common functions, the architecture of a class etc. In HTML, you need to know what type of tags there are, what attributes are etc.

## Jsoup

Jsoup is one of the go-to libraries when it comes to parsing HTML, it’s easy to use, flexible, and it has a lot of tricks up its sleeves.

I’ll be going into the basics of using Jsoup, like getting the HTML content of a website, getting an element by its ID, etc. This should give you a good idea of using Jsoup efficiently.

Before getting started, you should add the Jsoup jar file to the build path. Use google if you aren't sure how to do that.

### 1. Getting the html content of a website

```java
Document doc = Jsoup.connect("http://www.google.com/").get();
System.out.println(doc);
```

Document is a class that stores the entire html of the website and allows you to access specific things inside of it efficiently.

### 2. Selecting specific parts from the HTML

```java
Document doc =  Jsoup.connect("http://www.google.com/").get();
Elements links = doc.select("a[href]");
for(Element link:links){
    System.out.println(link.attr("href"));
}
```

This code will load google, and it will print out all the a tags that have an href attribute. Elements is a class which stores all the DOM elements we select from the Document class' object. If we had written Element instead of Elements, it would have only found the first matching tag and stored it; It’s important to keep in mind this difference. Here, `attr()` is a method used to get the specified attribute of the element we are looping over.

The `select()` method is very versatile, there are a lot of other ways to select the element we want. Here are a few other ways we can do so.

- `tagname`: you can just give the tag name inside the quotes to find all the elements with that particular tag
- `.class`: you can give the class name as a means of identifying the element, i.e a.someclassname
- `#id`: the id name can be specified too, it will find all the elements that have the same id
- `[attr=value]`: it is possible to specify the attribute and its value
- `tag#id`: we can combine a specific tag and an id
- `tag.class`: similarly, we can combine a class with tags
- `parent > child`: when this is used, the child that is directly descended from the parent is selected, i.e div.someclass > p. This finds the first p tag that's the child of a div tag having class `someclass`
- There are a lot of other ways too, [read this page](https://jsoup.org/cookbook/extracting-data/selector-syntax), to learn more about it.

### 3. Extracting information from the elements

```java
Document doc =  Jsoup.connect("http://www.google.com/").get();
Elements links = doc.select("a[href]");
for(Element link:links){
    System.out.println(link.text());//prints the text inside the element
    System.out.println(link.outerHtml());//prints the entire HTML of the element
                                         //including it's children
    System.out.println(link.html());//prints the inner HTML of the element
}
```

Here, we use some of the methods that help us getting information like the text within a tag, outer and inner HTML.
You can get other information like the id name, class name, tagname etc. These were just a few examples of stuff you can extract.

This should be enough to get you started with Jsoup. The topics mentioned above barely scratch the surface of the things Jsoup can do. If you are interested in the other features that Jsoup provides, you can take a look at its [documentation](https://jsoup.org/apidocs/).

## Ui4j

Now let’s take a look at one of my favorite scraping libraries. Ui4j is a library built on the JavaFX WebKit Engine. It may not be as light weight as Jsoup that is because it is basically a browser. We can use this to automate navigating of web pages, meaning, we can simulate clicks, fill forms and a lot more.

Similar to Jsoup, you have to add the jar file to the build path before coding.

### 1. Getting the HTML

```java
BrowserEngine browser = BrowserFactory.getWebKit();
Page page = browser.navigate("https://www.google.com");
Document doc = page.getDocument();
System.out.println(doc.getBody());
```

The above code will fire up a browser, load up google, store the contents of it in a Document object and displays it. The BrowswerEngine is a class where the instance of a browser is stored, it can be used to navigate to multiple pages and store them in the Page class. Now, we use the Document object to parse the HTML content.

### 2. Parsing the HTML

```java
BrowserEngine browser = BrowserFactory.getWebKit();
Page page = browser.navigate("https://www.google.com");
Document doc = page.getDocument();
List<Element> aTagLinks = doc.queryAll("a[href]");
for(Element elm : aTagLinks){
    System.out.println(elm.getOuterHTML());
}
```

The above program will query the HTML file for all the `a` tags with `href` attributes and prints it. Ui4j doesn’t have a class that stores multiple elements, so we have to use a list instead.

There are a lot of other ways you can use the `queryAll()` method to parse the HTML, most of the ways are similar to how `select()` in Jsoup works. There are two methods, `query()` and `queryAll()`; `query()` just finds the first matching case, where `queryAll()` finds all the matching cases.

### 3. Automating

I’ll show you how to use this library to automate web pages. I’ll be loading google, and setting a string in the search bar, and load the result.

```java
BrowserEngine browser = BrowserFactory.getWebKit();
PageConfiguration config = new PageConfiguration();
config.setUserAgent("Mozilla/5.0 (Windows NT 10.0;Win64;x64)AppleWebKit/537.36(KHTML, like Gecko)Chrome/56.0.2924.87Safari/537.36");
Page page = browser.navigate("https://www.google.com", config );
Document doc = page.getDocument();
doc.query("input[name='q']").get().setValue("ui4j").focus();
Robot rob = new Robot();
rob.keyPress(KeyEvent.VK_ENTER);
```

Google is pretty smart when it comes to preventing bots. So, I had to add a few extra lines of code to trick it into thinking that our program was an actual browser. I took advantage of Ui4j’s PageConfiguration to set the user agent of our browser to mimic a Chrome Browser running on Windows 10. Now when we navigate to the page using this configuration, it makes it easy for us to scrape because Google can't distinguish us between a bot and a real browser. I query for an `input` tag with the value `q` and I set its value as  "ui4j". This is basically the same thing as typing "ui4j" into the search bar. Now, since there isn’t a button to simulate a click, we have to use Java’s Robot class, to simulate pressing the enter key. When all this is done in succession, the url of `page` would have changed to the new one, containing the results of searching "ui4j"

If you are interested in the different user agents out there, take a look at [this](https://techblog.willshouse.com/2012/01/03/most-common-user-agents/)

### 4. Some other cool stuff

Two things that Ui4j can do that really impressed me were its ability to display currently being scraped and its support for executing custom user defined JavaScript. When you create a Page instance, use the `show()` method; This will open up a headless browser and you can see if you are on the right track, in terms of form filling etc.Also, we can type custom JavaScript and do things faster, without needing to code much with Java. For example, instead of using the `setValue()` method to enter the value into the search bar, we could have executed a simple JavaScript code that does that. We can execute scripts by running the `executeScript()` method from an object of the `Page` class.

There are a lot more examples given in the GitHub page of Ui4j, go [here](https://github.com/ui4j/ui4j/tree/master/ui4j-sample/src/main/java/com/ui4j/sample), if you want to take a look at them.

## Summing it up

In this blog, we saw what web scraping is, some of the common libraries used for web scraping in Java, and how to use them. We looked at the functionalities of both Jsoup and Ui4j.

I have worked on a few projects related to web scraping, one of which is downloading songs from YouTube (yes it is technically illegal). Check them out on my [GitHub page](https://github.com/AakashSasikumar).