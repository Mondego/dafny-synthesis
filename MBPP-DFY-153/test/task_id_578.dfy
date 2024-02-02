method Interleave(s1: seq<int>, s2: seq<int>, s3: seq<int>) returns (r: seq<int>)
  requires |s1| == |s2| && |s2| == |s3|
  ensures |r| == 3 * |s1|
  ensures forall i :: 0 <= i < |s1| ==> r[3*i] == s1[i] && r[3*i + 1] == s2[i] && r[3*i + 2] == s3[i]
{
  r := [];
  for i := 0 to |s1|
    invariant 0 <= i <= |s1|
    invariant |r| == 3 * i
    invariant forall k :: 0 <= k < i ==> r[3*k] == s1[k] && r[3*k + 1] == s2[k] && r[3*k + 2] == s3[k]
  {
    r := r + [s1[i], s2[i], s3[i]];
  }
}

method InterleaveTest(){
  var s1: seq<int> := [1,2,3,4,5,6,7];
  var s2: seq<int> := [10,20,30,40,50,60,70];
  var s3: seq<int> := [100,200,300,400,500,600,700];
  var res1:=Interleave(s1,s2,s3);
  print(res1);print("\n");
              //expected [1, 10, 100, 2, 20, 200, 3, 30, 300, 4, 40, 400, 5, 50, 500, 6, 60, 600, 7, 70, 700];



  var s4: seq<int> := [10,20];
  var s5: seq<int> := [15,2];
  var s6: seq<int> := [5,10];
  var res2:=Interleave(s4,s5,s6);
  print(res2);print("\n");
              //expected [10,15,5,20,2,10];



  var s7: seq<int> := [11,44];
  var s8: seq<int> := [10,15];
  var s9: seq<int> := [20,5];
  var res3:=Interleave(s7,s8,s9);
  print(res3);print("\n");
              //expected [11,10,20,44,15,5];

}

method Main(){
  InterleaveTest();
}
