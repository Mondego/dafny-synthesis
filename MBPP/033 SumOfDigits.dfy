method SumOfDigits(number: int) returns (sum: int)
    requires number >= 0
    ensures sum >= 0
    ensures sum == Sum(NumberToSeq(number))
{
    var n := number;
    ghost var digits: seq<int> := [];
    ghost var i := 0;
    sum := 0;
    while n > 0
        invariant 0 <= n <= number
        invariant sum >= 0
//        invariant sum == SumDigits(number % (number/n * 10))
//        invariant digits == NumberToSeq(n)
//        invariant sum == Sum(NumberToSeq(n))
    {
        var digit := n % 10;
        sum := sum + digit;
        digits := digits + [digit];
        assert digits == NumberToSeq(n);
        n := n / 10;
        i := i + 1;
    }

}

function NumberToSeq(number: int) : seq<int>
    requires number >= 0
{
    if number == 0 then []
    else [number % 10] + NumberToSeq(number/10)
}

function Sum(digits: seq<int>) : int
{
    if |digits| == 0 then 0 else digits[0] + Sum(digits[1..])
}

function SumDigits(n: int) : int
    requires n >= 0
{
    if n == 0 then 0 
    else n % 10 + SumDigits(n/10)
}
