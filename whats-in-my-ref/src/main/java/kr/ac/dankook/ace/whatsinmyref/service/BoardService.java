package kr.ac.dankook.ace.whatsinmyref.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.dankook.ace.whatsinmyref.entity.Board;
import kr.ac.dankook.ace.whatsinmyref.repository.BoardRepository;

@Service
@Component
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;


    // 글 작성 처리
    public void write(Board board){
        boardRepository.save(board);
    }
    
    // 게시글 리스트 처리
    public Page<Board> boardList(Pageable pageable){
        
        return boardRepository.findAll(pageable);
    }

    // 특정 게시글 불러오기
    public Board boardView(Integer bno){

        return boardRepository.findById(bno).get();
    }

    // 특정 게시글 삭제
    public void boardDelete(Integer bno){

        boardRepository.deleteById(bno);
    }

    // 조회수 증가
    @Transactional
    public void increaseViewCount(Integer bno){
        Board board = boardRepository.findById(bno).get();
        if(board != null){
            board.setViewcount(board.getViewcount() + 1); // 조회수 증가
            boardRepository.save(board); // 변경 내용 저장

        }
    }
}
