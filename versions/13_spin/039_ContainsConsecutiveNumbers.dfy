method ContainsConsecutiveNumbers(a: array<int>) returns (result: bool)
{
    result := false;
    for i := 0 to a.Length - 1
    {
        if a[i] + 1 == a[i + 1] {
            result := true;
            break;
        }
    }
}
