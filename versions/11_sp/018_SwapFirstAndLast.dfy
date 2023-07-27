method SwapFirstAndLast(a: array<int>)
{
    var tmp := a[0];
    a[0] := a[a.Length - 1];
    a[a.Length - 1] := tmp;
}
