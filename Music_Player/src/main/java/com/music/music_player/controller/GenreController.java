package com.music.music_player.controller;

import com.music.music_player.entity.Genre;
import com.music.music_player.service.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/genre")
public class GenreController {
    @Autowired
    private GenreService genreService;

    @GetMapping("/get_all")
    public ResponseEntity<List<Genre>> getAllGenres() {
        List<Genre> response = genreService.getAllGenres();
        return ResponseEntity.ok(response);
    }
}
