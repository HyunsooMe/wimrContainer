package kr.ac.dankook.ace.whatsinmyref.service;

import kr.ac.dankook.ace.whatsinmyref.entity.RecipeCmt;
import kr.ac.dankook.ace.whatsinmyref.repository.RecipeCmtRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecipeCmtService {

    @Autowired
    private RecipeCmtRepository recipeCmtRepository;

    public List<RecipeCmt> getAllCmts(){
        return recipeCmtRepository.findAll();
    }

    public void saveRecipeCmt(RecipeCmt recipeCmt){
        recipeCmtRepository.save(recipeCmt);
    }
}
