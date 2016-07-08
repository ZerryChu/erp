package com.palmelf.erp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "ITEM_QTY", catalog = "ERP")
@DynamicUpdate(true)
@DynamicInsert(true)
public class ItemInfo {

	@Id
	@GeneratedValue
	@Column(name = "ITEM_ID", unique = true, nullable = false)
	private int id;
	
	@Column(name = "IMPORT", nullable = false, length = 8)
	private int imPort;
	
	@Column(name = "EXPORT", nullable = false, length = 8)
	private int export;
	
	@Column(name = "NUMBER", nullable = false, length = 8)
	private int number;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getImPort() {
		return imPort;
	}
	public void setImPort(int imPort) {
		this.imPort = imPort;
	}
	public int getExport() {
		return export;
	}
	public void setExport(int export) {
		this.export = export;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}
