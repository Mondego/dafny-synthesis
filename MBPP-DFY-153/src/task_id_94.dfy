method MinSecondValueFirst(s: array<seq<int>>) returns (firstOfMinSecond: int)
    requires s.Length > 0
    requires forall i :: 0 <= i < s.Length ==> |s[i]| >= 2
    ensures exists i :: 0 <= i < s.Length && firstOfMinSecond == s[i][0] && 
        (forall j :: 0 <= j < s.Length ==> s[i][1] <= s[j][1])
{
    var minSecondIndex := 0;
    for i := 1 to s.Length
        invariant 0 <= i <= s.Length
        invariant 0 <= minSecondIndex < i
        invariant forall j :: 0 <= j < i ==> s[minSecondIndex][1] <= s[j][1]
    {
        if s[i][1] < s[minSecondIndex][1]
        {
            minSecondIndex := i;
        }
    }
    firstOfMinSecond := s[minSecondIndex][0];
}