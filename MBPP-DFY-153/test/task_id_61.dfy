predicate IsDigit(c: char)
{
    48 <= c as int <= 57
}

method CountSubstringsWithSumOfDigitsEqualToLength(s: string) returns (count: int)
    ensures count >= 0
{
    count := 0;
    for i := 0 to |s|
        invariant 0 <= i <= |s|
    {
        var sum := 0;
        for j := i to |s|
            invariant i <= j <= |s|
            invariant sum >= 0
            invariant sum <= j - i
        {
            if j == |s| || !IsDigit(s[j]) {
                if sum == j - i {
                    count := count + 1;
                }
                break;
            }
            sum := sum + (s[j] as int - 48);
            if sum > j - i + 1 {
                break;
            }
        }
    }
    
}

method CountSubstringsWithSumOfDigitsEqualToLengthTest() {
    var res1:= CountSubstringsWithSumOfDigitsEqualToLength("112112");
    print(res1);print("\n");
    //assert res1==6;
    var res2:= CountSubstringsWithSumOfDigitsEqualToLength("111");
    print(res2);print("\n");
    //assert res2==6;
    var res3:= CountSubstringsWithSumOfDigitsEqualToLength("1101112");
    print(res3);print("\n");
    //assert res3==12;
}

method Main(){
    CountSubstringsWithSumOfDigitsEqualToLengthTest();
}