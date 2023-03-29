fish_add_path -a /Users/riggs/Library/Python/3.9/bin
fish_add_path -a /opt/homebrew/bin
fish_add_path -a /Users/riggs/.local/bin
fish_add_path -a /Users/riggs/.dotnet/tools
fish_add_path -a /opt/homebrew/opt/postgresql@15/bin
fish_add_path -a /Users/riggs/VulkanSDK/1.3.231.1/macOS/bin

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
