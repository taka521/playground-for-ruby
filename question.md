# 疑問点メモ

Rubyの勉強中に疑問に思ったことと、その解を記載していくところ。


## Q.クラスとモジュールの違いは？

クラスとモジュール、メソッドの定義もできるし違いが分からん。

### A. モジュールはインスタンス化不可能なクラス

Rubyのクラスは単一継承しか許されていない。  
が、時には異なる性質をもったクラスを作成したい場合がある。  
しかし、多重継承は許されていないのでクラスだけでは実現できない。  
そこでモジュールを使用する。

モジュールは **インスタンス不可能な、継承関係を持てないクラス** のこと。

定数やメソッドをまとめたり、クラスに組み込んで(Mix-Inして)多重継承を実現したりできる。  
また、名前空間として使用することもあるらしい。

Javaのinterfaceに近い印象だけど、モジュールとinterfaceは使い道が異なるので一緒にしちゃダメだよなぁ...。  



## Q.yieldってなに？

Scalaとかでも見るけど、yieldってなに？
どこで使うん?

### A.


## Q.selfの意味は?

公式サイトにも self って書いてるけど、何を表している？
あと、使い所は？

### A.



## Q.メソッド呼び出しの `.` と `::` の違いは?

`Hoge.new` も `Hoge::new` もできるけど、違いは？
あと、その使い分けは？

### A.



## Q.Rubyのパッケージ管理ツールは?

Javaだと Maven や Gradle にあたるようなツール。

### A.



## Q.Rubyのテスティングフレームワークは何?

JavaでいうところのJUnit的な。RSpecとかいうやつ？

### A.



## Q.

### A.

