# オブジェクトの型変換

# 文字列 => 数値
str = "10"

p str.to_i # to_i メソッド：整数
p str.to_f # to_f メソッド：浮動小数


# 数値 => 文字列
num = 20

p num.to_s # to_s メソッド


# ハッシュ => 配列
scores = { tanaka: 90, sato: 50 }

p scores.to_a # to_a メソッド

# ハッシュを配列に変換すると、key と value の配列の配列になる。
# 実行結果 => [[:tanaka, 90], [:sato, 50]]


# 配列 => ハッシュ
colors = ["white", "black", "blue", "red"] # 1次元配列はハッシュに変換不可能
colors = [["while", "black"], ["blue", "red"]]

p colors.to_h # to_h メソッド  => {"while"=>"black", "blue"=>"red"}

# ただし、一次配列をハッシュにすることはできない。
# 2次元配列で [[key, value], [key, value], ...] の形式でなければならない。