package controllerr.dao;

import controllerr.model.User;

import java.util.List;

/**
 * Created by Mega on 23.06.2017.
 */
public interface UserDao {

    void addUser(User user);
    void updateUser(User user);
    void removeUser(int id);
    User getUserById(int id);
    List<User> listUsers();
    List<User> searchUsersByAnyValue(String value);
}
