package kr.ac.dankook.ace.whatsinmyref.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.dankook.ace.whatsinmyref.entity.Board;
import kr.ac.dankook.ace.whatsinmyref.repository.BoardRepository;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    public void write(Board board){

        boardRepository.save(board);
    }
    
    public List<Board> boardList(){
        
        return boardRepository.findAll();
    }
}
