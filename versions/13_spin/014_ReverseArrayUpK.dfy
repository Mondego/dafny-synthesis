method Reverse(a: array<int>)
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
{
	var l := k - 1;
	var i := 0;
	while (i < l-i)
	{
		s[i], s[l-i] := s[l-i], s[i];
		i := i + 1;
	}

}
