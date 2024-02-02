method IsArmstrong(n: int) returns (result: bool)
  requires 100 <= n < 5000
  ensures result <==> (n == ((n / 100) * (n / 100) * (n / 100) + ((n / 10) % 10) * ((n / 10) % 10) * ((n / 10) % 10) + (n % 10) * (n % 10) * (n % 10)))
{
  var a := n / 100;
  var b := (n / 10) % 10;
  var c := n % 10;

  result := n == (a * a * a + b * b * b + c * c * c);
}

method IsArmstrongTest(){
  var res1:=IsArmstrong(153);
  print(res1);print("\n");
  assert res1==true;

  var res2:=IsArmstrong(259);
  print(res2);print("\n");
  assert res2==false;

  var res3:=IsArmstrong(4458);
  print(res3);print("\n");
  assert res3==false;

}

method Main(){
  IsArmstrongTest();
}
