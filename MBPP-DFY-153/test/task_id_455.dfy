method MonthHas31Days(month: int) returns (result: bool)
  requires 1 <= month <= 12
  ensures result <==> month in {1, 3, 5, 7, 8, 10, 12}
{
  result := month in {1, 3, 5, 7, 8, 10, 12};
}

method MonthHas31DaysTest(){
  var res1:=MonthHas31Days(5);
  print(res1);print("\n");
  assert res1==true;

  var res2:=MonthHas31Days(2);
  print(res2);print("\n");
  assert res2==false;

  var res3:=MonthHas31Days(6);
  print(res3);print("\n");
  assert res3==false;

}

method Main(){
  MonthHas31DaysTest();
}

