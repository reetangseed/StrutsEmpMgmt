
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title>World Page</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin_2.css" rel="stylesheet">
<!--        <link href="css/menu_css.css" rel="stylesheet">-->
        
    </head>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%@page import="com.exavalu.models.Country"%>
<%@page import="com.exavalu.services.WorldService"%>
<%@page import="com.exavalu.models.State"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
    <body class="text-center">
        <c:set var="country" value="${country}"/>
         <form action="SelectCountry" method="Post">
        <div class="form-floating">
          
          
          <c:set var="countryList" value='${WorldService.getInstance().getAllCountries()}'/>
              <c:set var="country" value='${Country}'/>
              <select name="countryId" class="form-select" id="countryId" onchange="this.form.submit()">
              <option value="0" selected>Select a Country</option>
              <c:forEach items="${countryList}" var="country">
                  <option value=${country.getCountryId()}> ${country.getCountryName()}  </option>
              
              </c:forEach>
          </select>
          <label for="floatingInput">Select Country</label>
      </div>
          
         </form>
              <c:if test='${stateList}'> 
                  <div class="form-floating">
                      

                      <select name="stateId" class="form-select" id="countryId">
                          <option value="0" selected>Select a State</option>
                          <c:forEach items="${stateList}" var="state">
                              <option value=${state.getStateId()}> ${state.getStateName()}  </option>

                          </c:forEach>
                      </select>
                      <label for="floatingInput">Select State</label>
                  </c:if>

              </div>
    </body>
</html>
