/**
  * Remove odd numbers from an array of numbers
  **/

predicate IsEven(n: int)
{
  n % 2 == 0
}

method RemoveOddNumbers(arr: array<int>) returns (evenList: seq<int>)
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

method RemoveOddNumbersTest(){

  var a1:= new int[] [1,2,3];
  var res1:=RemoveOddNumbers(a1);
  print(res1);print("\n");
              //expected [2]


  var a2:= new int[] [2,4,6];
  var res2:=RemoveOddNumbers(a2);
  print(res2);print("\n");
              //expected [2,4,6]


  var a3:= new int[] [10,20,3];
  var res3:=RemoveOddNumbers(a3);
  print(res3);print("\n");
              //expected [10,20]

}

method Main(){
  RemoveOddNumbersTest();
}