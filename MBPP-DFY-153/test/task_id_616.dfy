method ElementWiseModulo(a: array<int>, b: array<int>) returns (result: array<int>)
  requires a != null && b != null
  requires a.Length == b.Length
  requires forall i :: 0 <= i < b.Length ==> b[i] != 0
  ensures result != null
  ensures result.Length == a.Length
  ensures forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i]
{
  result := new int[a.Length];
  var i := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant result.Length == a.Length
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] % b[k]
  {
    result[i] := a[i] % b[i];
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


method ElementWiseModuloTest(){
  var a1:= new int[] [10, 4, 5, 6];
  var a2:= new int[] [5, 6, 7, 5];
  var res1:=ElementWiseModulo(a1,a2);
  PrintArray(res1);
  //expected [0, 4, 5, 1]

  var a3:= new int[] [11, 5, 6, 7];
  var a4:= new int[] [6, 7, 8, 6];
  var res2:=ElementWiseModulo(a3,a4);
  PrintArray(res2);
  //expected [5, 5, 6, 1]

  var a5:= new int[] [12, 6, 7, 8];
  var a6:= new int[] [7, 8, 9, 7];
  var res3:=ElementWiseModulo(a5,a6);
  PrintArray(res3);
  //expected [5, 6, 7, 1]

}

method Main(){
  ElementWiseModuloTest();
}

