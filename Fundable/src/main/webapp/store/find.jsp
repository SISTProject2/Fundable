<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Basic 88</title>
<!-- css -->
<link rel="stylesheet" href="css/layout.css" type="text/css">
<link rel="stylesheet" type="text/css" href="../main/css/demo.css" />
<link rel="stylesheet" type="text/css" href="../main/css/multilevelnav.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<!-- vue  -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">



<style type="text/css">
.word {
	margin:30px 20px 30px 100px;
	font-size: 20pt;
	color: black;
}

.search_bar {
	width:400px; 
	height:35px; 
	font-size:10px; 
	margin:0px -20px 0px 630px;
}

.rounded {
	font-family: 'Nanum Gothic';
}

</style>


</head>
<body>
  <div class="wrapper row2">
  	<div id="container" class="clear">
  	
  	  <div id="homepage">
  	  <section id="services" class="clear">
  	  
	  <div class="word" style="display: flex">상품 검색  
		  <span class="search_bar" style="display: flex">
			  <input type="search" class="form-control rounded" placeholder="상품 이름을 입력하세요" aria-label="Search" aria-describedby="search-addon" value="ss" ref="ss" v-model="ss" />
			  &nbsp;&nbsp;&nbsp;
			  <button type="button" class="btn btn-outline-primary" v-on:click="storeFind()">search</button>
		  </span>
		</div>
	  <hr>

  
    
    
    
    
    <div style="height: 50px;"></div>
      <article class="one_third" v-for="vo in store_list">
          <a :href="'../store/detail_before.do?sg_no=' + vo.sg_no + '&sc_no=' + vo.sc_no">
            <img :src="vo.img" width="320" height="210" alt="">
            <figcaption>
	            <h2 style="font-style: regular; color: black; font-size: 12pt; font-weight: bold">{{vo.title }}</h2>
           		<div style="font-size: 8pt">{{vo.id }}</div>
           		<div style="color: black; font-size: 11.5pt">{{vo.price }}</div>
           		<img src="images/star.png" width="18px" height="18px"><span style="color: #FF8C00; font-size: 10pt;">{{vo.rate }}</span>
		        <span style="float: right">
		        <img src="images/person.png" width="15px" height="15px"><span style="color: grey; font-size: 5pt">{{vo.sponsor }}명 참여</span></span>
            </figcaption>
          </a>
      </article>
    
    </section>
    
    
    <div style="height: 20px;"></div>
    <div class="row">
      <div class="text-center">
        <button v-on:click="prev()">이전</button>
          {{curpage}} page / {{totalpage}} pages
        <button v-on:click="next()">다음</button>
      </div>
    </div>
    </div>
  </div>
 </div>
  <script>
	new Vue({
		el:'.row2',
		data:{
			curpage : 1,
			totalpage : 0,
			ss : '',
			store_list : []
		},
		mounted:function(){
			// window.onload => main
			this.send(); // 첫 화면 띄우기
		},
		methods:{
			// 반복되면 함수화
			send:function(){
				axios.get('http://localhost:8080/web/store/find.do',{
					params:{
						ss : this.ss,
						page : this.curpage
					}
				}).then(result=>{
					console.log(result)
					this.store_list = result.data;
					this.curpage = this.store_list[0].curpage;
					this.totalpage = this.store_list[0].totalpage;
				})
			},
			storeFind:function(){
				if(this.ss===""){
					alert("검색어를 입력하세요!!");
					this.$refs.ss.focus();
					return;
				}
				else if(this.ss.length < 2){
					alert("2자 이상 입력하세요!!");
					this.$refs.ss.value = "";
					this.$refs.ss.focus();
					return;
				}
				this.send();
			},
			prev:function(){
				this.curpage=this.curpage>1?this.curpage-1:this.curpage;
				this.send();
			},
			next:function(){
				this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
				this.send();
			}
		}
	})
  </script>
</body>
</html>