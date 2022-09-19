<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/demo.css" />
<link rel="stylesheet" type="text/css" href="../css/multilevelnav.css" />
<style type="text/css">
.section {
    float: left;
    width: 100%;
    margin-top: -20px;
    margin-bottom: 0px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#store').click(function(){
		$('#nav_funding').hide();
	})
})
let i=0;
$(function(){
	$('#cateBtn').click(function(){
		if (i==0) {
			$('#cate').hide();
			i=1;
		} else {
			$('#cate').show();
			i=0;
		}
	})
})
</script>
</head>
<body>
<section class="section">
    <div class="rt-container" style="width: 100%;">
          <div class="col-rt-12">
             <nav>
                <span class='MultiLevelMenu depth-1' style="padding-left: 100px; padding-right: 30px; height: 60px;">
                    <ul class='menu' style="max-width: 100%;">
                        <li class='MultiItem'>
                            <span style="display: flex"><a class="MultiLink" style="font-size: 20px; cursor: pointer;" id="cateBtn"> 카테고리</a></span>
                            <!-- <div class='' id="cate" style="display:none;">
                                <ul class='menu' style="padding-left: 140px; margin-top: 0px; max-width: 100%;">
                                    <li class='MultiItem' style="float: left;">
                                        <a class="MultiLink" href='#'><img src="https://i.postimg.cc/5NV6ZJg3/all.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem' style="float: left;">
                                        <a class="MultiLink" href='#'><img src="https://i.postimg.cc/FFGMQggB/stationery.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem' style="float: left;">
                                        <a class="MultiLink" href='#'><img src="https://i.postimg.cc/htHF5Db4/food.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem' style="float: left;">
                                        <a class="MultiLink" href='#'><img src="https://i.postimg.cc/cCXy9fTP/book.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem' style="float: left;">
                                        <a class="MultiLink" href='#'><img src="https://i.postimg.cc/rszQTWMB/pet.png" height="54px" width="54px"></a>
                                    </li>
                                </ul>
                            </div> -->           
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='../funding/list.do' style="font-size: 20px; cursor: pointer;">펀딩 예정</a>
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='#' style="font-size: 20px; cursor: pointer;">펀딩</a>
                        </li>
                        <li class='MultiItem' id="store">
                            <a class="MultiLink" href='../store/store_main.do' style="font-size: 20px; cursor: pointer;">스토어</a>                           
                        </li>
                        <li style="display: flex; float: right">
					     <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search" width=30px>
						 <button type="submit" class="searchButton">
					        <i class="fa fa-search"></i>
					     </button>
						</li>					     
                    </ul>                   
                </span>
                <div class='' id="cate" style="display:none;">
                   <ul class='menu' style="padding-left: 140px; margin-top: 0px; max-width: 100%;">
                       <li class='MultiItem' style="float: left;">
                           <a class="MultiLink" href='#'><img src="https://i.postimg.cc/5NV6ZJg3/all.png" height="54px" width="54px"></a>
                       </li>
                       <li class='MultiItem' style="float: left;">
                           <a class="MultiLink" href='#'><img src="https://i.postimg.cc/FFGMQggB/stationery.png" height="54px" width="54px"></a>
                       </li>
                       <li class='MultiItem' style="float: left;">
                           <a class="MultiLink" href='#'><img src="https://i.postimg.cc/htHF5Db4/food.png" height="54px" width="54px"></a>
                       </li>
                       <li class='MultiItem' style="float: left;">
                           <a class="MultiLink" href='#'><img src="https://i.postimg.cc/cCXy9fTP/book.png" height="54px" width="54px"></a>
                       </li>
                       <li class='MultiItem' style="float: left;">
                           <a class="MultiLink" href='#'><img src="https://i.postimg.cc/rszQTWMB/pet.png" height="54px" width="54px"></a>
                       </li>
                   </ul>
                </div>                
            </nav>           
		</div>
    </div>
</section>
	</body>
</html>