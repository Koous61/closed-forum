package com.gmail.koous99.closedforum.controller;

import com.gmail.koous99.closedforum.dto.AuthUserDto;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("auth")
public class AuthController {

    @PostMapping
    public String authenticate(@RequestBody AuthUserDto authUserDto) {
        return "1";
    }
}
