<%@page import="testweb.Bancodados"%>
<%@page import="testweb.Motorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>Motoristas</title>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/teste.css" rel="stylesheet" media="screen">
  </head>
  
  <body background = "img/fundo.jpg">
      <h1 class="container conteudo cant" style="text-align:center; background: #ccc ;">Cadastro Motorista</h1>
      <br>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
    
    
    
    
   <% try{
        
        
        boolean verif;
       
             if(request.getParameter("botao")!=null){
                
                 String nome = request.getParameter("nome");
                 String datanasc = request.getParameter("datanasc");
                 String cpf = request.getParameter("cpf");
                 String modelocarro = request.getParameter("modelocarro");
                 String status = request.getParameter("status");
                 String sexo = request.getParameter("sexo");
                 verif = Bancodados.ErroDuploRegMotorista(cpf);
                 if(verif == true){
                 Motorista motorista = new Motorista();
                 motorista.setNome(nome);
                 motorista.setDatanasc(datanasc);
                 motorista.setCpf(cpf);
                 motorista.setModelocarro(modelocarro);
                 motorista.setStatus(status);
                 motorista.setSexo(sexo);
                 Bancodados.getMotorista().add(motorista);
                 
                 }else{%><div class="alert-dismissable alert-danger cent"><h4>Erro - CPF ja Cadastrado</h4><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div><%}
             }else if(request.getParameter("remove")!=null){
                int i = Integer.parseInt(request.getParameter("i"));
                Bancodados.getMotorista().remove(i);
             }else if(request.getParameter("alterar")!=null){
                int i= Integer.parseInt(request.getParameter("i"));
                   Motorista motorista1 = Bancodados.getMotorista().get(i);
                   if(motorista1.getStatus()=="Ativo"){
                         motorista1.setStatus("Inativo");
                
                   }else{
                         motorista1.setStatus("Ativo");
                    }
                

                
}%>
                <div class="container conteudo cant " style="text-align: center; background: #ccc ;  ">
        <div class= "jumbotron ">
        <form>
          <fieldset>
              <table align = "center" style="text-align: left">
                            <tr>
                                <td><h3>Nome : </h3> </td>  
                                <td><input class="input-block-level" type="text" name="nome" value="" placeholder="Nome Sobrenome"  required></td>
                            </tr>
                            <tr>
                                <td><h3>Data Nascimento :</h3> </td>
                                <td> <input class="input-block-level" type="date" name="datanasc" value=""  required> </td>
                            </tr>
                            <tr>
                                <td><h3>CPF :</h3></td>
                                <td> <input class="input-block-level" type="text" name="cpf" value="" placeholder="33141020890"  required></td>
                            </tr>
                            <tr>
                                <td><h3>Modelo do Carro :</h3></td>
                                <td><input class="input-block-level" type="text" name="modelocarro" value="" placeholder="modelo do carro" required></td>
                            </tr>
                            <tr>
                                <td><h3>Status :</h3></td>
                                <td><input type="radio" name="status" value="Ativo" checked> Ativo<br>
                                <input  type="radio" name="status" value="Inativo"> Inativo<br></td>></td>
                            </tr>
                            <tr>
                                <td><h3>Sexo :</h3></td>
                                <td><input  type="radio" name="sexo" value="Masculino" checked> Masculino<br>
                                <input  type="radio" name="sexo" value="Feminino"> Feminino<br></td>
                            </tr>
              </table>
                        <button type="submit" name="botao" class="btn btn-inverse">Cadastrar</button>
             
          </fieldset>
        </form>
        </div>
                </div>
                            <br><br>
                           
   <div class="container conteudo cant" style="text-align: center; background: #ccc ;  ">
          <div class= "jumbotron ">                         
        
            <h2>Lista</h2>
        <table class="table table-striped table-hover">
            <tr>
                
                <th>Indice</th>
                <th>Nome</th>
                <th>Data Nascimento</th>
                <th>CPF</th>
                <th>Modelo do Carro</th>
                <th>Status</th>
                <th>Sexo</th>
                <th>Excluir/Alterar</th>
                
            </tr>
            <%for(int i=0; i<Bancodados.getMotorista().size();i++){
                Motorista motorista = Bancodados.getMotorista().get(i);%>
                <tr>
                    <td><%=i+1%></td>
                    <td><%=motorista.getNome()%></td>
                    <td><%=motorista.getDatanasc()%></td>
                    <td><%=motorista.getCpf()%></td>
                    <td><%=motorista.getModelocarro()%></td>
                    <td><%=motorista.getStatus()%></td>
                    <td><%=motorista.getSexo()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input class="btn btn-inverse" type="submit" name="remove" value="Excluir"/>
                            <input class="btn btn-inverse" type="submit" name="alterar" value="Ativo/Inativo"/>
                        </form>
                    </td>   
                </tr>
            <%}%>
        </table>
       
    </div>
    </div>
    <br>
    <br>
            <%}catch(Exception ex){%>
            <div><H2>Erro ao Processar o comando: <%=ex.getMessage()%></H2></div>
        <%}%>
        
   
  </body>
</html>
