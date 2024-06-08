package com.music.music_player.repository;

import com.music.music_player.entity.SearchHistory;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface SearchHistoryRepository extends JpaRepository<SearchHistory, Integer> {
    @Query("SELECT sh FROM SearchHistory sh WHERE sh.user.id = :userId AND (sh.query, sh.time) IN " +
            "(SELECT sh2.query, MAX(sh2.time) FROM SearchHistory sh2 WHERE sh2.user.id = :userId GROUP BY sh2.query) " +
            "ORDER BY sh.time DESC")
    List<SearchHistory> findQueriesByUserIdOrderByTimeDescId(int userId, Pageable pageable);

    @Modifying
    @Query(value = "INSERT INTO search_history (id_user, query, time) VALUES (:userId, :query, :time)", nativeQuery = true)
    void saveSearchHistory(int userId, String query, LocalDateTime time);
}
