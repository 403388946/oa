package com.sys.service.impl;

import com.oa.utils.FileDownLoadUtil;
import com.sys.SysConstants;
import com.sys.mapper.FileInfoMapper;
import com.sys.model.FileInfo;
import com.sys.service.FileInfoService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * 文件信息业务
 * @author YiMing on 2016/8/14.
 */
@Service(value = "fileInfoService")
public class FileInfoServiceImpl implements FileInfoService {

    @Autowired
    private FileInfoMapper fileInfoMapper;

    @Resource(name = "settings")
    private HashMap<String, String> settings;

    @Override
    public HashMap<String, Object> upload(MultipartFile file) throws IOException {
        HashMap<String, Object> result = new HashMap<>();
        String rootPath = (String)settings.get("uploadPathOA");
        String uuid = UUID.randomUUID().toString();
        String date = DateTime.now().toString("yyyyMMdd");
        FileUtils.forceMkdir(new File(rootPath + date));
        String localName = file.getOriginalFilename();
        String fileType = FilenameUtils.getExtension(localName);
        String realName = uuid + "." + fileType;
        String path = rootPath + date + "/" + realName;
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
        result.put("status", true);
        result.put("localName", localName);
        result.put("fileId", uuid);
        result.put("fileType", fileType);
        result.put("fileSize", String.valueOf(file.getSize()));
        result.put("realName", realName);
        result.put("path", path);
        result.put("message", "上传成功");
        return result;
    }

    @Override
    public void down(Long id, HttpServletResponse response, HttpServletRequest request) {
        FileInfo file = this.findOne(id);
        FileDownLoadUtil.exportFile(file.getPath(), file.getLocalName(), response, request);
    }

    @Override
    public FileInfo save(FileInfo file) {
        fileInfoMapper.insert(file);
        return this.findOne(file.getId());
    }

    @Override
    public int delete(String fileId) throws IOException {
        FileInfo deleteFile = this.findOne(fileId);
        int result = fileInfoMapper.delete(fileId);
        boolean isDelete = Boolean.valueOf(settings.get(SysConstants.DELETE_FILE_OA_KEY));
        if(result > 0 && isDelete) {
            FileUtils.forceDeleteOnExit(new File(deleteFile.getPath()));
        }
        return result;
    }

    @Override
    public FileInfo findOne(Long id) {
        return fileInfoMapper.findOne(id);
    }

    @Override
    public FileInfo findOne(String fileId) {
        return fileInfoMapper.findOneByFileId(fileId);
    }

    @Override
    public List<FileInfo> findFiles(Long serviceId, Integer serviceType) {
        return fileInfoMapper.findFiles(serviceId, serviceType);
    }
}
