method ContainsZ(s: string) returns (result: bool)
  ensures result <==> (exists i :: 0 <= i < |s| && (s[i] == 'z' || s[i] == 'Z'))
{
  result := false;
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant result <==> (exists k :: 0 <= k < i && (s[k] == 'z' || s[k] == 'Z'))
  {
    if s[i] == 'z' || s[i] == 'Z' {
      result := true;
      break;
    }
  }
}

method ContainsZTest(){
  var out1:=ContainsZ("pythonz");
  print(out1);print("\n");
              //assert out1==true;

  var out2:=ContainsZ("xyz.");
  print(out2);print("\n");
              //assert out2==true;

  var out3:=ContainsZ("  lang  .");
  print(out3);print("\n");
              //assert out3==false;

}

method Main(){
  ContainsZTest();
}
