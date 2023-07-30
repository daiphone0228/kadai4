#!/bin/bash

# TEST_CASE=("テストケース名" "引数" "正常or異常" "期待される結果")
TEST_CASE1=("正常(引数1 < 引数2)" "4 10" "TRUE" "2")
TEST_CASE2=("正常(引数1 > 引数2)" "28 21" "TRUE" "7")
TEST_CASE3=("異常(引数なし)" "" "FALSE" "ERROR")
TEST_CASE4=("異常(引数1つ)" "4" "FALSE" "ERROR")
TEST_CASE5=("異常(引数3つ)" "4 10 24" "FALSE" "ERROR")
TEST_CASE6=("異常(引数1がマイナス)" "-4 10" "FALSE" "ERROR")
TEST_CASE7=("異常(引数2がマイナス)" "28 -21" "FALSE" "ERROR")
TEST_CASE8=("正常(引数1が0)" "0 10" "TRUE" "10")
TEST_CASE9=("正常(引数2が0)" "23 0" "TRUE" "23")
TEST_CASE10=("異常(引数1が文字列)" "thirty 10" "FALSE" "ERROR")
TEST_CASE11=("異常(引数2が文字列)" "4 fourteen" "FALSE" "ERROR")
TEST_CASE12=("異常(引数1が浮動小数点数)" "23.5 12" "FALSE" "ERROR")
TEST_CASE13=("異常(引数2が浮動小数点数)" "12 18.4" "FALSE" "ERROR")
TEST_CASE_COUNT=13

# テスト配列を回す
for NUM in `seq 1 ${TEST_CASE_COUNT}`; do
    CASE_TITLE="\${TEST_CASE${NUM}[0]}"
    GCD_ARGUMENTS="\${TEST_CASE${NUM}[1]}"
    CASE_TYPE="\${TEST_CASE${NUM}[2]}"
    EXPECTED_RESULT="\${TEST_CASE${NUM}[3]}"
    RESULT=`./gcd.sh $(eval echo ${GCD_ARGUMENTS})`

    MESSAGE=`eval echo case${NUM}:${CASE_TITLE}`

    if [ `eval echo ${CASE_TYPE}` == TRUE ] ; then
        EXPECT=`eval echo ${EXPECTED_RESULT}`
        if [[ ${RESULT} -eq ${EXPECT} ]] ; then
            echo "${MESSAGE} OK"
        else
            echo -e "${MESSAGE} NG"
        fi
    else
        EXPECT=`eval echo ${EXPECTED_RESULT}`
        if [[ ${RESULT} =~ ${EXPECT} ]] ; then
            echo "${MESSAGE} OK"
        else
            echo -e "${MESSAGE} NG"
        fi
    fi
done

echo  "Finished all tests"