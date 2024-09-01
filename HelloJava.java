import java.util.stream.*;

public class HelloJava {
    public static void main(String[] args) {
        System.out.println("hello?");
        IntStream.range(0, args.length).forEach(i -> System.out.println(args[i]));
    }
}
