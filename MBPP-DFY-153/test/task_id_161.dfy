predicate InArray(a: array<int>, x: int)
  reads a
{
  exists i :: 0 <= i < a.Length && a[i] == x
}

method RemoveElements(a: array<int>, b: array<int>) returns (result: seq<int>)
  // All elements in the output are in a and not in b
  ensures forall x :: x in result ==> InArray(a, x) && !InArray(b, x)
  // The elements in the output are all different
  ensures forall i, j :: 0 <= i < j < |result| ==> result[i] != result[j]
{
  var res: seq<int> := [];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant forall x :: x in res ==> InArray(a, x) && !InArray(b, x)
    invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if !InArray(b, a[i]) && a[i] !in res
    {
      res := res + [a[i]];
    }
  }

  result := res;
}

method RemoveElementsTest(){
  var a1:= new int[] [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var a2:= new int[] [2, 4, 6, 8];
  var res1:=RemoveElements(a1,a2);
  expect res1==[1, 3, 5, 7, 9, 10];

  var a3:= new int[] [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var a4:= new int[] [1, 3, 5, 7];
  var res2:=RemoveElements(a3,a4);
  expect res2==[2, 4, 6, 8, 9, 10];

  var a5:= new int[] [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var a6:= new int[] [15, 7];
  var res3:=RemoveElements(a5,a6);
  expect res3==[1, 2, 3, 4, 5, 6, 8, 9, 10];
  
}
method Main(){
  RemoveElementsTest();
}