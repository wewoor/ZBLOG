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
     * 检索所以友情链接
     * @return List<FriendlyLink>
     */
    List<FriendlyLink> getFriendlyLinks();
    
    /**
     * 添加友情链接
     * @param friendlyLink
     * @return int 操作成功量
     */
    int addFriendlyLink(FriendlyLink friendlyLink);
    
    /**
     * 更新友情链接
     * @param friendlyLink
     * @return int 操作成功量
     */
    int updateFriendLink(FriendlyLink friendlyLink);
    
    /**
     * 删除友情链接
     * @param friendlyLink
     * @return int 操作成功量
     */
    int deleteFriendLink(FriendlyLink friendlyLink);
}
