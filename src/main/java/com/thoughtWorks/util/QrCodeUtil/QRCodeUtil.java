package com.thoughtWorks.util.QrCodeUtil; /**
 * 二维码生成类（可生成二维码和条形码）
 */
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Binarizer;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import javax.servlet.http.HttpServletResponse;

public class QRCodeUtil {

    // 这几项可以由其他调用的类设置，因此是public static的
    public static int BARCODE_WIDTH = 500;
    public static int QRCODE_WIDTH = 200;
    public static String FORMAT = "jpg";// 生成的图片格式
    public static int BLACK = 0x000000;// 编码的颜色
    public static int WHITE = 0xFFFFFF;// 空白的颜色

    // 二维码中间的图像配置。注意，由于二维码的容错率有限，因此中间遮挡的面积不要太大，否则可能解析不出来。
    private static int ICON_WIDTH = (int)(QRCODE_WIDTH / 6);
    private static int HALF_ICON_WIDTH = ICON_WIDTH / 10;
    private static int FRAME_WIDTH = 2;// Icon四周的边框宽度

    // 二维码读码器和写码器
    private static final MultiFormatWriter WRITER = new MultiFormatWriter();
    private static final MultiFormatReader READER = new MultiFormatReader();

    /**
     * 将String编码成二维码的图片后，使用字节数组表示，便于传输。
     *
     * @param content
     * @return
     * @throws WriterException
     * @throws IOException
     */
    public static byte[] createQRCodeToBytes(String content)
            throws WriterException, IOException {
        BufferedImage image = createQRCode(content);
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(image, FORMAT, os);
        return os.toByteArray();
    }

    /**
     * 把一个String编码成二维码的BufferedImage.
     *
     * @param content
     * @return
     * @throws WriterException
     */
    public static final BufferedImage createQRCode(String content)
            throws WriterException {
        // 长和宽一样，所以只需要定义一个SIZE即可
        BitMatrix matrix = WRITER.encode(
                content, BarcodeFormat.QR_CODE, QRCODE_WIDTH, QRCODE_WIDTH);
        return toBufferedImage(matrix);
    }

    /**
     * 编码字符串为二维码，并在该二维码中央插入指定的图标。
     * @param content
     * @param iconPath
     * @return
     * @throws WriterException
     */
    public static final BufferedImage createQRCodeWithIcon(
            String content, String iconPath) throws WriterException {
        BitMatrix matrix = WRITER.encode(
                content, BarcodeFormat.QR_CODE, QRCODE_WIDTH, QRCODE_WIDTH);
        // 读取Icon图像
        BufferedImage scaleImage = null;
        try {
            scaleImage = scaleImage(iconPath, ICON_WIDTH, ICON_WIDTH, true);
        } catch (IOException e) {
            e.printStackTrace();
        }
        int[][] iconPixels = new int[ICON_WIDTH][ICON_WIDTH];
        for (int i = 0; i < scaleImage.getWidth(); i++) {
            for (int j = 0; j < scaleImage.getHeight(); j++) {
                iconPixels[i][j] = scaleImage.getRGB(i, j);
            }
        }

        // 二维码的宽和高
        int halfW = matrix.getWidth() / 2;
        int halfH = matrix.getHeight() / 2;

        // 计算图标的边界：
        int minX = halfW - HALF_ICON_WIDTH;//左
        int maxX = halfW + HALF_ICON_WIDTH;//右
        int minY = halfH - HALF_ICON_WIDTH;//上
        int maxY = halfH + HALF_ICON_WIDTH;//下

        int[] pixels = new int[QRCODE_WIDTH * QRCODE_WIDTH];

        // 修改二维码的字节信息，替换掉一部分为图标的内容。
        for (int y = 0; y < matrix.getHeight(); y++) {
            for (int x = 0; x < matrix.getWidth(); x++) {
                // 如果点在图标的位置，用图标的内容替换掉二维码的内容
                if (x > minX && x < maxX && y > minY && y < maxY) {
                    int indexX = x - halfW + HALF_ICON_WIDTH;
                    int indexY = y - halfH + HALF_ICON_WIDTH;
                    pixels[y * QRCODE_WIDTH + x] = iconPixels[indexX][indexY];
                }
                // 在图片四周形成边框
                else if ((x > minX - FRAME_WIDTH && x < minX + FRAME_WIDTH
                        && y > minY - FRAME_WIDTH && y < maxY + FRAME_WIDTH)
                        || (x > maxX - FRAME_WIDTH && x < maxX + FRAME_WIDTH
                        && y > minY - FRAME_WIDTH && y < maxY + FRAME_WIDTH)
                        || (x > minX - FRAME_WIDTH && x < maxX + FRAME_WIDTH
                        && y > minY - FRAME_WIDTH && y < minY + FRAME_WIDTH)
                        || (x > minX - FRAME_WIDTH && x < maxX + FRAME_WIDTH
                        && y > maxY - FRAME_WIDTH && y < maxY + FRAME_WIDTH)) {
                    pixels[y * QRCODE_WIDTH + x] = WHITE;
                }
                else {
                    // 这里是其他不属于图标的内容。即为二维码没有被图标遮盖的内容，用矩阵的值来显示颜色。
                    pixels[y * QRCODE_WIDTH + x] = matrix.get(x, y) ? BLACK : WHITE;
                }
            }
        }

        // 用修改后的字节数组创建新的BufferedImage.
        BufferedImage image = new BufferedImage(
                QRCODE_WIDTH, QRCODE_WIDTH, BufferedImage.TYPE_INT_RGB);
        image.getRaster().setDataElements(0, 0, QRCODE_WIDTH, QRCODE_WIDTH, pixels);

        return image;
    }

