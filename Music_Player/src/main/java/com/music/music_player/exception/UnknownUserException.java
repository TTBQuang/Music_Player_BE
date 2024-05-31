package com.music.music_player.exception;

public class UnknownUserException extends RuntimeException {
    public UnknownUserException() {
        super("Không tìm thấy user");
    }
}
