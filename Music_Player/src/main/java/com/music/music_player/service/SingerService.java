package com.music.music_player.service;

import com.music.music_player.dto.PaginatedResponse;
import com.music.music_player.entity.Singer;
import com.music.music_player.repository.SingerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SingerService {
    @Autowired
    private SingerRepository singerRepository;

    public PaginatedResponse<Singer> findByName(String name, int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        int totalItems = singerRepository.countSingerByName(name);
        return new PaginatedResponse<>(singerRepository.findSingerByName(name, pageable), totalItems);
    }

    public List<Singer> getAllSingers(){
        return singerRepository.findAll();
    }
}
