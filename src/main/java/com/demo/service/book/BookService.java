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
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
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
			System.out.println("upload" + key);
			
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

	public int modifyBook(BookDto bookDto,MultipartFile file) {
		System.out.println("code" + bookDto.getB_code());
		int b_code = bookDto.getB_code();
		System.out.println("SDFSDF:"+bookDto);
		String img_name = bookMapper.selectImgByCode(b_code);
		int cnt = bookMapper.deleteBookImg(b_code); //book b_img 컬럼 데이터 삭제
		deleteFile(b_code,img_name);
		if(file != null && file.getSize() > 0) {
			uploadFile(b_code,file);
			bookDto.setB_img(file.getOriginalFilename());
			System.out.println(bookDto);

		}
		System.out.println("thisdsfas" + bookDto);
		return bookMapper.updateBook(bookDto);
	}
	private void deleteFile(int id, String filename) {
		String key = "book/" + id + "/" + filename;
		System.out.println("delete" + key);
		System.out.println(bucketName);
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		s3Client.deleteObject(deleteObjectRequest);
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

	public int removeBookLike(int b_code) {
		return bookMapper.deleteBookLike(b_code);
	}

	public Page<BookDto> getBookByKeyword(String b_keyword) {
		return bookMapper.selectBookByKeyword(b_keyword);
	}

	public double getByReviewAvg(int b_code) {
		return bookMapper.selectByReviewAvg(b_code);
	}

	public int getByPeopleCnt(int b_code) {
		return bookMapper.selectByPeopleCnt(b_code);
	}

	public Page<BookDto> getByLike() {
		return bookMapper.selectByLike();
	}

	public List<BookDto> bestBook() {
		return bookMapper.selectBestBook();
	}

	public List<Double> getRankBook() {
		return bookMapper.selectRankBook();
	}

}
