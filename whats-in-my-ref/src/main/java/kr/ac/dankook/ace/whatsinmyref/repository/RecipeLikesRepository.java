package kr.ac.dankook.ace.whatsinmyref.repository;

import kr.ac.dankook.ace.whatsinmyref.entity.RecipeLikes;
import kr.ac.dankook.ace.whatsinmyref.entity.RecipeLikesNo;
import kr.ac.dankook.ace.whatsinmyref.entity.Scrap;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RecipeLikesRepository extends JpaRepository<RecipeLikes, RecipeLikesNo> {
    List<Scrap> findAllByUser_memberNo(int memberno);
}
