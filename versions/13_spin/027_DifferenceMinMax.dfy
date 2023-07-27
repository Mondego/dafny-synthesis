
method DifferenceMinMax(a: array<int>) returns (diff: int)
{
    var minVal := a[0];
    var maxVal := a[0];

    for i := 1 to a.Length
    {
        if a[i] < minVal {
            minVal := a[i];
        } else if a[i] > maxVal {
            maxVal := a[i];
        }
        assert a[..i+1][..i] == a[..i];
    }
    assert a[..a.Length] == a[..];
    diff := maxVal - minVal;
}

function Min(a: seq<int>) : int
{
    if |a| == 1 then a[0]
    else
        var minPrefix := Min(a[..|a|-1]);
        if a[|a|-1] <= minPrefix then a[|a|-1] else Min(a[..|a|-1])
}

function Max(a: seq<int>) : int
{
    if |a| == 1 then a[0]
    else
        var maxPrefix := Max(a[..|a|-1]);
        if a[|a|-1] >= maxPrefix then a[|a|-1] else Max(a[..|a|-1])
}

