package mcagile.com.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import mcagile.com.domain.Categoria;
import mcagile.com.domain.Cidade;
import mcagile.com.domain.Cliente;
import mcagile.com.domain.Endereco;
import mcagile.com.domain.Estado;
import mcagile.com.domain.ItemPedido;
import mcagile.com.domain.Pagamento;
import mcagile.com.domain.PagamentoComBoleto;
import mcagile.com.domain.PagamentoComCartao;
import mcagile.com.domain.Pedido;
import mcagile.com.domain.Produto;
import mcagile.com.domain.enums.EstadoPagamento;
import mcagile.com.domain.enums.Perfil;
import mcagile.com.domain.enums.TipoCliente;
import mcagile.com.repositories.CategoriaRepository;
import mcagile.com.repositories.CidadeRepository;
import mcagile.com.repositories.ClienteRepository;
import mcagile.com.repositories.EnderecoRepository;
import mcagile.com.repositories.EstadoRepository;
import mcagile.com.repositories.ItemPedidoRepository;
import mcagile.com.repositories.PagamentoRepository;
import mcagile.com.repositories.PedidoRepository;
import mcagile.com.repositories.ProdutoRepository;

@Service
public class DBService {

	@Autowired
	private CategoriaRepository categoriaRepository;

	@Autowired
	private ProdutoRepository produtoRepository;

	@Autowired
	private EstadoRepository estadoRepository;

	@Autowired
	private CidadeRepository cidadeRepository;

	@Autowired
	private ClienteRepository clienteRepository;

	@Autowired
	private EnderecoRepository enderecoRepository;

	@Autowired
	private PedidoRepository pedidoRepository;

	@Autowired
	private PagamentoRepository pagamentoRepository;

	@Autowired
	private ItemPedidoRepository itemPedidoRepository;
	
	@Autowired
	private BCryptPasswordEncoder pe;

