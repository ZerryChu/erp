package com.palmelf.erp.service;

import java.util.List;

import com.palmelf.erp.model.Amount;
import com.palmelf.erp.model.ItemInfo;

public interface AmountService {
	public List<Amount> showAmountAllYear();

	public List<ItemInfo> showItemInfos();
	
}
