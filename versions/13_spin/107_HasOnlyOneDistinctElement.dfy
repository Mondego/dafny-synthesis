method HasOnlyOneDistinctElement(a: array<int>) returns (result: bool)
{
    if a.Length == 0 {
        return true;
    }

    var firstElement := a[0];
    result := true;

    for i := 1 to a.Length
    {
        if a[i] != firstElement {
            result := false;
            break;
        }
    }
}
