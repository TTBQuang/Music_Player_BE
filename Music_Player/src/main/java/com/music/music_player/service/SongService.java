package com.music.music_player.service;

import com.music.music_player.dto.PaginatedResponse;
import com.music.music_player.entity.Playlist;
import com.music.music_player.entity.Song;
import com.music.music_player.repository.PlaylistRepository;
import com.music.music_player.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SongService {
    @Autowired
    private SongRepository songRepository;

    @Autowired
    private PlaylistRepository playlistRepository;

    public PaginatedResponse<Song> getNewSongs(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        int totalItems = songRepository.countAllSong();
        return new PaginatedResponse<>(songRepository.findAllByOrderByReleaseDateDesc(pageable), totalItems);
    }

    public PaginatedResponse<Song> getSongsSortedByLikeCount(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        int totalItems = songRepository.countAllSong();
        return new PaginatedResponse<>(songRepository.findSongsOrderByLikeCountDesc(pageable), totalItems);
    }

    public PaginatedResponse<Song> getRecentSongsByUser(int id, int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        int totalItems = songRepository.countRecentlyListenSong(id);
        return new PaginatedResponse<>(songRepository.findRecentSongsByUserId(id, pageable), totalItems);
    }

    public List<Song> getSongsInPlaylist(int playlistId, int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Playlist playlist = playlistRepository.findById(playlistId);

        if (playlist.getGenre() != null) {
            return songRepository.findByGenreId(playlist.getGenre().getId(), pageable);
        } else if (playlist.getSinger() != null) {
            return songRepository.findBySingerId(playlist.getSinger().getId(), pageable);
        } else {
            return new ArrayList<>();
        }
    }

    public PaginatedResponse<Song> findSongByName(String name, int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        int totalItems = songRepository.countSongsByName(name);
        return new PaginatedResponse<>(songRepository.findSongByName(name, pageable), totalItems);
    }
}
