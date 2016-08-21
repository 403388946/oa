package com.sys.mapper;

import com.oa.utils.Page;
import com.sys.model.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 通知公告DAO
 * @author YiMing on 2016/8/20.
 */
public interface NoticeMapper {

    int insert(Notice notice);

    int inserts(Notice notice, @Param("receiveIds")List<Long> receiveIds);

    int update(Notice notice);

    int delete(@Param("id")Long id);

    Notice findOne(@Param("id")Long id);

    List<Notice> findNotices(Page param);


    List<Notice> myNotices(@Param("receiveUserName")String loginName, @Param("viewType")Integer viewType, @Param("limit")Integer limit);
}
