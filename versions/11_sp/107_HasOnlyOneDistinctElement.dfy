method HasOnlyOneDistinctElement(a: array<int>) returns (result: bool)
{
    if a.Length == 0 {
        return true;
    }

    var firstElement := a[0];
    result := true;

    for i := 1 to a.Length
        invariant 1 <= i <= a.Length
        invariant result ==> forall k :: 0 <= k < i ==> a[k] == firstElement
    {
        if a[i] != firstElement {
            result := false;
            break;
        }
    }
}
