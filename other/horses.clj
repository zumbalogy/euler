;; there are 25 horses
;; you can run five races at a time
;; each race can have five horses
;; you can only judge horses relative to each other. no stopwatches invented yet or anything.
;; what is the minimum number of rounds it takes
;; to garuntee you can identify the three fastest horses


run 5, pick top 3.
race the next two, race the next two...
that would take 11 races


5 races
pick top 3 of each
now you have 15 horses
3 races
pick top 3 of each
now you have 9 horses
2 races, top 3 of each
6 horses
2 races
you have your top 3
-- so this is 12 races i think


5 races
now have 15 horses
3 races
9 horses
1 race, top 3 of that race go to 1 race, top of that go to 1 race
so thats 11 races

5 races, 15 horses
1 race, + 5 races of remanders,
thats 11 races total


---------------------------------

2 races, 6 candidates, one race and now 4.
so, 3 races to go from 10 to 4

so, 6 races, have 8, + 5, so 12

-- and that seems rubbish.

------------------------------------


so, lets say i have one race. now i have 3 candidates, 2 discards, and 20 other horses.

now if i have 3 races, with 1 of my previous candidates each. at the end,
i could have 3 to 9 candidates left over from that. and 8 other horses.

4 races. between 3 and 9 candidates, and 8 others.

if its 3 candidates (the original winners), i could race 4 more times, and that would be 8 and in the know.
and if its 9 and i use the same method (1 race, then 3 winners vs 2 others, repeat), its 10 races total

if i have 3 or 4 candidates, i could have 2 more races. each with 1 or 2 candidates, and 3 or 4 new/other horses

and then one more race because i would have 4 candidates now. thats 7 races. but if it were 9 candidates

????


--------------------------------------------


new technique. have one race. 3 winners, and they are ranked, i assume.
so you take your weakest horse, have a race with 4 new horses. worse case it is last place, and you now have
2 + 3 candidates. so 5. but best case, it wins, still 3. so 3-5 candates, and 16 horses left, after 2 races.
take another 4, and you add at most 2 canidates. so, 3-7 candidates, 12 horses.

3, 20 horses
3-5, 16 horses
3-7, 12 horses
3-9, 8 horses
3-12, 4 horses
3-15, 0 horses

so, in 6 races you could know. but what about more bookkeeping?

---------------------------------------------------------------

o = other
- = looser
a,b,c = gold,silver,bronze

ooooo ooooo ooooo ooooo ooooo
abc-- abc-- abc-- abc-- abc--

now if all the As fight, that will knock out 2 As, plus the Bs and Cs that follow them.
and the last place A knows its B and C are out.
and the silver A knows its C is out.

abc-- ab--- a---- ----- -----

6 races, 6 horses. now at this point, the only valid top 3 of all of them would be:
a---- a---- a---- ----- -----

abc-- ----- ----- ----- -----

ab--- a---- ----- ----- -----
a---- ab--- ----- ----- -----
----- ab--- a---- ----- -----

so, if we race BC AB A
the winners could be
BC AB A

BC A- -
B- AB -
B- A- A
BC -- A
-- AB A

(assuming the same horse always races the same speed and all)

and, you might now know the order of your top 3, but you will know they are in the top 3
7 races.
One of the key things here is that we know the ranking of the As to each other at this point.
The first A is a shoe in, just have to see how the rest stacks up against its B and C.

-------------------------------------------------------------

o = other
- = looser
a,b,c = gold,silver,bronze

ooooo ooooo ooooo ooooo ooooo
abc-- ooooo ooooo ooooo ooooo
