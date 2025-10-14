package helpers;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

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

    public static JSONObject getRandomArticleValues() {
        Faker faker = new Faker();
        String title = faker.book().title();
        String description = faker.lorem().sentence(6);
        String body = faker.lorem().paragraph(15);
        JSONObject json = new JSONObject();
        json.put("title", title);
        json.put("description", description);
        json.put("body", body);
        return json;

    }

}
