--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 10.11

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

SET default_with_oids = false;

--
-- Name: DataSearch_existingdatasource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataSearch_existingdatasource" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."DataSearch_existingdatasource" OWNER TO postgres;

--
-- Name: DataSearch_existingdatasource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataSearch_existingdatasource_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataSearch_existingdatasource_id_seq" OWNER TO postgres;

--
-- Name: DataSearch_existingdatasource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataSearch_existingdatasource_id_seq" OWNED BY public."DataSearch_existingdatasource".id;


--
-- Name: DataSearch_existingdatasource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdatasource" ALTER COLUMN id SET DEFAULT nextval('public."DataSearch_existingdatasource_id_seq"'::regclass);


--
-- Data for Name: DataSearch_existingdatasource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DataSearch_existingdatasource" (id, name) FROM stdin;
1	Abstract
2	Book
3	Book Chapter
4	Computer Product
5	Journal Article
6	Manual
7	Presentation
8	Proceedings
9	Report
10	Scientific Data: Datasets
11	Other
\.


--
-- Name: DataSearch_existingdatasource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_existingdatasource_id_seq"', 11, true);


--
-- Name: DataSearch_existingdatasource DataSearch_existingdatasource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdatasource"
    ADD CONSTRAINT "DataSearch_existingdatasource_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

