method AllCharactersSame(s: string) returns (result: bool)
{
    if |s| <= 1 {
        return true;
    }

    var firstChar := s[0];
    result := true;

    for i := 1 to |s|
    {
        if s[i] != firstChar {
            result := false;
            break;
        }
    }
}
