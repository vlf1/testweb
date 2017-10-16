
package testweb;



import java.util.ArrayList;
public class Bancodados {
    
   private static ArrayList<Passageiro> passageiros;  
   private static ArrayList<Motorista> motoristas;
   private static ArrayList<Corrida> corridas;
   
 public static ArrayList<Corrida> getCorrida(){
      if(corridas==null){
          corridas = new ArrayList<>();
      }
      return corridas;
  }
  
   
  public static ArrayList<Passageiro> getpassageiros(){
      if(passageiros==null){
          passageiros = new ArrayList<>();
      }
      return passageiros;
  }
  
    public static ArrayList<Motorista> getMotorista(){
        if(motoristas==null){
            motoristas = new ArrayList<>();
        }
        return motoristas;
    }
    
    public static boolean ErroDuploRegPassageiro (String cod){
     int cont = 0 ;
     for(int i=0; i<Bancodados.getpassageiros().size();i++){
         
         if(passageiros.get(i).getCpf() == null ? cod == null : passageiros.get(i).getCpf().equals(cod)){
             cont = 1;
         }
        
     }
        if (cont == 1){
            return false ;
        }
        else{
            return true ;
        }
    }
    public static boolean ErroDuploRegMotorista (String cod1){
     int cont1 = 0 ;
     for(int x=0; x<Bancodados.getMotorista().size();x++){
         
         if(motoristas.get(x).getCpf()== null ? cod1 == null : motoristas.get(x).getCpf().equals(cod1)){
             cont1 = 1;
         }
        
     }
        if (cont1 == 1){
            return false ;
        }
        else{
            return true ;
        }
    }
    
    public static boolean ErroDuploRegMotorista1 (String cpf){
     int cont2 = 0 ;
     for(int x=0; x<Bancodados.getMotorista().size();x++){
         
         if(motoristas.get(x).getCpf()== null ? cpf == null : motoristas.get(x).getCpf().equals(cpf)){
             cont2 = 1;
             
         }
        
     }
        if (cont2 == 1){
            return true ;
        }
        else{
            return false ;
        }
    }
    public static boolean ErroDuploRegPassageiro1 (String cpf1){
     int cont3 = 0 ;
     for(int i=0; i<Bancodados.getpassageiros().size();i++){
         
         if(passageiros.get(i).getCpf() == null ? cpf1 == null : passageiros.get(i).getCpf().equals(cpf1)){
             cont3 = 1;
         }
        
     }
        if (cont3 == 1){
            return true ;
        }
        else{
            return false ;
        }
    }
}