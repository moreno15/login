
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<jsp:include page = "header.jsp" />

<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            USUARIO :<br>
            <small>RONALD MORENO HINOSTROZA</small>
            <small>ADMINISTRADOR</small>
        </h1>

    </section> 
    <%
        String userName = "";
        String usuario = "";
        //String sessionID = "";

        /////////////////
        String nombre = "";
        String apellido = "";
        String documento = "";
        String domicilio = "";
        String telefono = "";

        //mensaje de usuario
        String mensaje = "";
        String classerror = "";

        // para datos personales
        String mensajeDato = "";
        String classerrorDato = "";

        //identificando los botones 
        boolean actualizarPass = false;
        boolean guardarDato = false;

        //para los datos del email
        String emailPerfil = "";
        String passPerfil = "";
        String passPerfilN = "";
        //verificamos si exite la session o no.    
        if (session.getAttribute("user") == null) {
            response.sendRedirect("../index.jsp");
        } else {

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                }
            }
            //datos
            String sql = "SELECT * FROM personal p inner join usuario u on "
                    + "p.user=u.user WHERE u.user='" + session.getAttribute("user") + "' ";
            Conexion cn = new Conexion();
            Statement st = cn.conectar().createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                nombre = rs.getString("nombre");
                apellido = rs.getString("apellido");
                documento = rs.getString("codigo");
                domicilio = rs.getString("direccion");
                telefono = rs.getString("telefono");
                usuario = rs.getString("user");
            }

            //mensajs
            if (request.getParameter("actualizarPass") != null) {
                actualizarPass = true;
            }
            if (request.getParameter("guardarDato") != null) {
                guardarDato = true;
            }
            //obtenemos el valor

            if (request.getParameter("emailPerfil") != null) {
                emailPerfil = request.getParameter("emailPerfil");
            }
            if (request.getParameter("passPerfil") != null) {
                passPerfil = request.getParameter("passPerfil");
            }
            if (request.getParameter("passPerfilN") != null) {
                passPerfilN = request.getParameter("passPerfilN");
            }
            // obtenemos dato del telefono y domicilio
            if (request.getParameter("telefono") != null) {
                telefono = request.getParameter("telefono");
            }
            if (request.getParameter("direccion") != null) {
                domicilio = request.getParameter("direccion");
            }
            if (request.getParameter("documento") != null) {
                documento = request.getParameter("documento");
            }

            //Cambiamos la contraseña de  del usuario con el boton actualizar pass
            if (actualizarPass) {
                if (emailPerfil == "") {
                    mensaje = "Ingrese un correo valido";
                    classerror = "alert alert-danger";
                } else {
                    if (!passPerfil.equals(passPerfilN)) {
                        mensaje = "la contrseña no coinciden";
                        classerror = "alert alert-danger";
                    } else {
                        if (passPerfilN.equals("") && passPerfil.equals("")) {
                            mensaje = "el campo contrseña no deben estar vacios";
                            classerror = "alert alert-danger";
                        } else {
                            Conexion cnn = new Conexion();
                            String msm = cnn.setUsuario(emailPerfil, passPerfil);
                            if (msm.equals("error")) {
                                mensaje = msm + ", no se pudo actualizar /el usuario nno existe";
                                classerror = "alert alert-danger";
                            } else {
                                mensaje = msm;
                                classerror = "alert alert-success";

                            }
                        }
                    }
                }
            }

            // evento para cambiar el dato telefono y domicilio del usuraio
            if (guardarDato) {
                if (telefono.equals("")) {
                    mensajeDato = "El telefono no es valido/esta vacio";
                    classerrorDato = "alert alert-danger";
                } else {
                    if (domicilio.equals("")) {
                        mensajeDato = "la direccion esta vacio";
                        classerrorDato = "alert alert-danger";
                    } else {
                        Conexion cnn = new Conexion();
                        String msm = cnn.setUsuarioDato(documento, telefono, domicilio);
                        if (msm.equals("error")) {
                            mensajeDato = msm + ", no se pudo actualizar /Los datos son icorrectos";
                            classerrorDato = "alert alert-danger";
                        } else {
                            mensajeDato = msm;
                            classerrorDato = "alert alert-success";

                        }
                    }
                }
            }

        }//fin verificar sesion

    %>
    <section class="content">

        <div class="row ">
            <div class="col-xs-12">
                <div class="box " id="box-perfil">
                    <div class="box-header">
                    </div><!--nox box header-->
                    <div class="form-perfil">
                        <div class="perfil">
                            <form class="form-perfil" action="usuario.jsp" method="post">

                                <div class="<%=classerrorDato%>">
                                    <strong><%=mensajeDato%></strong>
                                </div>
                                <label>NOMBRE:</label><input type="text" name="nombre" id="nombre"  value="<%=nombre%>" class="form-control" readonly>
                                <label>APELLIDO</label><input type="text" name="apellido" id="apellido" value="<%=apellido%>"  class="form-control" readonly >
                                <label>DOCUMENTO:</label><input type="text" name="documento" id="documento" value="<%=documento%>" class="form-control" readonly>
                                <label>DOMICILIO</label><input type="text" name="direccion" id="direccion" value="<%=domicilio%>" placeholder="nombre" class="form-control">
                                <label>TELEFONO</label><input type="text" name="telefono" id="telefono"  value="<%=telefono%>" placeholder="nombre" class="form-control">
                                <div class="panel-boton">
                                    <button class="btn btn-primary" type="submit" name="guardarDato" id="guardarDato">GUARDAR</button>

                                </div>
                            </form>
                        </div>

                    </div><!-- form perfil -->


                </div>


                <div class="box " id="boxperfil2">
                    <div class="box-header">

                    </div><!-- box header -->
                    <div class="cuenta">
                        <form class="" method="post" action="usuario.jsp">
                            <div class="<%=classerror%>">
                                <strong><%=mensaje%></strong>
                            </div>
                            <label>USUARIO</label><input type="email" name="emailPerfil" id="emailPerfil" value="<%=usuario%>" class="form-control" readonly >
                            <label>CONTRASEÑA</label><input type="password" name="passPerfil" id="passPerfil" value="" class="form-control" >
                            <label>VUELVA A ESCRIBIR LA  CONTRASEÑA</label><input type="password" id="passPerfilN" name="passPerfilN" value="" class="form-control" >
                            <div class="panel-boton">
                                <button class="btn btn-primary" type="submit" id="actualizarPass" name="actualizarPass">Actualizar</button>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- /.content -->
</aside><!-- /.right-side -->

<jsp:include page = "footer.jsp" />