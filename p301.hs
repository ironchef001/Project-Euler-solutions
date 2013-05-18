{- 
 - Solution to Project Euler problem 301
 - By Nayuki Minase
 - 
 - http://nayuki.eigenstate.org/page/project-euler-solutions
 - https://github.com/nayuki/Project-Euler-solutions
 -}

import Data.Bits ((.&.))


{- 
 - In a game of Nim where both players play with perfect strategy, if the current state is a collection (multiset) of piles
 - with sizes {n1, n2, ..., n_m}, then the current player will lose if and only if n1 XOR n2 XOR ... XOR n_m = 0.
 - In this problem, we specialize the condition to just n XOR 2n XOR 3n = 0.
 - 
 - Facts:
 -   3n = 2n + n.
 -   a ^ b = 0 iff a = b. (from digital logic)
 -   a + b = (a ^ b) + ((a & b) << 1). (from digital logic)
 - Hence:
 -   n ^ 2n ^ 3n = 0                          (what we want)
 -   iff n ^ 2n = 3n                          (from the second fact)
 -   iff n ^ 2n = (n ^ 2n) + ((n & 2n) << 1)  (from the third fact)
 -   iff (n & 2n) << 1 = 0                    (by cancelling on both sides)
 -   iff n & 2n = 0                           (left-shifting doesn't change zeroness)
 -   iff the binary representation of n does not have consecutive '1' bits.
 -}
main = putStrLn (show ans)
ans = length [() | n <- ([1..2^30] :: [Integer]), n .&. (n * 2) == 0]
