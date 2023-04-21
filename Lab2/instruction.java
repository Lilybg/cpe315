import java.util.ArrayList;
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

public class instruction {
    String[] instruct = {"and", "or", "add", "sub", "slt", "beq", "bne", "lw", "sw", "j", "jr","jal"};

    public instruction(){
    }

    public static void main(String[] args) {
        ArrayList<String> instructions = new ArrayList<String>();
        instructions.add("and");
        instructions.add("or");
        instructions.add("add");
        instructions.add("addi");
        instructions.add("sll");
        instructions.add("sub");
        instructions.add("slt");
        instructions.add("beq");
        instructions.add("bne");
        instructions.add("lw");
        instructions.add("sw");
        instructions.add("j");
        instructions.add("jr");
        instructions.add("jal");
        try {
            File myObj = new File("test5.asm");
            Scanner myReader = new Scanner(myObj);

            //first parse through file
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                for (String t : instructions){          //if the new line of the file contains an instruction
                    if(data.contains(t)){
                        String[] in = data.split(","); //creates a new array of strings split from commas
                        for (int i = 0; i < in.length; i++) {
                            System.out.println(in[i]);
                        }
                    }
                }
            }
            myReader.close();

        }
        catch (FileNotFoundException e) {
            System.out.println("File not found!");
            e.printStackTrace();
        }

    }
}
