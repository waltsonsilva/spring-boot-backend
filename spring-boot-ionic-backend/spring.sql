--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2018-05-16 15:24:58 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 192 (class 3079 OID 12123)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 192
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 464472)
-- Name: categoria; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE categoria (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE categoria OWNER TO av;

--
-- TOC entry 172 (class 1259 OID 464470)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: av
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_id_seq OWNER TO av;

--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 172
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: av
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- TOC entry 175 (class 1259 OID 464480)
-- Name: cidade; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer
);


ALTER TABLE cidade OWNER TO av;

--
-- TOC entry 174 (class 1259 OID 464478)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: av
--

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cidade_id_seq OWNER TO av;

--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 174
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: av
--

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;


--
-- TOC entry 177 (class 1259 OID 464488)
-- Name: cliente; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE cliente (
    id integer NOT NULL,
    cpf_ou_cnpj character varying(255),
    email character varying(255),
    nome character varying(255),
    tipo integer
);


ALTER TABLE cliente OWNER TO av;

--
-- TOC entry 176 (class 1259 OID 464486)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: av
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_seq OWNER TO av;

--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 176
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: av
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 179 (class 1259 OID 464499)
-- Name: endereco; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE endereco (
    id integer NOT NULL,
    bairro character varying(255),
    cep character varying(255),
    complemento character varying(255),
    logradouro character varying(255),
    numero character varying(255),
    cidade_id integer,
    cliente_id integer
);


ALTER TABLE endereco OWNER TO av;

--
-- TOC entry 178 (class 1259 OID 464497)
-- Name: endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: av
--

CREATE SEQUENCE endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE endereco_id_seq OWNER TO av;

--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 178
-- Name: endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: av
--

ALTER SEQUENCE endereco_id_seq OWNED BY endereco.id;


