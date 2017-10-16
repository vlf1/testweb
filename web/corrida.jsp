


<%@page import="testweb.Passageiro"%>
<%@page import="testweb.Motorista"%>
<%@page import="testweb.Bancodados"%>
<%@page import="testweb.Corrida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Corrida</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/teste.css" rel="stylesheet" media="screen">
    </head>
    <body background = "img/fundo.jpg">
      <h1 class="container conteudo cant" style="text-align:center; background: #ccc ;">Cadastro de Corrida</h1>
      <br>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
      <%try{
        
        boolean verif;
        boolean verif2;
        boolean verif3 = true;
        String status1 = "Inativo";
        
         
         
         if (request.getParameter("enviar")!=null){
             
            
            String cpfpassageiro= request.getParameter("cpfpassageiro");
            String cpfmotorista = request.getParameter("cpfmotorista");
            float valorcorrida = Float.parseFloat(request.getParameter("valorcorrida"));
            Motorista motorista1 = new Motorista();
            for(int i =0;i>Bancodados.getMotorista().size();i++){
                  
                motorista1 = Bancodados.getMotorista().get(i);
                if(motorista1.getCpf().equals(cpfmotorista)){
                   String status = motorista1.getStatus();
                    if(status != status1){
                        
                        verif3 = false;
                    }}
                }
           
                
            verif =Bancodados.ErroDuploRegMotorista1(cpfmotorista);
            verif2= Bancodados.ErroDuploRegPassageiro1(cpfpassageiro);
           
             if(verif == true && verif2==true && verif3==true){ 
                        Corrida b = new Corrida();
                        b.setCpf_passageiro(cpfpassageiro);
                        b.setCpf_motorista(cpfmotorista);
                        b.setValor_corrida(valorcorrida);
                        Bancodados.getCorrida().add(b); 
            }else{%><div class="alert-dismissable alert-danger cent"><h4>Erro - CPF NAO CADASTRADO/ MOTORISTA INATIVO</h4><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div><%}
                

            }else if(request.getParameter("remove")!=null){
             int i=Integer.parseInt(request.getParameter("i"));
            Bancodados.getCorrida().remove(i);
            }
          
     %>
    
     <div class="container conteudo cant " style="text-align: center; background: #ccc ;  ">
      <div class= "jumbotron ">
        <form>
          <fieldset>
              <table align = "center" style="text-align: left">
                        <tr>
                            <td><h3>CPF do Passageiro: </h3> </td>  
                            <td><input class="input-block-level" type="text" name="cpfpassageiro" value="" placeholder="33141020890" required></td>
                        </tr>
                        <tr> 
                            <td><h3>CPF do Motorista </h3></td>
                            <td><input class="inpu-block-level" type="text" name="cpfmotorista" value="" placeholder="33141020891" required></td>
                        </tr>
                        <tr>
                            <td><h3>Valor da corrida: </h3></td>
                            <td><input class="input-block-level" type="number" name="valorcorrida" value="" requiredd step="0.01" min="0" ></td>
                        </tr>
                       
                       
              </table>
                    <button type="submit" class="btn btn-inverse" name="enviar">Cadastrar</button>
          </fieldset>
        </form>
            
      </div> 
     </div>
         <br><br>
     <div class="container conteudo cant " style="text-align: center; background: #ccc ;  ">
          <div class= "jumbotron ">
            
            <h2>Lista</h2>
           
            <table class=" table table-striped table-hover"  >
                <tr>
                    <th>Indice</th>
                    <th>CPF Passageiro </th>
                    <th>CPF Motorista</th>
                    <th>VALOR CORRIDA</th>
                    <th>Exclusão</th>
                </tr>
                                                
                <% for(int d=0; d<Bancodados.getCorrida().size();d++){ %>
                <% Corrida c = Bancodados.getCorrida().get(d);%>
                <tr>
                    <td><%=d+1%></td>
                    <td><%=c.getCpf_passageiro()%></td>
                    <td><%=c.getCpf_motorista()%></td>
                    <td><%=c.getValor_corrida()%></td>
                    
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=d%>"/>
                            <input class="btn btn-inverse" type="submit" name="remove" value="Excluir"/>
                            
                            
                        </form>
                    </td>
                </tr>
                <%}%>                 
            </table>   
                
             </div>
    </div>
                <%}catch(Exception ex){%>
            <div>Erro ao Processar o comando: <%=ex.getMessage()%></div>
        <%}%>
    
   
    
        
        
    </body>
</html>
