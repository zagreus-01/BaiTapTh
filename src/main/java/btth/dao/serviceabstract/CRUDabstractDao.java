package btth.dao.serviceabstract;

import java.util.List;

import btth.configs.JPAconfig;
import jakarta.persistence.EntityManager;

public abstract class CRUDabstractDao<T> implements GenericDao<T> {
	private Class<T> cl;

    public CRUDabstractDao(Class<T> clazz) {
        this.cl = clazz;
    }
	@Override
	public void create(T entity) {
		EntityManager em = JPAconfig.getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
	}
	@Override
	public void update(T entity) {
		EntityManager em = JPAconfig.getEntityManager();
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
	}
	@Override
	public void delete(int id) {
		EntityManager em = JPAconfig.getEntityManager();
		try {
			em.getTransaction().begin();
			T entity = em.find( cl, id);
			if (entity != null) {
				em.remove(entity);
			}
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
	}
	@Override
   public List<T> findAll() {
		EntityManager em = JPAconfig.getEntityManager();
		List<T> entities = null;
		try {
			entities = em.createQuery("SELECT e FROM " + cl.getSimpleName() + " e", cl).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return entities;
	}

 
}
