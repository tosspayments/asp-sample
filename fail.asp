<%@ Language="VBScript" %>


<!DOCTYPE html>

<%

	message	= trim(request("message")) 
	code	= trim(request("code")) 

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>���� ����</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<body>
<section>
    <h1>���� ����</h1>
    <p><% response.write message%></p>
    <span>�����ڵ�: <% response.write code%></span>
</section>
</body>
</html>
