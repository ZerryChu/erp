package com.palmelf.erp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "AMOUNT", catalog = "ERP")
@DynamicUpdate(true)
@DynamicInsert(true)
public class Amount {
	private int month;
	private double pay;
	private double get;
	
	@Id
	@GeneratedValue
	@Column(name = "MONTH", unique = true, nullable = false)
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
	@Column(name = "PAY", nullable = false, length = 8)
	public double getPay() {
		return pay;
	}
	public void setPay(double pay) {
		this.pay = pay;
	}
	
	@Column(name = "GETT", nullable = false, length = 8)
	public double getGet() {
		return get;
	}
	public void setGet(double get) {
		this.get = get;
	}
	
	
}
