method ElementWiseModulo(a: array<int>, b: array<int>) returns (result: array<int>)
{
    result := new int[a.Length];
    var i := 0;
    while i < a.Length
    {
        result[i] := a[i] % b[i];
        i := i + 1;
    }
}
