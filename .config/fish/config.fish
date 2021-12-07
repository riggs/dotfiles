set -gx PATH /Users/riggs/Library/Python/3.9/bin /opt/homebrew/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /Users/riggs/.local/bin
set -gx ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb
set -gx GNUARMEMB_TOOLCHAIN_PATH /Applications/ARM
set -gx PYTHONSTARTUP ~/.pythonrc.py

if status is-interactive
end
