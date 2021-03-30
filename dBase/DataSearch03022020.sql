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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


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
-- Name: DataSearch_dataattachmentmap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataSearch_dataattachmentmap" (
    id integer NOT NULL,
    attachment_id integer NOT NULL,
    data_id integer NOT NULL
);


ALTER TABLE public."DataSearch_dataattachmentmap" OWNER TO postgres;

--
-- Name: DataSearch_dataattachmentmap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataSearch_dataattachmentmap_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataSearch_dataattachmentmap_id_seq" OWNER TO postgres;

--
-- Name: DataSearch_dataattachmentmap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataSearch_dataattachmentmap_id_seq" OWNED BY public."DataSearch_dataattachmentmap".id;


--
-- Name: DataSearch_existingdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataSearch_existingdata" (
    id integer NOT NULL,
    work character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(32) NOT NULL,
    search character varying(255) NOT NULL,
    source_title character varying(255),
    disclaimer_req boolean NOT NULL,
    citation character varying(2048) NOT NULL,
    date_accessed timestamp with time zone NOT NULL,
    comments character varying(2048),
    created_by_id integer NOT NULL,
    source_id integer NOT NULL,
    keywords character varying(1024),
    url character varying(255)
);


ALTER TABLE public."DataSearch_existingdata" OWNER TO postgres;

--
-- Name: DataSearch_existingdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataSearch_existingdata_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataSearch_existingdata_id_seq" OWNER TO postgres;

--
-- Name: DataSearch_existingdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataSearch_existingdata_id_seq" OWNED BY public."DataSearch_existingdata".id;


--
-- Name: DataSearch_existingdatasharingteammap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataSearch_existingdatasharingteammap" (
    id integer NOT NULL,
    added_date timestamp with time zone NOT NULL,
    can_edit boolean NOT NULL,
    data_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public."DataSearch_existingdatasharingteammap" OWNER TO postgres;

--
-- Name: DataSearch_existingdatasharingteammap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataSearch_existingdatasharingteammap_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DataSearch_existingdatasharingteammap_id_seq" OWNER TO postgres;

--
-- Name: DataSearch_existingdatasharingteammap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataSearch_existingdatasharingteammap_id_seq" OWNED BY public."DataSearch_existingdatasharingteammap".id;


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
-- Name: FoodWaste_existingdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FoodWaste_existingdata" (
    id integer NOT NULL,
    work character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(32) NOT NULL,
    search character varying(255) NOT NULL,
    source_title character varying(255),
    disclaimer_req boolean NOT NULL,
    citation character varying(2048) NOT NULL,
    date_accessed timestamp with time zone NOT NULL,
    comments character varying(2048),
    created_by_id integer NOT NULL,
    source_id integer NOT NULL,
    keywords character varying(1024),
    url character varying(255)
);


ALTER TABLE public."FoodWaste_existingdata" OWNER TO postgres;

--
-- Name: FoodWaste_existingdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FoodWaste_existingdata_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FoodWaste_existingdata_id_seq" OWNER TO postgres;

--
-- Name: FoodWaste_existingdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FoodWaste_existingdata_id_seq" OWNED BY public."FoodWaste_existingdata".id;


--
-- Name: FoodWaste_existingdatasharingteammap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FoodWaste_existingdatasharingteammap" (
    id integer NOT NULL,
    added_date timestamp with time zone NOT NULL,
    can_edit boolean NOT NULL,
    data_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public."FoodWaste_existingdatasharingteammap" OWNER TO postgres;

--
-- Name: FoodWaste_existingdatasharingteammap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FoodWaste_existingdatasharingteammap_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FoodWaste_existingdatasharingteammap_id_seq" OWNER TO postgres;

--
-- Name: FoodWaste_existingdatasharingteammap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FoodWaste_existingdatasharingteammap_id_seq" OWNED BY public."FoodWaste_existingdatasharingteammap".id;


--
-- Name: FoodWaste_existingdatasource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FoodWaste_existingdatasource" (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."FoodWaste_existingdatasource" OWNER TO postgres;

--
-- Name: FoodWaste_existingdatasource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FoodWaste_existingdatasource_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FoodWaste_existingdatasource_id_seq" OWNER TO postgres;

--
-- Name: FoodWaste_existingdatasource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FoodWaste_existingdatasource_id_seq" OWNED BY public."FoodWaste_existingdatasource".id;


--
-- Name: accounts_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_country (
    id integer NOT NULL,
    country character varying(255),
    abbreviation character varying(4) NOT NULL,
    flag character varying(255)
);


ALTER TABLE public.accounts_country OWNER TO postgres;

--
-- Name: accounts_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_country_id_seq OWNER TO postgres;

--
-- Name: accounts_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_country_id_seq OWNED BY public.accounts_country.id;


--
-- Name: accounts_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_role (
    id integer NOT NULL,
    role character varying(255)
);


ALTER TABLE public.accounts_role OWNER TO postgres;

--
-- Name: accounts_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_role_id_seq OWNER TO postgres;

--
-- Name: accounts_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_role_id_seq OWNED BY public.accounts_role.id;


--
-- Name: accounts_sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_sector (
    id integer NOT NULL,
    sector character varying(255)
);


ALTER TABLE public.accounts_sector OWNER TO postgres;

--
-- Name: accounts_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_sector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_sector_id_seq OWNER TO postgres;

--
-- Name: accounts_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_sector_id_seq OWNED BY public.accounts_sector.id;


--
-- Name: accounts_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_state (
    id integer NOT NULL,
    state character varying(255) NOT NULL,
    abbreviation character varying(4) NOT NULL,
    country_id integer
);


ALTER TABLE public.accounts_state OWNER TO postgres;

--
-- Name: accounts_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_state_id_seq OWNER TO postgres;

--
-- Name: accounts_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_state_id_seq OWNED BY public.accounts_state.id;


--
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userprofile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    affiliation character varying(255),
    job_title character varying(255),
    address_line1 character varying(255),
    address_line2 character varying(255),
    city character varying(255),
    zipcode character varying(255),
    country_id integer,
    role_id integer,
    sector_id integer,
    state_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO postgres;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO postgres;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: flowsa_upload; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flowsa_upload (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    file character varying(100),
    uploaded_at timestamp with time zone NOT NULL,
    uploaded_by_id integer NOT NULL
);


ALTER TABLE public.flowsa_upload OWNER TO postgres;

--
-- Name: flowsa_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flowsa_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flowsa_upload_id_seq OWNER TO postgres;

--
-- Name: flowsa_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flowsa_upload_id_seq OWNED BY public.flowsa_upload.id;


