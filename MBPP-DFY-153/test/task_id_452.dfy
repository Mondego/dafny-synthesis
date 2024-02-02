method CalculateLoss(costPrice: int, sellingPrice: int) returns (loss: int)
  requires costPrice >= 0 && sellingPrice >= 0
  ensures (costPrice > sellingPrice ==> loss == costPrice - sellingPrice) && (costPrice <= sellingPrice ==> loss == 0)
{
  if (costPrice > sellingPrice) {
    loss := costPrice - sellingPrice;
  } else {
    loss := 0;
  }
}

method CalculateLossTest(){
  var res1:=CalculateLoss(1500,1200);
  print(res1);print("\n");
              //assert res1==0;

  var res2:=CalculateLoss(100,200);
  print(res2);print("\n");
              //assert res2==100;

  var res3:=CalculateLoss(2000,5000);
  print(res3);print("\n");
              //assert res3==3000;


}

method Main(){
  CalculateLossTest();
}
