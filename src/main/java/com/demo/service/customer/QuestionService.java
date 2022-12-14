package com.demo.service.customer;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.PageInfo;
import com.demo.domain.customer.QuestionDto;
import com.demo.mapper.customer.QuestionMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class QuestionService {

	@Autowired
	private QuestionMapper mapper;
	
	@Autowired
	private S3Client s3Client;
	
	@Value("${aws.s3.bucket}")
	private String bucketName;
	
	/* 1:1 문의 추가 */
	@Transactional
	public int questInsert(QuestionDto question, MultipartFile[] files) {
		
//		db에 문의 게시물 추가 
		int cnt = mapper.insert(question);
		
		for(MultipartFile file : files) {
			if (files != null && file.getSize() > 0) {
	//  	db에 파일 정보 저장  
			mapper.insertFile(question.getQ_number(), file.getOriginalFilename());
			}
	//		파일명, 게시물 아이디 		
			uploadFile(question.getQ_number(), file);
	
			//		파일 저장 (받은 파일을 목적지로 전달 (목적지는 파일타입 ) 경로명 있어야함  )

//			File folder = new File("/Users/jeonglina/Desktop/Study/upload/prj/question/" + question.getQ_number());
//			folder.mkdirs();
//			File dest = new File(folder, file.getOriginalFilename());
//			try{
//				file.transferTo(dest);
//			}catch(Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException(e);
//			}
		  }
		return cnt;	
		}
	
	private void uploadFile(int id, MultipartFile file) {
		try {
			// S3에 파일 저장
			// 키 생성
			String key = "question/" + id + "/" + file.getOriginalFilename();
			
			// putObjectRequest
			PutObjectRequest putObjectRequest = PutObjectRequest.builder()
					.bucket(bucketName)
					.key(key)
					.acl(ObjectCannedACL.PUBLIC_READ)
					.build();
			
			// requestBody
			RequestBody requestBody = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
			
			// object(파일) 올리기
			s3Client.putObject(putObjectRequest, requestBody);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	
	
	
	/* 1:1 문의 리스트 */
	public  List<QuestionDto> questList(int page, PageInfo pageInfo) {
		int records = 10;
		int offset = (page -1) * records;
		
		int allCount = mapper.allCount();
		int lastPage = (allCount - 1) / records + 1;
		
		int leftPageNumber = (page - 1) / 10 * 10 + 1;
		int rightPageNumber = leftPageNumber + 9;
		rightPageNumber = Math.min(rightPageNumber, lastPage);
		
		// 이전버튼 유무
		boolean hasPrevButton = page > 10;
		// 다음버튼 유무
		boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);
		
		// 이전버튼 눌렀을 때 가는 페이지 번호
		int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
		int jumpNextPageNumber = (page - 1) / 10 * 10 + 11; 
		
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);
		pageInfo.setJumpPrevPageNumber(jumpPrevPageNumber);
		pageInfo.setJumpNextPageNumber(jumpNextPageNumber);
		pageInfo.setCurrentPageNumber(page);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setLastPageNumber(lastPage);
		
		
		return mapper.getList(offset, records);
	}
	

	
	
	/* 1:1 문의 내용 보기 */
	public QuestionDto ContentList(int q_number) {
		return mapper.select(q_number);
	}
	
	/* 1:1 문의 답변 추가하기 */
	public int answerAdd(QuestionDto quest) {
		return mapper.add(quest);
		
	}

	public List<QuestionDto> answerView(int q_number) {
		return mapper.answerSelect(q_number);
	}

}