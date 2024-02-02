method IsLengthOdd(s: string) returns (result: bool)
    ensures result <==> |s| % 2 == 1
{
    result := |s| % 2 == 1;
}