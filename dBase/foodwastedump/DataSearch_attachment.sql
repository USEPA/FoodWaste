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
-- Name: DataSearch_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataSearch_attachment" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    file character varying(100),
    uploaded_by_id integer NOT NULL
);


ALTER TABLE public."DataSearch_attachment" OWNER TO postgres;

--
-- Name: DataSearch_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataSearch_attachment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataSearch_attachment_id_seq" OWNER TO postgres;

--
-- Name: DataSearch_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataSearch_attachment_id_seq" OWNED BY public."DataSearch_attachment".id;


--
-- Name: DataSearch_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_attachment" ALTER COLUMN id SET DEFAULT nextval('public."DataSearch_attachment_id_seq"'::regclass);


--
-- Data for Name: DataSearch_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DataSearch_attachment" (id, name, file, uploaded_by_id) FROM stdin;
4	US20100071602A1.pdf	dyoung11/attachments/US20100071602A1.pdf	1
5	TestUpload1.txt	uploads/dyoung11/attachments/TestUpload1.txt	1
6	777_libro.pdf	uploads/dyoung11/attachments/777_libro.pdf	1
7	fw_lib_fw_expo2015_fusions_data-set_151015.pdf	uploads/dyoung11/attachments/fw_lib_fw_expo2015_fusions_data-set_151015.pdf	1
8	1-s2.0-S0045653519321198-main.pdf	uploads/dyoung11/attachments/1-s2.0-S0045653519321198-main.pdf	1
\.


--
-- Name: DataSearch_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_attachment_id_seq"', 8, true);


--
-- Name: DataSearch_attachment DataSearch_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_attachment"
    ADD CONSTRAINT "DataSearch_attachment_pkey" PRIMARY KEY (id);


--
-- Name: DataSearch_attachment_uploaded_by_id_c3c14fa9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_attachment_uploaded_by_id_c3c14fa9" ON public."DataSearch_attachment" USING btree (uploaded_by_id);


--
-- Name: DataSearch_attachment DataSearch_attachment_uploaded_by_id_c3c14fa9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_attachment"
    ADD CONSTRAINT "DataSearch_attachment_uploaded_by_id_c3c14fa9_fk_auth_user_id" FOREIGN KEY (uploaded_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

