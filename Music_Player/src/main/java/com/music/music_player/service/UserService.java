package com.music.music_player.service;


import com.music.music_player.exception.UsernameAlreadyExistsException;
import com.music.music_player.model.User;
import com.music.music_player.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public void registerUser(User user) {
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new UsernameAlreadyExistsException(user.getUsername());
        }
        if (user.getDisplayName() == null) {
            user.setDisplayName(user.getUsername());
        }
        userRepository.save(user);
    }
}
