<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<!DOCTYPE html>
<html>
   <head>
      <pro:head title="Settings >"/>
   </head>
   <body>
   
   <pro:breadcrumb value="${breadcrumb}"/>
   <pro:pagination value="${pagination}" servletPath="${servletPath}"/>

   </body>
</html>