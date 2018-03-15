insta () {
  docker run --rm -it $1 /bin/bash || docker run --rm -it $1 /bin/sh
}

dock () {
  docker exec -it $1 /bin/bash || docker exec -it $1 /bin/sh;
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

activate_cfg() {
     mv ~/.inactive_pydistutils.cfg ~/.pydistutils.cfg    
}

deactivate_cfg() {
     mv ~/.pydistutils.cfg ~/.inactive_pydistutils.cfg
}

export PS1="[\t] \u \[\033[32m\]\W\[\033[34m\]\$(parse_git_branch)\[\033[00m\] $ "

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pgoy/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/pgoy/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pgoy/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/pgoy/Downloads/google-cloud-sdk/completion.bash.inc'; fi
