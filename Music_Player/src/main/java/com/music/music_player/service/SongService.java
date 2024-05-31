package com.music.music_player.service;

import com.music.music_player.entity.Song;
import com.music.music_player.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongService {
    @Autowired
    private SongRepository songRepository;

    public List<Song> getNewSongs(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return songRepository.findAllByOrderByReleaseDateDesc(pageable);
    }

    public List<Song> getSongsSortedByLikeCount(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return songRepository.findSongsOrderByLikeCountDesc(pageable);
    }

    public List<Song> getRecentSongsByUser(int id, int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return songRepository.findRecentSongsByUserId(id, pageable);
    }
}
