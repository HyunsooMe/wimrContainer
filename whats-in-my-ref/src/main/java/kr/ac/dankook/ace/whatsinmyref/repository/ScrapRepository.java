package kr.ac.dankook.ace.whatsinmyref.repository;

import kr.ac.dankook.ace.whatsinmyref.entity.Scrap;
import kr.ac.dankook.ace.whatsinmyref.entity.ScrapId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScrapRepository extends JpaRepository<Scrap, ScrapId>{
    List<Scrap> findAllByUserid(int userid);
}