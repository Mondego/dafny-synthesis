method AnyValueExists(seq1: seq<int>, seq2: seq<int>) returns (result: bool)
  ensures result <==> (exists i :: 0 <= i < |seq1| && seq1[i] in seq2)
{
  result := false;
  for i := 0 to |seq1|
    invariant 0 <= i <= |seq1|
    invariant result <==> (exists k :: 0 <= k < i && seq1[k] in seq2)
  {
    if seq1[i] in seq2 {
      result := true;
      break;
    }
  }
}

method AnyValueExistsTest(){

  var s1: seq<int> := [1,2,3,4,5];
  var s2: seq<int> := [6,7,8,9];
  var res1:=AnyValueExists(s1,s2);
  print(res1);print("\n");
              //assert res1==false;

  var s3: seq<int> := [1,2,3];
  var s4: seq<int> := [4,5,6];
  var res2:=AnyValueExists(s3,s4);
  print(res2);print("\n");
              //assert res2==false;

  var s5: seq<int> := [1,4,5];
  var s6: seq<int> := [1,4,5];
  var res3:=AnyValueExists(s5,s6);
  print(res3);print("\n");
              //assert res3==true;


}

method Main(){
  AnyValueExistsTest();
}