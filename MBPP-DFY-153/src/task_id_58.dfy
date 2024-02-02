//"task_id": "58",
//"task_description": "Write a method in Dafny to check whether the given two integers have opposite sign or not.",

method HasOppositeSign(a: int, b: int) returns (result: bool)
  ensures result <==> (a < 0 && b > 0) || (a > 0 && b < 0)
{
  result := (a < 0 && b > 0) || (a > 0 && b < 0);
}