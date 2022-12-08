package com.demo.mapper.review.yjh;

import com.demo.domain.review.yjh.ReviewDto;

public interface ReviewMapper {

	int insertReview(ReviewDto review);

	int deleteReview(int r_id);

	int updateReview(ReviewDto review);

	ReviewDto selectReview(int r_id);

	

}
