package com.music.music_player.repository;

import com.music.music_player.entity.Song;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {
    List<Song> findAllByOrderByReleaseDateDesc(Pageable pageable);

    @Query("SELECT s FROM Song s ORDER BY SIZE(s.usersLike) DESC")
    List<Song> findSongsOrderByLikeCountDesc(Pageable pageable);

    @Query("SELECT lh.song FROM ListenHistory lh WHERE lh.user.id = :userId ORDER BY lh.time DESC")
    List<Song> findRecentSongsByUserId(@Param("userId") int userId, Pageable pageable);
}
