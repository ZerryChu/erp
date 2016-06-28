package com.palmelf.erp.service;

import java.util.List;
import java.util.Map;

import com.palmelf.erp.model.Permission;
import com.palmelf.erp.model.Role;
import com.palmelf.erp.viewModel.TreeGrid;

public interface PermissionAssignmentService {

	List<TreeGrid> findAllFunctionsList(Integer pid);

	Long getCount(Map<String, Object> param);

	boolean savePermission(Integer userId, Integer roleId, String checkedIds);

	List<Permission> getRolePermission(Integer roleId);

	boolean persistenceRole(Map<String, List<Role>> map);

	List<Role> findAllRoleList(Map<String, Object> param, Integer page,
			Integer rows, boolean isPage);

	boolean persistenceRole(Role r);

	boolean _persistenceRole(Integer roleId);

}
