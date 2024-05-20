package kr.ac.dankook.ace.whatsinmyref.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

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

    private String category;

    private Double calories;

    private Double carbohydrates;

    private Double protein;

    private Double fat;

    private Double sodium;

    @Lob
    private String ingredients;

    @ElementCollection
    private List<Manual> manuals;

    private String reductionTip;

    @Embeddable
    @Getter @Setter
    public static class Manual{
        private String step;
        private String image;
    }

    private String nickname;

    private int like;
}
