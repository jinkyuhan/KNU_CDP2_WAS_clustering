package dao;

import dto.User;

import java.util.ArrayList;

public class UserRepository {
    private ArrayList<User> users = new ArrayList<User>();
    private static UserRepository instance;

    public UserRepository() {
        User admin = new User("admin", "admin");
        users.add(admin);
    }

    public static UserRepository getInstance(){
        if (instance == null){
            instance = new UserRepository();
        }
        return instance;
    }

    public ArrayList<User> getAllUsers() {
        return users;
    }
}
