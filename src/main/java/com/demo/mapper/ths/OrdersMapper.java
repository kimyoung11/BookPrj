package com.demo.mapper.ths;

import java.util.List;

import com.demo.domain.ths.CartDto;
import com.demo.domain.ths.OrdersDto;

public interface OrdersMapper {

	List<OrdersDto> select(int offset, int records, String keyword);

	List<CartDto> selectCart(String u_id);

	void deleteCart(String u_id, int b_code);

	CartDto cartToOrder(String u_id, Integer b_code, Integer c_count);

	CartDto selectUserData(String u_id);

	int countAll(String keyword);

	int deleteOrder(int o_number);

	int insertOrders(OrdersDto orders);

	int insertBook(int o_number, String u_id, int b_code, int od_count);

	int deleteOrderDetail(int o_number);

	List<OrdersDto> selectOrderDetail(String u_id, int o_number);

	int orderStatusChange(String o_status, int o_number);

	int changeCount(String u_id, Integer b_code, Integer c_count);
	
}
	
