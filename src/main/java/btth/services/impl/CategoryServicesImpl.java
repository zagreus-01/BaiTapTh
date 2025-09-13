package btth.services.impl;

import java.util.List;

import btth.dao.impl.CategoryDaoImpl;
import btth.dao.model.CategoryDao;
import btth.entity.Category;
import btth.services.CategoryServices;

public class CategoryServicesImpl implements CategoryServices {

    private CategoryDao categoryDao;

    public CategoryServicesImpl() {
        categoryDao = new CategoryDaoImpl(); // hoặc inject nếu dùng DI
    }

    @Override
    public void create(Category category) {
        categoryDao.create(category);
    }

    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public Category findById(int id) {
        return categoryDao.findById(id);
    }

    @Override
    public List<Category> findByUserId(int userId) {
        return categoryDao.findByUserId(userId);
    }
    @Override
    public List<Category> findAll() {
		return categoryDao.findAll();
	}
}
