method IsProductEven(a: array<int>) returns (isEven: bool)
{
    isEven := false;
    for i := 0 to a.Length
        invariant 0 <= i <= a.Length
        invariant isEven <==> exists k :: 0 <= k < i && a[k] % 2 == 0
    {
        if a[i] % 2 == 0
        {
            isEven := true;
            break;
        }
    }
}
