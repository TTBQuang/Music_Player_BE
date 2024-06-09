package com.music.music_player.dto;

import com.music.music_player.entity.Playlist;
import lombok.Getter;

@Getter
public class PlaylistDto {
    private final int id;
    private String name;
    private String image;
    private final int totalItems;

    public PlaylistDto(Playlist playlist){
        this.id = playlist.getId();
        if (playlist.getGenre() != null){
            this.name = playlist.getGenre().getName();
            this.image = playlist.getGenre().getImage();
        } else if (playlist.getSinger() != null){
            this.name = playlist.getSinger().getName();
            this.image = playlist.getSinger().getImage();
        }
        this.totalItems = playlist.getSongs().size();
    }
}
