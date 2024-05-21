package kr.ac.dankook.ace.whatsinmyref.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class RecipeDTO {
    //메뉴 명
    private String RCP_NM;
    //열량
    private Double INFO_ENG;
    //탄수화물
    private Double INFO_CAR;
    //단백질
    private Double INFO_PRO;
    //지방
    private Double INFO_FAT;
    //나트륨
    private Double INFO_NA;
    //이미지(소)
    private String ATT_FILE_NO_MAIN;
    //재료 정보
    private String RCP_PARTS_DTLS;

    // Getters and setters...
    //
    public String getManualStep(int i) {
        try {
            return (String) this.getClass().getDeclaredField("MANUAL0" + i).get(this);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            return null;
        }
    }

    public String getManualImage(int i) {
        try {
            return (String) this.getClass().getDeclaredField("MANUAL_IMG0" + i).get(this);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            return null;
        }
    }
}
