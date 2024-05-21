package kr.ac.dankook.ace.whatsinmyref.dto;

import lombok.Getter;
import lombok.Setter;

import javax.xml.crypto.Data;
import java.util.List;

@Getter
@Setter
public class ApiResponseDTO {
    private String status;
    private Data data;

    @Getter @Setter
    public static class Data{
        private List<RecipeDTO> recipes;
    }
}
