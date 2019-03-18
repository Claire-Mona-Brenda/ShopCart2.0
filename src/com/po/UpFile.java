package com.po;
import java.io.*;
import javax.servlet.http.*;
public class UpFile {
	private HttpServletRequest request;
	HttpSession session;
	private String upFileMessage="",showImage;
	public void setRequest(HttpServletRequest request){
		this.request=request;
	}
	public void setSession(HttpSession session){
		this.session=session;
	}
	public String getShowImage(){
		return showImage;
	}
	public String getUpFileMessage(){
		String fileName=null;
		try{
			String tempFileName=(String)session.getId();
			String webDir=request.getContextPath();
			webDir=webDir.substring(1);
			File file=new File("");
			String path=file.getAbsolutePath();
			int index=path.indexOf("bin");
			String tomcatDir=path.substring(0,index);
			File dir=new File(tomcatDir+"/webapps"+webDir+"/images");
			dir.mkdir();
			
			File f1=new File(dir,tempFileName);
			FileOutputStream o=new FileOutputStream(f1);
			InputStream in=request.getInputStream();
			byte b[]=new byte[10000];
			int n;
			while((n=in.read(b))!=-1){
				o.write(b,0,n);
			}
			o.close();
			in.close();
			
			RandomAccessFile randomRead=new RandomAccessFile(f1,"r");
			int second=1;
			String secondLine=null;
			while(second<=2){
				secondLine=randomRead.readLine();
				second++;
			}
			int position=secondLine.lastIndexOf("=");
			fileName=secondLine.substring(position+2,secondLine.length()-1);
			randomRead.seek(0);
			long forthEndPosition=0;
			int forth=1;
			while((n=randomRead.readByte())!=-1&&(forth<=4)){
				if(n=='\n'){
					forthEndPosition=randomRead.getFilePointer();
					forth++;
				}
			}
			byte cc[]=fileName.getBytes("ISO-8859-1");
			fileName=new String(cc);
			File f2=new File(dir,fileName);
			RandomAccessFile randomWrite=new RandomAccessFile(f2,"rw");
			randomRead.seek(randomRead.length());
			long endPosition=randomRead.getFilePointer();
			long mark=endPosition;
			int j=1;
			while((mark>0)&&(j<=6)){
				mark--;
				randomRead.seek(mark);
				n=randomRead.readByte();
				if(n=='\n'){
					endPosition=randomRead.getFilePointer();
					j++;
				}
			}
			randomRead.seek(forthEndPosition);
			long startPoint=randomRead.getFilePointer();
			while(startPoint<endPosition-1){
				n=randomRead.readByte();
				randomWrite.write(n);
				startPoint=randomRead.getFilePointer();
			}
			randomWrite.close();
			randomRead.close();
			f1.delete();
			upFileMessage=fileName+"上传成功";
			showImage=fileName;
			return upFileMessage;
		}
		catch(Exception ex){
			if(fileName!=null){
				upFileMessage=fileName+"上传失败";
				return upFileMessage;
			}
			else{
				upFileMessage="";
				return upFileMessage;
			}
		}
	}

}
