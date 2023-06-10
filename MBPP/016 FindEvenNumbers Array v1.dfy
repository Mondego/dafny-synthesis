/**
 * Find even numbers from an array of numbers
 **/

predicate IsEven(n: int)
{
    n % 2 == 0
}

method FindEvenNumbers(arr: array<int>) returns (evenNumbers: array<int>)
    // All even numbers in the input are in the output
    ensures forall x :: x in arr[..] && IsEven(x) ==> x in evenNumbers[..];
    // If a number is not in the input, it's also not in the output 
    ensures forall x :: x !in arr[..] ==> x !in evenNumbers[..]
    // Relative order of even numbers is preserved
    ensures evenNumbers[..] == filter(arr[..], IsEven)
{
    var evenList: seq<int> := filter(arr[..], IsEven);
    evenNumbers := new int[|evenList|](i requires 0 <= i < |evenList| => evenList[i]);
    assert evenList == evenNumbers[..];
}

function filter<T>(s: seq<T>, p: T -> bool) : seq<T>
    ensures forall x :: x !in s ==> x !in filter(s, p)
    ensures forall x :: x in s && p(x) ==> x in filter(s, p)
    ensures |s| > 0 && p(s[0]) <==> |s| > 0  && filter(s, p) == [s[0]] + filter(s[1..], p)
{
    if s == [] then []
    else 
        if p(s[0]) then 
            [s[0]] + filter(s[1..], p)
        else filter(s[1..], p)
}


method m1() {
//    EquivalenceLemma([1, 2, 3, 4, 5], [4, 2], IsEven);
    var s := [1, 2, 3, 4, 5];
    SameSequenceLemma(s, filter(s, IsEven), 4, IsEven);
    SameSequenceLemma(s, [2, 4], 4, IsEven);
//    assert filter([1, 2, 3, 4, 5], IsEven) == [4, 2];
}

/*
// Prove that both seqs are equivalent
lemma EquivalenceLemma<T>(original: seq<T>, filtered: seq<T>, p: T -> bool)
    requires forall x :: x !in original ==> x !in filter(original, p)
    requires forall x :: x in original && p(x) ==> x in filter(original, p)
//    requires |original| > 0 && p(original[0]) <==> |original| > 0  && filter(original, p) == [original[0]] + filter(original[1..], p)
    ensures filtered == filter(original, p)
{
    
    if original == [] {
        assert [] == filter(original, p);
        if filtered == [] {
            assert filtered == filter(original, p);
        }
        else {
            // Impossible
            assume exists k :: 0 <= k < |filtered| && filtered[k] in original;
            assert false;
        }
    }
    else {
        if p(original[0]) {
            assert original == [original[0]] + original[1..];
            assert filter(original, p) == [original[0]] + filter(original[1..], p);
            if filtered == [] {
                // Impossible
                assume exists k :: 0 <= k < |filtered| && filtered[k] in original;
                assert false;
            }
            else {
                assert original[0] == filtered[0]; // !!! Can't prove this
                EquivalenceLemma(original[1..], filtered[1..], p);
                assert filtered[1..] == filter(original[1..], p);
                assert filtered == [original[0]] + filtered[1..];
            }
        }
        else {
            assert original == [original[0]] + original[1..];
            assert filter(original, p) == filter(original[1..], p);
            EquivalenceLemma(original[1..], filtered, p);
            assert filtered == filtered;
            assert filtered == filter(original, p);
        }
    }
}
*/

// Prove that adding one element to both seqs preserves the relative order of the elements
lemma SameSequenceLemma<T>(original: seq<T>, filtered: seq<T>, i: T, p: T -> bool) 
    requires filtered == filter(original, p)
    ensures p(i) ==> filtered + [i] == filter(original + [i], p)
    ensures !p(i) ==> filtered == filter(original + [i], p)
{
    if original == [] {
        assert original + [i] == [i];
        assert filtered + [i] == [i];
        assert p(i) ==> filter(original + [i], p) == [i];
        assert !p(i) ==> filter(original + [i], p) == [];
    } else {
    if p(original[0]) {
        assert original + [i] == [original[0]] + (original[1..] + [i]);
        assert filter(original + [i], p) == [original[0]] + filter(original[1..] + [i], p);
        SameSequenceLemma(original[1..], filtered[1..], i, p);
        assert p(i) ==> filtered[1..] + [i] == filter(original[1..] + [i], p);
        assert !p(i) ==> filtered[1..] == filter(original[1..] + [i], p);
        assert filtered + [i] == [original[0]] + (filtered[1..] + [i]);
        assert p(i) ==> filtered + [i] == filter(original + [i], p);
        assert !p(i) ==> filtered == filter(original + [i], p);
    } else {
        assert original + [i] == [original[0]] + (original[1..] + [i]);
        assert filter(original + [i], p) == filter(original[1..] + [i], p);
        SameSequenceLemma(original[1..], filtered, i, p);
        assert filtered + [i] == filtered + [i];
        assert p(i) ==> filtered + [i] == filter(original + [i], p);
        assert !p(i) ==> filtered == filter(original + [i], p);
    }
    }
}

