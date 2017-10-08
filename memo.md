# Rubyメモ

## コメント

1行コメントは `#` で開始する。  
複数行コメントは `=begin` で開始し、`=end` で閉じる。

```ruby
# 1行コメント
=begin
複数行
コメント
=end
```

## 関数

関数（メソッド）定義は `def メソッド名` で開始する。  
メソッド定義の終わりには、`end` を付ける。

```ruby
def メソッド名[(引数名, 引数名...)]
  ...
end
```

引数が無いメソッドの呼び出しには `()` は不要。

```ruby
def hello
  puts "Hello World"
end
  
hello    # ()なし
hello()  # ()あり
```

## デフォルト引数

rubyの関数にはデフォルト引数を設定することができる。  
デフォルト値は `引数 = 初期値` で指定できる。

```ruby
def hello(name = 'World')
    puts "Hello #{name}!"
end
  
hello('Tanaka')
# 結果 => Hello Tanaka!
  
hello
# 結果 => Hello World!
```



## 文字列で式を評価する

Rubyでは文字列の中で評価することができる。  
ダブルクォーテーション(`"`)で囲まれた文字列中に、評価したい式を `#{}` の中に定義する。

```ruby
def hello(name)
  puts "Hello #{name}!"
end
  
hello("太郎")
# 結果 => Hello 太郎!
```

`#{}` が有効なのは、ダブルクォーテーションで囲まれた文字列の中だけで、  
シングルクォーテーションで囲まれた文字列では式の評価が行われない。（純粋に文字列として扱われる）

```ruby
def hello(name)
  puts 'Hello #{name}!'
end
  
hello("太郎")
# 結果 => Hello #{name}!
```


## クラス

### クラス定義

rubyでクラス定義する場合は、`class クラス名` で開始し、`end` で終わる。

```ruby
class Greeter
  ...
end
```

### コンストラクタ

コンストラクタは `initialize` というメソッドを定義する。  

```ruby
class Greeter
  
  # コンストラクタ
  def initialize(name = 'World')
    ...
  end
  
end
```

メンバ変数の定義やアクセスは `@変数名` で行う。

```ruby
class Greeter
  
  # コンストラクタ
  def initialize(name = 'World')
    @name = name  # メンバ変数 name に、引数を設定
  end
  
end
```

### インスタンスの作成

作成したクラスのインスタンスは、`クラス名.new` で作成する。

```ruby
greeter = Greeter.new('Kevin')
```

### メンバ変数へのアクセス

クラスのメンバ変数はprivateなので、`インスタンス.メンバ変数` としても通常はアクセスできない。  
例えば上記の `Greeter` クラスには `@name` というメンバ変数が定義されているが、
`Gretter` に `name` といアクセサが生えているわけではないので、以下のコードはエラーになる。

```ruby
greeter = Greeter.new('Kevin')
greeter.name
# NoMethodError: undefined method `name' for #<Greeter:0x007fca0391c218 @name="Kevin">
```

メンバ変数にアクセスしたい場合には、クラス定義中に `attr_accessor :メンバ変数` を追加する。

```ruby
class Greeter
  attr_accessor :name
end
```

`attr_accessor` を追加することで、セッターとゲッターメソッドが追加される。

```ruby
greeter = Greeter.new('Kevin')
greeter.name         # ゲッター
greeter.name = 'Bob' # セッター 
```

### クラスの情報を取得する

* クラスのメソッド一覧を取得する

```ruby
クラス名.instance_methods         # 親クラスを含む全てのメソッド
クラス名.instance_methods(false)  # 自身のクラスのみを対象とする
```

* メソッドが定義されているか判定する
  * `クラス名.respond_to?` でもイケる

```ruby
変数名.respond_to?("メソッド名")  # 指定されたメソッドが定義されていれば true、なければ false
```

