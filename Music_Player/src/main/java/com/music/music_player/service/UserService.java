package com.music.music_player.service;


import com.music.music_player.exception.InvalidCredentialsException;
import com.music.music_player.exception.UnknownUserException;
import com.music.music_player.exception.UsernameAlreadyExistsException;
import com.music.music_player.entity.User;
import com.music.music_player.repository.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void registerUser(User user) {
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new UsernameAlreadyExistsException(user.getUsername());
        }

        if (user.getDisplayName() == null) {
            user.setDisplayName(user.getUsername());
        }
        user.setRole("user");

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    public User loginUser(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user == null || !passwordEncoder.matches(password, user.getPassword())) {
            throw new InvalidCredentialsException();
        }
        return user;
    }

    public boolean updateUser(User newUser) {
        User existingUser = userRepository.findById((long) newUser.getId()).orElse(null);

        if (existingUser == null) {
            throw new UnknownUserException();
        }

        try {
            BeanUtils.copyProperties(newUser, existingUser);
            userRepository.save(existingUser);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
