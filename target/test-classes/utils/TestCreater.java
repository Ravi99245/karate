package utils;

import com.github.javafaker.Faker;

public class TestCreater{

	private static Faker faker = new Faker();

	public static String getName() {
		return faker.name().name();
	}

	public static String getEmail() {
		return faker.name().username();
	}

	public static String getPhone() {
		 return faker.number().numberBetween(1000000000L, 9999999999L) + "";
	}

	public static String getRole() {
		return faker.job().position();
	}

}
