# OOP-Assignment-2
A Game made with Processing

#YouTube Video

[![Youtube Video]](https://youtu.be/3You19PxRSs)

# Concept

The aim of this assignment was to create a game with our knowledge of Processing and Object Oriented Programming.

I wanted to create something fun, easy to play and replayable again and again.
In this game you control a small block, you have to keep away from the obstacles for the most time possible.
The best thing is that it has no end, you can go as far as you want, keep trying until you beat your highscore or challenge some of your friends

#Features

* Use of the box2d library to implements the physics
* In-game music (provided by Undertale Soundtrack) using Minim library
* Randomly generated obstacles
* Game modifiers to make the game more intense
* Display leaderboard using file I/O
* Use of abstract classes

#Controls

W key to jump
S key to go down
Every option is clickable
On the end scree, press ENTER to continue playing

#Functionality

* Everytime you move the player you change the linear velocity by either (0,10) or (0,-10)
* Obstacles are generated every second. There is a 50/50 chance of spawing up or down.
* Modifiers occur every 5 seconds and last for 2 seconds. There are two types of modifiers:
	* Speed: Obstacles move twice as fast.
	* Darker: Screen gets darker.
* You can save (or not) your name with your score at the end of the game.