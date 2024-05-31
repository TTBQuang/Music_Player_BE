package com.music.music_player.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "playlist")
public class Playlist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_playlist")
    private int id;

    @OneToOne
    @JoinColumn(name = "id_genre")
    private Genre genre;

    @OneToOne
    @JoinColumn(name = "id_singer")
    private Singer singer;

    @Transient
    private List<Song> songs;
}
