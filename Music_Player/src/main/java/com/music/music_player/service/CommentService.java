package com.music.music_player.service;

import com.music.music_player.entity.Comment;
import com.music.music_player.entity.Song;
import com.music.music_player.entity.User;
import com.music.music_player.exception.UnknownSongException;
import com.music.music_player.exception.UnknownUserException;
import com.music.music_player.repository.CommentRepository;
import com.music.music_player.repository.SongRepository;
import com.music.music_player.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SongRepository songRepository;

    public List<Comment> getAllComments(int songId) {
        return commentRepository.findAllBySongIdOrderByTimeDesc(songId);
    }

    public Comment addComment(Comment comment) {
        User user = userRepository.findById((long) comment.getUser().getId())
                .orElseThrow(UnknownUserException::new);
        Song song = songRepository.findById((long) comment.getSong().getId())
                .orElseThrow(UnknownSongException::new);

        comment.setUser(user);
        comment.setSong(song);

        return commentRepository.save(comment);
    }

    @Transactional
    public Comment updateCommentContent(Comment updatedComment) {
        Optional<Comment> optionalComment = commentRepository.findById((long) updatedComment.getId());
        if (optionalComment.isPresent()) {
            Comment comment = optionalComment.get();
            comment.setContent(updatedComment.getContent());
            return commentRepository.save(comment);
        } else {
            return null;
        }
    }

    public List<Comment> getCommentsByResponseId(int responseId) {
        return commentRepository.findAllByResponseId(responseId);
    }

    @Transactional
    public void likeComment(int userId, int commentId) {
        Optional<User> userOptional = userRepository.findById((long) userId);
        Optional<Comment> commentOptional = commentRepository.findById((long) commentId);

        if (userOptional.isPresent() && commentOptional.isPresent()) {
            User user = userOptional.get();
            Comment comment = commentOptional.get();

            if (user.getLikedComments().contains(comment)) {
                return; // Comment is already liked
            }

            user.getLikedComments().add(comment);
            userRepository.save(user);
        }
    }

    @Transactional
    public void unlikeComment(int userId, int commentId) {
        Optional<User> userOptional = userRepository.findById((long) userId);
        Optional<Comment> commentOptional = commentRepository.findById((long) commentId);

        if (userOptional.isPresent() && commentOptional.isPresent()) {
            User user = userOptional.get();
            Comment comment = commentOptional.get();

            if (!user.getLikedComments().contains(comment)) {
                return; // Comment is not liked
            }

            user.getLikedComments().remove(comment);
            userRepository.save(user);
        }
    }

    @Transactional
    public void deleteCommentAndRelated(int id) {
        // Delete likes of comment
        commentRepository.deleteLikesByCommentId(id);

        // Find comments with responseId matching the ID of the comment
        List<Comment> relatedComments = commentRepository.findAllByResponseId(id);

        // Delete all likes of related comments
        for (Comment comment : relatedComments) {
            commentRepository.deleteLikesByCommentId(comment.getId());
        }

        // Delete all related comments
        commentRepository.deleteAll(relatedComments);

        // Delete comment
        commentRepository.deleteById((long) id);
    }
}
