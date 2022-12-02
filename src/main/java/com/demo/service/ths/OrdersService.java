package com.demo.service.ths;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.ths.CartDto;
import com.demo.domain.ths.OrdersDto;
import com.demo.mapper.ths.OrdersMapper;

@Service
public class OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;
	
	public List<OrdersDto> ordermanage() {
		return ordersMapper.select();
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
		return ordersMapper.cartToOrder();
	}
}
