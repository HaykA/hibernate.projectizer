<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <pro:head title="Projects"/>
  </head>

  <body class="fillbg">
    <pro:header activeId="1" user="${user}"/>
    <article>
      <section>
        <div class="center-container clearfix">
          <ol class="breadcrumb pro-breadcrumb">
            <li><a href="<c:url value='/'/>"><pro:fa icon="home"/></a></li>
            <li><a href="<c:url value='/projects.htm'/>">Projects</a></li>
            <li><span class="cursor-default">${project.name}</span></li>
          </ol>

          <%-- Project name --%>
          <h1 class="pro-h1"><pro:fa icon="suitcase" style="suitcase-color"/>&nbsp;Project &quot;${project.name}&quot;</h1>
              
          <hr/>
          
          <pro:projectStatus-lg projectStatus="${project.status}"/>
          
          <%-- Project details --%>
          <c:if test="${not empty project.startDate or not empty project.endDate}">
          <dl class="time">
            <c:if test="${not empty project.reference}">
            <dt><pro:fa icon="hashtag"/>&nbsp;<strong>REFERENCE</strong></dt>
            <dd>${project.reference}</dd>
            </c:if>
            
            <c:if test="${not empty project.startDate}">
            <dt><pro:fa icon="calendar"/>&nbsp;<strong>START DATE</strong></dt>
            <dd><time class="cursor-default" datetime="${project.startDate}">
              <fmt:formatDate value="${project.startDate}" pattern="dd MMM yyyy"/> &nbsp;</time></dd>
            </c:if>
            
            <c:if test="${not empty project.endDate}">
            <dt><pro:fa icon="calendar-check-o"/>&nbsp;<strong>END DATE</strong></dt>
            <dd><time class="cursor-default" datetime="${project.endDate}">
              <fmt:formatDate value="${project.endDate}" pattern="dd MMM yyyy"/> &nbsp;</time></dd>
            </c:if>
            
            <dt><pro:fa icon="money"/>&nbsp;<strong>BUDGET</strong></dt>
            <dd>
            <c:choose>
            <c:when test="${project.budget > 0}">
            <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${project.budget}"/>&nbsp;${currency}
            </c:when>
            <c:otherwise>
            Not set
            </c:otherwise>
            </c:choose>
            </dd>
          </dl>
          </c:if>
          
          <div class="alert alert-warning"><pro:fa icon="calendar-o"/>&nbsp;
            <strong>CREATION DATE</strong>&nbsp;<time class="pro-date cursor-default"
                datetime="${project.creationDate}">&nbsp;<fmt:formatDate value="${project.creationDate}"
                  pattern="dd MMM yyyy"/> &nbsp;</time>
            
            <br>${project.description}</div>
          <hr/>
          
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation"<c:if test="${user.type eq 'CONTRACTOR'}"> class="active"</c:if>><a href="#location" aria-controls="location"
              role="tab" data-toggle="tab"><pro:gi icon="map-marker"/>&nbsp;Project Location</a></li>
            <li role="presentation"<c:if test="${user.type == 'CUSTOMER'}"> class="active"</c:if>><a href="#management" aria-controls="management"
              role="tab" data-toggle="tab"><pro:gi icon="tower"/>&nbsp;Management</a></li>
              <li role="presentation"><a href="#staff" aria-controls="executors"
              role="tab" data-toggle="tab"><pro:gi icon="apple"/>&nbsp;Staff</a></li>
            <li role="presentation"><a href="#stats" aria-controls="stats"
              role="tab" data-toggle="tab"><pro:gi icon="stats"/>&nbsp;Stats</a></li>
          </ul>
          
          <!-- Tab panes -->
          <div class="tab-content">

            <!-- Project Location -->
            <div role="tabpanel" class="tab-pane<c:if test="${user.type eq 'CONTRACTOR'}"> active</c:if>" id="location">
              <a href="<c:url value='https://www.google.be/maps/search/${project.address.href}'/>" target="_blank">
                <img alt="Google Maps" class="img256 float-left"
                  src="<c:url value='/images/core/gmaps.png'/>" /></a>
              <div class="pro-image-description">
                <address>${project.address.streetAndNumber}</address>
                <address>${project.address.postalIndexAndCity}</address>
                <address>${project.address.country}</address>
              </div>
            </div>

            <!-- Management -->
            <div role="tabpanel" class="tab-pane<c:if test="${user.type eq 'CUSTOMER'}"> active</c:if>" id="management">
              <pro:userTile userEntity="${project.manager}" title="manager"
                hrLineAfter="${not empty project.manager and not empty project.assistants}"/>
              
              <c:forEach var="assistant" items="${project.assistants}" varStatus="iterator">
              <pro:userTile userEntity="${assistant}" title="assistant" hrLineAfter="${not iterator.last}"/>
              </c:forEach>
            </div>
            
            <!-- Staff -->
            <div role="tabpanel" class="tab-pane" id="staff">
              <c:if test="${not empty project.contracts}">
              <c:forEach var="contract" items="${project.contracts}" varStatus="iterator">
              <pro:userTile userEntity="${contract.contractor}" title="${contract.skill}" hrLineAfter="${not iterator.last}"/>
              </c:forEach>
              </c:if>
            </div>

            <!-- Stats -->
            <div role="tabpanel" class="tab-pane" id="stats">...</div>
          </div>
          
        </div>
      </section>      
    </article>
   </body>
</html>