package kr.ac.dankook.ace.whatsinmyref.repository;

import kr.ac.dankook.ace.whatsinmyref.entity.MyRecipe;
import kr.ac.dankook.ace.whatsinmyref.entity.MyRecipeNo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MyRecipeRepository extends JpaRepository<MyRecipe, MyRecipeNo> {

}
