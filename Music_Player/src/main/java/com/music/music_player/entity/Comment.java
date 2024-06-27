package com.music.music_player.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_comment")
    private int id;

    @Column(name = "response_to_id_comment")
    private Integer responseId;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    @ManyToOne
    @JoinColumn(name = "id_song")
    private Song song;

    @Column(nullable = false)
    private LocalDateTime time;

    @Column(nullable = false)
    private String content;

    @ManyToMany(mappedBy = "likedComments")
    @JsonProperty("users_liked")
    @JsonIgnoreProperties({"likedComments"})
    private Set<User> usersLiked = new HashSet<>();
}
