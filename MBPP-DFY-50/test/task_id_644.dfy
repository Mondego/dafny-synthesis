method Reverse(a: array<int>)
  modifies a;
  ensures forall k :: 0 <= k < a.Length ==> a[k] == old(a[(a.Length-1) - k]);
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
  modifies s
  requires 2 <= k <= s.Length
  ensures forall i :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  ensures forall i :: k <= i < s.Length ==> s[i] == old(s[i])
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

method assertArrayEquals(a1: array<int>, a2: array<int>) returns (res: bool)
{
  if (a1.Length != a2.Length) {
    res := false;
  } else {
    var equal := true;
    var i := 0;
    while i < a1.Length && equal

    {
      if (a1[i] != a2[i]) {
        equal := false;
      }
      i := i + 1;
    }
    res := equal;
  }
}



method ReverseUptoKTest(){
  
  var a1:= new int[] [1, 2, 3, 4, 5, 6];
  ReverseUptoK(a1,4);
  var exp1:= new int[] [4, 3, 2, 1, 5, 6];
  var out1:=assertArrayEquals(exp1,a1);
  expect out1==true;

  var a2:= new int[] [4, 5, 6, 7];
  ReverseUptoK(a2,2);
  var exp2:= new int[] [5, 4, 6, 7];
  var out2:=assertArrayEquals(exp2,a2);
  expect out2==true;

  var a3:= new int[] [9, 8, 7, 6, 5];
  ReverseUptoK(a3,3);
  var exp3:= new int[] [7, 8, 9, 6, 5];
  var out3:=assertArrayEquals(exp3,a3);
  expect out3==true;

}

method Main(){
  ReverseUptoKTest();
}

