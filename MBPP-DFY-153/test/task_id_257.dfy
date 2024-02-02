method Swap(a: int, b: int) returns (result: seq<int>)
  ensures |result| == 2
  ensures result[0] == b
  ensures result[1] == a
{
  result := [b, a];
}


method SwapTest(){
  var e1: seq<int> := [20,10];
  var res1:=Swap(10,20);
  print(res1);print("\n");

  var e2: seq<int> := [15,17];
  var res2:=Swap(17,15);
  print(res2);print("\n");

  var e3: seq<int> := [200,100];
  var res3:=Swap(100,200);
  print(res3);print("\n");

}

method Main(){
  SwapTest();
}