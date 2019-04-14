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
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE games (
    id bigint NOT NULL,
    team_home bigint,
    team_home_goals bigint,
    team_away bigint,
    team_away_goals bigint
);


ALTER TABLE games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE games_id_seq OWNED BY games.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE teams (
    id bigint NOT NULL,
    name text NOT NULL,
    points bigint
);


ALTER TABLE teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY games ALTER COLUMN id SET DEFAULT nextval('games_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY games (id, team_home, team_home_goals, team_away, team_away_goals) FROM stdin;
17	1	0	4	1
18	1	1	5	0
19	1	3	6	0
20	1	5	8	0
21	1	1	9	0
22	1	1	10	0
23	1	3	14	2
24	1	3	16	2
25	2	2	1	1
26	2	2	4	0
27	2	2	5	0
28	2	0	6	1
29	2	2	9	1
30	2	2	14	1
31	2	5	16	2
32	3	1	1	3
33	3	1	2	5
34	3	1	4	1
35	3	3	7	2
36	3	4	12	1
37	3	5	16	2
38	4	0	5	2
39	4	2	6	0
40	4	1	7	1
41	4	4	9	3
42	4	2	11	0
43	4	1	14	1
44	4	4	15	3
48	5	1	3	2
49	5	0	7	0
50	5	2	8	3
51	5	3	9	1
52	5	0	10	3
53	5	1	11	0
54	5	2	15	0
55	6	2	3	3
56	6	1	5	3
57	6	1	8	1
58	6	0	9	1
59	6	2	10	1
60	6	1	11	0
61	6	4	13	0
62	6	4	14	1
63	7	1	1	2
64	7	0	2	4
65	7	1	6	0
66	7	1	11	1
67	7	2	12	0
68	7	1	14	2
69	7	0	16	1
70	8	0	3	2
71	8	0	4	0
72	8	0	7	2
73	8	1	10	2
74	8	0	11	1
75	8	2	12	3
76	8	3	13	0
77	8	5	15	1
78	9	2	3	5
79	9	0	7	0
80	9	1	8	1
81	9	2	10	1
82	9	1	11	2
83	9	4	13	0
84	9	4	15	2
85	10	0	2	0
86	10	1	3	3
87	10	2	4	6
88	10	3	7	1
89	10	2	11	1
90	10	1	12	0
91	10	2	13	2
92	10	0	15	4
93	11	2	1	3
94	11	1	2	0
95	11	0	5	1
96	11	5	12	0
97	11	2	14	2
98	11	3	16	2
99	12	1	1	1
100	12	1	2	5
101	12	2	4	1
102	12	1	5	2
103	12	0	6	0
104	12	0	9	5
105	12	3	14	1
106	12	2	16	1
107	13	1	1	2
108	13	0	2	2
109	13	1	4	5
110	13	0	7	2
111	13	2	11	1
112	13	2	12	1
113	13	1	15	0
114	13	3	16	1
115	14	0	3	5
116	14	2	5	3
117	14	2	8	3
118	14	1	9	1
119	14	2	10	1
120	14	1	13	1
121	14	3	15	2
122	15	0	1	1
123	15	1	2	3
124	15	1	6	0
125	15	0	7	3
126	15	3	11	2
127	15	1	12	4
128	15	2	16	1
129	16	1	3	3
130	16	0	4	2
131	16	0	5	4
132	16	1	6	4
133	16	1	8	3
134	16	3	9	0
135	16	2	10	1
136	16	4	14	0
\.


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('games_id_seq', 136, true);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY teams (id, name, points) FROM stdin;
1	Piast Piastów	37
2	Perła Złotokłos	34
3	LKS Chlebnia	34
4	Naprzód Brwinów	28
5	KS Teresin	26
6	Józefovia Józefów	20
7	Okęcie Warszawa	19
8	Żyrardowianka Żyrardów	18
9	Przyszłość Włochy	18
10	Ryś Laski	17
11	SEMP Ursynów	17
12	Promyk Nowa Sucha	15
13	Świt Warszawa	13
14	FC Lesznowola	12
15	Pogoń II Grodzisk Mazowiecki	12
16	Milan Milanówek	12
\.


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('teams_id_seq', 16, true);


--
-- Name: idx_33439_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY games
    ADD CONSTRAINT idx_33439_primary PRIMARY KEY (id);


--
-- Name: idx_33445_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT idx_33445_primary PRIMARY KEY (id);


--
-- Name: idx_33439_fk_games_1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_33439_fk_games_1_idx ON games USING btree (team_home);


--
-- Name: idx_33439_fk_games_2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_33439_fk_games_2_idx ON games USING btree (team_away);


--
-- Name: fk_games_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY games
    ADD CONSTRAINT fk_games_1 FOREIGN KEY (team_home) REFERENCES teams(id);


--
-- Name: fk_games_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY games
    ADD CONSTRAINT fk_games_2 FOREIGN KEY (team_away) REFERENCES teams(id);


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

