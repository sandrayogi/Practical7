package examples.tests;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    public Karate runPet()
    {
        return Karate.run("PetRequest").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runUser()
    {
        return Karate.run("UserRequest").relativeTo(getClass());
    }
}