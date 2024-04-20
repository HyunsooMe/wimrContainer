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
    public String boardList(Model model){
        model.addAttribute("list",boardService.boardList());
        return "/board/boardList";
    }

    @GetMapping("/boardForm")
    public String BoardForm(){
        return "/board/boardForm";
    }
    
    @PostMapping("/board/writedo")
    public String boardwriteDo(Board board){

        boardService.write(board);
        return "";
    }

    @GetMapping("/boardView") //localhosr:8080/boardView?id=1
    public String boardView(Model model,Integer id){
        model.addAttribute("board",boardService.boardView(id));
        return "/board/boardView";
    }
    
    @GetMapping("/boardDelete")
    public String boardDelete(Integer id){

        boardService.boardDelete(id);

        return "redirect:/boardList";
    }

}
