<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Menu</title>
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
    <script src="js/editOrder.js"></script>
    <link rel="stylesheet" href="css/popup.css" media="screen" type="text/css"/>
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

            <h4 id="orderTitle" orderID="${orderDetails.order.id}" contenteditable="true">
                ${orderDetails.order.title}
            </h4>
            <a href="/cancelOrder?id=${orderDetails.order.id}">
                <img src="images/cancel_order.png" title="Cancel Order"/>
            </a>

            <table style="width: 100%">
                <c:forEach var="orderedDish" items="${orderDetails.orderedDishes}">

                    <tr style="width: 100%">
                        <!--h3>${user.firstName} ${user.lastName}</h3-->

                        <td><p>${orderedDish.dish.title}</p></td>
                        <td><p>${orderedDish.count}</p></td>
                        <td><p>$${orderedDish.totalPrice}</p></td>
                        <!--button onclick="location.href='orderDish?dishID=${dish.id}'">Order</button-->
                    </tr>

                </c:forEach>
            </table>

            <hr/>
            <p>Total &nbsp;&nbsp;<span>${orderDetails.totalPrice}</span></p>

            <p>Status &nbsp;&nbsp;<span>${orderDetails.orderStatus}</span></p>

            <p>Reservation Time</p>
            <c:set var="time" value="${orderDetails.order.reservationTime}"/>
            <input type="datetime" id="datepicker" name="reservationDate"
                   value="<fmt:formatDate value='${orderDetails.order.reservationTime}' pattern='MM/dd/yyyy"'></fmt:formatDate>"/>

            <c:if test="${orderDetails.order.statusID eq 2}">disabled</c:if>/>
            <input type="time" id="timepicker" name="reservationDate"
                   value="<fmt:formatDate value='${orderDetails.order.reservationTime}' pattern='hh:mm"'></fmt:formatDate>"
                   <c:if test="${orderDetails.order.statusID eq 2}">disabled</c:if>/>

            <a href="/startOrdering?orderID=${orderDetails.order.id}">Add Dishes</a>
            <a href="/checkout?orderID=${orderDetails.order.id}">Checkout</a>

            <div class="clear"></div>

            </ul>

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
