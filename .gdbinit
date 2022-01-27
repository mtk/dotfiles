set listsize 40

set print asm-demangle on
set print vtbl on
set print sevenbit-strings on
set print object on
set print pretty on
set print array on
set print static-members off

set history save
set history size 1000
set history expansion

set confirm off

define w
where
end

define tbt
thread apply all bt
end

# dir <DIR> to find source
# set scheduler-locking step (friendlier for threads)

 add-auto-load-safe-path /home/mtk/proj/git/emacs/src/.gdbinit
