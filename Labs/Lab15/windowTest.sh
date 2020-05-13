#!/bin/sh
# Update jar file to match your system
# (Windows version courtesy of Alexander Jacobsen).
rm -r out
mkdir out
java -jar antlr-4.8-complete.jar -no-listener -visitor Expr.g4 -o out/
cp *.java out/
javac -cp ".;out;./antlr-4.8-complete.jar" out/*.java
java -classpath ".;out/;antlr-4.8-complete.jar" Calc $1
Read-Host -Prompt "Press Enter to exit"
