package kr.ac.dankook.ace.whatsinmyref.controller;

import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import kr.ac.dankook.ace.whatsinmyref.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.dankook.ace.whatsinmyref.entity.User;
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
    public String register(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute UserDTO userDTO){
        userService.save(userDTO);
        return "index";
    }
    
    
    @GetMapping("/login")
    public String login(@ModelAttribute("User") User user,Model model) {
        return "login";
    }
    
    @PostMapping("/login")
    public String loginUser(@ModelAttribute("User") User user,Model model) {
        return "redirect:/Wimr";
    }
    
    @GetMapping("/myPage")
    public String myPage() {
        return "myPage";
    }

    @GetMapping("/foodSelect")
    public String foodSelect(){
        return "foodSelect";
    }

  
}


