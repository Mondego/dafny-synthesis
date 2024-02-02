method BitwiseXOR(a: seq<bv32>, b: seq<bv32>) returns (result: seq<bv32>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
{
  result := [];
  var i := 0;
  while i < |a|
    invariant 0 <= i <= |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] ^ b[k]
  {
    result := result + [a[i] ^ b[i]];
    i := i + 1;
  }
}

method BitwiseXORTest(){
  var s1: seq<bv32> := [10, 4, 6, 9];
  var s2: seq<bv32> := [5, 2, 3, 3];
  var res1:=BitwiseXOR(s1,s2);
  print(res1);print("\n");
              //expected [15, 6, 5, 10];

  var s3: seq<bv32> := [11, 5, 7, 10];
  var s4: seq<bv32> := [6, 3, 4, 4];
  var res2:=BitwiseXOR(s3,s4);
  print(res2);print("\n");
              //expected [13, 6, 3, 14]

  var s5: seq<bv32> := [12, 6, 8, 11];
  var s6: seq<bv32> := [7, 4, 5, 6];
  var res3:=BitwiseXOR(s5,s6);
  print(res3);print("\n");
              //expected [11, 2, 13, 13]

}
method Main(){
  BitwiseXORTest();
}