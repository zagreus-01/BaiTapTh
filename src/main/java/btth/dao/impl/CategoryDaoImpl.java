package btth.dao.impl;

import java.util.List;

import btth.configs.JPAconfig;
import btth.dao.model.CategoryDao;
import btth.dao.serviceabstract.CRUDabstractDao;
import btth.entity.Category;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class CategoryDaoImpl extends CRUDabstractDao<Category> implements CategoryDao {

	public CategoryDaoImpl() {
		super(Category.class); // truyền class entity vào constructor
	}

	@Override
	public List<Category> findByUserId(int userId) {
		EntityManager em = JPAconfig.getEntityManager();
		try {
			TypedQuery<Category> query = em.createQuery("SELECT c FROM Category c WHERE c.user.id = :userId",
					Category.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public Category findById(int id) {
		EntityManager em = JPAconfig.getEntityManager();
		try {
			return em.find(Category.class, id);
		} finally {
			em.close();
		}
	}
}
