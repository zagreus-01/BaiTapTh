package btth.dao.serviceabstract;

import java.util.List;


public interface GenericDao<T> {
	void create(T entity);

	void update(T entity);

	void delete(int id);
	
	List<T> findAll();
}
