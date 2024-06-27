package com.music.music_player.service;

import com.music.music_player.dto.PaginatedResponse;
import com.music.music_player.entity.Playlist;
import com.music.music_player.entity.Song;
import com.music.music_player.entity.User;
import com.music.music_player.repository.PlaylistRepository;
import com.music.music_player.repository.SongRepository;
import com.music.music_player.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class SongService {
    @Autowired
    private SongRepository songRepository;

    @Autowired
    private PlaylistRepository playlistRepository;

    @Autowired
    private UserRepository userRepository;

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

    public Song findSongById(int id) {
        return songRepository.findById(id);
    }

    @Transactional
    public void likeSong(int userId, int songId) {
        Optional<User> userOptional = userRepository.findById((long) userId);
        Optional<Song> songOptional = songRepository.findById((long) songId);

        if (userOptional.isPresent() && songOptional.isPresent()) {
            User user = userOptional.get();
            Song song = songOptional.get();

            if (user.getLikedSongs().contains(song)) {
                return; // Song is already liked
            }

            user.getLikedSongs().add(song);
            userRepository.save(user);
        }
    }

    @Transactional
    public void unlikeSong(int userId, int songId) {
        Optional<User> userOptional = userRepository.findById((long) userId);
        Optional<Song> songOptional = songRepository.findById((long) songId);

        if (userOptional.isPresent() && songOptional.isPresent()) {
            User user = userOptional.get();
            Song song = songOptional.get();

            if (!user.getLikedSongs().contains(song)) {
                return; // Song is not liked
            }

            user.getLikedSongs().remove(song);
            userRepository.save(user);
        }
    }

    @Transactional
    public void saveSong(int userId, int songId) {
        Optional<User> userOptional = userRepository.findById((long) userId);
        Optional<Song> songOptional = songRepository.findById((long) songId);

        if (userOptional.isPresent() && songOptional.isPresent()) {
            User user = userOptional.get();
            Song song = songOptional.get();

            if (user.getSavedSongs().contains(song)) {
                return; // Song is already saved
            }

            user.getSavedSongs().add(song);
            userRepository.save(user);
        }
    }

    @Transactional
    public void removeSongFromSave(int userId, int songId) {
        Optional<User> userOptional = userRepository.findById((long) userId);
        Optional<Song> songOptional = songRepository.findById((long) songId);

        if (userOptional.isPresent() && songOptional.isPresent()) {
            User user = userOptional.get();
            Song song = songOptional.get();

            if (!user.getSavedSongs().contains(song)) {
                return; // Song is not saved
            }

            user.getSavedSongs().remove(song);
            userRepository.save(user);
        }
    }

    public List<Song> getSavedSongsByUserId(int userId) {
        return songRepository.findSavedSongsByUserId(userId);
    }
}
