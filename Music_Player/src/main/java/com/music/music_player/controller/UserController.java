package com.music.music_player.controller;

import com.music.music_player.model.User;
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
}
