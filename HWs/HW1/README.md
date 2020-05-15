# CS152 SJSU
Learned how Racket (Scheme) handles big numbers.

Consider the following Java program (available in Test.java).

  public class Test {
    public void main(String[] args) {
      System.out.println(999999999999999999999 * 2);
    }
  }

You could easily calculate 999999999999999999999 * 2 with pencil and paper;
Java cannot handle it.

  $ javac Test.java
  Test.java:3: error: integer number too large: 999999999999999999999
      System.out.println(999999999999999999999 * 2);
                         ^
  1 error

With Racket, there is no problem:

  $ racket
  Welcome to Racket v6.0.1.
  > (* 999999999999999999999 2)
  1999999999999999999998
  >


Implemented a simplified big-num module to understand it better.

In the implementation, a number will be a list of "blocks" of numbers from 0-999,
stored with the least significant "block" first. So 9,873,201 will be
stored as:

