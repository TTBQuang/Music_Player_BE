package com.music.music_player.controller;

import com.music.music_player.entity.ListenHistory;
import com.music.music_player.service.ListenHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/listen_history")
public class ListenHistoryController {
    @Autowired
    private ListenHistoryService listenHistoryService;

    @PostMapping("/save")
    public void saveListenHistory(@RequestBody ListenHistory listenHistory) {
        listenHistoryService.saveListenHistory(listenHistory);
    }
}
