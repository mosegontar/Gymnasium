# Gymnasium (for the very lazy)

**Gymnasium** faciliates off-the-cuff writing and executing of experimental scripts and scratch files. 

## It doesn't do much
The `gym` command will launch a `_gym.rb` file in an editor (defualt `vim`), and this file will be your scratch pad. The file is created if it doesn't exist and it resides in the current working directory from which you executed `gym`. 

`gym -r` will launch `_gym.rb` in `vim` and then on its closing immediately execute it by running `ruby _gym.rb`. 

## Usage

Launch `_gym.rb` file in editor (creating it first in your cwd if none exists):

    gym

Execute `_gym.rb` file after opening and closing it in your editor.

    gym -e

Create new _gym file (writes over existing file)

    gym -n

Help

    gym -h

## To-Do
- Allow `_gym` files with any extension
- Suggest an extension based on other files present in the directory
- Bookmark/saving feature to store `_gym` files in a `.gymnasium` directory