method SwapFirstAndLast(a: array<int>)
  requires a.Length > 0
  modifies a
  ensures a[0] == old(a[a.Length - 1])
  ensures a[a.Length - 1] == old(a[0])
  ensures forall k :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
{
  var tmp := a[0];
  a[0] := a[a.Length - 1];
  a[a.Length - 1] := tmp;
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


method SwapFirstAndLastTest(){
  var a1:= new int[] [1,2,3];
  SwapFirstAndLast(a1);
  PrintArray(a1);
  //expected [3,2,1]

  var a2:= new int[] [1,2,3,4,4];
  SwapFirstAndLast(a2);
  PrintArray(a2);
  //expected [4,2,3,4,1];

  var a3:= new int[] [4,5,6];
  SwapFirstAndLast(a3);
  PrintArray(a3);
  //expected [6,5,4];

}

method Main(){
  SwapFirstAndLastTest();
}
