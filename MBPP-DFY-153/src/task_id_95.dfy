method SmallestListLength(s: seq<seq<int>>) returns (v: int)
    requires |s| > 0
    ensures forall i :: 0 <= i < |s| ==> v <= |s[i]|
    ensures exists i :: 0 <= i < |s| && v == |s[i]|
{
    v := |s[0]|;
    for i := 1 to |s|
        invariant 0 <= i <= |s|
        invariant forall k :: 0 <= k < i ==> v <= |s[k]|
        invariant exists k :: 0 <= k < i && v == |s[k]|
    {
        if |s[i]| < v
        {
            v := |s[i]|;
        }
    }
}