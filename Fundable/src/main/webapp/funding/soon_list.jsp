<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="../css/funding/nicepage.css" media="screen">
<link rel="stylesheet" href="../css/funding/list.css" media="screen">
<link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<style type="text/css">
.u-section-1 .u-repeater-1 {
    grid-template-columns: 25% 25% 25% 25%;
    min-height: 466px;
    grid-gap: 0px 0px;
}
 /* Dropdown Button */
.dropbtn {
  background-color: white;
  color: black;
  padding: 10px;
  font-size: 16px;
  border: none;
  cursor: pointer;
  border-radius: 13px;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
  background-color: white;
}

/* The search field */
#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

/* The search field when it gets focus/clicked on */
#myInput:focus {outline: 3px solid #ddd;}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  position: absolute;
  background-color: #f6f6f6;
  min-width: 100px;
  border: 1px solid #ddd;
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content span {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content span:hover {background-color: white}

.show {display:block;}
</style>
</head>
<body class="u-body u-xl-mode" data-lang="en">
    <section class="u-clearfix u-section-1" id="sec-36b6" style="margin-top: 70px;">
      <div class="u-clearfix u-sheet u-sheet-1" >
        <div class="u-expanded-width u-list u-list-1">
          <div class="dropdown" style="width: 1530px; margin: 0px auto;">
            <!-- <span style="margin-left: 350px;"><span style="color: red;">{{count}}</span>개의 프로젝트가 있습니다</span> -->
			<input type=button v-on:click="myFunction()" class="dropbtn" value="정렬 ▼" style="cursor: pointer; float: right; " ref="drop">
			<div class="row" style="width: 1530px; float: right;">
			<div id="myDropdown" class="dropdown-content" style="width: 100px; float: right; margin-left: 1420px;" v-show="isShow">
			  <span v-on:click="pop()" style="cursor: pointer">인기순</span>
  			  <span v-on:click="recent()" style="cursor: pointer">최신순</span>
			</div>
			</div>
		  </div>
		  <div style="height: 25px"></div>
          <div class="u-repeater u-repeater-1" style="margin-top: 0px; margin: 0px auto; grid-gap: 30px 20px;">
<!--           <div class="u-repeater u-repeater-1" style="margin-left: 250px; margin-right: 250px; margin-top: 0px;"> -->
            <div class="u-container-style u-list-item u-repeater-item" v-for="vo in funding_data" style="width: 350px; height: auto;">
              <div class="u-container-layout u-similar-container u-container-layout-1" style="width: 350px; height: auto;">
                <img alt="" class="u-expanded-width u-image u-image-default u-image-1" :src="vo.img" style="object-fit: fill;">
                <div class="u-clearfix u-group-elements u-group-elements-1" style="width: 100%;">
                  <p class="" style="width: 100%;  margin-top: 0px; margin-bottom: 5px; font-size: 0.9rem;">&nbsp;{{vo.category}} | {{vo.id}}</p>
                </div>
                <h3 class="u-custom-font u-font-open-sans u-text u-text-4" style="height: 54px; width: 100%; font-size: 1.1rem;">{{vo.title}}</h3>
                <h3 class="u-custom-font u-font-open-sans u-text u-text-5" style="font-weight: 700; font-size: 18px; color: #a7a7a7; width: 100%">{{vo.dbday}} 오픈 예정</h3>
                <div style="height: 3px"></div>
                <h3 class="u-custom-font u-font-open-sans u-text u-text-palette-2-base u-text-5" style="width: 100%; font-size: 1.0rem;">123​명 알림신청 중</h3>
                <c:if test="${sessionScope.id==null }"> 
                  <span v-on:click="bellOn2()" :data-no="vo.fg_no" class="u-border-1 u-btn u-button-style u-none u-text-black u-btn-2" style="width: 100%; padding: 4px; border: 1px solid black;" ><span class="u-file-icon u-icon u-text-black u-icon-1"><img src="../css/img/1827422.png" alt=""></span>&nbsp; <span style="font-weight: 700;"></span>알림신청
                  </span>
                </c:if>
                <c:if test="${sessionScope.id!=null }">
                  <span v-if="vo.bell==0" v-on:click="bellOn()" :data-no="vo.fg_no" class="u-border-1 u-btn u-button-style u-none u-text-black u-btn-2" style="width: 100%; padding: 4px; border: 1px solid black;" ><span class="u-file-icon u-icon u-text-black u-icon-1"><img src="../css/img/1827422.png" alt=""></span>&nbsp; <span style="font-weight: 700;"></span>알림신청
                  </span>
                  <span v-if="vo.bell==1" v-on:click="bellOff()" :data-no="vo.fg_no" class="u-border-1 u-btn u-button-style u-none u-text-black u-btn-2" style="width: 100%; padding: 4px; border: 1px solid black;"><span class="u-file-icon u-icon u-text-black u-icon-1"><img src="../css/img/4305482.png" alt=""></span>&nbsp; <span style="font-weight: 700;"></span>알림신청완료
                  </span>
                </c:if>
              </div>
            </div>
          </div>
          <div style="height: 50px"></div>
          <div style="text-align: center;">
            <button v-on:click="prev()">이전</button>
			  {{curpage}} page / {{totalpage}} pages
            <button v-on:click="next()">다음</button>
          </div>
        </div>
      </div>
    </section>
    <script>
	  new Vue({
		el:'.u-list-1',
		data:{
			curpage:1,
			totalpage:0,
			count:0,
			funding_data:[],
			funding_detail:{},
			fg_no:0,
			ord:1,
			isShow:false,
			bell:0
		},
		mounted:function(){
			this.send();
		},
		methods:{
			send:function(){
				let _this=this;
				axios.get("http://localhost:8080/web/funding/soon_list.do",{
					params:{
						page:_this.curpage,
						ord:_this.ord
					}
				}).then(function(result){
					_this.funding_data=result.data;
					console.log(result.data);
					_this.curpage=result.data[0].curpage;
					_this.totalpage=result.data[0].totalpage;
					_this.count=result.data[0].count;
					_this.ord=result.data[0].ord;
				})
			},
			prev:function(){
				this.curpage=this.curpage>1 ? this.curpage-1:this.curpage;
				this.send();
			},
			next:function(){
				this.curpage=this.curpage<this.totalpage ? this.curpage+1:this.curpage;
				this.send();
			},
			pop:function(){
				this.ord=2;
				this.isShow=false;
				this.$refs.drop.value='인기순 ▼';
				this.send();
			},
			recent:function(){
				this.ord=3;
				this.isShow=false;
				this.$refs.drop.value='최신순 ▼';
				this.send();
			},
			myFunction:function(){
				let i=0;
				if (i==0){
					this.isShow=true;
					i=1;
				} else {
					this.isShow=false;
					i=0;
				}
				console.log(i);
			},
			bellOff:function(){
				let _this=this;
				axios.get("http://localhost:8080/web/funding/bellOff.do",{
					params:{
						fg_no:event.target.getAttribute('data-no'),
    					user_no:'${user_no}'
					}
				}).then(function(result){
					location.href="../funding/soon_list.do";
					console.log(result.data)
				})
			},
			bellOn:function(){
				let _this=this;
				axios.get("http://localhost:8080/web/funding/bellOn.do",{
					params:{
						fg_no:event.target.getAttribute('data-no'),
    					user_no:'${user_no}'
					}
				}).then(function(result){
					location.href="../funding/soon_list.do";
					console.log(result.data)
				})
			},
			bellOn2:function(){
				let _this=this;
				location.href="../user/login.do"
			}
		}
	  })
    </script>

</body>
</html>