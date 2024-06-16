package com.music.music_player.controller;

import com.music.music_player.dto.PaginatedResponse;
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
    public ResponseEntity<PaginatedResponse<Song>> getNewSongs(
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        PaginatedResponse<Song> response = songService.getNewSongs(pageNumber, pageSize);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/popular")
    public ResponseEntity<PaginatedResponse<Song>> getSongsSortedByLikeCount(
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        PaginatedResponse<Song> response = songService.getSongsSortedByLikeCount(pageNumber, pageSize);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/listen_history")
    public ResponseEntity<PaginatedResponse<Song>> getRecentSongsListenByUser(
            @RequestParam int userId,
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        PaginatedResponse<Song> response = songService.getRecentSongsByUser(userId, pageNumber, pageSize);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/in_playlist")
    public ResponseEntity<List<Song>> getSongsInPlaylist(
            @RequestParam int playlistId,
            @RequestParam int pageNumber,
            @RequestParam int pageSize
    ) {
        List<Song> songsInPlaylist = songService.getSongsInPlaylist(playlistId, pageNumber, pageSize);
        return ResponseEntity.ok(songsInPlaylist);
    }

    @GetMapping("/find")
    public ResponseEntity<PaginatedResponse<Song>> findSongByName(
            @RequestParam String name,
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        PaginatedResponse<Song> response = songService.findSongByName(name, pageNumber, pageSize);
        return ResponseEntity.ok(response);
    }

//    @GetMapping("/songs/{songId}/users/{userId}/liked")
//    public ResponseEntity<Boolean> isSongLikedByUser(@PathVariable int userId, @PathVariable int songId) {
//        boolean isLiked = songService.isSongLikedByUser(userId, songId);
//        return ResponseEntity.ok(isLiked);
//    }
}
