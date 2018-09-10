---
layout: page
title:  "Building a Neural Network Library From Scratch with Python"
date:   2018-07-25
displayDate: July 25, 2018
categories: [personal, experience, internship]
tags: [ personal, experience, internship, research, thermo fisher, AI, machine learning]
featuredImage: neuralnetwork.png
---

This post will teach you how to make a simple and efficient neural network library from scratch.

## Why?

This blog post is intended to act as an introduction to my next blog post which covers neuroevolution. The reasons why I made a neural network library from scratch was that I found it difficult to extract the weights of each neuron after training in TensorFlow and that I didn’t really need a complex library, I just needed a simple neural network that can take an input and provide an output, heck, I didn’t even need backpropagation.

## What Kind of Neural Network is it?

The image above is exactly what I’m going to be building, a three-layer, fully connected neural network with one input layer, one hidden layer, and one output layer. I offer flexibility in the number of neurons in each layer, and you can extract the weights of each neuron and modify it however you wish to do so.

## How Does a Neural Netowrk Work?

Let’s us consider the linear equation

`Y = mX+ b`

`X` is the input for the equation, `m` is the weight, and `b` is the bias. Each neuron in a simple neural network does this exact thing. Takes the input that is given, multiplies it with a weight and adds a bias. Now when it comes to neural networks, a neuron can have more than one input(like the image above) and so each input connection will it’s own input weight which is used to multiply the value coming from that connection. All these multiplied values from each connection are then added up and the bias is added. This value goes through an activation function and is given as an output.

Activation functions come in different varieties but they all essentially have the same purpose. Let us consider that a movie is rated 70/100. We, humans, know that it is essentially the same thing as 7/10 and if we were asked to do some numeric operations (multiplying big numbers, adding big numbers) on 70/100, we would naturally reduce it to a simpler form and then carry out the operations. Just like us, it’s easier(takes less space, and marginally faster) for a computer to do operations on smaller numbers. Essentially, activations functions serve the purpose of converting larger space to a smaller space. 70/100 was on a space that ranged from 0 to 100, but 7/10 is a space that’s a tenth of the size, ranging from 0 to 10.