--
-- TOC entry 181 (class 1259 OID 464510)
-- Name: estado; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE estado (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE estado OWNER TO av;

--
-- TOC entry 180 (class 1259 OID 464508)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: av
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_seq OWNER TO av;

--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 180
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: av
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- TOC entry 182 (class 1259 OID 464516)
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE item_pedido (
    desconto double precision NOT NULL,
    preco double precision NOT NULL,
    quantidade integer,
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL
);


ALTER TABLE item_pedido OWNER TO av;

--
-- TOC entry 183 (class 1259 OID 464521)
-- Name: pagamento; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE pagamento (
    pedido_id integer NOT NULL,
    estado integer
);


ALTER TABLE pagamento OWNER TO av;

--
-- TOC entry 184 (class 1259 OID 464526)
-- Name: pagamento_com_boleto; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE pagamento_com_boleto (
    data_pagamento timestamp without time zone,
    data_vencimento timestamp without time zone,
    pedido_id integer NOT NULL
);


ALTER TABLE pagamento_com_boleto OWNER TO av;

--
-- TOC entry 185 (class 1259 OID 464531)
-- Name: pagamento_com_cartao; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE pagamento_com_cartao (
    numero_parcelas integer,
    pedido_id integer NOT NULL
);


ALTER TABLE pagamento_com_cartao OWNER TO av;

--
-- TOC entry 187 (class 1259 OID 464538)
-- Name: pedido; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE pedido (
    id integer NOT NULL,
    instante timestamp without time zone,
    cliente_id integer,
    endereco_de_entrega_id integer
);


ALTER TABLE pedido OWNER TO av;

--
-- TOC entry 186 (class 1259 OID 464536)
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: public; Owner: av
--

CREATE SEQUENCE pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pedido_id_seq OWNER TO av;

--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 186
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: av
--

ALTER SEQUENCE pedido_id_seq OWNED BY pedido.id;


--
-- TOC entry 189 (class 1259 OID 464546)
-- Name: produto; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE produto (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision
);


ALTER TABLE produto OWNER TO av;

--
-- TOC entry 190 (class 1259 OID 464552)
-- Name: produto_categoria; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE produto_categoria (
    produto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE produto_categoria OWNER TO av;

--
-- TOC entry 188 (class 1259 OID 464544)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: av
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_id_seq OWNER TO av;

--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 188
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: av
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 191 (class 1259 OID 464555)
-- Name: telefone; Type: TABLE; Schema: public; Owner: av; Tablespace: 
--

CREATE TABLE telefone (
    cliente_id integer NOT NULL,
    telefones character varying(255)
);


ALTER TABLE telefone OWNER TO av;

--
-- TOC entry 2209 (class 2604 OID 464475)
-- Name: id; Type: DEFAULT; Schema: public; Owner: av
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- TOC entry 2210 (class 2604 OID 464483)
-- Name: id; Type: DEFAULT; Schema: public; Owner: av
--

ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);


--
-- TOC entry 2211 (class 2604 OID 464491)
-- Name: id; Type: DEFAULT; Schema: public; Owner: av
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 2212 (class 2604 OID 464502)
-- Name: id; Type: DEFAULT; Schema: public; Owner: av
--

ALTER TABLE ONLY endereco ALTER COLUMN id SET DEFAULT nextval('endereco_id_seq'::regclass);


--
-- TOC entry 2213 (class 2604 OID 464513)
-- Name: id; Type: DEFAULT; Schema: public; Owner: av
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- TOC entry 2214 (class 2604 OID 464541)
-- Name: id; Type: DEFAULT; Schema: public; Owner: av
--

ALTER TABLE ONLY pedido ALTER COLUMN id SET DEFAULT nextval('pedido_id_seq'::regclass);


--
-- TOC entry 2215 (class 2604 OID 464549)
-- Name: id; Type: DEFAULT; Schema: public; Owner: av
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2363 (class 0 OID 464472)
-- Dependencies: 173
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: av
--

COPY categoria (id, nome) FROM stdin;
1	Informática
2	Escritório
3	Cama, mesa e banho
4	Eletonicos
5	Jardinagem
6	Decoração
7	Perfumaria
\.


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 172
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: av
--

SELECT pg_catalog.setval('categoria_id_seq', 7, true);


--
-- TOC entry 2365 (class 0 OID 464480)
-- Dependencies: 175
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: av
--

COPY cidade (id, nome, estado_id) FROM stdin;
1	Recife	1
2	São Paulo	2
3	Campinas	2
\.


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 174
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: av
--

SELECT pg_catalog.setval('cidade_id_seq', 3, true);


--
-- TOC entry 2367 (class 0 OID 464488)
-- Dependencies: 177
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: av
--

COPY cliente (id, cpf_ou_cnpj, email, nome, tipo) FROM stdin;
1	888888888	marial@gmail.com	Maria Silva	2
\.


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 176
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: av
--

SELECT pg_catalog.setval('cliente_id_seq', 1, true);


--
-- TOC entry 2369 (class 0 OID 464499)
-- Dependencies: 179
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: av
--

COPY endereco (id, bairro, cep, complemento, logradouro, numero, cidade_id, cliente_id) FROM stdin;
1	Jardias	3113123213	Apto 303	Rua Flores	300	1	1
2	Jardias	3113123213	Apto 303	Rua Flores	300	2	1
\.


--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 178
-- Name: endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: av
--

SELECT pg_catalog.setval('endereco_id_seq', 2, true);


--
-- TOC entry 2371 (class 0 OID 464510)
-- Dependencies: 181
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: av
--

COPY estado (id, nome) FROM stdin;
1	Pernambuco
2	São Paulo
\.


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 180
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: av
--

SELECT pg_catalog.setval('estado_id_seq', 2, true);


--
-- TOC entry 2372 (class 0 OID 464516)
-- Dependencies: 182
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: av
--

COPY item_pedido (desconto, preco, quantidade, pedido_id, produto_id) FROM stdin;
0	2	1	1	1
0	80	2	1	3
100	800	1	2	2
\.


--
-- TOC entry 2373 (class 0 OID 464521)
-- Dependencies: 183
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: av
--

COPY pagamento (pedido_id, estado) FROM stdin;
1	2
2	1
\.


--
-- TOC entry 2374 (class 0 OID 464526)
-- Dependencies: 184
-- Data for Name: pagamento_com_boleto; Type: TABLE DATA; Schema: public; Owner: av
--

COPY pagamento_com_boleto (data_pagamento, data_vencimento, pedido_id) FROM stdin;
\N	2017-10-20 00:00:00	2
\.


--
-- TOC entry 2375 (class 0 OID 464531)
-- Dependencies: 185
-- Data for Name: pagamento_com_cartao; Type: TABLE DATA; Schema: public; Owner: av
--

COPY pagamento_com_cartao (numero_parcelas, pedido_id) FROM stdin;
6	1
\.


--
-- TOC entry 2377 (class 0 OID 464538)
-- Dependencies: 187
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: av
--

COPY pedido (id, instante, cliente_id, endereco_de_entrega_id) FROM stdin;
1	2017-09-30 10:32:00	1	1
2	2017-10-10 19:35:00	1	2
\.


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 186
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: av
--

SELECT pg_catalog.setval('pedido_id_seq', 2, true);


--
-- TOC entry 2379 (class 0 OID 464546)
-- Dependencies: 189
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: av
--

COPY produto (id, nome, preco) FROM stdin;
1	Computador	2
2	Impressora	800
3	Mouse	90
4	Mesa de Escritorio	300
5	Toalha	50
6	Colcha	2000
7	Tv True Color	1200
8	Roçadeira	800
9	Abajour	100
10	Pendente	180
11	Shampoo	90
\.


--
-- TOC entry 2380 (class 0 OID 464552)
-- Dependencies: 190
-- Data for Name: produto_categoria; Type: TABLE DATA; Schema: public; Owner: av
--

COPY produto_categoria (produto_id, categoria_id) FROM stdin;
1	1
1	4
2	1
2	2
2	4
3	1
3	4
4	2
5	3
6	3
7	4
8	5
9	6
10	6
11	7
\.


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 188
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: av
--

SELECT pg_catalog.setval('produto_id_seq', 11, true);


--
-- TOC entry 2381 (class 0 OID 464555)
-- Dependencies: 191
-- Data for Name: telefone; Type: TABLE DATA; Schema: public; Owner: av
--

COPY telefone (cliente_id, telefones) FROM stdin;
1	993432423
1	123123213213
\.


--
-- TOC entry 2217 (class 2606 OID 464477)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2219 (class 2606 OID 464485)
-- Name: cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 464496)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 464507)
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- TOC entry 2227 (class 2606 OID 464515)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2229 (class 2606 OID 464520)
-- Name: item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (pedido_id, produto_id);


