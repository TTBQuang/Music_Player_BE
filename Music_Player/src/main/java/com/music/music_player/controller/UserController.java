package com.music.music_player.controller;

import com.music.music_player.entity.User;
import com.music.music_player.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<Void> registerUser(@RequestBody User user) {
        userService.registerUser(user);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/login")
    public ResponseEntity<User> loginUser(@RequestBody User user) {
        User authenticatedUser = userService.loginUser(user.getUsername(), user.getPassword());
        return new ResponseEntity<>(authenticatedUser, HttpStatus.OK);
    }

    @PutMapping("/update")
    public ResponseEntity<Boolean> updateUser(@RequestBody User newUser) {
        boolean isSuccess = userService.updateUser(newUser);
        return new ResponseEntity<>(isSuccess, HttpStatus.OK);
    }
}
