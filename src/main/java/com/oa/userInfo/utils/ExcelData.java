package com.oa.userInfo.utils;


import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;

/**
 * Created by Administrator on 2015/6/2.
 */
public class ExcelData {

    public  static void exportFile(Map<String, List<List<String>>> fileMap, String filePath, HttpServletResponse response,
                                   HttpServletRequest request, String fileName) {
        HSSFWorkbook workbook = new HSSFWorkbook();
        Set<String> sheetSet = fileMap.keySet();
        Object[] sheetName = sheetSet.toArray();
        HSSFSheet sheet=null;
        for (int k = 0; k < sheetName.length; k++) {
            sheet = workbook.createSheet();
            workbook.setSheetName(0, sheetName[k].toString());
            List<List<String>> fileData = fileMap.get(sheetName[k]);
            for (int i = 0; i < fileData.size(); i++) {
                HSSFRow row = sheet.createRow(i);
                sheet.setDefaultColumnWidth(18);
                List<String> fileBody = fileData.get(i);
                for (int j = 0; j < fileBody.size(); j++) {
                    HSSFCell cell = row.createCell(j);
                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                    HSSFRichTextString testString = new HSSFRichTextString(fileBody.get(j));
                    cell.setCellValue(testString);
                }
            }
        }

        try {
            String name = fileName + ".xls";
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;" + encodingFileName(name, request));
            ServletOutputStream fos = response.getOutputStream();
            workbook.write(fos);
            fos.flush();
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String encodingFileName(String filename, HttpServletRequest request) throws UnsupportedEncodingException {

        String userAgent = request.getHeader("User-Agent");
        if (StringUtils.isEmpty(userAgent)) {
            return "filename=" + URLEncoder.encode(filename, "UTF8");
        } else if (userAgent.indexOf("Trident") != -1) {
            return "filename=" + URLEncoder.encode(filename, "UTF8");
        } else if (userAgent.indexOf("MSIE") != -1) {
            return "filename=" + URLEncoder.encode(filename, "UTF8");
        } else if (userAgent.indexOf("Opera") != -1) {
            return "filename*=UTF-8''" + URLEncoder.encode(filename, "UTF8");
        } else {
            return "filename=\"" + new String(filename.getBytes("UTF-8"), "ISO8859-1") + "\"";
        }
    }
}
