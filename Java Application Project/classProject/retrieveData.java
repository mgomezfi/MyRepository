package classProject;

import java.sql.*;
import java.util.*;
import java.io.*;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

/**
 * 
 * @note This module class is in charge of connecting the database and sending queries
 *       and receiving result sets. All methods and variables are used statically.
 *
 */
public class retrieveData {
	
	private static String userID = "root";
	private static String password = "CS371HikingHabits";
	private static String address = "jdbc:mysql://127.0.0.1:3306/hikinghabits_schema";
	private static String search;
   private static String advancedSearch = "";
   private static String searchUser;
   private static String accountUsername;
   private static String accountPassword;
   private static routeSearchModel rsm;
   private static String locationID;
   private static boolean loggedIn = false;
	
   /**
    * @return ObservableList<routeSearchModel> - This list contains all the activities returned from the 
    *                                            search query.
    * @precondition The database should be available for connection.
    * @postcondition An ObservableList should have been returned containing any number
    *                activities from the database.
    * @throws SQLException - This exception handles problems with the search query.
    * @throws Exception - This handles any connection error with the database.
    * @note This method is used to search for specified activities and their corresponding
    *       location information.
    */
   public static ObservableList<routeSearchModel> getList() {
		
		// Initializes a list for the table view.
		ObservableList<routeSearchModel> list = FXCollections.observableArrayList();
		
		try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
				
				// Sends a search query to the database using the search string,
				// and receives a result table.
				ResultSet rs = stmt.executeQuery("select *\n" +
	                  	"from Activity A natural join Location L\n" +
	                  	"where (A.activityName like '%" + search + "%') or (A.aType like '%" + search + "%') or (L.locationName like '%" + search + "%')\n" +
	                  	"order by A.activityName asc;");
			
				// Adds every item to the list.
				while (rs.next())
					list.add(new routeSearchModel(rs.getString("activityID"), rs.getString("activityName"), rs.getString("difficulty"), rs.getString("locationName")));
			
			} // end try
			catch (SQLException sql) {
				System.out.println("Could not retrieve data: " + sql);
			} // end catch
			
