method ParabolaDirectrix(a: real, h: real, k: real) returns (directrix: real)
  requires a != 0.0
  ensures directrix == k - 1.0 / (4.0 * a)
{
  directrix := k - 1.0 / (4.0 * a);
}


method ParabolaDirectrixTest(){

  var res1:=ParabolaDirectrix(5.0,3.0,2.0);
  print(res1);print("\n");
              //assert res1==-198.0;

  var res2:=ParabolaDirectrix(9.0,8.0,4.0);
  print(res2);print("\n");
              //assert res2==-2336.0;
  var res3:=ParabolaDirectrix(2.0,4.0,6.0);
  print(res3);print("\n");
              //assert res3==-130.0;


}

method Main(){
  ParabolaDirectrixTest();
}
