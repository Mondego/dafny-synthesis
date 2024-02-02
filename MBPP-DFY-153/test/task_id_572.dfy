method RemoveDuplicates(a: array<int>) returns (result: seq<int>)
  requires a != null
  ensures forall x :: x in result <==> exists i :: 0 <= i < a.Length && a[i] == x
  ensures forall i, j :: 0 <= i < j < |result| ==> result[i] != result[j]
{
  var res: seq<int> := [];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant forall x :: x in res <==> exists k :: 0 <= k < i && a[k] == x
    invariant forall i, j :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if a[i] !in res
    {
      res := res + [a[i]];
    }
  }
  result := res;
}


method RemoveDuplicatesTest(){

  var a1:= new int[] [1,2,3,2,3,4,5];
  var res1:=RemoveDuplicates(a1);
  print(res1);print("\n");
              //expected  [1, 4, 5]

  var a2:= new int[] [1,2,3,2,4,5];
  var res2:=RemoveDuplicates(a2);
  print(res2);print("\n");
              //expected [1, 3, 4, 5]

  var a3:= new int[] [1,2,3,4,5];
  var res3:=RemoveDuplicates(a3);
  print(res3);print("\n");
              //expected [1, 2, 3, 4, 5]

}

method Main(){
  RemoveDuplicatesTest();
}
