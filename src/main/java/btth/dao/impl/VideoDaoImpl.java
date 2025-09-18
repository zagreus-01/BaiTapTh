package btth.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

import btth.configs.JPAconfig;
import btth.dao.model.VideoDao;
import btth.dao.serviceabstract.CRUDabstractDao;
import btth.entity.Video;

public class VideoDaoImpl extends CRUDabstractDao<Video> implements VideoDao {
    private EntityManager em = JPAconfig.getEntityManager();

    public VideoDaoImpl() {
		super(Video.class);
	}
    @Override
    public Video findById(int id) {
        return em.find(Video.class, id);
    }

    @Override
    public List<Video> search(String keyword) {
        TypedQuery<Video> query = em.createQuery(
            "SELECT v FROM Video v WHERE v.title LIKE :kw", Video.class);
        query.setParameter("kw", "%" + keyword + "%");
        return query.getResultList();
    }
    @Override
    public List<Video> findByUserID(int userId) {
		TypedQuery<Video> query = em.createQuery(
			"SELECT v FROM Video v WHERE v.user.id = :userId", Video.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

}
