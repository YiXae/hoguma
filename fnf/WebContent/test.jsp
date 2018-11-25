<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	  fruit_val = $('select#item_sel').attr('data-type');
	  $('select#item_sel option[value=' + fruit_val + ']').attr('selected', 'selected');
	
</script>
</head>
<body>
<select name="fruit" class="fruit" data-item_sel="사과">
  <option value="바나나"">바나나</option>
  <option value="수박">수박</option>
  <option value="사과">사과</option>
</select>

<select id="item_sel" name="item_sel" data-item_sel="${boardview.bitem}" class="formstyle_write4">
  <option value="대분류 선택">대분류 선택</option>
  <option value="농산물">농산물</option>
  <option value="수산물">수산물</option>
</select>

<!-- Footer 시작 -->
	<%@ include file="include/footer.jsp"%>	
	<!-- Footer 끝 -->
</body>

</html>