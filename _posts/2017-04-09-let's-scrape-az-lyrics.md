---
title: Let's Scrape AZ Lyrics!
tags: [Java, Web Scraping, Tutorial]
style: fill
color: light
description: In this blog post I will show you how to scrape AZLyrics to get the lyrics of any song you want instantly.
---

![AZLyrics]({{site.baseurl}}/images/azlyrics/feature.jpg)

## What's This all About?

I am going to show you how to create a small java program that allows the you to enter the name of a song you want to find the lyrics of. After it’s been entered, you will be presented with a few option from which he can choose from. Then the (unformatted) lyrics will be printed on the screen; you can choose to save it to a file if you wish. We will be scraping AZLyrics to get the lyrics because it’s one of the best and most reliable lyrics websites out there.

## Before we get Started

If you’re unfamiliar with web scraping, I’d recommend you to go read my [post]({{ site.baseurl }}{% post_url 2017-03-08-webscraping-with-java %}) which covers basics, using two of the best scraping libraries (ui4j and jsoup).

Owing to the facts that ui4j should only be used when a website is very tough to scrape and that jsoup is faster than ui4j, I’m going to scrape AZLyrics with Jsoup.

## Let's Begin

First off, we need to figure out what the URL we are going to scrape is going to be. Usually, websites that allow you to search will have a common prefix like `“http://www.youtube.com/results?search_query= ”` or something along those lines. Luckily, AZLyrics happens to have the same format `“search.azlyrics.com/search.php?q=”`. So, with this URL prefix, we can just plug in the user query (song name) at the end of the URL and voila, the required URL is ready.

### 1. Getting the required URL

```java
System.out.println("Song?");
Scanner in = new Scanner(System.in);
String song = in.nextLine();
song = song.replaceAll(" ", "+");
String initialurl = "http://search.azlyrics.com/search.php?q="+song;
Document site = Jsoup.connect(initialurl).get();
```

First, we get the input from the user and replace all the spaces with ‘%20’, because we need to convert the string to the UTF-8 format. After that, we get the HTML content of the website by using Jsoup.connect().

### 2. Scraping the names and URLS

If you take a look at the HTML, you can see that the links, as well as the song names, are under the tr tag which comes under the table tag. The table tag comes under the div tag which has the class name “panel”.

```java
Document site = Jsoup.connect(initialurl).get();
Elements lyricsTable = site.select("div.panel");
ArrayList<String> songNames = new ArrayList<>();
ArrayList<String> urls = new ArrayList<>();
for (Element elm : lyricsTable){
    if (elm.text().contains("Album")) {
        continue;
    }
    //System.out.println(elm);
    Elements table = elm.select("table > tbody > tr");
    for (Element elms : table) {
        if (elms.text().contains("More Song Results")) {
            continue;
        }
        elms.select("small").html("");
        songNames.add(elms.text());
        urls.add(elms.select("a").attr("href"));
    }
}
for (int j = 0; j < urls.size(); j++) {
    System.out.println(songNames.get(j));
}
System.out.println("Enter your option");
int choice = in.nextInt();
choice--;
Document lyricPage = Jsoup.connect(urls.get(choice)).get();
```

The code above selects the div tag with the “panel” class and iterates through all the elements, skipping the album results and selecting only the ones relevant to songs. In the inner loop, we select the containing the link as well as the name and store them in their respective ArrayLists. After that, we print them out to present to the user to choose from. We take the URL chosen by the user and parse its HTML.

### 3. Getting the Lyrics

In this new page, we will have to ignore a few div tags that contain unnecessary information. I had to include a huge if() statement to make it exclude the ones I didn’t want.

```java
Elements lyricTags = lyricPage.select("div[class='col-xs-12 col-lg-8 text-center']>div");
String lyrics = new String();
for (Element elm : lyricTags) {
    if(elm.attr("class").equals("div-share noprint")||elm.attr("class").equals("collapse noprint")||elm.attr("class").equals("panel album-panel noprint")||elm.attr("class").equals("noprint")||elm.attr("class").equals("smt")||elm.attr("class").equals("hidden")||elm.attr("class").equals("smt noprint")||elm.attr("class").equals("div-share")||elm.attr("class").equals("lyricsh")||elm.attr("class").equals("ringtone")) {
        continue;
    }
    lyrics = elm.text();
    break;
    //System.out.println(elm.text());
}
System.out.println(lyrics);
```

After selecting the div tag containing the lyrics, we iterate through all the elements inside it, skipping the ones we don’t need, and adding only the lyrics.

Although the lyrics aren’t formatted (proper tabs etc. ) we finally got the lyrics in the “lyrics” object.

## The Final Product

![Final Product]({{site.baseurl}}/images/azlyrics/output.png)

Yes, it does look very primitive, but it is very versatile, capable of getting the lyrics of any song. All thanks to AZLyrics.

This was just one of the numerous things you can do with webscraping. Take a look over [here](https://github.com/AakashSasikumar/Blog/tree/master/webscraping/AZLyrics) to look at the full source code.