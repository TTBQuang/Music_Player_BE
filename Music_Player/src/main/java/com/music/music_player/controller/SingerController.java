package com.music.music_player.controller;

import com.music.music_player.dto.PaginatedResponse;
import com.music.music_player.entity.Singer;
import com.music.music_player.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/singer")
public class SingerController {
    @Autowired
    private SingerService singerService;

    @GetMapping("/find")
    public ResponseEntity<PaginatedResponse<Singer>> findSongByName(
            @RequestParam String name,
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        PaginatedResponse<Singer> response = singerService.findByName(name, pageNumber, pageSize);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/get_all")
    public ResponseEntity<List<Singer>> getAllSingers() {
        List<Singer> response = singerService.getAllSingers();
        return ResponseEntity.ok(response);
    }
}
