package com.music.music_player.exception;

public class UnknownSongException extends RuntimeException {
    public UnknownSongException() {
        super("Không tìm thấy song");
    }
}
