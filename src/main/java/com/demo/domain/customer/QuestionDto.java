package com.demo.domain.customer;

import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class QuestionDto {
	private int q_number;
	private String q_title;
	private String q_content;
	private LocalDateTime q_date;
	private String q_img;
	private String u_id;
	private String q_option;
	
	
	/* answer */
	private int a_id;
	private String ad_id;
	private String a_content;
	
	/* 날짜 json 스트링 형식으로 변경 */
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime a_date;
	
	
	/* file */
	private List<String> fileName;
	
	
	
//	public String getAgo() {
//		LocalDateTime now = LocalDateTime.now();
//		LocalDateTime oneDayBefore = now.minusDays(1);
//		LocalDateTime oneMonthBefore = now.minusMonths(1);
//		LocalDateTime oneYearBefore = now.minusYears(1);
//
//		String result = "";
//		// 작성일과 현재가
//
//		if (oneDayBefore.isBefore(inserted)) {
//			// 하루 차이면 시간을 출력
//			result = inserted.toLocalTime().toString();
//		} else if (oneMonthBefore.isBefore(inserted)) {
//			// 1달 내이면 n일 전
//			result = Period.between(inserted.toLocalDate(), now.toLocalDate())
//					.getDays() + "일 전";
//		} else if (oneYearBefore.isBefore(inserted)) {
//			// 1년 이내면 n달 전
//			result = Period.between(inserted.toLocalDate(), now.toLocalDate())
//					.get(ChronoUnit.MONTHS) + "달 전";
//		} else {
//			// n년 전
//			result = Period.between(inserted.toLocalDate(), now.toLocalDate())
//					.getYears() + "년 전";
//		}
//
//		return result;
//	}

}
