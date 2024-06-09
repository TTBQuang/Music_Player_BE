package com.music.music_player.controller;

import com.music.music_player.dto.PaginatedResponse;
import com.music.music_player.dto.PlaylistDto;
import com.music.music_player.entity.Song;
import com.music.music_player.service.PlaylistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/playlist")
public class PlaylistController {
    @Autowired
    private PlaylistService playlistService;

    @GetMapping("/all/genre")
    public PaginatedResponse<PlaylistDto> getAllGenrePlaylists(@RequestParam int pageNumber, @RequestParam int pageSize) {
        return playlistService.getAllGenrePlaylists(pageNumber, pageSize);
    }

    @GetMapping("/all/singer")
    public PaginatedResponse<PlaylistDto> getAllSingerPlaylists(@RequestParam int pageNumber, @RequestParam int pageSize) {
        return playlistService.getAllSingerPlaylists(pageNumber, pageSize);
    }

    @GetMapping("/singer")
    public PlaylistDto getPlaylistBySinger(@RequestParam int singerId) {
        return playlistService.getPlaylistBySinger(singerId);
    }
}
