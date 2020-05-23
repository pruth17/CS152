# CS152 SJSU

Wrote a parser and an interpreter for Featherweight JavaScript (FWJS), a minimal version of JavaScript.

Values in this language include booleans, ints, a special null values, and closures.  A closure is a combination of a function definition and its scope environment tracking any free variables in the function body.

Expression.java contains the representation for all expressions in FWJS.  Each class implements the evaluate method, which takes in an Environment (i.e. the mapping of variables to values) and returns a value.  The types of Values are stored in Value.java.

FunctionDeclExpr takes a list of parameter names and a body.  When evaluated, it returns a closure included the environment used when it was defined.

FunctionAppExpr takes an expression (which should evaluate to a closure) and a list of arguments.  When evaluated, the environment is ignored.  Instead a new environment is created including all of the parameters with the arguments bound to the parameter names.  Note that you will need to evaluate each argument to a value before the closure.apply method can be used.

Environment.java handles the resolution of JavaScript variables.  Update the resolveVar and updateVar methods to handle variable lookup correctly.

Wrote the lexer and parser for this language using ANTLR and added parsing rules.

ExpressionBuilderVisitor.java constructs an AST of Expressions (from Expression.java).

  
