package com.alaynetheodore.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alaynetheodore.lookify.models.Song;
import com.alaynetheodore.lookify.repositories.SongRepository;

@Service
public class SongService {

	private final SongRepository songRepo;
	
	public SongService(SongRepository songRepo) {
		this.songRepo = songRepo;
	}
	
	public Song create(Song l) {
		return songRepo.save(l);
	}
	
	public List<Song> getAll() {
		return (List<Song>) songRepo.findAll();
	}
	
	public Song getOne(Long id) {
		Optional<Song> song = songRepo.findById(id);
		if(song.isPresent()) {
			return song.get();
		} else {
			return null;
		}
	}
	
	public Song update(Song toUpdate, Long id) {
		if(toUpdate.getId() == null) {
			toUpdate.setId(id);
		}
		return songRepo.save(toUpdate);
	}
	
	public void remove(Long id) {
		songRepo.deleteById(id);
	}
	
	public List<Song> search(String q) {
		return songRepo.findByTitleContaining(q);
	}
	
	public List<Song> getTopTen() {
		return songRepo.topTen();
	}
}