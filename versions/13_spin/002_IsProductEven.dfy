method IsProductEven(a: array<int>) returns (isEven: bool)
{
    isEven := false;
    for i := 0 to a.Length
    {
        if a[i] % 2 == 0
        {
            isEven := true;
            break;
        }
    }
}
