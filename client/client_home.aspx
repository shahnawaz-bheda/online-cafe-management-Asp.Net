<%@ Page Title="Home" Language="C#" MasterPageFile="Client.master" AutoEventWireup="true" CodeFile="client_home.aspx.cs" Inherits="client_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        
.g_slide {
  position: relative;
  width: 100%;
  height: 700px;
  overflow: hidden;
  margin-top:-13%;
}

.g_slide .item {
  display: none;
  position: absolute;
  left: 0;
  top: 0;
}

.switch_main { position: relative; }

.g_slide .switch_nav {
  width: 100%;
  position: absolute;
  right: 0;
  bottom: 10px;
  z-index: 0;
  text-align: center;
}

.g_slide .switch_nav_item {
  display: inline-block;
  margin: 0 10px 0 0;
  width: 13px;
  height: 13px;
  line-height: 200px;
  overflow: hidden;
  font-size: 0;
  border-radius: 100%;
  background: #b7b7b7;
  text-align: center;
  font-size: 18px;
  color: #fff;
}

.g_slide .switch_nav_item:hover { text-decoration: none; }

.g_slide .switch_nav_item_current { background: #eb6100; }

.g_slide .prev,
.g_slide .next {
  position: absolute;
  top: 50%;
  z-index: 10;
  margin-top: -15px;
  width: 18px;
  height: 30px;
  overflow: hidden;
  background: url(slide.png) no-repeat;
  transition: margin-left .3s ease, margin-right .3s ease;
}

.g_slide .prev {
  left: -18px;
  _left: 10px;
}

.g_slide .next {
  right: -18px;
  _right: 10px;
  background-position: -19px 0;
}

.g_slide .prev:hover { background-position: 0 -70px; }

.g_slide .next:hover { background-position: -19px -70px; }

.g_slide:hover .prev { margin-left: 28px; }

.g_slide:hover .next { margin-right: 28px; }

.scroll {
  position: relative;
  width: 100%;
  height: 300px;
  border: solid 1px #dfdfdf;
  overflow: hidden;
}

.switch_main { position: relative; }

.scroll .item {
  float: left;
  width: 250px;
  height: 100%;
  border-right: solid 1px #dfdfdf;
}

.scroll .switch_item {
  display: none;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
}

.scroll .prev,
.scroll .next {
  position: absolute;
  top: 50%;
  margin-top: -20px;
  width: 19px;
  height: 39px;
  overflow: hidden;
  background: url(slide.png) no-repeat;
}

.scroll .prev {
  left: 0;
  background-position: 0 -31px ;
}

.scroll .next {
  right: 0;
  background-position: -20px -31px;
}
.scroll .prev:hover { background-position: 0 -101px; }

.scroll .next:hover { background-position: -20px -101px; }

    </style>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="switchable.js"></script>

<div class="g_slide" id="slides" style="text-align:center">
	<div class="switch_main" >
		<a class="item switch_item" href="#"><img src="../images/banner-16.jpg" /></a>
		<a class="item switch_item" href="#"><img src="../images/banner-17.jpg" /></a>
		<a class="item switch_item" href="#"><img src="../images/coffee-banner-2.jpg" /></a>
		<a class="item switch_item" href="#"><img src="../images/cover_restaurant.jpg" /></a>
	</div>
</div>
    <script>
        $(function () {
            switchable({
                $element: $('#slides')
                //, interval: 1000
                //, animateSpeed: 1590

                , interval: 600000
                , animateSpeed: 159000

            });
        });
</script>
<div>
    <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.container {
  border: 2px solid #ccc;
  background-color: #eee;
  border-radius: 5px;
  margin-right:20px;
  margin-left:25px;
  width:46%;
  float:left;
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

.container span {
  font-size: 20px;
  margin-right: 15px;
}

@media (max-width: 500px) {
  .container {
      text-align: center;
  }
  .container img {
      margin: auto;
      float: none;
      display: block;
  }
}
</style>
</head>


<h2 style="color:white">Responsive Testimonials</h2><br/>


<div class="container">
  <%--<img alt="Avatar" style="width:90px">--%>
  <p><span>Sima Gagaliya.</span> HJD ITI College.</p><br/>
  <p>It's Good Website </p>
</div>

<div class="container">
  <img src="../images/nandini.jpg" alt="Avatar" style="width:50px; height:60px">
  <p><span>Nandini Buddh.</span> Student Of HJD College.</p><br/>
  <p>Wonderfull Site.</p>
</div>


</div><br/>

</asp:Content>