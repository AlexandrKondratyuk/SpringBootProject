package net.ikit.sankoniks.mysimpleproject.repository;


import net.ikit.sankoniks.mysimpleproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    // SELECT * FROM user WHERE id = :id
    Optional<User> findById(Long id);

}
