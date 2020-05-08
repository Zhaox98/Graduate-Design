package com.dao.bll;

import java.awt.Color;
import java.awt.Font;
import java.util.List;

import org.aspectj.weaver.patterns.ArgsAnnotationPointcut;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.IntervalMarker;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.ui.Layer;
import org.jfree.ui.LengthAdjustmentType;
import org.jfree.ui.TextAnchor;

import com.dao.dal.DALBase;

public class SimpleStatistics {

	public DefaultCategoryDataset createLineChartDataset(String SQL,String series) {
		DefaultCategoryDataset linedataset = new DefaultCategoryDataset();
		List list = DALBase.runNativeSQL(SQL);
		for (Object object : list) {
			Object[] item = (Object[])object;
			double number = new Double(item[1].toString());
			System.out.println("成绩 = " + number);
			linedataset.addValue(number,series,item[0].toString());
		}
		return linedataset;
	}

	public JFreeChart createLineChart(String xdes,String ydes,String chartdes,String SQL) {
		// 定义图标对象
		JFreeChart chart = ChartFactory.createLineChart(chartdes,// 报表题目，字符串类型
				xdes, 	// 横轴
				ydes, 	// 纵轴
				this.createLineChartDataset(SQL,chartdes), 	// 获得数据集
				PlotOrientation.VERTICAL, 	// 图标方向垂直ֱ
				true,	// 显示图例
				false, 	// 不用生成工具
				false 	// 不用生成URL地址ַ
		);
		
		// 整个大的框架属于chart 可以设置chart的背景颜色
		// 生成图形
		CategoryPlot plot = chart.getCategoryPlot();
		// 图像属性
		plot.setBackgroundPaint(Color.white);
		plot.setDomainGridlinesVisible(true); // 设置背景网格线是否可见
		plot.setDomainGridlinePaint(Color.BLACK); // 设置背景网格线颜色
		plot.setRangeGridlinePaint(Color.GRAY);
		plot.setNoDataMessage("没有数据");// 没有数据时显示的文字说明
		// 数据轴属性
		NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
		rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
		rangeAxis.setAutoRangeIncludesZero(true); // 自动生成
		rangeAxis.setUpperMargin(0.20);
		rangeAxis.setLabelAngle(Math.PI / 2.0);
		rangeAxis.setAutoRange(false);
		// 数据渲染部分 主要是对折线做操作
		LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();
		renderer.setBaseItemLabelsVisible(true);
		renderer.setSeriesPaint(0, Color.black); // 设置折线的颜色
		renderer.setBaseShapesFilled(true);
		renderer.setBaseItemLabelsVisible(true);
		renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setBaseItemLabelFont(new Font("Dialog", 1, 14)); // 设置提示折点数据形状״
		plot.setRenderer(renderer);
		// 区域渲染部分
		double lowpress = 4.5;
		double uperpress = 8; 	// 设定正常血糖值的范围
		IntervalMarker inter = new IntervalMarker(lowpress, uperpress);
		inter.setLabelOffsetType(LengthAdjustmentType.EXPAND); 	// 范围调整——扩张
		inter.setPaint(Color.LIGHT_GRAY);	// 域顏色
		inter.setLabelFont(new Font("SansSerif", 41, 14));
		inter.setLabelPaint(Color.RED);
		inter.setLabel(chartdes); 	// 设定区域说明文字
		plot.addRangeMarker(inter, Layer.BACKGROUND); 	// 添加mark到图形
		return chart;		// BACKGROUND使得数据折线在区域的前端
	}
	
	public JFreeChart  buildPieChart(String SQL,String chartdes){
		DefaultPieDataset dpd = new DefaultPieDataset();
    	List list=DALBase.runNativeSQL(SQL);
		for (Object object : list) {
			Object[]item=(Object[])object;
			int number=new Integer(item[1].toString());
		    dpd.setValue(item[0].toString(),number);
		}
		JFreeChart chart = ChartFactory.createPieChart3D(chartdes, dpd, true, true,true);
        Font font = new Font("宋体" , Font.PLAIN , 20);
        chart.getTitle().setFont(font);
        chart.getLegend().setItemFont(font);
        PiePlot piePlot = (PiePlot)chart.getPlot();
        piePlot.setLabelFont(font);
        return chart;
    }
	
	public JFreeChart buildPieChart(String SQL,String ...args) {
  	    DefaultPieDataset dpd = new DefaultPieDataset();
        List<Object[]> list = (List<Object[]>)DALBase.runNativeSQL(SQL);
        String piedes = "未命名统计图";
        if(list.size()>0){
        	Object[] item = list.get(0);
        	int i = 0;
        	for (Object object : item) {
        		double temnum = new Double(object.toString());
        		if(i<args.length-1)
        			dpd.setValue(args[i], temnum);
        		i++;
        	}
        	if(item.length<args.length){
        		piedes = args[args.length-1];
        	}
        }
		JFreeChart chart = ChartFactory.createPieChart3D(piedes, dpd, true, true,true);
		Font font = new Font("宋体" , Font.PLAIN , 20);
		chart.getTitle().setFont(font);
		chart.getLegend().setItemFont(font);
		PiePlot piePlot = (PiePlot)chart.getPlot();
		piePlot.setLabelFont(font);
		return chart;
	}
	
	// 构建柱状图 
	public JFreeChart buildColumnChart(String xaxis ,String yaxis,String chartdes,String dsSQL) {
		CategoryDataset dataset = getCloumnDatasource(dsSQL);
	 	JFreeChart chart = ChartFactory.createBarChart("hi", xaxis, yaxis, dataset, PlotOrientation.VERTICAL, true, true, false); 
	   	chart.setTitle(new TextTitle(chartdes, new Font("宋体", Font.BOLD + Font.ITALIC,20)));
	   	CategoryPlot plot = (CategoryPlot)chart.getPlot();	// 获得图标中间部分，即plot
	 	CategoryAxis categoryAxis = plot.getDomainAxis();	// 获得横坐标
	 	categoryAxis.setLabelFont(new Font("微软雅黑", Font.BOLD, 12));// 设置横坐标字体
	 	return chart;
	}
	 
	private CategoryDataset getCloumnDatasource(String SQL) {
		DefaultCategoryDataset dataset=new DefaultCategoryDataset();
		List list=DALBase.runNativeSQL(SQL);
		for (Object object : list) {
			Object[]item=(Object[])object;
			// 第一个 为x轴   第二个位y轴
			double jine=new Double(item[1].toString());
			dataset.setValue(jine,item[0].toString(),item[0].toString());
		}
		return dataset;
	}

}
