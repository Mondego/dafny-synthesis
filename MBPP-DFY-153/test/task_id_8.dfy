method SquareElements(a: array<int>) returns (squared: array<int>)
  ensures squared.Length == a.Length
  ensures forall i :: 0 <= i < a.Length ==> squared[i] == a[i] * a[i]
{
  squared := new int[a.Length];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant squared.Length == a.Length
    invariant forall k :: 0 <= k < i ==> squared[k] == a[k] * a[k]
  {
    squared[i] := a[i] * a[i];
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

method SquareElementsTest(){

  var a1:= new int[] [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var res1:=SquareElements(a1);
  PrintArray(res1);
  // expected [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

  var a2:= new int[] [10,20,30];
  var res2:=SquareElements(a2);
  PrintArray(res2);
  //expected [100,400,900]

  var a3:= new int[] [12,15];
  var res3:=SquareElements(a3);
  PrintArray(res3);
  //expected [144,225]

}


method Main(){
  SquareElementsTest();
}