package kr.ac.dankook.ace.whatsinmyref.entity;

import jakarta.persistence.*;
import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import lombok.*;

@Entity
@Getter @Setter
@NoArgsConstructor
@Table(name ="member")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int member_no;

    @Column(nullable = false)
    private String member_id;

    @Column(nullable = false)
    private String member_pw;

    @Column(nullable = false)
    private String member_email;

    @Column(nullable = false)
    private String member_nick;


    public static User toUser(UserDTO userDTO){
        User user = new User();

        user.setMember_no(userDTO.getMember_no());
        user.setMember_id(userDTO.getMember_id());
        user.setMember_pw(userDTO.getMember_id());
        user.setMember_nick(userDTO.getMember_nick());
        user.setMember_email(userDTO.getMember_email());

        return user;
    }
}
