/**
  * Find negative numbers from an array of numbers
  **/

predicate IsNegative(n: int)
{
  n < 0
}

method FindNegativeNumbers(arr: array<int>) returns (negativeList: seq<int>)
  // All numbers in the output are negative and exist in the input
  ensures forall i :: 0 <= i < |negativeList| ==> IsNegative(negativeList[i]) && negativeList[i] in arr[..]
  // All negative numbers in the input are in the output
  ensures forall i :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList
{
  negativeList := [];
  for i := 0 to arr.Length
    invariant 0 <= i <= arr.Length
    invariant 0 <= |negativeList| <= i
    invariant forall k :: 0 <= k < |negativeList| ==> IsNegative(negativeList[k]) && negativeList[k] in arr[..]
    invariant forall k :: 0 <= k < i && IsNegative(arr[k]) ==> arr[k] in negativeList
  {
    if IsNegative(arr[i])
    {
      negativeList := negativeList + [arr[i]];
    }
  }
}


method FindNegativeNumbersTest(){
  var a1:= new int[] [-1,4,5,-6];
  var res1:=FindNegativeNumbers(a1);
  print(res1);print("\n");
              //expected [-1,-6]

  var a2:= new int[] [-1,-2,3,4];
  var res2:=FindNegativeNumbers(a2);
  print(res2);print("\n");
              //expected [-1,-2]

  var a3:= new int[] [-7,-6,8,9];
  var res3:=FindNegativeNumbers(a3);
  print(res3);print("\n");
              //expected [-7,-6]
}

method Main(){
  FindNegativeNumbersTest();
}
