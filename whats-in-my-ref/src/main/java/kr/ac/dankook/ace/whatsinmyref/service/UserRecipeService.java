package kr.ac.dankook.ace.whatsinmyref.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.transaction.Transactional;
import kr.ac.dankook.ace.whatsinmyref.entity.UserRecipe;
import kr.ac.dankook.ace.whatsinmyref.repository.UserRecipeRepository;

@Service
public class UserRecipeService {

    @Autowired
    private UserRecipeRepository userRecipeRepository;

    // 글 작성 처리
    public void write(UserRecipe userrecipe, MultipartFile file) throws Exception{

        String projectPath = "C:\\Users\\SAMSUNG\\What-s-in-my-Naengjanggo\\whats-in-my-ref\\src\\main\\resources\\static\\files";



        UUID uuid = UUID.randomUUID();

        String fileName = uuid + "_" + file.getOriginalFilename();

        File saveFile = new File(projectPath,fileName);

        file.transferTo(saveFile);

        userrecipe.setFilename(fileName);
        userrecipe.setFilepath("/files/" + fileName);

        userRecipeRepository.save(userrecipe);
    }


    //게시글 리스트 처리
    public Page<UserRecipe> userRecipeList(Pageable pageable){

        return userRecipeRepository.findAll(pageable);
    }

    // 조회수 증가
    @Transactional
    public void increaseViewCount(Integer id){
        UserRecipe userRecipe = userRecipeRepository.findById(id).get();
        if(userRecipe != null){
            userRecipe.setViewcount(userRecipe.getViewcount() + 1); // 조회수 증가
            userRecipeRepository.save(userRecipe); // 변경 내용 저장

        }
    }

    // 특정 게시글 불러오기
    public UserRecipe userRecipeView(Integer id){
        return userRecipeRepository.findById(id).get();
    }

     // 조회수 순서 게시글 리스트 처리
     public Page<UserRecipe> userRecipeListByViewCount(Pageable pageable) {
        return userRecipeRepository.findAllByOrderByViewcountDesc(pageable);
    }
}
