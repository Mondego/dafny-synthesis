method FindSmallest(s: array<int>) returns (min: int)
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
