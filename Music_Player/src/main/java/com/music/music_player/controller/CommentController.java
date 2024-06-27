package com.music.music_player.controller;

import com.music.music_player.entity.Comment;
import com.music.music_player.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @GetMapping("/all")
    public ResponseEntity<List<Comment>> getAllComments(@RequestParam int songId) {
        List<Comment> comments = commentService.getAllComments(songId);
        return ResponseEntity.ok(comments);
    }

    @PostMapping("/add")
    public ResponseEntity<Comment> addComment(@RequestBody Comment comment) {
        Comment createdComment = commentService.addComment(comment);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdComment);
    }

    @PutMapping("/update")
    public ResponseEntity<Comment> updateCommentContent(@RequestBody Comment comment) {
        Comment updatedComment = commentService.updateCommentContent(comment);
        if (updatedComment != null) {
            return ResponseEntity.ok(updatedComment);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/responses")
    public ResponseEntity<List<Comment>> getCommentsByResponseId(@RequestParam int responseId) {
        List<Comment> comments = commentService.getCommentsByResponseId(responseId);
        return ResponseEntity.ok(comments);
    }

    @PostMapping("/like")
    public void likeComment(@RequestParam int userId, @RequestParam int commentId) {
        commentService.likeComment(userId, commentId);
    }

    @DeleteMapping("/unlike")
    public void unlikeComment(@RequestParam int userId, @RequestParam int commentId) {
        commentService.unlikeComment(userId, commentId);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Void> deleteComment(@RequestParam int commentId) {
        commentService.deleteCommentAndRelated(commentId);
        return ResponseEntity.noContent().build();
    }
}
