method KthElement(arr: array<int>, k: int) returns (result: int)
  requires 1 <= k <= arr.Length
  ensures result == arr[k - 1]
{
  result := arr[k - 1];
}

method KthElementTest(){
  var a1:= new int[] [12,3,5,7,19];
  var out1:=KthElement(a1,2);
  assert out1==3;

  var a2:= new int[] [17,24,8,23];
  var out2:=KthElement(a2,3);
  assert out2==8;

  var a3:= new int[] [16,21,25,36,4];
  var out3:=KthElement(a3,4);
  assert out3==36;

}

method Main(){
  KthElementTest();
}
