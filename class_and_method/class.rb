# クラス定義

## クラス定義
#    クラスはアルファベットの大文字で開始する。
#    既存のクラスと同じ名前のクラスを定義した場合には、既存クラスに対する追加定義になる。

class Parent
end

# 継承は < に続けて親クラスを記載する
class Child < Parent
  class Inner
    # インナークラスも定義可能
  end
end

child = Child.new
inner = Child::Inner.new # インナークラスは :: で指定する

p child # => #<Child:0x007fcb5705ee28>
p inner # => <Child::Inner:0x007fcb5705ee00>


## 特異クラス定義
#    特定のオブジェクトに対してメソッドやインスタンス変数を定義/追加するもの。
#    追加したメソッドやインスタンス変数は、特異クラスとして定義したオブジェクトにのみ有効になる。
#    構文は通常のクラス定義とほぼ同じ。

class << child
  # メソッドを追加する
  def sayHi(name = 'tanaka')
    puts "Hi #{name}"
  end
end

child.sayHi('sato') # => Hi sato

# child2 = Child.new
# child2.sayHi('sato')
#
#   sayHi メソッドは変数 child に対してのみ定義されているので child2 には存在しない。
#   class_and_method/class.rb:38:in `<main>': undefined method `sayHi' for #<Child:0x007f921c861a40> (NoMethodError)


## モジュール定義
#    モジュールはアルファベットの大文字で始める。
#    既存のモジュールと同じ名前のモジュールを定義した場合、既存モジュールに対する追加定義となる。
#    モジュールはクラスと異なり、インスタンス化できない。
#    クラスにインクルードしたり名前空間を提供するために使用する。

module MyModule
  VERSION = 1.0

  def v
    VERSION
  end

  def add(x, y)
    x + y
  end

  # self. から宣言された関数は、クラスメソッドとなる。
  # クラスメソッドは、インクルードしたり継承したクラスから呼び出すことは出来ないが、
  # モジュールから直接呼び出すことができる。
  def self.hello
    'Hello!!'
  end

  # 関数を定義しただけでは呼び出せないので、 モジュールメソッドとして定義する。
  module_function :v
end

puts MyModule.v      # 1.0
puts MyModule.hello  # Hello!

# クラスにインクルードする。
# インクルードされたモジュールに定義されたメソッドは、インスタンスメソッドとして組み込まれる。
class MyClass
  include MyModule
end

myClass = MyClass.new
p myClass.add(1, 5) # 8


## メソッド定義
#    メソッドは def メソッド名[(引数, ..)] で開始し、end で終了する。
#    クラスやモジュールに定義した場合には、そのクラスのインスタンスからしかメソッドの呼び出しを行えない。
#    クラスやモジュールに属さないメソッドを定義した場合には、どこからでも呼び出すことができる。

def add(x, y)
  x + y
end

puts add(3, 5)

# また、コンンストラクタは initialize というメソッド名で定義する。
# @name は、メンバ変数を意味している。

class User
  def initialize(name)
    @name = name
  end
end

p User.new('サム') # 結果 => #<User:0x007fa07c9189c0 @name="サム">


# メソッドにはデフォルト値を指定することができる。
# 基本的に1つでもデフォルト値を指定した場合には、全ての引数にデフォルト値を指定すること。

def add(x = 0, y = 0)
  x + y
end

puts add() # 結果 => 0


# 可変長引数を受け取りたい場合には、引数の直前に * を付ける。

def variable_args(*args)
  p args
end

variable_args(1, 2, 3) # 結果 => [1, 2, 3]
