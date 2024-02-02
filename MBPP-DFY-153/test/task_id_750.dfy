method AddTupleToList(l: seq<(int, int)>, t: (int, int)) returns (r: seq<(int, int)>)
  ensures |r| == |l| + 1
  ensures r[|r| - 1] == t
  ensures forall i :: 0 <= i < |l| ==> r[i] == l[i]
{
  r := l + [t];
}

method AddTupleToListTest(){
  var s1: seq<(int,int)> := [(5, 6)];
  var s2: (int,int):= (9, 10);
  var res1:=AddTupleToList(s1,s2);
  print(res1);print("\n");
              //expected [(5, 6), (9, 10)]
  var s3: seq<(int,int)> := [(6, 7)];
  var s4: (int,int):= (10, 11);
  var res2:=AddTupleToList(s3,s4);
  print(res2);print("\n");
              //expected [(6, 7), (10, 11)]

  var s5: seq<(int,int)> := [(7, 8)];
  var s6: (int,int):= (11, 12);
  var res3:=AddTupleToList(s5,s6);
  print(res3);print("\n");
              //expected [(7, 8), (11, 12)]

}

method Main(){
  AddTupleToListTest();
}
