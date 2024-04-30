method LastPosition(arr: array<int>, elem: int) returns (pos: int)
  requires arr.Length > 0
  requires forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  ensures pos == -1 || (0 <= pos < arr.Length && arr[pos] == elem && (pos <= arr.Length - 1 || arr[pos + 1] > elem))
  ensures forall i :: 0 <= i < arr.Length ==> arr[i] == old(arr[i])
{
  pos := -1;
  for i := 0 to arr.Length - 1
    invariant 0 <= i <= arr.Length
    invariant pos == -1 || (0 <= pos < i && arr[pos] == elem && (pos == i - 1 || arr[pos + 1] > elem))
    invariant forall k :: 0 <= k < arr.Length ==> arr[k] == old(arr[k])
  {
    if arr[i] == elem
    {
      pos := i;
    }
  }
}

method LastPositionTest(){

  var a1:= new int[] [1,2,3];
  var out1:=LastPosition(a1,1);
  expect out1==0;

  var a2:= new int[] [1,1,1,2,3,4];
  var out2:=LastPosition(a2,1);
  expect out2==2;

  var a3:= new int[] [2,3,2,3,6,8,9];
  var out3:=LastPosition(a3,3);
  expect out3==3;

}

method Main(){
  LastPositionTest();
}
