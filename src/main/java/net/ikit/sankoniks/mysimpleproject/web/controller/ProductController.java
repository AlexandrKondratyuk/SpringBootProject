package net.ikit.sankoniks.mysimpleproject.web.controller;


import net.ikit.sankoniks.mysimpleproject.exceptions.ProductNotFoundException;
import net.ikit.sankoniks.mysimpleproject.model.Product;
import net.ikit.sankoniks.mysimpleproject.repository.ProductsRepository;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = {"/products", "/training/products"})
public class ProductController {

    @Autowired
    private ProductsRepository productsRepository;

    //    Default JSP-page for view All products
    @GetMapping
    public String index(Model model,
                        @RequestParam(name = "showSuccessMsg", required = false) boolean showSuccessMsg,
                        @RequestParam(name = "successMsg", required = false) String successMsg) {

        model.addAttribute("message", "Product List");
        model.addAttribute("showSuccessMsg", true);
        model.addAttribute("successMsg", successMsg);
        model.addAttribute("products", productsRepository.findAll());

        return "products-list";
    }

    @GetMapping(value = "/add", produces = "text/plain;charset=UTF-8")
    public String addPage(Model model) {
        model.addAttribute("showSuccessAlert", "fade in");
        model.addAttribute("showSuccessMsg", false);
        return "products-add-hrz";
    }

    @PostMapping(value = "/add", produces = "text/plain;charset=UTF-8")
    public String addProduct(Model model,
                             @NotEmpty String name,
                             @NotEmpty String description,
                             @NotEmpty String manufacturer,
                             @NotEmpty double price) {

        Product product = new Product(name, description, manufacturer, price);
        productsRepository.save(product);
        model.addAttribute("successMsg", String.format("Product %s (%s) was added!",
                product.getName(), product.getManufacturer()));
        model.addAttribute("showSuccessAlert", "");
        model.addAttribute("showSuccessMsg", true);

        return "products-add-hrz";
    }

    @GetMapping(value = "/{id}/edit")
    public ModelAndView editPage(@PathVariable Long id) {
        ModelAndView model = new ModelAndView("products-edit");
        model.addObject("product",
                productsRepository.findById(id).orElseThrow(()
                        -> new ProductNotFoundException("Product id: " + id + " not found!")));
        model.addObject("showSuccessAlert", "fade in");
        model.addObject("showSuccessMsg", false);
        return model;
    }

    @PostMapping(value = "/{id}/edit")
    public String editProduct(@PathVariable Long id,
                              Model model,
                              @NotEmpty String name,
                              @NotEmpty String description,
                              @NotEmpty String manufacturer,
                              @NotEmpty double price) {
        Product product = productsRepository.findById(id).map($ -> {
            $.setName(name);
            $.setDescription(description);
            $.setManufacturer(manufacturer);
            $.setPrice(price);

            return productsRepository.save($);
        }).orElseThrow(() -> new ProductNotFoundException("Product id: " + id + " not found!"));

        model.addAttribute("product", product);
        model.addAttribute("successMsg",
                String.format("Product %s (%s) was edited!", product.getName(), product.getManufacturer()));
        model.addAttribute("showSuccessAlert", "");
        model.addAttribute("showSuccessMsg", true);

        return "products-edit";
    }

//    @GetMapping("{id}/delete")
    @GetMapping(value = "/{id}/delete")
    public String deleteProduct(@PathVariable Long id, Model model){
        Product product = productsRepository.findById(id).
                orElseThrow(() -> new ProductNotFoundException("Product id: " + id + " not found!"));

        productsRepository.delete(product);
        model.addAttribute("products", productsRepository.findAll());

        String successMsg = String.format("Product %s (%s) was deleted!", product.getName(), product.getManufacturer());

//        return "redirect:/products?showSuccessMsg=true&successMsg=" + successMsg;
        return "redirect:/products";
    }
}
