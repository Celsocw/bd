<!DOCTYPE html>
<html lang="pt-br">
<?php include('connect.php');?>
<html>
    <head>
        <meta charset='utf-8'>
        <title>Web Design - M3</title>
        <meta name="author" content="Celso Crivellaro Werner">
        <meta name="description" content="Prova M3 - Web Design - Sistemas Para Internet - UNIVALI.">
        <link rel="shortcut icon" href="./images/favicon.png"/>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        </head>
    <body>
       <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
<!--menu navbar-->
<div class="navbar-fixed">
  <nav>
    <div class="nav-wrapper">
    <ul id="nav-mobile" class="right show-on-med-and-down ">
       <li><a href="index.php">Home</a></li>
       <li><a href="administrativo.html">Administrativo</a></li>
       <li><a href="contato.html">Contato</a></li>
    </ul>
</div>
</nav>   
  </div>
  <div class="section white center">
    <div class="row container">
        <h2 class="header ">Edificio South Jambalaia . </h2>
            <p class="grey-text text-darken-3 lighten-3">
            Gerenciado por: Administradora de Condominios Sol nascente</p>
    </div></div>
    <div class="parallax-container">
        <div class="parallax"><img src="images/sol.jpg"></div>
    <!--JavaScript Vlibras-->
    <div vw class="enabled">
        <div vw-access-button class="active"></div>
        <div vw-plugin-wrapper>
          <div class="vw-plugin-top-wrapper"></div>
        </div>
      </div>
      <script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
      <script>
        new window.VLibras.Widget('https://vlibras.gov.br/app');
      </script>
<!--JavaScript at end of body for optimized loading-->
<script type="text/javascript" src="js/materialize.min.js"></script>
<!--JavaScript at end of body for optimized loading-->
</body>

</html>
