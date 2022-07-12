set -gx PATH /Users/riggs/Library/Python/3.9/bin /opt/homebrew/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /Users/riggs/.local/bin
set -gx ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb
set -gx GNUARMEMB_TOOLCHAIN_PATH /Applications/ARM
set -gx PYTHONSTARTUP ~/.pythonrc.py

if status is-interactive
    function mvim
        for arg in $argv
            switch $arg
            case {-,+}'*'
                set --append opts $arg
            case '*'
                set --append files $arg
            end
        end
        if [ -n "$files" ]
            set --prepend files --remote-tab-silent
        end
        /Applications/MacVim.app/Contents/bin/mvim --servername VIM $opts $files &
        disown
    end
end
