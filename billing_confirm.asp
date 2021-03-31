<%@ Language="VBScript" %>


<!DOCTYPE html>

<!--#include file="json2.asp"--> 
<!--#include file="base64.asp"--> 
<!--#include file="buildQuery.asp"--> 
<%

	call initCodecs
	customerKey	= trim(request("customerKey")) 
	authKey	= trim(request("authKey")) 
	

	secret_key = "test_ak_ZORzdMaqN3wQd5k6ygr5AkYXQGwy:"

	url = "https://api.tosspayments.com/v1/billing/authorizations/" & authKey
	

 
	data = "{""customerKey"" : """ & customerKey & """}"

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
    <title>빌링키 발급 성공</title>
   <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<body>
<section>
    <%
    if httpCode = 200 then %>
        <h1>빌링키 발급 성공</h1>
        
        <p>결과 데이터:  <% response.write req.responseText %></p>
       <%
	    else  %>
        <h1>빌링키 발급 실패</h1>
        <p><% response.write req.responseText%></p>
        <span>에러코드: <% response.write httpCode%></span>
        <% End if%>

</section>
</body>
</html>