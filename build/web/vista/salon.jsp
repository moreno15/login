<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.*"%>
<%@page import="clases.*"%>
<jsp:include page = "header.jsp" />

<%
    String msm = "";
    String err = "";
    // iniciallizando los datos 
    String tipo = "";
    String grado = "";
    String seccion = "";
    boolean guardar = false;// llamar al boton

    //
    if (request.getParameter("guardar") != null) {
        guardar = true;
    }
    if (request.getParameter("guardar") != null) {
        guardar = true;
    }
    if (request.getParameter("tipo") != null) {
        tipo = request.getParameter("tipo");
    }
    if (request.getParameter("grado") != null) {
        grado = request.getParameter("grado");
    }
    if (request.getParameter("seccion") != null) {
        seccion = request.getParameter("seccion");
    }
    if (session.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
    } else {

        if (guardar) {
            OperacionAlula op = new OperacionAlula();
            Salon salon = new Salon(grado, seccion, tipo);
            msm = op.registrar(salon);
            
            if (msm.equals("0")) {
                msm="Intentas duplicar datos intente nuevamente";
                err= "alert alert-danger";
            }
            if (msm.equals("1")) {
                msm = "se guardo corectamente el dato";
                err= "alert alert-success";
            }
            if (msm.equals("2")) {
                msm = "complte todo los campos teniendo en cuanta que SECUNDARIA ES HASTA QUINTO GRADO";
                err = "alert alert-danger";
            }
            if (msm.equals("3")) {
                msm = "complte todo los campos teniendo en cuanta que SECUNDARIA ES HASTA QUINTO GRADO";
                err = "alert alert-danger";
            }

        }

    }//fin de valida session

%>

<aside class="right-side">



    <!-- Main content -->
    <section class="content" >
        <div class="row">
            <div class="col-xs-12" >
                <div class="box" >
                    <div class="box-header">
                        <h3 class="titleArticulo">Registro de los salones</h3>
                    </div><!-- /.box-header -->
                    <div class="seccioarticulo grey lighten-3" style="margin-bottom: 40px;">
                        <form class="" method="post" action="salon.jsp" id="formmulario">
                            <div class="<%=err%>" role="alert">
                                <strong><%=msm%></strong> 
                            </div>
                            <div class="row" style="width:90%;margin-left:20px;">
                                <div class="col-xs-6">
                                    Tipo:
                                    <select  name="tipo" class="form-control">
                                        <option value="" disabled  selected>Selecione</option>
                                        <option value="PRIMARIA">PRIMARIA</option>
                                        <option value="SECUNDARIA">SECUNDARIA</option>

                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    Grado:
                                    <select  name="grado" class="form-control" >
                                        <option value="0" disabled  >Selecione</option>
                                        <option value="1" selected>Primer grado</option>
                                        <option value="2">Segundo grado</option>
                                        <option value="3">Tercero grado</option>
                                        <option value="4">Cuarto grado</option>
                                        <option value="5">Quinto grado</option>
                                        <option value="6">Sexto grado</option>

                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    Seccion:
                                    <select  name="seccion" class="form-control" >
                                        <option value="" disabled selected>Selecione</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                    </select>
                                </div>
                                <div class="col-xs-12">
                                    <br>
                                    <button class="btn btn-primary" type="submit" name="guardar" id="guardar">Guardar</button>
                                    <button class="btn btn-primary" type="reset" name="cancelar">CANCELAR</button>
                                </div>
                            </div><!-- div row -->
                        </form>
                    </div><!--  fin formulario -->
                    <div class="box-body table-responsive">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead style=" ">
                                <tr>
                                    <th>Nº</th>
                                    <th>SALON</th>
                                    <th>SECCION</th>
                                    <th>DESCRIPCION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String sql = "SELECT * FROM aula";
                                    Conexion cn = new Conexion();
                                    Statement st = cn.conectar().createStatement();
                                    ResultSet rs = st.executeQuery(sql);
                                    int i = 0;
                                    while (rs.next()) {

                                        i++;
                                        grado = rs.getString("grado");
                                        seccion = rs.getString("seccion");
                                        tipo = rs.getString("tipo");

                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=grado%></td>
                                    <td><%=seccion%></td>
                                    <td><%=tipo%></td>
                                </tr>
                                <%}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Nº</th>
                                    <th>SALON</th>
                                    <th>SECCION</th>
                                    <th>DESCRIPCION</th>
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