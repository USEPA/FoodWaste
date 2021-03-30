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
-- Name: projects_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_branch (
    id integer NOT NULL,
    date_created timestamp with time zone,
    last_modified timestamp with time zone,
    name character varying(255),
    weblink character varying(255),
    description text,
    center_office_id integer,
    division_id integer,
    office_id integer
);


ALTER TABLE public.projects_branch OWNER TO postgres;

--
-- Name: projects_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_branch_id_seq OWNER TO postgres;

--
-- Name: projects_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_branch_id_seq OWNED BY public.projects_branch.id;


--
-- Name: projects_centeroffice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_centeroffice (
    id integer NOT NULL,
    date_created timestamp with time zone,
    last_modified timestamp with time zone,
    name character varying(255),
    weblink character varying(255),
    description text,
    office_id integer
);


ALTER TABLE public.projects_centeroffice OWNER TO postgres;

--
-- Name: projects_centeroffice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_centeroffice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_centeroffice_id_seq OWNER TO postgres;

--
-- Name: projects_centeroffice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_centeroffice_id_seq OWNED BY public.projects_centeroffice.id;


--
-- Name: projects_division; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_division (
    id integer NOT NULL,
    date_created timestamp with time zone,
    last_modified timestamp with time zone,
    name character varying(255),
    weblink character varying(255),
    description text,
    center_office_id integer,
    office_id integer
);


ALTER TABLE public.projects_division OWNER TO postgres;

--
-- Name: projects_division_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_division_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_division_id_seq OWNER TO postgres;

--
-- Name: projects_division_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_division_id_seq OWNED BY public.projects_division.id;


--
-- Name: projects_office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_office (
    id integer NOT NULL,
    date_created timestamp with time zone,
    last_modified timestamp with time zone,
    name character varying(255),
    weblink character varying(255),
    description text
);


ALTER TABLE public.projects_office OWNER TO postgres;

--
-- Name: projects_office_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_office_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_office_id_seq OWNER TO postgres;

--
-- Name: projects_office_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_office_id_seq OWNED BY public.projects_office.id;


