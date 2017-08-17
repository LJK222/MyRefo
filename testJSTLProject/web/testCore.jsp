<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstl core library test</h1>
	<hr>
	<h4>c:set 으로 변수 만들기</h4>
	<c:set var="num1" value="100" />
	<c:set var="num2" value="200" />
	num1 변수 값 : ${ num1 }
	<br> num2 변수 값 : ${ num2 }
	<br>
	<c:set var="sum" value='${ num1 + num2 }' scope="session" />
	sum 변수 값 : ${ sum }
	<br>
	<%
		int n1 = 111, n2 = 222;
	%>
	<c:set var="tot" value="<%=n1 + n2%>" />
	tot 변수 값 : ${ tot }
	<br>
	<hr>
	<h4>c:set 으로 배열 만들기</h4>
	<c:set var="array" scope="request">
	red, green, blue, pink
</c:set>
	array 배열 값 : ${ array }
	<br>
	<hr>
	<h4>c:remove로 변수 tot 제거</h4>
	<c:remove var="tot" scope="page" />
	tot 값 : ${tot}
	<br>
	<hr>
	<h4>c:out : 출력기능 제공</h4>
	그대로 출력 :
	<c:out value="<h2>태그로 출력</h2>" escapeXml="true" />
	<br> 태그로 해석되어 출력 :
	<c:out value="<h2>태그로 출력</h2>" escapeXml="false" />
	<br> 전송온 값 출력 :
	<c:out value='${param.name }' default="유재영" />
	<br>
	<hr>
	
	<h4>c:if : if 문과 같은 처리를 하는 태그</h4>
	
	<c:if test='${ num1 >= num2 }'>
		num1 가 더 큼 (${ num1 })
	</c:if>
	<c:if test='${ num1 <= num2 }'>
		num2 가 더 큼 (${ num2 })
	</c:if>
	<hr>
	
	<h4>c:choose : switch 문과 같은 일을 하는 태그</h4>
	<c:set var="no" value="3"/>
	<c:choose>
		<c:when test='${ no eq 1 }'> <!-- no == 1 이라고 써도 됨 -->
			반갑.<br>
		</c:when>
		<c:when test='${ no eq 2 }'> <!-- no == 1 이라고 써도 됨 -->
			안녕.<br>
		</c:when>
		<c:otherwise> 
			환영.<br>
		</c:otherwise>
	</c:choose>
	<hr>
	<c:forEach var="cnt" begin="1" end="10" step="2">
		${ cnt }<br>
	</c:forEach>
	<c:forEach var="cnt" begin="1" end="7" step="1">
		<font size='${ cnt }'>반반복복문문 (${ cnt })</font><br>
	</c:forEach>
	<c:forEach var="color" items='${ array }'>
		<font color='${ color }'> 글자색 적용 : ${ color }</font><br>
	</c:forEach>
	<%
		java.util.ArrayList<String> bookList = new java.util.ArrayList<String>();
		bookList.add("java");
		bookList.add("oracle");
		bookList.add("jdbc");
		bookList.add("html5");
		bookList.add("css3");
		bookList.add("javascript");
		bookList.add("jquery");
		bookList.add("jsp");
		bookList.add("servlet");
		bookList.add("jstl");
		bookList.add("el");
		bookList.add("ajax + json");
	%>
	<c:forEach var="book" items='<%= bookList %>' varStatus="status">
		${ book } / ${ status.index } / ${ status.count } / ${ status.first }<br>
	</c:forEach>
	<hr>
	<h4>c:forTokens : java.util.StringTokenizer 클래스와 같은 기능</h4>
	<c:forTokens var="color" items="yellow pink blue grren red" delims=" ">
		<li>${ color }</li>
	</c:forTokens>
	<br>
	<c:forTokens var="color" items="yellow/pink*blue-grren red" delims="/*- ">
		${ color }<br>
	</c:forTokens>
	<hr>
	<h4>c:url : 다른 jsp 페이지나 서블릿 으로 연결처리할 때 사용하는 태그</h4>
	<!-- <a href="testFmt.jsp?no=123">testFmt 페이지로 이동</a> -->
	<c:url var="url" value="testFmt.jsp">
		<c:param name="no" value="123"/>
	</c:url>
	<a href='${ url }'>testFmt 페이지로 이동</a>
	<hr>
	<h4>c:import : jsp include 지시자 또는 jsp:include 와 같은 기능을 하는 태그</h4>
	<c:import url="testImport.jsp"/>
	<hr>
	
	c:redirect 페이지 이동
	<c:set var="test" value="0"/>
	<c:if test="${test eq 1}">
	<c:redirect url="index.jsp"/>
	</c:if>
	<hr>
	c:catch = try~catch
	<c:catch var="c">
	<c:set var="num11" value="null"/>
	<c:set var="num12" value="77"/>
	나눈 값 : ${num11/num12}
	</c:catch>
	<c:if test="${c!=null}">
	에러 메세지 : ${c.message }<br>
	</c:if> 
</body>
</html>