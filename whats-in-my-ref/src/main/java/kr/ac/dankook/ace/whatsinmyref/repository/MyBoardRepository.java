package kr.ac.dankook.ace.whatsinmyref.repository;

import kr.ac.dankook.ace.whatsinmyref.entity.MyBoard;
import kr.ac.dankook.ace.whatsinmyref.entity.MyBoardNo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MyBoardRepository extends JpaRepository<MyBoard, MyBoardNo> {
}
