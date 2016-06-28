package com.palmelf.erp.serviceImpl;

import org.apache.log4j.jmx.LoggerDynamicMBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.impl.Log4jLoggerFactory;

import com.palmelf.erp.service.BaseService;

// @Service("baseService")
// @Transactional(readOnly = false, propagation = Propagation.REQUIRED,
// rollbackFor = Exception.class)
public class BaseServiceImpl implements BaseService {
	protected Logger logger = LoggerFactory.getLogger(getClass());

}
