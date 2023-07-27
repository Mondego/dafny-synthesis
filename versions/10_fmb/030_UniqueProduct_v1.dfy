method UniqueProduct (arr: array<int>) returns (product: int)
   ensures product == SetProduct((set i | 0 <= i < arr.Length :: arr[i]))
{
}
ghost function SetProduct(s : set<int>) : int
}
{
    if s == {} then 1
    else var x :| x in s; 
         x * SetProduct(s - {x})
}

/* 
 * This is necessary because, when we add one element, we need to make sure
 * that the product of the new set, as a whole, is the same as the product
 * of the old set times the new element.
 */
lemma SetProductLemma(s: set <int>, x: int) 
 requires x in s
 ensures SetProduct(s - {x}) * x == SetProduct(s)
{
   if s != {}
   {
      var y :| y in s && y * SetProduct(s - {y}) == SetProduct(s);
      if y == x {}
      else {
         calc {
            SetProduct(s);
            y * SetProduct(s - {y});
            { SetProductLemma(s - {y}, x); }
            y * x * SetProduct(s - {y} - {x});
            { assert s - {x} - {y} == s - {y} - {x};}
            y * x * SetProduct(s - {x} - {y});
            x * y * SetProduct(s - {x} - {y});
            { SetProductLemma(s - {x}, y); }
            x * SetProduct(s - {x});
         }
      }
   }
}