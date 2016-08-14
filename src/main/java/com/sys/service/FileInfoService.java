package com.sys.service;

import com.sys.model.FileInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * 文件信息管理
 * @author YiMing on 2016/8/13.
 */
public interface FileInfoService {

    /**
     * 上传文件
     * @author YiMing
     * @param file
     * @return
     */
    HashMap<String, Object> upload(MultipartFile file) throws IOException;

    /**
     * 下载文件
     * @author YiMing
     * @param id
     * @return
     */
    void down(Long id, HttpServletResponse response,
              HttpServletRequest request);

    /**
     * 保存文件
     * @author YiMing
     * @param file 文件信息
     * @return
     */
    FileInfo save(FileInfo file);

    /**
     * 删除文件
     * @author YiMing
     * @param fileId 文件ID
     * @return
     */
    int delete(String fileId) throws IOException;

    /**
     * 查询文件
     * @author YiMing
     * @param id 主键ID
     * @return
     */
    FileInfo findOne(Long id);

    /**
     * 查询文件
     * @author YiMing
     * @param fileId 文件ID
     * @return
     */
    FileInfo findOne(String fileId);

    /**
     * 批量文件
     * @author YiMing
     * @param serviceId 业务主键
     * @param serviceType 业务类型
     * @return
     */
    List<FileInfo> findFiles(Long serviceId, Integer serviceType);
}
