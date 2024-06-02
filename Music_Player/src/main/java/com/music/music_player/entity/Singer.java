package com.music.music_player.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Data
@Entity
@Table(name = "singer")
public class Singer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_singer")
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String image;

    @ManyToMany(mappedBy = "singerOfSong")
    @JsonIgnore
    private Set<Song> songsOfSinger = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Singer singer)) return false;
        return id == singer.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
