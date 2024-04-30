predicate InArray(a: array<int>, x: int)
  reads a
{
  exists i :: 0 <= i < a.Length && a[i] == x
}

method DissimilarElements(a: array<int>, b: array<int>) returns (result: seq<int>)
  // All elements in the output are either in a or b, but not in both or neither
  ensures forall x :: x in result ==> (InArray(a, x) != InArray(b, x))
  // The elements in the output are all different
  ensures forall i, j :: 0 <= i < j < |result| ==> result[i] != result[j]
{
  var res: seq<int> := [];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant forall x :: x in res ==> InArray(a, x)
    invariant forall x :: x in res ==> InArray(a, x) != InArray(b, x)
    invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if !InArray(b, a[i]) && a[i] !in res
    {
      res := res + [a[i]];
    }
  }

  ghost var partialSize := |res|;
  for i := 0 to b.Length
    invariant 0 <= i <= b.Length
    invariant forall k :: partialSize <= k < |res| ==> InArray(b, res[k])
    invariant forall k :: 0 <= k < |res| ==> InArray(a, res[k]) != InArray(b, res[k])
    invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if !InArray(a, b[i]) && b[i] !in res
    {
      res := res + [b[i]];
    }
  }

  result := res;
}


method DissimilarElementsTest(){
  var a1:= new int[] [3, 4, 5, 6];
  var a2:= new int[] [5, 7, 4, 10];
  var res1:=DissimilarElements(a1,a2);
  expect res1==[3, 6, 7, 10];

  var a3:= new int[] [1, 2, 3, 4];
  var a4:= new int[] [7, 2, 3, 9];
  var res2:=DissimilarElements(a3,a4);
  expect res2== [1, 4, 7, 9];

  var a5:= new int[] [21, 11, 25, 26];
  var a6:= new int[] [26, 34, 21, 36];
  var res3:=DissimilarElements(a5,a6);
  expect res3==[11, 25, 34, 36];

}

method Main(){
  DissimilarElementsTest();
}
