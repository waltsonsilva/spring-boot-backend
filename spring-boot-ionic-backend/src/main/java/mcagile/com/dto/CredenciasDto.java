package mcagile.com.dto;

import java.io.Serializable;

public class CredenciasDto implements Serializable{

	private static final long serialVersionUID = 1L;
	private String email;
	private String senha;
	
	
	public CredenciasDto() {
		
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	

}
