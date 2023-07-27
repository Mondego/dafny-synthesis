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
