use strict;
use warnings;
use Test::More 'no_plan';
use JavaScript::Namespace::Builder;

my $script_root = './t/script';
my $result;

$result = JavaScript::Namespace::Builder->build({
  script_root => $script_root,
  namespaces => [
    'com.kaihatsubu.hoge',
    'com.kaihatsubu.fuga',
  ],
});

ok($result);

is_deeply($result->{files}, [
  './t/script/com/kaihatsubu/hoge.js',
  './t/script/com/kaihatsubu/foo/bar.js',
  './t/script/com/kaihatsubu/foo/baz.js',
  './t/script/com/kaihatsubu/fuga.js',
]);

$result = JavaScript::Namespace::Builder->build({
  script_root => $script_root,
  namespaces => [
    'com.kaihatsubu.foo.bar',
  ],
});

ok($result);

is_deeply($result->{files}, [
  './t/script/com/kaihatsubu/foo/bar.js',
]);

