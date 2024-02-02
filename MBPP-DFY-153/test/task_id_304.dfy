method ElementAtIndexAfterRotation(l: seq<int>, n: int, index: int) returns (element: int)
  requires n >= 0
  requires 0 <= index < |l|
  ensures element == l[(index - n + |l|) % |l|]
{
  element := l[(index - n + |l|) % |l|];
}

method ElementAtIndexAfterRotationTest(){
  var a1:seq<int>:=[1, 2, 3, 4, 5];
  var res1:=ElementAtIndexAfterRotation(a1,2,3);
  print(res1);print("\n");
              //assert res1==1;

  var a2:seq<int>:= [10, 20, 30, 40, 50];
  var res2:=ElementAtIndexAfterRotation(a2,10,1);
  print(res2);print("\n");
              //assert res2==40;

  var a3:seq<int>:= [7, 8, 9, 10, 11];
  var res3:=ElementAtIndexAfterRotation(a3,15,2);
  print(res3);print("\n");
              //assert res3==10;


}

method Main(){
  ElementAtIndexAfterRotationTest();
}