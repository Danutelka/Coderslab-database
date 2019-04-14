--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cinemas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cinemas (
    id bigint NOT NULL,
    name text NOT NULL,
    adress text
);


ALTER TABLE cinemas OWNER TO postgres;

--
-- Name: cinemas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cinemas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cinemas_id_seq OWNER TO postgres;

--
-- Name: cinemas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cinemas_id_seq OWNED BY cinemas.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE movies (
    id bigint NOT NULL,
    name text NOT NULL,
    description text,
    rating double precision
);


ALTER TABLE movies OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movies_id_seq OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movies_id_seq OWNED BY movies.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tickets (
    id bigint NOT NULL,
    quantity bigint DEFAULT '0'::bigint NOT NULL,
    price numeric(5,2) DEFAULT 0.00 NOT NULL
);


ALTER TABLE tickets OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tickets_id_seq OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tickets_id_seq OWNED BY tickets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cinemas ALTER COLUMN id SET DEFAULT nextval('cinemas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movies ALTER COLUMN id SET DEFAULT nextval('movies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets ALTER COLUMN id SET DEFAULT nextval('tickets_id_seq'::regclass);


--
-- Data for Name: cinemas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cinemas (id, name, adress) FROM stdin;
1	Luna	ul. Marszałkowska 28
2	Silver Screen Puławska	Centrum Europlex - ul. Puławska 17
3	Iluzjon Filmoteki Narodowej	ul. Narbutta 50a
4	Etnokino	Ul. Kredytowa 1, Warszawa
5	Multikino Złote Tarasy	ul. Złota 59
6	Kinoteka	pl. Defilad 1
7	Cinema City Promenada	ul. Ostrobramska 75C
8	Praha	ul. Jagielloñska 26
9	Alchemia	ul. Jezuicka 4
10	Muranów	ul. Zamenhofa 1
11	Femina	al. Solidarności 115
\.


--
-- Name: cinemas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cinemas_id_seq', 11, true);


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movies (id, name, description, rating) FROM stdin;
1	Zbuntowana (2015)	Beatrice Prior konfrontuje się z wewnętrznymi demonami i kontynuuje walkę przeciwko ogromnemu sojuszowi, który może spowodować rozpad społeczeństwa.	7
2	Seks, miłość i terapia (2014)	Lambert, seksoholik starający się zerwać z nałogiem, zatrudnia wiecznie niezaspokojoną nimfomankę.	5
3	Ex Machina (2015)	Po wygraniu konkursu programista jednej z największych firm internetowych zostaje zaproszony do posiadłości swojego szefa. Na miejsce okazuje się, że jest częścią eksperymentu. 	8
4	Sils Maria (2014)	Wybitna aktorka podczas kilku dni spędzonych w Alpach ze swoją asystentką na nowo odkrywa siebie. 	7
5	Chappie (2015)	Dwóch gangsterów kradnie policyjnego androida, by wykorzystać go do swoich celów. 	8
6	Kopciuszek (2015)	Po śmierci ojca zła macocha Elli zamienia dziewczynę w służącą. Los Kopciuszka odmieni dopiero Dobra Wróżka.	8
7	Sąsiady (2014)	Ksiądz odwiedza po kolędzie kamienicę, odkrywając tajemnice jej lokatorów. 	3
8	Złota klatka (2013)	Sara, nastolatka z Gwatemali, wyrusza w niebezpieczną podróż do Los Angeles w poszukiwaniu lepszego życia.	9
9	Body/Ciało (2015)	Cyniczny prokurator i jego cierpiąca na anoreksję córka próbują odnaleźć się po tragicznej śmierci najbliższej osoby.	6
10	Fru! (2014)	Ptaszek, który nigdy wcześniej nie wychylił dzioba poza rodzinne gniazdo, zostaje przez pomyłkę przewodnikiem stada.	5
11	Disco Polo (2015)	Młodzi muzycy z prowincji w błyskawiczny sposób zdobywają szczyty list przebojów.	2
12	Asteriks i Obeliks: Osiedle Bogów (2014)	Juliusz Cezar decyduje się na budowę dzielnicy mieszkaniowej dla właścicieli rzymskich i nazywa ją Osiedlem Bogów.	9
13	Ostatnia rodzina (2016)	Tragiczna biografia rodziny Beksińskich: Zdzisława, Zofii i Tomasza.	8
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movies_id_seq', 13, true);


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets (id, quantity, price) FROM stdin;
\.


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tickets_id_seq', 1, true);


--
-- Name: idx_33401_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cinemas
    ADD CONSTRAINT idx_33401_primary PRIMARY KEY (id);


--
-- Name: idx_33410_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movies
    ADD CONSTRAINT idx_33410_primary PRIMARY KEY (id);


--
-- Name: idx_33419_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT idx_33419_primary PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

