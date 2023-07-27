method IsSorted(a: array<int>) returns (sorted: bool)
{
    sorted := true;
    for i := 0 to a.Length - 1
    {
        if a[i] > a[i + 1]
        {
            sorted := false;
            break;
        }
    }
    sorted := sorted;
}
