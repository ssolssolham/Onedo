package com.one.doo.board.domain;

import lombok.Data;

@Data
public class BoardAttach {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  
  private Long bno;
  
}
