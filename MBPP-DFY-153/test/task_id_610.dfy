method RemoveElement(s: array<int>, k: int) returns (v: array<int>)
  requires 0 <= k < s.Length
  ensures v.Length == s.Length - 1
  ensures forall i :: 0 <= i < k ==> v[i] == s[i]
  ensures forall i :: k <= i < v.Length ==> v[i] == s[i + 1]
{
  v := new int[s.Length - 1];
  var i := 0;
  while i < k
    invariant 0 <= i <= k
    invariant forall j :: 0 <= j < i ==> v[j] == s[j]
  {
    v[i] := s[i];
    i := i + 1;
  }
  assert forall i :: 0 <= i < k ==> v[i] == s[i];
  while i < v.Length
    invariant k <= i <= v.Length
    invariant forall j :: k <= j < i ==> v[j] == s[j + 1]
    invariant forall i :: 0 <= i < k ==> v[i] == s[i]
  {
    v[i] := s[i + 1];
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


method RemoveElementTest(){
  var a1:= new int[] [1,1,2,3,4,4,5,1];
  var res1:=RemoveElement(a1,3);
  PrintArray(res1);
  //expected [1,1,2,4,4,5,1]

  var a2:= new int[] [0, 0, 1, 2, 3, 4, 4, 5, 6, 6, 6, 7, 8, 9, 4, 4];
  var res2:=RemoveElement(a2,4);
  PrintArray(res2);
  //expected [0,0,1,2,4,4,5,6,6,6,7,8,9,4,4]

  var a3:= new int[] [10, 10, 15, 19, 18, 18, 17, 26, 26, 17, 18, 10];
  var res3:=RemoveElement(a3,5);
  PrintArray(res3);
  //expected [10,10,15,19,18,17,26,26,17,18,10]


}

method Main(){
  RemoveElementTest();
}
