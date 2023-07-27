method IsGreater(n: int, a: array<int>) returns (result: bool)
    requires a != null
    ensures result ==> forall i :: 0 <= i < a.Length ==> n > a[i]
    ensures !result ==> exists i :: 0 <= i < a.Length && n <= a[i]
{
    result := true;
    var i := 0;
    while i < a.Length
    {
        if n <= a[i] {
            result := false;
            break;
        }
        i := i + 1;
    }
}
