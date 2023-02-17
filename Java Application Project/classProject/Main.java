package classProject;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.Parent;

public class Main extends Application { 

    /**
     * @param stage - This method takes a Stage object to initiate the GUI.
     * @postcondition The home screen of the GUI should have been loaded.
     * @note This method is never explicitly called, it is only used by the 
     *       launcher in the main method.
     */
	@Override
    public void start(Stage stage) { 
		
        try {
        	
        	// Loads the home page.
            Parent root = FXMLLoader.load(getClass().getResource("hikingHabitsUI.fxml"));
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
            
        } catch (Exception e) { 
        	
            e.printStackTrace();
            
        } // end catch
   } // end start

   public static void main(String[] args) {
	   
       launch(args);
       
   } 

} 