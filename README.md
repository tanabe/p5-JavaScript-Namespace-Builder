# JavaScript::Namespace::Compiler
----

## description
Namespace.js compiler.
auto resolve dependencies.

## usage
    my $result = JavaScript::Namespace::Compiler->compile({
      script_root => './t/script',
      namespaces => [
        'com.kaihatsubu.hoge',
        'com.kaihatsubu.fuga',
      ],
    });

