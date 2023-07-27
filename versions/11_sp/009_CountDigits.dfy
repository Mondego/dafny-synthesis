predicate IsDigit(c: char)
{
    48 <= c as int <= 57
}


method CountDigits(s: string) returns (count: int)
{
    var digits := set i: int | 0 <= i < |s| && IsDigit(s[i]);
    count := |digits|;
}

