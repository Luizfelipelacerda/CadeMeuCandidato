<%-- 
    Document   : index
    Created on : 30/10/2019, 14:19:54
    Author     : Lacerda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body style="background: #fffff1">
        <script>
            $(document).ready(function(){
                $('.modal').modal();
                $.get( "https://dadosabertos.camara.leg.br/api/v2/deputados", function( json ) {
                    //var jsonDeputados = json;
                    console.log(json);
                    console.log(json.dados.length);
                    var deputados = json.dados;
                    var leng = json.dados.length;
                    var i = 0;
                    var text = "";
                    
                    while(i < leng){
                        text = text+"<tr><th><img src="+deputados[i].urlFoto+" width='50' height='75'></th>\n\
                    <th><a href='https://www.google.com'>"+deputados[i].nome+"</a></th><th>"+deputados[i].siglaPartido+"</th>\n\
                    <th>"+deputados[i].siglaUf+"</th><th><buttom class='btn modal-trigger' onClick='detalharDeputado("+deputados[i].id+")' data-target='modal1'>Detalhar</buttom></th></tr>";
                        //console.log(deputados[i].nome);                        
                        i++;
                    }
                    var tabela ="<table class='highlight'><thead><tr><th>Foto</th><th>Nome</th>\n\
                        <th>Partido</th><th>Estado</th></tr></thead><tbody>"+text+"</tbody></table>";
                    $("#divPrincipal").append(tabela);
                  });
            });
            function detalharDeputado(id){
                $.get("https://dadosabertos.camara.leg.br/api/v2/deputados/"+id, function(json){
                    console.log(json);
                    $('#modalholder').remove();
                    var dep = json.dados;
                    var modal = "";
                    modal = "<div id='modalholder'><div class='modal-content row'><div class='col s12'>\n\
                    <h4 class='col s6'><img  src="+dep.ultimoStatus.urlFoto+" width='200' height='300'>\n\
                    </h4><h5 class='col s6'>"+dep.nomeCivil+"</h5></div></div><div class='modal-footer row'>\n\
                    <a href='#!' class='modal-close waves-effect waves-green btn-flat'>Agree</a></div></div>";
                    
                    $("#modal1").append(modal);
                    
                });
            }
        </script>
        
        <h1>Hello World!</h1>
        
        <div id="divPrincipal" class="container">
            <div id="modal1" class="modal">
                
            </div>
        </div>
         
            

    </body>
</html>
