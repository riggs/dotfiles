set -gx ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb
set -gx GNUARMEMB_TOOLCHAIN_PATH (realpath (realpath (which arm-none-eabi-gcc)/../..))
set -gx PYTHONSTARTUP ~/.pythonrc.py

if status is-interactive
    set -gx PATH /Users/riggs/Library/Python/3.9/bin /opt/homebrew/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /Users/riggs/.local/bin
end
