package kr.ac.dankook.ace.whatsinmyref.controller;

import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import kr.ac.dankook.ace.whatsinmyref.dto.boardDTO;
import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import kr.ac.dankook.ace.whatsinmyref.entity.User;
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
import org.springframework.web.bind.annotation.RequestBody;






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

    @GetMapping("/recipe") //localhost:8080/Wimr/recipe?recipeNo=
    public String recipe(@RequestParam int recipeNo,Model model) {
        //test code
        String foodImg = "/img/ingredients.jpg";  //이미지가 없는 경우 default
        /*
        model.addAttribute("foodName",foodName)         //요리 이름
        model.addAttribute("ingredients", ingredients); //재료 리스트
        model.addAttribute("recipe", recipe);           //레시피 리스트
        */
        model.addAttribute("picture", foodImg);         //음식 사진 path
        Recipe recipe=new Recipe();
        recipe.setRecipeno(recipeNo);
        model.addAttribute("recipe", recipe );
        List<Integer> scrapList=new ArrayList<>();
        scrapList.add(recipeNo);
        model.addAttribute("scrapList", scrapList);
        List<Integer> likeList=new ArrayList<>();
        likeList.add(recipeNo);
        model.addAttribute("likeList", likeList);
        //test code end
        return "recipe";
    }
//    @GetMapping("/recipe")
//    public String recipe(){
//        return "recipe";
//    }

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
    public String findAccount(@ModelAttribute UserDTO userDTO) {
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

    @PostMapping("/findAcc/find-id")
    public String findId(@ModelAttribute UserDTO userDTO) {
        //TODO: process POST request
        //userDTO의 이메일에 맞는 아이디 찾아서 검열 후 masked_member_id에 보내야됨 
        return "redirect:/Wimr/findAcc";
    }
    

    @PostMapping("/findAcc/find-pwd")
    public String findPwd(@ModelAttribute UserDTO userDTO) {
        
        //userDTO의 Id랑 Email에 일치하는게 DB에 있는지 검증
        return "redirect:/Wimr/findAcc/rewritepw";
    }
    

    @GetMapping("/findAcc/rewritepw")
    public String reWritePw() {
        //여기서 이전에 이메일 쳐서 들어왔는지 확인해서 아니면 페이지 들어가지 못하게 해야됨
        return "reWritePw";
    }

    @PostMapping("/doRewritepw")
    public String doReWritePw(@ModelAttribute String memberPw) {
        //TODO: process POST request
        //비밀번호 변경
        return "redirect:/Wimr/login";
    }
    
    
}


