predicate IsOdd(x: int)
{
    x % 2 != 0
}

method FindFirstOdd(a: array<int>) returns (found: bool, index: int)
{
    found := false;
    index := 0;
    while (index < a.Length)
    {
        if IsOdd(a[index])
        {
            found := true;
            return;
        }
        index := index + 1;
    }
}
