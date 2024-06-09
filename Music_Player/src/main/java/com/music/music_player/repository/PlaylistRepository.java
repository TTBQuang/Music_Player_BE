package com.music.music_player.repository;

import com.music.music_player.entity.Playlist;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlaylistRepository extends JpaRepository<Playlist, Integer> {
    List<Playlist> findAllByGenreNotNull(Pageable pageable);
    List<Playlist> findAllBySingerNotNull(Pageable pageable);
    Playlist findById(int playlistId);
    Playlist findBySingerId(int singerId);
}
