package dto;


import java.util.ArrayList;

public class User {
    private String userId;
    private String userPw;

    public User(String id, String pw) {
        this.userId = id;
        this.userPw = pw;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }
}
