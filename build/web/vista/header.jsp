<%-- 
    Document   : header
    Created on : 16-oct-2017, 10:57:56
    Author     : more_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'/>



        <title>Ipconssa</title>

        <!-- bootstrap 3.0.2 -->
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />

        <!-- fullCalendar -->
        <link href="../css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="../css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="../css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />

        <!--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">-->
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.1/css/buttons.bootstrap.min.css">

        <!-- Theme style -->
        <link href="../css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- icon que descargue -->
        <link href="../css/fonts.css" rel="stylesheet" type="text/css" />

        <link href="../css/fonts.css" rel="stylesheet" type="text/css" />
        <!--- MMI PANELCSS -->
        <link href="../panelCss/marca.css" rel="stylesheet" type="text/css" />
        <link href="../panelCss/articulo.css" rel="stylesheet" type="text/css" />
        <link href="../panelCss/cliente.css" rel="stylesheet" type="text/css" />
        <link href="../panelCss/personal.css" rel="stylesheet" type="text/css" />

        <link href="../panelCss/factura.css" rel="stylesheet" type="text/css" />

        <link href="../panelCss/boleta2.css" rel="stylesheet" type="text/css" />

        <link href="../panelCss/perfil.css" rel="stylesheet" type="text/css" />

        <link rel="icon" href="../img/logo.jpg">
        <!-- editable select -->
        <link href="../css/jquery-editable-select.min.css" rel="stylesheet">
        <script src="../js/jquery-1.12.4.min.js" type="text/javascript"></script>

        <script src="../js/jquery-editable-select.min.js" type="text/javascript"></script>
        <!-- fin editable select -->
        <style media="screen">
            #cerarsesion:hover{
                background: #008000;
                color: #fff;
                height: 46px;

            }
            #perfil{
                display: block;
                color:#fff;
            }
            #logo{
                display: block;
                font-family: monospace;

            }

            #cerarsesion{
                display: block;
                width: 100px;
                height: 48px;
                border: #228B22;
                background: #228B22;
                color: #ffffff;
            }
        </style>

    </head>

    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="Administrador.jsp" class="logo" id="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Leonardo D' Vinci
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation" style="background:#228B22">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>

                <div class="navbar-right">
                    <ul class="nav navbar-nav">

                        <!-- User Account: style can be found in dropdown.less -->
                        <li >
                            <!--<li class="dropdown user user-menu">-->
                            <form action="../LogoutServlet" method="post">
                                <input type="submit" value="Cerrar Session" id="cerarsesion">

                            </form>
                            <!-- <a  href="../login/login.jsp" id="cerarsesion" style="color:#fff;">Cerrar Sesion
                             </a>-->
                        </li>  <!-- perfil usuario-->
                    </ul>
                </div>

            </nav>
        </header>
        <!-- Columna del lado derecho. Contiene la barra de navegación y el/../ contenido de la página -->
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../img/avatar5.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <h5><%=session.getAttribute("user")  %></h5>
                            <h5>Administrador</h5>
                            <a href="Administrador.jsp"><i class="fa fa-circle text-success"></i> En linea</a>
                        </div>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="Administrador.jsp">
                                <i class="fa fa-dashboard"></i> <span> Inicio</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="usuario.jsp" id="perfil">
                                <i class="fa icon-users" ></i>
                                <span>Perfil</span>
                            </a>
                        </li>
                        <li class="treeview">

                            <a href="#">
                                <i class="fa icon-price-tags"></i>
                                <span>Mantenimiento</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="salon.jsp"><i class="fa fa-angle-double-right"></i> Aula</a></li>
                                <li><a href="estudiante.jsp"><i class="fa fa-angle-double-right"></i> Alumno</a></li>
                                <li><a href="Personal.jsp"><i class="fa fa-angle-double-right"></i> Personal</a></li>
                                <li><a href="materiales.jsp"><i class="fa fa-angle-double-right"></i> Materiales</a></li>
                                <li><a href="permisos.jsp"><i class="fa fa-angle-double-right"></i> Permisos</a></li>
                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Categoria</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa icon-cart"></i>
                                <span>Operacion</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="boleta2.php"><i class="fa fa-angle-double-right"></i> Ventas</a></li>
                                <li><a href="pension.jsp"><i class="fa fa-angle-double-right"></i> Pension</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa icon-eye"></i>
                                <span>Consulta</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="consultaAlumno.jsp"><i class="fa fa-angle-double-right"></i> Alumno</a></li>
                                <li><a href="a.html"><i class="fa fa-angle-double-right"></i> Alquiler</a></li>
                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Personal</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
