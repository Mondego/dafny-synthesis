method IsProductEven(a: array<int>) returns (isEven: bool)
    requires a.Length > 0
    ensures isEven <==> exists i :: 0 <= i < a.Length && a[i] % 2 == 0
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
