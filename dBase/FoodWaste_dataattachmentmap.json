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
-- Name: FoodWaste_dataattachmentmap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FoodWaste_dataattachmentmap" (
    id integer NOT NULL,
    attachment_id integer NOT NULL,
    data_id integer NOT NULL
);


ALTER TABLE public."FoodWaste_dataattachmentmap" OWNER TO postgres;

--
-- Name: FoodWaste_dataattachmentmap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FoodWaste_dataattachmentmap_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FoodWaste_dataattachmentmap_id_seq" OWNER TO postgres;

--
-- Name: FoodWaste_dataattachmentmap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FoodWaste_dataattachmentmap_id_seq" OWNED BY public."FoodWaste_dataattachmentmap".id;


--
-- Name: FoodWaste_dataattachmentmap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_dataattachmentmap" ALTER COLUMN id SET DEFAULT nextval('public."FoodWaste_dataattachmentmap_id_seq"'::regclass);


--
-- Data for Name: FoodWaste_dataattachmentmap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FoodWaste_dataattachmentmap" (id, attachment_id, data_id) FROM stdin;
3	4	3
5	6	10
6	7	16
7	8	21
\.


--
-- Name: FoodWaste_dataattachmentmap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FoodWaste_dataattachmentmap_id_seq"', 7, true);


--
-- Name: FoodWaste_dataattachmentmap FoodWaste_dataattachmentmap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_dataattachmentmap"
    ADD CONSTRAINT "FoodWaste_dataattachmentmap_pkey" PRIMARY KEY (id);


--
-- Name: FoodWaste_dataattachmentmap_attachment_id_c9f41a70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_dataattachmentmap_attachment_id_c9f41a70" ON public."FoodWaste_dataattachmentmap" USING btree (attachment_id);


--
-- Name: FoodWaste_dataattachmentmap_data_id_d28146ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_dataattachmentmap_data_id_d28146ba" ON public."FoodWaste_dataattachmentmap" USING btree (data_id);


--
-- Name: FoodWaste_dataattachmentmap FoodWaste_dataattach_attachment_id_c9f41a70_fk_FoodWaste; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_dataattachmentmap"
    ADD CONSTRAINT "FoodWaste_dataattach_attachment_id_c9f41a70_fk_FoodWaste" FOREIGN KEY (attachment_id) REFERENCES public."FoodWaste_attachment"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FoodWaste_dataattachmentmap FoodWaste_dataattach_data_id_d28146ba_fk_FoodWaste; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_dataattachmentmap"
    ADD CONSTRAINT "FoodWaste_dataattach_data_id_d28146ba_fk_FoodWaste" FOREIGN KEY (data_id) REFERENCES public."FoodWaste_existingdata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

