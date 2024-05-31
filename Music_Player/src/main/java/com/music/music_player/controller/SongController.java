package com.music.music_player.controller;

import com.music.music_player.entity.Song;
import com.music.music_player.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/song")
public class SongController {
    @Autowired
    private SongService songService;

    @GetMapping("/new")
    public ResponseEntity<List<Song>> getNewSongs(
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        List<Song> songs = songService.getNewSongs(pageNumber ,pageSize);
        return ResponseEntity.ok(songs);
    }

    @GetMapping("/popular")
    public ResponseEntity<List<Song>> getSongsSortedByLikeCount(
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        List<Song> sortedSongs = songService.getSongsSortedByLikeCount(pageNumber ,pageSize);
        return ResponseEntity.ok(sortedSongs);
    }

    @GetMapping("/listen_history")
    public ResponseEntity<List<Song>> getRecentSongsListenByUser(
            @RequestParam int userId,
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        List<Song> sortedSongs = songService.getRecentSongsByUser(userId, pageNumber ,pageSize);
        return ResponseEntity.ok(sortedSongs);
    }
}
