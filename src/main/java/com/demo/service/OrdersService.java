package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.OrdersDto;
import com.demo.mapper.OrdersMapper;

@Service
public class OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;
	
	public List<OrdersDto> ordermanage() {
		return ordersMapper.select();
	}
}
