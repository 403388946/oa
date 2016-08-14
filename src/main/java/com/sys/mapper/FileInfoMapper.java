package com.sys.mapper;

import com.sys.model.FileInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 文件信息Mapper
 * @author YiMing on 2016/8/13.
 */
public interface FileInfoMapper {

    /**
     * 保存文件
     * @author YiMing
     * @param file 文件信息
     * @return
     */
    int insert(FileInfo file);

    /**
     * 删除文件
     * @author YiMing
     * @param fileId 文件ID
     * @return
     */
    int delete(@Param("fileId")String fileId);


    /**
     * 查询文件
     * @author YiMing
     * @param id
     * @return
     */
    FileInfo findOne(@Param("id")Long id);
    FileInfo findOneByFileId(@Param("fileId")String fileId);

    /**
     * 批量文件
     * @author YiMing
     * @param serviceId 业务主键
     * @param serviceType 业务类型
     * @return
     */
    List<FileInfo> findFiles(@Param("serviceId")Long serviceId, @Param("serviceType")Integer serviceType);
}
