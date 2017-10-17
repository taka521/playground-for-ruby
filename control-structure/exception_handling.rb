# 制御構造（例外処理）

## raise
#    例外を発生させる命令。
#    ~文法~
#      raise
#      raise [message or exception]
#      raise error_type, message
#      raise error_type, message, back_trace

# 1つ目の形式は、直前の例外を再発生させるもの。
# 2つ目の形式は、引数が文字列であった場合に、その文字列をメッセージとした RuntimeError を発生させる。
# もしも文字列ではなく例外オブジェクトであれば、その例外を発生させる。
# 3つ目の形式は、第一引数で指定された例外を、第二引数のメッセージとして発生させる。
# 4つ目の形式は、第三引数に $@ または Kernel.#caller で得られるスタック情報を格納する。（例外が発生した場所を示す）


## 例外の捕捉
#    例外を補足する場合には、begin節の中で rescue節 を使用する。
#    rescue節に何も指定しない場合、StandardError のサブクラスである全ての例外を捕捉する。
#      補足する例外を限定したい場合には、rescue に続けて補足したい error_type を指定する。
#      1つの rescue節で複数の例外を捕捉したい場合には、カンマ区切りで例外を列挙していく。
#    補足した例外オブジェクトを参照したい場合には、$! を使って参照できる。
#      もしくは rescue => 変数 のようにすれば、指定した変数に例外オブジェクトが設定され参照できる。
#    また else節 には例外が発生しなかった場合の処理を記載する。
#      else節 は省略可能。
#    begin式全体の評価値は、本体/rescue節/else節 のうち最後に評価された式の値となる。
#      各節において式が存在しなかった場合には、nilが返る。
#      また、ensure節の値は無視される。

begin
  raise 'error!!'
rescue
  puts '例外をキャッチ!'
end

begin
  raise 'error'
rescue SyntaxError, IOError => e
  puts 'throw syntax error!!'
rescue RuntimeError => e
  p $! # 例外オブジェクトが代入される
  p e  # 例外オブジェクトが代入される
  p $@ # バックトレースが代入される
  puts 'throw runtime error!!'
rescue
  puts '想定していない例外!'
ensure
  puts 'ensure節 は begin節 を終了する直前に必ず実行される'
end

# 自前の例外を作成する場合には、StandardError を継承して作成すること。
#   上にも記載しているが、rescue節で補足する例外を省略した場合には StandardError のサブクラスを指定したことになる。
#   StandardError を継承しておけば、rescue節で独自例外を捕捉することができる。
#   Exception を継承してしまうと、具象型を指定しない限り rescue節 では捕捉できないのでバグの原因になる可能性が高い。


## rescue修飾子
#    rescue節の簡易版。
#      式1 rescue 式2  => 式1で例外が発生した場合に、式2 を評価する。なお、捕捉する例外は指定できない。

result = open("tempFile.txt") rescue 'ファイルがないよ!'
p result # 結果 => "ファイルがないよ!"
