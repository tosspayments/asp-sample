<%@ Language="VBScript" %>


<!DOCTYPE html>

<!--#include file="json2.asp"--> 
<!--#include file="base64.asp"--> 

<%

	call initCodecs
	paymentKey	= trim(request("paymentKey")) 
	orderId	= trim(request("orderId")) 
	amount	= trim(request("amount"))

	secret_key = "test_ak_ZORzdMaqN3wQd5k6ygr5AkYXQGwy:"

	url = "https://api.tosspayments.com/v1/payments/" & paymentKey
	

 
	data = "{""orderId"" : """ & orderId & """, ""amount"" : """ & amount & """}"

	authorization = "Basic " & base64Encode(secret_key)
	
	set req = Server.CreateObject("MSXML2.ServerXMLHTTP")
	req.open "POST", url, false
	req.setRequestHeader "Authorization", authorization
	req.setRequestHeader "Content-Type", "application/json;charset=UTF-8"
	req.send data
	
	
	set myJSON = JSON.parse(req.responseText)

	httpCode = req.status

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제성공</title>
   <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<body>
<section>
    <%
    if httpCode = 200 then %>
        <h1>결제 성공</h1>
        <h3>상품명: 토스 티셔츠</h3>
        <p>결과 데이터:  <% response.write req.responseText %></p>
       <%
	    else  %>
        <h1>결제 실패</h1>
        <p><% response.write req.responseText%></p>
        <span>에러코드: <% response.write httpCode%></span>
        <% End if%>

</section>
</body>
</html>