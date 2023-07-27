method HasCommonElement(a: array<int>, b: array<int>) returns (result: bool)
{
    result := false;
    for i := 0 to a.Length
    {
        for j := 0 to b.Length
        {
            if a[i] == b[j] {
                result := true;
                return;
            }
        }
    }
}
