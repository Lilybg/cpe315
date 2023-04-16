import java.util.Scanner;

public class exponent {
    //x raised to the power of y
    static int x;
    static int y;

    public exponent(int x, int y){
        this.x = x;
        this.y = y;
    }

    //you may use repeated addition
    public static void main(String[] args) {
        Scanner myObj = new Scanner(System.in);  // Create a Scanner object
        System.out.println("x:");
        String x = myObj.nextLine();
        Scanner myObj2 = new Scanner(System.in);  // Create a Scanner object
        System.out.println("y:");
        String y = myObj2.nextLine();

        int temp = Integer.valueOf(x);
        int z = 0;

        for (int i = 0; i <= (Integer.valueOf(y)-2); i++) {
            for (int n = i; n < Integer.valueOf(x); n++) {
                z = z + temp;
            }
            temp = z;
            System.out.printf(String.valueOf(z));
        }
        System.out.print(("/n"));
        System.out.printf(String.valueOf(z));
    }
}
