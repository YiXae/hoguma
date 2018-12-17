package com.fnf.Common;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class Thumbnail {

	public Thumbnail(){
	}
	
	public static void createImage(String loadFile, String saveFile, int zoom) throws IOException{
		File save = new File(saveFile);
		FileInputStream fis = new FileInputStream(loadFile);
		BufferedImage im = ImageIO.read(fis);
		
		if (zoom<=0) zoom = 1;
		
		int width = 135;//im.getWidth() / zoom;
		int height = 90;//im.getHeight() / zoom;
		
		BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = thumb.createGraphics();
		
		g2.drawImage(im, 0, 0, width, height, null);
		ImageIO.write(thumb, "jpg", save);
		
	}
	
	public static void main(String args[]){
		String loadFile = "c://badpark.jpg";
		String saveFile = "d://res.jpg";
		int zoom = 5;
		
		try {
			Thumbnail.createImage(loadFile, saveFile, zoom);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
