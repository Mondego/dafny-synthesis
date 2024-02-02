method HasOnlyOneDistinctElement(a: array<int>) returns (result: bool)
    requires a != null
    ensures result ==> forall i, j :: 0 <= i < a.Length && 0 <= j < a.Length ==> a[i] == a[j]
    ensures !result ==> exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && a[i] != a[j]
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