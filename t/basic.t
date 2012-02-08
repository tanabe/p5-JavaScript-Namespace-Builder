use strict;
use warnings;
use Test::More;
use JavaScript::Namespace::Compiler;

my $script_root = './t/script';
my $result;

$result = JavaScript::Namespace::Compiler->compile({
  script_root => $script_root,
  namespaces => [
    'com.kaihatsubu.hoge',
  ],
});

ok($result);

is_deeply($result->{files}, [
  './t/script/com/kaihatsubu/hoge.js',
  './t/script/com/kaihatsubu/foo/bar.js',
  './t/script/com/kaihatsubu/foo/baz.js',
]);

$result = JavaScript::Namespace::Compiler->compile({
  script_root => $script_root,
  namespaces => [
    'com.kaihatsubu.foo.bar',
  ],
});

ok($result);

is_deeply($result->{files}, [
  './t/script/com/kaihatsubu/foo/bar.js',
]);

::done_testing;
