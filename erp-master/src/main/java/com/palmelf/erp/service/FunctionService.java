package com.palmelf.erp.service;

import java.util.List;

import com.palmelf.erp.model.Permission;
import com.palmelf.erp.viewModel.TreeGridModel;
import com.palmelf.erp.viewModel.TreeModel;

public interface FunctionService 
{


	List<TreeGridModel> findAllFunctionList(Integer pid );

	boolean delFunction(Integer id );

	boolean persistenceFunction(List<Permission> list );

	List<TreeModel> findAllFunctionList();

	boolean persistenceFunction(Permission permission );
	
}
