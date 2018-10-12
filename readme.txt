For mystery.s, I tried a few outputs close to 0 to start, and it became clear quickly that
the program was producing output for the fibonacci sequence. Next, I went into the file
and commented on everything I understood in an attempt to figure out what the optimization was.
After that, when I saw that things were being set to -1 for a certain condition, and something was being
set to 0 and something was being set to 1, I realized it was similar to the memoization
tactic. So, I implemented memoization and recursive calls as mystery.s did, but it was
still very slow, so I removed the recursive code and made a better optimized iterative version instead.
It still uses the memoization optimization, but does not use recursion.

As for formula, I just figured out what I needed to have in each part of the program in C,
and then wrote the assembly in the same way. The C program is very short, but the assembly is
almost 200 lines with all of the instructions.
