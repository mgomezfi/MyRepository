package classProject;

import java.time.*;

/**
 * 
 * @note This object class represents an activity from the database.
 *
 */
public class Activity {
   
   private String aName, gps, aType, difficulty, date;
   
   /**
    * @param n - Name string.
    * @param g - GPS coordinates string.
    * @param t - Activity type string.
    * @param diff - Difficulty string.
    * @note This is a constructor method for this object class.
    */
   public Activity(String n, String g, String t, String diff) {
      
      aName = n;
      gps = g;
      aType = t;
      difficulty = diff;
      
      LocalDate ld = LocalDate.now();
      date = Integer.toString(ld.getYear()) + "-" + Integer.toString(ld.getMonthValue()) + 
             "-" + Integer.toString(ld.getDayOfMonth());
      
   } // end constructor
   
   public String getAName() {
      return aName;
   }
   
   public String getGps() {
      return gps;
   }
   
   public String getAType() {
      return aType;
   }
   
   public String getDifficulty() {
      return difficulty;
   }
   
   public String getDate() {
      return date;
   }
   
   public void setAName(String n) {
      aName = n;
   }
   
   public void setGps(String g) {
      gps = g;
   }
   
   public void setAType(String t) {
      aType = t;
   }
   
   public void setDifficulty(String d) {
      difficulty = d;
   }
   
   public void setDate(String d) {
      date = d;
   }
   
} // end class
