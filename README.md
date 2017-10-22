# Playground for Ruby

Rubyで遊ぶためのリポジトリ。  
自端末のRubyバージョンは 2.4.2。

## 参考にしたサイトとか

* [Ruby公式サイト](https://www.ruby-lang.org/ja/)
* [オブジェクト指向スクリプト言語 Ruby リファレンスマニュアル](https://docs.ruby-lang.org/ja/2.4.0/doc/index.html)
* [MacにHomeBrew,rbenv,bundlerをインストールする - Qiita](https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b)
* [Rubyを始めたけど今ひとつRubyのオブジェクト指向というものが掴めないという人、ここに来て見て触って！](http://melborne.github.io/2013/02/07/understand-ruby-object/)
* [RubyのModuleの使い方とはいったい - Qiita](https://qiita.com/shiopon01/items/fd6803f792398c5219cd)
* [便利なRubyイディオム - Qiita](https://qiita.com/kidach1/items/46a6e49b6306655ccd64)


## Rubyのインストール

homebrewが使える前提。  
インストール手順は[MacにHomeBrew,rbenv,bundlerをインストールする](https://qiita.com/shinkuFencer/items/3679cfd966f6a61ccd1b)を参考に。  
とりあえず、以下のコマンドを順番に叩いてコンソールに「Hello World」が表示されればいい。

```
$ brew install rbenv ruby-build  // rbenvのインストール
$ rbenv --version      // rbenvのバージョン確認
$ rbenv install -l     // インストール可能なrubyの一覧
$ rbenv install 2.4.2  // 2.4.2のインストール
$ rbenv global 2.4.2   // 端末のrubyのバージョンを2.4.2に変更
$ rbenv versions       // 2.4.2になっていることを確認
$ echo "print 'Hello World'" > hello.rb  // hello.rbを作成
$ ruby hello.rb        // Hello Worldが表示されればOK
```

## REPL

RubyのREPLは、`irb` コマンドで起動できる。

```
$ irb
irb(main):001:0> p "hello"
"hello"
=> "hello"
irb(main):002:0> 
```

終了は `exit` コマンド。