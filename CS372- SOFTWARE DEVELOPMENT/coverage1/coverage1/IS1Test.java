
/***
* Example JUnit testing class for IglooScore1
***/

// Import all assertions and all annotations
// - see docs for lists and descriptions
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.*;

public class IS1Test
{
   // Data you need for each test case
   private IglooScore1 igloo1;

// 
// Stuff you want to do before each test case
//
@BeforeEach
public void setup()
{
   System.out.println("\nTest starting...");
   igloo1 = new IglooScore1();
}

//
// Stuff you want to do after each test case
//
@AfterEach
public void teardown()
{
   System.out.println("\nTest finished.");
}

//
// Test all scores equal
//
@Test
public void allEqual()
{
   //System.out.println("Running test allEqual");
   igloo1.recordScores(10,10,10);
   assertEquals(20,igloo1.overallScore());
}

// 
// Test where last score is lowest
//
@Test
public void lastIsLowest()
{
   //System.out.println("Running test lastIsLowest");
   igloo1.recordScores(30,20,10);
   assertEquals(50,igloo1.overallScore());
}

//
//Test where first score is lowest
//
@Test
public void firstIsLowest()
{
	//System.out.println("Running test lastIsLowest");
	igloo1.recordScores(10,20,30);
	assertEquals(50,igloo1.overallScore());
}

//
//Test where middle score is lowest
//
@Test
public void middleIsLowest()
{
	//System.out.println("Running test lastIsLowest");
	igloo1.recordScores(20,10,30);
	assertEquals(50,igloo1.overallScore());
}
}

