--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2020-02-23 21:28:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 32954)
-- Name: donors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE donors (
    name text,
    email text,
    blood text,
    id integer NOT NULL
);


ALTER TABLE donors OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 32964)
-- Name: donors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE donors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE donors_id_seq OWNER TO postgres;

--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 187
-- Name: donors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE donors_id_seq OWNED BY donors.id;


--
-- TOC entry 186 (class 1259 OID 32962)
-- Name: id_donors; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_donors
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id_donors OWNER TO postgres;

--
-- TOC entry 2004 (class 2604 OID 32966)
-- Name: donors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY donors ALTER COLUMN id SET DEFAULT nextval('donors_id_seq'::regclass);


--
-- TOC entry 2122 (class 0 OID 32954)
-- Dependencies: 185
-- Data for Name: donors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY donors (name, email, blood, id) FROM stdin;
\.


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 187
-- Name: donors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('donors_id_seq', 1, true);


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 186
-- Name: id_donors; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_donors', 1, false);


-- Completed on 2020-02-23 21:28:59

--
-- PostgreSQL database dump complete
--

