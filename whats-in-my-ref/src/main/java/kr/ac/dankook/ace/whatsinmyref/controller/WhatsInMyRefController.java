package kr.ac.dankook.ace.whatsinmyref.controller;

import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import kr.ac.dankook.ace.whatsinmyref.service.UserService;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;





@Controller
@RequestMapping("/Wimr")
@RequiredArgsConstructor
public class WhatsInMyRefController {

    @Autowired
    private final UserService userService;

    @GetMapping("")
    public String mainPage() {
        return "index";
    }

    @GetMapping("/recipe") //localhost:8080/Wimr/recipe?foodID=""
    public String recipe(@RequestParam String foodID,Model model) {
        String foodImg = "/img/ingredients.jpg";  //이미지가 없는 경우 default
        /*
        model.addAttribute("foodName",foodName)         //요리 이름
        model.addAttribute("ingredients", ingredients); //재료 리스트
        model.addAttribute("recipe", recipe);           //레시피 리스트
        */
        model.addAttribute("foodImg", foodImg);         //음식 사진 path
        return "recipe";
    }

    @GetMapping("/register")
    public String save(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "register";
    }

    @PostMapping("/register")
    public String save(@ModelAttribute UserDTO userDTO){
        userService.save(userDTO);
        return "redirect:/Wimr";
    }
    
    
    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "login";
    }
    
    @PostMapping("/login")
    public String loginUser(@ModelAttribute UserDTO userDTO, HttpSession session) {
        UserDTO loginResult = userService.login(userDTO);
        if(loginResult != null){
            session.setAttribute("userNick", loginResult.getMemberNick());
            return "redirect:/Wimr/";
        } else {
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logoutUser(){
        return "";
    }
    
    @GetMapping("/myPage")
    public String myPage(Model model) {
        //test
        List<Recipe> myRecipes=new ArrayList<Recipe>();
        Recipe recipe1=new Recipe();
        Recipe recipe2=new Recipe();
        Recipe recipe3=new Recipe();
        Recipe recipe4=new Recipe();
        recipe2.setRecipeno(1);
        recipe3.setRecipeno(2);
        recipe3.setRecipeno(3);
        myRecipes.add(recipe1);
        myRecipes.add(recipe2);
        myRecipes.add(recipe3);
        myRecipes.add(recipe4);

        model.addAttribute("myRecipeList", myRecipes);
        //test end
        return "myPage";
    }

    @GetMapping("/foodSelect")
    public String foodSelect(){
        return "foodSelect";
    }

    @GetMapping("/findACC")
    public String findAccount() {
        return "findAcc";
    }
    
}


