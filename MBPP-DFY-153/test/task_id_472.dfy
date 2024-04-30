method ContainsConsecutiveNumbers(a: array<int>) returns (result: bool)
  requires a.Length>0
  ensures result <==> (exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1])
  //ensures forall i :: 0 <= i < a.Length-1 ==> a[i] + 1 == a[i + 1]

{
  result := false;
  for i := 0 to a.Length - 1
    invariant 0 <= i <= a.Length - 1
    invariant result <==> (exists k :: 0 <= k < i && a[k] + 1 == a[k + 1])
  {
    if a[i] + 1 == a[i + 1] {
      result := true;
      break;
    }
  }
}

method ContainsConsecutiveNumbersTest(){
  var a1:= new int[] [1,2,3,4,5];
  var out1:=ContainsConsecutiveNumbers(a1);
  expect out1==true;

  var a2:= new int[] [1,2,3,5,6];
  var out2:=ContainsConsecutiveNumbers(a2);
  expect out2==true;

  var a3:= new int[] [1,3,5];
  var out3:=ContainsConsecutiveNumbers(a3);
  expect out3==false;

}

method Main(){
  ContainsConsecutiveNumbersTest();
}
