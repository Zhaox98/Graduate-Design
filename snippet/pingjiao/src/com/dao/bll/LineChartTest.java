package com.dao.bll;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.io.IOException;

import javax.swing.JPanel;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.IntervalMarker;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.Layer;
import org.jfree.ui.LengthAdjustmentType;
import org.jfree.ui.TextAnchor;

public class LineChartTest extends ApplicationFrame {

	public LineChartTest(String title) {
		 super(title);
	     this.setContentPane(createPanel()); 
	}
	
	public  JPanel createPanel() {
	     JFreeChart chart = createLineChart();
	     return new ChartPanel(chart);  // 将chart对象放入Panel面板中去，ChartPanel类已继承Jpanel
	}

	public DefaultCategoryDataset createDataset() {
		DefaultCategoryDataset linedataset = new DefaultCategoryDataset();
		
		// 曲线名称
		String series = "血糖值"; // series指的就是报表里的那条数据线
		// 因此对数据线的相关设置就需要联系到serise
		// 比如说setSeriesPaint 设置数据线的颜色
		// 横轴名称(列名称)
		String[] time = new String[15];
		String[] timeValue = { "6-1日", "6-2日", "6-3日", "6-4日", "6-5日", "6-6日",
				"6-7日", "6-8日", "6-9日", "6-10日", "6-11日", "6-12日", "6-13日", "6-14日", "6-15日" };
		for (int i = 0; i < 15; i++) {
			time[i] = timeValue[i];
		}

		// 随机添加数据值ֵ

		for (int i = 0; i < 15; i++) {
			java.util.Random r = new java.util.Random();
			linedataset.addValue(i + i * 9.34 + r.nextLong() % 100, //值
					series, 	// 哪条数据线
					time[i]); 	// 对应的横轴
		}
		return linedataset;
	}

	// 生成图标对象JFreeChart
	/*
	 * 
	 * 整个大的框架属于JFreeChart
	 * 
	 * 坐标轴里的属于 Plot 其常用子类有：CategoryPlot, MultiplePiePlot, PiePlot , XYPlot
	 * 
	 * 
	 * 
	 * **
	 */

	public JFreeChart createLineChart() {
		// 定义图标对象
		JFreeChart chart = ChartFactory.createLineChart(null,// 报表题目，字符串类型
				"采集时间", 	// 横轴
				"血糖值ֵ", 	// 纵轴
				this.createDataset(), 		// 获得数据集
				PlotOrientation.VERTICAL, 	// 图标方向垂直ֱ
				true, 	// 显示图例
				false, 	//不用生成工具
				false 	// 不用生成URL地址ַ
		);
		// 整个大的框架属于chart 可以设置chart的背景颜色
		// 生成图形
		CategoryPlot plot = chart.getCategoryPlot();
		// 图像属性部分
		plot.setBackgroundPaint(Color.white);
		plot.setDomainGridlinesVisible(true); 		// 设置背景网格线是否可见
		plot.setDomainGridlinePaint(Color.BLACK); 	// 设置背景网格线颜色
		plot.setRangeGridlinePaint(Color.GRAY);
		plot.setNoDataMessage("没有数据");				// 没有数据时显示的文字说明
		// 数据轴属性部分
		NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
		rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
		rangeAxis.setAutoRangeIncludesZero(true); 	// 自动生成
		rangeAxis.setUpperMargin(0.20);
		rangeAxis.setLabelAngle(Math.PI / 2.0);
		rangeAxis.setAutoRange(false);
		// 数据渲染部分 主要对折线做操作
		LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();
		renderer.setBaseItemLabelsVisible(true);
		renderer.setSeriesPaint(0, Color.black); 	// 设置折线的颜色
		renderer.setBaseShapesFilled(true);
		renderer.setBaseItemLabelsVisible(true);
		renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setBaseItemLabelFont(new Font("Dialog", 1, 14)); // 设置提示折点数据形状
		plot.setRenderer(renderer);
		// 区域渲染部分
		double lowpress = 4.5;
		double uperpress = 8; 	// 设定正常血糖值的范围
		IntervalMarker inter = new IntervalMarker(lowpress, uperpress);
		inter.setLabelOffsetType(LengthAdjustmentType.EXPAND); 	// 范围调整——扩张
		inter.setPaint(Color.LIGHT_GRAY);	// 域顏色
		inter.setLabelFont(new Font("SansSerif", 41, 14));
		inter.setLabelPaint(Color.RED);
		inter.setLabel("正常血糖值范围"); 	// 设定区域说明文字
		plot.addRangeMarker(inter, Layer.BACKGROUND); 	// 添加mark到图形
		return chart;	// BACKGROUND使得数据折线在区域的前端
	}
	
    public static void main(String[] args) {
    	LineChartTest  chart=new LineChartTest("企业销售图");
    	chart.pack();
    	chart.setVisible(true);
    }
	
}
