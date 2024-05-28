package com.music.music_player.exception;

public class InvalidCredentialsException extends RuntimeException {
    public InvalidCredentialsException() {
        super("Tên đăng nập hoặc mật khẩu không hợp lệ");
    }
}

