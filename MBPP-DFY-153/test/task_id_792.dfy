method CountLists(lists: seq<seq<int>>) returns (count: int)
  ensures count >= 0
  ensures count == |lists|
{
  count := |lists|;
}

method CountListsTest(){
  var s1:seq<seq<int>> :=[[1, 3], [5, 7], [9, 11], [13, 15, 17]];
  var res1:=CountLists(s1);
  print(res1);print("\n");
  assert res1==4;

  var s2:seq<seq<int>> :=[[1,2],[2,3],[4,5]];
  var res2:=CountLists(s2);
  print(res2);print("\n");
  assert res2==3;

  var s3:seq<seq<int>> :=[[1,0],[2,0]];
  var res3:=CountLists(s3);
  print(res3);print("\n");
  assert res3==2;

}

method Main(){
  CountListsTest();
}
