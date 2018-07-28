<jsp:include page = "header.jsp" />
 <%  
    if(session.getAttribute("user") == null){
        response.sendRedirect("../index.jsp");
    }
         
%>
<jsp:include page = "footer.jsp" />