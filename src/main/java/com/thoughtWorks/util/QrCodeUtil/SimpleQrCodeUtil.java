package com.thoughtWorks.util.QrCodeUtil;


import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;


public class SimpleQrCodeUtil {

	static int WIDTH = 400;
	static int HEIGHT = 400;

	static File logoFile = null;

	public static BufferedImage createQrCode(HttpServletRequest request, HttpServletResponse response) {
		if (logoFile == null) {
			logoFile = new File(request.getServletContext().getRealPath("./img/QRlogo.png"));
		}
		request.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true);
		String contentString = request.getParameter("classCode");
		BufferedImage img = createQRCode(logoFile, contentString, "班课码：" + contentString);
		return img;
	}



	public static BufferedImage createQRCode(File logoFile, String content, String text) {
		try {
			// 生成二维码bufferedImage图片
			MultiFormatWriter multiFormatWriter = null;
			BitMatrix bm = null;
			BufferedImage image = null;
			Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
			// 设置QR二维码的纠错级别（H为最高级别）具体级别信息
			hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
			// 设置编码方式
			hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
			hints.put(EncodeHintType.MARGIN, 1);
			try {
				multiFormatWriter = new MultiFormatWriter();
				// 参数顺序分别为：编码内容，编码类型，生成图片宽度，生成图片高度，设置参数
				bm = multiFormatWriter.encode(content, BarcodeFormat.QR_CODE, WIDTH, HEIGHT, hints);
				image = MatrixToImageWriter.toBufferedImage(bm);
			} catch (WriterException e) {
				e.printStackTrace();
			}
			BufferedImage bim = image;

			// 给二维码图片添加Logo并保存到指定位置，返回base64编码的图片数据字符串
			return createLogoQRCode(bim, logoFile, text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static BufferedImage createLogoQRCode(BufferedImage bim, File logoPic, String text) {
		try {
			/**
			 * 读取二维码图片，并构建绘图对象
			 */
			BufferedImage image = bim;

			// 如果logo图片存在，则加入到二维码图片中
			if (logoPic != null && logoPic.exists()) {
				// 新建BufferedImage先画二维码再画logo最后替换原始image；

				BufferedImage result = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
				Graphics2D g = result.createGraphics();

				g.drawImage(image, 0, 0, WIDTH, HEIGHT, null);
				/**
				 * 读取Logo图片
				 */
				BufferedImage logo = ImageIO.read(logoPic);

				/**
				 * 设置logo的大小,本人设置为二维码图片的23%
				 */
				int tempw = (int) (WIDTH * 2.3 / 10);
				int temph = (int) (HEIGHT * 2.3 / 10);
				int widthLogo = WIDTH > tempw ? tempw : WIDTH, heightLogo = HEIGHT > temph ? temph : HEIGHT;

				/**
				 * logo放在中心
				 */
				int x = (WIDTH - widthLogo) / 2;
				int y = (HEIGHT - heightLogo) / 2;

				// 开始绘制图片

				g.drawImage(logo, x, y, widthLogo, heightLogo, null);
//				g.setColor(Color.BLUE);
				g.setStroke(new BasicStroke(2));
//				g.drawRoundRect(x, y, widthLogo, heightLogo, 15, 15);
				g.dispose();
				result.flush();
				image = result;
			}

			// 把商品名称添加上去，商品名称不要太长，这里最多支持两行。太长就会自动截取
			if (text != null && !text.equals("")) {
				// 新的图片，把带logo的二维码下面加上文字
				BufferedImage outImage = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_4BYTE_ABGR);
				Graphics2D outg = outImage.createGraphics();
				// 画二维码到新的面板
				outg.drawImage(image, 0, 0, image.getWidth(), image.getHeight(), null);
				// 画文字到新的面板
				outg.setColor(Color.BLUE);
				outg.setFont(new Font("宋体", Font.BOLD, 22)); // 字体、字型、字号
				int strWidth = outg.getFontMetrics().stringWidth(text);

				outg.drawString(text, (WIDTH - strWidth) / 2, HEIGHT - 5); // 画文字

				outg.dispose();
				outImage.flush();
				image = outImage;
			}
			image.flush();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			baos.flush();
			ImageIO.write(image, "png", baos);

			// 获取base64编码的二维码图片字符串
			// String imageBase64QRCode =
			// Base64.encodeBase64String(baos.toByteArray());
			baos.close();
			return image;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
