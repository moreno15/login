<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<jsp:include page = "header.jsp" />

<%
  
    //
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
    } else {

    }//fin de valida session

%>

<aside class="right-side">

    <!-- Main content -->
    <section class="content" >
        <div class="row">
            <div class="col-xs-12" >
                <div class="box" >
                    <div class="box-header">
                        <h3 class="titleArticulo">Registro de los Estudiante</h3>
                    </div><!-- /.box-header -->
                    <div class="  grey lighten-3">
                        <form class="" method="post" name="LoginServlet" id="RegistrarAlumno" action="../RegistrarAlumno" >
                            <div class="col-12" style="padding: 10px;padding-top: 0px;">

                                <div class="col-lg-12">
                                    <h4 style="border-bottom: 1px solid #0000FF;padding: 10px;">Dato Alumno</h4>

                                </div>
                                <div class="col-xs-3">
                                    Documento:<input type="text" name="documento" class="form-control" value=""required>

                                </div>
                                <div class="col-xs-3">
                                    Nombre:<input type="text" name="nombre" id="nombre"  class="form-control" value=""required>


                                </div>
                                <div class="col-xs-3">
                                    Apellido:<input type="text" name="apellido"  class="form-control" value=""required>

                                </div>
                                <div class="col-xs-3">
                                    Domicilio:<input type="text" class="form-control" name="domicilio" value=""required>
                                </div>
                            </div>
                            <div class="col-12" style="padding: 10px;padding-top: 10px;">
                                <div class="col-lg-12">
                                    <h4 style="border-bottom: 1px solid #0000FF;padding: 10px;">Dato Apoderado</h4>

                                </div>
                                <div class="col-xs-4">
                                    Documento:<input type="text" name="documentoA" class="form-control" value=""required>

                                </div>
                                <div class="col-xs-4">
                                    Nombre:<input type="text" name="nombreA" id="nombre"  class="form-control" value=""required>


                                </div>
                                <div class="col-xs-4">
                                    Apellido:<input type="text" name="apellidoA"  class="form-control" value=""required>

                                </div>
                                <div class="col-xs-4">
                                    Domicilio:<input type="text" class="form-control" name="domicilioA" value=""required>
                                </div>
                                <div class="col-xs-4">
                                    Telefono:<input type="text" name="telefonoA"  class="form-control" value=""required>

                                </div>
                            </div>
                            <div class="col-xs-12" style="margin-bottom: 40px;margin-left: 10px;">
                                <br>
                                <button class="btn btn-primary" type="submit" name="guardar" id="guardar">Guardar</button>
                                <button class="btn btn-primary" type="reset" name="cancelar">CANCELAR</button>
                            </div>
                        </form>
                    </div><!--  fin formulario -->
                    <div class="box-body table-responsive">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead style=" background: #31b0d5;">
                                <tr>
                                    <th>Nº</th>
                                    <th>ALUMNO</th>
                                    <th>APODERADO</th>
                                    <th>DIRECCION 1</th>
                                    <th>DIRECCION 2</th>
                                    <th>TELF APODERADO</th>
                                    <th>OPERACION</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td>1</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="#?doc=3423" class="btn btn-primary" >Enviar</a></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nº</th>
                                    <th>ALUMNO</th>
                                    <th>APODERADO</th>
                                    <th>DIRECCION 1</th>
                                    <th>DIRECCION 2</th>
                                    <th>TELF APOD 2</th>
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