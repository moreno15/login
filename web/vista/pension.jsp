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
    
    <aside class="content">
        <div class="row"  id="contenedorCliente" style="display:none">
            <div class="col-xs-12" id="flotanteCliente">
                <div class="box">
                    <div class="box-header">
                        <!--  formulario -->
                        <h3 class="titleArticulo">Registro Alumno</h3>
                    </div><!-- /.box-header -->
                    <div class="seccioarticulo grey lighten-3">
                        
                        <form class="form_articulo" method="post" action="Cliente.jsp" id="formmulario">
                            <div class="row" style="margin-bottom: 20px;">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>CODIGO VAUCHER:</label><input type="text" class="form-control" >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>MOTO PAGADO:</label><input type="text" class="form-control" >
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>FECHA PAGO:</label><input type="date" class="form-control">
                                </div>
                            </div>
                            <div class="row"  style="margin-bottom: 20px; ">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>RECEPCIONADO POR:</label><input type="text" class="form-control" readonly>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>APODERADO:</label>
                                    <select class="form-control" id="selectApoderadopension">
                                        <option value="" disabled>Seleccione</option>
                                        <option value="" >Ronald</option>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>ALUMNO:</label>
                                    <select class="form-control" id="selectAlumnopension">
                                        <option value=""  disabled>Seleccione</option>
                                        <option value="" >Ronald</option>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>FECHA REGISTRO:</label><input type="date" class="form-control">
                                </div>

                            </div><!-- row datos pago -->
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <input type="submit" class="btn btn-primary" value="Guardar"/>
                                </div>

                            </div>
                        </form>
                    </div><!--  fin formulario -->
                    
                    <br><br>
                    <form>
                        <input class="btn btn-success"  type="button"   name="salir" id="salir"  onClick="flotanteCliente(2)"value="Salir" style="float: right;margin-right:30px;width:100px;color:#fff;"/>
                    </form>

                </div><!-- /.box -->
            </div>
            <div id="fondo"></div>
        </div>
        <!-- fin contenedor alumno  -->
    </aside>

    <!--  formulario -->
    <div class="seccioarticulo grey lighten-3">
        <form class="form_articulo" method="post" action="Cliente.jsp">
            <div class="row"  style="width:100%;margin-left:20px;">
                <div class="col-xs-3">
                    <a href="#" class="buscarp btn btn btn-success" name="agregarCl"
                       id="agregarCl" onClick="flotanteCliente(1)" style="width: 200px;" >Realizar Cobro</a>
                </div>
            </div>
        </form>
    </div><!--  fin formulario -->
    <!-- Main content -->
    <section class="content" >
        <div class="row">
            <div class="col-xs-12" >
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">Lista de los Pensiones</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="box-body table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead style=" ">
                                        <tr>
                                            <th>Nº</th>
                                            <th>CODIGO ALUMNO</th>
                                            <th>NOMBRE ALUMNO</th>
                                            <th>N° VOUCHER</th>
                                            <th>MONTO</th>
                                            <th>PAGADO POR</th>
                                            <th>FECHA PAGO</th>
                                            <th>FECHA REGISTRO</th>
                                            <th>OPERACION</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td>1</td>
                                            <td>29130572</td>
                                            <td>RONALD ANDERSON MORENO HINOSTROZA</td>
                                            <td>I-997384</td>
                                            <th>250</th>
                                            <td>LOLA HINOSTROZA PRADO</td>
                                            <td>27/09/2017</td>
                                            <td>28/09/2017</td>
                                            <td><a href="#" class="btn btn-primary" >Modificar</a></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>27130572</td>
                                            <td>RONALD ANDERSON  HINOSTROZA</td>
                                            <td>I-997384</td>
                                            <th>300</th>
                                            <td>LOLA HINOSTROZA PRADO</td>
                                            <td>27/09/2017</td>
                                            <td>28/09/2017</td>
                                            <td><a href="#" class="btn btn-primary" >Modificar</a></td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Nº</th>
                                            <th>CODIGO ALUMNO</th>
                                            <th>NOMBRE ALUMNO</th>
                                            <th>CODIGO VOUCHER</th>
                                            <th>MONTO</th>
                                            <th>PAGADO POR</th>
                                            <th>FECHA PAGO</th>
                                            <th>FECHA REGISTRO</th>
                                            <th>OPERACION</th>
                                        </tr>
                                    </tfoot>

                                </table>
                            </div><!-- /.box-body -->
                        </div><!-- row table -->

                    </div><!-- /.box-body -->
                </div><!-- /.box danger-->

            </div><!-- col-12-->
        </div><!-- row -->

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