package com.music.music_player.controller;

import com.music.music_player.entity.SearchHistory;
import com.music.music_player.service.SearchHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/search_history")
public class SearchHistoryController {
    @Autowired
    private SearchHistoryService searchHistoryService;

    @GetMapping("/get")
    public ResponseEntity<List<SearchHistory>> getSongsSortedByLikeCount(
            @RequestParam int userId,
            @RequestParam int pageNumber,
            @RequestParam int pageSize) {
        List<SearchHistory> response = searchHistoryService.getSearchHistory(userId, pageNumber, pageSize);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/save")
    public void saveSearchHistory(@RequestBody SearchHistory searchHistory) {
        searchHistoryService.saveSearchHistory(searchHistory);
    }
}
