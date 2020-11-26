package com.orange.project.controller;

import com.orange.project.response.BaseResponse;
import com.orange.project.response.StatusCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * describe:文件操作类
 * author:jpw
 * Date:2020-11-18
 * Time:15:33:48
 */
@RestController
@RequestMapping("file")
public class FileController {


    @Autowired
    private Environment env;

    /**
     * 获取文件内容
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getContext", method = RequestMethod.GET)
    public BaseResponse getContext(String fileName) {
        try {
            //TODO 修改 xx.md文件位置
            String path = env.getProperty("custom.markdown") + "\\" + fileName;

            InputStream is = new FileInputStream(path);
            BufferedReader in = new BufferedReader(new InputStreamReader(is));
            StringBuffer buffer = new StringBuffer();
            String line = "";
            while ((line = in.readLine()) != null) {
                buffer.append(line+"\n");
            }
            return new BaseResponse(buffer);
        } catch (Exception e) {
            return new BaseResponse(StatusCode.Fail, e.getMessage());
        }
    }


}
