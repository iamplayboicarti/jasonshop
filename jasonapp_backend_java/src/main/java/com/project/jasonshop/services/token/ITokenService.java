package com.project.jasonshop.services.token;

import com.project.jasonshop.models.Token;
import com.project.jasonshop.models.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service

public interface ITokenService {
    Token addToken(User user, String token, boolean isMobileDevice);
    Token refreshToken(String refreshToken, User user) throws Exception;
}
