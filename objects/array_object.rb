# 配列オブジェクト

# 配列は [] の中に、要素を格納していく
colors = ["red", "green", "yellow", "blue"]

# 要素へのアクセス
p colors[0]     # 添字は 0 から
p colors[-1]    # 負数にすると末尾から取得する
p colors[0..2]  # 0 ~ 2 の要素を取得する
p colors[0...2] # 0 ~ 2 の直前まで（0 ~1）取得する
p colors[10]    # 範囲外なら nil が返る


# 要素への再代入
colors[0] = "white"
colors[1..2] = ["purple", "black"]

p colors  # ["white", "purple", "black", "blue"]

# 要素の追加
colors.push("brown") # pushメソッドは末尾に要素を追加する
colors << "orange"   # pushの糖衣構文として、 << が用意されている。

p colors # ["white", "purple", "black", "blue", "brown", "orange"]


# 他のメソッド

p colors.size # 要素数を取得する   => 6
p colors.sort # 自然順序で並び替え => ["black", "blue", "brown", "orange", "purple", "white"]

