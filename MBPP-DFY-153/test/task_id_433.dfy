method IsGreater(n: int, a: array<int>) returns (result: bool)
  requires a != null
  ensures result ==> forall i :: 0 <= i < a.Length ==> n > a[i]
  ensures !result ==> exists i :: 0 <= i < a.Length && n <= a[i]
{
  result := true;
  var i := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant result ==> forall k :: 0 <= k < i ==> n > a[k]
    invariant !result ==> exists k :: 0 <= k < i && n <= a[k]
  {
    if n <= a[i] {
      result := false;
      break;
    }
    i := i + 1;
  }
}


method IsGreaterTest(){

  var a1:= new int[] [1, 2, 3, 4, 5];
  var out1:=IsGreater(4,a1);
  expect out1==false;

  var a2:= new int[] [2, 3, 4, 5, 6];
  var out2:=IsGreater(8,a2);
  expect out2==true;

  var a3:= new int[] [9, 7, 4, 8, 6, 1];
  var out3:=IsGreater(11,a3);
  expect out3==true;

}

method Main(){
  IsGreaterTest();
}
