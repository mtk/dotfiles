# .bashrc

case "$PS1" in
*\$*)	PS1='% ';;
*\%*)	PS1='% ';;
*\#*)   PS1='# ';;
esac

[[ $(/usr/bin/id -u) = 0 ]] && PS1='# ' 

shopt -s         \
    autocd       \
    cdable_vars  \
    cdspell      \
    checkwinsize \
    direxpand    \
    extglob      \
    histappend   \
    histreedit   \
    histverify
#   gnu_errfmt
#   no_empty_cmd_completion

# path avoiders
alias state=/home/stp/bin/state
alias states=/home/stp/bin/states

# abbrevs (prefixes)
alias acr=acroread
alias al=alias
alias ap=apropos
alias auto=autoload
alias asr='asr '		# the trailing space causes alias expansion in the first arg to xargs
alias c=coursier		# just a way to remember the interface to dependence resolution
alias ens=enscript
alias f=find
alias fixc=fixclient
alias flf=fix-log-filter
alias g=grep
alias ha=halign
alias j=jobs
alias k=kill
alias m=make
alias ma=man
alias n=nmcli
alias p=perl
alias pa=path
alias pi=ping
alias py=python
alias s=sort
alias sk=start-gkrellms
alias sq=squeeze
alias tra=traceroute
alias ty=type
alias u=uniq
alias ugt=update-git-trees
alias x='xargs '		# the trailing space causes alias expansion in the first arg to xargs

# renames
alias ff=locate
alias gc=google-chrome
alias get=GET
alias pm=podman
alias rd=rmdir
alias sns=snap-to-stanza
alias t=less

# real aliases
[[ $TERM && $TERM != dumb ]] && alias b="echo -nE \"$(clear)\""
alias bcd='builtin cd'
alias bls='command ls -l'
alias bui='bu install'
alias cdl='cd -l'
alias cpan='INPUTRC="" perl -MCPAN -eshell'
alias cpanu="perl -MCPAN -e 'CPAN::Shell->install(CPAN::Shell->r)'"
alias cx='chmod +x'
alias d='gdb -q'
alias da='date +"%a %h %d %Y %r"'
alias du='du -h'
alias dus='for i in *; do if [ -d $i ]; then du -ks $i; fi; done'
alias ee='emacsclient -e'
alias grep=egrep --color=auto
alias ew='e $w'
alias fills='for i in $f/$(date +%Y%m%d)-*-fills.csv; do echo $i; done'
alias fs='fps fix | GREP_OPTIONS='' grep -v "[.]log" | sort -k8'
alias fgr='GREP_OPTIONS="" fgrep'
alias gi='grep -i'
alias gl='grep -l'
alias gil='grep -il'
alias gn='grpe -n'
alias gs='git status'
alias hg='GIT_DIR=~/proj/git/dotfiles/.git GIT_WORK_TREE=~ git'
alias hgs='hg status -uno'
alias hha='ha -gap "|" -null -bracket -every'
alias hn='echo $HOSTNAME'
#alias idf='eval /bin/df -h /net/{$(storage-servers -c)}/export/home; echo; eval /bin/df -h /net/{$(storage-servers -c)}/export/data'
#alias ils='eval "ls /net/{$(servers -c)}/export/home/mtk"'
alias j='jobs -l'
alias kk='kill -9'
alias lc='wc -l'
alias lpa='path $LD_LIBRARY_PATH'
alias ls='ls -CFLh --color=auto'
alias lsz='ls -Z'
alias manx='LESS="$LESS -X" man'
alias md='mkdir -p'
alias mi='mm install';
alias mpa='path $MANPATH'
alias mqa='sqsh -S mqa'
alias mt='mm test'
alias nco='. ~/.bash_completion'
alias nex='. ~/.bash_exports'
alias npa='. ~/.bash_path'
alias npr='. ~/.bash_profile'
alias nrc='. ~/.bashrc; . ~/.bashrc_protected'
alias nse='. ~/.bash_session'
alias ns='netstat -p'
alias nsr='netstat -p -rn'
alias nsl='netstat -p -nl'
alias nukem="emacsclient -e '(save-buffers-kill-emacs t)'"
alias nw='watch "ss -tlpu | halign -l"'
alias pc='perl -cw'
alias pf='perldoc -f'
alias plj='path $(latest-jars)'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias qed='while read x; do say $x; done < proj/doc/quotes-from-ed.txt'
alias qrl='rlog -L -R -l RCS/*'
alias r='fc -s'
alias rb='alias b="echo -nE - \"$(clear)\""'
alias rc='echo $?'
alias ren='rename -v'
alias sr='rlw scala -Xfatal-warnings -Xlint -deprecation -feature -cp $(latest-jars)'
alias sm='showmount'
alias sme='showmount -e'
alias sp='perl -00 -ne "print sort split /^/"';
alias su='PS1="# " su '
alias svd='svn diff'
alias svi='svn ci'
alias svu='svn update'
alias svs='svn status -q'
alias svns='svn status'
alias svsu='svn status -u'
alias syd='for i in $(boxes -p); do echo $i...; rsync --timeout=1 -auvz --delete dev $i:;done'
alias tf='tail -f'
alias ti='less @(*INSTALL*|*install*|*Install*)'
alias tks='tmux kill-session -t '
alias tlb='tmux list-buffers'
alias tlc='tmux list-commands'
alias tli='tmux info'
alias tlk='tmux list-keys'
alias tlp='tmux list-panes'
alias tls='tmux list-sessions'
alias tlw='tmux list-windows'
alias tps='ps -L'
alias tr='less @(*README*|*readme*|*Readme*|*ReadMe*|*READ_ME*|*READ.ME*|*ReleaseNotes*)'
alias tw='less $w'
alias tx='less -X'
alias uc='uniq -c'
alias x0='x -0 '
alias xm='xmodmap ~/.xmodmap'
alias xrl='xi xrdb'
alias z='[[ $SHLVL != 1 ]] && kill -STOP $$ && echo "(pwd now: $PWD)" && xtitle $PWD'

