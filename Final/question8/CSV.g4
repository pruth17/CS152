grammar CSV;

// Literals
STRING  : '"' ~["\n\r]*? '"' | '\'' ~['\n\r]*? '\'' ;
NUMBERS : ([1-9][0-9]* | '0') | ([1-9][0-9]* '.' [0-9]* | '0' '.' [0-9]+) ;
NEWLINE : [\r\n] | [\n];

// Whitespace
WS      : [ \t]+ -> skip ; // ignore whitespace


file: line* ;


line: cell (', ' cell)* NEWLINE
    | NEWLINE
    ;
cell : STRING | NUMBER;

