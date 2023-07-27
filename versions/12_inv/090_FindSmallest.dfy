method FindSmallest(s: array<int>) returns (min: int)
    requires s.Length > 0
    ensures forall i :: 0 <= i < s.Length ==> min <= s[i]
    ensures exists i :: 0 <= i < s.Length && min == s[i]
{
    min := s[0];
    for i := 1 to s.Length
    {
        if s[i] < min
        {
            min := s[i];
        }
    }
}
