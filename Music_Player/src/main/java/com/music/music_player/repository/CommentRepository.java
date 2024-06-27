package com.music.music_player.repository;

import com.music.music_player.entity.Comment;
import com.music.music_player.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findAllBySongIdOrderByTimeDesc(int songId);
    List<Comment> findAllByResponseId(int responseId);

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM user_like_comment WHERE id_comment = :commentId", nativeQuery = true)
    void deleteLikesByCommentId(int commentId);
}
