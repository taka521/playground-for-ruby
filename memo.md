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

## キーワード引数

メソッドではキーワード引数を定義できる。

```ruby
def method(arg1: 'A', arg2: 'B', arg3: 'C')
  puts "aeg1 = #{arg1}, arg2 = #{arg2}, arg3 = #{arg3}"
end
  
method(arg1: 'Hello!')
# aeg1 = Hello!, arg2 = B, arg3 = C
  
method(arg2: 'World!')
# aeg1 = A, arg2 = World!, arg3 = C
  
method(arg1: 'Hello', arg3: 'World!')
# aeg1 = Hello, arg2 = B, arg3 = World!
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

なお、`attr_accessor` で定義された変数はメンバ変数となる。

```ruby
class User
  attr_accessor :name
end

user = User.new
user.name = "名前"
```

### クラスメソッド

クラスメソッド（Javaで言う、staticメソッド）はメソッド名の直前に `self.` を付ける。

```ruby
class Book
  def self.class_method
    puts 'class method'
  end
end

Book.class_method
```

クラスメソッドをまとめて定義したい場合は、以下のように記載する。

```ruby
class Book
  class << self
    def class_method01
      puts 'class method01'
    end
    def class_method02
      puts 'class method02'
    end
  end
end

Book.class_method01 # => class method01
Book.class_method02 # => class method02
```

### インスタンスメソッド

クラス内に定義されたメソッド。

```ruby
class User
  attr_accessor :name, :birthday

  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  def disp_birthday
    @birthday.strftime('%Y年 %m月 %d日')
  end

  def inner_call_disp_birthday
    self.disp_birthday
    disp_birthday　# self.は省略可能
  end

  def call_private_method
    private_name
  end

  private 

  def private_name
    @name
  end

end

require 'date'

name = 'tanaka'
birthday = Date.new(1994, 5, 21)
user = User.new(name, birthday)

puts user.disp_birthday            # "1994年 05月 21日"
puts user.inner_call_disp_birthday # "1994年 05月 21日"
```

インスタンスメソッドの可視性は３つあり、デフォルトは `public` となる。   
`public`メソッド内で別の `public` メソッドを呼び出す場合は、`self.` に続けてメソッド名を書くか、そのままメソッド名を書けばよい。  
後者の `self` を付けないメソッドを呼び出し方を **関数形式** という。

`private` キーワードより下に定義したメソッドは `private` メソッドとなる。  
なお、`private`メソッドの場合は関数形式でしか呼び出せないので注意。

もう一つ `protected` メソッドがあるが、大雑把にいうと `self.` で呼び出すことができる `private` メソッド。  
あんまり使われないらしい。

```ruby
class Hoge
  protected

  def hoge_method
    ~
  end
end
```

### メソッド名のルール

* 破壊的メソッドの場合は、メソッド名の末尾に `!` をつける。
* 真偽値を返すメソッドの場合は、メソッド名の末尾に `?` をつける。


### 変数

クラス定義における各変数は以下のように定義する。

* `$変数名` : グローバル変数
* `@変数名` : メンバ変数（インスタンス変数）
* `@@変数名`: クラス変数

また、**小文字またはアンダーバー(`_`)で開始する変数**　はローカル変数として扱われる。  
定数は、**アルファベットの大文字で始まる** 変数。

定数に再代入を行うと、警告が出る。  
処理が中断するわけではないので注意。

```ruby
class Num
  @@num = 1     # クラス変数

  def increment
    @@num += 1
  end

  def decrement
    @@num -= 1
  end

  def num
    puts @@num
  end

  def self.num
    puts @@num
  end
end
```

### インスタンスメソッド内で、メンバ変数にアクセスする

`self.変数名` でメンバ変数にアクセスできる。

```ruby
class User
  attr_accessor :name

  def sayName
    puts self.name
  end
end

user = User.new
user.name = "tanaka"
user.sayName # tanaka
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

### 継承

```ruby
class Parent
  def hello
    puts "hello #{@name}!"
  end
end

class Child < Parent
  def initialize(name)
    @name = name
  end

  # メソッドのオーバライド
  def hello
    super # 親クラスのhelloメソッドを呼び出す
    puts "こんにちは、#{@name}さん"
  end
end

child = Child.new('tanaka')
child.hello
# hello tanaka!
# こんにちは、tanakaさん
```

* `クラス名 < 親クラス名` と書くことで、継承できる。
* 親クラスと同じ名前のメソッドを継承先のクラスで定義した場合は、オーバライドされる
  * 引数などは関係なく、メソッド名が一致すればオーバーライドされる
