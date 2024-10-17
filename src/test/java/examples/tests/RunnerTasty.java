package examples.tests;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class RunnerTasty {
    public RunnerTasty() {
    }

    @Test
    public Karate runTasty() {
        return (Karate)Karate.run(new String[]{"RapidAPI"}).relativeTo(this.getClass());
    }
}