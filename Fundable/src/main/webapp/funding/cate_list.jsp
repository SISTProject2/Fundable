<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.u-list:not(.u-repeater) .u-repeater, .u-blog:not(.u-repeater) .u-repeater, .u-products:not(.u-repeater) .u-repeater {
    flex-grow: 1;
    flex-shrink: 1;
    flex-basis: auto;
    width: 1373px;
}
@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}
@-o-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}
@keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}
.progress{height:20px;margin-bottom:20px;overflow:hidden;background-color:#f5f5f5;border-radius:4px;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);box-shadow:inset 0 1px 2px rgba(0,0,0,.1)}
.progress-bar{float:left;width:0%;height:100%;font-size:12px;line-height:20px;color:#fff;text-align:center;background-color:#f77272;-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);-webkit-transition:width .6s ease;-o-transition:width .6s ease;transition:width .6s ease}
.progress-bar-striped,.progress-striped .progress-bar{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;background-size:40px 40px}
.progress-bar.active,.progress.active .progress-bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}
.progress-bar-success{background-color:#5cb85c}
.progress-striped .progress-bar-success{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar-info{background-color:#5bc0de}
.progress-striped .progress-bar-info{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar-warning{background-color:#f0ad4e}
.progress-striped .progress-bar-warning{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar-danger{background-color:#d9534f}
.progress-striped .progress-bar-danger{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar{
	height: 10px;
}
.progress{
	height: 10px;
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body class="u-body u-xl-mode" data-lang="en">
    <section class="u-clearfix u-section-1" id="sec-36b6" style="margin-top: 70px;">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width u-list u-list-1">
          <div class="dropdown" style="width: 1530px; margin: 0px auto;">
           <!--  <p style=""><span style="color: red; margin-left: 10px;">{{count}}</span>개의 프로젝트가 있습니다</p> -->
			<input type=button v-on:click="myFunction()" class="dropbtn" value="정렬 ▼" style="cursor: pointer; float: right; " ref="drop">
			<div class="row" style="width: 1530px; float: right;">
			<div id="myDropdown" class="dropdown-content" style="width: 100px; float: right; margin-left: 1420px;" v-show="isShow ">
			  <span v-on:click="pop()" style="cursor: pointer">인기순</span>
  			  <span v-on:click="recent()" style="cursor: pointer">최신순</span>
  			  <span v-on:click="goal()" style="cursor: pointer">달성률순</span>
  			  <span v-on:click="end()" style="cursor: pointer">마감임박순</span>
		    </div>
		    </div>
		  </div>
		  <div style="height: 25px"></div>
          <div class="u-repeater u-repeater-1" style="margin-top: 0px; margin: 0px auto; grid-gap: 30px 20px;">
            <div class="u-container-style u-list-item u-repeater-item" v-for="vo in funding_data" style="width: 350px; height: auto;">
              <div class="u-container-layout u-similar-container u-container-layout-1" style="width: 350px; height: auto;">
                <img alt="" class="u-expanded-width u-image u-image-default u-image-1" :src="vo.img" style="object-fit: fill;">
                <div class="u-clearfix u-group-elements u-group-elements-1" style="width: 100%;">
                  <p class="" style="width: 100%;  margin-top: 0px; margin-bottom: 5px; font-size: 0.9rem;">&nbsp;{{vo.category}} | {{vo.id}}</p>
                </div>
                <h3 class="u-custom-font u-font-open-sans u-text u-text-4" style="height: 54px; width: 100%; font-size: 1.1rem;">{{vo.title}}</h3>
                <div style="height: 5px"></div>
                <div style="width: 100%" class="info">
                  <h3 class="u-custom-font u-font-open-sans u-text u-text-palette-2-base u-text-5" style="display: inline; margin: 0px;"><div class="rate" style="display:inline;" :data-no="vo.fg_no">{{vo.rate}}</div>% &nbsp;</h3>
                  <h3 class="u-custom-font u-font-open-sans u-text u-text-5" style="display: inline; margin: 0px; color: black; font-weight: 500; font-size: 1.0rem;" :key="vo.now_amount">{{vo.now_amount | comma}}원</h3>
                  <h3 class="u-custom-font u-font-open-sans u-text u-text-5" style="display: inline; margin: 0px; float: right; color: gray; font-size: 1.0rem;">{{vo.leftday}}일 남음</h3>
                </div>
                <div style="height: 10px;"></div>
                <div class="progress">
				  <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" :style="{'width': vo.rate + '%' }">
				  </div>
				</div>
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
			fc_no:${fc_no},
			isShow:false
		},
		mounted:function(){
			this.send();
		},
		methods:{
			send:function(){
				let _this=this;
				axios.get("http://localhost:8080/web/funding/cate_list.do",{
					params:{
						page:_this.curpage,
						ord:_this.ord,
						fc_no:_this.fc_no
					}
				}).then(function(result){
					console.log(result)
					_this.funding_data=result.data;
					_this.curpage=result.data[0].curpage;
					_this.totalpage=result.data[0].totalpage;
					_this.count=result.data[0].count;
					_this.ord=result.data[0].ord;
					console.log(result.data)
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
			goal:function(){
				this.ord=4;
				this.isShow=false;
				this.$refs.drop.value='달성률순 ▼';
				this.send();
			},
			end:function(){
				this.ord=5;
				this.isShow=false;
				this.$refs.drop.value='마감임박순 ▼';
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
			}
		},
		filters:{
    		comma (val) {
    		      return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ',')
    		}
    	}
	  })
    </script>

</body>
</html>