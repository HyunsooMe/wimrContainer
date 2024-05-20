package kr.ac.dankook.ace.whatsinmyref.service;

import kr.ac.dankook.ace.whatsinmyref.dto.UserDTO;
import kr.ac.dankook.ace.whatsinmyref.entity.User;
import kr.ac.dankook.ace.whatsinmyref.repository.UserRepository;
import lombok.RequiredArgsConstructor;

import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public void save(UserDTO userDTO){
        User user = User.toUser(userDTO);
        userRepository.save(user);
    }
    public UserDTO login(UserDTO userDTO){ 
        Optional<User> byUserId = userRepository.findByMemberId(userDTO.getMemberId());
        if(byUserId.isPresent()){
            User memberEntity = byUserId.get();
            if(memberEntity.getMemberPw().equals(userDTO.getMemberPw())) {
                UserDTO dto = UserDTO.toUserDTO(memberEntity);
                return dto;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
}
