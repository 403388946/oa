package com.sys.controller;

import com.oa.utils.OAExceptionHandler;
import com.sys.model.FileInfo;
import com.sys.service.FileInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author YiMing on 2016/8/7.
 */
@Controller
@RequestMapping(value = "/sys")
public class FileInfoController {


    @Autowired
    private FileInfoService fileInfoService;

    @RequestMapping(value = "/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public HashMap<String, Object> upload(MultipartFile file) {
        HashMap<String, Object> result = new HashMap<>();
        result.put("status", "N");
        result.put("status", false);
        result.put("message", "上传失败");
        try {
            return fileInfoService.upload(file);
        } catch (Exception e) {
            new OAExceptionHandler(e);
        }
        return result;
    }

    /**
     * 批量文件
     * @author YiMing
     * @param id 下载文件
     * @return
     */
    @RequestMapping(value = "/down", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public void down(Long id,HttpServletResponse response,
                       HttpServletRequest request) {
        try {
            fileInfoService.down(id, response, request);
        } catch (Exception e) {
            new OAExceptionHandler(e);
        }
    }

    /**
     * 批量文件
     * @author YiMing
     * @param serviceId 业务主键
     * @param serviceType 业务类型
     * @return
     */
    @RequestMapping(value = "/findFiles", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<FileInfo> findFiles(Long serviceId, Integer serviceType) {
        try {
            return fileInfoService.findFiles(serviceId, serviceType);
        } catch (Exception e) {
            new OAExceptionHandler(e);
        }
        return new ArrayList<>(0);
    }

    /**
     * 绑定文件
     * @author YiMing
     * @param fileInfo 文件信息
     * @return
     */
    @RequestMapping(value = "/save", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public FileInfo save(@ModelAttribute("fileInfo")FileInfo fileInfo) {
        FileInfo saved = null;
        try {
            saved = fileInfoService.save(fileInfo);
        } catch (Exception e) {
            new OAExceptionHandler(e);
        }
        return saved;
    }

    /**
     * 绑定文件
     * @author YiMing
     * @param fileId 文件信息
     * @return
     */
    @RequestMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Integer save(String fileId) {
        try {
            return fileInfoService.delete(fileId);
        } catch (Exception e) {
            new OAExceptionHandler(e);
        }
        return 0;
    }

}
