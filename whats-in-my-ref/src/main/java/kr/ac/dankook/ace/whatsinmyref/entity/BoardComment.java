package kr.ac.dankook.ace.whatsinmyref.entity;

import java.util.Date;

public class BoardComment {
    //댓글 번호
    private int cmtno;
    //댓글을 달 게시글 번호 ->Foreign key
    private int bno;
    private String comment;
    //작성자
    private String nickname;
    private Date time;
}
