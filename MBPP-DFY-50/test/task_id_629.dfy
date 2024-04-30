predicate IsEven(n: int)
{
  n % 2 == 0
}

method FindEvenNumbers(arr: array<int>) returns (evenList: seq<int>)
  // All numbers in the output are even and exist in the input
  ensures forall i :: 0 <= i < |evenList| ==> IsEven(evenList[i]) && evenList[i] in arr[..]
  // All even numbers in the input are in the output
  ensures forall i :: 0 <= i < arr.Length && IsEven(arr[i]) ==> arr[i] in evenList
{
  evenList := [];
  for i := 0 to arr.Length
    invariant 0 <= i <= arr.Length
    invariant 0 <= |evenList| <= i
    invariant forall k :: 0 <= k < |evenList| ==> IsEven(evenList[k]) && evenList[k] in arr[..]
    invariant forall k :: 0 <= k < i && IsEven(arr[k]) ==> arr[k] in evenList
  {
    if IsEven(arr[i])
    {
      evenList := evenList + [arr[i]];
    }
  }
}


method FindEvenNumbersTest(){
  var a1:= new int[] [1,2,3,4,5];
  var res1:=FindEvenNumbers(a1);
  expect res1==[2,4];

  var a2:= new int[] [4,5,6,7,8,0,1];
  var res2:=FindEvenNumbers(a2);
  expect res2==[4,6,8,0];

  var a3:= new int[] [8,12,15,19];
  var res3:=FindEvenNumbers(a3);
  expect res3==[8,12];

}

method Main(){
  FindEvenNumbersTest();
}

