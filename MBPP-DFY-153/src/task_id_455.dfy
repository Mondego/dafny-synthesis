method MonthHas31Days(month: int) returns (result: bool)
    requires 1 <= month <= 12
    ensures result <==> month in {1, 3, 5, 7, 8, 10, 12}
{
    result := month in {1, 3, 5, 7, 8, 10, 12};
}