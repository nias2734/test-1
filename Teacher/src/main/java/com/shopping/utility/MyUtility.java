package com.shopping.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopping.controller.SuperController;
import com.shopping.sport.SportController;
import com.shopping.transport.VehicleController;

public class MyUtility {
	public static void deleteOldImageFile(String webPath, MultipartRequest mr) {		
		// 상품 수정시 과거에 업로드했던 이미지를 웹 서버에서 삭제합니다.
		String[] deleteImages = 
			{
					mr.getParameter("deleteImage01"),
					mr.getParameter("deleteImage02"),
					mr.getParameter("deleteImage03")
			};
		
		for(String delFile : deleteImages) {
			if(delFile != null) {
				String deleteFile = webPath + "/" + delFile ;
				File target = new File(deleteFile) ;
				if(target.delete()) {
					System.out.println(deleteFile + " file delete success"); 
				}
			}
		}
	}
	
	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String uploadPath) {
		// 이미지 업로드에 필요한 멀티 파트 객체를 생성하여 반환 합니다.
		MultipartRequest mr = null ;
		int maxPostSize = 10 * 1024 *1024 ;
		String ENCODING = "UTF-8" ;		
		try {
			mr = new MultipartRequest(
					request, 
					uploadPath, 
					maxPostSize,
					ENCODING,
					new DefaultFileRenamePolicy()) ;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return mr ;
	}	
	
	public static Map<String, SuperController> getTodolistMap(String filename) {
		Map<String, SuperController> map = new HashMap<String, SuperController>();
		
		Properties prop = getPropertiesData(filename);
		
		Enumeration<Object> keys =  prop.keys() ;
		
		while(keys.hasMoreElements()) {
			String command = keys.nextElement().toString() ;
			String className = prop.getProperty(command);
			System.out.println(command + "/" + className);
			
			try {
				Class<?> handleClass = Class.forName(className) ;
				SuperController instance = (SuperController)handleClass.newInstance() ;
				
				map.put(command, instance) ;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}	
	
	public static Map<String, VehicleController> getTransportationMap(String webFullPathName) {
		// 운송 수단 텍스트 파일을 이용하여 각각 동적으로 객체를 생성합니다.
		// 이 항목들을 Map 구조에 담아서 반환합니다. 
		Map<String, VehicleController> map = new HashMap<String, VehicleController>();
		
		Properties prop = getPropertiesData(webFullPathName);
		
		Enumeration<Object> keys =  prop.keys() ;
		
		while(keys.hasMoreElements()) {
			String command = keys.nextElement().toString() ;
			String className = prop.getProperty(command);
			System.out.println(command + "/" + className);
			
			try {
				Class<?> handleClass = Class.forName(className) ;
				VehicleController instance = (VehicleController)handleClass.newInstance() ;
				
				map.put(command, instance) ;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}
	
	public static Map<String, SportController> getSportMap(String webFullPathName) {
		Map<String, SportController> map = new HashMap<String, SportController>();
		
		Properties prop = getPropertiesData(webFullPathName);
		
		Enumeration<Object> keys =  prop.keys() ;
		
		while(keys.hasMoreElements()) {
			String command = keys.nextElement().toString() ;
			String className = prop.getProperty(command);
			System.out.println(command + "/" + className);
			
			try {
				Class<?> handleClass = Class.forName(className) ;
				SportController instance = (SportController)handleClass.newInstance() ;
				
				map.put(command, instance) ;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}	

	private static Properties getPropertiesData(String webFullPathName) {
		// 스트림을 이용하여 프로퍼티 목록을 반환해 줍니다.
		FileInputStream fis = null ;
		Properties prop = null ;
		
		try {
			fis = new FileInputStream(webFullPathName);
			
			prop = new Properties() ;
			prop.load(fis); 
			
		} catch (Exception e) { 
			e.printStackTrace();
			
		} finally {
			try {
				if(fis != null) {fis.close();}		
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		System.out.println("prop.toString()");
		System.out.println(prop.toString());
		
		return prop;
	}

	public static Map<String, String> getSettingMap(String webSettingName) {
		// webSettingName 파일을 이용하여 자바의 Map 형식으로 반환해 줍니다.
		Map<String, String> map = new HashMap<String, String>();
		Properties prop = null ;
		prop = getPropertiesData(webSettingName) ; //Properties형태로 변환.
		
		Enumeration<Object> keys = prop.keys() ;
		while(keys.hasMoreElements()) {
			String key = keys.nextElement().toString() ;
			String value = prop.getProperty(key) ;
			
			//map.put(key, value) ;
			
			try { // 한글 깨짐 문제 해결
				map.put(key, new String(value.getBytes("ISO-8859-1"), "UTF-8")) ;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}


}
