package kr.ac.dankook.ace.whatsinmyref.entity;

import java.util.Date;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter
@Table(name="PersonalRecipe")
@NoArgsConstructor
@AllArgsConstructor
public class PersonalRecipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JoinColumn(name = "recipeno")
    private int recipeno;

    private String manual;
    private String nickname;
    private Date time;
    private String viewCount;


}