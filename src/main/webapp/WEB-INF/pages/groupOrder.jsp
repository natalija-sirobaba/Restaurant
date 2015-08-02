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
  <title>Menu</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all"/>
  <link rel="stylesheet" href="css/slider-styles.css" type="text/css" media="all"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville' rel='stylesheet' type='text/css'>
  <script src="js/lib/jquery.bpopup.min.js"></script>
  <script src="js/popup.js"></script>
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
    <jsp:param name="activeMenuItem" value="groupOrders" />
  </jsp:include>

  <div class="main-body">

    <jsp:include page="imagesSlider.jsp" />

    <div class="grids">

          <ul>

              <h4><a href="order?id=${orderDetails.order.id}">${orderDetails.order.title} [Group]</a></h4>

              <c:forEach var="userOrderedDishes" items="${orderDetails.usersOrderedDetails}">
                <h3>${userOrderedDishes.key.firstName} ${userOrderedDishes.key.lastName}</h3>
                <c:forEach var="orderedDish" items="${userOrderedDishes.value.orderedDishes}">
                  <li>

                    <p>${orderedDish.dish.title}
                      &nbsp;&nbsp;<span>${orderedDish.count}</span>
                      &nbsp;&nbsp;<span>${orderedDish.totalPrice}</span></p>
                    <!--button onclick="location.href='orderDish?dishID=${dish.id}'">Order</button-->
                  </li>
                </c:forEach>
              </c:forEach>
              <p>Total &nbsp;&nbsp;<span>${orderDetails.totalPrice}</span></p>

              <p>Status &nbsp;&nbsp;<span>${orderDetails.orderStatus}</span></p>

              <a href="/startOrdering?orderID=${orderDetails.order.id}">Add Dishes</a>
              <a href="/cancelOrder?id=${orderDetails.order.id}">Cancel Order</a>
              <a href="/checkout?orderID=${orderDetails.order.id}">Checkout</a>

              <div class="clear"></div>


          </ul>

      <h4><a href="#" class="addGroupOrder">Add Group Order</a></h4>

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

<div class="box" id="addGroupOrderPopup" style="position:absolute; display: none;">
  <div class="containerWrapper">
    <div class="containerRegister tabContainer active">
      <form action="addGroupOrder" method="post">
        <h2 class="loginTitle">Add Group Order</h2>

        <div class="registerContent">
          <div class="inputWrapper">
            <input name="title" value="Birthday Party" placeholder="Title"/>
          </div>
          <div class="inputWrapper">

            <select name="groupID">
              <c:forEach var="group" items="${userGroups}">
                <option value="${group.id}">${group.title}</option>
              </c:forEach>
            </select>

          </div>
          <div class="inputWrapper">
            <input name="reservationTime" id="datepicker" type="datetime"/>
          </div>
        </div>
        <button class="greenBox" type="submit">
          <span class="iconRegister"></span> Add
        </button>
        <div class="clear"></div>
      </form>
    </div>
    <div class="clear"></div>

  </div>
</div>
</body>
</html>
