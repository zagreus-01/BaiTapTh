package btth.dao.model;

import java.util.List;

import btth.dao.serviceabstract.GenericDao;
import btth.entity.Category;

public interface CategoryDao extends GenericDao<Category> {
    List<Category> findByUserId(int userId);
    Category findById(int id);
  
}
