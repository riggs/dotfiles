import os

import readline,rlcompleter

### Indenting
class TabCompleter(rlcompleter.Completer):
    """Completer that supports indenting"""
    def complete(self, text, state):
        if not text:
            return ('    ', None)[state]
        else:
            return rlcompleter.Completer.complete(self, text, state)

readline.set_completer(TabCompleter().complete)

### Add autocompletion
if 'libedit' in readline.__doc__:
    readline.parse_and_bind("bind -e")
    readline.parse_and_bind("bind '\t' rl_complete")
else:
    readline.parse_and_bind("tab: complete")

### Add history
import os
histfile = os.path.join(os.environ["HOME"], ".pyhistory")
try:
    readline.read_history_file(histfile)
    readline.set_history_length(300)
except IOError:
    pass
import atexit
atexit.register(readline.write_history_file, histfile)
del histfile

# Color Support
class TermColors(dict):
    """Gives easy access to ANSI color codes. Attempts to fall back to no color
for certain TERM values. (Mostly stolen from IPython.)"""

    COLOR_TEMPLATES = (
        ("Black" , "0;30"),
        ("Red" , "0;31"),
        ("Green" , "0;32"),
        ("Brown" , "0;33"),
        ("Blue" , "0;34"),
        ("Purple" , "0;35"),
        ("Cyan" , "0;36"),
        ("LightGray" , "0;37"),
        ("DarkGray" , "1;30"), ("LightRed" , "1;31"),
        ("LightGreen" , "1;32"),
        ("Yellow" , "1;33"),
        ("LightBlue" , "1;34"),
        ("LightPurple" , "1;35"),
        ("LightCyan" , "1;36"),
        ("White" , "1;37"),
        ("Normal" , "0"),
    )

    NoColor = ''
    _base = '\033[%sm'

    def __init__(self):
        if os.environ.get('TERM') in ('xterm-color', 'xterm-256color', 'linux',
                                    'screen', 'screen-256color', 'screen-bce'):
            self.update(dict((k, self._base % (v)) for k,v in self.COLOR_TEMPLATES))
        else:
            self.update(dict((k, self.NoColor) for k,v in self.COLOR_TEMPLATES))
_c = TermColors()

import sys
# Enable Color Prompts
sys.ps1 = '%s>>> %s' % (_c['LightGreen'], _c['Normal'])
sys.ps2 = '%s... %s' % (_c['Red'], _c['Normal'])

# Enable Pretty Printing for stdout
import pprint
def my_displayhook(value):
    if value is not None:
        try:
            import __builtin__
            __builtin__._ = value
        except ImportError:
            __builtins__._ = value

        pprint.pprint(value)

sys.displayhook = my_displayhook
