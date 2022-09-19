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
</head>
<body>
<section>
    <div class="rt-container">
          <div class="col-rt-12">
             <nav>
                <span class='MultiLevelMenu depth-1'>
                    <ul class='menu'>
                        <li class='MultiItem'>
                            <span style="display: flex"><a class="MultiLink" href='../store/list.do'> 카테고리</a></span>
                            <div class='MultiLevelMenu depth-2'>
                                <ul class='menu'>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='../store/list.do'><img src="https://i.postimg.cc/5NV6ZJg3/all.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='../store/list_category.do?sc_no=1'><img src="https://i.postimg.cc/FFGMQggB/stationery.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='../store/list_category.do?sc_no=2'><img src="https://i.postimg.cc/htHF5Db4/food.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='../store/list_category.do?sc_no=3'><img src="https://i.postimg.cc/cCXy9fTP/book.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='../store/list_category.do?sc_no=4'><img src="https://i.postimg.cc/rszQTWMB/pet.png" height="54px" width="54px"></a>
                                    </li>
                                </ul>
                            </div>           
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='#'>펀딩 예정</a>
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='#'>펀딩</a>
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='../store/store_main.do'>스토어</a>                           
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='../store/best.do'>베스트</a>                           
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='../store/find.do'>상품 검색</a>                           
                        </li>				     
                    </ul>                   
                </span>               
            </nav>           
		</div>
    </div>
</section>
	</body>
</html>