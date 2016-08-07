package com.sys.controller;

import com.alibaba.fastjson.JSON;
import com.oa.utils.FileDownLoadUtil;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.joda.time.DateTime;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.UUID;

/**
 * @author YiMing on 2016/8/7.
 */
@Controller
@RequestMapping(value = "/sys")
public class UploadController {

    @Resource(name = "settings")
    private HashMap<String, Object> settings;


    @RequestMapping(value = "/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public String upload(@RequestParam MultipartFile file) {
        HashMap<String, String> result = new HashMap<>();
        result.put("status", "N");
        try {
            String rootPath = (String)settings.get("uploadPathOA");
            //String downLoadUrl = (String)settings.get("downLoadUrlOA");
            String uuid = UUID.randomUUID().toString();
            String date = DateTime.now().toString("yyyyMMdd");
            FileUtils.forceMkdir(new File(rootPath + date));
            String currentName = file.getOriginalFilename();
            String fileType = FilenameUtils.getExtension(currentName);
            String uploadedName = uuid + "." + fileType;
            String path = rootPath + date + "/" + uploadedName;
            //downLoadUrl = downLoadUrl + date + "/" + uploadedName;
            String downLoadPath = date + "/" + uploadedName;
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
            result.put("status", "Y");
            result.put("currentName", currentName);
            result.put("fileType", fileType);
            result.put("uploadedName", uploadedName);
            result.put("downLoadPath", downLoadPath);
            result.put("message", "上传成功");
        } catch (Exception e) {
            new RuntimeException();
            result.put("message", "上传失败");
        }
        return JSON.toJSONString(result);
    }

    @RequestMapping(value = "/down")
    public void down(@RequestParam String filePath, @RequestParam String fileName, HttpServletResponse response,
                       HttpServletRequest request) {
        try {
            String rootPath = (String)settings.get("uploadPathOA");
            filePath = rootPath + filePath;
            FileDownLoadUtil.exportFile(filePath, fileName, response, request);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
