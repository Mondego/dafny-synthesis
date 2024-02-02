predicate IsEven(n: int)
{
  n % 2 == 0
}

method IsEvenAtIndexEven(lst: seq<int>) returns (result: bool)
  ensures result <==> forall i :: 0 <= i < |lst| ==> (IsEven(i) ==> IsEven(lst[i]))
{
  result := true;
  for i := 0 to |lst|
    invariant 0 <= i <= |lst|
    invariant result <==> forall k :: 0 <= k < i ==> (IsEven(k) ==> IsEven(lst[k]))
  {
    if IsEven(i) && !IsEven(lst[i])
    {
      result := false;
      break;
    }
  }
}


method IsEvenAtIndexEvenTest(){
  var s1: seq<int> := [3,2,1];
  var res1:=IsEvenAtIndexEven(s1);
  print(res1);print("\n");
              //assert res1==false;

  var s2: seq<int> := [1,2,3];
  var res2:=IsEvenAtIndexEven(s2);
  print(res2);print("\n");
              //assert res2==false;

  var s3: seq<int> := [2,1,4];
  var res3:=IsEvenAtIndexEven(s3);
  print(res3);print("\n");
              //assert res3==true;

}

method Main(){
  IsEvenAtIndexEvenTest();
}
