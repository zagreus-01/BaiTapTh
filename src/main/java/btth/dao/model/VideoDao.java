package btth.dao.model;

import java.util.List;

import btth.dao.serviceabstract.GenericDao;
import btth.entity.Video;

public interface VideoDao extends GenericDao<Video> {
    Video findById(int id);
    List<Video> search(String keyword);
	List<Video> findByUserID(int userId);
}
