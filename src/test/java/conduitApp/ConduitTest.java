// package conduitApp;

// import com.intuit.karate.Results;
// import com.intuit.karate.Runner;
// import static org.junit.jupiter.api.Assertions.*;
// import org.junit.jupiter.api.Test;
// import com.intuit.karate.junit5.Karate;

// class ConduitTest {

// @Test
// void testParallel() {
// Results results = Runner.path("classpath:conduitApp")
// .outputCucumberJson(true)
// .parallel(5);
// assertEquals(0, results.getFailCount(), results.getErrorMessages());
// }

// @Karate.Test
// Karate testAll() {
// return Karate.run("").relativeTo(getClass());
// }
// }

package conduitApp;

import com.intuit.karate.junit5.Karate;

class ConduitTest {

    @Karate.Test
    Karate testAll() {
        // This is the correct, minimal implementation.
        // It relies on the Karate JUnit 5 engine for execution and command-line
        // parsing.
        return Karate.run("classpath:conduitApp").relativeTo(getClass());
    }
}