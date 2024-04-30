method FindFirstOccurrence(arr: array<int>, target: int) returns (index: int)
  requires arr != null
  requires forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  ensures 0 <= index < arr.Length ==> arr[index] == target
  ensures index == -1 ==> forall i :: 0 <= i < arr.Length ==> arr[i] != target
  ensures forall i :: 0 <= i < arr.Length ==> arr[i] == old(arr[i])
{
  index := -1;
  for i := 0 to arr.Length
    invariant 0 <= i <= arr.Length
    invariant index == -1 ==> forall k :: 0 <= k < i ==> arr[k] != target
    invariant 0 <= index < i ==> arr[index] == target
    invariant forall k :: 0 <= k < arr.Length ==> arr[k] == old(arr[k])
  {
    if arr[i] == target
    {
      index := i;
      break;
    }
    if arr[i] > target
    {
      break;
    }
  }
}

method FindFirstOccurrenceTest(){

  var a1:= new int[] [2, 5, 5, 5, 6, 6, 8, 9, 9, 9];
  var out1:=FindFirstOccurrence(a1,5);
  expect out1==1;

  var a2:= new int[] [2, 3, 5, 5, 6, 6, 8, 9, 9, 9];
  var out2:=FindFirstOccurrence(a2,5);
  expect out2==2;

  var a3:= new int[] [2, 4, 1, 5, 6, 6, 8, 9, 9, 9];
  var out3:=FindFirstOccurrence(a3,6);
  expect out3==4;

}

method Main(){
  FindFirstOccurrenceTest();
}
