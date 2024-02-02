predicate InArray(a: array<int>, x: int)
  reads a
{
  exists i :: 0 <= i < a.Length && a[i] == x
}

method Intersection(a: array<int>, b: array<int>) returns (result: seq<int>)
  // All elements in the output are in both a and b
  ensures forall x :: x in result ==> (InArray(a, x) && InArray(b, x))
  // The elements in the output are all different
  ensures forall i, j :: 0 <= i < j < |result| ==> result[i] != result[j]
{
  var res: seq<int> := [];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant forall x :: x in res ==> (InArray(a, x) && InArray(b, x))
    invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if InArray(b, a[i]) && a[i] !in res
    {
      res := res + [a[i]];
    }
  }

  result := res;
}

method IntersectionTest(){
  var a1:= new int[] [1, 2, 3, 5, 7, 8, 9, 10];
  var a2:= new int[] [1, 2, 4, 8, 9];
  var res1:=Intersection(a1,a2);
  print(res1);print("\n");
              // expected [1, 2, 8, 9];

  var a3:= new int[] [1, 2, 3, 5, 7, 8, 9, 10];
  var a4:= new int[] [3,5,7,9];
  var res2:=Intersection(a3,a4);
  print(res2);print("\n");
              // expected [3,5,7,9];

  var a5:= new int[] [1, 2, 3, 5, 7, 8, 9, 10];
  var a6:= new int[] [10,20,30,40];
  var res3:=Intersection(a5,a6);
  print(res3);print("\n");
              // expected [10];

}

method Main(){
  IntersectionTest();
}