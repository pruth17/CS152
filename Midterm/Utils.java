import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.BiPredicate;
import java.util.function.Function;

import static java.lang.System.out;

/*
 * Problem 6: Java lambdas.
 *
 * These exercises are designed to test your understanding of
 * Java lambdas.  It is divided up into 2 parts.
 *
 * Part a: Implement the sort method.  Details are given above
 * that method.
 *
 * Part b: Look at the 'map' method in this file.  In the useMap
 * method, pass in the appropriate lambdas to map to get the
 * results that you expect.  Again, more details are provided
 * above that method.
 *
 * Expected output for this program is given in 6_ExpectedOutput.txt.
 */

/**
 * Employee class, because I am not very imaginative coming up with examples.
 */
class Employee {
    private String firstName;
    private String lastName;

    public Employee(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String toString() {
        return firstName + " " + lastName;
    }
}

public class Utils {

    /**
     * This function should take a list of elements and sort them in-place. You must
     * write your own sorting method, but you can use whatever algorithm you prefer.
     *
     * In your sorting algorithm, you must use the pred BiPredicate to determine the
     * appropriate order. If 'pred' returns true, the first argument should come
     * before the second argument in the list.o
     *
     * For details on BiPredicate, visit
     * https://docs.oracle.com/javase/8/docs/api/java/util/function/BiPredicate.html
     */
    public static <T> void sort(List<T> lst, BiPredicate<T, T> pred) {

        for (int i = 0; i < lst.size(); i++) {
            int min_idx = i;
            for (int j = i + 1; j < lst.size(); j++) {
                if (pred.test(lst.get(j), lst.get(min_idx))) {
                    min_idx = j;
                    
                }
            }

            T temp = lst.get(min_idx);
            lst.set(min_idx, lst.get(i));
            lst.set(i, temp);

        }
    }

    /**
     * This function works similarly to the map function in Scheme. It takes in a
     * list of elements, applies the function f to each element, and puts the
     * results together in a new list.
     *
     * You will use this method in the useEmp method.
     */
    public static <T, U> List<U> map(List<T> lst, Function<T, U> f) {
        List<U> result = new ArrayList<U>();
        lst.forEach(x -> result.add(f.apply(x)));
        return result;
    }

    public static void testSort1() {
        out.println("Starting testSort1");
        List<Integer> lint = new ArrayList<Integer>(Arrays.asList(1, 2, 93, -1, 3, 22, 9));
        out.println("Initial: " + lint);
        Utils.sort(lint, (x, y) -> x < y);
        out.println("Sorted: " + lint);
        Utils.sort(lint, (x, y) -> x > y);
        out.println("Reverse sorted: " + lint);
        out.println();
    }

    public static void testSort2() {
        out.println("Starting testSort2");
        List<Employee> emps = new ArrayList<Employee>(Arrays.asList(new Employee("Norah", "Jones"),
                new Employee("Chris", "Smith"), new Employee("Mark", "Growden"), new Employee("Tom", "Waits"),
                new Employee("Bob", "Smith"), new Employee("Joe", "Smith")));
        out.println("Initial: " + emps);
        Utils.sort(emps, (a, b) -> {
            int c = a.getLastName().compareTo(b.getLastName());
            if (c == 0)
                c = a.getFirstName().compareTo(b.getFirstName());
            return c < 0;
        });
        out.println("Sorted: " + emps);
        out.println();
    }

    /**
     * You must call map with 3 different lambda functions.
     *
     * 1) Map a function squaring all numbers in a list.
     *
     * 2) Convert a list of numbers to a list of strings.
     *
     * 3) Return a list of strings showing how many digits each number in the input
     * list contains.
     *
     */
    public static void useMap() {
        List<Integer> lint = new ArrayList<Integer>(Arrays.asList(1, 2, 93, -1, 3, 22, 9));

        out.println("Starting useMap 1");
        List<Integer> squaredList = Utils.map(lint, x -> x * x);
        
        out.println("Squared elements: " + squaredList);

        out.println("Starting useMap 2");
      
        List<String> stringList = Utils.map(lint, n -> String.valueOf(n));
        out.println("Numbers as strings: " + stringList);

        out.println("Starting useMap 3");
        
        List<String> countDigits = Utils.map(lint, n -> n + " : " + String.valueOf(n).length());
        
        out.println("Count of digits: " + countDigits);
    }

    public static void main(String[] args) {
        testSort1();
        testSort2();

        useMap();
    }

}
