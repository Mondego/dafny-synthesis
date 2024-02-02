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

method PrintArray(arr:array<int>)
{
  print("[");
  for i:= 0 to arr.Length{
    print(arr[i]);
    if (i<(arr.Length-1))
    {
      print(",");
    }
  }
  print("]");
  print("\n");

}



method ReverseUptoKTest(){
  var a1:= new int[] [1, 2, 3, 4, 5, 6];
  ReverseUptoK(a1,4);
  PrintArray(a1);
  //expected [4, 3, 2, 1, 5, 6]

  var a2:= new int[] [4, 5, 6, 7];
  ReverseUptoK(a2,2);
  PrintArray(a2);
  //expected [5, 4, 6, 7]

  var a3:= new int[] [9, 8, 7, 6, 5];
  var e3:= new int[] [7, 8, 9, 6, 5];
  ReverseUptoK(a3,3);
  PrintArray(a3);
  //expected [7, 8, 9, 6, 5]


}

method Main(){
  ReverseUptoKTest();
}

