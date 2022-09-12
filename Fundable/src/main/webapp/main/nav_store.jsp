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
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/multilevelnav.css" />
</head>
<body>
<section>
    <div class="rt-container">
          <div class="col-rt-12">
             <nav>
                <span class='MultiLevelMenu depth-1'>
                    <ul class='menu'>
                        <li class='MultiItem'>
                            <span style="display: flex"><img src="images/hamburger.png" width=20px height=20px><a class="MultiLink" href='#'> 카테고리</a></span>
                            <div class='MultiLevelMenu depth-2'>
                                <ul class='menu'>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='#'><img src="images/all.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='#'><img src="images/stationery.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='#'><img src="images/food.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='#'><img src="images/book.png" height="54px" width="54px"></a>
                                    </li>
                                    <li class='MultiItem'>
                                        <a class="MultiLink" href='#'><img src="images/pet.png" height="54px" width="54px"></a>
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
                            <a class="MultiLink" href='#'>스토어</a>                           
                        </li>
                        <li class='MultiItem'>
                            <a class="MultiLink" href='#'>베스트</a>                           
                        </li>
                        <li style="display: flex; float: right">
					     <input class="form-control mr-sm-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search" width=30px>
						 <button type="submit" class="searchButton">
					        <i class="fa fa-search"></i>
					     </button>
						</li>					     
                    </ul>                   
                </span>               
            </nav>           
		</div>
    </div>
</section>
	</body>
</html>