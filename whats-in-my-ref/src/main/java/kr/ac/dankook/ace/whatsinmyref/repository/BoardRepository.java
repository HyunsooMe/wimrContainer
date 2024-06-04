package kr.ac.dankook.ace.whatsinmyref.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.dankook.ace.whatsinmyref.entity.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> {
<<<<<<< HEAD
    Page<Board> findAllByOrderByViewcountDesc(Pageable pageable);
=======
  Page<Board> findAllByOrderByViewcountDesc(Pageable pageable);
>>>>>>> cfb302cc543b6baba4fb79e9229985fe2085fcc8
} 