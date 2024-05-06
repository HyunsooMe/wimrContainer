package kr.ac.dankook.ace.whatsinmyref.entity;


import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

    private Integer id;
    private String title;
    private String content;
    private String nickname;

    @Column(name = "created_date", nullable = false, updatable = false)
    private LocalDateTime created_date;
    
    }
