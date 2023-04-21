import java.util.ArrayList;
import java.util.Scanner;

public class reverse {
    //reverse the full 32 bit value
    static int x;
    static ArrayList y;

    //constructor
    public reverse(int x){
        this.x = x;
    }
    public static void main(String[] args) {
        //x = user input
        Scanner myObj = new Scanner(System.in);  // Create a Scanner object
        System.out.println("Enter 32 bit number:");

        String x = myObj.nextLine();

        for(int i = 0; i < x.length(); i++){
            System.out.print(x.charAt((x.length()-1-i)));
        }

    }

}
