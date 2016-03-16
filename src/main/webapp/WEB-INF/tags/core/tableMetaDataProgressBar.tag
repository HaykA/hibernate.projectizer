<%@tag language="java" description="tableMetaDataProgressBar" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<%@attribute name='name' required='true' type='java.lang.String'%>
<%@attribute name='value' required='true' type='com.projectizer.maintenance.TableMetaData'%>
<%@attribute name='maxRows' required='true' type='java.lang.Long'%>

<c:set var="countPct" value="${(value.count / maxRows) * 100}"/>
<c:set var="differencePct" value="${(value.difference / maxRows) * 100}"/>
<c:set var="maxPct" value="${(value.max / maxRows) * 100}"/>

<div class="thumbnail">
<h4 class="pro">Table <strong>${name}</strong> <span class="small"><span class="label label-primary">
      <fmt:formatNumber maxFractionDigits="2" maxIntegerDigits="2" value="${countPct}"/>%</span>  
   <span class="label label-warning">
      <fmt:formatNumber maxFractionDigits="2" maxIntegerDigits="2" value="${maxPct}"/>%</span></span></h4>

<div class="progress">
   <div class="progress-bar" style="width: ${countPct}%"></div>
   <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: ${differencePct}%"></div>
</div>

<c:if test="${maxPct > 1}">
   <c:choose>
   <c:when test="${maxPct > 85}">
      <c:set var="btnStyle" value="danger"/>
   </c:when>
   <c:otherwise>
      <c:set var="btnStyle" value="warning"/>
   </c:otherwise>
   </c:choose>
   
<button class="btn btn-${btnStyle}"><pro:fa icon="cubes"/>&nbsp;Reorganize</button>
</c:if>
   </div>