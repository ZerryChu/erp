package com.palmelf.erp.serviceImpl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palmelf.erp.dao.PublicDao;
import com.palmelf.erp.model.Amount;
import com.palmelf.erp.model.Item;
import com.palmelf.erp.model.ItemInfo;
import com.palmelf.erp.model.OrderSale;
import com.palmelf.erp.model.OrderSaleLine;
import com.palmelf.erp.service.OrderSaleService;
import com.palmelf.erp.util.Constants;
import com.palmelf.erp.util.PageUtil;
@SuppressWarnings("unchecked")
@Service("orderSaleService")
public class OrderSaleServiceImpl implements OrderSaleService
{
	@SuppressWarnings("rawtypes")
	private PublicDao publicDao;
	
	@SuppressWarnings("rawtypes")
	@Autowired
	public void setPublicDao(PublicDao publicDao )
	{
		this.publicDao = publicDao;
	}
	
	public List<OrderSaleLine> findOrderSaleLineList(Integer orderSaleId) 
	{
		if (orderSaleId==null||"".equals(orderSaleId))
		{
			return new ArrayList<OrderSaleLine>();
		}else {
			String hql="from OrderSaleLine t where t.status='A' and t.orderSaleId="+orderSaleId;
			return  publicDao.find(hql);
		}
		
	}
	
	public List<OrderSale> findOrderSaleList(Map<String, Object> param,PageUtil pageUtil) 
	{
		String  hql="from OrderSale t where t.status='A' ";
		hql+=Constants.getSearchConditionsHQL("t", param);
		hql+=Constants.getGradeSearchConditionsHQL("t", pageUtil);
		
		return publicDao.find(hql, param, pageUtil.getPage(), pageUtil.getRows());
	}
	
	public Long getCount(Map<String, Object> param,PageUtil pageUtil)
	{
		String hql="select count(*) from OrderSale t where t.status='A' ";
		hql+=Constants.getSearchConditionsHQL("t", param);
		hql+=Constants.getGradeSearchConditionsHQL("t", pageUtil);
		return publicDao.count(hql, param);
	}
	
	public boolean persistenceOrderSale(OrderSale c,Map<String, List<OrderSaleLine>> map)
	{
		Integer userId=Constants.getCurrendUser().getUserId();
		if (c.getOrderSaleId()==null||"".equals(c.getOrderSaleId()))
		{
			c.setIsOngoing("Y");
			c.setCreated(new Date());
			c.setLastmod(new Date());
			c.setCreater(userId);
			c.setModifyer(userId);
			c.setStatus(Constants.PERSISTENCE_STATUS);
			publicDao.save(c);
			List<OrderSaleLine> addList = map.get("addList");
			if (addList!=null&&addList.size()!=0)
			{
				for (OrderSaleLine cus : addList)
				{
					cus.setCreated(new Date());
					cus.setLastmod(new Date());
					cus.setCreater(userId);
					cus.setModifyer(userId);
					cus.setOrderSaleId(c.getOrderSaleId());
					cus.setStatus(Constants.PERSISTENCE_STATUS);
					publicDao.save(cus);
				}
			}
		}else {
			c.setLastmod(new Date());
			c.setModifyer(userId);
			publicDao.update(c);
			List<OrderSaleLine> addList = map.get("addList");
			if (addList!=null&&addList.size()!=0)
			{
				for (OrderSaleLine cus : addList)
				{
					cus.setCreated(new Date());
					cus.setLastmod(new Date());
					cus.setCreater(userId);
					cus.setModifyer(userId);
					cus.setOrderSaleId(c.getOrderSaleId());
					cus.setStatus(Constants.PERSISTENCE_STATUS);
					publicDao.save(cus);
				}
			}
			List<OrderSaleLine> updList = map.get("updList");
			if (updList!=null&&updList.size()!=0)
			{
				for (OrderSaleLine cus : updList)
				{
					cus.setLastmod(new Date());
					cus.setModifyer(userId);
					cus.setOrderSaleId(c.getOrderSaleId());
					publicDao.update(cus);
				}
			}
			List<OrderSaleLine> delList = map.get("delList");
			if (delList!=null&&delList.size()!=0)
			{
				for (OrderSaleLine cus : delList)
				{
					cus.setLastmod(new Date());
					cus.setModifyer(userId);
					cus.setOrderSaleId(c.getOrderSaleId());
					cus.setStatus(Constants.PERSISTENCE_DELETE_STATUS);
					publicDao.deleteToUpdate(cus);
				}
			}
		}
		return true;
	}

	public boolean delOrderSale(Integer orderSaleId)
	{
		Integer userId = Constants.getCurrendUser().getUserId();
		OrderSale c = (OrderSale)publicDao.get(OrderSale.class, orderSaleId);
		c.setLastmod(new Date());
		c.setModifyer(userId);
		c.setStatus(Constants.PERSISTENCE_DELETE_STATUS);
		publicDao.deleteToUpdate(c);
		String hql="from OrderSaleLine t where t.status='A' and t.orderSaleId="+orderSaleId;
		List<OrderSaleLine> list = publicDao.find(hql);
		for (OrderSaleLine cus : list)
		{
			cus.setLastmod(new Date());
			cus.setModifyer(userId);
			cus.setStatus(Constants.PERSISTENCE_DELETE_STATUS);
			publicDao.deleteToUpdate(cus);
		}
		return true;
	}

	@Override
	public boolean completeTransaction(int orderSaleId) {
		// TODO Auto-generated method stub
		OrderSale orderSaleInfo = (OrderSale) publicDao.find("from OrderSale o where o.orderSaleId = " + orderSaleId).get(0);
		if (orderSaleInfo == null || orderSaleInfo.getStatus().equals("I") || orderSaleInfo.getIsOngoing().equals("N")) {
			return false;
		} else
			orderSaleInfo.setIsOngoing("N");
		String hql="from OrderSaleLine t where t.status='A' and t.orderSaleId="+orderSaleId;
		List<OrderSaleLine> orderSaleLines = publicDao.find(hql);
		double amount = 0;
		for (int i = 0;i < orderSaleLines.size(); i++) {
			OrderSaleLine orderSale = orderSaleLines.get(i);
			Item item = (Item) publicDao.find("from Item i where i.itemId = " + orderSale.getItemId()).get(0);
			item.setAmount(item.getAmount() - orderSale.getOrderQty());
			ItemInfo itemInfo = (ItemInfo) publicDao.find("from ItemInfo i where i.id = " + orderSale.getItemId()).get(0);
			itemInfo.setExport(itemInfo.getExport() + orderSale.getOrderQty());
			itemInfo.setNumber(itemInfo.getNumber() - orderSale.getOrderQty());
			amount += orderSale.getAmount();
		}
		Calendar calendar = Calendar.getInstance();
		Amount totalAmount = (Amount) publicDao.find("from Amount a where a.month = " + (calendar.getTime().getMonth() + 1)).get(0);
		totalAmount.setGet(totalAmount.getGet() + amount);
		publicDao.flush();
		return true;
	}
}
