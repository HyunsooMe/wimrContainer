package kr.ac.dankook.ace.whatsinmyref.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
// import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.dankook.ace.whatsinmyref.entity.Board;
import kr.ac.dankook.ace.whatsinmyref.service.BoardService;


@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 게시글 목록
    @GetMapping("/boardList")
    // 게시글 리스트 10개씩 보여주고, 마지막에 쓴 글을 맨 앞으로 정렬.
    public String BoardList(Model model, @PageableDefault(page = 0, size = 10, sort = "bno", direction = Sort.Direction.DESC) Pageable pageable){
        Page<Board> boardList = boardService.boardList(pageable);

        // 현재 페이지
        // 첫 페이지 0이므로 1 더함
        int nowPage = boardList.getPageable().getPageNumber() + 1;
        // 시작 페이지
        // 음수가 나오면 1페이지 반환
        int startPage = Math.max(nowPage - 4,1);
        // 끝 페이지
        // 전체 페이지보다 크면 마지막 페이지 반환
        int endPage = Math.min(nowPage + 5,boardList.getTotalPages());

        model.addAttribute("boardList", boardList);
        model.addAttribute("boardList", boardList);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "/board/boardList";
    }
    // 게시글 작성폼
    @GetMapping("/boardForm")
    public String BoardForm(){
        return "/board/boardForm";
    }
    // 작성폼 전송 처리
    @PostMapping("/board/writePro")
    public String boardwritePro(Board board){

        boardService.write(board);
        return "redirect:/boardList";
    }
    // 게시글 상세보기
    @GetMapping("/boardView") //localhost:8080/boardView?bno=1
    public String boardView(Model model,Integer bno){
        model.addAttribute("board",boardService.boardView(bno));
        // 조회수 증가
        boardService.increaseViewCount(bno);
        return "/board/boardView";
    }
    // 게시글 삭제
    @GetMapping("/boardDelete")
    public String boardDelete(Integer bno){

        boardService.boardDelete(bno);

        return "redirect:/boardList";
    }

    @GetMapping("/food")
    public String Food() {
        return "/foodSelect";
    }

}
