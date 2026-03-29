package com.project.jasonshop.repositories;

import com.project.jasonshop.models.Category;
import com.project.jasonshop.models.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import com.project.jasonshop.models.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findByUserIdAndProductId(@Param("userId") Long userId,
                                           @Param("productId") Long productId);
    List<Comment> findByProductId(@Param("productId") Long productId);
}