--
-- Name: projects_ordrap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_ordrap (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.projects_ordrap OWNER TO postgres;

--
-- Name: projects_ordrap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_ordrap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_ordrap_id_seq OWNER TO postgres;

--
-- Name: projects_ordrap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_ordrap_id_seq OWNED BY public.projects_ordrap.id;


--
-- Name: projects_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_project (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    branch_id integer,
    center_office_id integer,
    division_id integer,
    office_id integer,
    ord_rap_id integer,
    created_by_id integer,
    created_date timestamp with time zone,
    last_modified_date timestamp with time zone NOT NULL,
    project_lead_id integer
);


ALTER TABLE public.projects_project OWNER TO postgres;

--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_project_id_seq OWNER TO postgres;

--
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects_project.id;


--
-- Name: projects_projectsharingteammap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_projectsharingteammap (
    id integer NOT NULL,
    added_date timestamp with time zone NOT NULL,
    can_edit boolean NOT NULL,
    project_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.projects_projectsharingteammap OWNER TO postgres;

--
-- Name: projects_projectsharingteammap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_projectsharingteammap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_projectsharingteammap_id_seq OWNER TO postgres;

--
-- Name: projects_projectsharingteammap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_projectsharingteammap_id_seq OWNED BY public.projects_projectsharingteammap.id;


--
-- Name: qar5_division; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_division (
    id integer NOT NULL,
    name text NOT NULL
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
    division_branch text NOT NULL,
    title text NOT NULL,
    qa_category text NOT NULL,
    intra_extra character varying(64) NOT NULL,
    revision_number text NOT NULL,
    date timestamp with time zone NOT NULL,
    prepared_by_id integer,
    strap text NOT NULL,
    tracking_id text NOT NULL,
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
    project_plan_title text NOT NULL,
    activity_number text NOT NULL,
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
    name text,
    signature text,
    date text,
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
    name text NOT NULL,
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
-- Name: qar5_qappsharingteammap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_qappsharingteammap (
    id integer NOT NULL,
    added_date timestamp with time zone NOT NULL,
    can_edit boolean NOT NULL,
    qapp_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.qar5_qappsharingteammap OWNER TO postgres;

--
-- Name: qar5_qappsharingteammap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.qar5_qappsharingteammap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qar5_qappsharingteammap_id_seq OWNER TO postgres;

--
-- Name: qar5_qappsharingteammap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.qar5_qappsharingteammap_id_seq OWNED BY public.qar5_qappsharingteammap.id;


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
    revision text NOT NULL,
    description text NOT NULL,
    effective_date timestamp with time zone NOT NULL,
    initial_version text NOT NULL,
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
    a3 text NOT NULL,
    a4 text NOT NULL,
    a4_chart character varying(100),
    a5 text NOT NULL,
    a6 text NOT NULL,
    a7 text NOT NULL,
    a8 text NOT NULL,
    a9 text NOT NULL,
    a9_drive_path text NOT NULL,
    sectionb_type_id integer,
    a2 text NOT NULL
);


ALTER TABLE public.qar5_sectiona OWNER TO postgres;

--
-- Name: qar5_sectionb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectionb (
    qapp_id integer NOT NULL,
    b1_2 text,
    b1_3 text,
    b1_4 text,
    b1_5 text,
    b2_1 text,
    b2_2 text,
    b2_3 text,
    b2_4 text,
    b2_5 text,
    b1_1 text,
    b2_6 text,
    b2_7 text,
    b2_8 text,
    b3_1 text,
    b3_10 text,
    b3_2 text,
    b3_3 text,
    b3_4 text,
    b3_5 text,
    b3_6 text,
    b3_7 text,
    b3_8 text,
    b3_9 text,
    b4_1 text,
    b4_2 text,
    b4_3 text,
    b4_4 text,
    b4_5 text,
    b5_1 text,
    b5_2 text,
    b6_1 text,
    b6_2 text
);


ALTER TABLE public.qar5_sectionb OWNER TO postgres;

--
-- Name: qar5_sectionbtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectionbtype (
    id integer NOT NULL,
    name text NOT NULL
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
    qapp_id integer NOT NULL
);


ALTER TABLE public.qar5_sectionc OWNER TO postgres;

--
-- Name: qar5_sectiond; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qar5_sectiond (
    qapp_id integer NOT NULL,
    d1 text NOT NULL,
    d2 text NOT NULL,
    d3 text NOT NULL
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
-- Name: projects_branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_branch ALTER COLUMN id SET DEFAULT nextval('public.projects_branch_id_seq'::regclass);


--
-- Name: projects_centeroffice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_centeroffice ALTER COLUMN id SET DEFAULT nextval('public.projects_centeroffice_id_seq'::regclass);


--
-- Name: projects_division id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_division ALTER COLUMN id SET DEFAULT nextval('public.projects_division_id_seq'::regclass);


--
-- Name: projects_office id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_office ALTER COLUMN id SET DEFAULT nextval('public.projects_office_id_seq'::regclass);


--
-- Name: projects_ordrap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_ordrap ALTER COLUMN id SET DEFAULT nextval('public.projects_ordrap_id_seq'::regclass);


--
-- Name: projects_project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project ALTER COLUMN id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);


--
-- Name: projects_projectsharingteammap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_projectsharingteammap ALTER COLUMN id SET DEFAULT nextval('public.projects_projectsharingteammap_id_seq'::regclass);


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
-- Name: qar5_qappsharingteammap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappsharingteammap ALTER COLUMN id SET DEFAULT nextval('public.qar5_qappsharingteammap_id_seq'::regclass);


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
1	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Plastic	Co-pyrolysis characteristics and kinetic analysis of organic food waste and plastic	t	https://www.sciencedirect.com/science/article/pii/S0960852417317893	2019-10-25 08:40:43-04	https://www.sciencedirect.com/science/article/pii/S0960852417317893	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0960852417317893/
12	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Plastic Contamination	UK Waste Strategy: Bioeconomy Opportunities Aplenty	f	Bob Horton, Jeremy Tomkinson, and Adrian Higson.Industrial Biotechnology.Apr 2019.ahead of printhttp://doi.org/10.1089/ind.2019.29161.bho	2019-11-04 10:40:33.876546-05		1	5		https://www.liebertpub.com/doi/abs/10.1089/ind.2019.29161.bho?journalCode=ind
4	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Recovery	Comparison through a LCA evaluation analysis of food waste disposal options from the perspective of global warming and resource recovery	f	Mi-Hyung Kim, Jung-Wk Kim. Elsevier.  https://www.sciencedirect.com/science/article/pii/S0048969710004456. https://doi.org/10.1016/j.scitotenv.2010.04.049.	2019-10-30 06:23:24-04	Keywords: Food waste management,  Life cycle assessment, Resource recovery, Environmental impacts.	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0048969710004456?via%3Dihub
5	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Recovery Environmental Engineering	Sustainable Management of Coffee and Cocoa Agro-Waste	f	Pushpa S. Murthy (Central Food Technological Research Institute, India), Nivas Manohar Desai (Central Food Technological Research Institute, India) and Siridevi G. B. (Central Food Technological Research Institute, India).	2019-10-30 06:32:37-04	https://www.igi-global.com/chapter/sustainable-management-of-coffee-and-cocoa-agro-waste/222995	1	1	\N	https://www.igi-global.com/chapter/sustainable-management-of-coffee-and-cocoa-agro-waste/222995
6	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	food waste disposal options	Life cycle assessment (LCA) of food waste treatment in Hong Kong: On-site fermentation methodology	f	Journal of Environmental Management. Volume 240, 15 June 2019, Pages 343-351. https://www.sciencedirect.com/science/article/pii/S0301479719304323.	2019-10-30 06:47:29-04	This paper utilizes Life Cycle Assessment (LCA) to determine the environmental impacts associated with this S-FRB technology and identify environmental hotspots to reduce these impacts. In this paper, we have conducted an on-site pilot-scale study for 2 months at a canteen located at the City University of Hong Kong, which resulted in a 90% reduction in the mass of food waste treated in the S-FRB system.	1	1	\N	https://www.sciencedirect.com/science/article/pii/S0301479719304323
8	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Recycle	Recycle food wastes into high quality fish feeds for safe and quality fish production	f	Ming-Hung Wonga, Wing-Yin Mo, Wai-Ming Choi, Zhang Cheng, Yu-Bon Man.  "Recycle food wastes into high quality fish feeds for safe and quality fish production." Elsevier. Environmental Pollution, Volume 219, December 2016, Pages 631-638. https://doi.org/10.1016/j.envpol.2016.06.035.	2019-10-30 14:41:06-04	\N	1	1	\N	https://doi.org/10.1016/j.envpol.2016.06.035
10	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste De-Packaging	The sounding side of materials and products. A sensory interaction revaluated in the user-experience	f	Lerma, Beatrice (2019)  Cuaderno 94. "The sounding side of materials and products. A sensory interaction revaluated in the user-experience." Pages 99 thru 107. Cuaderno 94 |  Centro de Estudios en Diseño y Comunicación (2020/2021). pp 99 - 107  ISSN 1668-0227. Accessed 11/1/2019. https://fido.palermo.edu/servicios_dyc/publicacionesdc/archivos/777_libro.pdf#page=99.	2019-11-01 06:11:49-04	\N	1	1	\N	https://fido.palermo.edu/servicios_dyc/publicacionesdc/archivos/777_libro.pdf#page=99
11	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	plastic waste in food	Feasibility Study on the Application of Fabricated Multipurpose Food Packaging Plastic (MFPP) Liner as Alternative Landfill Liner Material in Sustainable Landfill Infrastructure Model	f	Feasibility Study on the Application of Fabricated Multipurpose Food Packaging Plastic (MFPP) Liner as Alternative Landfill Liner Material in Sustainable Landfill Infrastructure Model. https://www.scientific.net/KEM.821.343.	2019-11-01 08:59:06-04	Multipurpose Food Packaging Plastic (MFPP) is one of the largest residential and commercial solid waste all over the world. BWP is categorized under Non-Biodegradable Plastic Waste (N-BPW). Due to its inability to degrade, this abundance of N-BPW caused space decrement in landfill. Many methods have been proposed for recycling of N-BPW such as incorporating N-BPW into road construction and added material in concrete production. In the present study, the feasibility of using MFPP as landfill liner material is studied through a series of laboratory testing in terms of mechanical and chemical characteristics. The liner sample was prepared in terms of a fabricated layer (combination of 60 layers (Sample A) and 80 layers (Sample B) of a single plastic). The fabricated layers were prepared by applying hot-pressing technique to increase the strength of the surface attachment between each of the layers. The prepared fabricated MFPP liners were tested for Ultimate Tensile Strength Test (UTS), Scanning Electron Microscopy (SEM) and X-Ray Distraction (XRD). The tested samples were then compared with the Conventional Geomembranes (GMs). Obtained results indicated that proposed fabricated MFPP Liner had 70% similar characteristics to GMs. In addition, the fabricated MFPP Liners have an ability to sustain maximum loading higher than Conventional GMs. These desirable characteristics indicated that the fabricated MFPP Liners has potential to be used as landfill liner material.	1	1	\N	https://www.scientific.net/KEM.821.343
13	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	USEEIO model	Method for endogenizing capital in the United States Environmentally‐Extended Input‐Output model	f	https://doi.org/10.1111/jiec.12931	2019-11-06 10:54:23.335089-05	Each year businesses, governments, and homeowners in the United States invest around one fifth of gross domestic product into the creation of capital assets such as buildings, machinery, and software to enable production and consumption.	1	5		https://onlinelibrary.wiley.com/doi/abs/10.1111/jiec.12931
3	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste De-Packaging	Systems and Methods for Enviornmentally Undisruptive Disposal of Food Waste	f	https://patentimages.storage.googleapis.com/5b/19/87/07322cddd0a739/US20100071602A1.pdf	2019-10-25 08:41:05-04	Abstract. A processing facility can dispose of food waste in environmentally un-disruptive manners. The processing facility can convert the food waste into bio-energy and bio-fuel products, such as bio-diesel, ethanol, and electricity. The processing facility can sort the food waste based on the fats or carbohydrates content of the food waste, and the processing facility can include a fluidized bed combustion module for combusting portions of the food waste.	1	1	\N	https://patentimages.storage.googleapis.com/5b/19/87/07322cddd0a739/US20100071602A1.pdf
23	Pegasus	sylvest.nicholas01@epa.gov	5135697070	SMICON	SMICON Depackager	f	.	2020-04-10 10:11:57.495272-04		12	11	Plastic, SMICON, depackage, depackager, machine, datasheet	https://vdrs.com/wp-content/uploads/2019/03/SMIMO120_Datasheet.pdf
24	Pegasus	sylvest.nicholas01@epa.gov	5135697070	Plastic	SMICON	f	[add citation]	2020-04-10 10:40:46.685454-04		12	1		https://vdrs.com/wp-content/uploads/2019/03/SMIMO120_Datasheet.pdf
14	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Laboratory Analysis	Food Analysis Laboratory Manual	f	Nielsen, Suzanne 2017. Food Analysis Laboratory Manual. Springer International Publishing.	2019-12-18 06:27:34.643116-05	This third edition laboratory manual was written to accompany Food Analysis, Fifth Edition, by the same author. New to this third edition of the laboratory manual are four introductory chapters that complement both the textbook chapters and the laboratory exercises.  The 24 laboratory exercises in the manual cover 21 of the 35 chapters in the textbook. DOI: 10.1007/978-3-319-44127-6. ISBN: 9783319441276 (online) 9783319441252 (print).	1	2	Industrial Chemistry/Chemical Engineering, Food Science, Spectroscopy/Spectrometry, Chemistry, Chemical engineering, Food science, Spectroscopy	https://www.springer.com/gp/book/9783319441252#aboutAuthors
15	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Analysis Laboratories in USA	Food Labs and Services	f	N/A	2019-12-18 06:45:10.72643-05	This is a food waste testing lab and we need to add 'OTHER' as an option for SOURCE... placed temporarily under proceedings.	1	8	Testing services, training, consulting, auditing, certification, on-site testing, product design, research, development	https://www.eurofinsus.com/food/
16	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Data Set .xlxs	FUSIONS Food waste data set for EU-28 New Estimates and Environmental Impact	f	N/A	2019-12-19 06:41:07.711969-05	Food waste is an issue of importance to global food security and good environmental governance, directly linked with all aspects of sustainability (e.g. availability of resources, increasing costs and health). The amount of food produced but not consumed leads to negative impacts throughout the food supply chain and households. There is a pressing need to prevent food waste to make the transition to a resource efficient Europe. Previous studies show the necessity for more consistent and comparable data in order to decrease the uncertainties and making it possible to better understand the magnitude of the problem, and the scale of the potential opportunities.	1	1	Food supply chain and Food waste	https://ec.europa.eu/food/sites/food/files/safety/docs/fw_lib_fw_expo2015_fusions_data-set_151015.pdf
17	ORD/CESER/LRTD	young.daniel@epa.gov	513-569-7451	Coffee grounds recycling	17 Genius Ways To Recycle Used Coffee Grounds	f	Editorial Team, Natural Living Ideas.com, https://www.naturallivingideas.com/recycle-used-coffee-grounds/. Accessed January 7, 2020.	2020-01-07 07:50:38.212794-05		1	11	coffee, grounds, reuse	https://www.naturallivingideas.com/recycle-used-coffee-grounds/
18	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	A Winning Formula: Making Connections to Turn Food Waste into Energy	A Winning Formula: Making Connections to Turn Food Waste into Energy	f	N/A	2020-01-08 04:47:55.057339-05	N/A	1	1		https://www.epa.gov/sciencematters/winning-formula-making-connections-turn-food-waste-energy
19	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Food Waste Sampling	An interdisciplinary living laboratory approach to investigate college food waste co-composting with additional on-site organic waste feedstocks	f	Anne B. Alerding, Jennifer E. DeHart, David K. Kniffin, Nattachat Srikongyos, Michael J. DeBlasio, Jacob M. Kelliher, James A. Marsh, Heather L. Magill, Charles D. Newhouse, Samuel K. Allen, Paul J. Ackerman, and Emily L. Lilly\r\nInternational Journal of Environment and Waste Management 2019 24:1, 61-80.	2020-01-08 06:42:34.418278-05	In an effort to curb the monetary and environmental costs of food waste disposal, colleges and universities are developing composting programs. Incorporating additional on-site wastes could improve composting efficiency and provide cost savings.	1	5	aerated static pile, ASP, bacteria, compost, food waste, living laboratory, waste management, organic waste, co-composting	https://www.inderscienceonline.com/doi/abs/10.1504/IJEWM.2019.100658
20	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	microsplastics in food	Microplastics, a food safety issue?	f	Rainieri S., Barranco A. (2019)  Trends in Food Science and Technology,  84 , pp. 55-57.	2020-01-28 13:43:36.483507-05	Review Description\r\nThe risk posed by microplastics for human and environment, has become a hot topic. The concern is focused not only on the effect of microplastics as such but also on additives and chemical contaminants absorbed by microplastics that may be released and affect negatively animals and environmental health. Despite several works have been written on this topic, a number of knowledge gaps still should be filled to enable a correct risk assessment of this important issue. For example, the relevance of microplastics for food safety has not yet been fully established and scientific results aimed at establishing a possible health risk for contaminants associated with microplastics are rather controversial. The risk assessment of microplastics in foodstuff is still at a very early stage and very few studies on the monitoring of microplastics in foodstuff and their effects on human health are available. Additionally, it is difficult to compare results from different studies as methodologies and study designs are not uniform. For this reason, it is not always possible to reach some definitive conclusion. This work sets out to complement the reviews and statements already existing, by updating the information and identifying if any of the knowledge gaps have been covered and if further ones have been detected with the final aim of properly assessing and managing this emerging risk.	1	5	Microplastics\r\nPOPs\r\nToxicity\r\nNanoplastics\r\nRisk assessment	https://www.sciencedirect.com/science/article/abs/pii/S0924224417303898
21	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Effects of food presence on microplastic ingestion and egestion in Mytilus galloprovincialis	Effects of food presence on microplastic ingestion and egestion in Mytilus galloprovincialis	t	xxx	2020-01-29 09:32:20.168344-05	Research on plastic pollution in marine environments has increased exponentially in the recent decades (Strungaru et al., 2019, Alimba and Faggio, 2019). In particular, small particles of manufactured or weathered plastic (microplastics (MPs), <5 mm), characterized by global abundance, have been studied extensively. MPs are widely distributed and have been monitored in polar regions (Lusher et al., 2015, Waller et al., 2017), tropical regions (Lima et al., 2014, Do Sul et al., 2014), the East (Ng and Obbard, 2006, Isobe et al., 2015), the West (Claessens et al., 2011, Collignon et al., 2012, Alomar et al., 2016, Bellas et al., 2016), coastal areas (de Lucia et al., 2014, Stolte et al., 2015), open seas (Reisser et al., 2014, Romeo et al., 2015), sea surfaces (Song et al., 2014, Song et al., 2015), and the deep sea (Van Cauwenberghe et al., 2013, Taylor et al., 2016).	1	5	Plastic particle, Mussel, Egestion rate, Mytilus gallo, provincialis marine pollution	https://www.sciencedirect.com/science/article/pii/S0045653519320946
22	ORD/CESER/LRTD/EDAB	young.daniel@epa.gov	(513) 569-7451	Application of Statistical Inferencing for Generic Exposure Scenario Modeling	Lack of confidence in approximate Bayesian computation model choice	f	Christian P. Robert, Jean-Marie Cornuet, Jean-Michel Marin, and Natesh S. Pillai. Lack of confidence in approximate Bayesian computation model choice. PNAS September 13, 2011 108 (37) 15112-15117; https://doi.org/10.1073/pnas.1102900108	2020-03-17 07:17:41.980671-04		1	5	Bayes factor, Bayesian model choice, likelihood-free methods, sufficient statistics, consistent tests	https://www.pnas.org/content/108/37/15112.short
25	RSKSOP 253	brown.jamesm@epa.gov	(580) 436-8760	ROWAN dominator	Rowan Dominator brochure	f	The Dominator Depackaging Machine. (2020). The Dominator Depackaging Machine. Retrieved from https://www.dominator-depackaging.com/resources/downloads/the-dominator-depackaging-machine-brochure/download	2020-04-10 13:35:43.854325-04		14	11	Rowan, Dominator, depackaging	https://www.dominator-depackaging.com/resources/downloads
26	RSKSOP 253	brown.jamesm@epa.gov	(580) 436-8760	ROWAN dominator	Rowan Dominator brochure	f	The Dominator Depackaging Machine. (2020). The Dominator Depackaging Machine. Retrieved from https://www.dominator-depackaging.com/resources/downloads/the-dominator-depackaging-machine-brochure/download	2020-04-10 16:06:53.051265-04		14	11	Rowan, Dominator, depackaging	https://www.dominator-depackaging.com/resources/downloads
\.


--
-- Data for Name: DataSearch_existingdatasharingteammap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DataSearch_existingdatasharingteammap" (id, added_date, can_edit, data_id, team_id) FROM stdin;
13	2019-11-06 10:54:23.393119-05	t	13	18
22	2020-03-17 07:17:41.992725-04	t	22	1
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
3	2020-03-02 11:04:21.679902-05	2020-03-02 11:04:21.700951-05	USEPA	Environmental Engineer	61 Forsyth Street		Atlanta	30303	232	2	3	11	3
2	2020-02-28 13:37:59.819646-05	2020-03-03 09:59:40.79715-05	EPA	Director of Quality Assurance	26 Martin Luther King Dr W		Cincinnati	45211	232	2	3	36	2
8	2020-03-18 15:02:44.552659-04	2020-03-18 15:02:44.570948-04	Pegasus Technical Services	Engineer	26 W. martin Luther King Dr		Cincinnati	45268	232	2	5	36	8
9	2020-03-23 05:12:46.458965-04	2020-03-23 05:12:46.459003-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9
11	2020-03-23 05:16:44.975526-04	2020-03-23 05:16:44.975557-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11
10	2020-03-23 05:14:44.474516-04	2020-03-23 13:43:08.193918-04	USEPA/ORD/CESER/LRTD/EDAB	Chemical Engineer	26 W. Martin Luther King Dr.	MS 483	Cincinnati	45268	232	2	3	36	10
12	2020-04-10 09:00:24.787318-04	2020-04-10 09:15:54.912309-04	Pegasus	Chemist	26 W Martin Luther King Dr		Cincinnati	45220	232	2	3	36	12
14	2020-04-10 09:27:18.500694-04	2020-04-10 09:39:22.947668-04	Contractor	Analytical Chemist 2	19075 cr 3560		Ada	74820	232	2	4	37	14
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
145	Can add qapp sharing team map	37	add_qappsharingteammap
146	Can change qapp sharing team map	37	change_qappsharingteammap
147	Can delete qapp sharing team map	37	delete_qappsharingteammap
148	Can view qapp sharing team map	37	view_qappsharingteammap
149	Can add branch	38	add_branch
150	Can change branch	38	change_branch
151	Can delete branch	38	delete_branch
152	Can view branch	38	view_branch
153	Can add center office	39	add_centeroffice
154	Can change center office	39	change_centeroffice
155	Can delete center office	39	delete_centeroffice
156	Can view center office	39	view_centeroffice
157	Can add division	40	add_division
158	Can change division	40	change_division
159	Can delete division	40	delete_division
160	Can view division	40	view_division
161	Can add office	41	add_office
162	Can change office	41	change_office
163	Can delete office	41	delete_office
164	Can view office	41	view_office
165	Can add ord rap	42	add_ordrap
166	Can change ord rap	42	change_ordrap
167	Can delete ord rap	42	delete_ordrap
168	Can view ord rap	42	view_ordrap
169	Can add project	43	add_project
170	Can change project	43	change_project
171	Can delete project	43	delete_project
172	Can view project	43	view_project
173	Can add project sharing team map	44	add_projectsharingteammap
174	Can change project sharing team map	44	change_projectsharingteammap
175	Can delete project sharing team map	44	delete_projectsharingteammap
176	Can view project sharing team map	44	view_projectsharingteammap
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$180000$055Punp8ubHJ$a5DARhBtZS0rh8YhrJLWi+1CJBC9R/8v2TgI8QtGemQ=	\N	f	WesIngwersen	Wesley	Ingwersen	ingwersen.wesley@epa.gov	f	f	2020-03-02 11:04:21.495328-05
12	pbkdf2_sha256$180000$az1kdTP9Mgmm$Ou8VsXxj3sHaHieXru3O2Qf24gt5AfhdagblCIdgEOg=	2020-04-10 09:21:20.312843-04	f	sylvest.nicholas01@epa.gov	Nicholas	Sylvest	sylvest.nicholas01@epa.gov	f	t	2020-04-10 09:00:24-04
10	pbkdf2_sha256$180000$qpwjnpJJFdv1$QJn3/dN4IJlO9gVyaYMi7JcycGN0ERJJpJy0qOWO7Sw=	2020-03-23 13:44:34.358521-04	t	meyerd	David	Meyer	meyer.david@epa.gov	f	t	2020-03-23 05:14:44-04
14	pbkdf2_sha256$180000$mrwqAZ3KeHdU$vzD+xJFyDXSZUe6NMyM6UzFH53oiQcwPik6JCwN3Ubk=	2020-04-10 09:39:50.948234-04	f	JBrown03	James	Brown	brown.jamesm@epa.gov	f	t	2020-04-10 09:27:18-04
1	pbkdf2_sha256$180000$Vmo6Q2n9nlia$APlqU+/qSDSX6hkXG2HD4mURvwLtQwx47iBl/NMWyy0=	2020-04-13 07:57:29.836529-04	t	dyoung11	Daniel	Young	Young.Daniel@epa.gov	t	t	2019-07-16 08:00:00-04
11	pbkdf2_sha256$180000$nMFYwRbVaGnG$vDkzfrKEaDoHNy/NTw/pWU8QeOEhAcfckOLG/vWo4zc=	2020-03-31 09:37:37.667934-04	t	hoellej	Jill	Hoelle	hoelle.jill@epa.gov	f	t	2020-03-23 05:16:44-04
9	pbkdf2_sha256$180000$DFbwA5XYQVYk$MmR5U1xExWWK5KtZDk76wtYKN5x0XOb1U20dnq9rEHg=	\N	t	gonzalezm	Michael	Gonzalez	gonzalez.michael@epa.gov	f	t	2020-03-23 05:12:46-04
2	pbkdf2_sha256$180000$hkgPm8e9s09j$PWNUJ6iWBeSkapbtUm0aIeBZaQUYv5ZYmZ4fEY6h2FY=	2020-03-03 10:00:23-05	t	sjones04	Steven	Jones	Jones.Steven@epa.gov	f	t	2020-02-28 13:37:59-05
8	pbkdf2_sha256$180000$7wnlasKyJPoz$sIdItcU8bLrKCR74VbOWHsGCmNEuJA9wxu4E8RM3hik=	2020-04-10 09:17:38.165072-04	t	raghuraman.venkatapathy	Raghuraman	Venkatapathy	venkatapathy.raghuraman@epa.gov	t	t	2020-03-18 15:02:44-04
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
1	2	25
2	9	1
3	9	2
4	9	3
5	9	4
6	9	5
7	9	6
8	9	7
9	9	8
10	9	9
11	9	10
12	9	11
13	9	12
14	9	13
15	9	14
16	9	15
17	9	16
18	9	17
19	9	18
20	9	19
21	9	20
22	9	21
23	9	22
24	9	23
25	9	24
26	9	25
27	9	26
28	9	27
29	9	28
30	9	29
31	9	30
32	9	31
33	9	32
34	9	33
35	9	34
36	9	35
37	9	36
38	9	37
39	9	38
40	9	39
41	9	40
42	9	41
43	9	42
44	9	43
45	9	44
46	9	45
47	9	46
48	9	47
49	9	48
50	9	49
51	9	50
52	9	51
53	9	52
54	9	53
55	9	54
56	9	55
57	9	56
58	9	57
59	9	58
60	9	59
61	9	60
62	9	61
63	9	62
64	9	63
65	9	64
66	9	65
67	9	66
68	9	67
69	9	68
70	9	69
71	9	70
72	9	71
73	9	72
74	9	73
75	9	74
76	9	75
77	9	76
78	9	77
79	9	78
80	9	79
81	9	80
82	9	81
83	9	82
84	9	83
85	9	84
86	9	85
87	9	86
88	9	87
89	9	88
90	9	89
91	9	90
92	9	91
93	9	92
94	9	93
95	9	94
96	9	95
97	9	96
98	9	97
99	9	98
100	9	99
101	9	100
102	9	101
103	9	102
104	9	103
105	9	104
106	9	105
107	9	106
108	9	107
109	9	108
110	9	109
111	9	110
112	9	111
113	9	112
114	9	113
115	9	114
116	9	115
117	9	116
118	9	117
119	9	118
120	9	119
121	9	120
122	9	121
123	9	122
124	9	123
125	9	124
126	9	125
127	9	126
128	9	127
129	9	128
130	9	129
131	9	130
132	9	131
133	9	132
134	9	133
135	9	134
136	9	135
137	9	136
138	9	137
139	9	138
140	9	139
141	9	140
142	9	141
143	9	142
144	9	143
145	9	144
146	9	145
147	9	146
148	9	147
149	9	148
150	10	1
151	10	2
152	10	3
153	10	4
154	10	5
155	10	6
156	10	7
157	10	8
158	10	9
159	10	10
160	10	11
161	10	12
162	10	13
163	10	14
164	10	15
165	10	16
166	10	17
167	10	18
168	10	19
169	10	20
170	10	21
171	10	22
172	10	23
173	10	24
174	10	25
175	10	26
176	10	27
177	10	28
178	10	29
179	10	30
180	10	31
181	10	32
182	10	33
183	10	34
184	10	35
185	10	36
186	10	37
187	10	38
188	10	39
189	10	40
190	10	41
191	10	42
192	10	43
193	10	44
194	10	45
195	10	46
196	10	47
197	10	48
198	10	49
199	10	50
200	10	51
201	10	52
202	10	53
203	10	54
204	10	55
205	10	56
206	10	57
207	10	58
208	10	59
209	10	60
210	10	61
211	10	62
212	10	63
213	10	64
214	10	65
215	10	66
216	10	67
217	10	68
218	10	69
219	10	70
220	10	71
221	10	72
222	10	73
223	10	74
224	10	75
225	10	76
226	10	77
227	10	78
228	10	79
229	10	80
230	10	81
231	10	82
232	10	83
233	10	84
234	10	85
235	10	86
236	10	87
237	10	88
238	10	89
239	10	90
240	10	91
241	10	92
242	10	93
243	10	94
244	10	95
245	10	96
246	10	97
247	10	98
248	10	99
249	10	100
250	10	101
251	10	102
252	10	103
253	10	104
254	10	105
255	10	106
256	10	107
257	10	108
258	10	109
259	10	110
260	10	111
261	10	112
262	10	113
263	10	114
264	10	115
265	10	116
266	10	117
267	10	118
268	10	119
269	10	120
270	10	121
271	10	122
272	10	123
273	10	124
274	10	125
275	10	126
276	10	127
277	10	128
278	10	129
279	10	130
280	10	131
281	10	132
282	10	133
283	10	134
284	10	135
285	10	136
286	10	137
287	10	138
288	10	139
289	10	140
290	10	141
291	10	142
292	10	143
293	10	144
294	10	145
295	10	146
296	10	147
297	10	148
298	2	1
299	2	2
300	2	3
301	2	4
302	2	5
303	2	6
304	2	7
305	2	8
306	2	9
307	2	10
308	2	11
309	2	12
310	2	13
311	2	14
312	2	15
313	2	16
314	2	17
315	2	18
316	2	19
317	2	20
318	2	21
319	2	22
320	2	23
321	2	24
322	2	26
323	2	27
324	2	28
325	2	29
326	2	30
327	2	31
328	2	32
329	2	33
330	2	34
331	2	35
332	2	36
333	2	37
334	2	38
335	2	39
336	2	40
337	2	41
338	2	42
339	2	43
340	2	44
341	2	45
342	2	46
343	2	47
344	2	48
345	2	49
346	2	50
347	2	51
348	2	52
349	2	53
350	2	54
351	2	55
352	2	56
353	2	57
354	2	58
355	2	59
356	2	60
357	2	61
358	2	62
359	2	63
360	2	64
361	2	65
362	2	66
363	2	67
364	2	68
365	2	69
366	2	70
367	2	71
368	2	72
369	2	73
370	2	74
371	2	75
372	2	76
373	2	77
374	2	78
375	2	79
376	2	80
377	2	81
378	2	82
379	2	83
380	2	84
381	2	85
382	2	86
383	2	87
384	2	88
385	2	89
386	2	90
387	2	91
388	2	92
389	2	93
390	2	94
391	2	95
392	2	96
393	2	97
394	2	98
395	2	99
396	2	100
397	2	101
398	2	102
399	2	103
400	2	104
401	2	105
402	2	106
403	2	107
404	2	108
405	2	109
406	2	110
407	2	111
408	2	112
409	2	113
410	2	114
411	2	115
412	2	116
413	2	117
414	2	118
415	2	119
416	2	120
417	2	121
418	2	122
419	2	123
420	2	124
421	2	125
422	2	126
423	2	127
424	2	128
425	2	129
426	2	130
427	2	131
428	2	132
429	2	133
430	2	134
431	2	135
432	2	136
433	2	137
434	2	138
435	2	139
436	2	140
437	2	141
438	2	142
439	2	143
440	2	144
441	2	145
442	2	146
443	2	147
444	2	148
445	11	1
446	11	2
447	11	3
448	11	4
449	11	5
450	11	6
451	11	7
452	11	8
453	11	9
454	11	10
455	11	11
456	11	12
457	11	13
458	11	14
459	11	15
460	11	16
461	11	17
462	11	18
463	11	19
464	11	20
465	11	21
466	11	22
467	11	23
468	11	24
469	11	25
470	11	26
471	11	27
472	11	28
473	11	29
474	11	30
475	11	31
476	11	32
477	11	33
478	11	34
479	11	35
480	11	36
481	11	37
482	11	38
483	11	39
484	11	40
485	11	41
486	11	42
487	11	43
488	11	44
489	11	45
490	11	46
491	11	47
492	11	48
493	11	49
494	11	50
495	11	51
496	11	52
497	11	53
498	11	54
499	11	55
500	11	56
501	11	57
502	11	58
503	11	59
504	11	60
505	11	61
506	11	62
507	11	63
508	11	64
509	11	65
510	11	66
511	11	67
512	11	68
513	11	69
514	11	70
515	11	71
516	11	72
517	11	73
518	11	74
519	11	75
520	11	76
521	11	77
522	11	78
523	11	79
524	11	80
525	11	81
526	11	82
527	11	83
528	11	84
529	11	85
530	11	86
531	11	87
532	11	88
533	11	89
534	11	90
535	11	91
536	11	92
537	11	93
538	11	94
539	11	95
540	11	96
541	11	97
542	11	98
543	11	99
544	11	100
545	11	101
546	11	102
547	11	103
548	11	104
549	11	105
550	11	106
551	11	107
552	11	108
553	11	109
554	11	110
555	11	111
556	11	112
557	11	113
558	11	114
559	11	115
560	11	116
561	11	117
562	11	118
563	11	119
564	11	120
565	11	121
566	11	122
567	11	123
568	11	124
569	11	125
570	11	126
571	11	127
572	11	128
573	11	129
574	11	130
575	11	131
576	11	132
577	11	133
578	11	134
579	11	135
580	11	136
581	11	137
582	11	138
583	11	139
584	11	140
585	11	141
586	11	142
587	11	143
588	11	144
589	11	145
590	11	146
591	11	147
592	11	148
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-03-03 08:55:13.059142-05	2	sjones04	2	[{"changed": {"fields": ["Active", "User permissions"]}}]	4	1
2	2020-03-03 08:56:05.424956-05	2	sjones04	2	[{"changed": {"fields": ["password"]}}]	4	1
3	2020-03-18 13:41:46.883948-04	21	Plastics	3		35	1
4	2020-03-18 13:41:46.886001-04	20	TRACI	3		35	1
5	2020-03-18 13:41:46.887537-04	17	ORD/IOAA	3		35	1
6	2020-03-18 13:41:46.889292-04	15	OLEM/ORCR	3		35	1
7	2020-03-18 13:41:46.89096-04	4	FoodWaste	3		35	1
8	2020-03-18 14:59:44.318974-04	6	raghu1.venkatapathy	3		4	1
9	2020-03-18 14:59:44.320896-04	7	raghu2.venkatapathy	3		4	1
10	2020-03-18 14:59:44.322388-04	4	raghuraman.venkatapathy	3		4	1
11	2020-03-18 14:59:44.323782-04	5	raghu.venkatapathy	3		4	1
12	2020-03-18 15:03:47.812739-04	8	raghuraman.venkatapathy	2	[{"changed": {"fields": ["Active", "Staff status", "Superuser status"]}}]	4	1
13	2020-03-20 13:09:07.846075-04	3	Qapp object (3)	3		20	1
14	2020-03-20 13:09:07.848343-04	1	Qapp object (1)	3		20	1
15	2020-03-23 05:12:46.462355-04	9	gonzalezm	1	[{"added": {}}]	4	1
16	2020-03-23 05:14:03.305824-04	9	gonzalezm	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Superuser status", "User permissions"]}}]	4	1
17	2020-03-23 05:14:44.476092-04	10	meyerd	1	[{"added": {}}]	4	1
18	2020-03-23 05:15:35.36346-04	10	meyerd	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Superuser status", "User permissions"]}}]	4	1
19	2020-03-23 05:16:00.620889-04	2	sjones04	2	[{"changed": {"fields": ["Superuser status", "User permissions"]}}]	4	1
20	2020-03-23 05:16:44.977458-04	11	hoellej	1	[{"added": {}}]	4	1
21	2020-03-23 05:17:32.925138-04	11	hoellej	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Superuser status", "User permissions"]}}]	4	1
22	2020-03-26 09:34:16.041232-04	2	Strategies for Characterization of Food Waste: Sampling & Analysis	3		20	1
23	2020-04-10 09:09:37.926497-04	12	sylvest.nicholas01@epa.gov	2	[{"changed": {"fields": ["Active"]}}]	4	1
24	2020-04-10 09:23:56.182394-04	13	sylvest.nicholas@ptsied.com	3		4	8
25	2020-04-10 09:29:33.519188-04	14	JBrown03	2	[{"changed": {"fields": ["Active"]}}]	4	8
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
37	qar5	qappsharingteammap
38	projects	branch
39	projects	centeroffice
40	projects	division
41	projects	office
42	projects	ordrap
43	projects	project
44	projects	projectsharingteammap
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
33	scifinder	0001_initial	2020-02-25 15:02:02.989929-05
34	scifinder	0002_auto_20200224_1408	2020-02-25 15:02:03.007842-05
35	scifinder	0003_auto_20200224_1629	2020-02-25 15:02:03.021927-05
36	scifinder	0004_auto_20200225_0550	2020-02-25 15:02:03.038476-05
37	sessions	0001_initial	2020-02-25 15:02:03.0471-05
38	support	0001_initial	2020-02-25 15:02:03.173214-05
39	flowsa	0005_auto_20200226_0539	2020-02-26 05:39:39.010445-05
40	scifinder	0005_auto_20200226_0539	2020-02-26 05:39:39.039735-05
42	qar5	0001_initial	2020-03-03 11:22:04.978137-05
43	qar5	0002_division_fixture	2020-03-03 11:22:05.021467-05
44	qar5	0003_auto_20200218_1317	2020-03-03 11:22:05.041909-05
45	qar5	0004_sectionb_type_fixture	2020-03-03 11:22:05.047607-05
46	qar5	0005_auto_20200219_0830	2020-03-03 11:22:05.111104-05
47	qar5	0006_auto_20200220_1022	2020-03-03 11:22:05.322544-05
48	flowsa	0005_auto_20200316_0932	2020-03-18 11:31:52.650178-04
49	flowsa	0006_auto_20200317_1217	2020-03-18 11:31:52.678694-04
50	flowsa	0007_auto_20200318_1129	2020-03-18 11:31:52.716167-04
51	qar5	0007_auto_20200316_0932	2020-03-18 11:31:52.791811-04
52	qar5	0008_auto_20200316_1455	2020-03-18 11:31:52.825407-04
53	qar5	0009_delete_sectionc	2020-03-18 11:31:52.830999-04
54	qar5	0010_auto_20200318_1129	2020-03-18 11:31:52.844893-04
55	scifinder	0005_auto_20200316_0932	2020-03-18 11:31:52.858642-04
56	scifinder	0006_auto_20200317_1217	2020-03-18 11:31:52.872736-04
57	scifinder	0007_auto_20200318_1129	2020-03-18 11:31:52.887245-04
58	flowsa	0007_merge_20200318_1134	2020-03-18 11:34:59.741793-04
59	scifinder	0007_merge_20200318_1134	2020-03-18 11:34:59.744794-04
60	flowsa	0007_auto_20200319_0821	2020-03-20 09:18:16.980419-04
61	flowsa	0008_auto_20200319_1201	2020-03-20 09:18:17.003696-04
62	flowsa	0009_merge_20200320_0918	2020-03-20 09:18:17.006116-04
63	qar5	0010_auto_20200319_0834	2020-03-20 09:38:06.734359-04
64	scifinder	0007_auto_20200319_0821	2020-03-20 09:38:06.749671-04
65	scifinder	0008_auto_20200319_1201	2020-03-20 09:38:06.764805-04
66	qar5	0011_sectionc	2020-03-23 15:43:12.368223-04
67	support	0002_supporttype_fixture	2020-03-23 15:53:19.512521-04
68	flowsa	0009_auto_20200325_1406	2020-03-25 14:06:19.123982-04
69	qar5	0012_auto_20200324_1008	2020-03-25 14:06:19.519277-04
70	qar5	0013_auto_20200325_1020	2020-03-25 14:06:19.852409-04
71	scifinder	0009_auto_20200325_1406	2020-03-25 14:06:19.865237-04
72	qar5	0014_auto_20200325_1523	2020-03-25 16:26:09.647815-04
73	projects	0001_initial	2020-04-09 09:31:47.454677-04
74	projects	0002_project_created_by	2020-04-09 09:31:47.52927-04
75	projects	0003_auto_20200406_1330	2020-04-09 09:31:47.624115-04
76	projects	0004_auto_20200408_1401	2020-04-09 09:31:47.708392-04
77	qar5	0015_remove_sectionc_c3	2020-04-09 09:31:47.72303-04
78	qar5	0016_auto_20200406_0905	2020-04-09 09:31:48.525193-04
79	qar5	0017_sectiona_a2	2020-04-09 09:31:48.549466-04
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
w36lwgq2gq8x7vo02t25ic7y019mufmd	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-16 14:42:07.745255-04
4yncfqi12pj51e89acb4ln0503svmf4n	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-06 05:21:58.04108-04
u517te7k51sfrc60lljtk731yihn2b22	NGI2ZTgxNmQxYjQxM2RiN2M5MzFmNGM1Mzg5Mzk5OGM0N2FkMTRjMzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTM4MzQ0ZGU3ZDkyNTgxMTNlN2QwNzYwODNkMjMyMjZkNzY4NmE0NyJ9	2020-04-06 13:44:34.36103-04
wr99dnj47qw69zt0weg47uq17qqbad8i	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-17 09:56:05.440388-04
u0jhspjqq25m5z9c5pv8g7vzmxqp2lub	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-03-17 10:56:00.229789-04
jfdra73q03nzpfsaguouuwpumozmzpiy	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-09 07:10:15.180159-04
q74ikixkzur40jvawcv9lwwkroxkpek7	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-09 07:26:19.222279-04
syrjh8h8qi6a3eonugkh8fgkqpzl9c5b	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-09 07:28:45.322488-04
spyih9tcq4832zy5cwh3ysbvelymrou8	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 08:32:25.460387-04
l5wl0xvzd6kswv2nc1yd3r42yukhsvvn	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 08:36:25.537017-04
rufkkpeq4j0g7awus64228hjg4w3zr14	ZGExYWUwZjA4MWFiYTBmMjUyYmViMDhkOGQ2YWUyZDFjOGU2MjBkNjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzExNjlkMTNkZTZkNTI3OGJiZDI5ZDYyZmE2YTVkMzJjMjExODI3In0=	2020-03-17 11:00:23.205411-04
w26iwvk6tgf00j0b15ktvmsv2g18sk3b	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-17 11:25:18.612205-04
hyhp2mjo9atkrsgd6w0w4ofjazarllrv	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-19 13:04:49.199787-04
xbryhg1sk9hqq22887nl6o4jr8fmin08	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-20 10:38:39.172723-04
taddvitpvyzhl90au3wjzl70ymtwxhpe	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-03-27 12:43:41.934199-04
ob0kqfukovo3f4g60hn393s5hjlqz0js	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-30 08:11:01.739333-04
yuns68vk038r5ypqtpzaf4hkhd7gcvdd	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-03-31 07:08:04.630374-04
zcutjpbysvxppj7gmdhyfee2bqogn5ra	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-01 13:40:23.300869-04
gd466cx5c57r3a29smg33eg8gt7bpqtd	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-01 15:03:15.437056-04
fnmtkrcv3dr0wpi0njlgsxt8y3u14q5h	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-02 06:28:39.597612-04
btacqutp8vemzfqdohk51l0bqrtqpqrn	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-06 04:46:13.308379-04
d2ws3skcams0h252nk9v5107m0adxzvn	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 08:37:26.088089-04
d0bm5zyvs6gmo4crmajnbh9q916u5fbq	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 08:38:26.77298-04
t1ig4av2jhtuv8vy1jd1gm5i88vv4wbe	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 08:40:27.361796-04
ptiu2jxfxthjnm35fv48qxvehirxri40	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-23 09:43:18.090451-04
mutzwxywjnja6xgjapfpfxzpskbqkc25	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-09 09:17:27.664441-04
y3wi2j7p8u7qbjrnfhweqw4jrrimuo94	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-23 12:07:45.366719-04
fd2b0nojijk8nhodnh7pb7ne3vxao9ic	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-23 12:08:45.23252-04
ir64lq3qgv8ls6qg8fovwm4rvcxl0bb9	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-23 12:31:52.933292-04
jcttgtfidd1byxam7d5q4cqwd6epdfjl	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-23 12:52:58.5524-04
jfane9kwwj18zo3e5f9cmk95tp8zvyj7	YWI3MmVhYzY3YmNhZGUwM2I3YWU4YTcyZTAzNjNkODAwZTNiNjU2Yjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOGUzNjdkMmVjOGE2OGZjMGI2MjQyZjM5NDZjOTI0ODlkODJhMjUwIn0=	2020-04-09 10:29:37.989849-04
gm1emiqj5uk1uwzep6j5hsqq49r9jezu	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 10:53:06.399847-04
tpvokq5lm6seuup405xoxaaj4a2z1gex	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 10:53:06.557915-04
dbafm232bsfdzgz63oucoiz6tjvymt1i	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 11:36:15.585394-04
p7ur0dhesjzy5onspg4xfgcy0m6rrq2h	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 11:37:15.592826-04
64gjmqn63zvn86ozuua4sa5dmamw6h9r	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-09 11:43:18.139873-04
iy9eta2clufvgzbtfqsjm7ez2hochs1p	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-23 13:08:02.62102-04
9620f5cirsfa0e3hdhjc2sopo0qo0nt5	NzQ2ZDdlOGY5NmVmMjc4OGY2MWRlNDhhYjlhNDIxYzdiZWE3ZjRjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIiwidGVzdGNvb2tpZSI6IndvcmtlZCJ9	2020-04-10 14:45:10.424107-04
p5w7bd8vh8xvkc14fkbkmdl6728vsmku	YWI3MmVhYzY3YmNhZGUwM2I3YWU4YTcyZTAzNjNkODAwZTNiNjU2Yjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOGUzNjdkMmVjOGE2OGZjMGI2MjQyZjM5NDZjOTI0ODlkODJhMjUwIn0=	2020-04-24 09:17:38.167714-04
milndh9uxt31fnjnfz4ngytnbxi4lhyo	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-10 14:50:24.341712-04
bsfz317doc8e52jcsa3m090rs5c9u84b	ZWNlOGYwMDQ3NWI3OGY1ZmI3MTA3MGM0MmRmNTQzZDFiZjEwNWRhYTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTVhNjE2ZDBhNDMzMzViYTBjZjA4YmUyZjZhZTIyYTUzZjgyZDQ0YiJ9	2020-04-24 09:21:20.315605-04
77kiq362xvtbfmul0oq7d0ffok5z1abn	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-12 13:51:47.129295-04
hey29mblrikygg2v75n0hk1l11l3ddzn	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-12 14:05:49.447966-04
5ckttpgev3tfah3hou77g982lysx5jk6	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-12 14:06:49.727417-04
q2f4gkisiziry8ky4a6mrk9btjo4adkf	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-13 06:33:22.241615-04
try88snrckdlz3c82gzhzrmtwi1zittf	M2VlZWRkNGZmM2VjYmU5MmNlYzM3MGY5MjA2NjY3MDQ1YTFhN2ExNzp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzBjZjliNTJiOTU5YzA3MTIxZjBhZWUxMDUyZWI0NzA4OTlmN2NiYSJ9	2020-04-14 09:37:37.670265-04
zq7otkc3nmyo05v3yzlgdg9jjqjlm9f4	OGY1NmEwY2Q0N2QwYTYxOTk0NGZmNTQ0ZDFmZmQ5YTJjNDM5NDNiZDp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGQ1YTczNWI1ZGE3MGY3ZWYxNWFlNzU1MTUzZDI4NjY1NDhlYWRhZiJ9	2020-04-24 09:39:50.950826-04
kyxmzzt92x49ilblq38pctqzxh7mii76	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-24 10:36:04.960466-04
sngwadiaadpgi7r7uk9x2o7skwvda2om	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-24 10:53:17.8333-04
fe7l05u3awp9q5131gzv66kqzfqrufb4	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-24 11:07:23.665182-04
ggdq1og9jp3cptipg31yrlepywb810cu	NmIyMzM3OTZjYzc3YTdkNjZiYWE0ZTI4YjU4Mzc5MTk0ZjdkZjk3Zjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==	2020-04-17 08:57:15.671084-04
222uy3qy6vd8t7b2e4jubjy6ii6cdfg5	YzQyOWMwYjZiZDljZWVkYWE5NzE3MDFiNmMxYzE5NzdlNzlmZWJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkM2MzZmRkNDY3ZjU3NWUzYmZmYzI1OGEzNjVjNjA1YTNlM2VhMTRjIn0=	2020-04-27 07:57:29.839156-04
\.


--
-- Data for Name: flowsa_upload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flowsa_upload (id, name, file, uploaded_at, uploaded_by_id) FROM stdin;
\.


--
-- Data for Name: projects_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_branch (id, date_created, last_modified, name, weblink, description, center_office_id, division_id, office_id) FROM stdin;
\.


--
-- Data for Name: projects_centeroffice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_centeroffice (id, date_created, last_modified, name, weblink, description, office_id) FROM stdin;
\.


--
-- Data for Name: projects_division; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_division (id, date_created, last_modified, name, weblink, description, center_office_id, office_id) FROM stdin;
\.


--
-- Data for Name: projects_office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_office (id, date_created, last_modified, name, weblink, description) FROM stdin;
\.


--
-- Data for Name: projects_ordrap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_ordrap (id, name) FROM stdin;
\.


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_project (id, title, branch_id, center_office_id, division_id, office_id, ord_rap_id, created_by_id, created_date, last_modified_date, project_lead_id) FROM stdin;
\.


--
-- Data for Name: projects_projectsharingteammap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_projectsharingteammap (id, added_date, can_edit, project_id, team_id) FROM stdin;
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
4	Environmental Decision Analytics Branch (EDAB)	Strategies for Characterization of Food Waste: Sampling & Analysis: Phase 2	QA Category B	Extramural	1	2020-03-30 07:14:34-04	1	SHC.021	K-LRTD-0032360-QP-1-1	4
5	Environmental Decision Analytics Branch (EDAB)	US Environmentally-Extended Input-Output (USEEIO) Models	QA Category B	Extramural	4	2020-04-13 07:58:06-04	1	SHC, Project 3.63, Task 1	K-LRTD-0030017-QP-1-4	4
\.


--
-- Data for Name: qar5_qappapproval; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qappapproval (id, project_plan_title, activity_number, qapp_id) FROM stdin;
5	Strategies for Characterization of Food Waste: Sampling & Analysis	1	4
6	US Environmentally-Extended Input-Output (USEEIO) Models	K-LRTD-0030017-QP-1-4	5
\.


--
-- Data for Name: qar5_qappapprovalsignature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qappapprovalsignature (id, contractor, name, signature, date, qapp_approval_id) FROM stdin;
7	f	Daniel L. Young			5
8	f	Michael Gonzalez			5
9	f	Jill Hoelle			5
10	t	TBD			5
11	f	Wesley Ingwersen, PhD			6
12	f	Michael Gonzalez, PhD			6
13	f	Jill Hoelle, QAM			6
14	t	Raghuraman Venkatapathy, PhD, RMEERS			6
15	t	Bill Michaud, CSRA			6
\.


--
-- Data for Name: qar5_qapplead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qapplead (id, name, qapp_id) FROM stdin;
6	Daniel L. Young, PhD, Project Lead	4
7	Michael Gonzalez, PhD, Manager	4
8	David Meyer PhD, Output Lead	4
9	Wesley Ingwersen, PhD	5
\.


--
-- Data for Name: qar5_qappsharingteammap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_qappsharingteammap (id, added_date, can_edit, qapp_id, team_id) FROM stdin;
3	2020-03-26 09:19:33.046984-04	t	4	2
4	2020-04-03 06:42:35.716856-04	t	5	3
\.


--
-- Data for Name: qar5_references; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_references (qapp_id, "references") FROM stdin;
4	[1]\tBob Horton, Jeremy Tomkinson, and Adrian Higson. Industrial Biotechnology, ‘UK Waste Strategy: Bioeconomy Opportunities Aplenty.’ Apr 2019. http://doi.org/10.1089/ind.2019.29161.bho.\r\n\r\n[2]\tMi-Hyung Kim, Jung-Wk Kim. Elsevier. ‘Comparison through an LCA evaluation analysis of food waste disposal options from the perspective of global warming and resource recovery.’ https://www.sciencedirect.com/science/article/pii/S0048969710004456. https://doi.org/10.1016/j.scitotenv.2010.04.049.\r\n\r\n[3]\tPushpa S. Murthy (Central Food Technological Research Institute, India), Nivas Manohar Desai (Central Food Technological Research Institute, India) and Siridevi G. B. (Central Food Technological Research Institute, India). ‘Food Waste Recovery Environmental Engineering.’ https://www.igi-global.com/chapter/sustainable-management-of-coffee-and-cocoa-agro-waste/222995.\r\n\r\n[4]\tJournal of Environmental Management, ‘Life cycle assessment (LCA) of food waste treatment in Hong Kong: On-site fermentation methodology.’ Volume 240, 15 June 2019, Pages 343-351. https://www.sciencedirect.com/science/article/pii/S0301479719304323.\r\n\r\n[5]\tMing-Hung Wonga, Wing-Yin Mo, Wai-Ming Choi, Zhang Cheng, Yu-Bon Man. ‘Recycle food wastes into high-quality fish feeds for safe and quality fish production.’ Elsevier. Environmental Pollution, Volume 219, December 2016, Pages 631-638. https://doi.org/10.1016/j.envpol.2016.06.035.\r\n\r\n[6]\tLerma, Beatrice (2019) Cuaderno 94. ‘The sounding side of materials and products. A sensory interaction revaluated in the user-experience.’ Pages 99 thru 107. Cuaderno 94 | Centro de Estudios en Diseño y Comunicación (2020/2021). pp 99 - 107 ISSN 1668-0227. Accessed 11/1/2019. https://fido.palermo.edu/servicios_dyc/publicacionesdc/archivos/777_libro.pdf#page=99.\r\n\r\n[7]\t‘Feasibility Study on the Application of Fabricated Multipurpose Food Packaging Plastic (MFPP) Liner as Alternative Landfill Liner Material in Sustainable Landfill Infrastructure Model.’ https://www.scientific.net/KEM.821.343.\r\n\r\n[8]\t‘Method for endogenizing capital in the United States Environmentally‐Extended Input‐Output model’. https://onlinelibrary.wiley.com/doi/abs/10.1111/jiec.12931.\r\n\r\n[9]\t‘Systems and Methods for Environmentally Undisruptive Disposal of Food Waste’. https://patentimages.storage.googleapis.com/5b/19/87/07322cddd0a739/US20100071602A1.pdf.\r\n\r\n[10]\tNielsen, Suzanne 2017. ‘Food Analysis Laboratory Manual.’ Springer International Publishing. https://www.springer.com/gp/book/9783319441252#aboutAuthors.\r\n\r\n[11]\tFood Labs and Services. https://www.eurofinsus.com/food/. Food waste testing lab.\r\n\r\n[12]\tFUSIONS Food waste data set for EU-28 New Estimates and Environmental Impact. https://ec.europa.eu/food/sites/food/files/safety/docs/fw_lib_fw_expo2015_fusions_data-set_151015.pdf.\r\n\r\n[13]\tEditorial Team, Natural Living Ideas.com, ‘17 Genius Ways To Recycle Used Coffee Grounds.’ https://www.naturallivingideas.com/recycle-used-coffee-grounds/.\r\n\r\n[14]\t‘A Winning Formula: Making Connections to Turn Food Waste into Energy.’ https://www.epa.gov/sciencematters/winning-formula-making-connections-turn-food-waste-energy.\r\n\r\n[15]\tAnne B. Alerding, Jennifer E. DeHart, David K. Kniffin, Nattachat Srikongyos, Michael J. DeBlasio, Jacob M. Kelliher, James A. Marsh, Heather L. Magill, Charles D. Newhouse, Samuel K. Allen, Paul J. Ackerman, and Emily L. Lilly. ‘An interdisciplinary living laboratory approach to investigate college food waste co-composting with additional on-site organic waste feedstocks.’ https://www.inderscienceonline.com/doi/abs/10.1504/IJEWM.2019.100658.\r\n\r\n[16] European Union, 2018, JRC 110629.\r\n\r\n[17] Sources of microplastics relevant to marine protection in Germany, BfR, 2015/64.\r\n\r\n[18] J. Agric. Food Chem. 2017, 65, 48, 10666-10672. Publication Date: November 14, 2017. https://doi.org/10.1021/acs.jafc.7b04942 Copyright © 2017 American Chemical Society.\r\n\r\n[19] Application of pyrolysis process in processing of mixed food wastes. Barbora Grycovábarbora, Ivan Koutníkivan, Adrian Pryszczadrian and Miroslav Kaločmiroslav.Technical University of Ostrava, Institute of Environmental Technologies, 17. Listopadu 15/2172, Ostrava – Poruba, 708 33, Czech Republic. DOI:    https://doi.org/10.1515/pjct-2016-0004 | Published online: 04 Apr 2016.
5	1.\tCalRecycle, 2015. 2014 Generator-Based Characterization of Commercial Sector Disposal and Diversion in California. DRRR 2015-1543.\r\n2.\tEdelen A., and Ingwersen W., 2016. Guidance on Data Quality Assessment for Life Cycle Inventory Data, EPA/600/R-16/096. U.S. Environmental Protection Agency, National Risk Management Research Laboratory.\r\n3.\tIngwersen W. 2015. Scientific Data Management Plan for the United States Environmentally-Extended Input-Output Model (USEEIO) Research Effort. https://sciencehub.epa.gov/sciencehub/packages/924/package_files/1089/download.\r\n4.\tCESER. 2018a. Standard Operating Procedure ‘G-LRTD-SOP-1396-0: Software Verification & Validation (V&V)’. https://qatrack.epa.gov/media/sop_tab/1396/G-LRTD-SOP-1396-0_Software_V_V_signed.pdf\r\n5.\tCESER. 2018b. Standard Operating Procedure ‘G-LRTD-SOP-1399-0: Software Configuration Management (SCM)’. https://qatrack.epa.gov/media/sop_tab/1399/G-LRTD-SOP-1399-0_SCM_signed.pdf.\r\n6.\tCESER QAPP Requirements for Research Model Development Projects, revision 0, 10/2008.\r\n7.\tRutherford, T.F. and A. Schreiber. 2018. "WiNDC: Wisconsin National Data Consortium", Working paper, University of Wisconsin-Madison. https://windc.wisc.edu/papers.html.\r\n8.\tUS CIO. 2017. Federal Source Code Policy. https://sourcecode.cio.gov.\r\n9.\tYang, Y., Ingwersen, W.W., Hawkins, T.R., Srocka, M., Meyer, D.E., 2017. USEEIO: A New and Transparent United States Environmentally-Extended Input-Output Model. Journal of Cleaner Production 158, 308-318. http://doi.org/10.1016/j.jclepro.2017.04.150.\r\n10.\tCESER QAPP Requirements for Software Development Projects, revision 0, 10/2008.\r\n11.\tMiller, R.E. and Blair, P.D., 2009. Input-output analysis: foundations and extensions. Cambridge university press.\r\n12.\tGreenDelta. 2018. openLCA schema in JSON-LD. http://greendelta.github.io/olca-schema/\r\n13.\tBEA. 2018a. Interactive data application. http://www.bea.gov/itable/\r\n14.\tBEA. 2018b. Application programming interface. https://apps.bea.gov/API/signup/index.cfm
\.


--
-- Data for Name: qar5_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_revision (id, revision, description, effective_date, initial_version, qapp_id) FROM stdin;
4	1	Initial QAPP for Phase 2 of the project, see K-LRTD-0032360-QM-1-0.	2020-03-26 09:33:11-04	1	4
5	4	Added FLOWSA work support.	2020-04-03 08:07:23-04	N/A	5
\.


--
-- Data for Name: qar5_sectiona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectiona (qapp_id, a3, a4, a4_chart, a5, a6, a7, a8, a9, a9_drive_path, sectionb_type_id, a2) FROM stdin;
4	Quality Assurance Project Plans and Standard Operating Procedures shall be  controlled through documented approvals as required by Section 5.3 of the  Office of Research and Development Quality Management Plan. The project  lead will be responsible for distribution of the current signed approved  version of the QA Project Plan to project participants shown in Section  A.4. Signed approved versions of SOPs will be available to project staff  through the ORD@Work SOP intranet site. Signature approved electronic  copies of this QA Project Plan, SOPs, and any associated QA assessment  reports, will also be maintained in ORD QA Track. The project lead will be  responsible for timely communications with all involved participants and  will retain copies of all management reports, memoranda, and correspondence  between research task personnel.	Dr. Daniel Young, EPA ORD, Project Lead/WACOR, Scientific leadership for the research effort.\r\nDr. David Meyer, EPA ORD, Output Lead/Alt WACOR, Scientific leadership for the research effort.\r\nDr. Michael Gonzalez, EPA ORD, Manager, Management Oversight.\r\nMrs. Jill Hoelle, EPA ORD, QA Manager, Oversight of QA program implementation.\r\nRuth Corn, EPA COR, Project officer for Contract Officer Representative.\r\nContractor Project Officer, TBD.\r\nContractor QA Officer, TBD.		The U.S. is committed to reducing food waste by 50% by 2030. To divert food waste from landfills, OLEM promotes anaerobic digestion and composting of food waste; however, contamination of food waste with packaging (including film plastics) may complicate composting and anaerobic digestion operations and decrease the market desirability and safety of land application of the compost and digestate made from food waste. De-packaging technologies (beyond screens and filters) are increasingly being used by large food waste generators and treatment facilities as primary means of removing plastics.	This product will test the performance of de-packaging equipment available on the market in real-world settings. The existing data literature review is covered under CESER QAPP, "K-LRTD-0032360-QP-1-0," entitled "Strategies for Characterization of Food Waste: Existing Data Software Tracking Tool." In addition, the CESER Quality Management Plan (QMP), "K-LRTD-0032360-QP-1-0" entitled "Strategies for Characterization of Food Waste," addresses additional information for phases one and two of this project.\r\n\r\nThe research will characterize the plastics, including quantity and particle size, in food waste streams before and after the use of de-packaging technologies. The results from this study will be useful to OLEM, restaurant and commercial kitchen operators, food retailers, composters, and wastewater treatment facility staff across the U.S. as they seek to exclude plastics (including microplastics) from the food waste stream. Key Words: Food waste, landfill diversion, waste management, sustainable materials management, plastics, food de-packaging, secondary data, existing data, EPA QA R/5, flowsa, SciFinder. This work is related to additional food waste research under SHC RA7, including life-cycle analyses of various approaches to managing food waste.	Research activities must be documented according to the requirements of ORD QA Policies titled Scientific Recordkeeping: Paper, Scientific Recordkeeping Electronic, and Quality Assurance Quality Control Practices for ORD Laboratory and Field-Based Research, as well as requirements defined in this QA Project Plan. The ORD QA Policies require the use of research notebooks and the management of research records, both paper and electronic, such that project research data generation may continue even if a researcher or an analyst participating in the project leaves the project staff. Electronic project records can be maintained by the project lead on using this EXISTING DATA SEARCH TOOL or can be stored on the ORD network drive, List file path where files are stored. Electronic Records shall be maintained in a manner that maximizes the confidentiality, accessibility, and integrity of the data. ORD PPM Section 13.6 provides guidance on the maintenance of electronic records for ORD.  Records retention: Records that are generated under this research effort will be retained in accordance with EPA Records Schedule 1035, and as required by Section 5.1 of the ORD Quality Management Plan for QA Category A Projects.	Project personnel working in the sampling and/or analysis phase of this work are required to complete required lab and/or field safety training as appropriate. Project staff working on sample analysis are expected to have an Initial Demonstration of Analyst Proficiency (IDAP) on record prior to samples analysis.	Research activities must be documented according to the requirements of  ORD QA Policies titled Scientific Recordkeeping: Paper, Scientific  Recordkeeping Electronic, and Quality Assurance Quality Control Practices  for ORD Laboratory and Field-Based Research, as well as requirements  defined in this QA Project Plan. The ORD QA Policies require the use of  research notebooks and the management of research records, both paper  and electronic, such that project research data generation may continue  even if a researcher or an analyst participating in the project leaves  the project staff. Electronic project records can be maintained by the  project lead on using this <a href='/existingdata'>  EXISTING DATA SEARCH TOOL</a> or can be stored  on the ORD network drive, List file path where files are stored.  Electronic Records shall be maintained in a manner that maximizes the  confidentiality, accessibility, and integrity of the data. ORD PPM Section  13.6 provides guidance on the maintenance of electronic records for ORD.  <br /><br />  Records retention: Records that are generated under this research effort will  be retained in accordance with EPA Records Schedule 1035, and as required by  Section 5.1 of the ORD Quality Management Plan for QA Category A Projects.	https://plasticsprojects.epa.gov/existingdata	5	COR: Contracting Officer’s Representative\r\nWACOR: Work Assignment Contracting Officer’s Representative
5	Quality Assurance Project Plans and Standard Operating Procedures shall be controlled through documented approvals as required by Section 5.3 of the Office of Research and Development Quality Management Plan. The project lead will be responsible for distribution of the current signed approved version of the QA Project Plan to project participants shown in Section A.4. Signed approved versions of SOPs will be available to project staff through the ORD@Work SOP intranet site. Signature approved electronic copies of this QA Project Plan, SOPs, and any associated QA assessment reports, will also be maintained in ORD QA Track. The project lead will be responsible for timely communications with all involved participants and will retain copies of all management reports, memoranda, and correspondence between research task personnel.	The overall project management and distribution of responsibilities among the project personnel are described in this section and shown in the figure below. The project roles and responsibilities of the various project staff and key roles for this project include the Principle Investigator (PI), Supervisor, QA Manager, and Support Personnel. This research effort falls under the Life Cycle and Decision Support Branch (LCDSB), in the Land Remediation & Technology Division (LRTD) within CESER. Other EPA and non-EPA team members may join the project team at a later date and will be covered by this QAPP. Michael Gonzalez is the supervisor responsible for approving this QAPP. He is the Branch Chief for the Environmental Decision Analytics Branch (EDAB). He will recommend through meetings and discussions to complete all tasks so that all achievements are in accordance with this described research, review new models and their validation, and review and approve technical reports and peer review articles. He will identify staff members with the appropriate knowledge/expertise regarding the specific task being reviewed. He will review the project documents and review all briefings and presentations with assistance from team members as designated. The LRTD QAM reports directly to the Deputy Division Director of LRTD. Currently, Jill Hoelle serves as the QA Manager and will provide independent QA oversight to ensure that planning and plan implementation is in accordance with the approved Quality Assurance Project Plan (QAPP). She will provide technical direction from a QA/QC perspective to EPA PIs on an as-needed basis. She will enter QAPP and related products into the ORD QA Track database. David Meyer is the SHC 3.63.1 task lead. Dr. Meyer participates actively in modeling activities and documents and communicates the research. Daniel Young is the WACOR for contract RMEERS EP-C-15-010 WA-4-41. He will assist with oversight of Software Configuration Management duties and SQA/SQC EPA Additional Researchers\r\nCatherine Birney assembles indicator factors and helps create food system coefficients for the model and assists in drafting associated documentation.\r\nEPA Division Director\r\nKirk Scheckel is the Division Director for LRTD. He will perform reviews of model documentation and datasets.\r\nContractor Support\r\nBill Michaud is the CSRA Work Assignment Lead for WA-20. He manages the personnel and work assignment expenses.\r\nRaghuraman Venkatapathy, is the RMEERS Work Assignment Lead for WA 4-41. He manages the personnel and work assignment expenses.\r\nDr. Mo Li is a modeling expert and programmer. Dr. Li writes model code, tests and builds model components, and performs QA functions (e.g., output validation).\r\nJacob Specht, Global Quality Corporation, a subcontractor to RMEERS, is a python programmer and SQA/SQC technical support person.\r\nMelissa Conner, Global Quality Corporation, a subcontractor to RMEERS, is a python programmer and SQA/SQC technical support person.\r\nMichael Srocka, GreenDelta, a subcontractor to CSRA, is a programmer and LCA expert. He is the primary author of the IOMB and USEEIO API.\r\nMarguerite Jones is the CSRA Contractor QA Officer. She will oversee contract activities and evaluate QA project plans or other WA materials.\r\nGune Silva is the RMEERS Contractor QA Officer. He will oversee contract activities and evaluate QA project plans or other WA materials.		The need to be addressed with quantitative model support is to identify and prioritize categories of goods and services (commodities) or industries that constitute the environmental hotspots within the US, a US state economy, or an average US organization’s supply chain. The model needs to produce an array of indicators of potential environmental, human health, and economic impact including direct and indirect effects associated with production and consumption of goods and services in the US. The inclusion of impacts associated with a good or service needs to be as comprehensive as possible in respect to the life cycle stages and all inputs to the economy. The model does not need to provide estimated impacts for specific goods or services (e.g. a product with a unique SKU code). The EPA Office of Land and Emergency Management/Office of Resource Conservation and Recovery has developed the Sustainable Materials Management Tool Suite which uses the model results via the USEEIO-API. Users of these tools may include representatives of US states and regions. The EPA Office of Air and Radiation’s Center for Corporate Climate Leadership is interested in providing updated supply chain GHG emission factors. States users presenting state environmental or economic agencies or public-private partnerships would like to use state-specific versions of the model to prioritize actions within their own states. The Department of Defense may use the USEEIO framework to build components of the Defense Input-Output Model (DIO). Other federal agencies are interested in using the model for exploratory research purposes. Other users, such as those in academia, with NGOs, or with private organizations which sufficient expertise may access the USEEIO model directly to evaluate various life cycle questions of goods and services in the US.	The purpose of the project is to continue the development of the US Environmentally-Extended Input-Output (USEEIO) models (Yang, Ingwersen et al. 2017). These include national and state models at the highest level of detail as well as simplified or partial versions for use for analysis and comparison. This project includes continued development of the framework used to develop the model, the USEEIO Modeling Framework (https://www.github.com/USEPA/useeio/); maintenance and revision to the program used to assemble the model components and generate results, the Input-Output Model Builder or IOMB (https://github.com/USEPA/IO-Model-Builder); and the application programming interface used to make the model results available via a web service, the USEEIO API (https://github.com/USEPA/useeio_api/).	Qualitative or Quantitative Assessment Process. The primary means of model evaluation will be though a standardized process for data quality scoring and data quality assessment. This process will be based on the LCA data quality assessment guidelines described in an EPA report (Edelen and Ingwersen, 2016) and illustrated in the USEEIO v1 documentation (Yang et al., 2017). When a USEEIO model is applied by the project team, the resulting data quality assessment scores will be used in the interpretation of the results. A secondary means of model evaluation will be through model comparison. With each build of a USEEIO model, one or more previous model versions will be selected for comparison. Results from each model will be compared using standardized comparison procedures. Reports of model comparisons will be maintained along with internal project files according to the approved Scientific Data Management plan (Ingwersen, 2015). All new modelling techniques and methods for USEEIO models will be submitted for external peer-review. Model code and data files will be provided to reviewers, so they will have the means of checking model output against reported model results as well as reviewing the scientific validity of the described methods.	TBD	Research activities must be documented according to the requirements of ORD QA Policies titled Scientific Recordkeeping: Paper, Scientific Recordkeeping Electronic, and Quality Assurance Quality Control Practices for ORD Laboratory and Field-Based Research, as well as requirements defined in this QA Project Plan. The ORD QA Policies require the use of research notebooks and the management of research records, both paper and electronic, such that project research data generation may continue even if a researcher or an analyst participating in the project leaves the project staff. Electronic project records can be maintained by the project lead on using this <a href="/existingdata"> EXISTING DATA SEARCH TOOL</a> or can be stored on the ORD network drive, List file path where files are stored. Electronic Records shall be maintained in a manner that maximizes the confidentiality, accessibility, and integrity of the data. ORD PPM Section 13.6 provides guidance on the maintenance of electronic records for ORD. Records retention: Records that are generated under this research effort will be retained in accordance with EPA Records Schedule 1035, and as required by Section 5.1 of the ORD Quality Management Plan for QA Category A Projects.	https://plasticsprojects.epa.gov/flowsa/	3	API – Application Programming Interface\r\nBEA – Bureau of Economic Analysis\r\nDIO – Defense Input-Output Model\r\nEIA – Energy Information Agency\r\nGHG – Greenhouse Gas\r\nIOMB – Input-Output Model Builder\r\nJSON-LD – JavaScript Object Notation for Linked Data\r\nLCA – Life Cycle Assessment\r\nLCDSB – Life Cycle and Decision Support Branch\r\nLRTD – Land and Materials Management Division\r\nMSW – Municipal Solid Waste\r\nNAICS – North American Industry Classification System\r\nNGO – Non-governmental Organization\r\nPI – Principal Investigator\r\nQA – Quality Assurance\r\nQAPP – QA Project Plan\r\nQCEW – Quarterly Census of Employment and Wages\r\nRCRA – Resource Conservation and Recovery Act\r\nREST – Representational State Transfer\r\nSKU – Stock Keeping Unit\r\nStEWI – Standardized Emissions and Waste Inventory\r\nTPEPY – Ton-Per-Employee-Per-Year\r\nUS – United States\r\nUSD – US Dollars\r\nUSDA – US Department of Agriculture\r\nUSEEIO – United States Environmentally-Extended Input-Output Model\r\nUSGS – US Geological Survey
\.


--
-- Data for Name: qar5_sectionb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectionb (qapp_id, b1_2, b1_3, b1_4, b1_5, b2_1, b2_2, b2_3, b2_4, b2_5, b1_1, b2_6, b2_7, b2_8, b3_1, b3_10, b3_2, b3_3, b3_4, b3_5, b3_6, b3_7, b3_8, b3_9, b4_1, b4_2, b4_3, b4_4, b4_5, b5_1, b5_2, b6_1, b6_2) FROM stdin;
4	The focus of this research is plastic waste generated from food packaging, which typically winds up as road litter or it is found in wastebaskets, streams, rivers, wastewater treatment plants (typically in biosolids) or in landfills. In this study, plastics and microplastics will be collected from wastebaskets at domestic locations or at various restaurants and businesses serving food. Food waste from houses, restaurants, and groceries will be collected in Ziploc bags and transported back to EPA's AWBERC Facility for analysis. At each location, approximately 100g of material is expected to be collected. Ziploc bags containing Ottawa sand or similar material will be used as a control and trip blank. The samples will be stored in a freezer at -20C until they are processed for analysis.	Sampling will be conducted at various restaurants and businesses serving food. A sampling of food waste will be conducted after written approval by the appropriate owner/manager. Approximately 100g of material will be collected in Ziploc bags at each domestic or commercial location.	\N	\N	Once the sampling locations are identified and appropriate permissions are obtained, from the owners, a section of the sampling container (waste bins or dumpsters) will be randomly chosen and the contents of the section mixed with a stirring rod. From this section, approximately 100g of material will be collected into Ziploc bags and transported to AWBERC for storage until they are ready for analysis.	Ottawa sand that has been muffled in an oven at 600C will be used as a control for this study. For a trip blank, 100g of the muffled sand will be placed in a Ziploc bag and transported to the sampling sites and back to AWBERC. These samples will be processed using the same procedure as for the field samples. In addition, a fresh batch of muffled sand will be used as a laboratory control at the time of sample processing and analysis.	Spatulas or tongs will be used to collect samples from waste bins or dumpsters. These will be washed with SuperQ water that will be brought to the field and wiped with antimicrobial wipes before use at the next sampling location. The outsides of the Ziploc bags will be sprayed with 70% ethanol prior to placing them in coolers for transport back to AWBERC.	Ziploc bags are expected to be used to collect all samples in the field. Approximately 100g of waste material will be collected at each sampling location. A Ziploc bag filled with Ottawa sand muffled at 600C will be used as a trip blank on field sampling days.	Samples will be labelled using the name of the concern, sampling location and a date. For example, Kroger-Everton-05252020 will imply that the samples was collected at a Kroger grocery store in Everton on May 25, 2020.	Microplastics are plastic particles less than 5 mm in one dimension that pollute the environment such as rivers, lakes, and oceans. The plastics are organic chemicals that are composed of polymers that contain various carbon base units (e.g., ethylene, propylene, styrene), functional groups and sizes. Microplastics are classified into two segments, primary and secondary types. Primary microplastics include fragmented fibers and particles generated in the washing drainage of food waste of the particle materials. Secondary microplastic is formed in the process of being gradually broken down into small fragments by the force of waves, wind, and ultraviolet rays from the sun over a longer period of time.  Microplastics can be analyzed using bulk analytical techniques such as elemental analysis, pyrolysis gas chromatography/mass spectrometry (GC/MS) or total organic carbon (TOC), or they can be analyzed at the microscopic level using stereomicroscopy such as digital microscopes, scanning electron microscope (SEM) or transmission electron microscope (TEM), or using Raman and infrared microscopy. While microscopes are typically used for initial characterization or for a qualitative assessment of microplastics in the environment, quantitative analysis of microplastics is currently mainly performed using Fourier transformation infrared spectroscopy/microscopy (FTIR/μFTIR).	Samples from the field will be stored in a freezer at -20C until they are ready to be processed. Since microplastics are not known to degrade in the environment, there is no hold time for sample processing.	Samples will be collected in Ziploc bags, disinfected and stored in a cooler for transportation back to the EPA. Each Ziploc bag containing the sample will be labelled at the time of collection using a sharpie, and a chain of custody will be updated with the new sample at the place of collection. Upon transport back to AWBERC, the samples will be transferred to a -20C freezer and the chain of custody signed by the sample custodian.	\N	No field analysis is anticipated for samples collected from the field in this study.	\N	Prior to analyzing the waste material collected in Ziploc bags, the samples will be dried in an oven at 105C to remove moisture, and once dry, the samples will be sieved through a sieve shaker to obtain a material with different sizes. Samples contained in each mesh will initially be qualitatively analyzed using a microscope to determine the presence of plastics. Once identified, these plastic particles will be isolated and quantitatively analyzed using SOP K-LRTD-SOP-1203-0 entitled Fourier Transformation Infrared (FTIR) Spectroscopic Analysis. Identification by Spectral Libraries. Shimadzu “LabSolutions” software for FTIR includes approximately 12,000 spectra in a proprietary spectral library. Furthermore, a "Thermally degraded plastic library" is available as an optional software package, which contains a total of 111 spectra of unheated and heat-degraded at 200°C to 400°C for 13 types of plastics. Chemical degradation of plastics is almost always considered as oxidative degradation.	The calibration procedures described in the SOP K-LRTD-SOP-1203-0 entitled Fourier Transformation Infrared (FTIR) Spectroscopic Analysis will be followed under this QAPP.	\N	\N	\N	\N	\N	\N	A 4-point calibration will be performed using a known standard at the beginning of the analysis. The coefficient of regression should be > 0.99. The calibration should be run again if these criteria are not met. All samples and controls will be measured in triplicate using the FTIR. The RSD should be < 10%. Occasional data outside the acceptance limits will be flagged. If more than 30% of the samples fail these criteria, the problem will be investigated and the analysis repeated. The spectra from each sample should have a match quality > 500. If these criteria are not met, the problem should be investigated and the sample reanalyzed.	\N	\N	\N	\N	\N	\N	\N	\N
5	The general type of model used is an environmentally-extended input-output model (EEIO). This is an established model form used for life cycle assessment, environmental footprinting, national and regional environmental analysis, among other purposes. These models combine economic data in input-output tables describing transactions between industries and their associated commodities with environmental data on chemicals releases and resources used by industry. The industry coverage includes agricultural, manufacturing, mining, utilities, transport, service and government activities in the US; virtually the entire US economy aggregated into sectors, with a level of resolution of ~400 sectors for the most detailed model. The environmental coverage includes emissions to air, water, soil, resources consumed, and wastes generated. The regional coverage varies depending on the model; the USEEIOv1 model is a single region model representing the average US region; state models are planned to be two region models representing the state of interest and the rest of the US. The temporal coverage is annual for a single year and has a single time-step.	The primary models to be created in support of the EPA Sustainable Materials Management program, include national and state-level good and services-based models with a high or medium level of good and service detail (~ 400 goods and services for high or ~120 goods and services for medium), and ~ 2000 environmental or social-economic flows. These models are called the USEEIO models here. Other models of the same type (EEIO model) developed for analytical or testing purposes will be called supporting models.	\N	\N	The model uses economic input-output tables and gross output data from the Bureau of Economic Analysis (BEA). The most recent detailed input-output data are used for the ‘A’ matrix of the model although more aggregate input-output data may be used for testing/model evaluation. The ‘Make’ and ‘Use’ tables are the primary input-output tables that are combined to form the A matrix; the gross output data and associated price indices are used for the denominator to develop coefficients in the form of a physical unit per dollar output data in the ‘B’ satellite tables. The input-output tables, gross output and price index data are publicly available through the BEA Interactive Data and API data outlets (BEA, 2018a; BEA 2018b). For state models, the input-output table data must be split into regions for the state and the rest of US. This research will investigate two options for the economic components of state models: (1) creating an original state economic model, or (2) using an existing state economic model. For option 1, a methodology will be developed. The methodology will integrate existing national input-output tables with sources to estimate state industry output, trade models between states, and data determining the nature of sectors as locally-consumed or traded. Trade estimates will use various approaches, including use of commodity flow data from the Freight Analysis Framework model (https://faf.ornl.gov/fafweb/Default.aspx), data on whether or not commodities are consumed locally or are traded (http://www.clustermapping.us/), and estimates of regional gross commodity output. Gross output estimates for states and regions will come from a variety of sources, including the US Census Bureau and the Bureau of Labor Statistics. For these models, input-output tables will be checked for balance. Established input-output table balancing procedures, such as RAS, will be used to rebalance matrices when balances are not met. For option (2), the suitability of a state economic input-output model from the Wisconsin Nati	TBD	TBD	Total US commodity and industry output data will be used for rebalancing. These are primarily derived from the BEA input-output tables. For state models, the sum of total commodity and total industry output for the state and rest of the US as derived from the row and column sums of the model Use table must match the total published US commodity and industry output within a level of tolerance. The level of tolerance will be based on model application.	TBD	The selection of the level of the detail of the models used will depend upon the user (program office, region, state, organization, etc.) or the research need and data availability to support the creation of the different models. Applications of the model are at the discretion of the other end users, except when used for demonstrative purposes by the project team. The goal of the USEEIO model is to use the most recent environmental data available along with the most recent economic data with which they can be paired. There must be a direct correspondence between both the vintage and scope of the environmental and economic data to pair them. As a matter of convention, when the underlying input-output data are of a different year than the environmental data, gross output data are collected for the year of the environmental data to develop coefficient with matching numerator and denominator dollar year, and the current price assumption (Miller and Blair, 2009) is used to assume the direct requirements derived from the input-output data are applicable to the dollar year of the model.	TBD	\N	\N	TBD	\N	TBD	TBD	TBD	TBD	TBD	TBD	TBD	TBD	TBD	TBD	TBD	https://github.com/USEPA/flowsa and USEEIO API: Staging server for instance and docs: https://smmtool.app.cloud.gov/. Production documentation:  https://s3.amazonaws.com/useeio-api-go-swagger-staging/index.html. Production instance: https://api.edap-cluster.com/useeio/api (requires a registered key)	The United States Environmental Protection Agency (USEPA), through its Office of Research and Development, contributed to the development of the life cycle inventory files presented in this file. The inventories have not been subjected to full Agency review and no official endorsement of their use should be inferred. Furthermore, the inventories were developed for demonstrative purposes only and have not been fully vetted according to the standards of life cycle assessment (LCA). The user assumes responsibility for any application of these inventories in LCA activities and USEPA, or its collaborators in the underlying research, can not be held liable for any decision outcomes involving the data.	\N	\N	\N	\N
\.


--
-- Data for Name: qar5_sectionbtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectionbtype (id, name) FROM stdin;
1	Existing Data
2	Software Development
3	Model Development
4	Model Application
5	Measurements
6	Analytical Methods
7	Cell Culture Methods
8	Animal Subjects
\.


--
-- Data for Name: qar5_sectionc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectionc (qapp_id) FROM stdin;
4
\.


--
-- Data for Name: qar5_sectiond; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.qar5_sectiond (qapp_id, d1, d2, d3) FROM stdin;
5	Model verification will be completed using a number of techniques. The model generated total environmental emissions associated with full US output will be checked against national emission or resource use totals. The model generated total commodity output to meet US output demand will be checked against the reported US total commodity output. National emissions or resource use totals will come from the original data providers used to create the sources. Total US commodity output will be derived from the published Use table. Model validation tests will include import of independent data and comparison of these data against model generated totals.	Because methods for quantitative model uncertainty analysis for EEIO models have not been established, model uncertainty is primarily addressed using sensitivity analysis, gravity analysis, and model comparison methods. The implementation of these types of analyses performed will vary based on the possible model uses. The primary means of model evaluation will be though a standardized process for data quality scoring and data quality assessment. This process will be based on the LCA data quality assessment guidelines described in an EPA report (Edelen and Ingwersen, 2016) and illustrated in the USEEIO v1 documentation (Yang et al., 2017). When a USEEIO model is applied by the project team, the resulting data quality assessment scores will be used in the interpretation of the results. A secondary means of model evaluation will be through model comparison. With each build of a USEEIO model, one or more previous model versions will be selected for comparison. Results from each model will be compared using standardized comparison procedures. Reports of model comparisons will be maintained along with internal project files according to the approved Scientific Data Management plan (Ingwersen, 2015).	All new modeling techniques and methods for USEEIO models will be submitted for external peer-review. Model code and data files will be provided to reviewers, so they will have the means of checking model output against reported model results as well as reviewing the scientific validity of the described methods.
4	Data packages will be prepared by the primary analyst and will include raw data from the instrument, spectra (if any), processed data and final results. This data package will be reviewed by a secondary analyst or QA Manager. During this review, at least 10% of the data will be checked for transcription and calculation errors. The QA/QC acceptance criteria and flagging will also be checked.	Data packages prepared by the primary analyst will be reviewed by a secondary analyst or QA Manager. During this review, at least 10% of the data will be checked for transcription and calculation errors. The QA/QC acceptance criteria and flagging will also be checked. the review will be documented by a review form, through notations in lab notebooks or through emails. Additional QA/QC review may be conducted upon request of the CESER QA Manager. The results generated from this study may be disseminated through presentations, posters, reports, journal articles or standard operating procedures. For each of these, the products may undergo additional peer-review according to established ORD procedures.	The data generated under this research is considered exploratory, i.e., determining the amount of microplastics in food-waste. As such, the results are expected to be reported as a value along with RSD from triplicate measurements. If additional study is warranted (e.g., comparing microplastic concentrations among different sources, locations, seasons, etc.), the QAPP will be modified to include these additional research objectives.\r\n\r\nFinal Products:\r\n1. Initial report prepared by the EPA staff with contractor support on the existing data/literature review of food waste de-packaging equipment available on the market in real-world settings. The report is to include observations on success of equipment in limiting the amount of micro-plastics entering food.\r\n2. Final report prepared by the EPA staff with contractor support on food waste sampling and analysis.
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
1	2020-03-05 12:06:32.978389-05	2020-03-05 12:06:47.968732-05	f	f		\N	Test	\N	\N	f	Running test to verify email server setup correctly for the DataSearch help functions.	\N	Young.Daniel@epa.gov	\N	\N	To Do		1	1	\N	\N	1
2	2020-03-06 09:39:17.404907-05	2020-03-06 09:39:31.423051-05	f	f		\N	Test	\N	\N	f	Testing mail server again to see if this goes through...	\N	Young.Daniel@epa.gov	\N	2020-03-06	To Do	Test	1	1	\N	\N	1
3	2020-03-19 06:56:57.372046-04	2020-03-19 06:57:07.138964-04	f	f		\N	Test	\N	\N	f	Testing the QAPP functions... breaks at page 2 of QAPP entry.	\N	Young.Daniel@epa.gov	\N	\N	To Do		1	1	\N	\N	1
4	2020-04-09 11:03:26.521133-04	2020-04-09 11:15:43.465812-04	f	f		\N	Test Request Help	\N	\N	f	Test Request Help	\N	venkatapathy.raghuraman@epa.gov	\N	\N	To Do	Test Request Help	8	8	\N	6	8
5	2020-04-10 14:57:08.653784-04	2020-04-13 07:46:41.899413-04	f	f		\N	Test Request Help	\N	\N	f	Test request help	\N	venkatapathy.raghuraman@epa.gov	\N	\N	To Do	Testing help	8	8	\N	6	8
6	2020-04-13 07:48:53.134776-04	2020-04-13 07:51:00.948536-04	f	f		\N	Test Request Help	\N	\N	f	Testing the request help function on the RTP server	\N	venkatapathy.raghuraman@epa.gov	\N	\N	To Do	Testing the request help function on the RTP server	8	8	\N	6	8
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
1	\N	\N	\N	\N	General Information	\N	\N	\N	\N
2	\N	\N	\N	\N	Login and Registration Issues	\N	\N	\N	\N
3	\N	\N	\N	\N	Bug Report	\N	\N	\N	\N
4	\N	\N	\N	\N	Feature Request	\N	\N	\N	\N
5	\N	\N	\N	\N	Other	\N	\N	\N	\N
6	\N	\N	\N	\N	help	\N	\N	\N	\N
7	\N	\N	\N	\N	suggestion	\N	\N	\N	\N
\.


--
-- Data for Name: teams_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams_team (id, created_date, last_modified_date, name, created_by_id, last_modified_by_id) FROM stdin;
18	2019-11-06 10:52:18.11793-05	2019-11-06 10:52:18.11793-05	WARM-USEEIO	1	1
19	2019-11-07 05:49:56.26904-05	2019-11-07 05:49:56.26904-05	CSS Plastic Recycling Process	1	1
1	2020-03-17 07:11:54.969008-04	2020-03-17 07:11:54.969047-04	Application of Statistical Inferencing for Generic Exposure Scenario Modeling	1	1
2	2020-03-18 12:15:14.846457-04	2020-03-20 13:39:52.760754-04	Food Waste | Plastics Projects	1	1
3	2020-04-03 06:35:23.372741-04	2020-04-03 06:35:23.372786-04	USEEIO Models	1	1
\.


--
-- Data for Name: teams_teammembership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams_teammembership (id, added_date, is_owner, can_edit, member_id, team_id) FROM stdin;
11	2019-11-06 10:52:18.137933-05	t	t	1	18
12	2019-11-07 05:49:56.279042-05	t	t	1	19
1	2020-03-17 07:11:54.977959-04	t	t	1	1
2	2020-03-18 12:15:14.848767-04	t	t	1	2
4	2020-03-20 13:42:48.11321-04	f	t	8	2
5	2020-03-23 05:18:07.827521-04	f	t	9	2
7	2020-03-23 05:18:12.990082-04	f	t	10	2
8	2020-04-03 06:35:23.375182-04	t	t	1	3
9	2020-04-03 06:35:35.129142-04	f	t	9	3
10	2020-04-03 06:35:39.669239-04	f	t	11	3
13	2020-04-03 06:38:51.544128-04	f	t	8	3
14	2020-04-03 06:39:00.385197-04	f	t	10	3
15	2020-04-03 06:39:06.750421-04	f	t	3	3
16	2020-04-10 09:18:30.683144-04	f	t	12	2
17	2020-04-10 09:30:28.129231-04	f	t	14	2
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

SELECT pg_catalog.setval('public."DataSearch_existingdata_id_seq"', 26, true);


--
-- Name: DataSearch_existingdatasharingteammap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_existingdatasharingteammap_id_seq"', 22, true);


--
-- Name: DataSearch_existingdatasource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DataSearch_existingdatasource_id_seq"', 11, true);


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

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 14, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 176, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 14, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 592, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 25, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 44, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 79, true);


--
-- Name: flowsa_upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flowsa_upload_id_seq', 1, false);


--
-- Name: projects_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_branch_id_seq', 1, false);


--
-- Name: projects_centeroffice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_centeroffice_id_seq', 1, false);


--
-- Name: projects_division_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_division_id_seq', 1, false);


--
-- Name: projects_office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_office_id_seq', 1, false);


--
-- Name: projects_ordrap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_ordrap_id_seq', 1, false);


--
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_project_id_seq', 1, false);


--
-- Name: projects_projectsharingteammap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_projectsharingteammap_id_seq', 1, false);


--
-- Name: qar5_division_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_division_id_seq', 1, false);


--
-- Name: qar5_qapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qapp_id_seq', 5, true);


--
-- Name: qar5_qappapproval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qappapproval_id_seq', 6, true);


--
-- Name: qar5_qappapprovalsignature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qappapprovalsignature_id_seq', 15, true);


--
-- Name: qar5_qapplead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qapplead_id_seq', 9, true);


--
-- Name: qar5_qappsharingteammap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_qappsharingteammap_id_seq', 4, true);


--
-- Name: qar5_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.qar5_revision_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.support_support_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.teams_team_id_seq', 3, true);


--
-- Name: teams_teammembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_teammembership_id_seq', 17, true);


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
-- Name: projects_branch projects_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_branch
    ADD CONSTRAINT projects_branch_pkey PRIMARY KEY (id);


--
-- Name: projects_centeroffice projects_centeroffice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_centeroffice
    ADD CONSTRAINT projects_centeroffice_pkey PRIMARY KEY (id);


--
-- Name: projects_division projects_division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_division
    ADD CONSTRAINT projects_division_pkey PRIMARY KEY (id);


--
-- Name: projects_office projects_office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_office
    ADD CONSTRAINT projects_office_pkey PRIMARY KEY (id);


--
-- Name: projects_ordrap projects_ordrap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_ordrap
    ADD CONSTRAINT projects_ordrap_pkey PRIMARY KEY (id);


--
-- Name: projects_project projects_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);


--
-- Name: projects_projectsharingteammap projects_projectsharingteammap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_projectsharingteammap
    ADD CONSTRAINT projects_projectsharingteammap_pkey PRIMARY KEY (id);


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
-- Name: qar5_qappapproval qar5_qappapproval_qapp_id_5ea5abd4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappapproval
    ADD CONSTRAINT qar5_qappapproval_qapp_id_5ea5abd4_uniq UNIQUE (qapp_id);


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
-- Name: qar5_qappsharingteammap qar5_qappsharingteammap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappsharingteammap
    ADD CONSTRAINT qar5_qappsharingteammap_pkey PRIMARY KEY (id);


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
-- Name: projects_branch_center_office_id_282c8fa2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_branch_center_office_id_282c8fa2 ON public.projects_branch USING btree (center_office_id);


--
-- Name: projects_branch_division_id_84ad01bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_branch_division_id_84ad01bb ON public.projects_branch USING btree (division_id);


--
-- Name: projects_branch_office_id_e8d434bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_branch_office_id_e8d434bf ON public.projects_branch USING btree (office_id);


--
-- Name: projects_centeroffice_office_id_83ccef38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_centeroffice_office_id_83ccef38 ON public.projects_centeroffice USING btree (office_id);


--
-- Name: projects_division_center_office_id_3a5d12fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_division_center_office_id_3a5d12fc ON public.projects_division USING btree (center_office_id);


--
-- Name: projects_division_office_id_53d28e35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_division_office_id_53d28e35 ON public.projects_division USING btree (office_id);


--
-- Name: projects_project_branch_id_90691572; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_branch_id_90691572 ON public.projects_project USING btree (branch_id);


--
-- Name: projects_project_center_office_id_521d3e3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_center_office_id_521d3e3f ON public.projects_project USING btree (center_office_id);


--
-- Name: projects_project_created_by_id_c49d7b6d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_created_by_id_c49d7b6d ON public.projects_project USING btree (created_by_id);


--
-- Name: projects_project_division_id_29002eb2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_division_id_29002eb2 ON public.projects_project USING btree (division_id);


--
-- Name: projects_project_office_id_4a34b966; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_office_id_4a34b966 ON public.projects_project USING btree (office_id);


--
-- Name: projects_project_ord_rap_id_32ba042a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_ord_rap_id_32ba042a ON public.projects_project USING btree (ord_rap_id);


--
-- Name: projects_project_project_lead_id_377dad57; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_project_lead_id_377dad57 ON public.projects_project USING btree (project_lead_id);


--
-- Name: projects_project_title_3d294c09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_title_3d294c09 ON public.projects_project USING btree (title);


--
-- Name: projects_project_title_3d294c09_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_project_title_3d294c09_like ON public.projects_project USING btree (title varchar_pattern_ops);


--
-- Name: projects_projectsharingteammap_project_id_bfdcc94e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_projectsharingteammap_project_id_bfdcc94e ON public.projects_projectsharingteammap USING btree (project_id);


--
-- Name: projects_projectsharingteammap_team_id_e579c1b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_projectsharingteammap_team_id_e579c1b0 ON public.projects_projectsharingteammap USING btree (team_id);


--
-- Name: qar5_qapp_division_id_d778ad64; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qapp_division_id_d778ad64 ON public.qar5_qapp USING btree (division_id);


--
-- Name: qar5_qapp_prepared_by_id_a844d543; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qapp_prepared_by_id_a844d543 ON public.qar5_qapp USING btree (prepared_by_id);


--
-- Name: qar5_qappapprovalsignature_qapp_approval_id_e8805c24; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qappapprovalsignature_qapp_approval_id_e8805c24 ON public.qar5_qappapprovalsignature USING btree (qapp_approval_id);


--
-- Name: qar5_qapplead_qapp_id_9a4cad94; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qapplead_qapp_id_9a4cad94 ON public.qar5_qapplead USING btree (qapp_id);


--
-- Name: qar5_qappsharingteammap_qapp_id_b2b7c3fd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qappsharingteammap_qapp_id_b2b7c3fd ON public.qar5_qappsharingteammap USING btree (qapp_id);


--
-- Name: qar5_qappsharingteammap_team_id_da029ea9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX qar5_qappsharingteammap_team_id_da029ea9 ON public.qar5_qappsharingteammap USING btree (team_id);


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
-- Name: projects_branch projects_branch_center_office_id_282c8fa2_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_branch
    ADD CONSTRAINT projects_branch_center_office_id_282c8fa2_fk_projects_ FOREIGN KEY (center_office_id) REFERENCES public.projects_centeroffice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_branch projects_branch_division_id_84ad01bb_fk_projects_division_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_branch
    ADD CONSTRAINT projects_branch_division_id_84ad01bb_fk_projects_division_id FOREIGN KEY (division_id) REFERENCES public.projects_division(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_branch projects_branch_office_id_e8d434bf_fk_projects_office_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_branch
    ADD CONSTRAINT projects_branch_office_id_e8d434bf_fk_projects_office_id FOREIGN KEY (office_id) REFERENCES public.projects_office(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_centeroffice projects_centeroffice_office_id_83ccef38_fk_projects_office_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_centeroffice
    ADD CONSTRAINT projects_centeroffice_office_id_83ccef38_fk_projects_office_id FOREIGN KEY (office_id) REFERENCES public.projects_office(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_division projects_division_center_office_id_3a5d12fc_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_division
    ADD CONSTRAINT projects_division_center_office_id_3a5d12fc_fk_projects_ FOREIGN KEY (center_office_id) REFERENCES public.projects_centeroffice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_division projects_division_office_id_53d28e35_fk_projects_office_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_division
    ADD CONSTRAINT projects_division_office_id_53d28e35_fk_projects_office_id FOREIGN KEY (office_id) REFERENCES public.projects_office(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_branch_id_90691572_fk_projects_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_branch_id_90691572_fk_projects_branch_id FOREIGN KEY (branch_id) REFERENCES public.projects_branch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_center_office_id_521d3e3f_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_center_office_id_521d3e3f_fk_projects_ FOREIGN KEY (center_office_id) REFERENCES public.projects_centeroffice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_created_by_id_c49d7b6d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_created_by_id_c49d7b6d_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_division_id_29002eb2_fk_projects_division_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_division_id_29002eb2_fk_projects_division_id FOREIGN KEY (division_id) REFERENCES public.projects_division(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_office_id_4a34b966_fk_projects_office_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_office_id_4a34b966_fk_projects_office_id FOREIGN KEY (office_id) REFERENCES public.projects_office(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_ord_rap_id_32ba042a_fk_projects_ordrap_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_ord_rap_id_32ba042a_fk_projects_ordrap_id FOREIGN KEY (ord_rap_id) REFERENCES public.projects_ordrap(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project projects_project_project_lead_id_377dad57_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_project_lead_id_377dad57_fk_auth_user_id FOREIGN KEY (project_lead_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_projectsharingteammap projects_projectshar_project_id_bfdcc94e_fk_projects_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_projectsharingteammap
    ADD CONSTRAINT projects_projectshar_project_id_bfdcc94e_fk_projects_ FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_projectsharingteammap projects_projectshar_team_id_e579c1b0_fk_teams_tea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects_projectsharingteammap
    ADD CONSTRAINT projects_projectshar_team_id_e579c1b0_fk_teams_tea FOREIGN KEY (team_id) REFERENCES public.teams_team(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: qar5_qappsharingteammap qar5_qappsharingteammap_qapp_id_b2b7c3fd_fk_qar5_qapp_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappsharingteammap
    ADD CONSTRAINT qar5_qappsharingteammap_qapp_id_b2b7c3fd_fk_qar5_qapp_id FOREIGN KEY (qapp_id) REFERENCES public.qar5_qapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: qar5_qappsharingteammap qar5_qappsharingteammap_team_id_da029ea9_fk_teams_team_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qar5_qappsharingteammap
    ADD CONSTRAINT qar5_qappsharingteammap_team_id_da029ea9_fk_teams_team_id FOREIGN KEY (team_id) REFERENCES public.teams_team(id) DEFERRABLE INITIALLY DEFERRED;


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