# platform-specific aliases.
# usually path avoiders.
# they come last so they can override generic aliases.

# case $ARCH in
# i*86)
# #   alias top='top $((LINES-6))'
# ;;
# sun4)
# ;;
# esac

# make failure document itself

function check_exit_status ()
{
    local status=$?

    if [[ $status -gt 128 && $status -lt 255 ]]; then
	local signal msg
	signal=$(builtin kill -l $(($status - 128)) 2>/dev/null)
	if [[ $signal ]]; then msg=$signal; else msg="signal $status"; fi
	echo "[Killed by $msg]" 1>&2
    fi

    return 0
}
PROMPT_COMMAND=check_exit_status

# mechanically generated aliases
for i in 0 1 2 3 4 5 6 7 8 9; do
    alias $i="fg %$i"
done

# still don't have the session stuff set up right
# for rcmd()/rexec(), so this has to be here
FPATH=~/.bash_functions:

# suck in the autoloader...
. ~/.bash_functions/autoload

# ... so you can fault the following in as needed:
for i in ~/.bash_functions/*; do autoload ${i##*/}; done

# dynamically load new builtins
for i in ~/.bash_builtins/*; do enable -f $i ${i##*/}; done

# now decorate commands/functions/builtins with completion knowledge.
. ~/.bash_completion

# anal, ain't i?
unset i

# grab aliases with sensitive info like db passwords
. ~/.bashrc_protected

# only if interactive (not from rsh/ssh/etc).  konsole?  gnome-term?
[[ $- = *i* && $TERM = xterm ]] && xtitle ${HOSTNAME%%.*}:$PWD

# non-interactive shells run under ssh need a session init
if [[ $- != *i* && -n $SSH_CLIENT ]]; then
    . ~/.ssh_session
fi

# use special git prompt when in a git repo
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

# Local Variables:
# mode: sh
# End:

