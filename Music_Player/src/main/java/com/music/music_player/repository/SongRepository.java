package com.music.music_player.repository;

import com.music.music_player.entity.Song;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {
    List<Song> findAllByOrderByReleaseDateDesc(Pageable pageable);

    @Query("SELECT s FROM Song s ORDER BY SIZE(s.usersLike) DESC")
    List<Song> findSongsOrderByLikeCountDesc(Pageable pageable);

    @Query("SELECT lh.song FROM ListenHistory lh WHERE lh.user.id = :userId AND lh.time IN (SELECT MAX(lh2.time) FROM ListenHistory lh2 WHERE lh2.user.id = :userId GROUP BY lh2.song) ORDER BY lh.time DESC")
    List<Song> findRecentSongsByUserId(int userId, Pageable pageable);

    @Query("SELECT s FROM Song s JOIN s.genreOfSong g WHERE g.id = :genreId")
    List<Song> findByGenreId(int genreId, Pageable pageable);

    @Query("SELECT s FROM Song s JOIN s.singerOfSong si WHERE si.id = :singerId")
    List<Song> findBySingerId(int singerId, Pageable pageable);

    @Query("SELECT COUNT(s) FROM Song s")
    int countAllSong();

    @Query("SELECT COUNT(DISTINCT lh.song.id) FROM ListenHistory lh WHERE lh.user.id = :userId")
    int countRecentlyListenSong(int userId);

    Song findById(int songId);

    /***
     If parameter [name] contains accents, the query will search with accents.
     Otherwise, the query will search without accents
     */
    @Query(nativeQuery = true, value = "SELECT * FROM public.song WHERE " +
            "CASE WHEN unaccent(LOWER(:name)) = LOWER(:name) " +
            "THEN unaccent(LOWER(public.song.name)) LIKE LOWER(concat('%', :name, '%')) " +
            "ELSE LOWER(public.song.name) LIKE (LOWER(concat('%', :name, '%'))) END")
    List<Song> findSongByName(String name, Pageable pageable);

    @Query(nativeQuery = true, value = "SELECT COUNT(*) FROM public.song WHERE " +
            "CASE WHEN unaccent(LOWER(:name)) = LOWER(:name) " +
            "THEN unaccent(LOWER(public.song.name)) LIKE LOWER(concat('%', :name, '%')) " +
            "ELSE LOWER(public.song.name) LIKE LOWER(concat('%', :name, '%')) END")
    int countSongsByName(String name);

    @Query("SELECT s FROM Song s JOIN s.usersSave u WHERE u.id = :userId")
    List<Song> findSavedSongsByUserId(int userId);

    @Modifying
    @Query(value = "INSERT INTO song (name, release_date, image, link_song) VALUES (:name, :releaseDate, :imageLink, :songLink)", nativeQuery = true)
    void saveSong(String name, LocalDateTime releaseDate, String imageLink, String songLink);

    @Modifying
    @Query(value = "INSERT INTO singer_of_song (id_singer, id_song) VALUES (:singerId, (SELECT id_song FROM song WHERE name = :name AND link_song = :songLink))", nativeQuery = true)
    void saveSingerOfSong(int singerId, String name, String songLink);

    @Modifying
    @Query(value = "INSERT INTO genre_of_song (id_genre, id_song) VALUES (:genreId, (SELECT id_song FROM song WHERE name = :name AND link_song = :songLink))", nativeQuery = true)
    void saveGenreOfSong(int genreId, String name, String songLink);
}
