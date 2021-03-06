<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sirobaban
  Date: 28.07.2015
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<html>
<head>
  <title>Orders [Admin]</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all"/>
  <link rel="stylesheet" href="css/slider-styles.css" type="text/css" media="all"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script type="text/javascript" src="js/slider.js"></script>
  <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville' rel='stylesheet' type='text/css'>
  <script src="js/lib/jquery.bpopup.min.js"></script>
  <link rel="stylesheet" href="css/popup.css" media="screen" type="text/css"/>
  <script src="js/popup.js"></script>
  <script>
    $(function () {
      $("#datepicker").datepicker();
    });
  </script>
</head>
<body>
<div class="wrap">

  <jsp:include page="header.jsp">
    <jsp:param name="activeMenuItem" value="myOrders"/>
  </jsp:include>

  <div class="main-body">

    <jsp:include page="imagesSlider.jsp"/>

    <div class="lists">

      <c:choose>
        <c:when test="${empty orderDetailses}">
          <h4>No Orders</h4>
        </c:when>
        <c:otherwise>

          <c:forEach var="orderDetails" items="${orderDetailses}">

            <h4>
              <a href="order?id=${orderDetails.order.id}"
                 class="orderTitle">${orderDetails.order.title}
              </a>
              <a href="/closeOrder?id=${orderDetails.order.id}">
                <img src="images/accept.png" title="Close Order"/>
              </a>
            </h4>

            <table style="width: 100%">
              <c:forEach var="orderedDish" items="${orderDetails.orderedDishes}">

                <tr style="width: 100%">

                  <td><p>${orderedDish.dish.title}</p></td>
                  <td><p>${orderedDish.count}</p></td>
                  <td><p>$${orderedDish.totalPrice}</p></td>
                </tr>

              </c:forEach>
            </table>

            <hr/>
            <p>Total &nbsp;&nbsp;<span>${orderDetails.totalPrice}</span></p>
            <p>Status &nbsp;&nbsp;<span>${orderDetails.orderStatus}</span></p>


            <div class="clear"></div>
          </c:forEach>

        </c:otherwise>
      </c:choose>

      <div class="clear"></div>
    </div>

    <jsp:include page="sideNav.jsp"/>

    <div class="clear"></div>
  </div>
</div>

<jsp:include page="footer.jsp"/>

<div class="clear">
</div>
</div>

</body>
</html>
