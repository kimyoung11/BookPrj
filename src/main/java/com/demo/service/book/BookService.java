package com.demo.service.book;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.demo.domain.book.BookDto;
import com.demo.mapper.book.BookMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class BookService {

	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private S3Client s3Client;
	
	@Value("${aws.s3.bucket}")
	private String bucketName;
	
	public List<BookDto> listBoard() {
		
		return bookMapper.list();
	}
	
	public Page<BookDto> getByGenre(String b_genre){
		return bookMapper.selectByGenre(b_genre);
	}

	public BookDto getByCode(int b_code) {
		// TODO Auto-generated method stub
		return bookMapper.selectByCode(b_code);
	}

	public Page<BookDto> getByDate() {
		// TODO Auto-generated method stub
		return bookMapper.selectByDate();
	}

	public int addLike(Integer b_code, String u_id) {
		return bookMapper.insertLike(b_code, u_id);
	}

	public int removeLike(Integer b_code, String u_id) {
		return bookMapper.deleteLike(b_code,u_id);
	}

	public int getLikeCount(int b_code, String u_id) {
		return bookMapper.selectLikeCount(b_code,u_id);
	}

	public int addBookLike(Integer b_code) {
		return bookMapper.updateBookLike(b_code);
	}

	public int getBookLike(Integer b_code) {
		return bookMapper.selectBookLike(b_code);
	}

	public List<Map<String, Object>> autocomplete(String b_title) {
		/* System.out.println(paramMap.get("label")); */
		return bookMapper.autoComplete(b_title);
	}

	public List<BookDto> newBookList() {
		return bookMapper.selectNewBook();
	}

	public List<BookDto> ranBookList() {
		return bookMapper.selectRanBook();
	
	}
	
	@Transactional
	public int insertBook(BookDto bookDto, MultipartFile file) {
		
		bookDto.setB_img(file.getOriginalFilename());
		int cnt = bookMapper.insertBook(bookDto);
		uploadFile(bookDto.getB_code(),file);
		
		return cnt;
	}
	
	/* S3에 파일 저장 */
	private void uploadFile(int id, MultipartFile file) {
		try {

			// 키 생성
			String key = "book/" + id + "/" + file.getOriginalFilename();
			
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

	public List<BookDto> getBookList() {
		return bookMapper.selectBookList();
	}

	public int modifyBook(BookDto bookDto) {
		return bookMapper.updateBook(bookDto);
	}

	public int removeBook(int b_code) {
		return bookMapper.deleteBook(b_code);

	}

	public int countBook() {
		return bookMapper.countBook();
	}
	
	public Page<BookDto> selectAllBook() {
		return bookMapper.selectAllBook();
	}

	public Page<BookDto> getBookByGenre(String b_genre) {
		return bookMapper.selectBookByGenre(b_genre);
	}
}
