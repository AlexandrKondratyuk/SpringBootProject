package net.ikit.sankoniks.mysimpleproject.web.controller;

import net.ikit.sankoniks.mysimpleproject.repository.ProductsRepository;
import net.ikit.sankoniks.mysimpleproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
//@RequestMapping("/training")
//@RequestMapping("/")
@RequestMapping(value = {"/", "training"})
public class IndexController {

    @GetMapping
    public String index(Model model,
                        @RequestParam(name = "showSuccessMsg", required = false) boolean showSuccessMsg,
                        @RequestParam(name = "successMsg", required = false) String successMsg){
        model.addAttribute("message", "Choose List");
        model.addAttribute("showSuccessMsg", true);
        model.addAttribute("successMsg", successMsg);

        return "index";
    }

}
