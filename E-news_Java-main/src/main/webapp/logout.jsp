<%
    session.invalidate();
//Remove cookies
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie : cookies) {
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
}
    response.sendRedirect("login.jsp");
%>
