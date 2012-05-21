package com.shanbay;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

public class SplitFile {
	
	public static String currentUnit = "Unit_0";
	public static String currentLession = "Lesson_0";

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		InputStream in = SplitFile.class.getResourceAsStream("/nce4_lessons.txt");
		
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(in, "UTF-8"));
		
		StringBuffer sb = new StringBuffer();
		String str = "";
		
		
			while ((str = bufferedReader.readLine()) != null) {
				if (str.length() >= 1 && str.substring(1).trim().matches("^Unit \\d+$")) {
					
					flush2File(sb.toString());
					//
					sb = new StringBuffer();
					currentUnit = str.substring(1).trim().replace(' ', '_');
					str = bufferedReader.readLine();
				}
				
				if (str.length() >= 1 && str.substring(1).trim().matches("^Lesson \\d+$")) {
					if (sb.toString().length() != 0) {
						flush2File(sb.toString());
						//
						sb = new StringBuffer();
					}
					
					currentLession = str.substring(1).trim().replace(' ', '_');
				}
				
				sb.append(str).append('\n');
			}
		
			flush2File(sb.toString());
	}
	
	public static void flush2File (String sbString) throws IOException {
		File file = new File("D:\\test001\\" + currentUnit, currentLession + ".txt");
		if (! file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}
		
		if (!file.exists()) {
			file.createNewFile();
		}
		
		PrintWriter fileWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
		
		fileWriter.write(sbString);
		fileWriter.flush();
	}

}
