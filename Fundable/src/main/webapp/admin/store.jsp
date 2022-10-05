<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link rel="stylesheet" href="css/admin-css.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css" >
input.ui-corner-all {
  width: 500px;
  height: 40px;
  font-size: 40px;
}

label {
	font-size: 14pt;
}

</style>

<!-- vue  -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$('#update').click(function(){ 
		
	})
	
	
} );
</script>

</head>
<body>

<div class="sidebar">
  <a href="user_list.do">유저 관리</a>
  <a href="funding_list.do">펀딩 상품 관리</a>
  <a class="active" href="store_list.do">스토어 상품 관리</a>
  <a href="comment.do">유저 댓글 관리</a>
  <a href="../main/main.do">메인 홈으로</a>  
</div>


<div class="content">
<h2 style="color: grey">스토어 상품 관리</h2>
<hr>
<p>

<!-- 검색 창 -->
<div class="word" style="display: flex">
  <span class="search_bar" style="display: flex">
	  <input type="search" class="form-control rounded" placeholder="상품 이름을 입력하세요" aria-label="Search" aria-describedby="search-addon" value="ss" ref="ss" v-model="ss" />
	  &nbsp;
	  <button type="button" class="w3-button w3-green" v-on:click="storeFind()">검색</button>
  </span>
</div>

<p></p>
  
<div class="container">
  <div class="row">
    <div class="col-12">
		<table class="table table-image">
		  <thead>
		    <tr>
		      <th scope="col">상품 번호</th>
		      <th scope="col">이미지</th>
		      <th scope="col">상품 이름</th>
		      <th scope="col">가격</th>
		      <th></th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr v-for="vo in store_list">
		      <td>{{vo.sg_no}}</td>
		      <td>
		      	<img :src="vo.img" class="img-fluid img-thumbnail" alt="Sheep" style="height: 120px; width: 120px">
		      </td>
		      <td>{{vo.title}}</td>
		      <td>{{vo.price}}</td>
		      <td>
			   	  <a :href="'store_update.do?sg_no='+vo.sg_no"><button class="w3-button w3-red">정보 수정</button></a>
			   	  <a onclick="return confirm('정말로 삭제하시겠습니까?')" :href="'store_delete.do?sg_no='+vo.sg_no"><button class="w3-button w3-red">삭제</button></a>
		   	  </td>
		    </tr>
		  </tbody>
		</table>   
	
	

	

  
  <!-- pagination -->
  <div style="height: 20px;"></div>
    <div class="row">
      <div class="text-center">
        <button class="w3-button w3-green" v-on:click="prev()">이전</button>
          {{curpage}} page / {{totalpage}} pages
        <button class="w3-button w3-green" v-on:click="next()">다음</button>
      </div>
    </div>
  	
	
</div>

<script>
	new Vue({
		el:'.content',
		data:{
			curpage : 1,
			totalpage : 0,
			ss : '',
			store_list : [],
			sg_no : '',
			title : ''
		},
		mounted:function(){
			// window.onload => main
			this.send(); // 첫 화면 띄우기
		},
		methods:{
			// 반복되면 함수화
			send:function(){
				axios.get('http://localhost:8080/web/admin/store_list.do',{
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
				this.send();
			},
			prev:function(){
				this.curpage=this.curpage>1?this.curpage-1:this.curpage;
				this.send();
			},
			next:function(){
				this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
				this.send();
			},
			
			storeUpdate:function(sg_no, title){
				this.sg_no = sg_no;
				this.title = title;
				$("#dialog").dialog({ 
					autoOpen: false,
					width: 600,
					height: 700,
					modal: true
				}).dialog("open");
			}
		}
	})
  </script>
</body>
</html>
  
  	
	
</div>

</body>
</html>
