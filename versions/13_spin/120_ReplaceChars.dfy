method ReplaceChars(s: string, oldChar: char, newChar: char) returns (v: string)
{
    var s' : string := [];
    for i := 0 to |s|
    {
        if s[i] == oldChar
        {
            s' := s' + [newChar];
        }
        else 
        {
            s' := s' + [s[i]];
        }
    }
    return s';
}
