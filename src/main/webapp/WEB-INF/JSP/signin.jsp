<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <pro:head title="Sign In"/>
  </head>

  <body class="fillbg">
    <div class="signin-container clearfix">
      <form method="post">
        <h1><span class="brand-name">P</span> Projectizer</h1>
        <select class="form-control" name="userType">
          <option value="">User Type [select]</option>
          <c:forEach var="type" items="${userTypes}">
            <option value="${type.key}"<c:if test="${type.key eq param.userType}"> selected="selected"</c:if>>${type.value}</option>  
          </c:forEach>
        </select>
        <input type="text" class="form-control" name="email" placeholder="e-mail" value="${param.email}"/>
        <input type="password" class="form-control" name="password" placeholder="password"/>
        <button type="submit" class="btn btn-lg btn-primary"><pro:fa icon="sign-in"/>&nbsp;Sign-In</button>
      </form>
      <c:if test="${not empty errors}">
        <c:choose>
          <c:when test="${errors.email and errors.password}">
            <c:set var="message" value='E-mail and password fields empty'/>
          </c:when>
          <c:when test="${errors.email and not errors.password}">
            <c:set var="message" value='E-mail field empty'/>
          </c:when>
          <c:when test="${errors.password and not errors.email}">
            <c:set var="message" value='Password fields empty'/>
          </c:when>
          <c:when test="${errors.user}">
            <c:set var="message" value='E-mail or password incorrect'/>
          </c:when>
        </c:choose>
        <div class="pro-alert">
          <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <i class="fa fa-warning"></i> <strong>Sign-In unsuccessful</strong>
                    <c:if test="${not empty message}"><br/>${message}</c:if><c:if test="${errors.userType}"><br/>User Type not selected</c:if>
          </div>
        </div>
      </c:if>
    </div>
  </body>
</html>