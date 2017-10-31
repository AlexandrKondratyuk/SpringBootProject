package net.ikit.sankoniks.mysimpleproject.web.controller;


import net.ikit.sankoniks.mysimpleproject.exceptions.UserNotFoundException;
import net.ikit.sankoniks.mysimpleproject.model.User;
import net.ikit.sankoniks.mysimpleproject.repository.UserRepository;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    //    @RequestMapping(method = RequestMethod.GET)
//    @GetMapping("/list")
    @GetMapping
    public String index(Model model,
                        @RequestParam(name = "showSuccessMsg", required = false) boolean showSuccessMsg,
                        @RequestParam(name = "successMsg", required = false) String successMsg) {
        model.addAttribute("message", "Users List");
        model.addAttribute("messagesUsers", "Users List");
        model.addAttribute("showSuccessMsg", true);
        model.addAttribute("successMsg", successMsg);
        model.addAttribute("users", userRepository.findAll());
        return "users-list";
    }

    @GetMapping(value = "/add", produces = "text/plain;charset=UTF-8")
    public String addPage(Model model) {
        model.addAttribute("showSuccessAlert", "fade in");
        model.addAttribute("showSuccessMsg", false);
        return "users-new-hrz";
    }

    @PostMapping(value = "/add",produces = "text/plain;charset=UTF-8")
    public String addUser(Model model,
                          @NotEmpty String firstName,
                          @NotEmpty String lastName,
                          @NotEmpty String email,
                          @NotEmpty String nickname) {
        User user = new User(firstName,
                lastName,
                email,
                nickname);
        userRepository.save(user);

        model.addAttribute("successMsg",
                String.format("User %s %s was added!", user.getFirstName(), user.getLastName()));
        model.addAttribute("showSuccessAlert", "");
        model.addAttribute("showSuccessMsg", true);


        return "users-new-hrz";
    }


    @GetMapping("/{id}/edit")
    public ModelAndView editPage(@PathVariable Long id) {
        ModelAndView model = new ModelAndView("users-edit");

        model.addObject("user",
                userRepository.findById(id).orElseThrow(() -> new UserNotFoundException("User id: " + id + " not found!"))
                        /*.orElseThrow(UserNotFoundException::new)*/);

        model.addObject("showSuccessAlert", "fade in");
        model.addObject("showSuccessMsg", false);


        return model;
    }

    @PostMapping("/{id}/edit")
    public String editUser(@PathVariable Long id,
                           Model model,
                           @NotEmpty String firstName,
                           @NotEmpty String lastName,
                           @NotEmpty String email,
                           @NotEmpty String nickname) {
        User user = userRepository.findById(id)
                .map($ -> {
                    $.setFirstName(firstName);
                    $.setLastName(lastName);
                    $.setEmail(email);
                    $.setNickname(nickname);

                    return userRepository.save($);
                }).orElseThrow(() -> new UserNotFoundException("User id: " + id + " not found!"));

        model.addAttribute("user", user);
        model.addAttribute("successMsg",
                String.format("User %s %s was edited!", user.getFirstName(), user.getLastName()));
        model.addAttribute("showSuccessAlert", "");
        model.addAttribute("showSuccessMsg", true);

        return "users-edit";
    }

    @GetMapping("{id}/delete")
    public String editUser(@PathVariable Long id, Model model) {
        User user = userRepository.findById(id).orElseThrow(() -> new UserNotFoundException("User id: "
                + id + " not found!"));
//        userRepository.delete(id);
        userRepository.delete(user);
            model.addAttribute("users", userRepository.findAll());
        String successMsg = String.format("User %s %s was deleted!", user.getFirstName(), user.getLastName());
//        return "redirect:/users?showSuccessMsg=true&successMsg=" + successMsg;
        return "redirect:/users";
    }


}
