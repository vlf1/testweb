
<%@page import="testweb.Passageiro"%>
<%@page import="testweb.Bancodados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      

    <title>Passageiro</title>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/teste.css" rel="stylesheet" media="screen">
    
  </head>
  
  <body background = "img/fundo.jpg">
      <h1 class="container cant" style="text-align: center ; background: #ccc ">Cadastro Cliente</h1>
      <br>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
     <%try{
       
        boolean verif ;
         
         
         if (request.getParameter("enviar")!=null){
             
            String nome= request.getParameter("nome");
            String cpf= request.getParameter("cpf");
            String datanasc = request.getParameter("datanasc");
            String sexo = request.getParameter("gender");
            verif = Bancodados.ErroDuploRegPassageiro(cpf);
            if(verif == true){
            Passageiro a = new Passageiro();
            a.setNome(nome);
            a.setCpf(cpf);
            a.setDatanasc(datanasc);
            a.setSexo(sexo);
           
            
            Bancodados.getpassageiros().add(a); }else{%><div class="alert-dismissable alert-danger cent"><h4>Erro - CPF ja Cadastrado</h4><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div><%}
            
         }else if(request.getParameter("remove")!=null){
             int i=Integer.parseInt(request.getParameter("i"));
            Bancodados.getpassageiros().remove(i);
        } 
          
     %>
    
    
    <div class="container conteudo cant " style="text-align: center; background: #ccc ;  ">
      <div class= "jumbotron ">
        <form>
          <fieldset>
              <table align = "center" style="text-align: left">
                        <tr>
                            <td><h3>Nome : </h3> </td>  
                            <td><input class="input-block-level" type="text" name="nome" value="" placeholder="Vinicius Loreto" required></td>
                        </tr>
                        <tr> 
                            <td><h3>CPF : </h3></td>
                            <td><input class="inpu-block-level" type="text" name="cpf" value="" placeholder="33141020891" required></td>
                        </tr>
                        <tr>
                            <td><h3>Data de Nascimento: </h3></td>
                            <td><input class="input-block-level" type="date" name="datanasc" value="" required></td>
                        </tr>
                        <tr>
                            <td><h3>Sexo : </h3></td>
                            <td><input class="input-block-level" type="radio" name="gender" value="Masculino" checked> Male<br>
                                <input class="input-block-level" type="radio" name="gender" value="Feminino"> Female<br>
                                
                        </tr>
                       
              </table>
                    <button type="submit" class="btn btn-inverse" name="enviar">Cadastrar</button>
          </fieldset>
        </form>
            
      </div>
    </div>
    <br>
    <br> 
        <div class="container conteudo cant " style="text-align: center; background: #ccc ;  ">
          <div class= "jumbotron ">
            
            <h2>Lista</h2>
           
            <table class=" table table-striped table-hover"  >
                <tr>
                    <th>Indice</th>
                    <th>Nome </th>
                    <th>CPF </th>
                    <th>DATA NASCIMENTO</th>
                    <th>Sexo</th>
                    <th>Exclusão/Alteração</th>
                </tr>
                                                
                <% for(int i=0; i<Bancodados.getpassageiros().size();i++){ %>
                <% Passageiro o = Bancodados.getpassageiros().get(i);%>
                <tr>
                    <td><%=i+1%></td>
                    <td><%=o.getNome()%></td>
                    <td><%=o.getCpf()%></td>
                    <td><%=o.getDatanasc()%></td>
                    <td><%=o.getSexo()%></td>
                   
                    
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
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