--
-- TOC entry 2233 (class 2606 OID 464530)
-- Name: pagamento_com_boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT pagamento_com_boleto_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2235 (class 2606 OID 464535)
-- Name: pagamento_com_cartao_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT pagamento_com_cartao_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2231 (class 2606 OID 464525)
-- Name: pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 2237 (class 2606 OID 464543)
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 2239 (class 2606 OID 464551)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2223 (class 2606 OID 464559)
-- Name: uk_cmxo70m08n43599l3h0h07cc6; Type: CONSTRAINT; Schema: public; Owner: av; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT uk_cmxo70m08n43599l3h0h07cc6 UNIQUE (email);


--
-- TOC entry 2251 (class 2606 OID 464615)
-- Name: fk1c0y58d3n6x3m6euv2j3h64vt; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fk1c0y58d3n6x3m6euv2j3h64vt FOREIGN KEY (produto_id) REFERENCES produto(id);


--
-- TOC entry 2249 (class 2606 OID 464605)
-- Name: fk1fihyy2fnocpuwc74674qmfkv; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk1fihyy2fnocpuwc74674qmfkv FOREIGN KEY (endereco_de_entrega_id) REFERENCES endereco(id);


--
-- TOC entry 2248 (class 2606 OID 464600)
-- Name: fk30s8j2ktpay6of18lbyqn3632; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT fk30s8j2ktpay6of18lbyqn3632 FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 2243 (class 2606 OID 464575)
-- Name: fk60ym08cfoysa17wrn1swyiuda; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- TOC entry 2252 (class 2606 OID 464620)
-- Name: fk8aafha0njkoyoe3kvrwsy3g8u; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk8aafha0njkoyoe3kvrwsy3g8u FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 2241 (class 2606 OID 464565)
-- Name: fk8b1kcb3wucapb8dejshyn5fsx; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8b1kcb3wucapb8dejshyn5fsx FOREIGN KEY (cidade_id) REFERENCES cidade(id);


--
-- TOC entry 2242 (class 2606 OID 464570)
-- Name: fk8s7ivtl4foyhrfam9xqom73n9; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id) REFERENCES cliente(id);


--
-- TOC entry 2246 (class 2606 OID 464590)
-- Name: fkcr74vrxf8nfph0knq2bho8doo; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY pagamento_com_boleto
    ADD CONSTRAINT fkcr74vrxf8nfph0knq2bho8doo FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- TOC entry 2240 (class 2606 OID 464560)
-- Name: fkkworrwk40xj58kevvh3evi500; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fkkworrwk40xj58kevvh3evi500 FOREIGN KEY (estado_id) REFERENCES estado(id);


--
-- TOC entry 2250 (class 2606 OID 464610)
-- Name: fkq3g33tp7xk2juh53fbw6y4y57; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY produto_categoria
    ADD CONSTRAINT fkq3g33tp7xk2juh53fbw6y4y57 FOREIGN KEY (categoria_id) REFERENCES categoria(id);


--
-- TOC entry 2247 (class 2606 OID 464595)
-- Name: fkta3cdnuuxclwfh52t4qi432ow; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY pagamento_com_cartao
    ADD CONSTRAINT fkta3cdnuuxclwfh52t4qi432ow FOREIGN KEY (pedido_id) REFERENCES pagamento(pedido_id);


--
-- TOC entry 2245 (class 2606 OID 464585)
-- Name: fkthad9tkw4188hb3qo1lm5ueb0; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY pagamento
    ADD CONSTRAINT fkthad9tkw4188hb3qo1lm5ueb0 FOREIGN KEY (pedido_id) REFERENCES pedido(id);


--
-- TOC entry 2244 (class 2606 OID 464580)
-- Name: fktk55mn6d6bvl5h0no5uagi3sf; Type: FK CONSTRAINT; Schema: public; Owner: av
--

ALTER TABLE ONLY item_pedido
    ADD CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id) REFERENCES produto(id);


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-05-16 15:24:59 -03

--
-- PostgreSQL database dump complete
--

