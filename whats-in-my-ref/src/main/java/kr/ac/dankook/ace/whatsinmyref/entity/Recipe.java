package kr.ac.dankook.ace.whatsinmyref.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name ="recipe")

public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int recipeno;

    private String title;
    //재료
    private String ingredient;
    //열량
    private Double calories;
    //탄수화물
    private Double carbohydrates;
    //단백질
    private Double protein;
    //지방
    private Double fat;
    //나트륨
    private Double sodium;

    @Lob
    private String ingredients;

    @ElementCollection
    private List<Manual> manuals;

    @Embeddable
    @Getter @Setter
    public static class Manual{
        private String step;
        private String image;
    }

    private String nickname;

    private int likecount;
}
