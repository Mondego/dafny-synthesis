method IsDivisibleBy11(n: int) returns (result: bool)
  ensures result <==> n % 11 == 0
{
  result := n % 11 == 0;
}

method IsDivisibleBy11Test(){
  var out1:=IsDivisibleBy11(12345);
  assert out1==false;

  var out2:=IsDivisibleBy11(1212112);
  assert out2==true;

  var out3:=IsDivisibleBy11(1212);
  assert out3==false;

}

method Main(){
  IsDivisibleBy11Test();
}
