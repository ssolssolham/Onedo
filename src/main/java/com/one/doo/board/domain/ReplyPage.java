package com.one.doo.board.domain;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPage {

  private int replyCnt;
  private List<Reply> list;
}
