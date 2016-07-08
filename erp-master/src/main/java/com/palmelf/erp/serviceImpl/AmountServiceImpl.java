package com.palmelf.erp.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palmelf.erp.dao.PublicDao;
import com.palmelf.erp.model.Amount;
import com.palmelf.erp.model.ItemInfo;
import com.palmelf.erp.service.AmountService;

@SuppressWarnings("unchecked")
@Service("amountService")
public class AmountServiceImpl implements AmountService {
	
	@SuppressWarnings("rawtypes")
	private PublicDao publicDaoSQL;
	
	@SuppressWarnings("rawtypes")
	@Autowired
	public void setPublicDaoSQL(PublicDao publicDaoSQL )
	{
		this.publicDaoSQL = publicDaoSQL;
	}
	
	@Override
	public List<Amount> showAmountAllYear() {
		// TODO Auto-generated method stub
		return publicDaoSQL.find("from Amount a");
	}

	@Override
	public List<ItemInfo> showItemInfos() {
		// TODO Auto-generated method stub
		return publicDaoSQL.find("from ItemInfo i");
	}

}
