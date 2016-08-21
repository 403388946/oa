package com.sys.service;

import com.oa.utils.Page;
import com.sys.model.Notice;
import java.util.List;

/**
 * 通知公告Service
 * @author YiMing on 2016/8/21.
 */
public interface NoticeService {


    /**
     * 保存/更新通知
     * @autho YiMing
     * @param notice 通知信息
     * @return notice
     */
    Notice save(Notice notice);

    /**
     * 保存全员通知
     * @autho YiMing
     * @param notice notice.receiveId = 0
     * @return 0 or >= 1
     */
    int saves(Notice notice);

    /**
     * 删除通知
     * @author YiMing
     * @param id 主键
     * @return  deleted 1 or undelete 0
     */
    int delete(Long id);

    /**
     * 查看通知
     * @author YiMing
     * @param id 主键
     * @return notice viewType=已看
     */
    Notice updateViewType(Long id);

    /**
     * 通过ID查询
     * @author YiMing
     * @param id 主键
     * @return notice
     */
    Notice findOne(Long id);


    /**
     * 通过ID查询
     * @author YiMing
     * @param param 参数
     * @param.offset 起始条目
     * @param.limit 一页数量
     * @return notices
     */
    List<Notice> findNotices(Page param);

    /**
     * 查询属于自己的通知 未看
     * @param loginName 登录名
     * @return notices
     */
    List<Notice> myNotices(String loginName, Integer viewType, Integer limit);
}
