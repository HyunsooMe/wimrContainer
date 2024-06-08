package kr.ac.dankook.ace.whatsinmyref.controller;

import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import kr.ac.dankook.ace.whatsinmyref.dto.boardDTO;
import kr.ac.dankook.ace.whatsinmyref.entity.Recipe;
import kr.ac.dankook.ace.whatsinmyref.entity.RecipeCmt;
import kr.ac.dankook.ace.whatsinmyref.entity.RecipeLikes;
import kr.ac.dankook.ace.whatsinmyref.entity.Scrap;
import kr.ac.dankook.ace.whatsinmyref.entity.User;
import kr.ac.dankook.ace.whatsinmyref.service.RecipeCmtService;
import kr.ac.dankook.ace.whatsinmyref.service.RecipeLikesService;
import kr.ac.dankook.ace.whatsinmyref.service.RecipeService;
import kr.ac.dankook.ace.whatsinmyref.service.ScrapService;
import kr.ac.dankook.ace.whatsinmyref.service.UserService;
import lombok.RequiredArgsConstructor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Arrays;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;


@Controller
@RequestMapping("/Wimr")
@RequiredArgsConstructor
public class WhatsInMyRefController {

    @Autowired
    private final UserService userService;

    @Autowired
    private RecipeService recipeService;

    @Autowired
    private RecipeCmtService recipeCmtService;

    @Autowired
    private ScrapService scrapService;

    @Autowired
    private RecipeLikesService recipeLikesService;