	public void instantiateTestDataBase() throws ParseException{

		Categoria cat1 = new Categoria(null, "Informática");
		Categoria cat2 = new Categoria(null, "Escritório");
		Categoria cat3 = new Categoria(null, "Cama, mesa e banho");
		Categoria cat4 = new Categoria(null, "Eletonicos");
		Categoria cat5 = new Categoria(null, "Jardinagem");
		Categoria cat6 = new Categoria(null, "Decoração");
		Categoria cat7 = new Categoria(null, "Perfumaria");
		 

		Produto p1 = new Produto(null, "Computador", 2.00000);
		Produto p2 = new Produto(null, "Impressora", 800.00);
		Produto p3 = new Produto(null, "Mouse", 90.00);
		Produto p4 = new Produto(null, "Mesa de Escritorio", 300.00);
		Produto p5 = new Produto(null, "Toalha", 50.00);
		Produto p6 = new Produto(null, "Colcha", 2000.00);
		Produto p7 = new Produto(null, "Tv True Color", 1200.00);
		Produto p8 = new Produto(null, "Roçadeira", 800.00);
		Produto p9 = new Produto(null, "Abajour", 100.00);
		Produto p10 = new Produto(null, "Pendente", 180.00);
		Produto p11 = new Produto(null, "Shampoo", 90.00);

		cat1.getProdutos().addAll(Arrays.asList(p1, p2, p3));
		cat2.getProdutos().addAll(Arrays.asList(p2, p4));
		cat3.getProdutos().addAll(Arrays.asList(p5, p6));
		cat4.getProdutos().addAll(Arrays.asList(p1, p2, p3, p7));
		cat5.getProdutos().addAll(Arrays.asList(p8));
		cat6.getProdutos().addAll(Arrays.asList(p9, p10));
		cat7.getProdutos().addAll(Arrays.asList(p11));
		

		p1.getCategorias().addAll(Arrays.asList(cat1, cat4));
		p2.getCategorias().addAll(Arrays.asList(cat1, cat2, cat4));
		p3.getCategorias().addAll(Arrays.asList(cat1, cat4));
		p4.getCategorias().addAll(Arrays.asList(cat2));
		p5.getCategorias().addAll(Arrays.asList(cat3));
		p6.getCategorias().addAll(Arrays.asList(cat3));
		p7.getCategorias().addAll(Arrays.asList(cat4));
		p8.getCategorias().addAll(Arrays.asList(cat5));
		p9.getCategorias().addAll(Arrays.asList(cat6));
		p10.getCategorias().addAll(Arrays.asList(cat6));
		p11.getCategorias().addAll(Arrays.asList(cat7));

		categoriaRepository.saveAll(Arrays.asList(cat1, cat2, cat3, cat4, cat5, cat6, cat7));
		produtoRepository.saveAll(Arrays.asList(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11));

		Estado est1 = new Estado(null, "Pernambuco");
		Estado est2 = new Estado(null, "São Paulo");

		Cidade ci1 = new Cidade(null, "Recife", est1);
		Cidade ci2 = new Cidade(null, "São Paulo", est2);
		Cidade ci3 = new Cidade(null, "Campinas", est2);

		est1.getCidades().addAll(Arrays.asList(ci1));
		est2.getCidades().addAll(Arrays.asList(ci2, ci3));

		estadoRepository.saveAll(Arrays.asList(est1, est2));
		cidadeRepository.saveAll(Arrays.asList(ci1, ci2, ci3));

		Cliente cli1 = new Cliente(null, "Maria Silva", "waltson.silva@hotmail.com", "888888888", TipoCliente.PESSOAJURIDICA,pe.encode("123"));
		Cliente cli2 = new Cliente(null, "Ana Silva", "waltson.dasilva@gmail.com", "888888888", TipoCliente.PESSOAJURIDICA,pe.encode("123"));
		cli2.addPerfil(Perfil.ADMIN);
		
		cli1.getTelefones().addAll(Arrays.asList("123123213213", "993432423"));
		cli2.getTelefones().addAll(Arrays.asList("32323232", "99343286786"));
		Endereco e1 = new Endereco(null, "Rua Flores", "300", "Apto 303", "Jardias", "3113123213", cli1, ci1);
		Endereco e2 = new Endereco(null, "Rua Flores", "300", "Apto 301", "Jardias", "3113123213", cli1, ci2);
		Endereco e3 = new Endereco(null, "Rua Flores", "300", "Apto 302", "Jardias", "3113123213", cli2, ci2);

		cli1.getEnderecos().addAll(Arrays.asList(e1, e2));
		cli1.getEnderecos().addAll(Arrays.asList(e3));


		clienteRepository.saveAll(Arrays.asList(cli1,cli2));
		enderecoRepository.saveAll(Arrays.asList(e1, e2,e3));

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

		Pedido ped1 = new Pedido(null, sdf.parse("30/09/2017 10:32"), cli1, e1);
		Pedido ped2 = new Pedido(null, sdf.parse("10/10/2017 19:35"), cli1, e2);

		Pagamento pagto1 = new PagamentoComCartao(null, EstadoPagamento.QUITADO, ped1, 6);
		ped1.setPagamento(pagto1);

		Pagamento pagto2 = new PagamentoComBoleto(null, EstadoPagamento.PENDENTE, ped2, sdf.parse("20/10/2017 00:00"),
				null);
		ped2.setPagamento(pagto2);

		cli1.getPedidos().addAll(Arrays.asList(ped1, ped2));

		pedidoRepository.saveAll(Arrays.asList(ped1, ped2));
		pagamentoRepository.saveAll(Arrays.asList(pagto1, pagto2));

		ItemPedido ip1 = new ItemPedido(0.00, 1, 2.000, ped1, p1);
		ItemPedido ip2 = new ItemPedido(0.00, 2, 80.00, ped1, p3);
		ItemPedido ip3 = new ItemPedido(100.00, 1, 800.00, ped2, p2);

		ped1.getItens().addAll(Arrays.asList(ip1, ip2));
		ped2.getItens().addAll(Arrays.asList(ip3));

		p1.getItens().addAll(Arrays.asList(ip1));
		p2.getItens().addAll(Arrays.asList(ip3));
		p3.getItens().addAll(Arrays.asList(ip2));

		itemPedidoRepository.saveAll(Arrays.asList(ip1, ip2, ip3));
	}
}
