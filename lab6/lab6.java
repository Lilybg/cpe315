import jdk.dynalink.beans.StaticClass;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class lab6 {
    //Cache Variables
    static Integer blockOffset = 0;
    static Integer index = 1;
    static Integer addr;
    static ArrayList<Integer> hits = new ArrayList<>(7);
    static ArrayList<Float> hitRate = new ArrayList<>(7);
    public static void main(String[] args) {
        //Cache 1
        //2KB, direct mapped, 1-word blocks
        ArrayList<Integer> cache1 = new ArrayList<>(2048);

        //Cache 2
        //2KB, direct mapped, 2-word blocks
        HashMap<Integer,ArrayList> cache2 = new HashMap<>(2048);

        //Cache 3
        //2KB, direct mapped, 4-word blocks
        HashMap<Integer,ArrayList> cache3 = new HashMap<>(2048);

        //Cache 4
        //2KB, 2-way set associative, 1-word blocks
        HashMap<ArrayList,Integer> cache4 = new HashMap<>(2048);

        //Cache 5
        //2KB, 4-way set associative, 1-word blocks
        HashMap<ArrayList,Integer> cache5 = new HashMap<>(2048);

        //Cache 6
        //2KB, 4-way set associative, 4-word blocks
        HashMap<ArrayList,ArrayList> cache6 = new HashMap<>(2048);

        //Cache 7
        //4KB, direct mapped, 1-word blocks
        HashMap<Integer,Integer> cache7 = new HashMap<>(4096);

        //Read input file
        try{
            File myObj = new File(args[0]);
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                data.trim();

                //store address as an integer
                //convert the hex string to an int
                addr = stringToBin(data);
                System.out.println(data);
                System.out.println(addr);

                //Check each cache for if there was a hit
                //store addr if there is no hit
                //cache 1
                for(int i = 0; i < cache1.size(); i++){
                    if((cache1.get(0) == null)|(addr != cache1.get(i))){
                        cache1.add(i, addr);
                    }
                    else{
                        hits.add(1,hits.get(0) + 1);
                    }
                }

            }
            myReader.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found!");
            e.printStackTrace();
        }
        hitRate.add(1, 100*(Float.valueOf(hits.get(0))/cache1.size()));

        //output print
        System.out.println("Cache #1");
        System.out.println("Cache size: 2048B Associativity: 1 Block size: 1");
        System.out.println("Hits: " + hits.get(0) + " Hit Rate: " + hitRate.get(0) + "%");
        System.out.println("---------------------------");
        System.out.println("Cache #2");
        System.out.println("Cache size: 2048B Associativity: 1 Block size: 2");
        System.out.println("Hits: " + hits.get(1) + " Hit Rate: " + hitRate.get(1) + "%");
        System.out.println("---------------------------");
        System.out.println("Cache #3");
        System.out.println("Cache size: 2048B Associativity: 1 Block size: 4");
        System.out.println("Hits: " + hits.get(2) + " Hit Rate: " + hitRate.get(2) + "%");
        System.out.println("---------------------------");
        System.out.println("Cache #4");
        System.out.println("Cache size: 2048B Associativity: 2 Block size: 1");
        System.out.println("Hits: " + hits.get(3) + " Hit Rate: " + hitRate.get(3) + "%");
        System.out.println("---------------------------");
        System.out.println("Cache #5");
        System.out.println("Cache size: 2048B Associativity: 4 Block size: 1");
        System.out.println("Hits: " + hits.get(4) + " Hit Rate: " + hitRate.get(4) + "%");
        System.out.println("---------------------------");
        System.out.println("Cache #6");
        System.out.println("Cache size: 2048B Associativity: 4 Block size: 4");
        System.out.println("Hits: " + hits.get(5) + " Hit Rate: " + hitRate.get(5) + "%");
        System.out.println("---------------------------");
        System.out.println("Cache #7");
        System.out.println("Cache size: 4096B Associativity: 1 Block size: 1");
        System.out.println("Hits: " + hits.get(6) + " Hit Rate: " + hitRate.get(6) + "%");
        System.out.println("---------------------------");

    }

    public static Integer stringToBin(String data){
        String addr = "";
        for (int i = 0; i < data.length(); i++){
            switch(data.charAt(i)){
                case '0':
                    addr = addr + "0000";
                    break;
                case '1':
                    addr = addr + "0001";
                    break;
                case '2':
                    addr = addr + "0010";
                    break;
                case '3':
                    addr = addr + "0011";
                    break;
                case '4':
                    addr = addr + "0100";
                    break;
                case '5':
                    addr = addr + "0101";
                    break;
                case '6':
                    addr = addr + "0110";
                    break;
                case '7':
                    addr = addr + "0111";
                    break;
                case '8':
                    addr = addr + "1000";
                    break;
                case '9':
                    addr = addr + "1001";
                    break;
                case 'a':
                    addr = addr + "1010";
                    break;
                case 'b':
                    addr = addr + "1011";
                    break;
                case 'c':
                    addr = addr + "1100";
                    break;
                case 'd':
                    addr = addr + "1101";
                    break;
                case 'e':
                    addr = addr + "1110";
                    break;
                case 'f':
                    addr = addr + "1111";
                    break;
                default:
                    System.out.println("Invalid character: " + data.charAt(i));

            }
        }
        System.out.println(addr);
        Integer index = 0;
        for (int i = 0; i < 4; i++){
            System.out.println(addr.charAt(i));
            if((addr.charAt(i) == 0)&(i>index)){
                index = i;
                System.out.println(i);
            }
        }
        addr.substring(index);
        System.out.println("00011111111111111111111100001000");
        return Integer.valueOf(addr);
    }
}