    @GetMapping("")
    public String mainPage(Model model) {
        //test 임시값
        List<Recipe> recipe=recipeService.getTop3ByLikecount();
        model.addAttribute("first_rank_recipe",recipe.get(0));
        model.addAttribute("second_rank_recipe",recipe.get(1));
        model.addAttribute("third_rank_recipe",recipe.get(2));
        //test 임시값 여기까지
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
    @GetMapping("/recipe/{title}")
    public String listRecipe(@PathVariable String title,HttpSession session, Model model) {
        //Ingredients 재료
        //Recipe : 사진, 정보
        //others : 영양 성분
        List<String> manualList = new ArrayList<>();
        List<String> manualImgList = new ArrayList<>();
        recipeService.getRecipeByTitle(title).ifPresent(recipe -> {
            List<String> others = List.of("열량 : " + recipe.getCalories(), "탄수화물 : " + recipe.getCarbohydrates() ,"단백질 :" + recipe.getProtein(), "지방 : " + recipe.getFat(), "나트륨 : " + recipe.getSodium());
            List<String> ingredient = Arrays.asList(recipe.getIngredient().split(","));
            List<Recipe> scrapRecipeList=new ArrayList<>();
            List<Recipe> likeRecipeList=new ArrayList<>();
            if(session.getAttribute("user")!=null)
            {
                UserDTO loginUser=(UserDTO)session.getAttribute("user");
                scrapRecipeList=scrapService.getAllRecipesBymemberNo(loginUser.getMemberNo());
                likeRecipeList=recipeLikesService.getAllRecipesBymemberNo(loginUser.getMemberNo());
            }

            String k1 = "MANUAL0";
            String k2 = "MANUAL_IMG0";

            int i = 1;
            while(true) {
                String kee = k1.concat(Integer.toString(i));
                if (!recipe.getManual().get(kee).isEmpty()) {
                    manualList.add(recipe.getManual().get(kee));
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
            model.addAttribute("nickname","정동재");
            model.addAttribute("recipe", recipe);
            model.addAttribute("ingredients", ingredient);
            model.addAttribute("others", others);
            model.addAttribute("manualList", manualList);
            model.addAttribute("manualImgList", manualImgList);
            model.addAttribute("comments", recipeCmtService.findRecipeCmtsById(recipe.getRecipeno()));
            model.addAttribute("newComment", new RecipeCmt());
            model.addAttribute("likeList", likeRecipeList);
            model.addAttribute("scrapList", scrapRecipeList);
        });
        return "recipe";
    }

    @PostMapping("/recipe/{title}")
    public String addRecipeCmt(@PathVariable String title, RecipeCmt recipeCmt) throws UnsupportedEncodingException {
        recipeService.getRecipeByTitle(title).ifPresent(recipe -> {
            recipeCmt.setTime(new Date());
            recipeCmt.setRno(recipe.getRecipeno());
            recipeCmtService.saveRecipeCmt(recipeCmt);
        });

        String encodedTitle = URLEncoder.encode(title, "UTF-8");
        encodedTitle = encodedTitle.replaceAll("\\+", "%20");
        return "redirect:/Wimr/recipe/"+encodedTitle;
    }

    @GetMapping("/register")
    public String save(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "register";
    }

    @PostMapping("/register")
    public String save(@ModelAttribute UserDTO userDTO, Model model){
        if(userService.existsByMemberId(userDTO.getMemberId())){
            model.addAttribute("errorMessage", "이미 사용중인 아이디입니다.");
            return "register";
        }
        else if(userService.existsByMemberNick(userDTO.getMemberNick())){
            model.addAttribute("errorMessage", "이미 사용중인 닉네임입니다.");
            return "register";
        }
        else if(userService.existsByMemberEmail(userDTO.getMemberEmail())){
            model.addAttribute("errorMessage", "이미 사용중인 이메일입니다.");
            return "register";
        }
        userService.save(userDTO);
        model.addAttribute("successMessage", "정상적으로 회원가입되었습니다!");
        model.addAttribute("searchUrl","/Wimr");
        return "register";
    }
    
    
    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("userDTO", new UserDTO());
        return "login";
    }
    
    @PostMapping("/login")
    public String loginUser(@ModelAttribute UserDTO userDTO, HttpSession session, Model model) {
        UserDTO loginResult = userService.login(userDTO);
        if(loginResult != null){
            session.setAttribute("user", loginResult);
            session.setMaxInactiveInterval(1800);
            return "redirect:/Wimr"; //로그인 성공 확인용
        } else{
            if(!userService.existsByMemberId(userDTO.getMemberId())){
            model.addAttribute("errorMessage", "존재하지 않는 회원 아이디입니다.");
            model.addAttribute("searchUrl","/Wimr/login");
            return "login";
        } else{
                model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
                model.addAttribute("searchUrl","/Wimr/login");
                return "login";
            }
        }

    }

    @PostMapping("/logout")
    public String logoutUser(HttpSession session){
        session.invalidate();
        return "redirect:/Wimr";
    }
    
    @GetMapping("/myPage/{memberNick}")
    public String myPage(@PathVariable String memberNick, Model model) {
        UserDTO pageUser=userService.getByMemberNick(memberNick);
        List<Recipe> scrapRecipes=null;



         //스크랩한 레시피 불러오기
         if((scrapRecipes=scrapService.getAllRecipesBymemberNo(pageUser.getMemberNo()))==null){
            scrapRecipes=new ArrayList<Recipe>();
         }
         model.addAttribute("pageUser", pageUser);
         model.addAttribute("favoriteRecipeList", scrapRecipes);
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
    public String editProfile(@RequestParam String memberNick, @RequestParam String memberEmail, HttpSession session) {
        UserDTO loginUser=(UserDTO)session.getAttribute("user");
        if(memberNick!=null){
            loginUser.setMemberNick(memberNick);
        }
        if(memberEmail!=null){
            loginUser.setMemberEmail(memberEmail);
        }

        userService.updateUser(loginUser);
        return "redirect:/Wimr/myPage?memberNo="+loginUser.getMemberNo();
    }
    
    @GetMapping("/editMyPage")
    public String editMyPage(HttpSession session,Model model) {
        if(session.getAttribute("user") == null){
            model.addAttribute("userDTO", new UserDTO());
            model.addAttribute("errorMessage","로그인을 해주세요.");
            model.addAttribute("searchUrl","/Wimr/login");
            return "login";
        }
        return "editMyPage";
    }


    /*============================================================
    스크랩
    ==============================================================*/
    @PostMapping("/scrap")
    public String doScrap(@RequestParam int recipeNo,HttpSession session, Model model) {
        //로그인된 유저의 scrap 배열에 recipeNo 추가
        if(session.getAttribute("user") == null){
            model.addAttribute("userDTO", new UserDTO());
            model.addAttribute("errorMessage","로그인을 해주세요.");
            model.addAttribute("searchUrl","/Wimr/login");
            return "login";
        }
        User loginUser=User.toUser((UserDTO)session.getAttribute("user"));
        Recipe recipe=recipeService.getRecipeById(recipeNo).get();
        scrapService.addToScrapList(loginUser, recipe);
        return "redirect:/Wimr/recipe/"+recipeNo;
    }
    
    @PostMapping("/unscrap")
    public String doUnscrap(@RequestParam int recipeNo,HttpSession session, Model model) {
        //로그인된 유저의 scrap 배열에 recipeNo 제거
        if(session.getAttribute("user") == null){
            model.addAttribute("userDTO", new UserDTO());
            model.addAttribute("errorMessage","로그인을 해주세요.");
            model.addAttribute("searchUrl","/Wimr/login");
            return "login";
        }
        User loginUser=User.toUser((UserDTO)session.getAttribute("user"));
        Recipe recipe=recipeService.getRecipeById(recipeNo).get();
        scrapService.deleteScrap(loginUser, recipe);
        return "redirect:/Wimr/recipe/"+recipeNo;
    }
    
    /*============================================================
    좋아요
    ==============================================================*/
    @PostMapping("/like")
    public String doLike(@RequestParam int recipeNo,HttpSession session, Model model) {
        //로그인 체크
        if(session.getAttribute("user") == null){
            model.addAttribute("userDTO", new UserDTO());
            model.addAttribute("errorMessage","로그인을 해주세요.");
            model.addAttribute("searchUrl","/Wimr/login");
            return "login";
        }
        User loginUser=User.toUser((UserDTO)session.getAttribute("user"));
        Recipe recipe=recipeService.getRecipeById(recipeNo).get();
        //like레시피에 추가
        recipeLikesService.addTolikeList(loginUser, recipe);
        //레시피의 likecount 1 증가
        recipe.setLikecount(recipe.getLikecount()+1);
        recipeService.saveRecipe(recipe);
        return "redirect:/Wimr/recipe/"+recipeNo;
    }

    @PostMapping("/unlike")
    public String doUnlike(@RequestParam int recipeNo,HttpSession session, Model model) {
        //로그인 체크
        if(session.getAttribute("user") == null){
            model.addAttribute("userDTO", new UserDTO());
            model.addAttribute("errorMessage","로그인을 해주세요.");
            model.addAttribute("searchUrl","/Wimr/login");
            return "login";
        }
        User loginUser=User.toUser((UserDTO)session.getAttribute("user"));
        Recipe recipe=recipeService.getRecipeById(recipeNo).get();
        //like레시피 제거
        recipeLikesService.deleteLike(loginUser, recipe);
        //레시피의 likecount 1 감소
        recipe.setLikecount(recipe.getLikecount()-1);
        recipeService.saveRecipe(recipe);
        return "redirect:/Wimr/recipe/"+recipeNo;
    }

    /*============================================================
    아이디-비밀번호 찾기
    ==============================================================*/
  
    @PostMapping("/findAcc/find-id")
    public String findId(@ModelAttribute UserDTO userDTO, Model model) {
        String memberEmail = userDTO.getMemberEmail();
        System.out.println(memberEmail);
        String maskedMemberId = null;
        if(userService.existsByMemberEmail(memberEmail)){
            String memberId = userService.findMemberIdByMemberEmail(memberEmail);
            maskedMemberId = "**" + memberId.substring(2);
            System.out.println("sucess");  
        }
        model.addAttribute("masked_member_id", maskedMemberId);
        model.addAttribute("idSearchPerformed", true);
        return "findAcc";
    }
    

    @PostMapping("/findAcc/find-pwd")
    public String findPwd(@ModelAttribute UserDTO userDTO) {
        
        //userDTO의 Id랑 Email에 일치하는게 DB에 있는지 검증
        return "redirect:/Wimr/findAcc/rewritepw";
    }
    
    /*============================================================
    비밀번호 변경
    ==============================================================*/
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


