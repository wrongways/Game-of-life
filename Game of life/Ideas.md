#  Ideas to test

Should create a separate branch for these

## Classes
Change structs to classes - perhaps pointers are faster than values?

## Game Cell
Add a livingNeighbours attribute (as integer count). Put an observer on state and when changes from dead to alive add one to all neighbours' livingNeighbours count, and subtract one when changing to dead.

Probably means that the initialisation will have to change
