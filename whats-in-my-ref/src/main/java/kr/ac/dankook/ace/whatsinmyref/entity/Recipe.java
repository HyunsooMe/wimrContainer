package kr.ac.dankook.ace.whatsinmyref.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int recipeno;
    private String title;
    //재료
    private String ingredient;
    //영양 정보
    private String nutrition;
    private String content;
    private String nickname;
    private int like;
}
