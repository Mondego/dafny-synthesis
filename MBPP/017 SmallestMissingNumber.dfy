method SmallestMissingNumber(s: seq<int>) returns (v: int)
    requires forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
    requires forall i :: 0 <= i < |s| ==> s[i] >= 0
    ensures 0 <= v
    ensures v !in s
    ensures forall k :: 0 <= k < v ==> k in s
{
    v := 0;
    for i := 0 to |s|
        invariant 0 <= i <= |s|
        invariant 0 <= v <= i
        invariant v !in s[..i]
        invariant forall k :: 0 <= k < v && s[k] != v ==> k in s[..i]
    {
        if s[i] > v
        {
            break;
        }
        else
        {
            if s[i] == v 
            {
                v := v + 1;
            }
        }
    }
    assert forall k :: 0 <= k < v && s[k] != v ==> k in s;
}