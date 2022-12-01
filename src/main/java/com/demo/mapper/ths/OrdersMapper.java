package com.demo.mapper.ths;

import java.util.List;

import com.demo.domain.ths.CartDto;
import com.demo.domain.ths.OrdersDto;

public interface OrdersMapper {

	List<OrdersDto> select();

	List<CartDto> selectCart();

	int deleteCart();

}
	
