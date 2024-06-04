package kr.ac.dankook.ace.whatsinmyref.controller;

import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import kr.ac.dankook.ace.whatsinmyref.dto.boardDTO;
import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import kr.ac.dankook.ace.whatsinmyref.service.RecipeService;
import kr.ac.dankook.ace.whatsinmyref.service.UserService;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/Wimr")
@RequiredArgsConstructor
public class WhatsInMyRefController {

    @Autowired
    private final UserService userService;

    @Autowired
    private RecipeService recipeService;

    @GetMapping("")
    public String mainPage() {
        return "index";
    }

//    @GetMapping("/recipe") //localhost:8080/Wimr/recipe?recipeNo=
//    public String recipe(@RequestParam int recipeNo,Model model) {
//        String foodImg = "/img/ingredients.jpg";  //이미지가 없는 경우 default
//        /*
//        model.addAttribute("foodName",foodName)         //요리 이름
//        model.addAttribute("ingredients", ingredients); //재료 리스트
//        model.addAttribute("recipe", recipe);           //레시피 리스트
//        */
//        model.addAttribute("foodImg", foodImg);         //음식 사진 path
//        return "recipe";
//    }
    @GetMapping("/recipe/{id}")
    public String listRecipe(@PathVariable int id, Model model) {
        //Ingredients 재료
        //Recipe : 사진, 정보
        //others : 영양 성분
        List<String> manualList = new ArrayList<>();
        List<String> manualImgList = new ArrayList<>();

        recipeService.getRecipeById(id).ifPresent(recipe -> {
            List<String> others = List.of("열량 :" + recipe.getCalories() + ", 탄수화물 : " + recipe.getCarbohydrates() + ", 단백질 :" + recipe.getProtein()
                    + ", 지방 : " + recipe.getFat() + ", 나트륨 : " + recipe.getSodium());
            String ingredient = recipe.getIngredient();
            String picture = recipe.getPicture();
            String k1 = "MANUAL0";
            String k2 = "MANUAL_IMG0";
            int i = 1;
            while(true) {
                String kee = k1.concat(Integer.toString(i));
                if (!recipe.getManual().get(kee).isEmpty()) {
                    manualList.add(recipe.getManual().get(kee));
                    System.out.println(recipe.getManual().get(kee));
                    i++;
                } else {
                    i = 1;
                    break;
                }
            }
            while(true){
                String kee = k2.concat(Integer.toString(i));
                if(!recipe.getManualImg().get(kee).isEmpty()){
                    manualImgList.add(recipe.getManualImg().get(kee));
                    i++;
                }
                else{
                    break;
                }
            }
            System.out.println(manualImgList.size());
            model.addAttribute("picture", picture);
            model.addAttribute("ingredients", ingredient);
            model.addAttribute("others", others);
            model.addAttribute("manualList", manualList);
            model.addAttribute("manualImgList", manualImgList);
        });
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
            session.setAttribute("user", loginResult);
            session.setMaxInactiveInterval(1800);
            System.out.println("success");
            return "redirect:/Wimr"; //로그인 성공 확인용
        } else {
            System.out.println("failed");
            return "login";
        }
    }

    @PostMapping("/logout")
    public String logoutUser(HttpSession session){
        session.invalidate();
        return "redirect:/Wimr";
    }
    
    @GetMapping("/myPage")
    public String myPage(Model model) {
        //test
        List<boardDTO> boards=new ArrayList<boardDTO>();
        boardDTO board1=new boardDTO();
        boardDTO board2=new boardDTO();
        boardDTO board3=new boardDTO();
        boardDTO board4=new boardDTO();
        board1.setTitle("캐나다 수도는 뭐야?");
        board2.setTitle("캐나다 수도는 뭐야?2");
        board3.setTitle("캐나다 수도는 뭐야?3");
        board4.setTitle("캐나다 수도는 뭐야?4");
        boards.add(board1);
        boards.add(board2);
        boards.add(board3);
        boards.add(board4);
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

        model.addAttribute("myBoardList", boards);
        model.addAttribute("myRecipeList", myRecipes);
        model.addAttribute("favoriteRecipeList", myRecipes);
        //test end
        return "myPage";
    }

    @GetMapping("/foodSelect")
    public String foodSelect(){
        return "foodSelect";
    }

    @GetMapping("/findAcc")
    public String findAccount() {
        return "findAcc";
    }
    
    @PostMapping("/editProfile")
    public String editProfile(@ModelAttribute String memberEmail) {
        
        
        return "redirect:/Wimr/myPage";
    }
    
    @GetMapping("/editMyPage")
    public String editMyPage() {
        return "editMyPage";
    }

    @PostMapping("/scrap")
    public String doScrap(@RequestParam int recipeNo) {
        //로그인된 유저의 scrap 배열에 recipeNo 추가
        return "redirect:/Wimr/recipe?recipeNo="+recipeNo;
    }
    
    @PostMapping("/unscrap")
    public String doUnscrap(@RequestParam int recipeNo) {
        //로그인된 유저의 scrap 배열에 recipeNo 제거
        return "redirect:/Wimr/recipe?recipeNo="+recipeNo;
    }
    
    @PostMapping("/like")
    public String doLike(@RequestParam int recipeNo) {
        //로그인된 유저의 recommend 배열에 recipeNo 추가
        return "redirect:/Wimr/recipe?recipeNo="+recipeNo;
    }

    @PostMapping("/unlike")
    public String doUnlike(@RequestParam int recipeNo) {
        //로그인된 유저의 recommend 배열에 recipeNo 제거
        return "redirect:/Wimr/recipe?recipeNo="+recipeNo;
    }
}


