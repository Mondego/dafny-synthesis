/**
  * Find odd numbers from an array of numbers
  **/

predicate IsOdd(n: int)
{
  n % 2 == 1
}

method FindOddNumbers(arr: array<int>) returns (oddList: seq<int>)
  // All numbers in the output are odd and exist in the input
  ensures forall i :: 0 <= i < |oddList| ==> IsOdd(oddList[i]) && oddList[i] in arr[..]
  // All odd numbers in the input are in the output
  ensures forall i :: 0 <= i < arr.Length && IsOdd(arr[i]) ==> arr[i] in oddList
{
  oddList := [];
  for i := 0 to arr.Length
    invariant 0 <= i <= arr.Length
    invariant 0 <= |oddList| <= i
    invariant forall k :: 0 <= k < |oddList| ==> IsOdd(oddList[k]) && oddList[k] in arr[..]
    invariant forall k :: 0 <= k < i && IsOdd(arr[k]) ==> arr[k] in oddList
  {
    if IsOdd(arr[i])
    {
      oddList := oddList + [arr[i]];
    }
  }
}

method FindOddNumbersTest(){
  var a1:= new int[] [1,2,3,4,5,6];
  var res1:=FindOddNumbers(a1);
  print(res1);print("\n");
              //expected [1,3,5]


  var a2:= new int[] [10,11,12,13];
  var res2:=FindOddNumbers(a2);
  print(res2);print("\n");
              //expected [11,13]


  var a3:= new int[] [7,8,9,1];
  var res3:=FindOddNumbers(a3);
  print(res3);print("\n");
              //expected  [7,9,1]


}

method Main(){
  FindOddNumbersTest();
}