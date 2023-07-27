method Reverse(a: array<int>)
{
	var l := a.Length - 1;
	var i := 0;
	while (i < l-i)
		invariant 0 <= i <= (l+1)/2;
		invariant forall k :: 0 <= k < i || l-i < k <= l ==> a[k] == old(a[l-k]);
		invariant forall k :: i <= k <= l-i ==> a[k] == old(a[k]);
	{
		a[i], a[l-i] := a[l-i], a[i];
		i := i + 1;
	}
}

method ReverseUptoK(s: array<int>, k: int)
{
	var l := k - 1;
	var i := 0;
	while (i < l-i)
		invariant 0 <= i <= (l+1)/2;
		invariant forall p :: 0 <= p < i || l-i < p <= l ==> s[p] == old(s[l-p]);
		invariant forall p :: i <= p <= l-i ==> s[p] == old(s[p]);
        invariant forall p :: k <= p < s.Length ==> s[p] == old(s[p])
	{
		s[i], s[l-i] := s[l-i], s[i];
		i := i + 1;
	}

}
