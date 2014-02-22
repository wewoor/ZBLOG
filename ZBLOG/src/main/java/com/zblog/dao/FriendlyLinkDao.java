package com.zblog.dao;

import java.util.List;

import com.zblog.dmo.FriendlyLink;

/**
 * 用户Dao
 * 
 * @author  Ziv
 * @version  [版本号, 2014-2-12]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public interface FriendlyLinkDao {
    
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
    int addFriendlyLink(FriendlyLink friendlyLink);
    
    /**
     * 更新友情链接
     * @param friendlyLink
     * @return
     */
    int updateFriendLink(FriendlyLink friendlyLink);
}
