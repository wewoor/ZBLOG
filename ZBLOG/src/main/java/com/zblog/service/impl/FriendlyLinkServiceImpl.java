package com.zblog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zblog.dao.FriendlyLinkDao;
import com.zblog.dmo.FriendlyLink;
import com.zblog.service.FriendlyLinkService;

@Component
public class FriendlyLinkServiceImpl implements FriendlyLinkService {
    
	@Autowired
	private FriendlyLinkDao friendlyLinkDao;

	@Override
	public List<FriendlyLink> getFriendlyLinks() {		
		return friendlyLinkDao.getFriendlyLinks();
	}

	@Override
	public boolean addFriendlyLink(FriendlyLink friendlyLink) {     
        int result = friendlyLinkDao.addFriendlyLink(friendlyLink);
        if (result > 0) { return true; }
		return false;
	}

	@Override
	public boolean updateFriendLink(FriendlyLink friendlyLink) {
        int result = friendlyLinkDao.updateFriendLink(friendlyLink);
        if (result > 0) { return true; }
        return false;
	}
    
}
