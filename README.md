# Configuration files

I'm using [yadoma](https://pypi.python.org/pypi/yadoma/) to manage my config
files. This allows me to have all config files in one central folder and keep
them in this git repository. Whenever I add a config file to the git
repository, I also edit the `config.yadoma` file and re-run `yadoma`. By having
the symlinks, editing the files in the config file folder propagates to the
home directory and ultimately to the respective programs I start.

If you are just looking at this repository, you might wonder "What are the files
that I don't know about?" Here are some answers:

- [i3](https://i3wm.org/) is an auto-tiling window manager. Your windows cover
  the whole screen and they are set up in a way to reorganize when you open
  more windows. This is totally amazing if you want to use a window manager to
  be able to open windows, but you actually don't want to do a lot of mouse
  interaction with your computer. If you really like your mouse, an auto-tiling
  window manager might not be for you.

  To install `i3`, you should use the package manager of your linux
  distribution. For debian derivatives (e.g. ubuntu) use the command

    apt update
    apt install i3

  You would afterwards have to log out and log back into an "i3-session".

- [bash](https://www.gnu.org/software/bash/) is a shell, i.e. a comand line
  interpreter. It is the default shell that runs in the terminal windows of
  MacOS or Ubuntu. It's a pretty amazing piece of software, but I rarely use it.
  Hence the simple copy of some standard configuration (I believe that I modified
  something but I can't quite remember what). In most linux distributions,
  bash is already installed.

- [zsh](http://www.zsh.org/) is another shell. It has some (very few) additional
  features compared to bash, but there has been some kind of a code competition
  of writing the most amazing config file for zsh. I'm building on the zsh grml
  config and I added a couple of nice local functions. If you want to use zsh
  temporarily, you can just type `zsh` on the command line. If you actually
  want to switch to zsh permanently, you would have to use `chsh`.
- [vim](http://www.vim.org/) is a text editor with a steep learning curve. Yet,
  vim is by many (including myself) considered the best text editor out there.
  So once you've mastered the learning curve, you will never want to miss
  multiple modes of text editing, easy macros, or navigation with `h`, `j`, `k`,
  `l`. Vim becomes really cool if you configure it a little bit and the
  configuration snippets that existed on the internet grew at some point to a
  level where they would be more easily maintained as plugins. There are
  multiple plugin managers out there and I'm using *vundle* because I don't know
  better. If you want to actually use the plugins that I have in my config, you
  would have to install them. You do that from within *vim* by typing (in normal mode):

    :PluginInstall

  and hit return (not that this will download and install the respective
  plugins. So this could take some time.

There are also two python tools that are configured here.
[yadoma](https://pypi.python.org/pypi/yadoma/) has been explained above and
[triforce](https://pypi.python.org/pypi/triforce) is a tool that helps you have
certain python tools installed in a globally accessible virtual environment.
This is cool, because you don't have to break your system python (you still
install into a virtual environment), but you still have those tools available
"everywhere". One particularly noteworthy python tool that triforce will
install globally is
[pomo](https://github.com/igordertigor/pom://github.com/igordertigor/pomo),
which provides a very simple [pomodori
timer](https://en.wikipedia.org/wiki/Pomodoro_Technique). There are many
pomorodi timers out there, but -- surprisingly -- none of them had good
tracking of overtime, which I think is important if you want to improve on your
pomodori planning.

To get the python tools running, you would simply create a (temporary)
virtual environment, install *triforce* into it, run *triforce* with the
correct config and you're set. Triforce will also install *yadoma*, so if
you start with triforce, you should be able to use *yadoma* globally
afterwards to create your symlinks.
