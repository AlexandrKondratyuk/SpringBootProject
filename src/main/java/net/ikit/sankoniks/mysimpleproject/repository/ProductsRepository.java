package net.ikit.sankoniks.mysimpleproject.repository;


import net.ikit.sankoniks.mysimpleproject.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProductsRepository extends JpaRepository<Product, Long>{

//  аналог запроса  "SELECT * FROM products WHERE id = :id"
    Optional<Product> findById(Long id);

}
