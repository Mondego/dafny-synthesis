method IsGreater(n: int, a: array<int>) returns (result: bool)
{
    result := true;
    var i := 0;
    while i < a.Length
    {
        if n <= a[i] {
            result := false;
            break;
        }
        i := i + 1;
    }
}
