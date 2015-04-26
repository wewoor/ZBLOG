package com.zblog.service;

import java.util.List;

import com.zblog.dmo.FriendlyLink;

/**
 * 友情链接
 * @author Administrator
 */
public interface FriendlyLinkService {
	
    /**
     * 
     * 根据用户对象检索用户信息
     * @param user
     * @return
     * @see [类、类#方法、类#成员]
     */
    List<FriendlyLink> getFriendlyLinks();
    
    /**
     * 添加友情链接
     * @param friendlyLink
     * @return
     */
    boolean addFriendlyLink(FriendlyLink friendlyLink);
    
    /**
     * 更新友情链接
     * @param friendlyLink
     * @return
     */
    boolean updateFriendLink(FriendlyLink friendlyLink);
    
    /**
     * 删除友情链接
     * @param friendlyLink
     * @return int 操作成功量
     */
    boolean deleteFriendLink(FriendlyLink friendlyLink);
}
