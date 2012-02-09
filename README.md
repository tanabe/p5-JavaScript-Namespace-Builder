# JavaScript::Namespace::Builder
----

## description
Namespace.js builder.
auto resolve dependencies.

## usage
    my $result = JavaScript::Namespace::Builder->build({
      script_root => '/script',
      namespaces => [
        'com.kaihatsubu.hoge',
        'com.kaihatsubu.fuga',
      ],
    });

$result is hash reference that includes file list and concated JavaScript code.
