+++
title = "Zsh Speedup"
date = "2020-12-17T09:16:54+01:00"
author = "Kevin"
cover = ""
tags = ["zsh", "oh my zsh", "shell", "terminal"]
keywords = ["zsh", "oh my zsh", "shell", "terminal"]
description = ""
showFullContent = false
+++
I've been experiencing some slowdowns in my shell lately, I could not explain why. 
But I am using [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), and after some 
searching I found a blog post by Matthew J. Clemente that has a complete walkthrough 
of how to diagnose and fix slow (Oh My Zsh) shells. 

You start by measuring actual load times to set a base with a simple function you can 
put into your .zshrc file:
{{< code language="bash" >}}
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
{{< /code >}}

Now you can run timezsh and see how long it takes for your shell to start up and be ready. 
To figure out exactly which plugin is causing the slowdown you can run the following to 
see how long it takes for each plugin to be loaded in:
{{< code language="bash" >}}
# Load all of the plugins that were defined in ~/.zshrc  
for plugin ($plugins); do
  timer=$(($(gdate +%s%N)/1000000))
  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then  
    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh  
  elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then  
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh  
  fi  
  now=$(($(gdate +%s%N)/1000000))
  elapsed=$(($now-$timer))  
  echo $elapsed":" $plugin  
done 
{{< /code >}}

In my case it was the kubectl plugin for Oh My Zsh, the fix was to use the given kubectl command 
to load in the autocomplete:
{{< code language="bash" >}}
function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}
{{< /code >}}

Now I can remove the plugin and lazy load the kubectl command every time I start up a new shell 
session.

Sometimes you don't need a plugin for things, take each plugin you install seriously and check if 
you really need it. A slow shell is not great and a killer for productivity.

Source: https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html