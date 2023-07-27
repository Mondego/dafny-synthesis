method Has30Days(month: int) returns (result: bool)
{
    result := month == 4 || month == 6 || month == 9 || month == 11;
}
