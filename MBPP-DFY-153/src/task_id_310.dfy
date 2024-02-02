method ToCharArray(s: string) returns (a: array<char>)
    ensures a.Length == |s|
    ensures forall i :: 0 <= i < |s| ==> a[i] == s[i]
{
    a := new char[|s|];
    for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant a.Length == |s|
    invariant forall k :: 0 <= k < i ==> a[k] == s[k]
    {
        a[i] := s[i];
    }
}