package kr.ac.dankook.ace.whatsinmyref.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.dankook.ace.whatsinmyref.entity.UserRecipe;

@Repository
public interface UserRecipeRepository extends JpaRepository<UserRecipe,Integer> {
    Page<UserRecipe> findAllByOrderByViewcountDesc(Pageable pageable);
}
