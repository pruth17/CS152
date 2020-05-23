# CS152 SJSU

Wrote a module for adding programming contracts
to JavaScript functions. For more details on programming contracts,
see http://se.ethz.ch/~meyer/publications/computer/contract.pdf.

A contract is a JavaScript function that takes in one argument
and returns true if the argument meets certain conditions;
otherwise it returns false. (The functions may have an optional
"expected" property for more informative error messages).

Programming contracts are focused on ensuring that the inputs to a function are correct,
and that the return value is correct. Most importantly, when something does go wrong,
the contract library should be able to identify who is at fault -- the library writer,
or the user of the library.

Implemented the contract function in contracts.js. It takes in a list of pre-conditions,
a post-condition, and the function itself. If any of the pre-conditions are not met,
throw an exception blaming the caller. If the post-condition is not met, throw an
exception blaming the library. 

JavaScript Proxies can simplify asserting properties about the parent object.

The example2.js file contains some contracts involving objects.
To handle this case, you will need to use the handler.apply
and the handler.construct traps. Your output should exactly
match example2.output.

In example3.js, we see an alternate approach using objects.
There is a custom contract that uses the 'this' keyword to refer to
the object containing the method. Again, your output should
match example3.output exactly.
