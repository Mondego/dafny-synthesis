method SmallestMissingNumber(s: seq<int>) returns (v: int)
    requires forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
    requires forall i :: 0 <= i < |s| ==> s[i] >= 0
    ensures 0 <= v
    ensures v !in s
    ensures forall k :: 0 <= k < v ==> k in s
{
    ghost var not_missing : seq<int> := [];
    v := 0;
    for i := 0 to |s|
        invariant 0 <= i <= |s|
        invariant v == i
        invariant v !in s[..i]
        invariant not_missing == s[..i] 
//        invariant forall k :: 1 <= k < i ==> not_missing[v - 1] + 1 == v
//        invariant forall k :: 0 <= k < i ==> not_missing[k] == k
        invariant forall k :: 0 <= k < i ==> s[k] == k
//        invariant forall k :: 0 <= k < i ==> k in not_missing 
        invariant forall k :: 0 <= k < i ==> k in s[..i]
        invariant forall k :: i <= k < |s| ==> k !in s[..i]
        invariant forall m, n :: i <= m < n < |s| ==> s[m] <= s[n] // from precondition
    {
        if i == |s| || s[i] != v
        {
            break;
        }
        not_missing := not_missing + [v];
        v := v + 1;
    }
    assert v !in not_missing;
    assert v >= 1 ==> v == not_missing[v-1] + 1;
}

lemma NotIn(s: seq<int>, not_missing: seq<int>, v: int)
    requires forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
    requires forall i :: 0 <= i < |s| ==> s[i] >= 0
    requires 0 <= v <= |s|
    requires not_missing == s[..v] 
    requires forall k :: k in not_missing ==> k in s
    requires forall k :: k in s[..v] ==> k in not_missing
    requires v !in s[..v]
    requires (s == [] && v == 0) || (s != [] && v > 0 && v == s[v-1] + 1)

    ensures v !in s
{
    if s == [] {
        assert v !in s;
    }
    else {
        assert |s| >= 1;
        assert v >= 1;
        assert v == s[v-1] + 1;
        assert v !in not_missing;
        if |s| == v {
            assert v == s[v-1]+1;
            assert v !in s;
        }
        else { // |s| > v
            assert s[v-1] <= s[v];
            assert s[v-1] in s[..v];
//            assert forall i, j :: v <= i < j < |s| ==> s[i] <= s[j];
            assert v != s[v];
        }
    }
}

/*
method SmallestMissingNumber(s: seq<int>) returns (v: int)
    requires forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
    requires forall i :: 0 <= i < |s| ==> s[i] >= 0
    ensures 0 <= v
    ensures v !in s
    ensures forall k :: 0 <= k < v ==> k in s
{
    v := 0;
    var i := 0;
    while i < |s|
        invariant 0 <= i <= |s|
        invariant v == i
        invariant v !in s[..i]
        invariant forall k :: 0 <= k < v && s[k] == v ==> k in s[..i] 
        invariant forall k :: 0 <= k < v && s[k] != v ==> v !in s[..i]
        invariant forall k, j :: 0 <= k < j < v ==> s[k] <= s[j]
        invariant forall k :: v <= k < |s| ==> v !in s[k..]
    {
//        assert forall k :: 0 <= k < v ==> k in s[..i];
        if s[i] == v
        {
            v := v + 1;
        }
        else
        {
            break;
        }
        i := i + 1;
//        assert forall k :: 0 <= k < v ==> k in s[..i];
    }
}
*/