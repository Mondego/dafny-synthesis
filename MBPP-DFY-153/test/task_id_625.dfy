method SwapFirstAndLast(a: array<int>)
  requires a.Length > 0
  modifies a
  ensures a[0] == old(a[a.Length - 1])
  ensures a[a.Length - 1] == old(a[0])
  ensures forall k :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
{
  var tmp := a[0];
  a[0] := a[a.Length - 1];
  a[a.Length - 1] := tmp;
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


method SwapFirstAndLastTest(){

  var a1:= new int[] [1,2,3];
  SwapFirstAndLast(a1);
  var exp1:= new int[][3,2,1];
  var out1:=assertArrayEquals(exp1,a1);
  expect out1==true;

  var a2:= new int[] [1,2,3,4,4];
  SwapFirstAndLast(a2);
  var exp2:= new int[][4,2,3,4,1];
  var out2:=assertArrayEquals(exp2,a2);
  expect out2==true;

  var a3:= new int[] [4,5,6];
  SwapFirstAndLast(a3);
  var exp3:= new int[] [6,5,4];
  var out3:=assertArrayEquals(exp3,a3);
  expect out3==true;


}

method Main(){
  SwapFirstAndLastTest();
}
