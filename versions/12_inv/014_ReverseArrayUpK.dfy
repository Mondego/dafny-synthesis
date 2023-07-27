method Reverse(a: array<int>)
	modifies a;
	ensures forall k :: 0 <= k < a.Length ==> a[k] == old(a[(a.Length-1) - k]);
{
	var l := a.Length - 1;
	var i := 0;
	while (i < l-i)
	{
		a[i], a[l-i] := a[l-i], a[i];
		i := i + 1;
	}
}

method ReverseUptoK(s: array<int>, k: int)
    modifies s
    requires 2 <= k <= s.Length
    ensures forall i :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
    ensures forall i :: k <= i < s.Length ==> s[i] == old(s[i])
{
	var l := k - 1;
	var i := 0;
	while (i < l-i)
	{
		s[i], s[l-i] := s[l-i], s[i];
		i := i + 1;
	}

}
