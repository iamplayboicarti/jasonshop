package com.project.jasonshop.repositories;

import com.project.jasonshop.models.Category;
import com.project.jasonshop.models.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
