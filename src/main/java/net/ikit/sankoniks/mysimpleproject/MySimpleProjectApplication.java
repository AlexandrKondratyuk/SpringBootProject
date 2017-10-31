package net.ikit.sankoniks.mysimpleproject;

import net.ikit.sankoniks.mysimpleproject.model.Product;
import net.ikit.sankoniks.mysimpleproject.model.User;
import net.ikit.sankoniks.mysimpleproject.repository.ProductsRepository;
import net.ikit.sankoniks.mysimpleproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

import javax.annotation.PostConstruct;

@SpringBootApplication
public class MySimpleProjectApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(MySimpleProjectApplication.class, args);
    }


    @Autowired
    UserRepository repository;

    @Autowired
    ProductsRepository productsRepository;

//    @PostConstruct
    void initUser() {
        for (int i = 11; i < 20; i++) {
            repository.save(new User("Sergey", "Woloh",
                    "ss@ss.s", "serg"));
            repository.save(new User("Vanesa", "Lu",
                    "vas@sd.s", "vanna"));
        }
        System.out.println("<<< " + repository.findAll());
    }

    //    @PostConstruct
    void initProducts() {
        for (int i = 11; i < 20; i++) {
            String name = "Java Book No-" + i;
            productsRepository.save(new Product(name, "Book about Java",
                    "SUN corp.", 1.5));
        }
        System.out.println("<<< PRODUCTS ---> " + productsRepository.findAll());
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(MySimpleProjectApplication.class);
    }
}
