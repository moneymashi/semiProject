package com.cto.auction.controller.upload;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class UploadController {
    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

    // xml에 설정된 리소스 참조
    // bean의 id가 uploadPath인 태그를 참조
    @Resource(name="tempPath")
    private String tempPath;



    // 업로드 흐름 : 업로드 버튼클릭 => 임시디렉토리에 업로드=> 지정된 디렉토리에 저장 => 파일정보가 file에 저장
    @RequestMapping(value="/upload/uploadForm", method=RequestMethod.GET)
    public void upload(){
        // upload/uploadForm.jsp(업로드 페이지)로 포워딩
/*    	return "upload/uploadForm";*/
    }

    @RequestMapping(value="/upload/uploadForm", method=RequestMethod.POST)
    public ModelAndView upload(MultipartFile file, ModelAndView mav) throws IOException{

        logger.info("파일이름 :"+file.getOriginalFilename());
        logger.info("파일크기 : "+file.getSize());
        logger.info("컨텐트 타입 : "+file.getContentType());

        String savedName = file.getOriginalFilename();

        File target = new File(tempPath, savedName);

        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
        FileCopyUtils.copy(file.getBytes(), target);

        mav.setViewName("upload/uploadResult");
        mav.addObject("savedName", savedName);

        return mav; // uploadResult.jsp(결과화면)로 포워딩
    }
}
