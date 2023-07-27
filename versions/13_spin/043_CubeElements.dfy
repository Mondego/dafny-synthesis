method CubeElements(a: array<int>) returns (cubed: array<int>)
{
    var cubedArray := new int[a.Length];
    for i := 0 to a.Length
    {
        cubedArray[i] := a[i] * a[i] * a[i];
    }
    return cubedArray;
}
