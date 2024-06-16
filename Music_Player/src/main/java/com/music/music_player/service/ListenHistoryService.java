package com.music.music_player.service;

import com.music.music_player.entity.ListenHistory;
import com.music.music_player.repository.ListenHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ListenHistoryService {
    @Autowired
    private ListenHistoryRepository listenHistoryRepository;

    @Transactional
    public void saveListenHistory(ListenHistory listenHistory) {
        listenHistoryRepository.saveListenHistory(listenHistory.getUser().getId(), listenHistory.getSong().getId(), listenHistory.getTime());
    }
}