--
-- Name: qar5_division; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_division (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.qar5_division OWNER TO postgres;

--
-- Name: qar5_division_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_division_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_division_id_seq OWNER TO postgres;

--
-- Name: qar5_division_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_division_id_seq OWNED BY public.qar5_division.id;


--
-- Name: qar5_qapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_qapp (
    id integer NOT NULL,
    division_branch character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    qa_category character varying(255) NOT NULL,
    intra_extra character varying(64) NOT NULL,
    revision_number character varying(255) NOT NULL,
    date timestamp with time zone NOT NULL,
    prepared_by_id integer,
    strap character varying(255) NOT NULL,
    tracking_id character varying(255) NOT NULL,
    division_id integer NOT NULL
);


ALTER TABLE public.qar5_qapp OWNER TO postgres;

--
-- Name: qar5_qapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_qapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_qapp_id_seq OWNER TO postgres;

--
-- Name: qar5_qapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_qapp_id_seq OWNED BY public.qar5_qapp.id;


--
-- Name: qar5_qappapproval; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_qappapproval (
    id integer NOT NULL,
    project_plan_title character varying(255) NOT NULL,
    activity_number character varying(255) NOT NULL,
    qapp_id integer NOT NULL
);


ALTER TABLE public.qar5_qappapproval OWNER TO postgres;

--
-- Name: qar5_qappapproval_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_qappapproval_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_qappapproval_id_seq OWNER TO postgres;

--
-- Name: qar5_qappapproval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_qappapproval_id_seq OWNED BY public.qar5_qappapproval.id;


--
-- Name: qar5_qappapprovalsignature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_qappapprovalsignature (
    id integer NOT NULL,
    contractor boolean NOT NULL,
    name character varying(255),
    signature character varying(255),
    date character varying(255),
    qapp_approval_id integer NOT NULL
);


ALTER TABLE public.qar5_qappapprovalsignature OWNER TO postgres;

--
-- Name: qar5_qappapprovalsignature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_qappapprovalsignature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_qappapprovalsignature_id_seq OWNER TO postgres;

--
-- Name: qar5_qappapprovalsignature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_qappapprovalsignature_id_seq OWNED BY public.qar5_qappapprovalsignature.id;


--
-- Name: qar5_qapplead; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_qapplead (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    qapp_id integer NOT NULL
);


ALTER TABLE public.qar5_qapplead OWNER TO postgres;

--
-- Name: qar5_qapplead_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_qapplead_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_qapplead_id_seq OWNER TO postgres;

--
-- Name: qar5_qapplead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_qapplead_id_seq OWNED BY public.qar5_qapplead.id;


--
-- Name: qar5_references; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_references (
    qapp_id integer NOT NULL,
    "references" text
);


ALTER TABLE public.qar5_references OWNER TO postgres;

--
-- Name: qar5_revision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_revision (
    id integer NOT NULL,
    revision character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    effective_date timestamp with time zone NOT NULL,
    initial_version character varying(255) NOT NULL,
    qapp_id integer NOT NULL
);


ALTER TABLE public.qar5_revision OWNER TO postgres;

--
-- Name: qar5_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_revision_id_seq OWNER TO postgres;

--
-- Name: qar5_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_revision_id_seq OWNED BY public.qar5_revision.id;


--
-- Name: qar5_sectiona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectiona (
    qapp_id integer NOT NULL,
    a3 character varying(2047) NOT NULL,
    a4 character varying(2047) NOT NULL,
    a4_chart character varying(100),
    a5 character varying(2047) NOT NULL,
    a6 character varying(2047) NOT NULL,
    a7 character varying(2047) NOT NULL,
    a8 character varying(2047) NOT NULL,
    a9 character varying(2047) NOT NULL,
    a9_drive_path character varying(255) NOT NULL,
    sectionb_type_id integer
);


ALTER TABLE public.qar5_sectiona OWNER TO postgres;

--
-- Name: qar5_sectionb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectionb (
    qapp_id integer NOT NULL,
    b1_2 character varying(2047) NOT NULL,
    b1_3 character varying(2047) NOT NULL,
    b1_4 character varying(2047) NOT NULL,
    b1_5 character varying(2047) NOT NULL,
    b2_1 character varying(2047) NOT NULL,
    b2_2 character varying(2047) NOT NULL,
    b2_3 character varying(2047) NOT NULL,
    b2_4 character varying(2047) NOT NULL,
    b2_5 character varying(2047) NOT NULL,
    b3 character varying(2047) NOT NULL,
    b4 character varying(2047) NOT NULL
);


ALTER TABLE public.qar5_sectionb OWNER TO postgres;

--
-- Name: qar5_sectionbtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectionbtype (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.qar5_sectionbtype OWNER TO postgres;

--
-- Name: qar5_sectionbtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_sectionbtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_sectionbtype_id_seq OWNER TO postgres;

--
-- Name: qar5_sectionbtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_sectionbtype_id_seq OWNED BY public.qar5_sectionbtype.id;


--
-- Name: qar5_sectionc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectionc (
    qapp_id integer NOT NULL,
    c1 character varying(2047) NOT NULL,
    c2 character varying(2047) NOT NULL
);


ALTER TABLE public.qar5_sectionc OWNER TO postgres;

--
-- Name: qar5_sectiond; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectiond (
    qapp_id integer NOT NULL,
    d1 character varying(2047) NOT NULL,
    d2 character varying(2047) NOT NULL,
    d3 character varying(2047) NOT NULL
);


ALTER TABLE public.qar5_sectiond OWNER TO postgres;

--
-- Name: scifinder_upload; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scifinder_upload (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    file character varying(100),
    uploaded_at timestamp with time zone NOT NULL,
    uploaded_by_id integer NOT NULL
);


ALTER TABLE public.scifinder_upload OWNER TO postgres;

--
-- Name: scifinder_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scifinder_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scifinder_upload_id_seq OWNER TO postgres;

--
-- Name: scifinder_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scifinder_upload_id_seq OWNED BY public.scifinder_upload.id;


--
-- Name: support_priority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_priority (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    created_by character varying(255),
    last_modified_by character varying(255),
    the_name character varying(255),
    the_description text,
    weblink character varying(255),
    ordering numeric(10,1),
    user_id integer
);


ALTER TABLE public.support_priority OWNER TO postgres;

--
-- Name: support_priority_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_priority_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.support_priority_id_seq OWNER TO postgres;

--
-- Name: support_priority_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_priority_id_seq OWNED BY public.support_priority.id;


--
-- Name: support_support; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_support (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    make_public boolean NOT NULL,
    share_with_user_group boolean NOT NULL,
    attachment character varying(100),
    the_name character varying(255),
    subject character varying(255),
    length_of_reference character varying(255),
    author character varying(255),
    is_closed boolean NOT NULL,
    the_description text,
    resolution text,
    weblink character varying(255),
    ordering numeric(10,1),
    date_resolved date,
    status character varying(25) NOT NULL,
    review_notes text,
    created_by_id integer,
    last_modified_by_id integer,
    priority_id integer,
    support_type_id integer,
    user_id integer
);


ALTER TABLE public.support_support OWNER TO postgres;

--
-- Name: support_support_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.support_support_id_seq OWNER TO postgres;

--
-- Name: support_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_support_id_seq OWNED BY public.support_support.id;


--
-- Name: support_supportattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_supportattachment (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    created_by character varying(255),
    last_modified_by character varying(255),
    attachment character varying(255),
    the_name character varying(255),
    the_size character varying(255),
    support_id integer,
    user_id integer
);


ALTER TABLE public.support_supportattachment OWNER TO postgres;

--
-- Name: support_supportattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_supportattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.support_supportattachment_id_seq OWNER TO postgres;

--
-- Name: support_supportattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_supportattachment_id_seq OWNED BY public.support_supportattachment.id;


--
-- Name: support_supporttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support_supporttype (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    created_by character varying(255),
    last_modified_by character varying(255),
    the_name character varying(255),
    the_description text,
    weblink character varying(255),
    ordering numeric(10,1),
    user_id integer
);


ALTER TABLE public.support_supporttype OWNER TO postgres;

--
-- Name: support_supporttype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.support_supporttype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.support_supporttype_id_seq OWNER TO postgres;

--
-- Name: support_supporttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.support_supporttype_id_seq OWNED BY public.support_supporttype.id;


--
-- Name: teams_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams_team (
    id integer NOT NULL,
    created_date timestamp with time zone,
    last_modified_date timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    created_by_id integer NOT NULL,
    last_modified_by_id integer
);


ALTER TABLE public.teams_team OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams_team.id;


--
-- Name: teams_teammembership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams_teammembership (
    id integer NOT NULL,
    added_date timestamp with time zone NOT NULL,
    is_owner boolean NOT NULL,
    can_edit boolean NOT NULL,
    member_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.teams_teammembership OWNER TO postgres;

--
-- Name: teams_teammembership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_teammembership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_teammembership_id_seq OWNER TO postgres;

--
-- Name: teams_teammembership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_teammembership_id_seq OWNED BY public.teams_teammembership.id;


--
-- Name: DataSearch_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_attachment" ALTER COLUMN id SET DEFAULT nextval('public."DataSearch_attachment_id_seq"'::regclass);


--
-- Name: DataSearch_dataattachmentmap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_dataattachmentmap" ALTER COLUMN id SET DEFAULT nextval('public."DataSearch_dataattachmentmap_id_seq"'::regclass);


--
-- Name: DataSearch_existingdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdata" ALTER COLUMN id SET DEFAULT nextval('public."DataSearch_existingdata_id_seq"'::regclass);


--
-- Name: DataSearch_existingdatasharingteammap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdatasharingteammap" ALTER COLUMN id SET DEFAULT nextval('public."DataSearch_existingdatasharingteammap_id_seq"'::regclass);


--
-- Name: DataSearch_existingdatasource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdatasource" ALTER COLUMN id SET DEFAULT nextval('public."DataSearch_existingdatasource_id_seq"'::regclass);


--
-- Name: FoodWaste_dataattachmentmap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_dataattachmentmap" ALTER COLUMN id SET DEFAULT nextval('public."FoodWaste_dataattachmentmap_id_seq"'::regclass);


--
-- Name: FoodWaste_existingdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdata" ALTER COLUMN id SET DEFAULT nextval('public."FoodWaste_existingdata_id_seq"'::regclass);


--
-- Name: FoodWaste_existingdatasharingteammap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdatasharingteammap" ALTER COLUMN id SET DEFAULT nextval('public."FoodWaste_existingdatasharingteammap_id_seq"'::regclass);


--
-- Name: FoodWaste_existingdatasource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdatasource" ALTER COLUMN id SET DEFAULT nextval('public."FoodWaste_existingdatasource_id_seq"'::regclass);


--
-- Name: accounts_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_country ALTER COLUMN id SET DEFAULT nextval('public.accounts_country_id_seq'::regclass);


--
-- Name: accounts_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_role ALTER COLUMN id SET DEFAULT nextval('public.accounts_role_id_seq'::regclass);


--
-- Name: accounts_sector id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sector ALTER COLUMN id SET DEFAULT nextval('public.accounts_sector_id_seq'::regclass);


--
-- Name: accounts_state id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_state ALTER COLUMN id SET DEFAULT nextval('public.accounts_state_id_seq'::regclass);


--
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: flowsa_upload id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowsa_upload ALTER COLUMN id SET DEFAULT nextval('public.flowsa_upload_id_seq'::regclass);


--
-- Name: qar5_division id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_division ALTER COLUMN id SET DEFAULT nextval('public.qar5_division_id_seq'::regclass);


--
-- Name: qar5_qapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qapp ALTER COLUMN id SET DEFAULT nextval('public.qar5_qapp_id_seq'::regclass);


--
-- Name: qar5_qappapproval id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappapproval ALTER COLUMN id SET DEFAULT nextval('public.qar5_qappapproval_id_seq'::regclass);


--
-- Name: qar5_qappapprovalsignature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappapprovalsignature ALTER COLUMN id SET DEFAULT nextval('public.qar5_qappapprovalsignature_id_seq'::regclass);


--
-- Name: qar5_qapplead id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qapplead ALTER COLUMN id SET DEFAULT nextval('public.qar5_qapplead_id_seq'::regclass);


--
-- Name: qar5_revision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_revision ALTER COLUMN id SET DEFAULT nextval('public.qar5_revision_id_seq'::regclass);


--
-- Name: qar5_sectionbtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectionbtype ALTER COLUMN id SET DEFAULT nextval('public.qar5_sectionbtype_id_seq'::regclass);


--
-- Name: scifinder_upload id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scifinder_upload ALTER COLUMN id SET DEFAULT nextval('public.scifinder_upload_id_seq'::regclass);


--
-- Name: support_priority id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_priority ALTER COLUMN id SET DEFAULT nextval('public.support_priority_id_seq'::regclass);


--
-- Name: support_support id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_support ALTER COLUMN id SET DEFAULT nextval('public.support_support_id_seq'::regclass);


--
-- Name: support_supportattachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_supportattachment ALTER COLUMN id SET DEFAULT nextval('public.support_supportattachment_id_seq'::regclass);


--
-- Name: support_supporttype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_supporttype ALTER COLUMN id SET DEFAULT nextval('public.support_supporttype_id_seq'::regclass);


--
-- Name: teams_team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_team ALTER COLUMN id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Name: teams_teammembership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_teammembership ALTER COLUMN id SET DEFAULT nextval('public.teams_teammembership_id_seq'::regclass);


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
-- Data for Name: DataSearch_dataattachmentmap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DataSearch_dataattachmentmap" (id, attachment_id, data_id) FROM stdin;
3	4	3
5	6	10
6	7	16
7	8	21
\.


--
-- Data for Name: DataSearch_existingdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DataSearch_existingdata" (id, work, email, phone, search, source_title, disclaimer_req, citation, date_accessed, comments, created_by_id, source_id, keywords, url) FROM stdin;
12	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Plastic Contamination	UK Waste Strategy: Bioeconomy Opportunities Aplenty	f	Bob Horton, Jeremy Tomkinson, and Adrian Higson.Industrial Biotechnology.Apr 2019.ahead of printhttp://doi.org/10.1089/ind.2019.29161.bho	2019-11-04 10:40:33.876546-05		1	5		https://www.liebertpub.com/doi/abs/10.1089/ind.2019.29161.bho?journalCode=ind
1	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Plastic	Co-pyrolysis characteristics and kinetic analysis of organic food waste and plastic	t	https://www.sciencedirect.com/science/article/pii/S0960852417317893	2019-10-25 08:40:43-04	https://www.sciencedirect.com/science/article/pii/S0960852417317893	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0960852417317893/
4	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Recovery	Comparison through a LCA evaluation analysis of food waste disposal options from the perspective of global warming and resource recovery	f	Mi-Hyung Kim, Jung-Wk Kim. Elsevier.  https://www.sciencedirect.com/science/article/pii/S0048969710004456. https://doi.org/10.1016/j.scitotenv.2010.04.049.	2019-10-30 06:23:24-04	Keywords: Food waste management,  Life cycle assessment, Resource recovery, Environmental impacts.	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0048969710004456?via%3Dihub
5	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Recovery Environmental Engineering	Sustainable Management of Coffee and Cocoa Agro-Waste	f	Pushpa S. Murthy (Central Food Technological Research Institute, India), Nivas Manohar Desai (Central Food Technological Research Institute, India) and Siridevi G. B. (Central Food Technological Research Institute, India).	2019-10-30 06:32:37-04	https://www.igi-global.com/chapter/sustainable-management-of-coffee-and-cocoa-agro-waste/222995	1	1	\N	https://www.igi-global.com/chapter/sustainable-management-of-coffee-and-cocoa-agro-waste/222995
6	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	food waste disposal options	Life cycle assessment (LCA) of food waste treatment in Hong Kong: On-site fermentation methodology	f	Journal of Environmental Management. Volume 240, 15 June 2019, Pages 343-351. https://www.sciencedirect.com/science/article/pii/S0301479719304323.	2019-10-30 06:47:29-04	This paper utilizes Life Cycle Assessment (LCA) to determine the environmental impacts associated with this S-FRB technology and identify environmental hotspots to reduce these impacts. In this paper, we have conducted an on-site pilot-scale study for 2 months at a canteen located at the City University of Hong Kong, which resulted in a 90% reduction in the mass of food waste treated in the S-FRB system.	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0301479719304323
8	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Recycle	Recycle food wastes into high quality fish feeds for safe and quality fish production	f	Ming-Hung Wonga, Wing-Yin Mo, Wai-Ming Choi, Zhang Cheng, Yu-Bon Man.  "Recycle food wastes into high quality fish feeds for safe and quality fish production." Elsevier. Environmental Pollution, Volume 219, December 2016, Pages 631-638. https://doi.org/10.1016/j.envpol.2016.06.035.	2019-10-30 14:41:06-04	\N	1	1	\N	https://doi.org/10.1016/j.envpol.2016.06.035
10	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste De-Packaging	The sounding side of materials and products. A sensory interaction revaluated in the user-experience	f	Lerma, Beatrice (2019)  Cuaderno 94. "The sounding side of materials and products. A sensory interaction revaluated in the user-experience." Pages 99 thru 107. Cuaderno 94 |  Centro de Estudios en Diseño y Comunicación (2020/2021). pp 99 - 107  ISSN 1668-0227. Accessed 11/1/2019. https://fido.palermo.edu/servicios_dyc/publicacionesdc/archivos/777_libro.pdf#page=99.	2019-11-01 06:11:49-04	\N	1	1	\N	https://fido.palermo.edu/servicios_dyc/publicacionesdc/archivos/777_libro.pdf#page=99
11	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	plastic waste in food	Feasibility Study on the Application of Fabricated Multipurpose Food Packaging Plastic (MFPP) Liner as Alternative Landfill Liner Material in Sustainable Landfill Infrastructure Model	f	Feasibility Study on the Application of Fabricated Multipurpose Food Packaging Plastic (MFPP) Liner as Alternative Landfill Liner Material in Sustainable Landfill Infrastructure Model. https://www.scientific.net/KEM.821.343.	2019-11-01 08:59:06-04	Multipurpose Food Packaging Plastic (MFPP) is one of the largest residential and commercial solid waste all over the world. BWP is categorized under Non-Biodegradable Plastic Waste (N-BPW). Due to its inability to degrade, this abundance of N-BPW caused space decrement in landfill. Many methods have been proposed for recycling of N-BPW such as incorporating N-BPW into road construction and added material in concrete production. In the present study, the feasibility of using MFPP as landfill liner material is studied through a series of laboratory testing in terms of mechanical and chemical characteristics. The liner sample was prepared in terms of a fabricated layer (combination of 60 layers (Sample A) and 80 layers (Sample B) of a single plastic). The fabricated layers were prepared by applying hot-pressing technique to increase the strength of the surface attachment between each of the layers. The prepared fabricated MFPP liners were tested for Ultimate Tensile Strength Test (UTS), Scanning Electron Microscopy (SEM) and X-Ray Distraction (XRD). The tested samples were then compared with the Conventional Geomembranes (GMs). Obtained results indicated that proposed fabricated MFPP Liner had 70% similar characteristics to GMs. In addition, the fabricated MFPP Liners have an ability to sustain maximum loading higher than Conventional GMs. These desirable characteristics indicated that the fabricated MFPP Liners has potential to be used as landfill liner material.	1	1	\N	https://www.scientific.net/KEM.821.343
13	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	USEEIO model	Method for endogenizing capital in the United States Environmentally‐Extended Input‐Output model	f	https://doi.org/10.1111/jiec.12931	2019-11-06 10:54:23.335089-05	Each year businesses, governments, and homeowners in the United States invest around one fifth of gross domestic product into the creation of capital assets such as buildings, machinery, and software to enable production and consumption.	1	5		https://onlinelibrary.wiley.com/doi/abs/10.1111/jiec.12931
3	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste De-Packaging	Systems and Methods for Enviornmentally Undisruptive Disposal of Food Waste	f	https://patentimages.storage.googleapis.com/5b/19/87/07322cddd0a739/US20100071602A1.pdf	2019-10-25 08:41:05-04	Abstract. A processing facility can dispose of food waste in environmentally un-disruptive manners. The processing facility can convert the food waste into bio-energy and bio-fuel products, such as bio-diesel, ethanol, and electricity. The processing facility can sort the food waste based on the fats or carbohydrates content of the food waste, and the processing facility can include a fluidized bed combustion module for combusting portions of the food waste.	1	1	\N	https://patentimages.storage.googleapis.com/5b/19/87/07322cddd0a739/US20100071602A1.pdf
14	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Laboratory Analysis	Food Analysis Laboratory Manual	f	Nielsen, Suzanne 2017. Food Analysis Laboratory Manual. Springer International Publishing.	2019-12-18 06:27:34.643116-05	This third edition laboratory manual was written to accompany Food Analysis, Fifth Edition, by the same author. New to this third edition of the laboratory manual are four introductory chapters that complement both the textbook chapters and the laboratory exercises.  The 24 laboratory exercises in the manual cover 21 of the 35 chapters in the textbook. DOI: 10.1007/978-3-319-44127-6. ISBN: 9783319441276 (online) 9783319441252 (print).	1	2	Industrial Chemistry/Chemical Engineering, Food Science, Spectroscopy/Spectrometry, Chemistry, Chemical engineering, Food science, Spectroscopy	https://www.springer.com/gp/book/9783319441252#aboutAuthors
15	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Analysis Laboratories in USA	Food Labs and Services	f	N/A	2019-12-18 06:45:10.72643-05	This is a food waste testing lab and we need to add 'OTHER' as an option for SOURCE... placed temporarily under proceedings.	1	8	Testing services, training, consulting, auditing, certification, on-site testing, product design, research, development	https://www.eurofinsus.com/food/
16	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Data Set .xlxs	FUSIONS Food waste data set for EU-28 New Estimates and Environmental Impact	f	N/A	2019-12-19 06:41:07.711969-05	Food waste is an issue of importance to global food security and good environmental governance, directly linked with all aspects of sustainability (e.g. availability of resources, increasing costs and health). The amount of food produced but not consumed leads to negative impacts throughout the food supply chain and households. There is a pressing need to prevent food waste to make the transition to a resource efficient Europe. Previous studies show the necessity for more consistent and comparable data in order to decrease the uncertainties and making it possible to better understand the magnitude of the problem, and the scale of the potential opportunities.	1	1	Food supply chain and Food waste	https://ec.europa.eu/food/sites/food/files/safety/docs/fw_lib_fw_expo2015_fusions_data-set_151015.pdf
17	ORD/CESER/LRTD	young.daniel@epa.gov	513-569-7451	Coffee grounds recycling	17 Genius Ways To Recycle Used Coffee Grounds	f	Editorial Team, Natural Living Ideas.com, https://www.naturallivingideas.com/recycle-used-coffee-grounds/. Accessed January 7, 2020.	2020-01-07 07:50:38.212794-05		1	11	coffee, grounds, reuse	https://www.naturallivingideas.com/recycle-used-coffee-grounds/
18	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	A Winning Formula: Making Connections to Turn Food Waste into Energy	A Winning Formula: Making Connections to Turn Food Waste into Energy	f	N/A	2020-01-08 04:47:55.057339-05	N/A	1	1		https://www.epa.gov/sciencematters/winning-formula-making-connections-turn-food-waste-energy
19	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Sampling	An interdisciplinary living laboratory approach to investigate college food waste co-composting with additional on-site organic waste feedstocks	f	Anne B. Alerding, Jennifer E. DeHart, David K. Kniffin, Nattachat Srikongyos, Michael J. DeBlasio, Jacob M. Kelliher, James A. Marsh, Heather L. Magill, Charles D. Newhouse, Samuel K. Allen, Paul J. Ackerman, and Emily L. Lilly\r\nInternational Journal of Environment and Waste Management 2019 24:1, 61-80.	2020-01-08 06:42:34.418278-05	In an effort to curb the monetary and environmental costs of food waste disposal, colleges and universities are developing composting programs. Incorporating additional on-site wastes could improve composting efficiency and provide cost savings.	1	5	aerated static pile, ASP, bacteria, compost, food waste, living laboratory, waste management, organic waste, co-composting	https://www.inderscienceonline.com/doi/abs/10.1504/IJEWM.2019.100658
20	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	microsplastics in food	Microplastics, a food safety issue?	f	Rainieri S., Barranco A. (2019)  Trends in Food Science and Technology,  84 , pp. 55-57.	2020-01-28 13:43:36.483507-05	Review Description\r\nThe risk posed by microplastics for human and environment, has become a hot topic. The concern is focused not only on the effect of microplastics as such but also on additives and chemical contaminants absorbed by microplastics that may be released and affect negatively animals and environmental health. Despite several works have been written on this topic, a number of knowledge gaps still should be filled to enable a correct risk assessment of this important issue. For example, the relevance of microplastics for food safety has not yet been fully established and scientific results aimed at establishing a possible health risk for contaminants associated with microplastics are rather controversial. The risk assessment of microplastics in foodstuff is still at a very early stage and very few studies on the monitoring of microplastics in foodstuff and their effects on human health are available. Additionally, it is difficult to compare results from different studies as methodologies and study designs are not uniform. For this reason, it is not always possible to reach some definitive conclusion. This work sets out to complement the reviews and statements already existing, by updating the information and identifying if any of the knowledge gaps have been covered and if further ones have been detected with the final aim of properly assessing and managing this emerging risk.	1	5	Microplastics\r\nPOPs\r\nToxicity\r\nNanoplastics\r\nRisk assessment	https://www.sciencedirect.com/science/article/abs/pii/S0924224417303898
21	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Effects of food presence on microplastic ingestion and egestion in Mytilus galloprovincialis	Effects of food presence on microplastic ingestion and egestion in Mytilus galloprovincialis	t	xxx	2020-01-29 09:32:20.168344-05	Research on plastic pollution in marine environments has increased exponentially in the recent decades (Strungaru et al., 2019, Alimba and Faggio, 2019). In particular, small particles of manufactured or weathered plastic (microplastics (MPs), <5 mm), characterized by global abundance, have been studied extensively. MPs are widely distributed and have been monitored in polar regions (Lusher et al., 2015, Waller et al., 2017), tropical regions (Lima et al., 2014, Do Sul et al., 2014), the East (Ng and Obbard, 2006, Isobe et al., 2015), the West (Claessens et al., 2011, Collignon et al., 2012, Alomar et al., 2016, Bellas et al., 2016), coastal areas (de Lucia et al., 2014, Stolte et al., 2015), open seas (Reisser et al., 2014, Romeo et al., 2015), sea surfaces (Song et al., 2014, Song et al., 2015), and the deep sea (Van Cauwenberghe et al., 2013, Taylor et al., 2016).	1	5	Plastic particle, Mussel, Egestion rate, Mytilus gallo, provincialis marine pollution	https://www.sciencedirect.com/science/article/pii/S0045653519320946
\.


--
-- Data for Name: DataSearch_existingdatasharingteammap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DataSearch_existingdatasharingteammap" (id, added_date, can_edit, data_id, team_id) FROM stdin;
1	2019-10-25 11:33:12.790042-04	t	1	4
3	2019-10-25 12:23:33.362041-04	t	3	4
4	2019-10-30 06:23:24.155733-04	t	4	4
5	2019-10-30 06:32:37.226485-04	t	5	4
6	2019-10-30 06:47:29.847967-04	t	6	4
8	2019-10-30 14:41:06.788324-04	t	8	4
10	2019-11-01 06:11:49.756253-04	t	10	4
11	2019-11-01 08:59:06.817628-04	t	11	4
12	2019-11-04 10:40:33.89557-05	t	12	4
13	2019-11-06 10:54:23.393119-05	t	13	18
14	2019-12-18 06:27:34.658056-05	t	14	4
15	2019-12-18 06:45:10.735473-05	t	15	4
16	2019-12-19 06:41:07.734487-05	t	16	4
17	2020-01-07 07:50:38.222305-05	t	17	21
18	2020-01-08 04:47:55.068133-05	t	18	4
19	2020-01-08 06:42:34.429908-05	t	19	4
20	2020-01-28 13:43:36.492337-05	t	20	4
21	2020-01-29 09:32:20.190349-05	t	21	4
\.


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
-- Data for Name: FoodWaste_dataattachmentmap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FoodWaste_dataattachmentmap" (id, attachment_id, data_id) FROM stdin;
3	4	3
5	6	10
6	7	16
7	8	21
\.


--
-- Data for Name: FoodWaste_existingdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FoodWaste_existingdata" (id, work, email, phone, search, source_title, disclaimer_req, citation, date_accessed, comments, created_by_id, source_id, keywords, url) FROM stdin;
12	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Plastic Contamination	UK Waste Strategy: Bioeconomy Opportunities Aplenty	f	Bob Horton, Jeremy Tomkinson, and Adrian Higson.Industrial Biotechnology.Apr 2019.ahead of printhttp://doi.org/10.1089/ind.2019.29161.bho	2019-11-04 10:40:33.876546-05		1	5		https://www.liebertpub.com/doi/abs/10.1089/ind.2019.29161.bho?journalCode=ind
1	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Plastic	Co-pyrolysis characteristics and kinetic analysis of organic food waste and plastic	t	https://www.sciencedirect.com/science/article/pii/S0960852417317893	2019-10-25 08:40:43-04	https://www.sciencedirect.com/science/article/pii/S0960852417317893	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0960852417317893/
4	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Recovery	Comparison through a LCA evaluation analysis of food waste disposal options from the perspective of global warming and resource recovery	f	Mi-Hyung Kim, Jung-Wk Kim. Elsevier.  https://www.sciencedirect.com/science/article/pii/S0048969710004456. https://doi.org/10.1016/j.scitotenv.2010.04.049.	2019-10-30 06:23:24-04	Keywords: Food waste management,  Life cycle assessment, Resource recovery, Environmental impacts.	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0048969710004456?via%3Dihub
5	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Recovery Environmental Engineering	Sustainable Management of Coffee and Cocoa Agro-Waste	f	Pushpa S. Murthy (Central Food Technological Research Institute, India), Nivas Manohar Desai (Central Food Technological Research Institute, India) and Siridevi G. B. (Central Food Technological Research Institute, India).	2019-10-30 06:32:37-04	https://www.igi-global.com/chapter/sustainable-management-of-coffee-and-cocoa-agro-waste/222995	1	1	\N	https://www.igi-global.com/chapter/sustainable-management-of-coffee-and-cocoa-agro-waste/222995
6	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	food waste disposal options	Life cycle assessment (LCA) of food waste treatment in Hong Kong: On-site fermentation methodology	f	Journal of Environmental Management. Volume 240, 15 June 2019, Pages 343-351. https://www.sciencedirect.com/science/article/pii/S0301479719304323.	2019-10-30 06:47:29-04	This paper utilizes Life Cycle Assessment (LCA) to determine the environmental impacts associated with this S-FRB technology and identify environmental hotspots to reduce these impacts. In this paper, we have conducted an on-site pilot-scale study for 2 months at a canteen located at the City University of Hong Kong, which resulted in a 90% reduction in the mass of food waste treated in the S-FRB system.	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0301479719304323
8	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Recycle	Recycle food wastes into high quality fish feeds for safe and quality fish production	f	Ming-Hung Wonga, Wing-Yin Mo, Wai-Ming Choi, Zhang Cheng, Yu-Bon Man.  "Recycle food wastes into high quality fish feeds for safe and quality fish production." Elsevier. Environmental Pollution, Volume 219, December 2016, Pages 631-638. https://doi.org/10.1016/j.envpol.2016.06.035.	2019-10-30 14:41:06-04	\N	1	1	\N	https://doi.org/10.1016/j.envpol.2016.06.035
10	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste De-Packaging	The sounding side of materials and products. A sensory interaction revaluated in the user-experience	f	Lerma, Beatrice (2019)  Cuaderno 94. "The sounding side of materials and products. A sensory interaction revaluated in the user-experience." Pages 99 thru 107. Cuaderno 94 |  Centro de Estudios en Diseño y Comunicación (2020/2021). pp 99 - 107  ISSN 1668-0227. Accessed 11/1/2019. https://fido.palermo.edu/servicios_dyc/publicacionesdc/archivos/777_libro.pdf#page=99.	2019-11-01 06:11:49-04	\N	1	1	\N	https://fido.palermo.edu/servicios_dyc/publicacionesdc/archivos/777_libro.pdf#page=99
11	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	plastic waste in food	Feasibility Study on the Application of Fabricated Multipurpose Food Packaging Plastic (MFPP) Liner as Alternative Landfill Liner Material in Sustainable Landfill Infrastructure Model	f	Feasibility Study on the Application of Fabricated Multipurpose Food Packaging Plastic (MFPP) Liner as Alternative Landfill Liner Material in Sustainable Landfill Infrastructure Model. https://www.scientific.net/KEM.821.343.	2019-11-01 08:59:06-04	Multipurpose Food Packaging Plastic (MFPP) is one of the largest residential and commercial solid waste all over the world. BWP is categorized under Non-Biodegradable Plastic Waste (N-BPW). Due to its inability to degrade, this abundance of N-BPW caused space decrement in landfill. Many methods have been proposed for recycling of N-BPW such as incorporating N-BPW into road construction and added material in concrete production. In the present study, the feasibility of using MFPP as landfill liner material is studied through a series of laboratory testing in terms of mechanical and chemical characteristics. The liner sample was prepared in terms of a fabricated layer (combination of 60 layers (Sample A) and 80 layers (Sample B) of a single plastic). The fabricated layers were prepared by applying hot-pressing technique to increase the strength of the surface attachment between each of the layers. The prepared fabricated MFPP liners were tested for Ultimate Tensile Strength Test (UTS), Scanning Electron Microscopy (SEM) and X-Ray Distraction (XRD). The tested samples were then compared with the Conventional Geomembranes (GMs). Obtained results indicated that proposed fabricated MFPP Liner had 70% similar characteristics to GMs. In addition, the fabricated MFPP Liners have an ability to sustain maximum loading higher than Conventional GMs. These desirable characteristics indicated that the fabricated MFPP Liners has potential to be used as landfill liner material.	1	1	\N	https://www.scientific.net/KEM.821.343
13	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	USEEIO model	Method for endogenizing capital in the United States Environmentally‐Extended Input‐Output model	f	https://doi.org/10.1111/jiec.12931	2019-11-06 10:54:23.335089-05	Each year businesses, governments, and homeowners in the United States invest around one fifth of gross domestic product into the creation of capital assets such as buildings, machinery, and software to enable production and consumption.	1	5		https://onlinelibrary.wiley.com/doi/abs/10.1111/jiec.12931
3	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste De-Packaging	Systems and Methods for Enviornmentally Undisruptive Disposal of Food Waste	f	https://patentimages.storage.googleapis.com/5b/19/87/07322cddd0a739/US20100071602A1.pdf	2019-10-25 08:41:05-04	Abstract. A processing facility can dispose of food waste in environmentally un-disruptive manners. The processing facility can convert the food waste into bio-energy and bio-fuel products, such as bio-diesel, ethanol, and electricity. The processing facility can sort the food waste based on the fats or carbohydrates content of the food waste, and the processing facility can include a fluidized bed combustion module for combusting portions of the food waste.	1	1	\N	https://patentimages.storage.googleapis.com/5b/19/87/07322cddd0a739/US20100071602A1.pdf
14	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Laboratory Analysis	Food Analysis Laboratory Manual	f	Nielsen, Suzanne 2017. Food Analysis Laboratory Manual. Springer International Publishing.	2019-12-18 06:27:34.643116-05	This third edition laboratory manual was written to accompany Food Analysis, Fifth Edition, by the same author. New to this third edition of the laboratory manual are four introductory chapters that complement both the textbook chapters and the laboratory exercises.  The 24 laboratory exercises in the manual cover 21 of the 35 chapters in the textbook. DOI: 10.1007/978-3-319-44127-6. ISBN: 9783319441276 (online) 9783319441252 (print).	1	2	Industrial Chemistry/Chemical Engineering, Food Science, Spectroscopy/Spectrometry, Chemistry, Chemical engineering, Food science, Spectroscopy	https://www.springer.com/gp/book/9783319441252#aboutAuthors
15	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Analysis Laboratories in USA	Food Labs and Services	f	N/A	2019-12-18 06:45:10.72643-05	This is a food waste testing lab and we need to add 'OTHER' as an option for SOURCE... placed temporarily under proceedings.	1	8	Testing services, training, consulting, auditing, certification, on-site testing, product design, research, development	https://www.eurofinsus.com/food/
16	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Data Set .xlxs	FUSIONS Food waste data set for EU-28 New Estimates and Environmental Impact	f	N/A	2019-12-19 06:41:07.711969-05	Food waste is an issue of importance to global food security and good environmental governance, directly linked with all aspects of sustainability (e.g. availability of resources, increasing costs and health). The amount of food produced but not consumed leads to negative impacts throughout the food supply chain and households. There is a pressing need to prevent food waste to make the transition to a resource efficient Europe. Previous studies show the necessity for more consistent and comparable data in order to decrease the uncertainties and making it possible to better understand the magnitude of the problem, and the scale of the potential opportunities.	1	1	Food supply chain and Food waste	https://ec.europa.eu/food/sites/food/files/safety/docs/fw_lib_fw_expo2015_fusions_data-set_151015.pdf
17	ORD/CESER/LRTD	young.daniel@epa.gov	513-569-7451	Coffee grounds recycling	17 Genius Ways To Recycle Used Coffee Grounds	f	Editorial Team, Natural Living Ideas.com, https://www.naturallivingideas.com/recycle-used-coffee-grounds/. Accessed January 7, 2020.	2020-01-07 07:50:38.212794-05		1	11	coffee, grounds, reuse	https://www.naturallivingideas.com/recycle-used-coffee-grounds/
18	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	A Winning Formula: Making Connections to Turn Food Waste into Energy	A Winning Formula: Making Connections to Turn Food Waste into Energy	f	N/A	2020-01-08 04:47:55.057339-05	N/A	1	1		https://www.epa.gov/sciencematters/winning-formula-making-connections-turn-food-waste-energy
19	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Sampling	An interdisciplinary living laboratory approach to investigate college food waste co-composting with additional on-site organic waste feedstocks	f	Anne B. Alerding, Jennifer E. DeHart, David K. Kniffin, Nattachat Srikongyos, Michael J. DeBlasio, Jacob M. Kelliher, James A. Marsh, Heather L. Magill, Charles D. Newhouse, Samuel K. Allen, Paul J. Ackerman, and Emily L. Lilly\r\nInternational Journal of Environment and Waste Management 2019 24:1, 61-80.	2020-01-08 06:42:34.418278-05	In an effort to curb the monetary and environmental costs of food waste disposal, colleges and universities are developing composting programs. Incorporating additional on-site wastes could improve composting efficiency and provide cost savings.	1	5	aerated static pile, ASP, bacteria, compost, food waste, living laboratory, waste management, organic waste, co-composting	https://www.inderscienceonline.com/doi/abs/10.1504/IJEWM.2019.100658
20	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	microsplastics in food	Microplastics, a food safety issue?	f	Rainieri S., Barranco A. (2019)  Trends in Food Science and Technology,  84 , pp. 55-57.	2020-01-28 13:43:36.483507-05	Review Description\r\nThe risk posed by microplastics for human and environment, has become a hot topic. The concern is focused not only on the effect of microplastics as such but also on additives and chemical contaminants absorbed by microplastics that may be released and affect negatively animals and environmental health. Despite several works have been written on this topic, a number of knowledge gaps still should be filled to enable a correct risk assessment of this important issue. For example, the relevance of microplastics for food safety has not yet been fully established and scientific results aimed at establishing a possible health risk for contaminants associated with microplastics are rather controversial. The risk assessment of microplastics in foodstuff is still at a very early stage and very few studies on the monitoring of microplastics in foodstuff and their effects on human health are available. Additionally, it is difficult to compare results from different studies as methodologies and study designs are not uniform. For this reason, it is not always possible to reach some definitive conclusion. This work sets out to complement the reviews and statements already existing, by updating the information and identifying if any of the knowledge gaps have been covered and if further ones have been detected with the final aim of properly assessing and managing this emerging risk.	1	5	Microplastics\r\nPOPs\r\nToxicity\r\nNanoplastics\r\nRisk assessment	https://www.sciencedirect.com/science/article/abs/pii/S0924224417303898
21	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Effects of food presence on microplastic ingestion and egestion in Mytilus galloprovincialis	Effects of food presence on microplastic ingestion and egestion in Mytilus galloprovincialis	t	xxx	2020-01-29 09:32:20.168344-05	Research on plastic pollution in marine environments has increased exponentially in the recent decades (Strungaru et al., 2019, Alimba and Faggio, 2019). In particular, small particles of manufactured or weathered plastic (microplastics (MPs), <5 mm), characterized by global abundance, have been studied extensively. MPs are widely distributed and have been monitored in polar regions (Lusher et al., 2015, Waller et al., 2017), tropical regions (Lima et al., 2014, Do Sul et al., 2014), the East (Ng and Obbard, 2006, Isobe et al., 2015), the West (Claessens et al., 2011, Collignon et al., 2012, Alomar et al., 2016, Bellas et al., 2016), coastal areas (de Lucia et al., 2014, Stolte et al., 2015), open seas (Reisser et al., 2014, Romeo et al., 2015), sea surfaces (Song et al., 2014, Song et al., 2015), and the deep sea (Van Cauwenberghe et al., 2013, Taylor et al., 2016).	1	5	Plastic particle, Mussel, Egestion rate, Mytilus gallo, provincialis marine pollution	https://www.sciencedirect.com/science/article/pii/S0045653519320946
\.


--
-- Data for Name: FoodWaste_existingdatasharingteammap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FoodWaste_existingdatasharingteammap" (id, added_date, can_edit, data_id, team_id) FROM stdin;
1	2019-10-25 11:33:12.790042-04	t	1	4
3	2019-10-25 12:23:33.362041-04	t	3	4
4	2019-10-30 06:23:24.155733-04	t	4	4
5	2019-10-30 06:32:37.226485-04	t	5	4
6	2019-10-30 06:47:29.847967-04	t	6	4
8	2019-10-30 14:41:06.788324-04	t	8	4
10	2019-11-01 06:11:49.756253-04	t	10	4
11	2019-11-01 08:59:06.817628-04	t	11	4
12	2019-11-04 10:40:33.89557-05	t	12	4
13	2019-11-06 10:54:23.393119-05	t	13	18
14	2019-12-18 06:27:34.658056-05	t	14	4
15	2019-12-18 06:45:10.735473-05	t	15	4
16	2019-12-19 06:41:07.734487-05	t	16	4
17	2020-01-07 07:50:38.222305-05	t	17	21
18	2020-01-08 04:47:55.068133-05	t	18	4
19	2020-01-08 06:42:34.429908-05	t	19	4
20	2020-01-28 13:43:36.492337-05	t	20	4
21	2020-01-29 09:32:20.190349-05	t	21	4
\.


--
-- Data for Name: FoodWaste_existingdatasource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FoodWaste_existingdatasource" (id, name) FROM stdin;
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
-- Data for Name: accounts_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_country (id, country, abbreviation, flag) FROM stdin;
1	Afghanistan	AF	images/flags/af.png
2	Aland Islands	AX	images/flags/ax.png
3	Albania	AL	images/flags/al.png
4	Algeria	DZ	images/flags/dz.png
5	American Samoa	AS	images/flags/as.png
6	Andorra	AD	images/flags/ad.png
7	Angola	AO	images/flags/ao.png
8	Anguilla	AI	images/flags/ai.png
9	Antarctica	AQ	images/flags/aq.png
10	Antigua And Barbuda	AG	images/flags/ag.png
11	Argentina	AR	images/flags/ar.png
12	Armenia	AM	images/flags/am.png
13	Aruba	AW	images/flags/aw.png
14	Australia	AU	images/flags/au.png
15	Austria	AT	images/flags/at.png
16	Azerbaijan	AZ	images/flags/az.png
17	Bahamas	BS	images/flags/bs.png
18	Bahrain	BH	images/flags/bh.png
19	Bangladesh	BD	images/flags/bd.png
20	Barbados	BB	images/flags/bb.png
21	Belarus	BY	images/flags/by.png
22	Belgium	BE	images/flags/be.png
23	Belize	BZ	images/flags/bz.png
24	Benin	BJ	images/flags/bj.png
25	Bermuda	BM	images/flags/bm.png
26	Bhutan	BT	images/flags/bt.png
27	Bolivia	BO	images/flags/bo.png
28	Bosnia And Herzegovina	BA	images/flags/ba.png
29	Botswana	BW	images/flags/bw.png
30	Bouvet Island	BV	images/flags/bv.png
31	Brazil	BR	images/flags/br.png
32	British Indian Ocean Territory	IO	images/flags/io.png
33	Brunei Darussalam	BN	images/flags/bn.png
34	Bulgaria	BG	images/flags/bg.png
35	Burkina Faso	BF	images/flags/bf.png
36	Burundi	BI	images/flags/bi.png
37	Cambodia	KH	images/flags/kh.png
38	Cameroon	CM	images/flags/cm.png
39	Canada	CA	images/flags/ca.png
40	Cape Verde	CV	images/flags/cv.png
41	Cayman Islands	KY	images/flags/ky.png
42	Central African Republic	CF	images/flags/cf.png
43	Chad	TD	images/flags/td.png
44	Chile	CL	images/flags/cl.png
45	China	CN	images/flags/cn.png
46	Christmas Island	CX	images/flags/cx.png
47	Cocos (keeling) Islands	CC	images/flags/cc.png
48	Colombia	CO	images/flags/co.png
49	Comoros	KM	images/flags/km.png
50	Congo	CG	images/flags/cg.png
51	Congo, The Democratic Republic Of The	CD	images/flags/cd.png
52	Cook Islands	CK	images/flags/ck.png
53	Costa Rica	CR	images/flags/cr.png
54	Cote D'ivoire	CI	images/flags/ci.png
55	Croatia	HR	images/flags/hr.png
56	Cuba	CU	images/flags/cu.png
57	Cyprus	CY	images/flags/cy.png
58	Czech Republic	CZ	images/flags/cz.png
59	Denmark	DK	images/flags/dk.png
60	Djibouti	DJ	images/flags/dj.png
61	Dominica	DM	images/flags/dm.png
62	Dominican Republic	DO	images/flags/do.png
63	Ecuador	EC	images/flags/ec.png
64	Egypt	EG	images/flags/eg.png
65	El Salvador	SV	images/flags/sv.png
66	Equatorial Guinea	GQ	images/flags/gq.png
67	Eritrea	ER	images/flags/er.png
68	Estonia	EE	images/flags/ee.png
69	Ethiopia	ET	images/flags/et.png
70	Falkland Islands (malvinas)	FK	images/flags/fk.png
71	Faroe Islands	FO	images/flags/fo.png
72	Fiji	FJ	images/flags/fj.png
73	Finland	FI	images/flags/fi.png
74	France	FR	images/flags/fr.png
75	French Guiana	GF	images/flags/gf.png
76	French Polynesia	PF	images/flags/pf.png
77	French Southern Territories	TF	images/flags/tf.png
78	Gabon	GA	images/flags/ga.png
79	Gambia	GM	images/flags/gm.png
80	Georgia	GE	images/flags/ge.png
81	Germany	DE	images/flags/de.png
82	Ghana	GH	images/flags/gh.png
83	Gibraltar	GI	images/flags/gi.png
84	Greece	GR	images/flags/gr.png
85	Greenland	GL	images/flags/gl.png
86	Grenada	GD	images/flags/gd.png
87	Guadeloupe	GP	images/flags/gp.png
88	Guam	GU	images/flags/gu.png
89	Guatemala	GT	images/flags/gt.png
90	Guernsey	GG	images/flags/gg.png
91	Guinea	GN	images/flags/gn.png
92	Guinea-bissau	GW	images/flags/gw.png
93	Guyana	GY	images/flags/gy.png
94	Haiti	HT	images/flags/ht.png
95	Heard Island And Mcdonald Islands	HM	images/flags/hm.png
96	Honduras	HN	images/flags/hn.png
97	Hong Kong	HK	images/flags/hk.png
98	Hungary	HU	images/flags/hu.png
99	Iceland	IS	images/flags/is.png
100	India	IN	images/flags/in.png
101	Indonesia	ID	images/flags/id.png
102	Iran, Islamic Republic Of	IR	images/flags/ir.png
103	Iraq	IQ	images/flags/iq.png
104	Ireland	IE	images/flags/ie.png
105	Isle Of Man	IM	images/flags/im.png
106	Israel	IL	images/flags/il.png
107	Italy	IT	images/flags/it.png
108	Jamaica	JM	images/flags/jm.png
109	Japan	JP	images/flags/jp.png
110	Jersey	JE	images/flags/je.png
111	Jordan	JO	images/flags/jo.png
112	Kazakhstan	KZ	images/flags/kz.png
113	Kenya	KE	images/flags/ke.png
114	Kiribati	KI	images/flags/ki.png
115	Korea, Democratic People's Republic Of	KP	images/flags/kp.png
116	Korea, Republic Of	KR	images/flags/kr.png
117	Kuwait	KW	images/flags/kw.png
118	Kyrgyzstan	KG	images/flags/kg.png
119	Lao People's Democratic Republic	LA	images/flags/la.png
120	Latvia	LV	images/flags/lv.png
121	Lebanon	LB	images/flags/lb.png
122	Lesotho	LS	images/flags/ls.png
123	Liberia	LR	images/flags/lr.png
124	Libyan Arab Jamahiriya	LY	images/flags/ly.png
125	Liechtenstein	LI	images/flags/li.png
126	Lithuania	LT	images/flags/lt.png
127	Luxembourg	LU	images/flags/lu.png
128	Macao	MO	images/flags/mo.png
129	Macedonia, The Former Yugoslav Republic Of	MK	images/flags/mk.png
130	Madagascar	MG	images/flags/mg.png
131	Malawi	MW	images/flags/mw.png
132	Malaysia	MY	images/flags/my.png
133	Maldives	MV	images/flags/mv.png
134	Mali	ML	images/flags/ml.png
135	Malta	MT	images/flags/mt.png
136	Marshall Islands	MH	images/flags/mh.png
137	Martinique	MQ	images/flags/mq.png
138	Mauritania	MR	images/flags/mr.png
139	Mauritius	MU	images/flags/mu.png
140	Mayotte	YT	images/flags/yt.png
141	Mexico	MX	images/flags/mx.png
142	Micronesia, Federated States Of	FM	images/flags/fm.png
143	Moldova	MD	images/flags/md.png
144	Monaco	MC	images/flags/mc.png
145	Mongolia	MN	images/flags/mn.png
146	Montenegro	ME	images/flags/me.png
147	Montserrat	MS	images/flags/ms.png
148	Morocco	MA	images/flags/ma.png
149	Mozambique	MZ	images/flags/mz.png
150	Myanmar	MM	images/flags/mm.png
151	Namibia	NA	images/flags/na.png
152	Nauru	NR	images/flags/nr.png
153	Nepal	NP	images/flags/np.png
154	Netherlands	NL	images/flags/nl.png
155	Netherlands Antilles	AN	images/flags/an.png
156	New Caledonia	NC	images/flags/nc.png
157	New Zealand	NZ	images/flags/nz.png
158	Nicaragua	NI	images/flags/ni.png
159	Niger	NE	images/flags/ne.png
160	Nigeria	NG	images/flags/NG.png
161	Niue	NU	images/flags/nu.png
162	Norfolk Island	NF	images/flags/nf.png
163	Northern Mariana Islands	MP	images/flags/mp.png
164	Norway	NO	images/flags/no.png
165	Oman	OM	images/flags/om.png
166	Pakistan	PK	images/flags/pk.png
167	Palau	PW	images/flags/pw.png
168	Palestinian Territory, Occupied	PS	images/flags/ps.png
169	Panama	PA	images/flags/pa.png
170	Papua New Guinea	PG	images/flags/pg.png
171	Paraguay	PY	images/flags/py.png
172	Peru	PE	images/flags/pe.png
173	Philippines	PH	images/flags/ph.png
174	Pitcairn	PN	images/flags/pn.png
175	Poland	PL	images/flags/pl.png
176	Portugal	PT	images/flags/pt.png
177	Puerto Rico	PR	images/flags/pr.png
178	Qatar	QA	images/flags/qa.png
179	REunion	RE	images/flags/re.png
180	Romania	RO	images/flags/ro.png
181	Russian Federation	RU	images/flags/ru.png
182	Rwanda	RW	images/flags/rw.png
183	Saint BarthElemy	BL	images/flags/bl.png
184	Saint Helena	SH	images/flags/sh.png
185	Saint Kitts And Nevis	KN	images/flags/kn.png
186	Saint Lucia	LC	images/flags/lc.png
187	Saint Martin	MF	images/flags/mf.png
188	Saint Pierre And Miquelon	PM	images/flags/pm.png
189	Saint Vincent And The Grenadines	VC	images/flags/vc.png
190	Samoa	WS	images/flags/ws.png
191	San Marino	SM	images/flags/sm.png
192	Sao Tome And Principe	ST	images/flags/st.png
193	Saudi Arabia	SA	images/flags/sa.png
194	Senegal	SN	images/flags/sn.png
195	Serbia	RS	images/flags/rs.png
196	Seychelles	SC	images/flags/sc.png
197	Sierra Leone	SL	images/flags/sl.png
198	Singapore	SG	images/flags/sg.png
199	Slovakia	SK	images/flags/sk.png
200	Slovenia	SI	images/flags/si.png
201	Solomon Islands	SB	images/flags/sb.png
202	Somalia	SO	images/flags/so.png
203	South Africa	ZA	images/flags/za.png
204	South Georgia And The South Sandwich Islands	GS	images/flags/gs.png
205	Spain	ES	images/flags/es.png
206	Sri Lanka	LK	images/flags/lk.png
207	Sudan	SD	images/flags/sd.png
208	Suriname	SR	images/flags/sr.png
209	Svalbard And Jan Mayen	SJ	images/flags/sj.png
210	Swaziland	SZ	images/flags/sz.png
211	Sweden	SE	images/flags/se.png
212	Switzerland	CH	images/flags/ch.png
213	Syrian Arab Republic	SY	images/flags/sy.png
214	Taiwan, Province Of China	TW	images/flags/tw.png
215	Tajikistan	TJ	images/flags/tj.png
216	Tanzania, United Republic Of	TZ	images/flags/tz.png
217	Thailand	TH	images/flags/th.png
218	Timor-leste	TL	images/flags/tl.png
219	Togo	TG	images/flags/tg.png
220	Tokelau	TK	images/flags/tk.png
221	Tonga	TO	images/flags/to.png
222	Trinidad And Tobago	TT	images/flags/tt.png
223	Tunisia	TN	images/flags/tn.png
224	Turkey	TR	images/flags/tr.png
225	Turkmenistan	TM	images/flags/tm.png
226	Turks And Caicos Islands	TC	images/flags/tc.png
227	Tuvalu	TV	images/flags/tv.png
228	Uganda	UG	images/flags/ug.png
229	Ukraine	UA	images/flags/ua.png
230	United Arab Emirates	AE	images/flags/ae.png
231	United Kingdom	GB	images/flags/gb.png
232	United States	US	images/flags/us.png
233	United States Minor Outlying Islands	UM	images/flags/um.png
234	Uruguay	UY	images/flags/uy.png
235	Uzbekistan	UZ	images/flags/uz.png
236	Vanuatu	VU	images/flags/vu.png
237	Vatican City State	VA	images/flags/va.png
238	Venezuela	VE	images/flags/ve.png
239	Viet Nam	VN	images/flags/vn.png
240	Virgin Islands, British	VG	images/flags/vg.png
241	Virgin Islands, U.s.	VI	images/flags/vi.png
242	Wallis And Futuna	WF	images/flags/wf.png
243	Western Sahara	EH	images/flags/eh.png
244	Yemen	YE	images/flags/ye.png
245	Zambia	ZM	images/flags/zm.png
246	Zimbabwe	ZW	images/flags/zw.png
\.


--
-- Data for Name: accounts_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_role (id, role) FROM stdin;
1	Management
2	Technical Professional (Engineer / Scientist)
3	Professor
4	Student
5	Other
\.


--
-- Data for Name: accounts_sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_sector (id, sector) FROM stdin;
1	Industry
2	Academia
3	Government
4	Non-profit/NGO
5	Other
\.


--
-- Data for Name: accounts_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_state (id, state, abbreviation, country_id) FROM stdin;
1	Alabama	AL	232
2	Arkansas	AK	232
3	Arizona	AZ	232
4	Arkansas	AR	232
5	California	CA	232
6	Colorado	CO	232
7	Connecticut	CT	232
8	Delaware	DE	232
9	District of Columbia	DC	232
10	Florida	FL	232
11	Georgia	GA	232
12	Hawaii	HI	232
13	Idaho	ID	232
14	Illinois	IL	232
15	Indiana	IN	232
16	Iowa	IA	232
17	Kansas	KS	232
18	Kentucky	KY	232
19	Louisiana	LA	232
20	Maine	ME	232
21	Maryland	MD	232
22	Massachusetts	MA	232
23	Michigan	MI	232
24	Minnesota	MN	232
25	Mississippi	MS	232
26	Missouri	MO	232
27	Montana	MT	232
28	Nebraska	NE	232
29	Nevada	NV	232
30	New Hampshire	NH	232
31	New Jersey	NJ	232
32	New Mexico	NM	232
33	New York	NY	232
34	North Carolina	NC	232
35	North Dakota	ND	232
36	Ohio	OH	232
37	Oklahoma	OK	232
38	Oregon	OR	232
39	Pennsylvania	PA	232
40	Rhode Island	RI	232
41	South Carolina	SC	232
42	South Dakota	SD	232
43	Tennessee	TN	232
44	Texas	TX	232
45	Utah	UT	232
46	Vermont	VT	232
47	Virginia	VA	232
48	Washington	WA	232
49	West Virginia	WV	232
50	Wisconsin	WI	232
51	Wyoming	WY	232
52	American Samoa	AS	233
53	Guam	GU	233
54	Northern Mariana Islands	MP	233
55	Puerto Rico	PR	233
56	Virgin Islands	VI	233
\.


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userprofile (id, created, last_modified, affiliation, job_title, address_line1, address_line2, city, zipcode, country_id, role_id, sector_id, state_id, user_id) FROM stdin;
1	2020-02-25 15:02:02.289566-05	2020-02-26 06:03:01.819117-05	U.S. EPA	Engineer	26 W. martin Luther King Dr		Cincinnati	45268	232	2	3	36	1
2	2020-02-28 13:37:59.819646-05	2020-02-28 13:37:59.841006-05	EPA	Director of Quality Assurance	26 Martin Luther King Dr W		Cincinnati	45211	232	2	3	36	2
3	2020-03-02 11:04:21.679902-05	2020-03-02 11:04:21.700951-05	USEPA	Environmental Engineer	61 Forsyth Street		Atlanta	30303	232	2	3	11	3
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add country	7	add_country
26	Can change country	7	change_country
27	Can delete country	7	delete_country
28	Can view country	7	view_country
29	Can add role	8	add_role
30	Can change role	8	change_role
31	Can delete role	8	delete_role
32	Can view role	8	view_role
33	Can add sector	9	add_sector
34	Can change sector	9	change_sector
35	Can delete sector	9	delete_sector
36	Can view sector	9	view_sector
37	Can add state	10	add_state
38	Can change state	10	change_state
39	Can delete state	10	delete_state
40	Can view state	10	view_state
41	Can add user profile	11	add_userprofile
42	Can change user profile	11	change_userprofile
43	Can delete user profile	11	delete_userprofile
44	Can view user profile	11	view_userprofile
45	Can add attachment	12	add_attachment
46	Can change attachment	12	change_attachment
47	Can delete attachment	12	delete_attachment
48	Can view attachment	12	view_attachment
49	Can add data attachment map	13	add_dataattachmentmap
50	Can change data attachment map	13	change_dataattachmentmap
51	Can delete data attachment map	13	delete_dataattachmentmap
52	Can view data attachment map	13	view_dataattachmentmap
53	Can add existing data	14	add_existingdata
54	Can change existing data	14	change_existingdata
55	Can delete existing data	14	delete_existingdata
56	Can view existing data	14	view_existingdata
57	Can add existing data source	15	add_existingdatasource
58	Can change existing data source	15	change_existingdatasource
59	Can delete existing data source	15	delete_existingdatasource
60	Can view existing data source	15	view_existingdatasource
61	Can add existing data sharing team map	16	add_existingdatasharingteammap
62	Can change existing data sharing team map	16	change_existingdatasharingteammap
63	Can delete existing data sharing team map	16	delete_existingdatasharingteammap
64	Can view existing data sharing team map	16	view_existingdatasharingteammap
65	Can add upload	17	add_upload
66	Can change upload	17	change_upload
67	Can delete upload	17	delete_upload
68	Can view upload	17	view_upload
69	Can add upload	18	add_upload
70	Can change upload	18	change_upload
71	Can delete upload	18	delete_upload
72	Can view upload	18	view_upload
73	Can add division	19	add_division
74	Can change division	19	change_division
75	Can delete division	19	delete_division
76	Can view division	19	view_division
77	Can add qapp	20	add_qapp
78	Can change qapp	20	change_qapp
79	Can delete qapp	20	delete_qapp
80	Can view qapp	20	view_qapp
81	Can add qapp approval	21	add_qappapproval
82	Can change qapp approval	21	change_qappapproval
83	Can delete qapp approval	21	delete_qappapproval
84	Can view qapp approval	21	view_qappapproval
85	Can add section a	22	add_sectiona
86	Can change section a	22	change_sectiona
87	Can delete section a	22	delete_sectiona
88	Can view section a	22	view_sectiona
89	Can add section b	23	add_sectionb
90	Can change section b	23	change_sectionb
91	Can delete section b	23	delete_sectionb
92	Can view section b	23	view_sectionb
93	Can add section c	24	add_sectionc
94	Can change section c	24	change_sectionc
95	Can delete section c	24	delete_sectionc
96	Can view section c	24	view_sectionc
97	Can add section d	25	add_sectiond
98	Can change section d	25	change_sectiond
99	Can delete section d	25	delete_sectiond
100	Can view section d	25	view_sectiond
101	Can add revision	26	add_revision
102	Can change revision	26	change_revision
103	Can delete revision	26	delete_revision
104	Can view revision	26	view_revision
105	Can add qapp lead	27	add_qapplead
106	Can change qapp lead	27	change_qapplead
107	Can delete qapp lead	27	delete_qapplead
108	Can view qapp lead	27	view_qapplead
109	Can add qapp approval signature	28	add_qappapprovalsignature
110	Can change qapp approval signature	28	change_qappapprovalsignature
111	Can delete qapp approval signature	28	delete_qappapprovalsignature
112	Can view qapp approval signature	28	view_qappapprovalsignature
113	Can add section b type	29	add_sectionbtype
114	Can change section b type	29	change_sectionbtype
115	Can delete section b type	29	delete_sectionbtype
116	Can view section b type	29	view_sectionbtype
117	Can add references	30	add_references
118	Can change references	30	change_references
119	Can delete references	30	delete_references
120	Can view references	30	view_references
121	Can add priority	31	add_priority
122	Can change priority	31	change_priority
123	Can delete priority	31	delete_priority
124	Can view priority	31	view_priority
125	Can add support	32	add_support
126	Can change support	32	change_support
127	Can delete support	32	delete_support
128	Can view support	32	view_support
129	Can add support type	33	add_supporttype
130	Can change support type	33	change_supporttype
131	Can delete support type	33	delete_supporttype
132	Can view support type	33	view_supporttype
133	Can add support attachment	34	add_supportattachment
134	Can change support attachment	34	change_supportattachment
135	Can delete support attachment	34	delete_supportattachment
136	Can view support attachment	34	view_supportattachment
137	Can add team	35	add_team
138	Can change team	35	change_team
139	Can delete team	35	delete_team
140	Can view team	35	view_team
141	Can add team membership	36	add_teammembership
142	Can change team membership	36	change_teammembership
143	Can delete team membership	36	delete_teammembership
144	Can view team membership	36	view_teammembership
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$Vmo6Q2n9nlia$APlqU+/qSDSX6hkXG2HD4mURvwLtQwx47iBl/NMWyy0=	2020-02-28 11:40:42.295904-05	t	dyoung11	Daniel	Young	Young.Daniel@epa.gov	t	t	2019-07-16 08:00:00-04
2	pbkdf2_sha256$180000$F6yhDhFYo7Gr$CZkOy/3Tgkm9U+bPPNk1VsABOghBzpfJFjO6Kx4wTP8=	\N	f	sjones04	Steven	Jones	Jones.Steven@epa.gov	f	f	2020-02-28 13:37:59.636727-05
3	pbkdf2_sha256$180000$055Punp8ubHJ$a5DARhBtZS0rh8YhrJLWi+1CJBC9R/8v2TgI8QtGemQ=	\N	f	WesIngwersen	Wesley	Ingwersen	ingwersen.wesley@epa.gov	f	f	2020-03-02 11:04:21.495328-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	accounts	country
8	accounts	role
9	accounts	sector
10	accounts	state
11	accounts	userprofile
12	DataSearch	attachment
13	DataSearch	dataattachmentmap
14	DataSearch	existingdata
15	DataSearch	existingdatasource
16	DataSearch	existingdatasharingteammap
17	flowsa	upload
18	scifinder	upload
19	qar5	division
20	qar5	qapp
21	qar5	qappapproval
22	qar5	sectiona
23	qar5	sectionb
24	qar5	sectionc
25	qar5	sectiond
26	qar5	revision
27	qar5	qapplead
28	qar5	qappapprovalsignature
29	qar5	sectionbtype
30	qar5	references
31	support	priority
32	support	support
33	support	supporttype
34	support	supportattachment
35	teams	team
36	teams	teammembership
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-25 15:02:01.159635-05
2	auth	0001_initial	2020-02-25 15:02:01.195131-05
3	teams	0001_initial	2020-02-25 15:02:01.260277-05
4	DataSearch	0001_initial	2020-02-25 15:02:01.421698-05
5	DataSearch	0002_datasource_fixture	2020-02-25 15:02:01.501902-05
6	accounts	0001_initial	2020-02-25 15:02:01.553888-05
7	accounts	0002_auto_20180130_2054	2020-02-25 15:02:01.606169-05
8	accounts	0003_auto_20190802_1418	2020-02-25 15:02:02.296139-05
9	admin	0001_initial	2020-02-25 15:02:02.325366-05
10	admin	0002_logentry_remove_auto_add	2020-02-25 15:02:02.348939-05
11	admin	0003_logentry_add_action_flag_choices	2020-02-25 15:02:02.368735-05
12	contenttypes	0002_remove_content_type_name	2020-02-25 15:02:02.404353-05
13	auth	0002_alter_permission_name_max_length	2020-02-25 15:02:02.412118-05
14	auth	0003_alter_user_email_max_length	2020-02-25 15:02:02.432162-05
15	auth	0004_alter_user_username_opts	2020-02-25 15:02:02.452209-05
16	auth	0005_alter_user_last_login_null	2020-02-25 15:02:02.470266-05
17	auth	0006_require_contenttypes_0002	2020-02-25 15:02:02.472851-05
18	auth	0007_alter_validators_add_error_messages	2020-02-25 15:02:02.49098-05
19	auth	0008_alter_user_username_max_length	2020-02-25 15:02:02.512352-05
20	auth	0009_alter_user_last_name_max_length	2020-02-25 15:02:02.542896-05
21	auth	0010_alter_group_name_max_length	2020-02-25 15:02:02.559661-05
22	auth	0011_update_proxy_permissions	2020-02-25 15:02:02.586515-05
23	flowsa	0001_initial	2020-02-25 15:02:02.60077-05
24	flowsa	0002_auto_20200224_1405	2020-02-25 15:02:02.621092-05
25	flowsa	0003_auto_20200224_1629	2020-02-25 15:02:02.632687-05
26	flowsa	0004_auto_20200225_0550	2020-02-25 15:02:02.645669-05
27	qar5	0001_initial	2020-02-25 15:02:02.74505-05
28	qar5	0002_division_fixture	2020-02-25 15:02:02.803119-05
29	qar5	0003_auto_20200218_1317	2020-02-25 15:02:02.824241-05
30	qar5	0004_sectionb_type_fixture	2020-02-25 15:02:02.859757-05
31	qar5	0005_auto_20200219_0830	2020-02-25 15:02:02.890831-05
32	qar5	0006_auto_20200220_1022	2020-02-25 15:02:02.959799-05
33	scifinder	0001_initial	2020-02-25 15:02:02.989929-05
34	scifinder	0002_auto_20200224_1408	2020-02-25 15:02:03.007842-05
35	scifinder	0003_auto_20200224_1629	2020-02-25 15:02:03.021927-05
36	scifinder	0004_auto_20200225_0550	2020-02-25 15:02:03.038476-05
37	sessions	0001_initial	2020-02-25 15:02:03.0471-05
38	support	0001_initial	2020-02-25 15:02:03.173214-05
39	flowsa	0005_auto_20200226_0539	2020-02-26 05:39:39.010445-05
40	scifinder	0005_auto_20200226_0539	2020-02-26 05:39:39.039735-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1eyqnmp89xf24fn3nqful5ldd3pwol1a	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-11 07:01:45.410881-04
18zr0k7f62vmzrlz8yvfnf8wqd9862cw	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-11 07:03:07.559883-04
s9fouflvqkn2qjtxp8hwzusg60to0zx5	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-12 08:53:53.665849-04
mnnsy3842byw2qs5gspgdfsfjfy6pl9e	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-13 08:50:25.203311-04
5shqk9o7thce3su32kwn07bfjrg6c1oy	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-03-13 14:39:39.133504-04
evuqa1k1w1dgv5klv4zpx93xfa5583ah	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-03-16 12:07:43.918642-04
\.


--
-- Data for Name: flowsa_upload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flowsa_upload (id, name, file, uploaded_at, uploaded_by_id) FROM stdin;
\.


--
-- Data for Name: qar5_division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_division (id, name) FROM stdin;
1	Groundwater Characterization & Remediation Division
2	Homeland Security & Materials Management Division
3	Immediate Office
4	Land Remediation & Technology Division
5	Technical Support & Coordination Division
6	Water Infrastructure Division
\.


--
-- Data for Name: qar5_qapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qapp (id, division_branch, title, qa_category, intra_extra, revision_number, date, prepared_by_id, strap, tracking_id, division_id) FROM stdin;
\.


--
-- Data for Name: qar5_qappapproval; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qappapproval (id, project_plan_title, activity_number, qapp_id) FROM stdin;
\.


--
-- Data for Name: qar5_qappapprovalsignature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qappapprovalsignature (id, contractor, name, signature, date, qapp_approval_id) FROM stdin;
\.


--
-- Data for Name: qar5_qapplead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qapplead (id, name, qapp_id) FROM stdin;
\.


--
-- Data for Name: qar5_references; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_references (qapp_id, "references") FROM stdin;
\.


--
-- Data for Name: qar5_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_revision (id, revision, description, effective_date, initial_version, qapp_id) FROM stdin;
\.


--
-- Data for Name: qar5_sectiona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectiona (qapp_id, a3, a4, a4_chart, a5, a6, a7, a8, a9, a9_drive_path, sectionb_type_id) FROM stdin;
\.


--
-- Data for Name: qar5_sectionb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectionb (qapp_id, b1_2, b1_3, b1_4, b1_5, b2_1, b2_2, b2_3, b2_4, b2_5, b3, b4) FROM stdin;
\.


--
-- Data for Name: qar5_sectionbtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectionbtype (id, name) FROM stdin;
\.


--
-- Data for Name: qar5_sectionc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectionc (qapp_id, c1, c2) FROM stdin;
\.


--
-- Data for Name: qar5_sectiond; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectiond (qapp_id, d1, d2, d3) FROM stdin;
\.


--
-- Data for Name: scifinder_upload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scifinder_upload (id, name, file, uploaded_at, uploaded_by_id) FROM stdin;
\.


--
-- Data for Name: support_priority; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_priority (id, created, modified, created_by, last_modified_by, the_name, the_description, weblink, ordering, user_id) FROM stdin;
\.


--
-- Data for Name: support_support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_support (id, created, modified, make_public, share_with_user_group, attachment, the_name, subject, length_of_reference, author, is_closed, the_description, resolution, weblink, ordering, date_resolved, status, review_notes, created_by_id, last_modified_by_id, priority_id, support_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: support_supportattachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_supportattachment (id, created, modified, created_by, last_modified_by, attachment, the_name, the_size, support_id, user_id) FROM stdin;
\.


--
-- Data for Name: support_supporttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support_supporttype (id, created, modified, created_by, last_modified_by, the_name, the_description, weblink, ordering, user_id) FROM stdin;
\.


--
-- Data for Name: teams_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams_team (id, created_date, last_modified_date, name, created_by_id, last_modified_by_id) FROM stdin;
\.


--
-- Data for Name: teams_teammembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams_teammembership (id, added_date, is_owner, can_edit, member_id, team_id) FROM stdin;
\.


--
-- Name: DataSearch_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_attachment_id_seq"', 8, true);


--
-- Name: DataSearch_dataattachmentmap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_dataattachmentmap_id_seq"', 7, true);


--
-- Name: DataSearch_existingdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_existingdata_id_seq"', 21, true);


--
-- Name: DataSearch_existingdatasharingteammap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_existingdatasharingteammap_id_seq"', 21, true);


--
-- Name: DataSearch_existingdatasource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_existingdatasource_id_seq"', 11, true);


--
-- Name: FoodWaste_dataattachmentmap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FoodWaste_dataattachmentmap_id_seq"', 7, true);


--
-- Name: FoodWaste_existingdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FoodWaste_existingdata_id_seq"', 21, true);


--
-- Name: FoodWaste_existingdatasharingteammap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FoodWaste_existingdatasharingteammap_id_seq"', 21, true);


--
-- Name: FoodWaste_existingdatasource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FoodWaste_existingdatasource_id_seq"', 11, true);


--
-- Name: accounts_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_country_id_seq', 246, true);


--
-- Name: accounts_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_role_id_seq', 5, true);


--
-- Name: accounts_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_sector_id_seq', 5, true);


--
-- Name: accounts_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_state_id_seq', 56, true);


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 3, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 144, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 36, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);


--
-- Name: flowsa_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flowsa_upload_id_seq', 1, false);


--
-- Name: qar5_division_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_division_id_seq', 1, false);


--
-- Name: qar5_qapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qapp_id_seq', 1, false);


--
-- Name: qar5_qappapproval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qappapproval_id_seq', 1, false);


--
-- Name: qar5_qappapprovalsignature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qappapprovalsignature_id_seq', 1, false);


--
-- Name: qar5_qapplead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qapplead_id_seq', 1, false);


--
-- Name: qar5_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_revision_id_seq', 1, false);


--
-- Name: qar5_sectionbtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_sectionbtype_id_seq', 1, false);


--
-- Name: scifinder_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scifinder_upload_id_seq', 1, false);


--
-- Name: support_priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.support_priority_id_seq', 1, false);


--
-- Name: support_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.support_support_id_seq', 1, false);


--
-- Name: support_supportattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.support_supportattachment_id_seq', 1, false);


--
-- Name: support_supporttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.support_supporttype_id_seq', 1, false);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1, false);


--
-- Name: teams_teammembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_teammembership_id_seq', 1, false);


--
-- Name: DataSearch_attachment DataSearch_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_attachment"
    ADD CONSTRAINT "DataSearch_attachment_pkey" PRIMARY KEY (id);


--
-- Name: DataSearch_dataattachmentmap DataSearch_dataattachmentmap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_dataattachmentmap"
    ADD CONSTRAINT "DataSearch_dataattachmentmap_pkey" PRIMARY KEY (id);


--
-- Name: DataSearch_existingdata DataSearch_existingdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdata"
    ADD CONSTRAINT "DataSearch_existingdata_pkey" PRIMARY KEY (id);


--
-- Name: DataSearch_existingdatasharingteammap DataSearch_existingdatasharingteammap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdatasharingteammap"
    ADD CONSTRAINT "DataSearch_existingdatasharingteammap_pkey" PRIMARY KEY (id);


--
-- Name: DataSearch_existingdatasource DataSearch_existingdatasource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdatasource"
    ADD CONSTRAINT "DataSearch_existingdatasource_pkey" PRIMARY KEY (id);


--
-- Name: FoodWaste_dataattachmentmap FoodWaste_dataattachmentmap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_dataattachmentmap"
    ADD CONSTRAINT "FoodWaste_dataattachmentmap_pkey" PRIMARY KEY (id);


--
-- Name: FoodWaste_existingdata FoodWaste_existingdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdata"
    ADD CONSTRAINT "FoodWaste_existingdata_pkey" PRIMARY KEY (id);


--
-- Name: FoodWaste_existingdatasharingteammap FoodWaste_existingdatasharingteammap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdatasharingteammap"
    ADD CONSTRAINT "FoodWaste_existingdatasharingteammap_pkey" PRIMARY KEY (id);


--
-- Name: FoodWaste_existingdatasource FoodWaste_existingdatasource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdatasource"
    ADD CONSTRAINT "FoodWaste_existingdatasource_pkey" PRIMARY KEY (id);


--
-- Name: accounts_country accounts_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_country
    ADD CONSTRAINT accounts_country_pkey PRIMARY KEY (id);


--
-- Name: accounts_role accounts_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_role
    ADD CONSTRAINT accounts_role_pkey PRIMARY KEY (id);


--
-- Name: accounts_sector accounts_sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_sector
    ADD CONSTRAINT accounts_sector_pkey PRIMARY KEY (id);


--
-- Name: accounts_state accounts_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_state
    ADD CONSTRAINT accounts_state_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: flowsa_upload flowsa_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowsa_upload
    ADD CONSTRAINT flowsa_upload_pkey PRIMARY KEY (id);


--
-- Name: qar5_division qar5_division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_division
    ADD CONSTRAINT qar5_division_pkey PRIMARY KEY (id);


--
-- Name: qar5_qapp qar5_qapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qapp
    ADD CONSTRAINT qar5_qapp_pkey PRIMARY KEY (id);


--
-- Name: qar5_qappapproval qar5_qappapproval_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappapproval
    ADD CONSTRAINT qar5_qappapproval_pkey PRIMARY KEY (id);


--
-- Name: qar5_qappapprovalsignature qar5_qappapprovalsignature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappapprovalsignature
    ADD CONSTRAINT qar5_qappapprovalsignature_pkey PRIMARY KEY (id);


--
-- Name: qar5_qapplead qar5_qapplead_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qapplead
    ADD CONSTRAINT qar5_qapplead_pkey PRIMARY KEY (id);


--
-- Name: qar5_references qar5_references_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_references
    ADD CONSTRAINT qar5_references_pkey PRIMARY KEY (qapp_id);


--
-- Name: qar5_revision qar5_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_revision
    ADD CONSTRAINT qar5_revision_pkey PRIMARY KEY (id);


--
-- Name: qar5_sectiona qar5_sectiona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectiona
    ADD CONSTRAINT qar5_sectiona_pkey PRIMARY KEY (qapp_id);


--
-- Name: qar5_sectionb qar5_sectionb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectionb
    ADD CONSTRAINT qar5_sectionb_pkey PRIMARY KEY (qapp_id);


--
-- Name: qar5_sectionbtype qar5_sectionbtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectionbtype
    ADD CONSTRAINT qar5_sectionbtype_pkey PRIMARY KEY (id);


--
-- Name: qar5_sectionc qar5_sectionc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectionc
    ADD CONSTRAINT qar5_sectionc_pkey PRIMARY KEY (qapp_id);


--
-- Name: qar5_sectiond qar5_sectiond_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectiond
    ADD CONSTRAINT qar5_sectiond_pkey PRIMARY KEY (qapp_id);


--
-- Name: scifinder_upload scifinder_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scifinder_upload
    ADD CONSTRAINT scifinder_upload_pkey PRIMARY KEY (id);


--
-- Name: support_priority support_priority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_priority
    ADD CONSTRAINT support_priority_pkey PRIMARY KEY (id);


--
-- Name: support_support support_support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_pkey PRIMARY KEY (id);


--
-- Name: support_supportattachment support_supportattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_supportattachment
    ADD CONSTRAINT support_supportattachment_pkey PRIMARY KEY (id);


--
-- Name: support_supporttype support_supporttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_supporttype
    ADD CONSTRAINT support_supporttype_pkey PRIMARY KEY (id);


--
-- Name: teams_team teams_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_team
    ADD CONSTRAINT teams_team_pkey PRIMARY KEY (id);


--
-- Name: teams_teammembership teams_teammembership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_teammembership
    ADD CONSTRAINT teams_teammembership_pkey PRIMARY KEY (id);


--
-- Name: DataSearch_attachment_uploaded_by_id_c3c14fa9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_attachment_uploaded_by_id_c3c14fa9" ON public."DataSearch_attachment" USING btree (uploaded_by_id);


--
-- Name: DataSearch_dataattachmentmap_attachment_id_c9f41a70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_dataattachmentmap_attachment_id_c9f41a70" ON public."DataSearch_dataattachmentmap" USING btree (attachment_id);


--
-- Name: DataSearch_dataattachmentmap_data_id_d28146ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_dataattachmentmap_data_id_d28146ba" ON public."DataSearch_dataattachmentmap" USING btree (data_id);


--
-- Name: DataSearch_existingdata_created_by_id_11974ff1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_existingdata_created_by_id_11974ff1" ON public."DataSearch_existingdata" USING btree (created_by_id);


--
-- Name: DataSearch_existingdata_source_id_f5c82b8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_existingdata_source_id_f5c82b8d" ON public."DataSearch_existingdata" USING btree (source_id);


--
-- Name: DataSearch_existingdatasharingteammap_data_id_9177d03c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_existingdatasharingteammap_data_id_9177d03c" ON public."DataSearch_existingdatasharingteammap" USING btree (data_id);


--
-- Name: DataSearch_existingdatasharingteammap_team_id_1c14a1f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DataSearch_existingdatasharingteammap_team_id_1c14a1f5" ON public."DataSearch_existingdatasharingteammap" USING btree (team_id);


--
-- Name: FoodWaste_dataattachmentmap_attachment_id_c9f41a70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_dataattachmentmap_attachment_id_c9f41a70" ON public."FoodWaste_dataattachmentmap" USING btree (attachment_id);


--
-- Name: FoodWaste_dataattachmentmap_data_id_d28146ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_dataattachmentmap_data_id_d28146ba" ON public."FoodWaste_dataattachmentmap" USING btree (data_id);


--
-- Name: FoodWaste_existingdata_created_by_id_11974ff1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_existingdata_created_by_id_11974ff1" ON public."FoodWaste_existingdata" USING btree (created_by_id);


--
-- Name: FoodWaste_existingdata_source_id_f5c82b8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_existingdata_source_id_f5c82b8d" ON public."FoodWaste_existingdata" USING btree (source_id);


--
-- Name: FoodWaste_existingdatasharingteammap_data_id_9177d03c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_existingdatasharingteammap_data_id_9177d03c" ON public."FoodWaste_existingdatasharingteammap" USING btree (data_id);


--
-- Name: FoodWaste_existingdatasharingteammap_team_id_1c14a1f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FoodWaste_existingdatasharingteammap_team_id_1c14a1f5" ON public."FoodWaste_existingdatasharingteammap" USING btree (team_id);


--
-- Name: accounts_state_country_id_39e7b64f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_state_country_id_39e7b64f ON public.accounts_state USING btree (country_id);


--
-- Name: accounts_userprofile_country_id_ace726da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userprofile_country_id_ace726da ON public.accounts_userprofile USING btree (country_id);


--
-- Name: accounts_userprofile_role_id_43fb6111; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userprofile_role_id_43fb6111 ON public.accounts_userprofile USING btree (role_id);


--
-- Name: accounts_userprofile_sector_id_a623e498; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userprofile_sector_id_a623e498 ON public.accounts_userprofile USING btree (sector_id);


--
-- Name: accounts_userprofile_state_id_305ae9e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userprofile_state_id_305ae9e2 ON public.accounts_userprofile USING btree (state_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: flowsa_upload_uploaded_by_id_3a089ccd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flowsa_upload_uploaded_by_id_3a089ccd ON public.flowsa_upload USING btree (uploaded_by_id);


--
-- Name: qar5_qapp_division_id_d778ad64; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qapp_division_id_d778ad64 ON public.qar5_qapp USING btree (division_id);


--
-- Name: qar5_qapp_prepared_by_id_a844d543; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qapp_prepared_by_id_a844d543 ON public.qar5_qapp USING btree (prepared_by_id);


--
-- Name: qar5_qappapproval_qapp_id_5ea5abd4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qappapproval_qapp_id_5ea5abd4 ON public.qar5_qappapproval USING btree (qapp_id);


--
-- Name: qar5_qappapprovalsignature_qapp_approval_id_e8805c24; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qappapprovalsignature_qapp_approval_id_e8805c24 ON public.qar5_qappapprovalsignature USING btree (qapp_approval_id);


--
-- Name: qar5_qapplead_qapp_id_9a4cad94; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qapplead_qapp_id_9a4cad94 ON public.qar5_qapplead USING btree (qapp_id);


--
-- Name: qar5_revision_qapp_id_836b0182; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_revision_qapp_id_836b0182 ON public.qar5_revision USING btree (qapp_id);


--
-- Name: qar5_sectiona_sectionb_type_id_be52e018; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_sectiona_sectionb_type_id_be52e018 ON public.qar5_sectiona USING btree (sectionb_type_id);


--
-- Name: scifinder_upload_uploaded_by_id_563fbe4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX scifinder_upload_uploaded_by_id_563fbe4a ON public.scifinder_upload USING btree (uploaded_by_id);


--
-- Name: support_priority_user_id_324b092c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_priority_user_id_324b092c ON public.support_priority USING btree (user_id);


--
-- Name: support_support_created_by_id_c6929fd1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_support_created_by_id_c6929fd1 ON public.support_support USING btree (created_by_id);


--
-- Name: support_support_last_modified_by_id_49cfe585; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_support_last_modified_by_id_49cfe585 ON public.support_support USING btree (last_modified_by_id);


--
-- Name: support_support_priority_id_d8bed132; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_support_priority_id_d8bed132 ON public.support_support USING btree (priority_id);


--
-- Name: support_support_support_type_id_7bc5a55b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_support_support_type_id_7bc5a55b ON public.support_support USING btree (support_type_id);


--
-- Name: support_support_user_id_92b766a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_support_user_id_92b766a7 ON public.support_support USING btree (user_id);


--
-- Name: support_supportattachment_support_id_0dd627d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_supportattachment_support_id_0dd627d1 ON public.support_supportattachment USING btree (support_id);


--
-- Name: support_supportattachment_user_id_7b1ca233; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_supportattachment_user_id_7b1ca233 ON public.support_supportattachment USING btree (user_id);


--
-- Name: support_supporttype_user_id_9ab29626; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX support_supporttype_user_id_9ab29626 ON public.support_supporttype USING btree (user_id);


--
-- Name: teams_team_created_by_id_4d452be8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_team_created_by_id_4d452be8 ON public.teams_team USING btree (created_by_id);


--
-- Name: teams_team_last_modified_by_id_d25361ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_team_last_modified_by_id_d25361ee ON public.teams_team USING btree (last_modified_by_id);


--
-- Name: teams_team_name_c519f9ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_team_name_c519f9ad ON public.teams_team USING btree (name);


--
-- Name: teams_team_name_c519f9ad_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_team_name_c519f9ad_like ON public.teams_team USING btree (name varchar_pattern_ops);


--
-- Name: teams_teammembership_member_id_5d9958f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_teammembership_member_id_5d9958f7 ON public.teams_teammembership USING btree (member_id);


--
-- Name: teams_teammembership_team_id_2ee7a456; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_teammembership_team_id_2ee7a456 ON public.teams_teammembership USING btree (team_id);


--
-- Name: DataSearch_attachment DataSearch_attachment_uploaded_by_id_c3c14fa9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_attachment"
    ADD CONSTRAINT "DataSearch_attachment_uploaded_by_id_c3c14fa9_fk_auth_user_id" FOREIGN KEY (uploaded_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DataSearch_dataattachmentmap DataSearch_dataattach_attachment_id_c9f41a70_fk_DataSearch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_dataattachmentmap"
    ADD CONSTRAINT "DataSearch_dataattach_attachment_id_c9f41a70_fk_DataSearch" FOREIGN KEY (attachment_id) REFERENCES public."DataSearch_attachment"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DataSearch_dataattachmentmap DataSearch_dataattach_data_id_d28146ba_fk_DataSearch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_dataattachmentmap"
    ADD CONSTRAINT "DataSearch_dataattach_data_id_d28146ba_fk_DataSearch" FOREIGN KEY (data_id) REFERENCES public."DataSearch_existingdata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DataSearch_existingdatasharingteammap DataSearch_existingda_data_id_9177d03c_fk_DataSearch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdatasharingteammap"
    ADD CONSTRAINT "DataSearch_existingda_data_id_9177d03c_fk_DataSearch" FOREIGN KEY (data_id) REFERENCES public."DataSearch_existingdata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DataSearch_existingdata DataSearch_existingda_source_id_f5c82b8d_fk_DataSearch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdata"
    ADD CONSTRAINT "DataSearch_existingda_source_id_f5c82b8d_fk_DataSearch" FOREIGN KEY (source_id) REFERENCES public."DataSearch_existingdatasource"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DataSearch_existingdata DataSearch_existingdata_created_by_id_11974ff1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataSearch_existingdata"
    ADD CONSTRAINT "DataSearch_existingdata_created_by_id_11974ff1_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FoodWaste_existingdatasharingteammap FoodWaste_existingda_data_id_9177d03c_fk_FoodWaste; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdatasharingteammap"
    ADD CONSTRAINT "FoodWaste_existingda_data_id_9177d03c_fk_FoodWaste" FOREIGN KEY (data_id) REFERENCES public."FoodWaste_existingdata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FoodWaste_existingdata FoodWaste_existingda_source_id_f5c82b8d_fk_FoodWaste; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdata"
    ADD CONSTRAINT "FoodWaste_existingda_source_id_f5c82b8d_fk_FoodWaste" FOREIGN KEY (source_id) REFERENCES public."FoodWaste_existingdatasource"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FoodWaste_existingdata FoodWaste_existingdata_created_by_id_11974ff1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FoodWaste_existingdata"
    ADD CONSTRAINT "FoodWaste_existingdata_created_by_id_11974ff1_fk_auth_user_id" FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_state accounts_state_country_id_39e7b64f_fk_accounts_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_state
    ADD CONSTRAINT accounts_state_country_id_39e7b64f_fk_accounts_country_id FOREIGN KEY (country_id) REFERENCES public.accounts_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userprofile accounts_userprofile_country_id_ace726da_fk_accounts_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_country_id_ace726da_fk_accounts_country_id FOREIGN KEY (country_id) REFERENCES public.accounts_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userprofile accounts_userprofile_role_id_43fb6111_fk_accounts_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_role_id_43fb6111_fk_accounts_role_id FOREIGN KEY (role_id) REFERENCES public.accounts_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userprofile accounts_userprofile_sector_id_a623e498_fk_accounts_sector_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_sector_id_a623e498_fk_accounts_sector_id FOREIGN KEY (sector_id) REFERENCES public.accounts_sector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userprofile accounts_userprofile_state_id_305ae9e2_fk_accounts_state_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_state_id_305ae9e2_fk_accounts_state_id FOREIGN KEY (state_id) REFERENCES public.accounts_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flowsa_upload flowsa_upload_uploaded_by_id_3a089ccd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowsa_upload
    ADD CONSTRAINT flowsa_upload_uploaded_by_id_3a089ccd_fk_auth_user_id FOREIGN KEY (uploaded_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_qapp qar5_qapp_division_id_d778ad64_fk_qar5_division_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qapp
    ADD CONSTRAINT qar5_qapp_division_id_d778ad64_fk_qar5_division_id FOREIGN KEY (division_id) REFERENCES public.qar5_division(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_qapp qar5_qapp_prepared_by_id_a844d543_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qapp
    ADD CONSTRAINT qar5_qapp_prepared_by_id_a844d543_fk_auth_user_id FOREIGN KEY (prepared_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_qappapproval qar5_qappapproval_qapp_id_5ea5abd4_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappapproval
    ADD CONSTRAINT qar5_qappapproval_qapp_id_5ea5abd4_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_qappapprovalsignature qar5_qappapprovalsig_qapp_approval_id_e8805c24_fk_qar5_qapp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappapprovalsignature
    ADD CONSTRAINT qar5_qappapprovalsig_qapp_approval_id_e8805c24_fk_qar5_qapp FOREIGN KEY (qapp_approval_id) REFERENCES public.qar5_qappapproval(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_qapplead qar5_qapplead_qapp_id_9a4cad94_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qapplead
    ADD CONSTRAINT qar5_qapplead_qapp_id_9a4cad94_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_references qar5_references_qapp_id_c101bce1_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_references
    ADD CONSTRAINT qar5_references_qapp_id_c101bce1_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_revision qar5_revision_qapp_id_836b0182_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_revision
    ADD CONSTRAINT qar5_revision_qapp_id_836b0182_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_sectiona qar5_sectiona_qapp_id_c5e0ce2d_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectiona
    ADD CONSTRAINT qar5_sectiona_qapp_id_c5e0ce2d_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_sectiona qar5_sectiona_sectionb_type_id_be52e018_fk_qar5_sectionbtype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectiona
    ADD CONSTRAINT qar5_sectiona_sectionb_type_id_be52e018_fk_qar5_sectionbtype_id FOREIGN KEY (sectionb_type_id) REFERENCES public.qar5_sectionbtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_sectionb qar5_sectionb_qapp_id_f537d979_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectionb
    ADD CONSTRAINT qar5_sectionb_qapp_id_f537d979_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_sectionc qar5_sectionc_qapp_id_3c2dca9e_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectionc
    ADD CONSTRAINT qar5_sectionc_qapp_id_3c2dca9e_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_sectiond qar5_sectiond_qapp_id_0bb8c801_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_sectiond
    ADD CONSTRAINT qar5_sectiond_qapp_id_0bb8c801_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scifinder_upload scifinder_upload_uploaded_by_id_563fbe4a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scifinder_upload
    ADD CONSTRAINT scifinder_upload_uploaded_by_id_563fbe4a_fk_auth_user_id FOREIGN KEY (uploaded_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_priority support_priority_user_id_324b092c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_priority
    ADD CONSTRAINT support_priority_user_id_324b092c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_support support_support_created_by_id_c6929fd1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_created_by_id_c6929fd1_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_support support_support_last_modified_by_id_49cfe585_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_last_modified_by_id_49cfe585_fk_auth_user_id FOREIGN KEY (last_modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_support support_support_priority_id_d8bed132_fk_support_priority_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_priority_id_d8bed132_fk_support_priority_id FOREIGN KEY (priority_id) REFERENCES public.support_priority(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_support support_support_support_type_id_7bc5a55b_fk_support_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_support_type_id_7bc5a55b_fk_support_s FOREIGN KEY (support_type_id) REFERENCES public.support_supporttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_support support_support_user_id_92b766a7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_user_id_92b766a7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_supportattachment support_supportattac_support_id_0dd627d1_fk_support_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_supportattachment
    ADD CONSTRAINT support_supportattac_support_id_0dd627d1_fk_support_s FOREIGN KEY (support_id) REFERENCES public.support_support(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_supportattachment support_supportattachment_user_id_7b1ca233_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_supportattachment
    ADD CONSTRAINT support_supportattachment_user_id_7b1ca233_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: support_supporttype support_supporttype_user_id_9ab29626_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support_supporttype
    ADD CONSTRAINT support_supporttype_user_id_9ab29626_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams_team teams_team_created_by_id_4d452be8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_team
    ADD CONSTRAINT teams_team_created_by_id_4d452be8_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams_team teams_team_last_modified_by_id_d25361ee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_team
    ADD CONSTRAINT teams_team_last_modified_by_id_d25361ee_fk_auth_user_id FOREIGN KEY (last_modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams_teammembership teams_teammembership_member_id_5d9958f7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_teammembership
    ADD CONSTRAINT teams_teammembership_member_id_5d9958f7_fk_auth_user_id FOREIGN KEY (member_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teams_teammembership teams_teammembership_team_id_2ee7a456_fk_teams_team_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams_teammembership
    ADD CONSTRAINT teams_teammembership_team_id_2ee7a456_fk_teams_team_id FOREIGN KEY (team_id) REFERENCES public.teams_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

