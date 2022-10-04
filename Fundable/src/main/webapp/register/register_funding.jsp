<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">

  <title>register_funding</title>
  <link rel="stylesheet" href="css/nicepage.css" media="screen">
  <link rel="stylesheet" href="css/register_funding.css" media="screen">
  <script class="u-script" type="text/javascript" src="css/jquery.js"></script>
  <script class="u-script" type="text/javascript" src="css/nicepage.js" defer=""></script>

  <link id="u-theme-google-font" rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">


  <script type="application/ld+json">{
    "@context": "http://schema.org",
    "@type": "Organization",
    "name": "register"
  }</script>
  <meta name="theme-color" content="#478ac9">
  <meta property="og:title" content="register_funding">
  <meta property="og:description" content="">
  <meta property="og:type" content="website">
</head>
<body class="u-body u-xl-mode" data-lang="en">
<jsp:include page="../main/header.jsp"/>
<section class="u-clearfix u-image u-section-1" id="carousel_9e4f" data-image-width="1280" data-image-height="816">
  <div class="u-clearfix u-sheet u-sheet-1">
    <div class="u-clearfix u-layout-wrap u-white u-layout-wrap-1">
      <div class="u-layout">
        <div class="u-layout-row">
          <div class="u-size-30 u-size-60-md">
            <div class="u-layout-col">
              <div class="u-size-40">
                <div class="u-layout-row">
                  <div class="u-container-style u-layout-cell u-left-cell u-size-60 u-layout-cell-1">
                    <div class="u-border-7 u-border-grey-75 u-border-no-bottom u-border-no-right u-container-layout u-valign-top u-container-layout-1">
                      <img id="imgThumbnail" class="u-border-2 u-border-grey-75 u-image u-image-1"
                           src="images/16d5459c-22ee-2bd7-c196-fc2a6b51c417.png"
                           data-image-width="250" data-image-height="250" alt="">
                    </div>
                  </div>
                </div>
              </div>
              <div class="u-size-20">
                <div class="u-layout-row">
                  <div class="u-align-left u-container-style u-layout-cell u-left-cell u-size-60 u-layout-cell-2">
                    <div class="u-border-7 u-border-grey-75 u-border-no-right u-container-layout u-container-layout-2">
                      <h1 class="u-text u-text-1">
                        <span style="font-weight: 700;">프로젝트의 성공 조건 &amp; 수수료 안내</span>
                        <br>
                        <br>프로젝트 모금액이 목표금액의 100% 이상인&nbsp;<br>경우에만 프로젝트가 성공하게 됩니다.<br>
                        <br>프로젝트가 성공한 경우, 크라우디는 모금액에서 수수료를 제외한 금액을 정산해드립니다.<br>
                        <br>
                        <span class="u-text-custom-color-3">* 수수료 (vat 별도) 크라우디 수수료 10% + 결제 수수료 3%</span>
                        <br>
                        <br>
                        <span style="font-weight: 700;">스토어 등록 안내</span>
                        <span style="font-weight: 700;">&nbsp;&amp; 수수료 안내</span>
                        <br>
                        <br>프로젝트 도중에도 스토어 등록이 가능합니다.<br>
                        <br>
                        <span class="u-text-custom-color-3">* 수수료 (vat 별도) 크라우디 수수료 3% + 결제 수수료 1%</span>
                        <br>
                        <br>
                      </h1>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="u-size-30 u-size-60-md">
            <div class="u-layout-col">
              <div class="u-size-60">
                <div class="u-layout-row">
                  <div class="u-container-style u-layout-cell u-right-cell u-shape-rectangle u-size-60 u-layout-cell-3">
                    <div class="u-border-7 u-border-grey-75 u-container-layout u-container-layout-3">
                      <div class="u-align-left u-form u-form-1">
                        <form action="../register/register.do" method="post" id="form"
                              source="email"><!-- hidden inputs for siteId and pageId -->
                          <div class="u-form-group u-form-name">
                            <label for="name-cade" class="u-label u-label-1">제목</label>
                            <input type="text" placeholder="제목 입력" id="name-cade"
                                   name="title"
                                   class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-1"
                                   required="">
                          </div>
                          <div class="u-form-group u-form-group-2">
                            <label for="img" class="u-label u-label-2">대표 이미지</label>
                            <input type="text" placeholder="이미지 주소 입력" id="img"
                                   name="img"
                                   class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-2"
                                   required="required">
                          </div><!-- always visible -->
                          <div class="u-form-email u-form-group">
                            <label for="email-cade" class="u-label u-label-3">가격</label>
                            <input type="text" id="email-cade" name="price"
                                   class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-3"
                                   required="" placeholder="가격 입력">
                          </div>
                          <div class="u-form-group u-form-group-4">
                            <label for="text-bb8f" class="u-label u-label-4">목표금액</label>
                            <input type="text" placeholder="숫자만 입력" id="text-bb8f"
                                   name="goal_amount"
                                   class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-4"
                                   required="required">
                          </div>
                          <div class="u-form-date u-form-group u-form-group-5">
                            <label for="date-a116" class="u-label u-label-5">오픈날짜</label>
                            <input type="date" placeholder="YY/MM/DD" id="date-a116"
                                   name="open_date"
                                   class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-5"
                                   required="">
                          </div>
                          <div class="u-form-date u-form-group u-form-group-6">
                            <label for="date-d3f8" class="u-label u-label-6">마감날짜</label>
                            <input type="date" placeholder="YY/MM/DD" id="date-d3f8"
                                   name="close_date"
                                   class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-6"
                                   required="">
                          </div>
                          <div class="u-form-group u-form-message">
                            <label for="message-cade" class="u-label u-label-7">내용</label>
                            <textarea placeholder="내용입력" rows="10" cols="50"
                                      id="message-cade" name="content"
                                      class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white"
                                      required=""></textarea>
                          </div>
                          <div class="u-form-group u-form-group-8">
                            <label for="text-4419" class="u-label u-label-8">서브 이미지</label>
                            <input type="text" placeholder="이미지 주소 ^" id="text-4419"
                                   name="sub_img"
                                   class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-8"
                                   required="required">
                          </div>
                          <div class="u-form-group u-form-select u-form-group-9">
                            <label for="select-b004" class="u-label u-label-9">카테고리
                              선택</label>
                            <div class="u-form-select-wrapper">
                              <select id="select-b004" name="fc_no"
                                      class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white"
                                      required="required">
                                <option value="1">1. 문구</option>
                                <option value="2">2. 푸드</option>
                                <option value="3">3. 출판</option>
                                <option value="4">4. 반려동물</option>
                              </select>
                              <svg xmlns="http://www.w3.org/2000/svg" width="14"
                                   height="12" version="1" class="u-caret">
                                <path fill="currentColor" d="M4 8L0 4h8z"></path>
                              </svg>
                            </div>
                          </div>
                          <div class="u-align-right u-form-group u-form-submit">
                            <input id="submit" type="submit"
                                   value="펀딩 등록하기">
                          </div>

                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<script>
  $(document).ready(function () {
    $(document).on('change', '#img', function () {
      let val = this.value;
      if (val != null && val != "") {
        $("#imgThumbnail").attr("src", val);

      } else {
        $("#imgThumbnail").src = "images/16d5459c-22ee-2bd7-c196-fc2a6b51c417.png";
      }
    });
    $(document).on('click', '#submit', function () {
      $("#form").submit();
    });
  });
</script>


<jsp:include page="../main/footer.jsp"/>

</body>
</html>