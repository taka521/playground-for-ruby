# 制御構造（繰り返し）

## while
#    式を評価した値が真の間、本体を繰り返し実行する。

counter = 0

while counter < 5
  puts "#{counter} : hello"
  counter += 1
end


## while 修飾子
#    簡易版のwhile。
#    右辺の式を評価した値が真の間、左辺の式を評価する。

counter = 0
puts "#{counter += 1} : world" while counter < 3

# また、Java などの do-while 相当のループを行いたい場合には、 begin節を用いる。

counter = 0
begin
  puts "#{counter} 回目"
end while counter === 5


## until
#    式を評価した値が真になるまで、本体を繰り返し実行する。
#    つまりは、式を評価した値が偽の間は、処理が繰り返される。

random = rand(1..5)
until random === 5
  puts "random is #{random}"
  random = rand(1..5)
end


## until 修飾子
#    簡易版の until 。
#    右辺の式を評価した値が真になるまで、左辺の式を評価する。

puts 'Hello!' until rand(0..4) === 0

# また、Java などの do-while 相当のループを行いたい場合には、begin節を用いる。

begin
  puts 'World!'
end until rand(0..1) == 0


## for
#    式を評価した結果のオブジェクトの各要素に対し、本体を繰り返し実行する。

# 配列
colors = %w(red blue yellow)
for color in colors
  p color
end

# ハッシュ
scores = { tanaka: 50, saito: 60 }
for key, value in scores
  p "key = #{key}, value = #{value}"
end

# また、eachメソッドを使用して同じような繰り返し処理が可能になる。
# each メソッドは、集合を扱うオブジェクトに定義されているメソッドなので、 配列やハッシュで使用できる。

colors.each { |color| p color }
scores.each { |key, value| p "key = #{key}, value = #{value}" }


## break, next, redo
#    break ... 最も内側のループを抜ける
#    next  ... 最も内側のループの次の繰り返しにジャンプする。Javaでいうcontinue。
#    redo  ... ループ条件のチェックを行わずに、現在の繰り返しをやり直す。

for i in 1..6
  if i == 5
    break
  elsif i == 2
    next
  elsif i == 3
    i += 1
    redo
  end
  p i
end
