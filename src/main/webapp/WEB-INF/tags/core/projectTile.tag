<%@tag language="java" description="userTile" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<%@attribute name='value' required='true' type='com.projectizer.entities.Project'%>
<%@attribute name='userType' required='true' type='java.lang.String'%>

<c:if test="${not empty value}">
  <c:choose>
    <c:when test="${userType eq 'CUSTOMER'}">
      <c:choose>
        <c:when test="${not empty value.manager}">
          <c:set var="imgUrl" value='/images/profile/contractor/${value.manager.id}.jpg'/>
          <c:set var="imgAlt" value='Manager: ${value.manager.name}'/>
          <c:if test="${not empty value.manager.company}">
            <c:set var="companyImgUrl" value='/images/profile/company/${value.manager.company.id}.jpg'/>
            <c:set var="companyImgAlt" value='${value.manager.company}'/>
            <c:url var="companyUrl" value='/company.htm'>
              <c:param name="id" value='${value.manager.company.id}'/>
            </c:url>
          </c:if> 
        </c:when>
        <c:otherwise>
          <c:set var="imgUrl" value='/images/profile/contractor/no-image.jpg'/>
          <c:set var="imgAlt" value='no manager'/>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
      <c:set var="imgUrl" value='/images/profile/customer/${value.customer.id}.jpg'/>
      <c:set var="imgAlt" value='${value.customer.name}'/>
      <c:if test="${not empty value.customer.company}">
        <c:set var="companyImgUrl" value='/images/profile/company/${value.customer.company.id}.jpg'/>
        <c:set var="companyImgAlt" value='${value.customer.company}'/> 
      </c:if>
    </c:otherwise>
  </c:choose>
  
  <c:choose>
    <c:when test="${value.status eq 'CREATED'}">
      <c:set var="statusPanelStyle" value='default'/>
      <c:set var="statusIcon" value='leaf'/>
    </c:when>
    <c:when test="${value.status eq 'VIEWED'}">
      <c:set var="statusPanelStyle" value='info'/>
      <c:set var="statusIcon" value='eye'/>
    </c:when>
    <c:when test="${value.status eq 'APPROVED'}">
      <c:set var="statusPanelStyle" value='success'/>
      <c:set var="statusIcon" value='check-square-o'/>
    </c:when>
    <c:when test="${value.status eq 'PROCESSING'}">
      <c:set var="statusPanelStyle" value='primary'/>
      <c:set var="statusIcon" value='spinner'/>
    </c:when>
    <c:when test="${value.status eq 'FINALIZED'}">
      <c:set var="statusPanelStyle" value='pro'/>
      <c:set var="statusIcon" value='suitcase'/>
    </c:when>
    <c:when test="${value.status eq 'DISPUTED'}">
      <c:set var="statusPanelStyle" value='warning'/>
      <c:set var="statusIcon" value='gavel'/>
    </c:when>
    <c:when test="${value.status eq 'CANCELLED'}">
      <c:set var="statusPanelStyle" value='danger'/>
      <c:set var="statusIcon" value='bug'/>
    </c:when>
  </c:choose>
  
<div class="pro-tile-4 clearfix">
  <div class="panel panel-${statusPanelStyle}">
  
    <div class="panel-heading cursor-default">
      <h3 class="panel-title" data-toggle="tooltip" title="${value.status}"><pro:fa icon="${statusIcon}" style="icon"/>&nbsp;${value.name}</h3>
    </div>
    
    <div class="panel-body">
      <img class="thumbnail" alt="${imgAlt}" src="<c:url value='${imgUrl}'/>" width="96" height="96"
        data-toggle="tooltip" title="${imgAlt}"/>
      <code><pro:fa icon="hashtag"/>${value.reference}</code>
      <time datetime="${value.creationDate}"><pro:fa icon="calendar-o"/>&nbsp;<fmt:formatDate value="${value.creationDate}"
                  pattern="dd MMM yyyy"/></time>
      <address>${value.address.streetAndNumber}</address>
      <address>${value.address.city}</address>
    </div>
    
    <div class="panel-footer clearfix">
    <c:url var="projectUrl" value="/project.htm">
      <c:param name="id" value="${value.id}"/>
    </c:url>
      <c:if test="${not empty companyImgUrl}">
      <a href="${companyUrl}">
      <img class="thumbnail pull-left" alt="${companyImgAlt}" src="<c:url value='${companyImgUrl}'/>" width="46" height="46"
        data-toggle="tooltip" title="${companyImgAlt}"/></a></c:if>
      <a href="${projectUrl}" class="btn btn-lg btn-default pull-right"><pro:fa icon="folder-open"/>&nbsp;Open</a>
    </div>
    
  </div>
</div>          

</c:if>