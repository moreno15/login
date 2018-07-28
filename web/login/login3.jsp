<%-- 
    Document   : login
    Created on : 15-oct-2017, 10:37:48
    Author     : more_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Web Ipconsa</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'/>
        <!-- bootstrap 3.0.2 -->
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="../css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link rel="icon" href="../img/logo.jpg">
         <script src="../js/jquery.js" type="text/javascript"></script>
        <script type="text/javascript">
           
            
            

           $(function() {
               $("#validarUsuario").submit(function (){
                   $.post("../validarUsuario",$("#validarUsuario").serialize(),function (data){
                       cargo=jQuery.trim(data);
                       if(cargo=="1")document.location.href="../vista/personal.jsp";
                       else if(cargo=="2")document.location.href="../vista/Administrador.jsp";
                       else $("#mensaje-ingreso").html("<h2 class='alert alert-danger'>Usuario o clave Incorrecto</h2>");
                   });
                      return false; 
                   
               }) ;
            });
            
        </script>
        <style type="text/css">
            .alert{
                display: block;
                font-size: 15px;
                margin: 0px;
                text-align: center;
                border-radius: 0px;
               
            }
        </style>
    </head>
    <body class="bg-black">

        <div class="form-box" id="login-box">
            <div class="header">Inicia Sesion</div>
            <form class="form_login" name="validarUsuario" id="validarUsuario" action="../validarUsuario" method="post" >
                <div id="mensaje-ingreso">
                    
                </div>
                <div class="body bg-gray">
                    <div class="form-group">
                        <input type="text" name="usuario" class="form-control" placeholder="User ID"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="clave" class="form-control" placeholder="Password"/>
                    </div>
                </div>
                <div class="footer">
                    <input class="btn bg-olive btn-block"  type="submit" value="Ingresar" name="ingresarUsuario" />

                    <p><a href="#">olvidate tu contraseña ?</a></p>

                    <a href="register.html" class="text-center">REGISTRATE</a>
                </div>
            </form>
            
        </div>


        <!-- jQuery 2.0.2 -->
        
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
       
    </body>
</html>
