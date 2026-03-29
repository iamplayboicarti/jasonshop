package com.project.jasonshop.services.comment;

import com.project.jasonshop.dtos.CommentDTO;
import com.project.jasonshop.exceptions.DataNotFoundException;
import com.project.jasonshop.models.Comment;
import com.project.jasonshop.responses.comment.CommentResponse;

import java.util.List;

public interface ICommentService {
    Comment insertComment(CommentDTO comment);

    void deleteComment(Long commentId);
    void updateComment(Long id, CommentDTO commentDTO) throws DataNotFoundException;

    List<CommentResponse> getCommentsByUserAndProduct(Long userId, Long productId);
    List<CommentResponse> getCommentsByProduct(Long productId);
    void generateFakeComments() throws Exception;
}
