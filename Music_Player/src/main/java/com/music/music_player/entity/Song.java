package com.music.music_player.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "song")
public class Song {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_song")
    private int id;

    @Column(nullable = false)
    private String name;

    @JsonProperty("release_date")
    @Column(name = "release_date")
    private LocalDate releaseDate;

    @Column(nullable = false)
    private String image;

    @JsonProperty("link_song")
    @Column(nullable = false, name = "link_song")
    private String linkSong;

    @ManyToMany(mappedBy = "favoriteSongs")
    @JsonIgnore
    private Set<User> usersLike = new HashSet<>();

    @OneToMany(mappedBy = "song", cascade=CascadeType.ALL)
    @JsonIgnore
    Set<ListenHistory> listenHistories;

    @ManyToMany()
    @JsonIgnore
    @JoinTable(
            name = "genre_of_song",
            joinColumns = @JoinColumn(name = "id_song"),
            inverseJoinColumns = @JoinColumn(name = "id_genre"))
    private Set<Genre> genreOfSong = new HashSet<>();

    @ManyToMany()
    @JsonIgnore
    @JoinTable(
            name = "singer_of_song",
            joinColumns = @JoinColumn(name = "id_song"),
            inverseJoinColumns = @JoinColumn(name = "id_singer"))
    private Set<Singer> singerOfSong = new HashSet<>();
}
