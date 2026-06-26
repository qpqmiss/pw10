package practice10;
import java.util.Scanner;
import java.util.ArrayList;

public class Registration {

    static ArrayList<String> users = new ArrayList<>();
    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        Menu(args);
    }

    public static void Menu(String[] args) {
        while (true) {
            Menu();
            String choice = readLine("Choose an action: ");

            switch (choice) {
                case "1":
                    addUser();
                    break;
                case "2":
                    deleteUser();
                    break;
                default:
                    System.out.printf("Wrong option\n");
            }
        }
    }

    public static void Menu() {
        System.out.println("**** MENU ****");
        System.out.println("1 > Add user");
        System.out.println("2 > delete user");
    }

    public static void addUser() {
        String login = login();
        String password = password();

        users.add(login);
        System.out.printf("Users added \n");
    }

    public static void deleteUser() {
        String login = readLine("Enter your login to delete: ");

        if (users.remove(login)) {
            System.out.printf("Users delete.\n");
        } else {
            System.out.printf("Users not found.\n");
        }
    }

    public static String login() {

        while (true) {

            System.out.println("Enter login (at least 5 characters):");
            String userLogin = scanner.nextLine();

            try {

                if (userLogin.isBlank()) {
                    throw new IllegalArgumentException("Error: The field contains only spaces or is empty");
                }
                if (userLogin.contains(" ")) {
                    throw new IllegalArgumentException("Error: The field contains only spaces");
                }
                if (userLogin.length() < 5) {
                    throw new IllegalArgumentException("Error: The field must contain at least 5 characters");
                }
                return userLogin;

            } catch (IllegalArgumentException e) {
                System.out.println(e.getMessage());
                System.out.printf("Try again.\n");
            }
        }
    }

    public static String password() {

        while (true) {

            System.out.println("Enter password (No less 10 symbol.Only latin characters):");
            String Password = scanner.nextLine();

            try {

                if (Password.isBlank()) {
                    throw new IllegalArgumentException("Error: The field contains only spaces or is empty");
                }
                if (Password.contains(" ")) {
                    throw new IllegalArgumentException("Error: The field contains only spaces");
                }
                if (Password.length() < 10) {
                    throw new IllegalArgumentException("Error: The field must contain at least 10 characters");
                }

                int digitCount = 0;
                int specialCount = 0;

                for (int i = 0; i < Password.length(); i++) {
                    char ch = Password.charAt(i);

                    if (Character.isDigit(ch)) {
                        digitCount++;
                    } else if (Character.isLetter(ch)) {

                        if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))) {
                            throw new IllegalArgumentException("Error:Only latin characters");
                        }
                    } else if (!Character.isLetterOrDigit(ch)) {
                        specialCount++;
                    }
                }

                if (digitCount < 3) {
                    throw new IllegalArgumentException("Error: Minimum 3  numbers");
                }

                if (specialCount < 1) {
                    throw new IllegalArgumentException("Error: Minimum one special symbol");
                }

                return Password;

            } catch (IllegalArgumentException e) {
                System.out.println(e.getMessage());
                System.out.printf("Try again.\n");
            }
        }
    }

    public static String readLine(String message) {
        System.out.print(message);
        return scanner.nextLine();
    }
}
