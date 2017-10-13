# 文字列

# 書式付き文字列
#   書式付き文字列は  文字列 % 値  の形式で定義する
#   値が複数の場合は、配列を渡す

# 文字列の埋め込み

p "name: %s" % '田中'   # %s は文字列
p "name: %5s" % '田中'  # % と s の間に数値を入れることで、値の直前に数値分の半角スペースが入る
p "name: %-5s" % '田中' # 負数を指定すると、値の直後に数値分の半角スペースが入る
p "firstName: %s, lastName: %s" % ['太郎', '田中']
puts

# 〜実行結果〜
# "name: 田中"
# "name:    田中"
# "name: 田中   "
# "firstName: 太郎, lastName: 田中"


# 数値の埋め込み

p "integer: %d" % 10  # %d は数値
p "float: %f" % 1.0   # %f は浮動小数

p "integer: %5d" % 10   # 桁数を指定したい場合には、% と d の間に桁数を入れる
p "float: %10f" % 1.0   # 浮動小数でも同じ

p "integer: %05d" % 10   # 0埋めしたい場合には、桁数の前に 0 を入れる
p "float: %10.5f" % 1.0  # 浮動小数の場合、  整数部.小数部   でフォーマットを指定できる
puts

# 〜実行結果〜
# "integer: 10"
# "float: 1.000000"
# "integer:    10"
# "float:   1.000000"
# "integer: 00010"
# "float:    1.00000"


# printf メソッド
# printf メソッドは書式付き文字列を扱うメソッド

printf("name: %s\n", "田中")
printf("firstName: %s, lastName: %s\n", "太郎", "田中")

# 実行結果
# name: 田中
# firstName: 太郎, lastName: 田中
