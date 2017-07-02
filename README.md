# Harmony for Achaea
The Harmony system meant to add functionality to Mudlet, SVO, and Keneanung's Basher. It is mostly targeted to people new to Achaea, but is also useful to pretty much anyone who wants a nifty 

## Modules

### Hunting

This module adds functionality to Keneanung's Basher, such as auto-attacking, announcing targets, and following a leader. Use automatically at your own risk

### Keypad

This module sets up your keypad to let you both walk certain directions with the push of a button, but also includes a combat keypad functionality that will allow you to create combat tactics that are performed when you press a button.

### Mapping

This module adds functionality to the Mudlet Mapping script and built-in map. It allows you to auto-explore an area, keep track of where you've explored, see a list of rooms you haven't explored yet, and some utility commands for managing the map.

## Commands

You can find a list of commands in game by sending `har`

## Callbacks

### Harmony.loading

Called when Harmony is being loaded. This is fired right after Harmony is instantiated.

## API

### Core

`Harmony.getPath(fileName)`: Returns the direct path to the file within the Harmony directory

`Harmony.loadFile(fileName)`: Runs the provided filename. Uses `Harmony.getPath` to get the file path and then runs it.

`Harmony.printCommands()`: Prints out all the registered aliases