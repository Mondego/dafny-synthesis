method LucidNumbers(n: int) returns (lucid: seq<int>)
  requires n >= 0
  ensures forall i :: 0 <= i < |lucid| ==> lucid[i] % 3 == 0
  ensures forall i :: 0 <= i < |lucid| ==> lucid[i] <= n
  ensures forall i, j :: 0 <= i < j < |lucid| ==> lucid[i] < lucid[j]
{
  lucid := [];
  var i := 0;
  while i <= n
    invariant 0 <= i <= n + 1
    invariant forall k :: 0 <= k < |lucid| ==> lucid[k] % 3 == 0
    invariant forall k :: 0 <= k < |lucid| ==> lucid[k] <= i - 1
    invariant forall k, l :: 0 <= k < l < |lucid| ==> lucid[k] < lucid[l]
  {
    if i % 3 == 0 {
      lucid := lucid + [i];
    }
    i := i + 1;
  }
}

method LucidNumbersTest(){

  var res1:=LucidNumbers(10);
  print(res1);print("\n");
              //expected  [1, 2, 3, 5, 7]

  var res2:=LucidNumbers(25);
  print(res2);print("\n");
              //expected [1, 2, 3, 5, 7, 11, 13, 17, 23, 25]

  var res3:=LucidNumbers(45);
  print(res3);print("\n");
              //expected [1, 2, 3, 5, 7, 11, 13, 17, 23, 25, 29, 37, 41, 43]


}

method Main(){
  LucidNumbersTest();
}
