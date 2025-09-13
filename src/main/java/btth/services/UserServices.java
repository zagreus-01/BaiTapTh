package btth.services;

import btth.entity.Users;
import java.util.List;

public interface UserServices {
    void create(Users user);
    void update(Users user);
    void delete(int id);
    Users findByUsernamePassword(String username, String password);
    List<Users> findAll();
    Users findById(int id);
}
