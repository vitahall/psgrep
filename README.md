# psgrep

Select processes with the power of Perl expressions!

## Basic Usage: grepping

The simple case is simple:

    psgrep httpd

That does a regular expression match against the command and arguments shown by `ps`. On my system, it comes back with:

    PID  COMMAND
    51   /usr/sbin/httpd -D FOREGROUND -D WEBSHARING_ON
    94   /usr/sbin/httpd -D FOREGROUND -D WEBSHARING_ON
    2272 /usr/sbin/httpd -D FOREGROUND -D WEBSHARING_ON

Since it's a Perl regex, you can also do stuff like this:

    psgrep '^\/System.*\.app\W'  # maybe not so basic

That comes back with results like:

    PID   COMMAND
    4257  /System/Library/CoreServices/Finder.app/Contents/MacOS/Finder
    4532  /System/Library/CoreServices/Dock.app/Contents/MacOS/Dock

## Other Operations

It's not *just* grep. You can use most of Perl's comparison operators.

    psgrep 'user eq merlin'
    psgrep ppid==1            # processes owned by init (on Unix)
    psgrep 'state =~ [Z]'     # zombies

Putting it all together:

    psgrep php 'uid != 0' 'pcpu > 5' # non-root php using > 5% of cpu

## Output

Output looks like `ps`'s. (It essentially *is* `ps`'s.) Any field you compare against automatically gets printed. 

* `-o` adds fields to output, just like `ps`

* `-p` prints *only* matching PIDs, with no header (for script/pipeline use)

## Compatibility

It should work with any `ps` that supports the BSD-style `axw` options and the POSIX/SUS `-o` format option. Tested with Perl 5.8.1 and newer, and requires no non-core modules. Just take the script with you wherever you need it.

## For More

Run `psgrep --man` to display the complete manual.
