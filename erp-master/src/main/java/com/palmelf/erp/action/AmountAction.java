package com.palmelf.erp.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ModelDriven;
import com.palmelf.erp.model.Amount;
import com.palmelf.erp.service.AmountService;

@Namespace("/amount")
@Action(value = "amountAction")
public class AmountAction extends BaseAction implements ModelDriven<Amount> {
	
	private static final long serialVersionUID = -5649548096030365832L;
	private AmountService amountService;
	private Amount amount;
	
	@Autowired
	public void setAmountService(AmountService amountService) {
		this.amountService = amountService;
	}

	@Override
	public Amount getModel() {
		// TODO Auto-generated method stub
		if (amount != null)
			return amount;
		amount = new Amount();
		return amount;
	}
	
	public String getAmountAllYear() {
		OutputJson(amountService.showAmountAllYear());
		return null;
	}
	
	public String getiTemQuantity() {
		OutputJson(amountService.showItemInfos());
		return null;
	}
	
}
