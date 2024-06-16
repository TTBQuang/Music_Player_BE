package com.music.music_player.repository;

import com.music.music_player.entity.ListenHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
public interface ListenHistoryRepository extends JpaRepository<ListenHistory, Integer> {
    @Modifying
    @Query(value = "INSERT INTO listen_history (id_user, id_song, time) VALUES (:userId, :songId, :time)", nativeQuery = true)
    void saveListenHistory(int userId, int songId, LocalDateTime time);
}
