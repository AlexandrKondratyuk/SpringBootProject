package net.ikit.sankoniks.mysimpleproject.web.rest;


import net.ikit.sankoniks.mysimpleproject.model.User;
import net.ikit.sankoniks.mysimpleproject.repository.UserRepository;
import net.ikit.sankoniks.mysimpleproject.web.api.CreateUserRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rest/users")
public class UserRestController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("{id}")
    public User getUser(@PathVariable/*(name = "id")*/ Long id) {
        return userRepository.findOne(id);
    }

    @GetMapping// == @RequestMapping(path = "/", method = RequestMethod.GET)
    public List<User> list() {
      return userRepository.findAll();
    }

    @GetMapping("/count")
    public Long count() {
        return userRepository.count();
    }

}