* 親クラスのメソッドを呼び出したい場合は、オーバライドしているメソッド内で `super` を書けば良い。

### モジュール

モジュールはクラスに似たオブジェクトで、定数やメソッドを定義することができる。

```ruby
module SampleModule # module に続けてモジュール名を書く
  CONST_NUM = 100

  def const_num
    CONST_NUM
  end
end

# モジュール名:: に続けて変数名やメソッド名を書くことで、変数やメソッドにアクセスできる。
puts SampleModule::CONST_NUM # => 100
puts SampleModule::const_num # => 100

# モジュールをインクルードすることで、「モジュール名::」が省略できる
include SampleModule 
puts const_num # => 100
puts CONST_NUM # => 100
```

また、モジュール内のメソッドを「モジュールファンクション」として定義することでクラスメソッドのような呼び出し方ができる。

```ruby
module SampleModule
  def sum(num1, num2)
    num1 + num2
  end

  module_function :sum # sumメソッドをモジュールファンクションとして定義する
end

puts SampleModule.sum(1, 2) # => 3
```


### ミックスイン

モジュールの機能をクラスに取り込むことを、ミックスインと呼ぶ。  
ミックスインの定義は、クラスの中に`include モジュール名`と定義する。

```ruby
module SampleModule
  def sum(a, b)
    a + b
  end
end

class MixinClass
  include SampleModule

  def class_sum(a, b)
    a + b
  end
end

mixin_class = MixinClass.new
mixin_class.sum(10, 20)      # => 30
mixin_class.class_sum(1, 2)  # => 3
```

## 例外処理

Rubyでの例外処理は以下のように行う。

```ruby
begin
  # 例外が発生する可能性のある処理
rescue
  # 例外が発生した場合の処理
end
```

`begin` ブロックに、例外が発生する可能性のある処理を書く。  
`rescue`ブロックには、例外が発生した場合の処理を書く。

発生した例外の情報を取得したい場合には、`rescue => e` と書くことで `e` に例外オブジェクトが代入される。  
代入された例外オブジェクトは `rescue` ブロック内の処理でアクセスできる。

```ruby
begin
  10 / 0
rescue => e
  p e # <ZeroDivisionError: divided by 0>
end
```

例外オブジェクトには、エラーの原因調査に役立つメソッドが用意されている

* `backtrace` : メソッドの呼び出し状況を表したデータ
* `full_message` : 例外の整形された文字列を返します。

```ruby
begin
  10 / 0
rescue => e
  p e.backtrace
  p e.full_message
end
```

### 例外別に処理を分岐させる

発生した例外によって、`rescue` ブロック内の処理を分けたい場合がある。  
その場合は、`rescue` に続けて補足したい例外を記載する。

```ruby
begin
  10 / 0
rescue ZeroDivisionError => e
  puts '0除算エラー'
rescue => e
  puts 'その他エラー'
end
```

### 例外処理後にリトライする

例外を補足したあとで、`begin` ブロックの処理をリトライしたい場合には `rescue` ブロックの中で `retry` を書く。

```ruby
num = 0
begin
  10 / num
rescue => e
  puts '例外発生！'
  num = 2
  retry
end

# 例外発生！
# 5
```

### 明示的に例外を発生させる

明示的に例外を発生させたい場合は、`raise`と記載する。

```ruby
begin
  raise
rescue => e
  p e # RuntimeError
end
```

単に`raise`と書いた場合、`RuntimeError` が発生する。  
特定の例外を発生させたい場合には、`raise` に続けて発生させたい例外を明記する。

```ruby
begin
  raise ZeroDivisionError
rescue => e
  p e # #<ZeroDivisionError: ZeroDivisionError>
end
```

### 例外の発生有無に関わらず、処理を実行させる

例外が発生した場合の処理は`rescue`ブロックに定義するが、例外が発生してもしなくても実行する必要のある処理は `ensure` ブロックに定義する。

```ruby
begin
  10 / 0
rescue => e
  p e
ensure
  puts 'call ensure block'
end

# #<ZeroDivisionError: divided by 0>
# call ensure block
```


### 独自例外の作成

独自で例外を作成したい場合には、`StandardError` を継承して例外を作成する。

```ruby
class MyError < StandardError;
end

begin
  raise MyError
rescue => e
  p e # #<MyError: MyError>
end
```


## オブジェクトの等価比較

rubyでオブジェクト同士の等価性を評価したい場合は `==` 演算子を使用する。

```ruby
objectA == objectB
```

逆に２つのオブジェクトが同一であ
るか（参照が等しいか）を確認する場合には、`equal?` メソッドを使用する。

```ruby
objectA.equal?(objectB)
```
