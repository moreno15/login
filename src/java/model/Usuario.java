/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ronald
 */
public class Usuario {
    private String name,pass;

    public String getName() {
        return name;
    }

    public String getPass() {
        return pass;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

   public boolean validarUsuario(){
       if (name.equals("admin")&&pass.equals("1234")) {
           return true;
       }else{
           return false;
       }
   }
    
}
