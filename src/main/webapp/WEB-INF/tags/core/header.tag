<%@tag language="java" description="header" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<%@attribute name='activeId' required='true' type='java.lang.Integer'%>
<%@attribute name='user' required='true' type='com.projectizer.entities.User'%>

      <c:choose>
        <c:when test="${user.type eq 'CUSTOMER'}">
          <c:set var="imgUrl" value='/images/profile/customer/${user.id}.jpg'/>
        </c:when>
        <c:otherwise>
          <c:set var="imgUrl" value='/images/profile/contractor/${user.id}.jpg'/>
        </c:otherwise>
      </c:choose>


<header>
   <nav class="navbar navbar-default navbar-inverse" id="navigation">
      <div class="container-fluid">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-collapse" aria-expanded="false">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand brand-name" href="<c:url value='/'/>">P</a>
         </div>

         <div class="collapse navbar-collapse" id="nav-collapse">
            <ul class="nav navbar-nav">
               <li<c:if test="${activeId == 1}"> class="active"</c:if>>
                <a href="<c:url value='/projects.htm'/>"><pro:gi icon="briefcase"/>&nbsp;Projects</a></li>
               <li<c:if test="${activeId == 2}"> class="active"</c:if>><a href="#"><pro:gi icon="stats"/>&nbsp;Stats</a></li>
               <li<c:if test="${activeId == 3}"> class="active"</c:if>><a href="#"><pro:gi icon="book"/>&nbsp;Library</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            <li<c:if test="${activeId == 4}"> class="active"</c:if>><a href="#"><pro:fa icon="question" fixedWidth="true"/>&nbsp;Help</a></li>
            <li<c:if test="${activeId == 5}"> class="active"</c:if>><a class="profile" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
            aria-haspopup="true" aria-expanded="false">
              <img width="42" height="42" alt="image" src="<c:url value='${imgUrl}'/>">&nbsp;${user.name}</a></li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><pro:fa icon="gear"/>&nbsp;<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Settings</a></li>
            <li role="separator" class="divider"></li>
            <li>
              <form method="post">
                <button type="submit" class="btn btn-default" name="signout">Sign-Out&nbsp;<pro:fa icon="sign-out"/></button>
              </form></li>
          </ul>
        </li>
                
      </ul>
         </div>
      </div>
   </nav>
</header>