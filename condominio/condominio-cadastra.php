<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <title>Administradora Sol Nascente - M3</title>
        <meta name="author" content="Celso Crivellaro Werner">
        <meta name="description" content="Prova M3 - Banco de dados - Sistemas Para Internet - UNIVALI.">
        <link rel="shortcut icon" href="../images/favicon.png"/>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        </head>

    <body>

    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/materialize.min.js"></script>
          <!--menu navbar-->
<div class="navbar-fixed">
  <nav>
    <div class="nav-wrapper">
    <ul id="nav-mobile" class="right show-on-med-and-down ">
       <li><a href="../index.php">Home</a></li>
       <li><a href="../administrativo.html">Administrativo</a></li>
       <li><a href="../contato.html">Contato</a></li>
    </ul>
</div>
</nav>  
  </div>

 <!--Corpo do formulario-->

 <div><h5 class="center-align" style="margin: 30px;">Cadastro de Condomínios</h5></div>

 <!--nome do condominio-->
 <div class="row">
  <form class="col s12" action="condominio-save.php" method="POST">
    <div class="row">
      <div class="input-field col s12">
        <input name="nome" placeholder="Nome do Condomínio" id="nome" type="text" class="validate">
        <label for="nome">Nome</label>
      </div>
     </div>
<!--cnpj-->
     <div class="row">
        <div class="row">
          <div class="input-field col s12">
            <input name="cnpj" placeholder="CNPJ do Condomínio" id="cnpj" type="number" class="validate">
            <label for="CNPJ">CNPJ</label>
          </div>
         </div>
<!--Rua-->
<div class="row">
    <div class="row">
        <div class="input-field col s5">
        <input name="rua" placeholder="Rua" id="rua" type="text" class="validate">
        <label for="Rua">Rua</label>
      </div>
   <!--numero-->
      <div class="input-field col s1">
        <input name="numero" placeholder="numero" id="numero" type="number" class="validate">
        <label for="Numero">Numero</label>
      </div>
     
<!--bairro-->
<div class="input-field col s3">
  <input name="bairro" placeholder="Bairro" id="bairro" type="text" class="validate">
  <label for="Bairro">Bairro</label>
</div>

<!--CEP-->
<div class="input-field col s3">
  <input name="cep" placeholder="CEP" id="CEP" type="number" class="validate">
  <label for="CEP">CEP</label>
</div>
</div>
<!--<a class="waves-effect waves-light btn">Cadastra</a>-->
<button class="waves-effect waves-light btn" type="submit">Cadastra</button>
<a href="../administrativo.html" class="waves-effect waves-light btn">Cancela</a>
</div>
  </form>
<!--Fim do formulario-->

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
