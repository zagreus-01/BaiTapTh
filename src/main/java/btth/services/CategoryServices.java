package btth.services;

import java.util.List;
import btth.entity.Category;

public interface CategoryServices {
    void create(Category category);
    void update(Category category);
    void delete(int id);
    Category findById(int id);
    List<Category> findByUserId(int userId);
    List<Category> findAll();
}
