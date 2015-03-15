package com.zblog.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zblog.dmo.FriendlyLink;
import com.zblog.service.BaseService;
import com.zblog.service.FriendlyLinkService;

@Component
public class FriendlyLinkServiceImpl extends BaseService
	implements FriendlyLinkService {

	/**
	 * 获取友情链接
	 */
	@Override
	public List<FriendlyLink> getFriendlyLinks() {		
		return friendlyLinkDao.getFriendlyLinks();
	}

	/**
	 * 添加友情链接
	 */
	@Override
	public boolean addFriendlyLink(FriendlyLink friendlyLink) {     
        int result = friendlyLinkDao.addFriendlyLink(friendlyLink);
		return (result > 0);
	}

	/**
	 * 更新友情链接
	 */
	@Override
	public boolean updateFriendLink(FriendlyLink friendlyLink) {
        int result = friendlyLinkDao.updateFriendLink(friendlyLink);
        return (result > 0);
	}

	/**
	 * 删除友情链接
	 */
	@Override
	public boolean deleteFriendLink(FriendlyLink friendlyLink) {
        int result = friendlyLinkDao.deleteFriendLink(friendlyLink);
        return (result > 0);
	}
    
}
