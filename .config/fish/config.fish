set -gx ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb
set -gx GNUARMEMB_TOOLCHAIN_PATH (realpath (realpath (which arm-none-eabi-gcc)/../..))
set -gx PYTHONSTARTUP ~/.pythonrc.py

if status is-interactive
    set -x PATH $fish_user_paths
end
