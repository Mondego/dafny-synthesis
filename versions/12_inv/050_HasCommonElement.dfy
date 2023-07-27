method HasCommonElement(a: array<int>, b: array<int>) returns (result: bool)
    requires a != null && b != null
    ensures result ==> exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j]
    ensures !result ==> forall i, j :: 0 <= i < a.Length && 0 <= j < b.Length ==> a[i] != b[j]
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
