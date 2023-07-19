method Has30Days(month: int) returns (result: bool)
    requires 1 <= month <= 12
    ensures (result == true) <==> (month == 4 || month == 6 || month == 9 || month == 11)
    ensures (result == false) <==> !(month == 4 || month == 6 || month == 9 || month == 11)
{
    result := month == 4 || month == 6 || month == 9 || month == 11;
}