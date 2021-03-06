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
            <div class="col-lg-12" id="flotanteCliente" >
                <div class="box">
                    <div class="box-header">
                        <!--  formulario -->
                        <h3 class="titleArticulo">Registro de Materiales de Estudio</h3>
                    </div><!-- /.box-header -->
                    <div class=" "><!-- seccioarticulo grey lighten-3 -->
                        <form class="form_articulo" method="post" action="Cliente.jsp" id="formmulario">
                            <div class="row" >
                                <div class="col-lg-6 col-sm-12">
                                    Codigo:<input type="text" name="codigo:" id="codigo:"  class="form-control" value=""
                                                  >
                                    Material:
                                    <select  name="tipodocumento" class="form-control" id="editable-selectMaterial">
                                        <option value="" disabled >Selecione</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    Descripcion<input type="text" name="apellido"  class="form-control" value="">
                                    cantidad:  <input type="text" class="form-control" name="telefono" value="">
                                </div>
                                <div class="col-xs-6">
                                    Categoria:
                                    <select  name="tipodocumento" class="form-control" id="editable-selectcategoria">
                                        <option value="" disabled >Selecione</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                    </select>
                                    Fecha registro: <input type="date" class="form-control" name="telefono" value="">
                                </div>
                                <div class="col-xs-6">
                                    Precio venta:  <input type="text" class="form-control" name="telefono" value="">
                                    
                                </div>

                                <div class="col-xs-12" style="margin-bottom: 20px;">
                                    <br>
                                    <button class="btn btn-primary" type="submit" name="guardar" id="guardar">Guardar</button>
                                    <button class="btn btn-primary" type="reset" name="cancelar">CANCELAR</button>
                                    <input class="btn btn-success"  type="button"   name="salir" id="salir" 
                               onClick="flotanteCliente(2)"value="Salir" style="float: right;margin-right:30px;width:100px;color:#fff;"/>
                                </div>
                            </div><!-- div row -->
                        </form>
                    </div><!--  fin formulario -->

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
                       id="agregarCl" onClick="flotanteCliente(1)" style="width: 200px;" >Agregar Materiales de estudio</a>
                </div>
            </div>
        </form>
    </div><!--  fin formulario -->

    <!-- Content Header (Page header) -->


    <!-- Main content -->
    <section class="content" >
        <div class="row">
            <div class="col-xs-12" >
                <div class="box box-success" >
                    <div class="box-header" style="padding: 10px;">
                        <h4 >
                            <!--INICIO-->
                            Listado de materiales de estudio
                        </h4>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead style=" ">
                                <tr>
                                    <th>N�</th>
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
                                    <th>N�</th>
                                    <th>NOMBRE Y APELLIDO</th>
                                    <th>TIPO DOC:</th>
                                    <th>N� DOCUMENTO</th>
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