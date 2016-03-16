<%@tag language="java" description="breadcrumb" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<%@attribute name='value' required='true' type='com.projectizer.util.Breadcrumb'%>

<c:if test="${not empty value and not empty value.levels}">
   <ol class="breadcrumb">
         <li><a href="<c:url value='/'/>"><pro:fa icon="home"/></a></li>
         <c:forEach var="level" items="${value.levels}" varStatus="status">
         <c:choose>
         <c:when test="${status.last}">
         <li class="active cursor-default">${level.key}</li>
         </c:when>
         <c:otherwise>
         <li><a href="<c:url value='${level.value}'/>">${level.key}</a></li>   
         </c:otherwise>
         </c:choose>
         
         </c:forEach>
      </ol>
 </c:if>