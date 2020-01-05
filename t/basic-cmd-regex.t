use Test::Command;
use Test::More;

use Cwd;

note "PWD is " . getcwd();

$CMD = [ qw( ./psgrep --test-psdata t/data/basic1-mac-catalina.txt zsh ) ];
stdout_is_file($CMD, 't/data/basic-cmd-regex-test-mac-10.15.out', 'bareword regex');

$CMD = [ qw( ./psgrep --test-psdata t/data/basic1-mac-catalina.txt ), '/zsh/i' ];
stdout_is_file($CMD, 't/data/basic-cmd-regex-test-mac-10.15.out', '/regex/i');

$CMD = [ qw( ./psgrep --test-psdata t/data/basic1-mac-catalina.txt ), 'command =~ m/zsh/i' ];
stdout_is_file($CMD, 't/data/basic-cmd-regex-test-mac-10.15.out', 'command =~ m/regex/i');

done_testing;

