import java.util.Scanner;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
public class StockAnalysis {

	public static void main(String[] args) {
		
		//Initializes the main string that is mutated as it is processed
		//String mainsubstring = null;
		//
		
		//Scanner to import the .TXT file
		Scanner in = new Scanner(System.in);
        System.out.println("Please enter transactions file name: ");
        String filename = in.nextLine();
        
        Scanner input = null;
        try {
           input = new Scanner(new FileInputStream(filename));    
        } 
        catch(FileNotFoundException fnfe) {
           System.out.println("File " + filename + " was not found or could not be opened.");
           fnfe.printStackTrace();
           System.exit(0);
        }
        //end
        
        //Initializing LinkedQueues
        LinkedQueue<Transaction> all = new LinkedQueue<Transaction>();
        LinkedQueue<Transaction> buy = new LinkedQueue<Transaction>();
        //end
        
        
        while(input.hasNextLine()){ 
        	String mainstring = input.nextLine();
        	System.out.println(mainstring);
        	String selling = mainstring.substring( 0, 4);
        	//System.out.println(selling);
        	if (selling.equals("buy ")) {
        		//System.out.println("false");
        		boolean sell = false;
        		String mainsubstring =  mainstring.substring( 4, mainstring.length());
        	}else if(selling.equals("sell")) {
        		//System.out.println("true");
        		boolean sell = true;
        		String mainsubstring =  mainstring.substring( 5, mainstring.length());
        	}else {
        		System.exit(0);
        	}
        	int amtshares;
        	int index = 0;
        	//char numb = mainstring2[index];
        	while (Character.isDigit(mainsubstring.charAt(index))) {
        		index++;
        	}
        	String amtsharestring = mainsubstring.substring( 0, index);
        	amtshares = Integer.parseInt(amtsharestring);
        	//System.out.println(amtshares);
        	mainsubstring = mainsubstring.substring( index+12, mainsubstring.length());
        	//System.out.println(mainsubstring);
        	int priceshare;
        	index = 0;
        	while (Character.isDigit(mainsubstring.charAt(index))) {
        		index++;
        	}
        	String pricepershare = mainsubstring.substring( 0, index);
        	priceshare = Integer.parseInt(pricepershare);
        	all.add(new Transaction(sell,amtshares,priceshare));
        	//System.out.println(amtshares + " " + priceshare);
        	
        } 

        
        //PROCESSING
        //New scanner to print out the "Processing: " statements
        double capitalgain = 0;
        int sharesleft = 0;
        Scanner input2 = null;
        try {
           input2 = new Scanner(new FileInputStream(filename));    
        } 
        catch(FileNotFoundException fnfe) {
           System.out.println("File " + filename + " was not found or could not be opened.");
           fnfe.printStackTrace();
           System.exit(0);
        }
        
        
        while(input2.hasNextLine()){
        	String transaction = input2.nextLine();
        	System.out.println("Processing transaction: " + transaction);
        	Transaction temp = all.remove();
        	if(!temp.isSell()) {
        		buy.add(temp);
        	}else if(temp.isSell()) {
        		if(buy.isEmpty()) {
        			System.out.println("Error: attempt to sell non-existing shares!");
        			System.exit(0);
        		}
        		//int pricesold = temp.getPrice();
        		int amountsold = temp.getNumber();
        		Transaction bought = buy.peek();
        		//int pricebought = bought.getPrice();
        		int amountbought = bought.getNumber();
        		while(amountsold > 0) {
        			if(amountbought <= 0) {
            			bought = buy.remove();
            			if(buy.isEmpty()) {
                			System.out.println("Error: attempt to sell non-existing shares!");
                			System.exit(0);
                		}
            			bought = buy.peek();
                		//pricebought = bought.getPrice();
                		amountbought = bought.getNumber();
            		}
        			capitalgain += (temp.getPrice()-bought.getPrice());
        			amountsold--;
        			amountbought--;
        			bought.changeNumber(amountbought);
        			
        		}
        	}
        }
        Transaction leftover = buy.peek();
        while(!buy.isEmpty()) {
        	leftover = buy.peek();
        	leftover = buy.remove();
        	sharesleft += leftover.getNumber();
        }
        System.out.println("Capital gain is " + capitalgain);
        System.out.println("There are " + sharesleft + " shares left.");
        input.close();
        in.close();
        
	}

}
