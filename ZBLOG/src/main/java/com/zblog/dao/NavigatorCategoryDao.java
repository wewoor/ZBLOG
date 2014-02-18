package com.zblog.dao;

import java.util.List;

import com.zblog.dmo.NavigatorCategory;

/**
 * 导航分类Dao
 * 
 * @author  Ziv
 * @version  [版本号, 2014-2-12]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public interface NavigatorCategoryDao {
    
    /**
     * 
     * 检索导航列表信息
     * @param user
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<NavigatorCategory> getNavigatorCategorys();
}
