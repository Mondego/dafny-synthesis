method ElementWiseModulo(a: array<int>, b: array<int>) returns (result: array<int>)
  requires a != null && b != null
  requires a.Length == b.Length
  requires forall i :: 0 <= i < b.Length ==> b[i] != 0
  ensures result != null
  ensures result.Length == a.Length
  ensures forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i]
{
  result := new int[a.Length];
  var i := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant result.Length == a.Length
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] % b[k]
  {
    result[i] := a[i] % b[i];
    i := i + 1;
  }
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


method ElementWiseModuloTest(){
  var a1:= new int[] [10, 4, 5, 6];
  var a2:= new int[] [5, 6, 7, 5];
  var res1:=ElementWiseModulo(a1,a2);
  var exp1:= new int[] [0, 4, 5, 1];
  var out1:=assertArrayEquals(res1,exp1);
  expect out1==true;

  var a3:= new int[] [11, 5, 6, 7];
  var a4:= new int[] [6, 7, 8, 6];
  var res2:=ElementWiseModulo(a3,a4);
  var exp2:= new int[] [5, 5, 6, 1];
  var out2:=assertArrayEquals(res2,exp2);
  expect out2==true;

  var a5:= new int[] [12, 6, 7, 8];
  var a6:= new int[] [7, 8, 9, 7];
  var res3:=ElementWiseModulo(a5,a6);
  var exp3:= new int[]  [5, 6, 7, 1];
  var out3:=assertArrayEquals(res3,exp3);
  expect out3==true;

}

method Main(){
  ElementWiseModuloTest();
}

