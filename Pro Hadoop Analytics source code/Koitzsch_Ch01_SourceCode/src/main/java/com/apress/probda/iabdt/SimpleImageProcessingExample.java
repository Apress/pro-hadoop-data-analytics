/** This code example is equivalent to the Listing in Chapter 1,
 * 
 * 
 * 
 * 
 */
package com.apress.probda.iabdt;

import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;

import javax.media.jai.JAI;
import javax.imageio.ImageIO;
import javax.media.jai.PlanarImage;
import javax.media.jai.widget.ScrollingImagePanel;
import javax.swing.JFrame;

public class SimpleImageProcessingExample {
	

	/**
	 * Hello IABT world!
	 * The worlds most powerful image processing toolkit (for its size)?
	 * @param args --- specify an image pathname to display here, this is useful for displaying
	 * intermediate or final results from Hadoop based image as big data systems, including HIPI.
	 */
	
	    public static void main(String[] args)
	    {
	        JAI jai = new JAI();
	        RenderedImage image = null;
			try {
				System.out.println("Input image: " + args[0]);
				image = ImageIO.read(new File(args[0]));
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (image == null){ System.out.println("Sorry, the image was null"); return; }
			JFrame f = new JFrame("Image Processing Demo for Pro Hadoop Data Analytics");
	        ScrollingImagePanel panel = new ScrollingImagePanel(image, 512, 512);
	        f.add(panel);
	        f.setSize(512, 512);
	        f.setVisible(true);
	        System.out.println("Hello IABT World, version of JAI is: " + JAI.getBuildVersion());
	    }

}
