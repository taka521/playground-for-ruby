# ハッシュオブジェクト
#   連想配列のこと。Javaでいう、Mapにあたる。

# ハッシュは {} の中に、 key => value の形式で要素を格納する。
scores = { "tanaka" => 10, "sato" => 20 } # key と value は何でもいい
scores = { :tanaka => 10, :sato => 20 }   # Rubyでは、key に symbol を使うことが多いらしい（ :key が symbol）
scores = { tanaka: 10, sato: 20 }         # また key: value の形式でも定義することができる。直前のやつと同じ意味になる。


# 要素へのアクセス
p scores[:tanaka]      # 変数[key] の形式で value を取得できる
scores[:tanaka] = 100  # value の再代入も同じ
p scores               # {:tanaka=>100, :sato=>20}


# メソッド

p scores.size   # 要素の数を取得する
p scores.keys   # keyの一覧を配列で取得する
p scores.values # valueの一覧を配列で取得する
p scores.has_key?(:tanaka) # 指定した key が存在するか
