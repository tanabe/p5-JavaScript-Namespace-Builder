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


    
    $VAR1 = {
              'script' => 'Namespace('com.kaihatsubu.hoge')
              .use('com.kaihatsubu.foo.bar *')
              .use('com.kaihatsubu.foo.baz *')
              .define(function(ns) {
              });
              Namespace('com.kaihatsubu.foo.bar')
              .define(function(ns) {
              });
              Namespace('com.kaihatsubu.foo.baz')
              .define(function(ns) {
              });
              Namespace('com.kaihatsubu.fuga')
              .use('com.kaihatsubu.foo.bar *')
              .define(function(ns) {
              });
              ',
              'files' => [
                           './t/script/com/kaihatsubu/hoge.js',
                           './t/script/com/kaihatsubu/foo/bar.js',
                           './t/script/com/kaihatsubu/foo/baz.js',
                           './t/script/com/kaihatsubu/fuga.js'
                         ]
    };

$result is hash reference that includes file list and concated JavaScript code.
