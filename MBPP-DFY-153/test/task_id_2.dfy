predicate InArray(a: array<int>, x: int)
  reads a
{
  exists i :: 0 <= i < a.Length && a[i] == x
}

method SharedElements(a: array<int>, b: array<int>) returns (result: seq<int>)
  // All elements in the output are in both a and b
  ensures forall x :: x in result ==> (InArray(a, x) && InArray(b, x))
  // The elements in the output are all different
  ensures forall i, j :: 0 <= i < j < |result| ==> result[i] != result[j]
{
  var res: seq<int> := [];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant forall x :: x in res ==> InArray(a, x) && InArray(b, x)
    invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if InArray(b, a[i]) && a[i] !in res
    {
      res := res + [a[i]];
    }
  }
  result := res;
}



method SharedElementsTest(){
  var a1:= new int[] [3, 4, 5, 6];
  var a2:= new int[] [5, 7, 4, 10];
  var res1:=SharedElements(a1,a2);
  print(res1);print("\n");
              //expected[4, 5];

  var a3:= new int[] [1, 2, 3, 4];
  var a4:= new int[] [5, 4, 3, 7];
  var res2:=SharedElements(a3,a4);
  print(res2);print("\n");
              //expected [3, 4];

  var a5:= new int[] [11, 12, 14, 13];
  var a6:= new int[] [17, 15, 14, 13];
  var res3:=SharedElements(a5,a6);
  print(res3);print("\n");
              //expected [13, 14];
}


method Main(){
  SharedElementsTest();
}