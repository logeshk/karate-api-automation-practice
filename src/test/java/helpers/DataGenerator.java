package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getRandomUsername() {
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

    public static String getRandomEmail() {
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + "." + faker.random().nextInt(0, 100) + "@testemail.com";
        return email;

    }

    public static String getRandomPassword() {
        com.github.javafaker.Faker faker = new com.github.javafaker.Faker();
        return faker.internet().password(8, 16, true, true, true);
    }

}