    /**
     * 从一个二维码图片的字节信息解码出二维码中的内容。
     *
     * @param data
     * @return
     * @throws ReaderException
     * @throws IOException
     */
    public static String parseQRFromBytes(byte[] data)
            throws ReaderException, IOException {
        ByteArrayInputStream is = new ByteArrayInputStream(data);
        BufferedImage image = ImageIO.read(is);
        return parseImage(image);
    }

    /**
     * 从一个图片文件中解码出二维码中的内容。
     *
     * @param file
     * @return 解析后的内容。
     * @throws IOException
     * @throws ReaderException
     */
    public static final String parseImage(File file)
            throws IOException, ReaderException {
        BufferedImage image = ImageIO.read(file);
        return parseImage(image);
    }

    /**
     * 将字符串编码成一维码（条形码）。
     * @param content
     * @return
     * @throws WriterException
     * @throws IOException
     */
    public static BufferedImage createBarCode(String content)
            throws WriterException, IOException {
        MultiFormatWriter writer = new MultiFormatWriter();
        // 一维码的宽>高。这里我设置为 宽:高=2:1
        BitMatrix matrix = writer.encode(content,
                BarcodeFormat.EAN_13, BARCODE_WIDTH * 3, BARCODE_WIDTH);
        return toBufferedImage(matrix);
    }

    /**
     * 从图片中解析出一维码或者二维码的内容。如果解析失败，则抛出NotFoundException。
     * @param image
     * @return
     * @throws NotFoundException
     */
    public static final String parseImage(BufferedImage image)
            throws NotFoundException {
        LuminanceSource source = new BufferedImageLuminanceSource(image);
        Binarizer binarizer = new HybridBinarizer(source);
        BinaryBitmap bitmap = new BinaryBitmap(binarizer);
        Result result = READER.decode(bitmap);
        // 这里丢掉了Result中其他一些数据
        return result.getText();
    }

    /**
     * 将BufferedImage对象输出到指定的文件中。
     *
     * @param image
     * @param destFile
     * @throws IOException
     */
    public static final void writeToFile(BufferedImage image, File destFile)
            throws IOException {
        ImageIO.write(image, FORMAT, destFile);
    }

    /**
     * 将BufferedImage对象直接response
     * @param image
     * @param response
     * @throws IOException
     */
    public static final void showQrcode(BufferedImage image, HttpServletResponse response) throws IOException
    {
        ImageIO.write(image, FORMAT, response.getOutputStream());
    }

    /**
     * 将一个BitMatrix对象转换成BufferedImage对象
     *
     * @param matrix
     * @return
     */
    private static BufferedImage toBufferedImage(BitMatrix matrix) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(
                width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
            }
        }
        return image;
    }

    /**
     * 把传入的原始图像按高度和宽度进行缩放，生成符合要求的图标。
     *
     * @param srcImageFile 源文件地址
     * @param height 目标高度
     * @param width 目标宽度
     * @param hasFiller 比例不对时是否需要补白：true为补白; false为不补白;
     * @throws IOException
     */
    private static BufferedImage scaleImage(String srcImageFile, int height,
                                            int width, boolean hasFiller) throws IOException {
        double ratio = 0.0; // 缩放比例
        File file = new File(srcImageFile);
        BufferedImage srcImage = ImageIO.read(file);
        Image destImage = srcImage.getScaledInstance(
                width, height, BufferedImage.SCALE_SMOOTH);
        // 计算比例
        if ((srcImage.getHeight() > height) || (srcImage.getWidth() > width)) {
            if (srcImage.getHeight() > srcImage.getWidth()) {
                ratio = (new Integer(height)).doubleValue() / srcImage.getHeight();
            } else {
                ratio = (new Integer(width)).doubleValue() / srcImage.getWidth();
            }
            AffineTransformOp op = new AffineTransformOp(
                    AffineTransform.getScaleInstance(ratio, ratio), null);
            destImage = op.filter(srcImage, null);
        }
        if (hasFiller) {// 补白
            BufferedImage image = new BufferedImage(
                    width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D graphic = image.createGraphics();
            graphic.setColor(Color.white);
            graphic.fillRect(0, 0, width, height);
            if (width == destImage.getWidth(null)) {
                graphic.drawImage(destImage, 0, (height - destImage.getHeight(null)) / 2,
                        destImage.getWidth(null), destImage.getHeight(null), Color.white, null);
            } else {
                graphic.drawImage(destImage, (width - destImage.getWidth(null)) / 2, 0,
                        destImage.getWidth(null), destImage.getHeight(null), Color.white, null);
            }
            graphic.dispose();
            destImage = image;
        }
        return (BufferedImage) destImage;
    }
}