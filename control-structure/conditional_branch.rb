# 制御構造（繰り返し）

## if式
#   if [評価式] then ~ end までがブロックになる。（then は省略できる）
#   else が無く、いずれの条件にも一致しない場合には nil が返る。

score = 10

if score % 15 == 0
  puts 'score is FizzBuzz'
elsif score % 3 == 0 then # elseif ではなく elsif なので注意!!
  puts 'score is Fizz'
elsif score % 5 == 0 then
  puts 'score is Buzz'
else
  puts 'score is other'
end


## if修飾子
#   右辺の条件が成立する場合に、左辺の式を評価して返すこともできる。
#   もし右辺の条件が成立しなければ、nil が返る。

puts 'Hello!' if score <= 10


## unless式
#   if式の逆。
#   条件式が 偽(false) の場合に then 以下の式を評価する。(then は省略できる)
#   また if と異なり、elsif を指定することはできない。
#   if と同じように、else 節がない状態 で条件式が偽ではない場合は nil が返る。

unless score < 10
  puts 'score is less than 10'
end


## case式
#    一つの式に対する一致判定を行う。
#    when に指定された値は、 === 演算子を用いて比較を行っている。

color = 'red'

case color
  when 'white'
    puts 'color is white'
  when 'blue', 'yellow' # 複数の値と一致させたい場合には、カンマで区切る
    puts 'color is blue'
  when 'red'
    puts 'color is red'
  when 0..5 # 数値の場合であれば、その範囲を指定できる
    puts 'color is 0..5'
  else
    puts 'color is other'
    # when の何れにも当てはまらない場合に else節 の式が評価される
end

