package com.music.music_player.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "\"user\"")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user")
    private int id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String password;

    @JsonProperty("display_name")
    @Column(name = "display_name", nullable = false)
    private String displayName;

    @Column(nullable = false)
    private String authority;

    @ManyToMany()
    @JsonIgnore
    @JoinTable(
            name = "user_like_song",
            joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_song"))
    private Set<Song> favoriteSongs = new HashSet<>();

    @OneToMany(mappedBy = "user", cascade=CascadeType.ALL)
    @JsonIgnore
    Set<ListenHistory> listenHistories;
}
