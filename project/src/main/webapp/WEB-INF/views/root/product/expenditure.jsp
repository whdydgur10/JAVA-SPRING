<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="multipart/form-data; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>지출 내역</title>
<form id="uploadFrm" enctype="multipart/form-data">
  <p>데이터 업로드<br>엑셀파일만 업로드 가능(xls, xlsx)</p>
  <input type="file" name="upFile" id="upFile" accept=".xlsx, .xls"/>
</form>
<script>
let upFile = $('#upFile')[0];
upFile.addEventListener('change', function() {
    let form = $('#uploadFrm')[0];
    let frmData = new FormData(form);

    $.ajax({
        enctype: 'multipart/form-data',
        type: 'POST',
        url: "<%=request.getContextPath()%>/testFile",
        processData: false,   
        contentType: false,
        cache: false,
        data: frmData,
        success: function(data) {
            location.reload();
        },
        error: function(e) {
            alert('파일업로드 실패');
        }
    });
});
</script>