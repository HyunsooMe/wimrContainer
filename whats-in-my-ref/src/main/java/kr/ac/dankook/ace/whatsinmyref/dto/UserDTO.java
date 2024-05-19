package kr.ac.dankook.ace.whatsinmyref.dto;

import kr.ac.dankook.ace.whatsinmyref.entity.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class UserDTO {

    private int member_no;
    private String member_id;
    private String member_pw;
    private String member_email;
    private String member_nick;

    public static UserDTO toUserDTO(User user){
        UserDTO userDTO = new UserDTO();

        userDTO.setMember_no(user.getMember_no());
        userDTO.setMember_id(user.getMember_id());
        userDTO.setMember_pw(user.getMember_pw());
        userDTO.setMember_email(user.getMember_email());
        userDTO.setMember_nick(user.getMember_nick());

        return userDTO;
    }
}
