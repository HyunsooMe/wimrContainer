package kr.ac.dankook.ace.whatsinmyref.entity;


import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.*;
// import kr.ac.dankook.ace.whatsinmyref.dto.boardDTO;
import lombok.Data;
// import lombok.EqualsAndHashCode;

@Table(name = "board")
@Data
@Entity
@Embeddable
public class Board{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bno;
    private String title;
    private String content;
    private String nickname;
    private int viewcount;
    private Date time;
    private int likes;

    private LocalDateTime created_date;

    // 엔티티가 저장되기 전에 초기화
    @PrePersist
    public void prePersist() {
        this.created_date = LocalDateTime.now(); // 현재 날짜 및 시간으로 초기화
    }
    
}
