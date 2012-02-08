# JavaScript::Namespace::Compiler
----

## description
Namespace.js compiler.
auto resolve dependencies.

## usage
    my $result = JavaScript::Namespace::Compiler->compile({
      script_root => '/script',
      namespaces => [
        'com.kaihatsubu.hoge',
        'com.kaihatsubu.fuga',
      ],
    });

$result is hash reference that includes file list and concated JavaScript code.
