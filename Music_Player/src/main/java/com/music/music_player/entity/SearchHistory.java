package com.music.music_player.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "search_history")
public class SearchHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_search")
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user", nullable = false)
    User user;

    @JoinColumn(nullable = false)
    String query;

    @Column(nullable = false)
    private LocalDateTime time;
}
