package com.music.music_player.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public record PaginatedResponse<T>(List<T> items, @JsonProperty("total_items") int totalItems) {
    public PaginatedResponse(List<T> items, int totalItems) {
        this.items = items;
        this.totalItems = totalItems;
    }
}
