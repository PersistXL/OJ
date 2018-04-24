package com.thoughtWorks.web;


import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.thoughtWorks.util.QrCodeUtil.QRCodeUtil;
import com.thoughtWorks.util.QrCodeUtil.QRCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;
import com.google.zxing.WriterException;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/sqcc")
@Controller
public class SimpleQrCodeController {

    @RequestMapping(value = "/getErWeiCode", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public void encoderQRCoder(HttpServletResponse response, HttpServletRequest request) {
        /**
         * 二维码测试。
         */
        String iconPath = request.getServletContext().getRealPath("img/logo.png");
        String content = request.getParameter("classCode");
        //一． 生成二维码图片直接输出

        try {
            QRCodeUtil.showQrcode(QRCodeUtil.createQRCode(content), response);
        } catch (WriterException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
