package com.oa.service;

import com.oa.dto.CustomDto;
import com.oa.model.Custom;
import com.oa.utils.Page;
import com.oa.utils.Pagination;



/**
 * 客户管理
 * @author YiMing on 2016/7/31.
 */
public interface CustomService {

    /**
     * 保存客户，有ID时更新，无ID时插入
     * @author Yiming
     * @param param
     * @return
     */
    Custom save(CustomDto param);

    /**
     * 逻辑删除客户
     * @author YiMing
     * @param id
     * @return
     */
    int delete(Long id);

    /**
     * 查询单个客户
     * @author YiMing
     * @param id
     * @return
     */
    Custom findOne(Long id);

    /**
     * 分页查询客户
     * @author YiMing
     * @param param
     * @return
     */
    Pagination<Custom> findCustomByPage(CustomDto param);

    /**
     * 统计所有符合条件的客户数量
     * @author YiMing
     * @param param
     * @return
     */
    Integer findCustomByPageCount(CustomDto param);

    /**
     * 查询客户(用于选择客户)
     * @param page
     * @return
     */
    Page<CustomDto> queryCustom(Page<CustomDto> page);

    /**
     * 匹配code 匹配名称 查询唯一客户 用于验证
     * @autho YiMing
     * @param param
     * @return
     */
    Custom findCustom(CustomDto param);
}
