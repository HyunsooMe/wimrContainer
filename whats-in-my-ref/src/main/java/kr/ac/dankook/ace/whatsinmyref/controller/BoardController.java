package kr.ac.dankook.ace.whatsinmyref.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.dankook.ace.whatsinmyref.entity.Board;
import kr.ac.dankook.ace.whatsinmyref.service.BoardService;


@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/boardList")
    public String BoardList(Model model){
        model.addAttribute("boardList",boardService.boardList());
        return "/board/boardList";
    }

    @GetMapping("/boardForm")
    public String BoardForm(){
        return "/board/boardForm";
    }
    
    @PostMapping("/board/writePro")
    public String boardwritePro(Board board){

        boardService.write(board);
        return "redirect:/boardList";
    }

    @GetMapping("/boardView") //localhost:8080/boardView?id=1
    public String boardView(Model model,Integer id){
        model.addAttribute("board",boardService.boardView(id));
        return "/board/boardView";
    }
    
    @GetMapping("/boardDelete")
    public String boardDelete(Integer id){

        boardService.boardDelete(id);

        return "redirect:/boardList";
    }

    @GetMapping("/food")
    public String Food() {
        return "/foodSelect";
    }

}
