method CubeElements(a: array<int>) returns (cubed: array<int>)
    ensures cubed.Length == a.Length
    ensures forall i :: 0 <= i < a.Length ==> cubed[i] == a[i] * a[i] * a[i]
{
    var cubedArray := new int[a.Length];
    for i := 0 to a.Length
    {
        cubedArray[i] := a[i] * a[i] * a[i];
    }
    return cubedArray;
}
