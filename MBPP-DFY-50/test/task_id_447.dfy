method CubeElements(a: array<int>) returns (cubed: array<int>)
  ensures cubed.Length == a.Length
  ensures forall i :: 0 <= i < a.Length ==> cubed[i] == a[i] * a[i] * a[i]
{
  var cubedArray := new int[a.Length];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant cubedArray.Length == a.Length
    invariant forall k :: 0 <= k < i ==> cubedArray[k] == a[k] * a[k] * a[k]
  {
    cubedArray[i] := a[i] * a[i] * a[i];
  }
  return cubedArray;
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


method CubeElementsTest(){
  var a1:= new int[] [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var res1:=CubeElements(a1);
  PrintArray(res1);
  //expected [1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]

  var a2:= new int[] [10,20,30];
  var res2:=CubeElements(a2);
  PrintArray(res2);
  //expected [1000, 8000, 27000]

  var a3:= new int[] [12,15];
  var res3:=CubeElements(a3);
  PrintArray(res3);
  //expected [1728, 3375]

}

method Main(){
  CubeElementsTest();
}
