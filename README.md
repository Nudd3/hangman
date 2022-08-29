# Hangman

Try it out [here](https://replit.com/@Nudd3/hangman#lib/main.rb)

## Introduction
This is a part of The Odin Project's Full Stack Ruby on Rails Path. This project specifically goes into learning about serialization. Here it is done using the JSON format.
The player will have the option of saving a game and later come back and load it back up, and progress will be resumed. 

## The Game
This is a game of hangman played in the terminal.
A random word is generated containing between 5 and 12 letters. They player then has to guess the word, one letter at a time.

The player are allowed a total of 5 wrong guesses. After 6 wrong guesses the game ends. 

## Todo 
* Try to shorten down the #play method in Hangman class

* Have  some sort of visual display of an actual guy hanging (^_^). Like when it's being played on a whiteboard or a paper. At the moment, the number of guesses are just showing. 