package kr.ac.dankook.ace.whatsinmyref.entity;


import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "board")
@Data
@EqualsAndHashCode(callSuper = false)
public class Board extends BaseEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int bno;
    private String title;
    private String content;
    private String nickname;
    private int viewcount;
    private Date time;
    private int likes;

    @Column(name = "created_date", nullable = false, updatable = false)
    private LocalDateTime created_date;

    // 엔티티가 저장되기 전에 초기화
    @PrePersist
    public void prePersist() {
        this.created_date = LocalDateTime.now(); // 현재 날짜 및 시간으로 초기화
    }
    
}
