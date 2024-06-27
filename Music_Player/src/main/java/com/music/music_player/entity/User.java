package com.music.music_player.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

import java.util.HashSet;
import java.util.Objects;
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

    @ManyToMany()
    @JsonIgnoreProperties({"usersSave", "usersLike"})
    @JoinTable(
            name = "user_like_song",
            joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_song"))
    private Set<Song> likedSongs = new HashSet<>();

    @ManyToMany()
    @JsonIgnoreProperties({"usersSave", "usersLike"})
    @JoinTable(
            name = "user_save_song",
            joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_song"))
    private Set<Song> savedSongs = new HashSet<>();

    @OneToMany(mappedBy = "user", cascade=CascadeType.ALL)
    @JsonIgnore
    Set<ListenHistory> listenHistories;

    @ManyToMany()
    @JsonIgnore
    @JoinTable(
            name = "user_like_comment",
            joinColumns = @JoinColumn(name = "id_user"),
            inverseJoinColumns = @JoinColumn(name = "id_comment"))
    private Set<Comment> likedComments = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User user)) return false;
        return id == user.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
