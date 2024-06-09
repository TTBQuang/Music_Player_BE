package com.music.music_player.service;

import com.music.music_player.dto.PaginatedResponse;
import com.music.music_player.dto.PlaylistDto;
import com.music.music_player.entity.Playlist;
import com.music.music_player.entity.Song;
import com.music.music_player.repository.GenreRepository;
import com.music.music_player.repository.PlaylistRepository;
import com.music.music_player.repository.SingerRepository;
import com.music.music_player.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PlaylistService {

    @Autowired
    private PlaylistRepository playlistRepository;

    @Autowired
    private SongRepository songRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private SingerRepository singerRepository;

    public PaginatedResponse<PlaylistDto> getAllGenrePlaylists(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        List<Playlist> playlists = playlistRepository.findAllByGenreNotNull(pageable);
        List<PlaylistDto> playlistDtoList = new ArrayList<>();

        for (Playlist playlist : playlists) {
            List<Song> songs;
            if (playlist.getGenre() != null) {
                songs = songRepository.findAll().stream()
                        .filter(song -> song.getGenreOfSong().contains(playlist.getGenre()))
                        .collect(Collectors.toList());
            } else {
                songs = List.of();
            }
            playlist.setSongs(songs);

            // convert playlist to playlistDto
            PlaylistDto playlistDto = new PlaylistDto(playlist);
            playlistDtoList.add(playlistDto);
        }

        int totalItems = (int) genreRepository.count();

        return new PaginatedResponse<>(playlistDtoList, totalItems);
    }

    public PaginatedResponse<PlaylistDto> getAllSingerPlaylists(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        List<Playlist> playlists = playlistRepository.findAllBySingerNotNull(pageable);
        List<PlaylistDto> playlistDtoList = new ArrayList<>();

        for (Playlist playlist : playlists) {
            List<Song> songs;
            if (playlist.getSinger() != null) {
                songs = songRepository.findAll().stream()
                        .filter(song -> song.getSingerOfSong().contains(playlist.getSinger()))
                        .collect(Collectors.toList());
            } else {
                songs = List.of();
            }
            playlist.setSongs(songs);

            // convert playlist to playlistDto
            PlaylistDto playlistDto = new PlaylistDto(playlist);
            playlistDtoList.add(playlistDto);
        }

        int totalItems = (int) singerRepository.count();

        return new PaginatedResponse<>(playlistDtoList, totalItems);
    }

    public PlaylistDto getPlaylistBySinger(int singerId) {
        Playlist playlist = playlistRepository.findBySingerId(singerId);
        List<Song> songs = List.of();
        if (playlist.getSinger() != null) {
            songs = songRepository.findAll().stream()
                    .filter(song -> song.getSingerOfSong().contains(playlist.getSinger()))
                    .collect(Collectors.toList());
        }
        playlist.setSongs(songs);
        return new PlaylistDto(playlist);
    }
}
