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
#     既存のモジュールと同じ名前のモジュールを定義した場合、既存モジュールに対する追加定義となる。

module MyModule
  def method
  end
end