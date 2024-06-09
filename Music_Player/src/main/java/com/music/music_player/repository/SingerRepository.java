package com.music.music_player.repository;

import com.music.music_player.entity.Singer;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SingerRepository extends JpaRepository<Singer, Integer> {
    long count();

    /***
     If parameter [name] contains accents, the query will search with accents.
     Otherwise, the query will search without accents
     */
    @Query(nativeQuery = true, value = "SELECT * FROM public.singer WHERE " +
            "CASE WHEN unaccent(LOWER(:name)) = LOWER(:name) " +
            "THEN unaccent(LOWER(public.singer.name)) LIKE LOWER(concat('%', :name, '%')) " +
            "ELSE LOWER(public.singer.name) LIKE (LOWER(concat('%', :name, '%'))) END")
    List<Singer> findSingerByName(String name, Pageable pageable);

    @Query(nativeQuery = true, value = "SELECT COUNT(*) FROM public.singer WHERE " +
            "CASE WHEN unaccent(LOWER(:name)) = LOWER(:name) " +
            "THEN unaccent(LOWER(public.singer.name)) LIKE LOWER(concat('%', :name, '%')) " +
            "ELSE LOWER(public.singer.name) LIKE LOWER(concat('%', :name, '%')) END")
    int countSingerByName(String name);
}
