package com.po;
import java.io.*;
public class WriteFile {
	private String filePath=null,fileName=null,fileContent=null;
	private boolean success;
	public void setFilePath(String s){
		this.filePath=s;
		try{
			File path=new File(this.filePath);
			path.mkdir();
		}
		catch(Exception e){}
	}
	public String getFilePath(){
		return filePath;
	}
	public void setFilName(String s){
		this.fileName=s;
	}
	public String getFileName(){
		return fileName;
	}
	public void setFileContent(String s){
		this.fileContent=s;
		byte content[]=fileContent.getBytes();
		try{
			File file=new File(this.filePath,this.fileName);
			FileOutputStream in=new FileOutputStream(file);
			in.write(content,0,content.length);
			in.close();
			success=true;
		}
		catch(Exception e){
			this.success=false;
		}
	}
	public boolean isSuccess(){
		return success;
	}
}
