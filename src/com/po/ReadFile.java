package com.po;
import java.io.*;
public class ReadFile {
	String fileDir="c:/",fileName="";
	String listFile,readContent;
	public void setFileDir(String s){
		this.fileDir=s;
	}
	public String getFileDir(){
		return fileDir;
	}
	public void setFileName(String s){
		this.fileName=s;
	}
	public String getFileName(){
		return fileName;
	}
	public String getFileList(){
		File dir=new File(fileDir);
		File file_name[]=dir.listFiles();
		StringBuffer list=new StringBuffer();
		for(int i=0;i<file_name.length;i++){
			if((file_name[i]!=null)&&(file_name[i].isFile())){
				String temp=file_name[i].toString();
				int n=temp.lastIndexOf("\\");
				temp=temp.substring(n+1);
				list.append(" "+temp);
			}
		}
		listFile=new String(list);
		return listFile;
	}
	public String getReadContent(){
		try{
			File file=new File(this.fileDir,this.fileName);
			FileReader fileReader=new FileReader(file);
			BufferedReader reader=new BufferedReader(fileReader);
			StringBuffer stringbuffer=new StringBuffer();
			String s=null;
			while((s=reader.readLine())!=null){
				byte bb[]=s.getBytes();
				s=new String(bb);
				stringbuffer.append("\n"+s);
			}
			String temp=new String(stringbuffer);
			readContent="<textArea rows=8 cols=62>"+temp+"</textArea>";
		}
		catch(IOException e){
			readContent="<textArea rows=8 cols=62></textArea>";
		}
		return readContent;
	}
}
