<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">관리자 페이지</li>
        <!-- Optionally, you can add icons to the links -->
        <!-- 
        <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>
         -->
         
        <li>
          <a href="/admin/"><i class="fa fa-dashboard"></i> <span>홈</span>
            <span class="pull-right-container">
              </span>
          </a>
        </li>         
        <!-- 공지관리 -->
        <li>
          <a href="/admin/notice/"><i class="fa fa-edit"></i> <span>공지관리</span>
            <span class="pull-right-container">
              </span>
          </a>
        </li>
        
        <!-- 문의관리 -->
        <li>
          <a href="/admin/qna/"><i class="fa fa-edit"></i> <span>문의관리</span>
            <span class="pull-right-container">
              </span>
          </a>
        </li>
        
        <!--  -->
        <li>
          <a href="/admin/member/"><i class="fa fa-book"></i> <span>회원관리</span>
            <span class="pull-right-container">
              </span>
          </a>
        </li>
        
        <li>
          <a href="/admin/stats/"><i class="fa fa-pie-chart"></i> <span>사용자 통계 조회</span>
            <span class="pull-right-container">
              </span>
          </a>
        </li>
        
        <li>
          <a href="/admin/loanProduct/"><i class="fa fa-laptop"></i> <span>대출 상품 관리</span>
            <span class="pull-right-container">
              </span>
          </a>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>
