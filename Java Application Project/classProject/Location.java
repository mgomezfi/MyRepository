package classProject;

/**
 * 
 * @note This object class represents a location tuple in the database.
 *
 */
public class Location {
   
   private String location, zipcode, park;
   
   /**
    * @param l - Location name string.
    * @param z - Zipcode string.
    * @param p - Park indicator string.
    * @note This is the constructor method for this object class.
    */
   public Location(String l, String z, String p) {
      
      location = l;
      zipcode = z;
      park = p;
      
   } // end constructor
   
   public String getLocation() {
      return location;
   }
   
   public String getZipcode() {
      return zipcode;
   }
   
   public String getPark() {
      return park;
   }
   
   public void setLocation(String l) {
      location = l;
   }
   
   public void setZipcode(String z) {
      zipcode = z;
   }
   
   public void setPark(String p) {
      park = p;
   }
   
} // end class
