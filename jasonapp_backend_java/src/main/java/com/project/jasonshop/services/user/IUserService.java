package com.project.jasonshop.services.user;

import com.project.jasonshop.dtos.UpdateUserDTO;
import com.project.jasonshop.dtos.UserDTO;
import com.project.jasonshop.dtos.UserLoginDTO;
import com.project.jasonshop.exceptions.DataNotFoundException;
import com.project.jasonshop.exceptions.InvalidPasswordException;
import com.project.jasonshop.models.Order;
import com.project.jasonshop.models.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface IUserService {
    User createUser(UserDTO userDTO) throws Exception;
    String login(UserLoginDTO userLoginDT) throws Exception;
    User getUserDetailsFromToken(String token) throws Exception;
    User getUserDetailsFromRefreshToken(String token) throws Exception;
    User updateUser(Long userId, UpdateUserDTO updatedUserDTO) throws Exception;

    Page<User> findAll(String keyword, Pageable pageable) throws Exception;
    void resetPassword(Long userId, String newPassword)
            throws InvalidPasswordException, DataNotFoundException;
    void blockOrEnable(Long userId, Boolean active) throws DataNotFoundException;
    void changeProfileImage(Long userId, String imageName) throws Exception;
    String loginSocial(UserLoginDTO userLoginDTO) throws Exception;
}
