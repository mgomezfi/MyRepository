import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
//Marco A. Gomez Fierro
//CS371- SOFTWARE DEVELOPMENT
//DIRLISTER

import java.nio.file.Paths;

public class dirlister {
	
	public class Lister {
		
		//Function that prints out contents of directory taking string as a parameter
		
		public void DirListbuilder( String dir ) {
			
			//Creates path from string that the program can use to look through the directory
			Path pathdir = Paths.get(dir);
			
			//Try-catch statement. Try program, if not throw error
			try (DirectoryStream<Path> stream = Files.newDirectoryStream(pathdir)) {
				
				//for each item in directory
				for (Path entry: stream) {
					
					//If Directory, print out "D"
					if ( entry.toFile().isDirectory()) {
						
						System.out.print("D    ");
						
					}else if (entry.toFile().isFile()) {	//If file, print out "F"
						
						System.out.print("F    ");
						
					}else {	//Else print out "O" for other
						
						System.out.print("O    ");
						
					}
					
					//Prints out size with field width of 12
					System.out.printf("%-12d", Files.size(entry));
					
					////Prints name of file/directory/other
					System.out.println(entry.getFileName().toString());
				}
				
				}catch( Exception e ) {	//Error handling
					
					if( !pathdir.toFile().isDirectory() ) {//If argument is a file or other
						
						System.out.printf("Sorry, %s is not a directory!\n", dir);
						
					}else {//Argument couldn't be found
						
						System.out.printf("Sorry, %s does not exist!\n", dir);
						
					}
					
				}
			
		}
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
        String dir;	//For the sake of complexity I casted the arguments to a string
        
        if(args.length == 0) { //If nothing is in the argument, it prints out current directory
        	dir = ".";
        	
        }else {	//Else if there is any contents, search the directory in the argument
        	
        	dir = args[0];
        	
        }
        //Creates object and passes it to a fujnction in that object class to print out contents
        
        dirlister direc = new dirlister();
        Lister DirectoryList = direc.new Lister();
        
        //Actual function call
        
        DirectoryList.DirListbuilder(dir);
	}

}
