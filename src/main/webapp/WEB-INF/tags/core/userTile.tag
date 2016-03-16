<%@tag language="java" description="userTile" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<%@attribute name='userEntity' required='true' type='com.projectizer.entities.User'%>
<%@attribute name='title' required='true' type='java.lang.String'%>
<%@attribute name='hrLineBefore' required='false' type='java.lang.Boolean'%>
<%@attribute name='hrLineAfter' required='false' type='java.lang.Boolean'%>

<c:if test="${not empty userEntity}">

<c:if test="${hrLineBefore}">
<div class="pro-row"><hr/></div>
</c:if>

<div class="user-tile-1">
  <%-- User Image --%>
  <c:choose>
    <c:when test="${not empty userEntity.company}">
      <c:url var="companyImageHref" value='/company.htm'>
        <c:param name="id" value='${userEntity.company.id}'/>
      </c:url>
      <c:set var="companyImageUrl" value="/images/profile/company/${userEntity.company.id}.jpg"/>
    </c:when>
  </c:choose>
  
  <c:url var="imageHref" value='/staff.htm'>
    <c:param name="id" value='${userEntity.id}'/>
  </c:url>
  <c:set var="imageUrl" value="/images/profile/${userEntity.classNameToLowerCase}/${userEntity.id}.jpg"/>
  
  <c:choose>
    <c:when test="${userEntity.type eq 'CONTRACTOR'}">
      <c:url var="userEntityUrl" value='/staff.htm'>
        <c:param name="id" value='${userEntity.id}'/>
      </c:url>
    </c:when>
    <c:when test="${userEntity.type eq 'CUSTOMER'}">
      <c:url var="userEntityUrl" value='/customer.htm'>
        <c:param name="id" value='${userEntity.id}'/>
      </c:url>
    </c:when>
  </c:choose>
  
  <a href="${imageHref}"><img alt="${title}" class="thumbnail profile" src="<c:url value='${imageUrl}'/>" /></a>
  <div class="pro-image-description">
    <div class="float-left">
      <c:if test="${not empty companyImageUrl}">
      <a href="${companyImageHref}">
        <img alt="${userEntity.company}" class="thumbnail company" src="<c:url value='${companyImageUrl}'/>"
          width="46" height="46" data-toggle="tooltip" title="${userEntity.company}"/></a>
      </c:if>
      <h3 class="pro-h3"><a href="<c:url value='${userEntityUrl}'/>">${userEntity.name}</a><br/>
        <span class="cursor-default">${title}</span></h3>

      <a class="btn btn-sm btn-primary email" href="mailto:${userEntity.email}">
        <span class="ellipsis-1"><pro:gi icon="envelope"/>&nbsp;${userEntity.email}</span></a>
    
      <c:forEach var="contactNumber" items="${userEntity.contactNumbers}">
      <br/>
      <c:choose>
      <c:when test="${contactNumber.type eq 'PHONE'}">
      <pro:gi icon="phone-alt"/>&nbsp;${contactNumber}
      </c:when>
      <c:when test="${contactNumber.type eq 'MOBILE'}">
      <pro:gi icon="phone"/>&nbsp;${contactNumber}
      </c:when>
      <c:when test="${contactNumber.type eq 'FAX'}">
      <pro:fa icon="fax" style="primary-color" fixedWidth="true"/>&nbsp;${contactNumber}
      </c:when>
      </c:choose>
      </c:forEach>
    </div>
  </div>
</div>

<c:if test="${hrLineAfter}">
<div class="pro-row"><hr/></div>
</c:if>

</c:if>