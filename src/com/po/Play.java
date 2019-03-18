package com.po;
import java.io.*;
class FileName implements FilenameFilter{
	public boolean accept(File dire,String name){
		boolean boo=false;
		if(name.endsWith(".jpg")||name.endsWith(".JPG"))
			boo=true;
		return boo;
	}
}
public class Play {
	int imageNumber=0,max;
	String pictureName[],playImage;
	public Play(){
		File f=new File(".");
		String path=f.getAbsolutePath();
		path=(String)path.subSequence(0,path.indexOf("bin")-1);
		File dire=new File(path+"/webapps/ch7/playImage");
		pictureName=dire.list(new FileName());
		max=pictureName.length;
	}
	public void setImageNumber(int n){
		if(n<0)
			n=max+2;
		if(n==max)
			n=0;
		imageNumber=n;
	}
	public int getImageNumber(){
		return imageNumber;
	}
	public String getPlayImage(){
		playImage=new String("<img src=playImage/"+pictureName[imageNumber]+" "+"width=260 height=200></img>");
		return playImage;
	}
}
