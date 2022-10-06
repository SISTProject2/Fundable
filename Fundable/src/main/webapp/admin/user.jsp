<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

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

<!-- css -->
<link rel="stylesheet" href="css/admin-css.css" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- vue  -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(function() {
	$('#update').click(function(){ 
		
	})
	
	
} );
</script>


<body>

<div class="sidebar">
  <a class="active" href="user_list.do">유저 관리</a>
  <a href="funding_list.do">펀딩 상품 관리</a>
  <a href="store_list.do">스토어 상품 관리</a>
  <a href="comment.do">유저 댓글 관리</a>
  <a href="../main/main.do">메인 홈으로</a>
</div>


<div class="content">
<span style="display: flex">
	<h2 style="color: grey">유저 관리</h2>
</span>
<hr>
<p>


<!-- 검색 창 -->
<div class="word" style="display: flex">
  <span class="search_bar" style="display: flex">
	  <input type="search" class="form-control rounded" placeholder="유저 아이디를 입력하세요" aria-label="Search" aria-describedby="search-addon" value="ss" ref="ss" v-model="ss" />
	  &nbsp;&nbsp;
	  <button type="button" class="w3-button w3-green" v-on:click="userFind()">검색</button>
  </span>
</div>

<p></p>
  
  <table class="w3-table w3-bordered">
    <tr>
      <th>유저 번호</th>
      <th>아이디</th>
      <th>이름</th>
      <th>생년월일</th>
      <th>전화번호</th>
      <th>이메일</th>
      <th></th>

    </tr>
    <tr v-for="vo in user_list">
      <td>{{vo.user_no}}</td>
      <td>{{vo.id}}</td>
      <td>{{vo.name}}</td>
      <td>{{vo.bday}}</td>
      <td>{{vo.tel}}</td>
      <td>{{vo.email}}</td>
   	  <td>
	   	  <a onclick="return confirm('탈퇴시키겠습니까?')" :href="'user_delete.do?user_no='+vo.user_no"><button class="w3-button w3-red">강제 탈퇴</button></a>
   	  </td>
    </tr>
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
			user_list : [],
			id : ''
		},
		mounted:function(){
			// window.onload => main
			this.send(); // 첫 화면 띄우기
		},
		methods:{
			// 반복되면 함수화
			send:function(){
				axios.get('http://43.200.58.204/admin/user_list.do',{
					params:{
						ss : this.ss,
						page : this.curpage
					}
				}).then(result=>{
					console.log(result)
					this.user_list = result.data;
					this.curpage = this.user_list[0].curpage;
					this.totalpage = this.user_list[0].totalpage;
				})

			},
			userFind:function(){
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
			},
			
			userUpdate:function(id){
				this.id = id;
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