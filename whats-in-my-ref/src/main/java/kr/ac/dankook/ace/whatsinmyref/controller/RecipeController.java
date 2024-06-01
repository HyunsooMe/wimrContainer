package kr.ac.dankook.ace.whatsinmyref.controller;

import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import kr.ac.dankook.ace.whatsinmyref.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class RecipeController {

    @Autowired
    private RecipeService recipeService;

    @GetMapping("/fetch")
    public String fetch(){
        recipeService.getRecipes();
        return "end";
    }
}
