package com.music.music_player.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "listen_history")
public class ListenHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_listen")
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user", nullable = false)
    User user;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_song", nullable = false)
    Song song;

    @JoinColumn(nullable = false)
    LocalDateTime time;
}
