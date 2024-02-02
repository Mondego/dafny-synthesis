method MaxLengthList(lists: seq<seq<int>>) returns (maxList: seq<int>)
    requires |lists| > 0
    ensures forall l :: l in lists ==> |l| <= |maxList|
    ensures maxList in lists
{
    maxList := lists[0];

    for i := 1 to |lists|
        invariant 1 <= i <= |lists|
        invariant forall l :: l in lists[..i] ==> |l| <= |maxList|
        invariant maxList in lists[..i]
    {
        if |lists[i]| > |maxList| {
            maxList := lists[i];
        }
    }
}