package kr.ac.dankook.ace.whatsinmyref.repository;

import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RecipeRepository extends JpaRepository<Recipe, Integer> {
    Optional<Recipe> findByTitle(String title);
}
