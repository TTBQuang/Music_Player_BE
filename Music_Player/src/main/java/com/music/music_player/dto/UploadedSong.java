package com.music.music_player.dto;

import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class UploadedSong {
    private String name;
    private String imageLink;
    private String songLink;
    private int singerId;
    private int genreId;
    private LocalDateTime releaseDate;
}
