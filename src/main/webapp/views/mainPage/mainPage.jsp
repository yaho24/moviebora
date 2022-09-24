<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- CSS 필요 -->
</head>
<body>
	<div>
		<section>
			<ul>
				<li class="title" id="tab1" onclick="location.href='mainPage.yo'">
					<p> 전체 영화 목록 </p>
					<div>
						<!-- 전체 영화 -->
						<c:if test="${not empty TotalMoviePageList}">
							<c:forEach var="TMPL" items="${TotalMoviePageList}">
								<li>
									<a> <!-- 이미지 누르면 영화 상세페이지로 이동 -->
										<img src="../../mb_image/${TMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${TMPL.movieGenre}</p>
											<p>${TMPL.movieName}</p>
											<p>${TMPL.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum=${startPage - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button> 
								</c:if>
								<c:if test="${pageNum > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum=${currentPage - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<span id="page${i}" class="page_num" onclick="location.href='mainPage.yo?pageNum=${i}'">${i}</span>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage < totalPage}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum=${currentPage + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage < totalPage}">
									<button class=last onclick="location.href='mainPage.yo?pageNum=${endPage + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				<li class="title" id="tab2" onclick="location.href='mainPage.yo'">
					<p> 장르1 영화 목록 </p>
					<div>
						<c:if test="${not empty GenreTotalMoviePageList1}">
							<c:forEach var="GTMPL1" items="${GenreTotalMoviePageList1}">
								<li>
									<a>
										<img src="../../mb_image/${TMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${GTMPL1.movieGenre}</p>
											<p>${GTMPL1.movieName}</p>
											<p>${GTMPL1.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage1 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum1=${startPage1 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button> 
								</c:if>
								<c:if test="${pageNum1 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum1=${startPage1 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i0" begin="${startPage1}" end="${endPage1}">
								<span id="page${i1}" class="page_num" onclick="location.href='mainPage.yo?pageNum1=${i1}'">${i1}</span>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage1 < totalPage1}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum1=${startPage1 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage1 < totalPage1}">
									<button class="last" onclick="location.href='mainPage.yo?pageNum1=${startPage1 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				<li class="title" id="tab3" onclick="location.href='mainPage.yo'">
					<p> 장르2 영화 목록 </p>
					<div>
						<c:if test="${not empty GenreTotalMoviePageList2}">
							<c:forEach var="GTMPL2" items="${GenreTotalMoviePageList2}">
								<li>
									<a>
										<img src="../../mb_image/${TMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${GTMPL2.movieGenre}</p>
											<p>${GTMPL2.movieName}</p>
											<p>${GTMPL2.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage2 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum2=${startPage2 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button> 
								</c:if>
								<c:if test="${pageNum2 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum2=${currentPage2 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i2" begin="${startPage2}" end="${endPage2}">
								<span id="page${i2}" class="page_num" onclick="location.href='mainPage.yo?pageNum2=${i2}'">${i2}</span>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage2 < totalPage2}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum2=${currentPage2 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage2 < totalPage2}">
									<button class="last" onclick="location.href='mainPage.yo?pageNum2=${endPage2 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				<li class="title" id="tab2" onclick="location.href='mainPage.yo'">
					<p> 장르3 영화 목록 </p>
					<div>
						<c:if test="${not empty GenreTotalMoviePageList3}">
							<c:forEach var="GTMPL3" items="${GenreTotalMoviePageList3}">
								<li>
									<a>
										<img src="../../mb_image/${TMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${GTMPL3.movieGenre}</p>
											<p>${GTMPL3.movieName}</p>
											<p>${GTMPL3.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage3 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum3=${startPage3 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button> 
								</c:if>
								<c:if test="${pageNum3 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum3=${startPage3 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i3" begin="${startPage3}" end="${endPage3}">
								<span id="page${i3}" class="page_num" onclick="location.href='mainPage.yo?pageNum3=${i3}'">${i3}</span>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage3 < totalPage3}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum3=${startPage3 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage3 < totalPage3}">
									<button class="last" onclick="location.href='mainPage.yo?pageNum3=${startPage3 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				<li class="title" id="tab3" onclick="location.href='mainPage.yo'">
					<p> 장르4 영화 목록 </p>
					<div>
						<c:if test="${not empty GenreTotalMoviePageList4}">
							<c:forEach var="GTMPL4" items="${GenreTotalMoviePageList4}">
								<li>
									<a>
										<img src="../../mb_image/${TMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${GTMPL4.movieGenre}</p>
											<p>${GTMPL4.movieName}</p>
											<p>${GTMPL4.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage4 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum4=${startPage4 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button> 
								</c:if>
								<c:if test="${pageNum4 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum4=${currentPage4 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i4" begin="${startPage4}" end="${endPage4}">
								<span id="page${i4}" class="page_num" onclick="location.href='mainPage.yo?pageNum4=${i4}'">${i4}</span>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage4 < totalPage4}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum4=${currentPage4 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage4 < totalPage4}">
									<button class="last" onclick="location.href='mainPage.yo?pageNum4=${endPage4 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				<li class="title" id="tab2" onclick="location.href='mainPage.yo'">
					<p> 장르5 영화 목록 </p>
					<div>
						<c:if test="${not empty GenreTotalMoviePageList5}">
							<c:forEach var="GTMPL5" items="${GenreTotalMoviePageList5}">
								<li>
									<a>
										<img src="../../mb_image/${TMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${GTMPL5.movieGenre}</p>
											<p>${GTMPL5.movieName}</p>
											<p>${GTMPL5.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage5 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum5=${startPage5 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button> 
								</c:if>
								<c:if test="${pageNum5 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum5=${startPage5 - 1}'">
										<img alt="이전" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i5" begin="${startPage5}" end="${endPage5}">
								<span id="page${i5}" class="page_num" onclick="location.href='mainPage.yo?pageNum5=${i5}'">${i5}</span>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage5 < totalPage5}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum5=${startPage5 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage5 < totalPage5}">
									<button class="last" onclick="location.href='mainPage.yo?pageNum5=${startPage5 + 1}'">
										<img alt="이전" src="../../mb_image/arrow_right.png">
										<img alt="이전" src="../../mb_image/arrow_right.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
			</ul>
		</section>
	</div>
</body>
</html>