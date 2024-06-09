package kr.ac.dankook.ace.whatsinmyref.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import kr.ac.dankook.ace.whatsinmyref.entity.UserRecipe;
import kr.ac.dankook.ace.whatsinmyref.service.UserRecipeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Wimr")
@RequiredArgsConstructor
public class UserRecipeController {

    @Autowired
    private UserRecipeService userRecipeService;
    

    // 레시피 등록폼 처리
    @PostMapping("/userrecipe/register")
    public String registerPro(UserRecipe userrecipe,MultipartFile file) throws Exception{

        userRecipeService.write(userrecipe, file);

        return "redirect:/userRecipe";
    }


    // 게시글 목록
    @GetMapping("/userRecipes")
    public String userRecipeList(@ModelAttribute UserDTO userDTO, Model model, 
                             @RequestParam(required = false, defaultValue = "id") String sort,
                             @PageableDefault(page = 0, size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable){

        Page<UserRecipe> userRecipeList;
         if ("viewcount".equals(sort)) {
            userRecipeList = userRecipeService.userRecipeListByViewCount(pageable);
         } else {
             userRecipeList = userRecipeService.userRecipeList(pageable);
         }

        // 현재 페이지
         int nowPage = userRecipeList.getPageable().getPageNumber() + 1;
         // 시작 페이지
         int startPage = Math.max(nowPage - 4, 1);
         // 끝 페이지
         int endPage = Math.min(nowPage + 5, userRecipeList.getTotalPages());

        model.addAttribute("list", userRecipeList);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("sort", sort);
        return "userRecipeList";
    }

    //게시글 상세보기
    @GetMapping("/userRecipeView")
    public String userRecipeView(Model model, Integer id){

        // 게시글의 상세 정보를 불러와서 모델에 추가
        UserRecipe userRecipe = userRecipeService.userRecipeView(id);
        model.addAttribute("userrecipe", userRecipe);

        // 요리 순서를 줄 단위로 분리하여 모델에 추가
        List<String> steps = userRecipe.getStepAsList();
        model.addAttribute("steps", steps);
        model.addAttribute("userrecipe", userRecipeService.userRecipeView(id));
        userRecipeService.increaseViewCount(id);
        return "/userRecipeView";
    }
}
