package btth.services;

import btth.entity.Video;
import java.util.List;

public interface VideoServices {
	void create(Video video);
	void update(Video video);
	void delete(int id);
	Video findById(int id);
	List<Video> search(String keyword);
	List<Video> findAll();
	List<Video> findByUserID(int Id);
}
