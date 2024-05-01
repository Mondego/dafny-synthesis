method CubeElements(a: array<int>) returns (cubed: array<int>)
  ensures cubed.Length == a.Length
  ensures forall i :: 0 <= i < a.Length ==> cubed[i] == a[i] * a[i] * a[i]
{
  var cubedArray := new int[a.Length];
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant cubedArray.Length == a.Length
    invariant forall k :: 0 <= k < i ==> cubedArray[k] == a[k] * a[k] * a[k]
  {
    cubedArray[i] := a[i] * a[i] * a[i];
  }
  return cubedArray;
}


method assertArrayEquals(a1: array<int>, a2: array<int>) returns (res: bool)
{
  if (a1.Length != a2.Length) {
    res := false;
  } else {
    var equal := true;
    var i := 0;
    while i < a1.Length && equal

    {
      if (a1[i] != a2[i]) {
        equal := false;
      }
      i := i + 1;
    }
    res := equal;
  }
}


method CubeElementsTest(){
  var a1:= new int[] [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var res1:=CubeElements(a1);
  var exp1:= new int[][1, 8, 27, 64, 125, 216, 343, 512, 729, 1000];
  var out1:=assertArrayEquals(exp1,res1);
  expect out1==true;

  var a2:= new int[] [10,20,30];
  var res2:=CubeElements(a2);
  var exp2:= new int[][1000, 8000, 27000];
  var out2:=assertArrayEquals(exp2,res2);
  expect out1==true;

  var a3:= new int[] [12,15];
  var res3:=CubeElements(a3);
  var exp3:= new int[][1728, 3375];
  var out3:=assertArrayEquals(exp3,res3);
  expect out1==true;


}

method Main(){
  CubeElementsTest();
}
