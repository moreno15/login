<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page = "header.jsp" />

<%
    String msm = "";
    String clasM = "";//alter div 
    //datos del cliente
    String nombre = "";
    String apellido = "";
    String telefono = "";
    String tipodocumento = "";
    String documento = "";
    String domicilio = "";

    boolean guardar = false;// llamar al boton
    boolean salir = false;
    //obtenemos los datos de los clientes
    if (request.getParameter("nombre") != null) {
        nombre = request.getParameter("nombre");
    }
    if (request.getParameter("apellido") != null) {
        apellido = request.getParameter("apellido");
    }
    if (request.getParameter("telefono") != null) {
        telefono = request.getParameter("telefono");
    }
    if (request.getParameter("tipodocumento") != null) {
        tipodocumento = request.getParameter("tipodocumento");
    }
    if (request.getParameter("documento") != null) {
        documento = request.getParameter("documento");
    }
    if (request.getParameter("domicilio") != null) {
        domicilio = request.getParameter("domicilio");
    }
    //
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
    } else {

    }//fin de valida session

%>

<aside class="right-side">
    <section class="content-header" >
        <h1>USUARIO: ronald moreno </h1>
    </section>
    <!-- Main content -->
    <section class="content" >
        <div class="row">
            <div class="col-xs-12" >
                <div class="box box-success" >
                    <div class="box-header" style="padding: 10px;">
                        <h4 >
                            <!--INICIO-->
                            Asignar Permisos a usuario
                        </h4>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead >
                                <tr>
                                    <th>Nº</th>
                                    <th>USUARIO</th>
                                    <th>VENTAS</th>
                                    <th>PENSIONES</th>
                                    <th>CLIENTES</th>
                                    <th>ADMIN</th>
                                    <th colspan="1" style="text-align: center;">PERMISOS</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td>ss</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#" class="btn btn-primary" >Ventas</a></td>
                                   
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                   <th>Nº</th>
                                    <th>USUARIO</th>
                                    <th>VENTAS</th>
                                    <th>PENSIONES</th>
                                    <th>CLIENTES</th>
                                    <th>ADMIN</th>
                                     <th colspan="1" style="text-align: center;">PERMISOS</th>
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