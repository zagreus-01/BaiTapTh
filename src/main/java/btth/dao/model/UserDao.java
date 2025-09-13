package btth.dao.model;

import btth.dao.serviceabstract.GenericDao;
import btth.entity.Users;

public interface UserDao extends GenericDao<Users> {
	Users findByUsernamePassword(String username, String password);
	Users findById(int id);
}
