package com.music.music_player.exception;

public class UnknownCommentException extends RuntimeException {
    public UnknownCommentException() {
        super("Không tìm thấy comment");
    }
}
