function flotanteCliente(tipo){

  if (tipo==1){
  $('#contenedorCliente').show();
    $('#flotanteCliente').animate({
      marginTop: "-152px"
    });
  }
  if (tipo==2){
    $('#flotanteCliente').animate({
      marginTop: "-756px"
    });
  setTimeout(function(){
  $('#contenedorCliente').hide();

  },500)
  }

}
