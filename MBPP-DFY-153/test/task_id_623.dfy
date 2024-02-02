method PowerOfListElements(l: seq<int>, n: int) returns (result: seq<int>)
  requires n >= 0
  ensures |result| == |l|
  ensures forall i :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
{
  result := [];
  for i := 0 to |l|
    invariant 0 <= i <= |l|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == Power(l[k], n)
  {
    result := result + [Power(l[i], n)];
  }
}

function Power(base: int, exponent: int): int
  requires exponent >= 0
{
  if exponent == 0 then 1
  else base * Power(base, exponent-1)
}

method PowerOfListElementsTest(){
  var s1: seq<int> :=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var res1:=PowerOfListElements(s1,2);
  print(res1);print("\n");
              //expected [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

  var s2: seq<int> :=[10,20,30];
  var res2:=PowerOfListElements(s2,3);
  print(res2);print("\n");
              //expected [1000, 8000, 27000]

  var s3: seq<int> :=[12,15];
  var res3:=PowerOfListElements(s3,5);
  print(res3);print("\n");
              //expected [248832, 759375]


}

method Main(){
  PowerOfListElementsTest();
}
