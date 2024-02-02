predicate IsUpperCase(c: char)
{
    65 <= c as int <= 90
}

method CountUppercase(s: string) returns (count: int)
    ensures count >= 0
    ensures count == | set i: int | 0 <= i < |s| && IsUpperCase(s[i])|
{
    var uppercase := set i: int | 0 <= i < |s| && IsUpperCase(s[i]);
    count := |uppercase|;
}