<%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>
<%!
	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
%>
<%
	//设置页面不缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	//内存中创建图像
	int width = 60, height = 20;
	BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
	//获取图形上下文
	Graphics g = image.getGraphics();
	//生成随即类
	Random random = new Random();
	//设置背景色
	g.setColor(getRandColor(200, 250));
	g.fillRect(0, 0, width, height);
	//设定字体
	g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
	//画边框
	g.setColor(getRandColor(160, 200));
	for (int i = 0; i < 155; i++) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(12);
		int yl = random.nextInt(12);
		g.drawLine(x, y, x + xl, y + yl);
	}
	//取随机产生的认证码（4位数字）
	String sRand = "";
	for (int i = 0; i < 4; i++) {
		String rand = String.valueOf(random.nextInt(10));
		sRand += rand;
		//将认证码显示到图像中
		g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
		g.drawString(rand, 13 * i + 6, 16);
	}
	// 将认证码存入SESSION
	session.setAttribute("validcode", sRand);
	//图像生效
	g.dispose();
	//输出图像到页面
	ImageIO.write(image, "JPEG", response.getOutputStream());
	response.flushBuffer();
	out.clear();  
    out = pageContext.pushBody();  
	
%>
