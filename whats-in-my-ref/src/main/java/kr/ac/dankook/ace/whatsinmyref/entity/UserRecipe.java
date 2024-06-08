package kr.ac.dankook.ace.whatsinmyref.entity;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import jakarta.persistence.Embeddable;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import lombok.Data;

@Entity
@Data
@Embeddable
public class UserRecipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String recipe_title;
    private String ingredient;
    private String nickname;
    private String tip;
    private String filename;
    private String filepath;
    private int viewcount;
    private String step;

    // 줄 단위로 step 필드를 분리하여 리스트로 반환하는 메서드
    public List<String> getStepAsList() {
        if (step != null && !step.isEmpty()) {
            return Arrays.asList(step.split("\\r?\\n"));
        } else {
            return Arrays.asList();
        }
    }

    public LocalDateTime getCreated_date() {
        return this.created_date;
    }

    public void setCreated_date(LocalDateTime created_date) {
        this.created_date = created_date;
    }
    private LocalDateTime created_date;

    // 엔티티가 저장되기 전에 초기화
    @PrePersist
    public void prePersist() {
        this.created_date = LocalDateTime.now(); // 현재 날짜 및 시간으로 초기화
    }
}
