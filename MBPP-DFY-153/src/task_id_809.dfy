method IsSmaller(a: seq<int>, b: seq<int>) returns (result: bool)
    requires |a| == |b|
    ensures result <==> forall i :: 0 <= i < |a| ==> a[i] > b[i]
    ensures !result <==> exists i :: 0 <= i < |a| && a[i] <= b[i]
{
    result := true;
    for i := 0 to |a|
        invariant 0 <= i <= |a|
        invariant result <==> forall k :: 0 <= k < i ==> a[k] > b[k]
        invariant !result <==> exists k :: 0 <= k < i && a[k] <= b[k]
    {
        if a[i] <= b[i]
        {
            result := false;
            break;
        }
    }
}