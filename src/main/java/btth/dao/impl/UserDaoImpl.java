package btth.dao.impl;

import btth.dao.serviceabstract.CRUDabstractDao;
import btth.entity.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import btth.configs.JPAconfig;
import btth.dao.model.UserDao;

public class UserDaoImpl extends CRUDabstractDao<Users> implements UserDao {

	public UserDaoImpl() {
		super(Users.class);
	}
	@Override
	public Users findByUsernamePassword(String username, String password) {
		EntityManager em = JPAconfig.getEntityManager();
		try {
			TypedQuery<Users> query = em.createQuery(
					"SELECT u FROM Users u WHERE u.username = :username AND u.password = :password", Users.class);
			query.setParameter("username", username);
			query.setParameter("password", password);

			// dùng list để tránh exception
			var result = query.getResultList();
			return result.isEmpty() ? null : result.get(0);
		} finally {
			em.close();
		}
	}
	@Override
	public Users findById(int id) {
		EntityManager em = JPAconfig.getEntityManager();
		try {
			return em.find(Users.class, id);
		} finally {
			em.close();
		}
	}

}
