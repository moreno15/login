<%@page import="clases.Estudiante"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.ConsultaAlumno"%>
<jsp:include page = "header.jsp" />

<%

    //datos del cliente
    String nombre = "";
    String apellido = "";
    String usuario = "";
    String clave = "";
    String documento = "";
    String domicilio = "";

    // mensaje consulta 
    String msm = "";
    // desactivar botones
    String dnombre = "";
    String dapellido = "";
    String ddomicilio = "";
    String ddocumento = "";
    String dusuario = "";
    String dclave = "";

    // variables para los botones
    boolean guardar = false;
    boolean salir = false;
    boolean nuevo = false;
    boolean consultar = false;
    boolean desactivar = false;
    if (request.getParameter("nuevo") != null) {
        nuevo = true;
    }
    if (request.getParameter("guardar") != null) {
        guardar = true;
    }
    if (request.getParameter("consultar") != null) {
        consultar = true;
    }
    if (request.getParameter("desactivar") != null) {
        desactivar = true;
    }

    if (session.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        if (consultar) {

            if (request.getParameter("documento") != null) {
                documento = request.getParameter("documento");
                ConsultaAlumno ca = new ConsultaAlumno();
                Estudiante e = ca.consultar(documento);

                nombre = e.getNombre();
                apellido = e.getApellido();
                documento = e.getDocumento();
                domicilio = e.getDomicilio();
                usuario = e.getUsuario();
                clave = e.getClave();
                ddocumento = "readonly";
                dnombre = "readonly";
                dapellido = "readonly";
            } else {
                msm = "error en la consulta";
            }
        }

    }//fin de valida session

%>

<aside class="right-side">



    <div class="">
        <strong></strong>
    </div>
    <!-- Content Header (Page header) -->
    <section class="content-header">

        <h1>
            <!--INICIO-->
            <small>LISTADO DE LOS ALUMNOS</small>
        </h1>
    </section>


    <!-- Main content -->
    <section class="content" >
        <div class="row">
            <div class="col-xs-12" >
                <div class="box" >
                    <div class="box-header">
                        <!--  formulario -->
                        <h3 class="titleArticulo" style="background: #0073b7;">Registro Alumno</h3>
                    </div><!-- /.box-header -->
                    <div class="seccioarticulo grey lighten-3">
                        <span><%=msm%></span>
                        <form class="form_articulo" method="post" name="consultaAlumno" action="consultaAlumno.jsp" id="operacionAlumno">
                            <div class="row" style="width:90%;margin-left:20px;">
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    Documento:<input type="text" name="documento" id="documento" class="form-control" value="<%=documento%>"<%=ddocumento%>>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    Nombre:<input type="text" name="nombre" id="nombre"  class="form-control" value="<%=nombre%>" <%=dnombre%>>

                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    Apellido:<input type="text" name="apellido" id="apellido"  class="form-control" value="<%=apellido%>"<%=dapellido%>>
                                    Domicilio:<input type="text" class="form-control" name="domicilio" id="domicilio" value="<%=domicilio%>"<%=ddomicilio%>>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    Usuario  <input type="text" class="form-control" name="usuario" id="usuario"value="<%=usuario%>" <%=dusuario%>>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    Calve  <input type="text" class="form-control" name="clave" id="clave"value="<%=clave%>" <%=dclave%> >
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    Calve2  <input type="text" class="form-control" name="clave2" id="clave2"value="<%=clave%>" <%=dclave%>>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <br>
                                    <button class="btn btn-primary" type="submit" name="nuevo"id="nuevo" >Nuevo</button>
                                    <button class="btn btn-primary" type="submit" name="desactivar"id="desactivar">Desactivar</button>
                                    <button class="btn btn-primary" type="submit" name="guardar" id="guardar" >Guardar</button>
                                    <button class="btn btn-primary" type="submit" name="consultar" id="consultar">Consultar</button>
                                    <button class="btn btn-primary" type="reset" name="cancelar" id="cancelar" >Cancelar</button>

                                </div>
                            </div><!-- div row -->
                        </form>
                    </div><!--  fin formulario -->
                    <br><br>
                </div><!-- /.box -->

                <div class="box" >
                    <div class="box-header" >
                        <!--  formulario -->
                        <h3 class="titleArticulo" style="background: #39b3d7;">Lista del los Alumno</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead style=" ">
                                <tr>
                                    <th>Nº</th>
                                    <th>NOMBRE Y APELLIDO</th>
                                    <th>CODIGO</th>
                                    <th>DIRECCION</th>
                                    <th>OPERACION</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td>ss</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#" class="btn btn-primary" >Modificar</a></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nº</th>
                                    <th>NOMBRE Y APELLIDO</th>
                                    <th>TIPO DOC:</th>
                                    <th>Nº DOCUMENTO</th>
                                    <th>OPERACION</th>
                                </tr>
                            </tfoot>

                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->

            </div>
        </div>
    </section><!-- /.content -->
</aside><!-- /.right-side -->
<script type="text/javascript">
    $(function () {

        var table = $('#example1').DataTable({
            language: {
                "decimal": "",
                "emptyTable": "La tabla esta vacio",
                "info": "Mostrando _START_ de _TOTAL_ del total",
                "infoEmpty": "Mostrando 0 de  0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },
        });

    });

</script>
<jsp:include page = "footer.jsp" />