package com.demo.mapper.ths;

import java.util.List;

import com.demo.domain.ths.CartDto;
import com.demo.domain.ths.OrdersDto;

public interface OrdersMapper {

	List<OrdersDto> select();

	List<CartDto> selectCart();

	void deleteCart(String u_id, int b_code);

	CartDto cartToOrder(String u_id, Integer b_code, Integer c_count);
	
}
	