## Quick start

    curl https://raw.github.com/coderifous/dotfiles/master/get.vimfiles.sh | sh

This clones the repo, installs the vim plugins, and links the vim-related
dotfiles.  Running this command should get you up and running with this vim
config without any other work.

The vim status line is configured using the Powerline plugin. This looks best
with a special font: [Monaco for Powerline](https://gist.github.com/syranez/1871776/raw/d1e0dd8b745a7868444ecb0d1d6cdb593249f9d5/Monaco_Linux-Powerline.ttf).
Install that and then configure your terminal application (e.g. iTerm 2) to use
it.

## Make it your own

If you want to copy this Vim config as a base for your own, you should:

* Fork this repository.
* Change the mention of "coderifous" in the get.vimfiles.sh script to your own
  github name.
* Customize the vim config to suit you.

## Highlights

### vimrc Organization

This Vim config (loaded from .vimrc) is broken up across several files that are
sourced.  Each file performs a different kind of customization.

* vimrc_settings  - basic vim configuration
* vimrc_autocmds  - custom autocommands
* vimrc_commands  - custom ex commands, e.g. :Vimrc
* vimrc_functions - custom functions, e.g. :call RemoveWhiteSpace()
* vimrc_mappings  - custom mappings, the goto file for rapidly improving your workflow.
* vimrc_plugins   - conditionally loaded configuration depending on whether the --noplugins flag was used.

### Fosters rapid workflow experimentation and extension

You should be able access and modify your vim config with the least effort
possible.

* `:VimrcMaps` - opens vimrc_mappings for editing
* `,V` - normal mode mapping that evals the current line as vimscript

With those two helpers, you can quickly add mappings when you recognize a
pattern in your workflow.

### pathogen and the stupid vim plugin installer

This Vim config uses the very popular pathogen plugin to load module vim
plugins.  For plugin installation, it uses the stupid vim plugin installer: a
simple bash script.

### Unpublished plugins

Sometimes you go to create a mapping, and you realize you need a function, and
then a command to go with it, and before you know it you've got a small plugin
on your hands.  The unpublished/ directory is a place to plop works-in-progress
that you might later publish for others.  Pathogen is aware of your unpublished
works.

### Plugins

Take a look at the plugins script to see all of the included plugins.

Here's a sampling:

* [NerdTree](http://github.com/scrooloose/nerdtree) - The missing file drawer for Vim.
* [surround](http://github.com/tpope/vim-surround) - quoting/parenthesizing made simple
* [AutoClose](http://github.com/vim-scripts/AutoClose) - inserts matching bracket, paren, brace or quote
* [ack](http://github.com/vim-scripts/ack.vim) - grep for code
* [CtrlP](https://github.com/kien/ctrlp.vim) - Fuzzy file, buffer, mru, tag, etc finder
* [Word Column TextObjects](https://github.com/coderifous/textobj-word-column.vim) - Adds text-objects for word-based columns

Since I write a lot of Ruby, and Ruby on Rails there's a few useful plugins for
that as well.

* [rails](http://github.com/tpope/vim-rails) - Ruby on Rails power tools
* [ruby](http://github.com/vim-ruby/vim-ruby) - ruby omnicompletion and syntax highlighting
* [textobj-rubyblock](http://github.com/nelstrom/vim-textobj-rubyblock) - custom text object for selecting ruby blocks.
* [ruby-refactoring](http://github.com/ecomba/vim-ruby-refactoring) - Refactoring tool for ruby
* [coffee-script](http://github.com/kchmck/vim-coffee-script) coffee-script syntax, indenting and compiling
* [haml](http://github.com/tpope/vim-haml) - runtime files for Haml, Sass, and SCSS