			conn.close();
			
		} // end try
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
		
		// Returns the list to the sceneController.
		return list;
		
	} // end getList()
   
   /**
    * @return ObservableList<routeSearchModel> - This list contains all the activities returned from the 
    *                                            search query.
    * @precondition The database should be available for connection.
    * @postcondition An ObservableList should have been returned containing any number
    *                activities from the database.
    * @throws SQLException - This exception handles problems with the search query.
    * @throws Exception - This handles any connection error with the database.
    * @note This method is used to search for specified activities and their corresponding
    *       location information using a search string generated from the advanced search..
    */
   public static ObservableList<routeSearchModel> getListAdvanced() {
		
		// Initializes a list for the table view.
		ObservableList<routeSearchModel> list = FXCollections.observableArrayList();
		
		try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
				
				// Sends a search query to the database using the search string,
				// and receives a result table.
				ResultSet rs = stmt.executeQuery(advancedSearch);
			
				// Adds every item to the list.
				while (rs.next())
					list.add(new routeSearchModel(rs.getString("activityID"), rs.getString("activityName"), rs.getString("difficulty"), rs.getString("locationName")));
			
			} // end try
			catch (SQLException sql) {
				System.out.println("Could not retrieve data: " + sql);
			} // end catch
			
			conn.close();
			
		} // end try
		
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
		
		// Returns the list to the sceneController.
		return list;
		
	} // end getListAdvanced()
   
   /**
    * @param p - A Profile object that contains information used to create 
    *            a new profile entity in the database.
    * @precondition The database should be available for connection.
    * @postcondition A new profile should have been inserted into the database table.
    * @throws SQLException - This handles any problems with the query sent to the database.
    * @throws Exception - This handles any connection errors.
    * @note This method creates a new profile in the database using the Profile object parameter.
    */
   public static void createProfile(Profile p) {
      
      try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
         
            String aboutMe = p.getAboutMe();
            aboutMe = aboutMe.replace("'", "\\'");
				
            // Creates a string for the insert query.
            String insert = "INSERT INTO `Profile` VALUES ('" + p.getUserName() + "', '" + p.getPassword() + "', '" +
                               p.getFirstName() + "', '" + p.getLastName() + "', '" + p.getEmail() + "', '" + aboutMe + "');";
				// Sends the query to the database.
            stmt.executeUpdate(insert);
			
			} // end try
			catch (SQLException sql) {
				System.out.println("Profile already exists: " + sql);
			} // end catch
			
			conn.close();
			
		} // end try
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
      
   } // end createProfile
   
   /**
    * @param p - A Profile object that is used to edit an existing profile.
    * @precondition The database should be available for connection.
    * @postcondition The user's profile should have been edited as desired.
    * @throws SQLException - This handles any problems with the update query.
    * @throws Exception - This handles any problems with the database connection.
    * @note This method is used to edit a user's profile using the Profile parameter
    *       as the new set of attributes.
    */
   public static void mutateProfile(Profile p) {
	   
	   try {
	      // Connects to the database and creates an SQL query.
	      Connection conn = DriverManager.getConnection(address, userID, password);
	      Statement stmt = conn.createStatement();
	      try {
		      ResultSet rs = stmt.executeQuery("select *\n" +
	                  	"from `Profile`\n" +
	                  	"where userName = '" + accountUsername + "';");
		      rs.next();
		      
		      String user = rs.getString("userName");
		      String fName = rs.getString("firstName");
		      String lName = rs.getString("lastName");
		      String mail = rs.getString("email");
		      String pass = rs.getString("password");
            String bio = rs.getString("aboutMe");
		      
		      if ( p.getUserName().isEmpty() ){
			      p.setUserName(user);
		      }
		      
		      if ( p.getFirstName().isEmpty() ){
			      p.setFirstName(fName);
		      }
		      
		      if ( p.getLastName().isEmpty() ){
			      p.setLastName(lName);
		      } 
		      
		      if ( p.getEmail().isEmpty() ){
			      p.setEmail(mail);
		      }     
		      
		      if ( p.getPassword().isEmpty() ){
			      p.setPassword(pass);
		      }
            
            if (p.getAboutMe().isEmpty() ){
               p.setAboutMe(bio);
            }
            
            String aboutMe = p.getAboutMe();
            aboutMe = aboutMe.replace("'", "\\'");

		      // Creates a string for the delete query.
		      String update = "UPDATE `Profile` SET `password` = '" + p.getPassword() + "', firstName = '" + p.getFirstName() + "', lastName = '" + p.getLastName() + "', email = '" + p.getEmail() + "', aboutMe = '" + aboutMe + "' WHERE userName = '" + accountUsername + "';";
		      // Sends the query to the database.
		      stmt.executeUpdate(update);
		     
            accountUsername = p.getUserName();
            accountPassword = p.getPassword();
			
	      } // end try
	      catch (SQLException sql) {
		      System.out.println("Error modifying profile: " + sql);
	      } // end catch
	      
	      conn.close();
	      
		} // end try
	   catch (Exception sqle) {
		   
		   System.out.println("Error: " + sqle);
		   
	   } // end catch
	   
   } // end createProfile
   
   /**
    * @return A boolean that indicates the existence of a profile.
    * @precondition The database should be available for connection.
    * @postcondition A boolean should have been returned and the LoggedIn
    *                variable should have been changed.
    * @throws SQLException - Handles any problem with the select query.
    * @throws Exception - Handles any database connection problems.
    * @note This method is used to check for the existence of the user's profile
    *       when they attempt to log in. The loggedIn boolean is set based on
    *       if they were able to log in.
    */
   public static boolean exists() {
      
      try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
				
            // Creates a string for the search query.
            String findProfile = "select *\n" + 
                            "from `Profile`\n" +
                            "where userName = '" + accountUsername + "';";
				
            // Sends the query to the database and creates a result set.
            ResultSet rs = stmt.executeQuery(findProfile);
            
            // If the set is not empty, checks that the password matches.
            // Returns true if the password matches.
            if (rs.next())
               if (accountPassword.equals(rs.getString("password"))) {
                  loggedIn = true;
                  return true;
               } // end if
			
			} // end try
			catch (SQLException sql) {
				System.out.println("Username and/or password are incorrect: " + sql);
			} // end catch
			
			conn.close();
			
		} // end try
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
      
      // Returns false if there is an error or user does not exist.
      return false;
      
   } // end exists
   
   /**
    * @param l - A Location object that is used to create a new location if necessary.
    * @precondition The database should be available for connection.
    * @postcondition The given Location should have been checked for existence in the database
    *                and created accordingly.
    * @throws SQLException - Handles any problems with the select and insert queries.
    * @throws Exception - Handles any database connection problems.
    * @note This method checks if a given Location exists, and creates one if it doesn't.
    */
   public static void createLocation(Location l) {
      
      try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
				
            // Creates a string for the search string.
            String checkLocation = "select *\n" + 
                                   "from Location\n" +
                                   "where locationName = '" + l.getLocation() + "' and zipCode = " + l.getZipcode() + 
                                                         " and park = " + l.getPark() + ";";
            
            // Searches for the given location.
            ResultSet rs = stmt.executeQuery(checkLocation);
            // If the given location already exists, the locationID is stored in this
            // class and the function returns.
            if (rs.next()) {
               locationID = rs.getString("locationID");
               return;
            }
            
            // If the location doesn't exist, a random 6 digit number is generated.
            Random rand = new Random();
            locationID = Integer.toString(rand.nextInt(1000000));
            // Creates a search string using the random integer as an id.
            String checkID = "select *\n" +
                             "from Location\n" +
                             "where locationID = " + locationID + ";";
            rs = stmt.executeQuery(checkID);
            
            // Regenerates the locationID as long as it exists in the database.
            while (rs.next()) {
               locationID = Integer.toString(rand.nextInt(1000000));
               checkID = "select *\n" +
                             "from Location\n" +
                             "where locationID = " + locationID + ";";
               rs = stmt.executeQuery(checkID);
            } // end while
            
            // Inserts a location using the location class and the unique locationID.
            String newLocation = "INSERT INTO Location VALUES (" + locationID + ", '" + l.getLocation() + "', " + l.getZipcode() + 
                                                               ", " + l.getPark() + ");";
            
            stmt.executeUpdate(newLocation);
			
			} // end try
			catch (SQLException sql) {
				System.out.println(sql);
			} // end catch
			
			conn.close();
			
		} // end try
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
      
   } // end createLocation
   
   /**
    * @param a - An Activity object that is used to create a new activity in the
    *            database.
    * @precondition The database must be available for connection.
    * @postcondition A new activity should have been created in the database based
    *                on the Activity object.
    * @throws SQLException - Handles any problems with the select and insert queries.
    * @throws Exception - Handles any database connection issues.
    * @note This method creates a new activity in the database table with a unique ID.
    */
   public static void createActivity(Activity a) {
      
      try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
            
            // This block of code generates a unique activityID.
            Random rand = new Random();
            String activityID = Integer.toString(rand.nextInt(1000000));
            String checkID = "select *\n" +
                             "from Activity\n" +
                             "where activityID = " + activityID + ";";
            ResultSet rs = stmt.executeQuery(checkID);
            
            while (rs.next()) {
               activityID = Integer.toString(rand.nextInt(1000000));
               checkID = "select *\n" +
                         "from Activity\n" +
                         "where activityID = " + activityID + ";";
               rs = stmt.executeQuery(checkID);
            } // end while
            
            // Creates a string for the insert query.
            String newActivity = "INSERT INTO Activity VALUES ('" + a.getAName() + "', " + activityID + ", '" + a.getGps() + 
                                                               "', '" + a.getAType() + "', " + a.getDifficulty() + ", '" +
                                                               a.getDate() + "', " + locationID + ", '" + accountUsername + "');";
            
            stmt.executeUpdate(newActivity);
			
			} // end try
			catch (SQLException sql) {
				System.out.println(sql);
			} // end catch
			
			conn.close();
			
		} // end try
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
      
   } // end createActivity
   
   /**
    * @param item - A routeSearchModel object that is used to get more detailed
    *               info on the item.
    * @return A ResultSet that contains all the detailed info on the given item.
    * @precondition The database should be available for connection.
    * @postcondition A ResultSet should have been generated and returned to the calling function.
    * @throws SQLException - Handles and problems with the select query.
    * @throws Exception - Handles any database connection problems.
    * @note This method uses the given item to get all of it's detailed info from
    *       the database. The ResultSet is then returned.
    */
   public static ResultSet getActivity(routeSearchModel item) {
   
      // Gets the activityID from item.
      String id = item.getId();
      
      try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
				
				// Sends a search query to the database using the search string,
				// and receives a result table.
				ResultSet rs = stmt.executeQuery("select *\n" +
	                  	"from Activity A natural join Location L\n" +
	                  	"where activityID = '" + id + "';");
                        
            return rs;
			
			} // end try
			catch (SQLException sql) {
				System.out.println("Could not retrieve data: " + sql);
			} // end catch
			
			conn.close();
			
		} // end try
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
      
      return null;
      
   } // end getActivity
   
   
   /**
    * @param userNameSearch - A String that represents the username of a user that
    *                         created one of the activities in the result scene.
    * @return A ResultSet containing all of the detailed user info of the given username.
    * @precondition The database must be available for connection.
    * @postcondition A ResultSet should have been generated and returned containing all
    *                of the user's info.
    * @throws SQLException - Handles any problems with the select query.
    * @throws Exception - Handles any database connection problems.
    * @note This method gets all info about the specified username and returns it.
    */
   public static ResultSet getProfile(String userNameSearch) {
            
      
      try {
			
			// Connects to the database and creates an SQL query.
			Connection conn = DriverManager.getConnection(address, userID, password);
			Statement stmt = conn.createStatement();
			
			try {
				
				// Sends a search query to the database using the search string,
				// and receives a result table.
				ResultSet rs = stmt.executeQuery("select *\n" +
	                  	"from `Profile`\n" +
	                  	"where userName = '" + userNameSearch + "';");

            return rs;
            
            
			
			} // end try
			catch (SQLException sql) {
				System.out.println("Could not retrieve data: " + sql);
			} // end catch
			
			conn.close();
			
		} // end try
		catch (Exception sqle) {
			
			System.out.println("Error: " + sqle);
			
		} // end catch
      
      return null;
      
   } // end getActivity


   // All of the getters and setters.   
   public static void setSearch(String s) {
      search = s;
   } // end setSearch
   
   public static void setAccountUsername(String u) {
      accountUsername = u;
   } // end setAccountUsername
   
   public static void setAccountPassword(String p) {
      accountPassword = p;
   } // end setAccountPassword
   
   public static void setActivityPageItem(routeSearchModel item) {
      rsm = item;
   } // end setListResult
   
   public static void setSearchUser(String su) {
      searchUser = su;
   } // end setSearchUser
   
   public static void setAdvancedSearch(String s) {
      advancedSearch = s;
   }
   
   public static boolean isLoggedIn() {
      return loggedIn;
   } // end isLoggedIn
   
   public static String getSearch() {
      return search;
   } // end getSearch
   
   public static String getAccountUsername() {
      return accountUsername;
   } // end getAccountUsername
   
   public static String getAccountPassword() {
      return accountPassword;
   } // end getAccountPassword
   
   public static routeSearchModel getActivityPageItem() {
      return rsm;
   } // end getActivityPageItem
   
   public static String getSearchUser() {
      return searchUser;
   } // end getSearchUser
   
   public static String getAdvancedSearch() {
      return advancedSearch;
   }
   
   public static void setLoggedIn(boolean b) {
      loggedIn = b;
   }

} // end class
