method ContainsZ(s: string) returns (result: bool)
{
    result := false;
    for i := 0 to |s|
    {
        if s[i] == 'z' || s[i] == 'Z' {
            result := true;
            break;
        }
    }
}
