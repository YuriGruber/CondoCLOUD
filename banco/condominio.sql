--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2024-03-12 15:31:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 32842)
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    id_area integer NOT NULL,
    nome_area text NOT NULL
);


ALTER TABLE public.area OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32841)
-- Name: area_id_area_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.area_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.area_id_area_seq OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_id_area_seq OWNED BY public.area.id_area;


--
-- TOC entry 216 (class 1259 OID 32833)
-- Name: condominio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condominio (
    id_condominio integer NOT NULL,
    nome_condominio text NOT NULL
);


ALTER TABLE public.condominio OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32832)
-- Name: condominio_id_condominio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.condominio_id_condominio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.condominio_id_condominio_seq OWNER TO postgres;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 215
-- Name: condominio_id_condominio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.condominio_id_condominio_seq OWNED BY public.condominio.id_condominio;


--
-- TOC entry 219 (class 1259 OID 32850)
-- Name: estrutura_condominio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estrutura_condominio (
    id_condominio integer NOT NULL,
    id_area integer NOT NULL
);


ALTER TABLE public.estrutura_condominio OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32878)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    id_area integer NOT NULL,
    id_usuario integer NOT NULL,
    id_condominio integer NOT NULL,
    data date NOT NULL
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32877)
-- Name: reserva_id_reserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reserva_id_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reserva_id_reserva_seq OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 222
-- Name: reserva_id_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reserva_id_reserva_seq OWNED BY public.reserva.id_reserva;


--
-- TOC entry 221 (class 1259 OID 32864)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_condominio integer NOT NULL,
    nome_usuario text NOT NULL,
    senha text NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32863)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 220
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 4708 (class 2604 OID 41025)
-- Name: area id_area; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area ALTER COLUMN id_area SET DEFAULT nextval('public.area_id_area_seq'::regclass);


--
-- TOC entry 4707 (class 2604 OID 41026)
-- Name: condominio id_condominio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio ALTER COLUMN id_condominio SET DEFAULT nextval('public.condominio_id_condominio_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 41027)
-- Name: reserva id_reserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva ALTER COLUMN id_reserva SET DEFAULT nextval('public.reserva_id_reserva_seq'::regclass);


--
-- TOC entry 4709 (class 2604 OID 41028)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 4871 (class 0 OID 32842)
-- Dependencies: 218
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (id_area, nome_area) FROM stdin;
1	churrasqueira
2	quadra de esportes
3	salão de festas
4	salão de dança
5	Espaço Zen
\.


--
-- TOC entry 4869 (class 0 OID 32833)
-- Dependencies: 216
-- Data for Name: condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.condominio (id_condominio, nome_condominio) FROM stdin;
1	Marisol
2	Vila Campestre
\.


--
-- TOC entry 4872 (class 0 OID 32850)
-- Dependencies: 219
-- Data for Name: estrutura_condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estrutura_condominio (id_condominio, id_area) FROM stdin;
1	1
1	2
1	3
2	2
2	4
1	1
1	2
1	3
2	2
2	4
1	1
1	2
1	3
2	2
2	4
\.


--
-- TOC entry 4876 (class 0 OID 32878)
-- Dependencies: 223
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reserva (id_reserva, id_area, id_usuario, id_condominio, data) FROM stdin;
48	3	1	1	2024-04-03
49	3	1	1	2024-04-11
50	2	1	1	2024-04-04
2	1	1	1	2024-01-28
5	3	1	1	2024-01-27
6	4	1	2	2024-01-27
18	3	1	1	2024-03-24
30	1	1	1	2024-03-21
31	1	1	1	2024-03-22
36	3	1	1	2024-03-22
39	2	1	1	2024-01-30
40	1	1	1	2024-02-20
\.


--
-- TOC entry 4874 (class 0 OID 32864)
-- Dependencies: 221
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, id_condominio, nome_usuario, senha) FROM stdin;
1	1	Yuri	123
2	2	Biu	234
\.


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_id_area_seq', 5, true);


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 215
-- Name: condominio_id_condominio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condominio_id_condominio_seq', 2, true);


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 222
-- Name: reserva_id_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reserva_id_reserva_seq', 40, true);


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 220
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 2, true);


--
-- TOC entry 4714 (class 2606 OID 32849)
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id_area);


--
-- TOC entry 4712 (class 2606 OID 32840)
-- Name: condominio condominio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_pkey PRIMARY KEY (id_condominio);


--
-- TOC entry 4718 (class 2606 OID 32883)
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);


--
-- TOC entry 4716 (class 2606 OID 32871)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4719 (class 2606 OID 32858)
-- Name: estrutura_condominio estrutura_condominio_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estrutura_condominio
    ADD CONSTRAINT estrutura_condominio_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.area(id_area);


--
-- TOC entry 4720 (class 2606 OID 32853)
-- Name: estrutura_condominio estrutura_condominio_id_condominio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estrutura_condominio
    ADD CONSTRAINT estrutura_condominio_id_condominio_fkey FOREIGN KEY (id_condominio) REFERENCES public.condominio(id_condominio);


--
-- TOC entry 4722 (class 2606 OID 32884)
-- Name: reserva reserva_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.area(id_area);


--
-- TOC entry 4723 (class 2606 OID 32894)
-- Name: reserva reserva_id_condominio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_condominio_fkey FOREIGN KEY (id_condominio) REFERENCES public.condominio(id_condominio);


--
-- TOC entry 4724 (class 2606 OID 32889)
-- Name: reserva reserva_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- TOC entry 4721 (class 2606 OID 32872)
-- Name: usuario usuario_id_condominio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_condominio_fkey FOREIGN KEY (id_condominio) REFERENCES public.condominio(id_condominio);


-- Completed on 2024-03-12 15:31:32

--
-- PostgreSQL database dump complete
--

