package kr.ac.dankook.ace.whatsinmyref.service;

import kr.ac.dankook.ace.whatsinmyref.dto.RecipeDTO;
import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import kr.ac.dankook.ace.whatsinmyref.repository.RecipeRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class RecipeService {

    private final RecipeRepository recipeRepository;
    private final RestTemplate restTemplate;

    public RecipeService(RecipeRepository recipeRepository) {
        this.recipeRepository = recipeRepository;
        this.restTemplate = new RestTemplate();
    }

    public void getRecipes(String url) {
        RecipeDTO[] recipes = restTemplate.getForObject(url, RecipeDTO[].class);

        if (recipes != null) {
            for (RecipeDTO recipeDto : recipes) {
                Recipe recipe = mapToEntity(recipeDto);
                recipeRepository.save(recipe);
            }
        }
    }

    private Recipe mapToEntity(RecipeDTO dto) {
        Recipe recipe = new Recipe();
        recipe.setRecipeno(dto.getRCP_SEQ());
        recipe.setTitle(dto.getRCP_NM());
        recipe.setCalories(dto.getINFO_ENG());
        recipe.setCarbohydrates(dto.getINFO_CAR());
        recipe.setProtein(dto.getINFO_PRO());
        recipe.setFat(dto.getINFO_FAT());
        recipe.setSodium(dto.getINFO_NA());
        recipe.setIngredients(dto.getRCP_PARTS_DTLS());

        List<Recipe.Manual> manuals = new ArrayList<>();
        for (int i = 1; i <= 20; i++) {
            String step = dto.getManualStep(i);
            String image = dto.getManualImage(i);
            if (step != null || image != null) {
                Recipe.Manual manual = new Recipe.Manual();
                manual.setStep(step);
                manual.setImage(image);
                manuals.add(manual);
            }
        }
        recipe.setManuals(manuals);

        return recipe;
    }
}
