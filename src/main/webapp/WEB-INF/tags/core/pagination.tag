<%@tag language="java" description="pagination" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pro" uri="http://projectizer.com/core/tags"%>
<%@attribute name='value' required='true' type='com.projectizer.util.Pagination'%>
<%@attribute name='servletPath' required='true' type='java.lang.String'%>
<%@attribute name='showViewButtons' required='false' type='java.lang.Boolean'%>

<c:if test="${not empty value.lastPage}"> 
<nav>
  <div class="pro-pagination-toolset">
    <ul class="pagination pro-pagination">

      <c:if test="${value.stepper}">
      <%-- First Page --%>
        <c:if test="${not empty value.firstPage}">
          <c:url var="pageUrl" value="${servletPath}">
            <c:param name="page" value="${value.firstPage}"/>                  
          </c:url>
        <li><a href="${pageUrl}">${value.firstPage}</a></li>
        </c:if>

      <%-- Previous Page Group --%>
      <c:choose>
      <c:when test="${not empty value.stepBackward}">
        <c:url var="pageUrl" value="${servletPath}">
          <c:param name="page" value="${value.stepBackward}"/>                  
        </c:url>
      <li class="above-xs"><a class="icon" href="${pageUrl}"><pro:gi icon="step-backward"/></a></li>
      </c:when>
      <c:otherwise>
      <li class="disabled pro-disabled above-xs"><a class="icon"><pro:gi icon="step-backward"/></a></li>
      </c:otherwise>
      </c:choose>
      </c:if>
               
      <%-- Previous Page --%>
      <c:choose>
      <c:when test="${not empty value.previousPage}">
        <c:url var="pageUrl" value="${servletPath}">
          <c:param name="page" value="${value.previousPage}"/>                  
        </c:url>
      <li><a class="icon" href="${pageUrl}"><pro:gi icon="chevron-left"/></a></li>
      </c:when>
      <c:otherwise>
      <li class="disabled pro-disabled"><a class="icon"><pro:gi icon="chevron-left"/></a></li>
      </c:otherwise>
      </c:choose>
               
      <%-- Pages --%>
      <c:forEach var="page" items="${value.pages}">
        <c:url var="pageUrl" value="${servletPath}">
          <c:param name="page" value="${page}"/>                  
        </c:url>
      <li<c:if test="${page.current}"> class="active"</c:if>><a href="${pageUrl}">${page}</a></li>
      </c:forEach>
               
      <%-- Next Page --%>
      <c:choose>
      <c:when test="${not empty value.nextPage}">
        <c:url var="pageUrl" value="${servletPath}">
          <c:param name="page" value="${value.nextPage}"/>                  
        </c:url>
      <li><a class="icon" href="${pageUrl}"><pro:gi icon="chevron-right"/></a></li>
      </c:when>
      <c:otherwise>
      <li class="disabled pro-disabled"><a class="icon"><pro:gi icon="chevron-right"/></a></li>
      </c:otherwise>
      </c:choose>
               
      <c:if test="${value.stepper}">
      <%-- Next Page Group --%>
      <c:choose>
      <c:when test="${not empty value.stepForward}">
        <c:url var="pageUrl" value="${servletPath}">
          <c:param name="page" value="${value.stepForward}"/>                  
        </c:url>
      <li class="above-xs"><a class="icon" href="${pageUrl}"><pro:gi icon="step-forward"/></a></li>
      </c:when>
      <c:otherwise>
      <li class="disabled pro-disabled above-xs"><a class="icon"><pro:gi icon="step-forward"/></a></li>
      </c:otherwise>
      </c:choose>
               
      <%-- Last Page --%>
      <c:if test="${not empty value.lastPage}">
        <c:url var="pageUrl" value="${servletPath}">
          <c:param name="page" value="${value.lastPage}"/>                  
        </c:url>
      <li><a href="${pageUrl}">${value.lastPage}</a></li>
      </c:if>
      </c:if>
      </ul>
      
    </div>
    
    <%-- Current Page TextBox and Go Button --%>
    <div class="pro-pagination-toolset">
      <div class="pro-pagination-tool">
        <input type="number" class="form-control pro-input-short" max="${value.lastPage}" maxlength="4" value="${value.currentPage}">
      </div>
      <div class="pro-pagination-tool">
        <button class="btn btn-sm btn-success pro-btn-sm">Go!</button>
      </div>
    </div>
    
    <%-- View Buttons --%>            
    <c:if test="${showViewButtons}">
    <ul class="pagination pro-pagination pull-right">
      <li class="active"><a href="#"><pro:gi icon="menu-hamburger"/></a>
      <li><a href="#"><pro:gi icon="th-large"/></a>
    </ul>
    </c:if>
    
    <%-- Max Results (Option) --%>        
    <div class="pro-pagination-toolset pull-right">
      <div class="pro-pagination-tool">
        <label for="sel-maxResult">Results:</label>
      </div>
      <div class="pro-pagination-tool">
        <select id="sel-maxResult" name="maxResult" class="form-control pro-form-control">
          <c:forEach var="maxResult" items="${value.maxResults}">
          <option value="${maxResult.key}"<c:if test="${maxResult.value == value.maxResult}"> selected="selected"</c:if>>${maxResult.value}</option>
          </c:forEach>
        </select>
      </div>
    </div>

</nav>
</c:if>