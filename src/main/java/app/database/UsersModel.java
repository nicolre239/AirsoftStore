package app.database;

import java.util.Objects;

public class UsersModel {
    protected Integer userId;
    protected String login;
    protected String password;
    protected String name;

    public UsersModel(Integer userId, String login, String password, String name) {
        this.userId = userId;
        this.login = login;
        this.password = password;
        this.name = name;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public String getName(){return name;}

    public void Print(){
        System.out.println(this.userId.toString() + " " + this.login + " " + this.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(getUserId(), getLogin(), getPassword());
    }
}
