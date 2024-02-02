method IsArmstrong(n: int) returns (result: bool)
    requires 100 <= n < 1000
    ensures result <==> (n == ((n / 100) * (n / 100) * (n / 100) + ((n / 10) % 10) * ((n / 10) % 10) * ((n / 10) % 10) + (n % 10) * (n % 10) * (n % 10)))
{
    var a := n / 100;
    var b := (n / 10) % 10;
    var c := n % 10;

    result := n == (a * a * a + b * b * b + c * c * c);
}