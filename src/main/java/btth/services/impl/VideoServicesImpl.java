package btth.services.impl;

import java.util.List;

import btth.dao.impl.VideoDaoImpl;
import btth.dao.model.VideoDao;
import btth.entity.Video;
import btth.services.VideoServices;

public class VideoServicesImpl implements VideoServices {

	private VideoDao videoDao;
	
	public VideoServicesImpl() {
		this.videoDao =new VideoDaoImpl();
	}
	@Override
	public void create(Video video) {
		videoDao.create(video);
	}

	@Override
	public void update(Video video) {
		// TODO Auto-generated method stub
		videoDao.update(video);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		videoDao.delete(id);
	}

	@Override
	public Video findById(int id) {
		// TODO Auto-generated method stub
		return videoDao.findById(id);
	}

	@Override
	public List<Video> search(String keyword) {
		// TODO Auto-generated method stub
		return videoDao.search(keyword);
	}

	@Override
	public List<Video> findAll() {
		// TODO Auto-generated method stub
		return videoDao.findAll();
	}
	@Override
	public List<Video> findByUserID(int Id) {
		// TODO Auto-generated method stub
		return videoDao.findByUserID(Id);
	}
}
