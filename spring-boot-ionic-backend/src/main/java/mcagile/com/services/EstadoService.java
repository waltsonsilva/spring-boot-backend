package mcagile.com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mcagile.com.domain.Estado;
import mcagile.com.repositories.EstadoRepository;

@Service
public class EstadoService {

	@Autowired
	private EstadoRepository repo;
	
	public List<Estado> finAll(){
		return repo.findAllByOrderByNome();
	}
}
