<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <li><a href="#"><pro:fa icon="home"/></a></li>
  <li><span class="cursor-default">Projects</span></li>
</ol>
          <h1><pro:fa icon="suitcase" style="suitcase-color"/>&nbsp;Projects</h1>
          <hr/>

<div class="pro-row">

<c:choose>
  <c:when test="${user.type eq 'CUSTOMER'}">
    <c:forEach var="p" items="${user.projects}">
    <pro:projectTile value="${p}" userType="${user.type}"/>
    </c:forEach>
  </c:when>
  <c:otherwise>
  
  
  <c:choose>
  <c:when test="${not empty contractor.managedByMeProjects or not empty contractor.assistedByMeProjects or not empty contractor.projects}">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <c:if test="${not empty contractor.managedByMeProjects}">
      <li role="presentation" class="active"><a href="#managedByMe" aria-controls="managedByMe"
      role="tab" data-toggle="tab"><pro:gi icon="tower"/>&nbsp;Managed By Me</a></li>
    </c:if>
    
    <c:if test="${not empty contractor.assistedByMeProjects}">
      <li role="presentation"<c:if test="${empty contractor.managedByMeProjects}"> class="active"</c:if>><a href="#assistedByMe" aria-controls="assistedByMe"
        role="tab" data-toggle="tab"><pro:gi icon="star"/>&nbsp;Assisted By Me</a></li>
    </c:if>
    
    <c:if test="${not empty contractor.projects}">
    <li role="presentation"<c:if test="${empty contractor.managedByMeProjects and empty contractor.assistedByMeProjects}"> class="active"</c:if>><a href="#myProjects" aria-controls="myProjects"
      role="tab" data-toggle="tab"><pro:gi icon="apple"/>&nbsp;I'm involved in</a></li>
    </c:if>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  
  
  <c:if test="${not empty contractor.managedByMeProjects}">
  <!-- Managed By Me Projects -->
  <div role="tabpanel" class="tab-pane active" id="managedByMe">
    <c:forEach var="p" items="${contractor.managedByMeProjects}">
    <pro:projectTile value="${p}" userType="${contractor.type}"/>
    </c:forEach>
  </div>
  </c:if>
  
  <c:if test="${not empty contractor.assistedByMeProjects}">
  <!-- Assisted By Me Projects -->
  <div role="tabpanel" class="tab-pane<c:if test="${empty contractor.managedByMeProjects}"> active</c:if>" id="assistedByMe">
    <c:forEach var="p" items="${contractor.assistedByMeProjects}">
    <pro:projectTile value="${p}" userType="${contractor.type}"/>
    </c:forEach>
  </div>
  </c:if>
  
  <c:if test="${not empty contractor.projects}">
  <!-- My Projects -->
  <div role="tabpanel" class="tab-pane<c:if test="${empty contractor.managedByMeProjects and empty contractor.assistedByMeProjects}"> active</c:if>" id="myProjects">
    <c:forEach var="p" items="${contractor.projects}">
    <pro:projectTile value="${p}" userType="${contractor.type}"/>
    </c:forEach>
  </div>
  </c:if>
  
         
  </div>
  
  
  
  </c:when>
  <c:otherwise>
    <div class="pro-alert">
      <div class="alert alert-warning alert-dismissible" role="alert">No project found</div>
    </div>
  </c:otherwise>
  </c:choose>
  
  </c:otherwise>
</c:choose>

          </div>

        </div>
      </section>      
    </article>
   </body>
</html>