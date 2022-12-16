package com.demo.service.ths;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.domain.ths.CartDto;
import com.demo.domain.ths.OrdersDto;
import com.demo.domain.ths.PageInfo;
import com.demo.mapper.ths.OrdersMapper;

@Service
@Transactional
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

	public List<CartDto> cartlist(String u_id) {
		return ordersMapper.selectCart(u_id);
	}

	public void deleteCart(String u_id, List<Integer> b_code) {
		for(int i = 0; i < b_code.size(); i++) {
			ordersMapper.deleteCart(u_id, b_code.get(i));
		}
	}

	public List<CartDto> cartToOrder(String u_id, List<Integer> b_code, List<Integer> c_count) {
		List<CartDto> result = new ArrayList<>();
		for(int i = 0; i < b_code.size(); i++) {
			CartDto dto = ordersMapper.cartToOrder(u_id, b_code.get(i), c_count.get(i));
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

	public int insertOrders(OrdersDto orders) {
		return ordersMapper.insertOrders(orders);
	}



	public int insertBook(Integer o_number, String u_id, Integer b_code, Integer od_count) {
		return ordersMapper.insertBook(o_number ,u_id, b_code, od_count);
	}

	public void deleteOrderDetail(int o_number) {
		ordersMapper.deleteOrderDetail(o_number);
	}

	public List<OrdersDto> orderDetailList(String u_id, int o_number) {
		System.out.println(u_id);
		System.out.println(o_number);
		return ordersMapper.selectOrderDetail(u_id, o_number);
	}

	public void orderStatusChange(String o_status, int o_number) {
		ordersMapper.orderStatusChange(o_status, o_number);
		
	}
	
	public void changeCount(String u_id, List<Integer> b_code, List<Integer> c_count) {
		for(int i = 0; i < b_code.size(); i++) {
			ordersMapper.changeCount(u_id, b_code.get(i), c_count.get(i));
		}
	}
	
	
}
