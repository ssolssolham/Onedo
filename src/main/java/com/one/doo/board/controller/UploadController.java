package com.one.doo.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.doo.file.domain.AttachFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/file/")
public class UploadController {
	
	
	//년/월/일 폴더의 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//썸네일 이미지 만들기
	private boolean checkImageType(File file) {
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	
	
	

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder = "C:/KOSTA187/upload";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("================================");
			log.info("Upload File Name = " + multipartFile.getOriginalFilename());
			log.info("Upload File Size = " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			log.info("================================");
		}
	}
	
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload Ajax");
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "C:/KOSTA187/upload";
		
		//폴더 만들기
		File uploadPath = new File(uploadFolder, getFolder());
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}// 날짜형식으로 만들기
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("================================");
			log.info("Upload File Name = " + multipartFile.getOriginalFilename());
			log.info("Upload File Size = " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename(); 
					
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("파일명만 추출 : " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				//이미지 타입 파일인지 확인
				if(checkImageType(saveFile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	
	@PostMapping(value="/uploadAjaxActionJson", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFile>> uploadAjax(MultipartFile[] uploadFile){
		List<AttachFile> list = new ArrayList<>();
		String uploadFolder = "C:/KOSTA187/upload";
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
			
		for (MultipartFile multipartFile : uploadFile) {
			AttachFile attachFile = new AttachFile();
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE가 파일 경로를 가질때
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			attachFile.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				attachFile.setUuid(uuid.toString());
				attachFile.setUploadPath(uploadFolderPath);
				
				//이미지 형식 확인
				if(checkImageType(saveFile)) {
					attachFile.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				
				list.add(attachFile);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return new ResponseEntity<>(list, HttpStatus.OK);
			}	
		}
		return null;
	}
	
}