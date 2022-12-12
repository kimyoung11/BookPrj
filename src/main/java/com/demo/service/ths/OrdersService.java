package com.demo.service.ths;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.ths.CartDto;
import com.demo.domain.ths.OrdersDto;
import com.demo.domain.ths.PageInfo;
import com.demo.mapper.ths.OrdersMapper;

@Service
public class OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;
	
	public List<OrdersDto> ordermanage(int page, String keyword, PageInfo pageInfo) {
		int records = 5;
		int offset = (page - 1) * records;
		
		int countAll = ordersMapper.countAll("%" + keyword + "%");
		int lastPage = (countAll - 1) /  records + 1;
		
		int leftPageNumber = (page -1) / records * records + 1;
		int rightPageNumber = leftPageNumber + (records - 1);
		rightPageNumber = Math.min(rightPageNumber, lastPage);
		
		int prePageNumber = Math.max((page - 1) / records * records - (records - 1), 1);
		int nextPageNumber= Math.min((page - 1) / records * records + (records + 1), lastPage);
		
		pageInfo.setPrePageNumber(prePageNumber);
		pageInfo.setNextPageNumber(nextPageNumber);
		pageInfo.setCurrentPageNumber(page);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setLastPageNumber(lastPage);
		
		return ordersMapper.select(offset, records, "%" + keyword + "%");
	}

	public List<CartDto> cartlist() {
		return ordersMapper.selectCart();
	}

	public void deleteCart(List<String> u_id, List<Integer> b_code) {
		for(int i = 0; i < u_id.size(); i++) {
			ordersMapper.deleteCart(u_id.get(i), b_code.get(i));
		}
	}

	public List<CartDto> cartToOrder(List<String> u_id, List<Integer> b_code, List<Integer> c_count) {
		List<CartDto> result = new ArrayList<>();
		for(int i = 0; i < u_id.size(); i++) {
			CartDto dto = ordersMapper.cartToOrder(u_id.get(i), b_code.get(i), c_count.get(i));
			dto.setC_count(c_count.get(i));
			result.add(dto);
		}
		return result;
	}

	public CartDto userData(String u_id) {
		return ordersMapper.selectUserData(u_id);
	}

	public void orderDelete(int o_number) {
		ordersMapper.deleteOrder(o_number);
	}
}
