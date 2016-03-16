<%@tag language="java" description="projectStatus-lg" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<%@attribute name='projectStatus' required='true' type='java.lang.String'%>

<c:choose>
  <c:when test="${projectStatus eq 'CREATED'}">
    <c:set var="statusLabelStyle" value='default'/>
    <c:set var="statusIcon" value='leaf'/>
  </c:when>
  <c:when test="${projectStatus eq 'VIEWED'}">
    <c:set var="statusLabelStyle" value='info'/>
    <c:set var="statusIcon" value='eye'/>
  </c:when>
  <c:when test="${projectStatus eq 'APPROVED'}">
    <c:set var="statusLabelStyle" value='success'/>
    <c:set var="statusIcon" value='check-square-o'/>
  </c:when>
  <c:when test="${projectStatus eq 'PROCESSING'}">
    <c:set var="statusLabelStyle" value='primary'/>
    <c:set var="statusIcon" value='spinner'/>
  </c:when>
  <c:when test="${projectStatus eq 'FINALIZED'}">
    <c:set var="statusLabelStyle" value='default pro-success'/>
    <c:set var="statusIcon" value='suitcase'/>
  </c:when>
  <c:when test="${projectStatus eq 'DISPUTED'}">
    <c:set var="statusLabelStyle" value='warning'/>
    <c:set var="statusIcon" value='gavel'/>
  </c:when>
  <c:when test="${projectStatus eq 'CANCELLED'}">
    <c:set var="statusLabelStyle" value='danger'/>
    <c:set var="statusIcon" value='bug'/>
  </c:when>
</c:choose>
                    
<h4 class="pro-status cursor-default"><span class="label label-lg label-${statusLabelStyle}">
  <pro:fa icon="${statusIcon}" fixedWidth="true"/>&nbsp;${projectStatus}</span></h4>