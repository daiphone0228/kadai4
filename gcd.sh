#!/bin/bash

#
# 最大公約数を出力するスクリプト
#

# 入力引数の存在チェック
# 入力なし or 入力1個
# 入力3個以上

# 引数の数をチェック
if [ ${#} -ne 2 ];then
  echo -e "[ERROR!] wrong number of arguments (expected 2)"
  exit 1
fi


# 数値チェック自然数のみ
is_natural_number () {
    # return 0
  if expr "$1" : "^[0-9]*$" > /dev/null 2>&1;then
    return 0
  else
    echo -e "[ERROR!] $1 is not natural number!"
    exit 1
  fi

}

# 最大公約数の計算
gcd () {
    # 1. 引数を x, y (x ≧ y) とする。
    # 2. y = 0 なら、 x を出力してアルゴリズムを終了する。
    # 3. x を y で割った余りを新たに y とし、更に 元のyを新たにx とし 2 に戻る。
    while [ !  0 -eq "$2" ]; do
	    set -- "$2" "`expr "$1" % "$2"`"
	done
	echo "$1"
}

#
# Main処理
#

is_natural_number $1
is_natural_number $2
gcd $1 $2
exit 0