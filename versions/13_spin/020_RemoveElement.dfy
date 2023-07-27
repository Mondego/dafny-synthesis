method RemoveElement(s: array<int>, k: int) returns (v: array<int>)
{
    v := new int[s.Length - 1];
    var i := 0;
    while i < k
    {
        v[i] := s[i];
        i := i + 1;
    }
    assert forall i :: 0 <= i < k ==> v[i] == s[i];
    while i < v.Length
    {
        v[i] := s[i + 1];
        i := i + 1;
    }
}
