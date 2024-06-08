package com.music.music_player.service;

import com.music.music_player.entity.SearchHistory;
import com.music.music_player.entity.User;
import com.music.music_player.repository.SearchHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SearchHistoryService {
    @Autowired
    private SearchHistoryRepository searchHistoryRepository;

    public List<SearchHistory> getSearchHistory(int userId, int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return searchHistoryRepository.findQueriesByUserIdOrderByTimeDescId(userId, pageable);
    }

    @Transactional
    public void saveSearchHistory(SearchHistory searchHistory) {
        searchHistoryRepository.saveSearchHistory(searchHistory.getUser().getId(), searchHistory.getQuery(), searchHistory.getTime());
    }
}
