package kr.ac.dankook.ace.whatsinmyref.controller;

import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import kr.ac.dankook.ace.whatsinmyref.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class RecipeController {

    @Autowired
    private RecipeService recipeService;

    @GetMapping("/fetch")
    public String fetchRecipes(@RequestParam String url) {
        recipeService.getRecipes(url);
        return "Recipes fetched and saved successfully";
    }
}
