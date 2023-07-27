method FindFirstRepeatedChar(s: string) returns (found: bool, c: char)
    ensures found ==> exists i, j :: 0 <= i < j < |s| && s[i] == s[j] && s[i] == c && (forall k, l :: 0 <= k < l < j && s[k] == s[l] ==> k >= i)
    ensures !found ==> (forall i, j :: 0 <= i < j < |s| ==> s[i] != s[j])
{
    c := ' ';
    found := false;
    var inner_found := false;
    var i := 0;
    while i < |s| && !found
        // Found: there exists number ii less or equal to i, that we looked above it and found it. And, btw, that didn't happen for any number less than ii
        // Not found: for every number up to i, we looked above it, and didn't find it
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
