package com.project.jasonshop.responses.coupon;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.jasonshop.models.Comment;
import com.project.jasonshop.responses.user.UserResponse;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CouponCalculationResponse {
    @JsonProperty("result")
    private Double result;
}
