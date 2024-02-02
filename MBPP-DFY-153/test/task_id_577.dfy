function Factorial(n: int): int
  requires n >= 0
  ensures 0 <= Factorial(n)
{
  if n == 0 then 1
  else n * Factorial(n-1)
}

method FactorialOfLastDigit(n: int) returns (fact: int)
  requires n >= 0
  ensures fact == Factorial(n % 10)
{
  var lastDigit := n % 10;
  fact := Factorial(lastDigit);
}

method FactorialOfLastDigitTest(){
  var res1:=FactorialOfLastDigit(4);
  print(res1);print("\n");
              //assert res1==4;

  var res2:=FactorialOfLastDigit(21);
  print(res2);print("\n");
              //assert res2==0;

  var res3:=FactorialOfLastDigit(30);
  print(res3);print("\n");
              //assert res3==0;

}

method Main(){
  FactorialOfLastDigitTest();
}
