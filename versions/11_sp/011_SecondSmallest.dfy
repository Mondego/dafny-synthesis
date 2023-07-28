function MinPair(s: seq<int>) : (r: int)
{
    if s[0] <= s[1] then s[0] else s[1]
}


function min(s: seq<int>) : (r: int)
{
    if |s| == 2 then MinPair(s)
    else MinPair([s[0], min(s[1..])])
}


method SecondSmallest(s: array<int>) returns (secondSmallest: int)
{
    var minIndex := 0;
    var secondMinIndex := 1;

    if s[1] < s[0] {
        minIndex := 1;
        secondMinIndex := 0;
    }

    for i := 2 to s.Length
    invariant 0 <= i <= s.Length
    invariant 0 <= minIndex < i
    invariant 0 <= secondMinIndex < i
    invariant minIndex != secondMinIndex
    invariant forall k :: 0 <= k < i ==> s[k] >= s[minIndex]
    invariant forall k :: 0 <= k < i && k != minIndex ==> s[k] >= s[secondMinIndex]
    {
        if s[i] < s[minIndex] {
            secondMinIndex := minIndex;
            minIndex := i;
        } else if s[i] < s[secondMinIndex] {
            secondMinIndex := i;
        }
    }

    secondSmallest := s[secondMinIndex];
}