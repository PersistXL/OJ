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

    static int WIDTH = 400;
    static int HEIGHT = 400;

    static File logoFile = null;

    /**
     * 2      * 生成二维码，返回到页面上
     * 3      * @param response
     * 4
     */
//    @RequestMapping(value = "/getErWeiCode", method = {RequestMethod.POST, RequestMethod.GET})
//    @ResponseBody
//    public String getErWeiCode(HttpServletResponse response, HttpServletRequest request) {
//        String msg = "www.baidu.com";
//        String logoPath = "./img/logo.png";
//        ServletOutputStream stream = null;
//        try {
//            if (logoFile == null) {
//                logoFile = new File(request.getServletContext().getRealPath("./img/logo.png"));
//            }
//            QRCodeUtil.encode(msg, logoPath,logoPath,false);
//            stream = response.getOutputStream();
//            request.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
//            String contentString = request.getParameter("classCode");
//            BufferedImage img = createQRCode(logoFile, contentString, "班课码：" + contentString);
//            QRCodeWriter writer = new QRCodeWriter();
//            BitMatrix m = writer.encode(contentString, BarcodeFormat.QR_CODE, HEIGHT, WIDTH);
//            MatrixToImageWriter.writeToStream(m, "png", stream);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (stream != null) {
//                try {
//                    stream.flush();
//                    stream.close();
//                    return "";
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//
//            }
//        }
//        return "";
//    }

//	@RequestMapping(value = "/getCode", method = RequestMethod.GET)
//	public MyStreamingResponseBody createQrCode(HttpServletRequest request, HttpServletResponse response) {
//		if (logoFile == null) {
//			logoFile = new File(request.getServletContext().getRealPath("./img/logo.png"));
//		}
//		request.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
//		String contentString = request.getParameter("classCode");
//		BufferedImage img = createQRCode(logoFile, contentString, "班课码：" + contentString);
//		return new MyStreamingResponseBody(img);
//	}

//	public class MyStreamingResponseBody implements StreamingResponseBody {
//		BufferedImage img;
//		public MyStreamingResponseBody(BufferedImage img) {
//			this.img = img;
//		}
//		@Override
//		public void writeTo(OutputStream outputStream) throws IOException {
//			// HttpHeaders headers = new HttpHeaders();
//			try {
//
//				ImageIO.write(img, "png", outputStream);
//				outputStream.flush();
//				outputStream.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//	}

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
        // 二．生成带图标的二维码直接输出
//        try {
//            QRCodeUtil.showQrcode(QRCodeUtil.createQRCodeWithIcon(content, iconPath), response);
//        } catch (WriterException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }
}
