# Commandline aliases for Fish

host +local:root >/dev/null 2>&1
if test (uname) = "Linux";
    alias ls="ls --color=auto"
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
else if test (uname) = "Darwin";
    alias ls="ls -G"
end
alias curl="curl -fLC - --retry 3 --retry-delay 3"
