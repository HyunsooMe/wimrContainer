package kr.ac.dankook.ace.whatsinmyref.repository;

import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Repository;

import kr.ac.dankook.ace.whatsinmyref.entity.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> {

} 