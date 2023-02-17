package classProject;

/**
 * 
 * @note This object class represents a tuple from the Profile table in the database.
 *
 */
public class Profile {
   
   private String firstName, lastName, userName, password, email, aboutMe;
   
   /**
    * @param f - First name string.
    * @param l - Last name string.
    * @param u - User name string.
    * @param p - Password string.
    * @param e - Email string.
    * @param a - About me string.
    * @note This is the constructor method for this class.
    */
   public Profile(String f, String l, String u, String p, String e, String a) {
      
      firstName = f;
      lastName = l;
      userName = u;
      password = p;
      email = e;
      aboutMe = a;
      
   } // end constructor
   
   public String getFirstName() {
      return firstName;
   }
   
   public String getLastName() {
      return lastName;
   }
   
   public String getUserName() {
      return userName;
   }
   
   public String getPassword() {
      return password;
   }
   
   public String getEmail() {
      return email;
   }
   
   public String getAboutMe() {
      return aboutMe;
   }
   
   public void setFirstName(String f) {
      firstName = f;
   }
   
   public void setLastName(String l) {
      lastName = l;
   }
   
   public void setUserName(String u) {
      userName = u;
   }
   
   public void setPassword(String p) {
      password = p;
   }
   
   public void setEmail(String e) {
      email = e;
   }
   
   public void setAboutMe(String a) {
      aboutMe = a;
   }
   
} // end class   
