# 50-ways-to-tell-a-story
Csound and Python in harmony

This is a project where sound is in centre. Python-code generates the algorithmic part, and Csound implements it and make sound out of it. 
The whole idea is splitting a larger soundfile with voices into small files where each file contains exactly one word. 
Python creates a list with the same amount of elements as soundfiles, and make a random shuffle of the list before it sort it slowly.
In Csound the elements in the python-list converts to be the soundfiles so that it is the sound that gets shuffled and ordered again.

In background there is a whole other things happening, created with DMI's in Csound. You'll find that in the file DMI.cs.

The complete soundfile you can listen to on this site: https://soundcloud.com/monika-madsoe/50-ways-to-tell-a-story
