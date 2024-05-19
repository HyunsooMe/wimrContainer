package kr.ac.dankook.ace.whatsinmyref.repository;

import kr.ac.dankook.ace.whatsinmyref.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository< User, Integer> {
}
