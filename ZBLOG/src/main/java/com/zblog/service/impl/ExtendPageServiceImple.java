package com.zblog.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zblog.dmo.ExtendPage;
import com.zblog.service.BaseService;
import com.zblog.service.ExtendPageService;

@Component
public class ExtendPageServiceImple extends BaseService  implements ExtendPageService {

	
	@Override
	public ExtendPage getPage(Integer pageId) {
		ExtendPage page = new ExtendPage();
		page.setId(pageId);
		return extendPageDao.selectPage(page);
	}

	@Override
	public List<ExtendPage> getAllPages() {
		return extendPageDao.selectAllPages();
	}

	@Override
	public boolean updatePageInfo(ExtendPage page) {
		if (page.getDisplay() == null) {
			page.setDisplay(1);
		}
		int result = extendPageDao.updatePageInfo(page);
		return result>0;
	}

	@Override
	public boolean addPage(ExtendPage page) {
		int result = extendPageDao.insertPage(page);
		return result>0;
	}

	@Override
	public boolean deletePage(Integer pageId) {
		ExtendPage page = new ExtendPage();
		page.setId(pageId);
		int result = extendPageDao.deletePage(page);
		return result>0;
	}

}
