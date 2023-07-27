method FindFirstRepeatedChar(s: string) returns (found: bool, c: char)
{
    c := ' ';
    found := false;
    var inner_found := false;
    var i := 0;
    while i < |s| && !found
    {
        var j := i + 1;
        while j < |s| && !inner_found
        {
            if s[i] == s[j] {
                inner_found := true;
                c := s[i];
            }
            j := j + 1;
        }
        found := inner_found;
        i := i + 1;
    }
}
