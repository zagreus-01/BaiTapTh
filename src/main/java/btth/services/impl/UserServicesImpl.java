package btth.services.impl;

import java.util.List;

import btth.dao.model.UserDao;
import btth.dao.impl.UserDaoImpl;
import btth.entity.Users;
import btth.services.UserServices;

public class UserServicesImpl implements UserServices {

    private UserDao userDao;

    public UserServicesImpl() {
        userDao = new UserDaoImpl(); // gọi DAO triển khai
    }

    @Override
    public void create(Users user) {
        userDao.create(user);
    }

    
    @Override
    public void update(Users user) {
        userDao.update(user);
    }

    @Override
    public void delete(int id) {
        userDao.delete(id);
    }

    @Override
    public Users findByUsernamePassword(String username, String password) {
        return userDao.findByUsernamePassword(username, password);
    }

    @Override
    public List<Users> findAll() {
        return userDao.findAll();
    }
    @Override
    public Users findById(int id) {
		return userDao.findById(id);
	}
    
}
