package com.sys.service.impl;

import com.oa.utils.Page;
import com.shiro.mapper.UserMapper;
import com.sys.SysConstants;
import com.sys.mapper.NoticeMapper;
import com.sys.model.Notice;
import com.sys.service.NoticeService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author YiMing on 2016/8/21.
 */
@Service(value = "noticeService")
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public Notice save(Notice notice) {
        if(notice.getId() == null) {
            noticeMapper.insert(notice);
        } else {
            noticeMapper.update(notice);
        }
        return noticeMapper.findOne(notice.getId());
    }

    @Override
    public int saves(Notice notice) {
        if(StringUtils.equals(SysConstants.NOTICE_RECIVE_ALL, notice.getReceiveUserName())) {
            List<Long> receiveIds = userMapper.findAll();
            if(CollectionUtils.isNotEmpty(receiveIds)) {
                return noticeMapper.inserts(notice, receiveIds);
            }
        }
        return 0;
    }

    @Override
    public int delete(Long id) {
        return noticeMapper.delete(id);
    }

    @Override
    public Notice updateViewType(Long id) {
        Notice view = noticeMapper.findOne(id);
        view.setViewType(1);
        noticeMapper.update(view);
        return noticeMapper.findOne(id);
    }

    @Override
    public Notice findOne(Long id) {
        return noticeMapper.findOne(id);
    }

    @Override
    public List<Notice> findNotices(Page param) {
        return noticeMapper.findNotices(param);
    }

    @Override
    public List<Notice> myNotices(String loginName, Integer viewType, Integer limit) {
        return noticeMapper.myNotices(loginName, viewType, limit);
    }
}
