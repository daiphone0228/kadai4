# kadai4

## 概要

本リポジトリは最大公約数を計算するスクリプトです。

## 事前準備

本リポジトリをクローンし、クローンしたリポジトリのディレクトリに移動してください。

```
$ git clone git@github.com:daiphone0228/kadai4.git
$ cd kadai4
```

## スクリプト実行手順

任意の自然数を2つ引数に指定して、以下コマンドを実行してください。

```
$ bash gcd.sh 20 24
4           # 結果が出力されます
```

引数の指定が2つ未満もしくは3つ以上の場合または自然数以外を指定した場合、エラーになります。

```
$ bash gcd.sh 24
[ERROR!] wrong number of arguments (expected 2)

$ bash gcd.sh one two
[ERROR!] one is not natural number!
```

## テストスクリプト実行手順

以下コマンドを実行してください。

テスト結果が出力されます。

```
$ bash gcd_test.sh
case1:正常(引数1 < 引数2)
TEST_CASE1 OK
case2:正常(引数1 > 引数2)
TEST_CASE2 OK
case3:異常(引数なし)
TEST_CASE3 OK
case4:異常(引数1つ)
TEST_CASE4 OK
case5:異常(引数3つ)
TEST_CASE5 OK
case6:異常(引数1がマイナス)
TEST_CASE6 OK
case7:異常(引数2がマイナス)
TEST_CASE7 OK
case8:正常(引数1が0)
TEST_CASE8 OK
case9:正常(引数2が0)
TEST_CASE9 OK
case10:異常(引数1が文字列)
TEST_CASE10 OK
case11:異常(引数2が文字列)
TEST_CASE11 OK
case12:異常(引数1が浮動小数点数)
TEST_CASE12 OK
case13:異常(引数2が浮動小数点数)
TEST_CASE13 OK
Finish all tests
```

## GitHub Actions実行手順

本リポジトリに対してpushが行われると、前述のテストスクリプトが自動で実行されるようになっております。
