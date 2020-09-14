--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: admin_honeypot_loginattempt; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE admin_honeypot_loginattempt (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    ip_address inet,
    session_key character varying(50),
    user_agent text,
    "timestamp" timestamp with time zone NOT NULL,
    path character varying(255)
);


ALTER TABLE public.admin_honeypot_loginattempt OWNER TO staff;

--
-- Name: admin_honeypot_loginattempt_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE admin_honeypot_loginattempt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_honeypot_loginattempt_id_seq OWNER TO staff;

--
-- Name: admin_honeypot_loginattempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE admin_honeypot_loginattempt_id_seq OWNED BY admin_honeypot_loginattempt.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO staff;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO staff;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO staff;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO staff;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO staff;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO staff;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO staff;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO staff;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO staff;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO staff;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO staff;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO staff;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cache_table; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE cache_table (
    cache_key character varying(255) NOT NULL,
    value text NOT NULL,
    expires timestamp with time zone NOT NULL
);


ALTER TABLE public.cache_table OWNER TO staff;

--
-- Name: core_shorturl; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE core_shorturl (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    uuid character varying(5) NOT NULL,
    fecha timestamp with time zone NOT NULL,
    visitas integer NOT NULL
);


ALTER TABLE public.core_shorturl OWNER TO staff;

--
-- Name: core_shorturl_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE core_shorturl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_shorturl_id_seq OWNER TO staff;

--
-- Name: core_shorturl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE core_shorturl_id_seq OWNED BY core_shorturl.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO staff;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO staff;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO staff;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO staff;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO staff;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO staff;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO staff;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer,
    comment text NOT NULL,
    manager_slug character varying(200) NOT NULL
);


ALTER TABLE public.reversion_revision OWNER TO staff;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO staff;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    revision_id integer NOT NULL,
    object_id text NOT NULL,
    content_type_id integer NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    type smallint NOT NULL,
    object_id_int integer,
    CONSTRAINT ck_type_pstv_5d312ad3ef9f6aea CHECK ((type >= 0)),
    CONSTRAINT reversion_version_type_check CHECK ((type >= 0))
);


ALTER TABLE public.reversion_version OWNER TO staff;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO staff;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO staff;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO staff;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: web_bloque; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_bloque (
    id integer NOT NULL,
    nombre1 character varying(120) NOT NULL,
    nombre2 character varying(120) NOT NULL,
    titulo character varying(40) NOT NULL,
    descripcion text NOT NULL,
    telefono character varying(120) NOT NULL,
    imagen1 character varying(200) NOT NULL,
    imagen2 character varying(200) NOT NULL,
    posicion integer NOT NULL
);


ALTER TABLE public.web_bloque OWNER TO staff;

--
-- Name: web_bloque_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_bloque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_bloque_id_seq OWNER TO staff;

--
-- Name: web_bloque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_bloque_id_seq OWNED BY web_bloque.id;


--
-- Name: web_categoria; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_categoria (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    nombre character varying(120) NOT NULL,
    slug character varying(180) NOT NULL,
    parent_id integer,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    CONSTRAINT web_categoria_level_check CHECK ((level >= 0)),
    CONSTRAINT web_categoria_lft_check CHECK ((lft >= 0)),
    CONSTRAINT web_categoria_rght_check CHECK ((rght >= 0)),
    CONSTRAINT web_categoria_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.web_categoria OWNER TO staff;

--
-- Name: web_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_categoria_id_seq OWNER TO staff;

--
-- Name: web_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_categoria_id_seq OWNED BY web_categoria.id;


--
-- Name: web_contacto; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_contacto (
    id integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    nombres character varying(120) NOT NULL,
    telefono character varying(120) NOT NULL,
    email character varying(75) NOT NULL,
    mensaje text NOT NULL
);


ALTER TABLE public.web_contacto OWNER TO staff;

--
-- Name: web_contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_contacto_id_seq OWNER TO staff;

--
-- Name: web_contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_contacto_id_seq OWNED BY web_contacto.id;


--
-- Name: web_contactohome; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_contactohome (
    id integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    nombres character varying(120) NOT NULL,
    telefono character varying(120) NOT NULL,
    email character varying(75) NOT NULL
);


ALTER TABLE public.web_contactohome OWNER TO staff;

--
-- Name: web_contactohome_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_contactohome_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_contactohome_id_seq OWNER TO staff;

--
-- Name: web_contactohome_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_contactohome_id_seq OWNED BY web_contactohome.id;


--
-- Name: web_enlaces; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_enlaces (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    titulo character varying(38) NOT NULL,
    enlace character varying(200) NOT NULL,
    posicion integer NOT NULL
);


ALTER TABLE public.web_enlaces OWNER TO staff;

--
-- Name: web_enlaces_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_enlaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_enlaces_id_seq OWNER TO staff;

--
-- Name: web_enlaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_enlaces_id_seq OWNED BY web_enlaces.id;


--
-- Name: web_infosite; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_infosite (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    email character varying(75) NOT NULL,
    email_form character varying(75) NOT NULL,
    fijo character varying(50) NOT NULL,
    telefono character varying(50) NOT NULL,
    direccion character varying(120) NOT NULL,
    site character varying(60) NOT NULL,
    facebook character varying(200) NOT NULL,
    twitter character varying(200) NOT NULL,
    titulo character varying(40) NOT NULL,
    description text NOT NULL,
    ga character varying(24) NOT NULL,
    coordenadas character varying(48) NOT NULL
);


ALTER TABLE public.web_infosite OWNER TO staff;

--
-- Name: web_infosite_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_infosite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_infosite_id_seq OWNER TO staff;

--
-- Name: web_infosite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_infosite_id_seq OWNED BY web_infosite.id;


--
-- Name: web_nosotros; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_nosotros (
    id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    slug character varying(180) NOT NULL,
    descripcion text NOT NULL,
    posicion integer NOT NULL
);


ALTER TABLE public.web_nosotros OWNER TO staff;

--
-- Name: web_nosotros_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_nosotros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_nosotros_id_seq OWNER TO staff;

--
-- Name: web_nosotros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_nosotros_id_seq OWNED BY web_nosotros.id;


--
-- Name: web_noticia; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_noticia (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    nombre character varying(120) NOT NULL,
    slug character varying(180) NOT NULL,
    fecha date NOT NULL,
    detalle text NOT NULL,
    portada character varying(200) NOT NULL
);


ALTER TABLE public.web_noticia OWNER TO staff;

--
-- Name: web_noticia_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_noticia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_noticia_id_seq OWNER TO staff;

--
-- Name: web_noticia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_noticia_id_seq OWNED BY web_noticia.id;


--
-- Name: web_producto; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_producto (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    nombre character varying(120) NOT NULL,
    slug character varying(180) NOT NULL,
    categoria_id integer NOT NULL,
    imagen character varying(200) NOT NULL
);


ALTER TABLE public.web_producto OWNER TO staff;

--
-- Name: web_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_producto_id_seq OWNER TO staff;

--
-- Name: web_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_producto_id_seq OWNED BY web_producto.id;


--
-- Name: web_promo; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_promo (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    nombre character varying(120) NOT NULL,
    imagen1 character varying(200) NOT NULL,
    imagen2 character varying(200) NOT NULL,
    posicion integer NOT NULL
);


ALTER TABLE public.web_promo OWNER TO staff;

--
-- Name: web_promo_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_promo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_promo_id_seq OWNER TO staff;

--
-- Name: web_promo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_promo_id_seq OWNED BY web_promo.id;


--
-- Name: web_servicio; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_servicio (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    nombre1 character varying(120) NOT NULL,
    nombre character varying(120) NOT NULL,
    descripcion text NOT NULL,
    telefono character varying(120) NOT NULL,
    imagen1 character varying(200) NOT NULL,
    imagen2 character varying(200) NOT NULL,
    posicion integer NOT NULL
);


ALTER TABLE public.web_servicio OWNER TO staff;

--
-- Name: web_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_servicio_id_seq OWNER TO staff;

--
-- Name: web_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_servicio_id_seq OWNED BY web_servicio.id;


--
-- Name: web_sligaleria; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_sligaleria (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    imagen character varying(200) NOT NULL,
    posicion integer NOT NULL
);


ALTER TABLE public.web_sligaleria OWNER TO staff;

--
-- Name: web_sligaleria_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_sligaleria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_sligaleria_id_seq OWNER TO staff;

--
-- Name: web_sligaleria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_sligaleria_id_seq OWNED BY web_sligaleria.id;


--
-- Name: web_slyder; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_slyder (
    id integer NOT NULL,
    active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    created_by integer,
    modified_by integer,
    imagen character varying(200) NOT NULL,
    lugar character varying(1) NOT NULL,
    posicion integer NOT NULL
);


ALTER TABLE public.web_slyder OWNER TO staff;

--
-- Name: web_slyder_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_slyder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_slyder_id_seq OWNER TO staff;

--
-- Name: web_slyder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_slyder_id_seq OWNED BY web_slyder.id;


--
-- Name: web_suscripcionpromo; Type: TABLE; Schema: public; Owner: staff; Tablespace: 
--

CREATE TABLE web_suscripcionpromo (
    id integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    email character varying(75) NOT NULL
);


ALTER TABLE public.web_suscripcionpromo OWNER TO staff;

--
-- Name: web_suscripcionpromo_id_seq; Type: SEQUENCE; Schema: public; Owner: staff
--

CREATE SEQUENCE web_suscripcionpromo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_suscripcionpromo_id_seq OWNER TO staff;

--
-- Name: web_suscripcionpromo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff
--

ALTER SEQUENCE web_suscripcionpromo_id_seq OWNED BY web_suscripcionpromo.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY admin_honeypot_loginattempt ALTER COLUMN id SET DEFAULT nextval('admin_honeypot_loginattempt_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY core_shorturl ALTER COLUMN id SET DEFAULT nextval('core_shorturl_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_bloque ALTER COLUMN id SET DEFAULT nextval('web_bloque_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_categoria ALTER COLUMN id SET DEFAULT nextval('web_categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_contacto ALTER COLUMN id SET DEFAULT nextval('web_contacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_contactohome ALTER COLUMN id SET DEFAULT nextval('web_contactohome_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_enlaces ALTER COLUMN id SET DEFAULT nextval('web_enlaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_infosite ALTER COLUMN id SET DEFAULT nextval('web_infosite_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_nosotros ALTER COLUMN id SET DEFAULT nextval('web_nosotros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_noticia ALTER COLUMN id SET DEFAULT nextval('web_noticia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_producto ALTER COLUMN id SET DEFAULT nextval('web_producto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_promo ALTER COLUMN id SET DEFAULT nextval('web_promo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_servicio ALTER COLUMN id SET DEFAULT nextval('web_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_sligaleria ALTER COLUMN id SET DEFAULT nextval('web_sligaleria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_slyder ALTER COLUMN id SET DEFAULT nextval('web_slyder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_suscripcionpromo ALTER COLUMN id SET DEFAULT nextval('web_suscripcionpromo_id_seq'::regclass);


--
-- Data for Name: admin_honeypot_loginattempt; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO admin_honeypot_loginattempt VALUES (1, 'admin', 'admin', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36', '2014-03-10 14:42:26.9422+00', '/admin/');
INSERT INTO admin_honeypot_loginattempt VALUES (2, 'admin', 'admin', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36', '2014-03-10 14:42:39.175738+00', '/admin/');
INSERT INTO admin_honeypot_loginattempt VALUES (3, 'admin', 'admin', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36', '2014-03-10 14:43:00.305863+00', '/admin/');
INSERT INTO admin_honeypot_loginattempt VALUES (4, 'admin', 'admin', '127.0.0.1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36', '2014-03-10 14:43:38.905568+00', '/admin/');


--
-- Name: admin_honeypot_loginattempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('admin_honeypot_loginattempt_id_seq', 4, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO auth_permission VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO auth_permission VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO auth_permission VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO auth_permission VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO auth_permission VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO auth_permission VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO auth_permission VALUES (7, 'Can add user', 3, 'add_user');
INSERT INTO auth_permission VALUES (8, 'Can change user', 3, 'change_user');
INSERT INTO auth_permission VALUES (9, 'Can delete user', 3, 'delete_user');
INSERT INTO auth_permission VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO auth_permission VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO auth_permission VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO auth_permission VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO auth_permission VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO auth_permission VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO auth_permission VALUES (16, 'Can add site', 6, 'add_site');
INSERT INTO auth_permission VALUES (17, 'Can change site', 6, 'change_site');
INSERT INTO auth_permission VALUES (18, 'Can delete site', 6, 'delete_site');
INSERT INTO auth_permission VALUES (19, 'Can add log entry', 7, 'add_logentry');
INSERT INTO auth_permission VALUES (20, 'Can change log entry', 7, 'change_logentry');
INSERT INTO auth_permission VALUES (21, 'Can delete log entry', 7, 'delete_logentry');
INSERT INTO auth_permission VALUES (22, 'Can add migration history', 8, 'add_migrationhistory');
INSERT INTO auth_permission VALUES (23, 'Can change migration history', 8, 'change_migrationhistory');
INSERT INTO auth_permission VALUES (24, 'Can delete migration history', 8, 'delete_migrationhistory');
INSERT INTO auth_permission VALUES (25, 'Can add login attempt', 9, 'add_loginattempt');
INSERT INTO auth_permission VALUES (26, 'Can change login attempt', 9, 'change_loginattempt');
INSERT INTO auth_permission VALUES (27, 'Can delete login attempt', 9, 'delete_loginattempt');
INSERT INTO auth_permission VALUES (28, 'Can add revision', 10, 'add_revision');
INSERT INTO auth_permission VALUES (29, 'Can change revision', 10, 'change_revision');
INSERT INTO auth_permission VALUES (30, 'Can delete revision', 10, 'delete_revision');
INSERT INTO auth_permission VALUES (31, 'Can add version', 11, 'add_version');
INSERT INTO auth_permission VALUES (32, 'Can change version', 11, 'change_version');
INSERT INTO auth_permission VALUES (33, 'Can delete version', 11, 'delete_version');
INSERT INTO auth_permission VALUES (34, 'Can add short url', 12, 'add_shorturl');
INSERT INTO auth_permission VALUES (35, 'Can change short url', 12, 'change_shorturl');
INSERT INTO auth_permission VALUES (36, 'Can delete short url', 12, 'delete_shorturl');
INSERT INTO auth_permission VALUES (37, 'Can add info site', 13, 'add_infosite');
INSERT INTO auth_permission VALUES (38, 'Can change info site', 13, 'change_infosite');
INSERT INTO auth_permission VALUES (39, 'Can delete info site', 13, 'delete_infosite');
INSERT INTO auth_permission VALUES (40, 'Can add Noticia', 14, 'add_noticia');
INSERT INTO auth_permission VALUES (41, 'Can change Noticia', 14, 'change_noticia');
INSERT INTO auth_permission VALUES (42, 'Can delete Noticia', 14, 'delete_noticia');
INSERT INTO auth_permission VALUES (43, 'Can add categoria', 15, 'add_categoria');
INSERT INTO auth_permission VALUES (44, 'Can change categoria', 15, 'change_categoria');
INSERT INTO auth_permission VALUES (45, 'Can delete categoria', 15, 'delete_categoria');
INSERT INTO auth_permission VALUES (46, 'Can add Producto', 16, 'add_producto');
INSERT INTO auth_permission VALUES (47, 'Can change Producto', 16, 'change_producto');
INSERT INTO auth_permission VALUES (48, 'Can delete Producto', 16, 'delete_producto');
INSERT INTO auth_permission VALUES (49, 'Can add Mensaje', 17, 'add_contacto');
INSERT INTO auth_permission VALUES (50, 'Can change Mensaje', 17, 'change_contacto');
INSERT INTO auth_permission VALUES (51, 'Can delete Mensaje', 17, 'delete_contacto');
INSERT INTO auth_permission VALUES (52, 'Can add Suscriptor', 18, 'add_suscripcionpromo');
INSERT INTO auth_permission VALUES (53, 'Can change Suscriptor', 18, 'change_suscripcionpromo');
INSERT INTO auth_permission VALUES (54, 'Can delete Suscriptor', 18, 'delete_suscripcionpromo');
INSERT INTO auth_permission VALUES (55, 'Can add Contacto', 19, 'add_contactohome');
INSERT INTO auth_permission VALUES (56, 'Can change Contacto', 19, 'change_contactohome');
INSERT INTO auth_permission VALUES (57, 'Can delete Contacto', 19, 'delete_contactohome');
INSERT INTO auth_permission VALUES (58, 'Can add Slyder', 20, 'add_slyder');
INSERT INTO auth_permission VALUES (59, 'Can change Slyder', 20, 'change_slyder');
INSERT INTO auth_permission VALUES (60, 'Can delete Slyder', 20, 'delete_slyder');
INSERT INTO auth_permission VALUES (61, 'Can add Enlace', 21, 'add_enlaces');
INSERT INTO auth_permission VALUES (62, 'Can change Enlace', 21, 'change_enlaces');
INSERT INTO auth_permission VALUES (63, 'Can delete Enlace', 21, 'delete_enlaces');
INSERT INTO auth_permission VALUES (64, 'Can add Bloque', 22, 'add_bloque');
INSERT INTO auth_permission VALUES (65, 'Can change Bloque', 22, 'change_bloque');
INSERT INTO auth_permission VALUES (66, 'Can delete Bloque', 22, 'delete_bloque');
INSERT INTO auth_permission VALUES (67, 'Can add Nosotros', 23, 'add_nosotros');
INSERT INTO auth_permission VALUES (68, 'Can change Nosotros', 23, 'change_nosotros');
INSERT INTO auth_permission VALUES (69, 'Can delete Nosotros', 23, 'delete_nosotros');
INSERT INTO auth_permission VALUES (70, 'Can add Servicio', 24, 'add_servicio');
INSERT INTO auth_permission VALUES (71, 'Can change Servicio', 24, 'change_servicio');
INSERT INTO auth_permission VALUES (72, 'Can delete Servicio', 24, 'delete_servicio');
INSERT INTO auth_permission VALUES (73, 'Can add Promoción', 25, 'add_promo');
INSERT INTO auth_permission VALUES (74, 'Can change Promoción', 25, 'change_promo');
INSERT INTO auth_permission VALUES (75, 'Can delete Promoción', 25, 'delete_promo');
INSERT INTO auth_permission VALUES (76, 'Can add Galeria', 26, 'add_sligaleria');
INSERT INTO auth_permission VALUES (77, 'Can change Galeria', 26, 'change_sligaleria');
INSERT INTO auth_permission VALUES (78, 'Can delete Galeria', 26, 'delete_sligaleria');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('auth_permission_id_seq', 78, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO auth_user VALUES (1, 'pbkdf2_sha256$10000$sI5PuyXVw7Gt$YEMrRaXPmvWlzjqo8Y0m0N1UeeY2p650mwy9Gk2z+Gg=', '2014-03-14 22:19:57.471009+00', true, 'admin', '', '', 'admin@gmail.com', true, true, '2014-03-08 00:03:19.981489+00');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cache_table; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO cache_table VALUES (':1:django_compressor.templatetag.d41d8cd98f00.file.css', 'gAJVAEdB1NFWMRr0z4mHcQEu', '2014-04-09 14:27:46+00');


--
-- Data for Name: core_shorturl; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: core_shorturl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('core_shorturl_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO django_admin_log VALUES (1, '2014-03-10 20:36:13.231145+00', 1, 22, '6', 'tratamiento de belleza', 2, 'Modificado/a imagen1.');
INSERT INTO django_admin_log VALUES (2, '2014-03-10 20:36:21.258429+00', 1, 22, '7', 'Lorem ipsum lorem ipsum rom lorem ipsum lorem', 2, 'Modificado/a imagen1.');
INSERT INTO django_admin_log VALUES (3, '2014-03-10 20:36:31.079031+00', 1, 22, '8', 'Lorem ipsum lorem ipsum rom lorem ipsum lorem', 2, 'Modificado/a imagen1.');
INSERT INTO django_admin_log VALUES (4, '2014-03-10 20:36:59.744402+00', 1, 20, '10', 'Slide', 1, '');
INSERT INTO django_admin_log VALUES (5, '2014-03-10 20:37:38.30391+00', 1, 26, '1', 'Slider', 3, '');
INSERT INTO django_admin_log VALUES (6, '2014-03-10 20:37:38.305941+00', 1, 26, '2', 'Slider', 3, '');
INSERT INTO django_admin_log VALUES (7, '2014-03-10 20:37:38.307153+00', 1, 26, '3', 'Slider', 3, '');
INSERT INTO django_admin_log VALUES (8, '2014-03-10 20:37:38.308188+00', 1, 26, '4', 'Slider', 3, '');
INSERT INTO django_admin_log VALUES (9, '2014-03-10 20:41:01.364627+00', 1, 26, '5', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (10, '2014-03-10 20:41:14.935702+00', 1, 26, '6', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (11, '2014-03-10 20:41:27.734867+00', 1, 26, '7', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (12, '2014-03-10 20:41:40.6368+00', 1, 26, '8', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (13, '2014-03-10 20:41:54.452349+00', 1, 26, '9', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (14, '2014-03-10 20:42:17.868501+00', 1, 26, '10', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (15, '2014-03-10 20:42:28.996133+00', 1, 26, '11', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (16, '2014-03-10 20:42:45.82338+00', 1, 26, '12', 'Slider', 1, '');
INSERT INTO django_admin_log VALUES (17, '2014-03-10 20:47:37.064252+00', 1, 25, '2', 'PROMO 3', 2, 'Modificado/a imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (18, '2014-03-10 20:48:25.84941+00', 1, 25, '3', 'PROMO 3', 2, 'Modificado/a imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (19, '2014-03-10 20:49:55.041942+00', 1, 25, '4', 'PROMO 3', 2, 'Modificado/a imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (20, '2014-03-10 20:50:51.689788+00', 1, 25, '5', 'PROMO 3', 2, 'Modificado/a imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (21, '2014-03-10 20:52:11.178126+00', 1, 25, '6', 'PROMO 3', 2, 'Modificado/a imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (22, '2014-03-10 20:55:01.206663+00', 1, 25, '7', 'Omnomnom', 2, 'Modificado/a imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (23, '2014-03-10 21:09:02.203258+00', 1, 24, '1', 'Omnomnomnonm', 2, 'Modificado/a descripcion, telefono, imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (24, '2014-03-10 21:09:21.735145+00', 1, 24, '1', 'Baños de Hipertermia', 2, 'Modificado/a nombre1 y nombre.');
INSERT INTO django_admin_log VALUES (25, '2014-03-10 21:15:08.722932+00', 1, 24, '2', 'Stone-2 Massage', 2, 'Modificado/a descripcion, imagen1 y imagen2.');
INSERT INTO django_admin_log VALUES (26, '2014-03-10 21:15:50.664677+00', 1, 24, '2', 'Geoterapia', 2, 'Modificado/a nombre1 y nombre.');
INSERT INTO django_admin_log VALUES (27, '2014-03-10 21:25:11.836845+00', 1, 24, '2', 'Geoterapia', 2, 'No ha cambiado ningún campo.');
INSERT INTO django_admin_log VALUES (28, '2014-03-10 22:54:13.758135+00', 1, 20, '6', 'Slide', 2, 'Modificado/a imagen.');
INSERT INTO django_admin_log VALUES (29, '2014-03-10 23:18:33.319487+00', 1, 20, '7', 'Slide', 2, 'Modificado/a imagen.');
INSERT INTO django_admin_log VALUES (30, '2014-03-10 23:25:02.901392+00', 1, 22, '7', '-', 2, 'Modificado/a nombre1.');
INSERT INTO django_admin_log VALUES (31, '2014-03-10 23:25:45.92636+00', 1, 22, '6', '-', 2, 'Modificado/a nombre1.');
INSERT INTO django_admin_log VALUES (32, '2014-03-10 23:25:53.193989+00', 1, 22, '8', '-', 2, 'Modificado/a nombre1.');
INSERT INTO django_admin_log VALUES (33, '2014-03-10 23:27:53.752462+00', 1, 21, '2', 'CONTRACTURA MUSCULAR', 2, 'Modificado/a enlace.');
INSERT INTO django_admin_log VALUES (34, '2014-03-10 23:28:54.583366+00', 1, 21, '2', 'CONTRACTURA MUSCULAR', 2, 'No ha cambiado ningún campo.');
INSERT INTO django_admin_log VALUES (35, '2014-03-10 23:29:14.915605+00', 1, 21, '4', 'STONE PRO MASSAGE', 2, 'Modificado/a enlace.');
INSERT INTO django_admin_log VALUES (36, '2014-03-11 14:40:32.169321+00', 1, 20, '4', 'Slide', 2, 'Modificado/a posicion.');
INSERT INTO django_admin_log VALUES (37, '2014-03-11 14:40:41.178922+00', 1, 20, '8', 'Slide', 2, 'Modificado/a posicion.');
INSERT INTO django_admin_log VALUES (38, '2014-03-11 14:40:47.522285+00', 1, 20, '10', 'Slide', 2, 'Modificado/a posicion.');
INSERT INTO django_admin_log VALUES (39, '2014-03-11 15:22:18.541575+00', 1, 21, '2', 'BAÑOS DE HIPERMETRIA', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (40, '2014-03-11 15:25:07.458825+00', 1, 21, '3', 'BIOMAGNETISMO', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (41, '2014-03-11 15:26:57.109224+00', 1, 21, '4', 'REIKI', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (42, '2014-03-11 15:28:38.34778+00', 1, 21, '2', 'BAÑOS DE                     HIPERMETRIA', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (43, '2014-03-11 15:29:58.72106+00', 1, 21, '2', 'BAÑOS DE <br> HIPERMETRIA', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (44, '2014-03-11 15:31:08.025536+00', 1, 21, '2', 'BAÑOS DE HIPERMETRIA', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (45, '2014-03-11 15:38:13.007639+00', 1, 20, '11', 'Slide', 1, '');
INSERT INTO django_admin_log VALUES (46, '2014-03-11 15:39:00.514334+00', 1, 20, '12', 'Slide', 1, '');
INSERT INTO django_admin_log VALUES (47, '2014-03-11 15:41:14.957991+00', 1, 24, '2', 'Geoterapia', 2, 'Modificado/a descripcion.');
INSERT INTO django_admin_log VALUES (48, '2014-03-11 15:43:03.498089+00', 1, 24, '1', 'Baños de Hipertermia', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (49, '2014-03-11 15:43:40.888125+00', 1, 24, '2', 'Geoterapia', 2, 'Modificado/a telefono.');
INSERT INTO django_admin_log VALUES (50, '2014-03-11 15:47:28.104841+00', 1, 24, '1', 'Baños de Hipertermia', 2, 'Modificado/a telefono.');
INSERT INTO django_admin_log VALUES (51, '2014-03-11 15:52:55.132071+00', 1, 13, '1', 'Información del Sitio', 2, 'Modificado/a telefono y fijo.');
INSERT INTO django_admin_log VALUES (52, '2014-03-11 16:39:10.511155+00', 1, 24, '2', 'Geoterapia', 2, 'Modificado/a telefono.');
INSERT INTO django_admin_log VALUES (53, '2014-03-11 16:52:20.820288+00', 1, 24, '1', 'Baños de Hipertermia', 2, 'Modificado/a telefono.');
INSERT INTO django_admin_log VALUES (54, '2014-03-11 16:52:26.151614+00', 1, 24, '2', 'Geoterapia', 2, 'No ha cambiado ningún campo.');
INSERT INTO django_admin_log VALUES (55, '2014-03-11 16:52:32.476636+00', 1, 24, '3', 'Stone-3 Massage', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (56, '2014-03-11 16:52:41.961263+00', 1, 24, '4', 'Stone-4 Massage', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (57, '2014-03-11 16:52:47.192878+00', 1, 24, '5', 'Stone-5 Massage', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (58, '2014-03-11 16:52:53.080481+00', 1, 24, '6', 'Stone-6 Massage', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (59, '2014-03-11 16:52:58.879037+00', 1, 24, '7', 'Stone-7 Massage', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (60, '2014-03-11 16:53:03.954699+00', 1, 24, '8', 'Stone-8 Massage', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (61, '2014-03-11 16:53:09.557591+00', 1, 24, '8', 'Stone-8 Massage', 2, 'Modificado/a active.');
INSERT INTO django_admin_log VALUES (62, '2014-03-11 16:53:15.608462+00', 1, 24, '8', 'Stone-8 Massage', 2, 'Modificado/a active.');
INSERT INTO django_admin_log VALUES (63, '2014-03-11 16:53:22.575521+00', 1, 24, '9', 'Stone-9 Massage', 2, 'Modificado/a descripcion y telefono.');
INSERT INTO django_admin_log VALUES (64, '2014-03-11 16:58:44.87836+00', 1, 24, '10', 'Bodega Naturista', 1, '');
INSERT INTO django_admin_log VALUES (65, '2014-03-11 17:01:58.619483+00', 1, 24, '3', 'Stone-3 Massage', 2, 'Modificado/a descripcion.');
INSERT INTO django_admin_log VALUES (66, '2014-03-11 17:02:59.931015+00', 1, 24, '3', 'Biomagnetismo Medico', 2, 'Modificado/a nombre1 y nombre.');
INSERT INTO django_admin_log VALUES (67, '2014-03-11 17:14:28.262506+00', 1, 24, '4', 'Stone Massage', 2, 'Modificado/a nombre1, nombre y descripcion.');
INSERT INTO django_admin_log VALUES (68, '2014-03-11 17:15:44.963591+00', 1, 24, '5', 'Masaje Tailandés', 2, 'Modificado/a nombre1, nombre y descripcion.');
INSERT INTO django_admin_log VALUES (69, '2014-03-11 17:16:58.677953+00', 1, 24, '6', 'Reiki', 2, 'Modificado/a nombre1, nombre y descripcion.');
INSERT INTO django_admin_log VALUES (70, '2014-03-11 17:18:07.572367+00', 1, 24, '7', 'Homaterapia', 2, 'Modificado/a nombre1, nombre y descripcion.');
INSERT INTO django_admin_log VALUES (71, '2014-03-11 17:18:58.123396+00', 1, 24, '8', 'Reflexología', 2, 'Modificado/a nombre1, nombre y descripcion.');
INSERT INTO django_admin_log VALUES (72, '2014-03-11 17:19:53.298191+00', 1, 24, '9', 'Restaurante Vegetariano', 2, 'Modificado/a nombre1, nombre y descripcion.');
INSERT INTO django_admin_log VALUES (73, '2014-03-11 20:36:58.699792+00', 1, 23, '4', 'Nosotros', 2, 'Modificado/a descripcion.');
INSERT INTO django_admin_log VALUES (74, '2014-03-11 20:37:27.70659+00', 1, 23, '5', 'Nosotros', 2, 'Modificado/a descripcion.');
INSERT INTO django_admin_log VALUES (75, '2014-03-11 20:55:40.153854+00', 1, 20, '9', 'Slide', 2, 'Modificado/a active.');
INSERT INTO django_admin_log VALUES (76, '2014-03-11 20:56:12.199263+00', 1, 20, '13', 'Slide', 1, '');
INSERT INTO django_admin_log VALUES (77, '2014-03-11 20:57:03.692678+00', 1, 20, '9', 'Slide', 2, 'Modificado/a active y imagen.');
INSERT INTO django_admin_log VALUES (78, '2014-03-12 00:04:34.524494+00', 1, 13, '1', 'Información del Sitio', 2, 'Modificado/a direccion.');
INSERT INTO django_admin_log VALUES (79, '2014-03-12 15:17:20.240311+00', 1, 13, '1', 'Información del Sitio', 2, 'Modificado/a coordenadas.');
INSERT INTO django_admin_log VALUES (80, '2014-03-13 15:16:05.701576+00', 1, 25, '2', 'PROMO 3', 2, 'Modificado/a imagen2.');
INSERT INTO django_admin_log VALUES (81, '2014-03-13 15:32:52.511363+00', 1, 13, '1', 'Información del Sitio', 2, 'No ha cambiado ningún campo.');
INSERT INTO django_admin_log VALUES (82, '2014-03-13 16:09:23.255373+00', 1, 13, '1', 'Información del Sitio', 2, 'Modificado/a email_form.');
INSERT INTO django_admin_log VALUES (83, '2014-03-13 16:40:14.733651+00', 1, 18, '43', 'yata@yata.ya: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (84, '2014-03-13 16:40:14.795477+00', 1, 18, '42', 'rawr@rawr.es: 2014-03-07', 3, '');
INSERT INTO django_admin_log VALUES (85, '2014-03-13 16:40:14.796162+00', 1, 18, '41', 'despuesde@todo.com: 2014-03-07', 3, '');
INSERT INTO django_admin_log VALUES (86, '2014-03-13 16:40:14.813253+00', 1, 18, '40', 'rawr@rawr.com: 2014-03-07', 3, '');
INSERT INTO django_admin_log VALUES (87, '2014-03-13 16:40:32.752583+00', 1, 17, '13', 'getas@gt.gt: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (88, '2014-03-13 16:40:32.753689+00', 1, 17, '12', 'the_master_stronger@homail.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (89, '2014-03-13 16:40:32.754307+00', 1, 17, '11', 'sdk@sdk.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (90, '2014-03-13 16:40:32.754916+00', 1, 17, '10', 'asdasdasd@h.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (91, '2014-03-13 16:40:32.755505+00', 1, 17, '9', 'desarrollo@staffcreativa.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (92, '2014-03-13 16:40:32.756114+00', 1, 17, '8', 'ytyty@we.com: 2014-03-07', 3, '');
INSERT INTO django_admin_log VALUES (93, '2014-03-13 16:40:32.756691+00', 1, 17, '7', 'yata@yata.com: 2014-03-07', 3, '');
INSERT INTO django_admin_log VALUES (94, '2014-03-13 16:41:06.712991+00', 1, 19, '13', 'yata_yata@yata.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (95, '2014-03-13 16:41:06.714201+00', 1, 19, '12', 'yata_yata@yata.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (96, '2014-03-13 16:41:06.714806+00', 1, 19, '11', 'the_master_stronger@hotmail.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (97, '2014-03-13 16:41:06.715402+00', 1, 19, '10', 'sdsd@df.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (98, '2014-03-13 16:41:06.715978+00', 1, 19, '9', 'sdsd@sdk.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (99, '2014-03-13 16:41:06.716563+00', 1, 19, '8', 'sdsd@df.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (100, '2014-03-13 16:41:06.717143+00', 1, 19, '7', 'sdsd@sdk.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (101, '2014-03-13 16:41:06.717734+00', 1, 19, '6', 'sdsd@sdk.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (102, '2014-03-13 16:41:06.718317+00', 1, 19, '5', 'sdsd@sdk.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (103, '2014-03-13 16:41:06.718886+00', 1, 19, '4', 'test@test.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (104, '2014-03-13 16:41:06.719472+00', 1, 19, '3', 'test@test.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (105, '2014-03-13 16:41:06.720046+00', 1, 19, '2', 'test@test.com: 2014-03-13', 3, '');
INSERT INTO django_admin_log VALUES (106, '2014-03-13 16:41:06.720622+00', 1, 19, '1', 'yata@yata.com: 2014-03-11', 3, '');
INSERT INTO django_admin_log VALUES (107, '2014-03-14 22:20:02.284776+00', 1, 13, '1', 'Información del Sitio', 2, 'Modificado/a facebook.');
INSERT INTO django_admin_log VALUES (108, '2014-03-14 22:20:55.380195+00', 1, 13, '1', 'Información del Sitio', 2, 'Modificado/a facebook y twitter.');
INSERT INTO django_admin_log VALUES (109, '2014-03-14 22:21:40.160535+00', 1, 21, '2', 'BAÑOS', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (110, '2014-03-14 22:21:51.047099+00', 1, 21, '2', 'BAÑOS DE HIPERTERMIA', 2, 'Modificado/a titulo.');
INSERT INTO django_admin_log VALUES (111, '2014-03-14 22:23:47.940782+00', 1, 24, '7', 'Homaterapia', 2, 'Modificado/a descripcion.');
INSERT INTO django_admin_log VALUES (112, '2014-03-14 22:24:29.474392+00', 1, 24, '7', 'Homaterapia', 2, 'Modificado/a descripcion.');
INSERT INTO django_admin_log VALUES (113, '2014-03-14 22:25:20.699324+00', 1, 24, '7', 'Homaterapia', 2, 'Modificado/a descripcion.');


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 113, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO django_content_type VALUES (1, 'permission', 'auth', 'permission');
INSERT INTO django_content_type VALUES (2, 'group', 'auth', 'group');
INSERT INTO django_content_type VALUES (3, 'user', 'auth', 'user');
INSERT INTO django_content_type VALUES (4, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (5, 'session', 'sessions', 'session');
INSERT INTO django_content_type VALUES (6, 'site', 'sites', 'site');
INSERT INTO django_content_type VALUES (7, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type VALUES (8, 'migration history', 'south', 'migrationhistory');
INSERT INTO django_content_type VALUES (9, 'login attempt', 'admin_honeypot', 'loginattempt');
INSERT INTO django_content_type VALUES (10, 'revision', 'reversion', 'revision');
INSERT INTO django_content_type VALUES (11, 'version', 'reversion', 'version');
INSERT INTO django_content_type VALUES (12, 'short url', 'core', 'shorturl');
INSERT INTO django_content_type VALUES (13, 'info site', 'web', 'infosite');
INSERT INTO django_content_type VALUES (14, 'Noticia', 'web', 'noticia');
INSERT INTO django_content_type VALUES (15, 'categoria', 'web', 'categoria');
INSERT INTO django_content_type VALUES (16, 'Producto', 'web', 'producto');
INSERT INTO django_content_type VALUES (17, 'Mensaje', 'web', 'contacto');
INSERT INTO django_content_type VALUES (18, 'Suscriptor', 'web', 'suscripcionpromo');
INSERT INTO django_content_type VALUES (19, 'Contacto', 'web', 'contactohome');
INSERT INTO django_content_type VALUES (20, 'Slyder', 'web', 'slyder');
INSERT INTO django_content_type VALUES (21, 'Enlace', 'web', 'enlaces');
INSERT INTO django_content_type VALUES (22, 'Bloque', 'web', 'bloque');
INSERT INTO django_content_type VALUES (23, 'Nosotros', 'web', 'nosotros');
INSERT INTO django_content_type VALUES (24, 'Servicio', 'web', 'servicio');
INSERT INTO django_content_type VALUES (25, 'Promoción', 'web', 'promo');
INSERT INTO django_content_type VALUES (26, 'Galeria', 'web', 'sligaleria');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('django_content_type_id_seq', 26, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO django_session VALUES ('mtzj7lgh4ci58povsepj5ng626tzvhj8', 'MGZmMTRmYTNjZjNiOWZhYTA3ZjhiN2MxZGYxZTViYjhjNzZjNjQxYjqAAn1xAS4=', '2014-03-24 14:43:36.945315+00');
INSERT INTO django_session VALUES ('xvmo4c1wsczjk1i9cfxgeanaaiduanz6', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-24 14:44:17.150822+00');
INSERT INTO django_session VALUES ('haw83vc9e7pxw0rgu6t170qblyfjq1nu', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-24 17:56:29.793766+00');
INSERT INTO django_session VALUES ('zc0jwqc37now3ux9cpc0pf9u0pxh6vry', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-24 19:50:03.909604+00');
INSERT INTO django_session VALUES ('xeg3sxg4r1cl1pu4gr6sffrc75l0igrs', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-24 19:51:00.537049+00');
INSERT INTO django_session VALUES ('zcoryfdeneu222lfxodu2dv0yq0mu2gb', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-24 23:20:43.517299+00');
INSERT INTO django_session VALUES ('qzasnyvqqe1m0ww6w7rlnwl2485cdem9', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-25 13:26:02.829528+00');
INSERT INTO django_session VALUES ('4d58zg0ovtgdssehq6f0br7qo6km22xu', 'ZDlkMjZiNTliOTVmZTY0MWUxNzljMzQ0ZDBkYTZkZDMxOGQ0MjFmNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu', '2014-03-25 19:24:24.130196+00');
INSERT INTO django_session VALUES ('2kayv516l83n2l0wd0j19onmdrc6sd6v', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-25 23:40:34.747076+00');
INSERT INTO django_session VALUES ('gvj74hilo3vv2nufxfr47mwci69o9iyz', 'ZDlkMjZiNTliOTVmZTY0MWUxNzljMzQ0ZDBkYTZkZDMxOGQ0MjFmNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu', '2014-03-26 00:02:40.661385+00');
INSERT INTO django_session VALUES ('qiskcck4kq2y73lt47i22meom6s530rn', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-26 00:04:10.943368+00');
INSERT INTO django_session VALUES ('0ti7s4fidhbhnyebmto8vzmonh569inc', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-27 15:15:40.282097+00');
INSERT INTO django_session VALUES ('ls0s77lclnahtz50l0hx820ct8fd71oa', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-27 15:31:15.299793+00');
INSERT INTO django_session VALUES ('nhjcktk8esghzjj3oiyudw9rvksi8bpg', 'MGZmMTRmYTNjZjNiOWZhYTA3ZjhiN2MxZGYxZTViYjhjNzZjNjQxYjqAAn1xAS4=', '2014-03-27 21:04:38.363903+00');
INSERT INTO django_session VALUES ('fzvm0fw6ld6hvp2yoskqlws9d7nra70a', 'ZDlkMjZiNTliOTVmZTY0MWUxNzljMzQ0ZDBkYTZkZDMxOGQ0MjFmNzqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu', '2014-03-27 23:55:00.180803+00');
INSERT INTO django_session VALUES ('toi33lvjpu6o5pblby6prnqv5g3km28d', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-28 22:19:36.902077+00');
INSERT INTO django_session VALUES ('ihkxppuy6jox2zk2owwjxwlq6hqazds2', 'ZmNlODJkOTEyYTQ5OTQzZmVmNGI1Y2JiOThkMjcyN2Y1M2ZiMTVmZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu', '2014-03-28 22:19:57.472608+00');


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO django_site VALUES (1, '127.0.0.1:8000', 'Gaia');


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO reversion_revision VALUES (1, '2014-03-11 15:52:55.136845+00', 1, 'Modificado/a telefono y fijo.', 'default');
INSERT INTO reversion_revision VALUES (2, '2014-03-12 00:04:34.694326+00', 1, 'Modificado/a direccion.', 'default');
INSERT INTO reversion_revision VALUES (3, '2014-03-12 15:17:20.412911+00', 1, 'Modificado/a coordenadas.', 'default');
INSERT INTO reversion_revision VALUES (4, '2014-03-13 15:32:52.643909+00', 1, 'No ha cambiado ningún campo.', 'default');
INSERT INTO reversion_revision VALUES (5, '2014-03-13 16:09:23.36616+00', 1, 'Modificado/a email_form.', 'default');
INSERT INTO reversion_revision VALUES (6, '2014-03-14 22:20:02.748629+00', 1, 'Modificado/a facebook.', 'default');
INSERT INTO reversion_revision VALUES (7, '2014-03-14 22:20:55.382187+00', 1, 'Modificado/a facebook y twitter.', 'default');


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 7, true);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO reversion_version VALUES (1, 1, '1', 13, 'json', '[{"pk": 1, "model": "web.infosite", "fields": {"site": "http://127.0.0.1:8000", "modified_by": 0, "description": "", "created": "2014-03-03T13:58:18.292", "twitter": "http://twitter.com/Studio92", "email_form": "chevarrias@gmail.com", "modified": "2014-03-11T10:52:55.119", "created_by": 0, "direccion": "Centro Comercial Camino Real B 66-A Av. Camino Real 456, San Isidro ", "facebook": "http://facebook.com/masterstrong.tk", "coordenadas": "-12.100907,-77.02063", "ga": "", "active": true, "titulo": "Gaia", "fijo": "673-4234", "telefono": "959 593 209", "email": "gaia@gaiamedicinaalternativa.com"}}]', 'Información del Sitio', 1, 1);
INSERT INTO reversion_version VALUES (2, 2, '1', 13, 'json', '[{"pk": 1, "model": "web.infosite", "fields": {"site": "http://127.0.0.1:8000", "modified_by": 0, "description": "", "created": "2014-03-03T13:58:18.292", "twitter": "http://twitter.com/Studio92", "email_form": "chevarrias@gmail.com", "modified": "2014-03-11T19:04:34.523", "created_by": 0, "direccion": "Calle Los Gavilanes Mz: C Lt. 30 Urb. El Club Santa Mar\u00eda - Huachipa, Lima", "facebook": "http://facebook.com/masterstrong.tk", "coordenadas": "-12.100907,-77.02063", "ga": "", "active": true, "titulo": "Gaia", "fijo": "673-4234", "telefono": "959 593 209", "email": "gaia@gaiamedicinaalternativa.com"}}]', 'Información del Sitio', 1, 1);
INSERT INTO reversion_version VALUES (3, 3, '1', 13, 'json', '[{"pk": 1, "model": "web.infosite", "fields": {"site": "http://127.0.0.1:8000", "modified_by": 0, "description": "", "created": "2014-03-03T13:58:18.292", "twitter": "http://twitter.com/Studio92", "email_form": "chevarrias@gmail.com", "modified": "2014-03-12T10:17:20.217", "created_by": 0, "direccion": "Calle Los Gavilanes Mz: C Lt. 30 Urb. El Club Santa Mar\u00eda - Huachipa, Lima", "facebook": "http://facebook.com/masterstrong.tk", "coordenadas": "-12.011611, -76.935015", "ga": "", "active": true, "titulo": "Gaia", "fijo": "673-4234", "telefono": "959 593 209", "email": "gaia@gaiamedicinaalternativa.com"}}]', 'Información del Sitio', 1, 1);
INSERT INTO reversion_version VALUES (4, 4, '1', 13, 'json', '[{"pk": 1, "model": "web.infosite", "fields": {"site": "http://127.0.0.1:8000", "modified_by": 0, "description": "", "created": "2014-03-03T13:58:18.292", "twitter": "http://twitter.com/Studio92", "email_form": "chevarrias@gmail.com", "modified": "2014-03-13T10:32:52.502", "created_by": 0, "direccion": "Calle Los Gavilanes Mz: C Lt. 30 Urb. El Club Santa Mar\u00eda - Huachipa, Lima", "facebook": "http://facebook.com/masterstrong.tk", "coordenadas": "-12.011611, -76.935015", "ga": "", "active": true, "titulo": "Gaia", "fijo": "673-4234", "telefono": "959 593 209", "email": "gaia@gaiamedicinaalternativa.com"}}]', 'Información del Sitio', 1, 1);
INSERT INTO reversion_version VALUES (5, 5, '1', 13, 'json', '[{"pk": 1, "model": "web.infosite", "fields": {"site": "http://127.0.0.1:8000", "modified_by": 0, "description": "", "created": "2014-03-03T13:58:18.292", "twitter": "http://twitter.com/Studio92", "email_form": "gaia@gaiamedicinaalternativa.com", "modified": "2014-03-13T11:09:23.253", "created_by": 0, "direccion": "Calle Los Gavilanes Mz: C Lt. 30 Urb. El Club Santa Mar\u00eda - Huachipa, Lima", "facebook": "http://facebook.com/masterstrong.tk", "coordenadas": "-12.011611, -76.935015", "ga": "", "active": true, "titulo": "Gaia", "fijo": "673-4234", "telefono": "959 593 209", "email": "gaia@gaiamedicinaalternativa.com"}}]', 'Información del Sitio', 1, 1);
INSERT INTO reversion_version VALUES (6, 6, '1', 13, 'json', '[{"pk": 1, "model": "web.infosite", "fields": {"site": "http://127.0.0.1:8000", "modified_by": 0, "description": "", "created": "2014-03-03T13:58:18.292", "twitter": "http://twitter.com/Studio92", "email_form": "gaia@gaiamedicinaalternativa.com", "modified": "2014-03-14T17:20:02.263", "created_by": 0, "direccion": "Calle Los Gavilanes Mz: C Lt. 30 Urb. El Club Santa Mar\u00eda - Huachipa, Lima", "facebook": "http://facebook.com/", "coordenadas": "-12.011611, -76.935015", "ga": "", "active": true, "titulo": "Gaia", "fijo": "673-4234", "telefono": "959 593 209", "email": "gaia@gaiamedicinaalternativa.com"}}]', 'Información del Sitio', 1, 1);
INSERT INTO reversion_version VALUES (7, 7, '1', 13, 'json', '[{"pk": 1, "model": "web.infosite", "fields": {"site": "http://127.0.0.1:8000", "modified_by": 0, "description": "", "created": "2014-03-03T13:58:18.292", "twitter": "", "email_form": "gaia@gaiamedicinaalternativa.com", "modified": "2014-03-14T17:20:55.378", "created_by": 0, "direccion": "Calle Los Gavilanes Mz: C Lt. 30 Urb. El Club Santa Mar\u00eda - Huachipa, Lima", "facebook": "https://www.facebook.com/pages/Gaia-Medicina-Alternativa/480889678661526?fref=ts", "coordenadas": "-12.011611, -76.935015", "ga": "", "active": true, "titulo": "Gaia", "fijo": "673-4234", "telefono": "959 593 209", "email": "gaia@gaiamedicinaalternativa.com"}}]', 'Información del Sitio', 1, 1);


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('reversion_version_id_seq', 7, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO south_migrationhistory VALUES (1, 'admin_honeypot', '0001_initial', '2014-03-08 00:03:31.840991+00');
INSERT INTO south_migrationhistory VALUES (2, 'admin_honeypot', '0002_add_field_LoginAttempt_path', '2014-03-08 00:03:31.851534+00');
INSERT INTO south_migrationhistory VALUES (3, 'reversion', '0001_initial', '2014-03-08 00:03:32.285022+00');
INSERT INTO south_migrationhistory VALUES (4, 'reversion', '0002_auto__add_field_version_type', '2014-03-08 00:03:32.412047+00');
INSERT INTO south_migrationhistory VALUES (5, 'reversion', '0003_auto__add_field_version_object_id_int', '2014-03-08 00:03:32.499543+00');
INSERT INTO south_migrationhistory VALUES (6, 'reversion', '0004_populate_object_id_int', '2014-03-08 00:03:32.541497+00');
INSERT INTO south_migrationhistory VALUES (7, 'reversion', '0005_auto__add_field_revision_manager_slug', '2014-03-08 00:03:32.817301+00');
INSERT INTO south_migrationhistory VALUES (8, 'core', '0001_initial', '2014-03-08 00:03:32.976442+00');
INSERT INTO south_migrationhistory VALUES (9, 'web', '0001_initial', '2014-03-08 00:03:34.877812+00');
INSERT INTO south_migrationhistory VALUES (10, 'web', '0002_auto__chg_field_enlaces_titulo', '2014-03-13 14:33:35.939669+00');


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 10, true);


--
-- Data for Name: web_bloque; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_bloque VALUES (7, '-', 'STONE MASSAGE', 'Stone-1 Massage', 'Terapia oriental milenaria que equilibra cuerpo y mente, piedras calientes que liberan energía y aportan serenidad, combinadas con un exquisito masaje. Regálese una experiencia única.', '959 593 209', 'uploads/bloques/servicio/img-2_1.png', 'uploads/bloques/descripcion/fancy-servicios.jpg', 2);
INSERT INTO web_bloque VALUES (6, '-', 'STONE MASSAGE', 'Stone-1 Massage', 'Terapia oriental milenaria que equilibra cuerpo y mente, piedras calientes que liberan energía y aportan serenidad, combinadas con un exquisito masaje. Regálese una experiencia única.', '959 593 209', 'uploads/bloques/servicio/img-1_1.png', 'uploads/bloques/descripcion/fancy-servicios.jpg', 1);
INSERT INTO web_bloque VALUES (8, '-', 'STONE MASSAGE', 'Stone-1 Massage', 'Terapia oriental milenaria que equilibra cuerpo y mente, piedras calientes que liberan energía y aportan serenidad, combinadas con un exquisito masaje. Regálese una experiencia única.', '959 593 209', 'uploads/bloques/servicio/img-3_1.png', 'uploads/bloques/descripcion/fancy-servicios.jpg', 3);


--
-- Name: web_bloque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_bloque_id_seq', 8, true);


--
-- Data for Name: web_categoria; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: web_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_categoria_id_seq', 1, false);


--
-- Data for Name: web_contacto; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_contacto VALUES (14, '2014-03-13 17:51:56.919631+00', 'ayayyay', 'yayayayay', 'ayayayayy@sd.es', 'ewewewewewewewewew');
INSERT INTO web_contacto VALUES (15, '2014-03-13 17:53:00.03493+00', 'ayayyay', 'yayayayay', 'ayayayayy@sd.es', 'ewewewewewewewewew');
INSERT INTO web_contacto VALUES (16, '2014-03-13 18:02:56.123199+00', 'Rawr sdasasa', '5823695847', 'yata@yata.es', 'omnomnomnomom');
INSERT INTO web_contacto VALUES (17, '2014-03-13 18:16:39.670542+00', 'asasasa', 'asasa', 'test@test.com', 'asasasa asasasa ');
INSERT INTO web_contacto VALUES (18, '2014-03-14 14:55:05.599958+00', 'Yelson', '1596235784', 'sdk@sdk.es', 'eseseseseseseseseses');


--
-- Name: web_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_contacto_id_seq', 18, true);


--
-- Data for Name: web_contactohome; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_contactohome VALUES (14, '2014-03-13 16:41:40.089752+00', 'Yelson', '6631533', 'yata@yata.es');
INSERT INTO web_contactohome VALUES (15, '2014-03-13 18:11:17.476275+00', 'Yelson', '95784317', 'yata@yata.ya');
INSERT INTO web_contactohome VALUES (16, '2014-03-13 18:16:15.600575+00', 'asas', 'asas', 'test@test.com');
INSERT INTO web_contactohome VALUES (17, '2014-03-14 23:01:18.715728+00', 'luiggi', '999008292', 'luiggi@staffcreativa.com');


--
-- Name: web_contactohome_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_contactohome_id_seq', 17, true);


--
-- Data for Name: web_enlaces; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_enlaces VALUES (3, true, '2014-03-04 17:20:36.154+00', '2014-03-11 15:25:07.456889+00', 0, 0, 'BIOMAGNETISMO', 'http://google.com/', 2);
INSERT INTO web_enlaces VALUES (4, true, '2014-03-04 17:21:32.26+00', '2014-03-11 15:26:57.096333+00', 0, 0, 'REIKI', 'http://gaia.planifica.pe/servicios/', 3);
INSERT INTO web_enlaces VALUES (2, true, '2014-03-03 05:00:00+00', '2014-03-14 22:21:51.045974+00', 0, 0, 'BAÑOS DE HIPERTERMIA', 'http://gaia.planifica.pe/servicios/', 1);


--
-- Name: web_enlaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_enlaces_id_seq', 4, true);


--
-- Data for Name: web_infosite; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_infosite VALUES (1, true, '2014-03-03 18:58:18.292+00', '2014-03-14 22:20:55.37803+00', 0, 0, 'gaia@gaiamedicinaalternativa.com', 'gaia@gaiamedicinaalternativa.com', '673-4234', '959 593 209', 'Calle Los Gavilanes Mz: C Lt. 30 Urb. El Club Santa María - Huachipa, Lima', 'http://127.0.0.1:8000', 'https://www.facebook.com/pages/Gaia-Medicina-Alternativa/480889678661526?fref=ts', '', 'Gaia', '', '', '-12.011611, -76.935015');


--
-- Name: web_infosite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_infosite_id_seq', 1, true);


--
-- Data for Name: web_nosotros; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_nosotros VALUES (6, 'Visión y Misión', 'vision-y-mision', '<h1>Misi&oacute;n()</h1>
<p>Gaia nace con una visi&oacute;n y objetivos diferentes para el mundo presenta toda una gama de tratamientos relacionados con la salud. Que hace del terapeuta y el paciente el centro de acci&oacute;n para lograr el proceso de sanaci&oacute;n requerido. Estos tienen como objetivo ayudar a armonizar y sanar los aspectos del cuerpo f&iacute;sico, ps&iacute;quico, emocional, social y espiritual.Estos tienen como objetivo ayudar a armonizar y sanar los aspectos del cuerpo f&iacute;sico, ps&iacute;quico, emocional, social y espiritual.Estos tienen como objetivo ayudar a armonizar y sanar los aspectos del cuerpo f&iacute;sico, ps&iacute;quico, emocional, social y espiritual.</p>
<h1>Visi&oacute;n</h1>
<p>Servimos con la mirada, con el tacto, con el abrazo, con la prescencia, escuchar y hablar menos, escuchar con el alma, estar atentos.</p>', 3);
INSERT INTO web_nosotros VALUES (4, 'Inicio', 'inicio', '<h1>&ldquo;Gaia es un centro de Salud, bienestar y armonia para toda la familia.&rdquo;&nbsp;</h1>
<p>En Gaia pueden escoger los servicios que m&aacute;s le convengan para sentirse bien, tener el cuerpo equilibrado, el rostro con una piel bella, sin stress.....sin dolores.</p>
<p>Todo ello en un mismo espacio y en un entorno de paz . Para tal fin hemos creado y desarrollado todo un concepto hol&iacute;stico en t&eacute;cnicas y procedimientos sin riesgos, sin cirug&iacute;as, donde se combinan las terapias bioenerg&eacute;ticas , biomagneticas, la fisioterapia y el toque terap&eacute;utico de sanidad.</p>
<p>Es decir, trabajamos para lograr la sanidad del cuerpo y del alma, con personal especializado para tal fin.</p>
<p>Cada ser humano es diferente y la respuesta de su cuerpo es distinta, pero juntos y con nuestro personal y nuestras t&eacute;cnicas, nos comprometemos a lograr el fin que se desea.</p>
<p>Entra y comparte lo que Gaia puede ofrecerte con inumerables resultados positivos y muy notables a corto plazo.</p>', 1);
INSERT INTO web_nosotros VALUES (5, 'Quienes Somos', 'quienes-somos', '<p>Gaia es un centro especializado en servicios de salud integral, que nace en el a&ntilde;o 2012 en Lima, con una visi&oacute;n y objetivos diferentes para el mundo presenta toda una gama de tratamientos relacionados con la salud. Que hace del terapeuta y el paciente el centro de acci&oacute;n para lograr el proceso de sanaci&oacute;n requerido. Estos tienen como objetivo ayudar a armonizar y sanarlos aspectos del cuerpo f&iacute;sico, ps&iacute;quico, emocional, social y espiritual.</p>
<h1>UN ENFOQUE HOLISTICO</h1>
<p>El termino hol&iacute;stico abarca toda la mente, el cuerpo y el esp&iacute;ritu. Cualquier problema de salud, donde se presentan s&iacute;ntomas b&aacute;sicamente f&iacute;sicos o mentales, afecta la globalidad de la persona. En cualquier enfermedad, tambi&eacute;n deben tenerse en cuenta los factores sociales, puesto en el stress emocional y tencion mental pueden influir en el estado de salud. Del mismo modo una enfermedad o una lesi&oacute;n f&iacute;sica pueden ocacionar s&iacute;ntomas psicol&oacute;gicos como la depresi&oacute;n. El Biomagnetismo, la Reflexologia y el Reiki lo que hacen es equilibrar y mejorar el funcionamiento del cuerpo en su conjunto.</p>
<h1>NUESTRA VOCACI&Oacute;N DE SERVICIpopop</h1>
<p>Hemos desarrollado un concepto hol&iacute;stico en t&eacute;cnicas y procedimientos de terapias bioenerg&eacute;ticas y biomagneticas donde se combina la fisioterapia con un toque terap&eacute;utico; tens, inflarrojo, ultrasonido y compresas entre otros y todo esto sin ser invasivo a nuestro organismo logrando efectos muy notables en la recuperaci&oacute;n de la salud. Nosotros brindamos en nuestro centro amor en el servicio, en los tratamientos que se utilizan y con personal altamente capacitado con el deseo de servir con amor y que nuestros pacientes logren el resultado en su ser , con eficacia , responsabilidad y amor en lo que se hace.</p>', 2);


--
-- Name: web_nosotros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_nosotros_id_seq', 6, true);


--
-- Data for Name: web_noticia; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: web_noticia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_noticia_id_seq', 1, false);


--
-- Data for Name: web_producto; Type: TABLE DATA; Schema: public; Owner: staff
--



--
-- Name: web_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_producto_id_seq', 1, false);


--
-- Data for Name: web_promo; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_promo VALUES (3, true, '2014-03-05 05:00:00+00', '2014-03-10 20:48:25.84758+00', 0, 0, 'PROMO 3', 'uploads/Promociones/listado/promociones-2_1.png', 'uploads/Promociones/detalle/facial.png', 2);
INSERT INTO web_promo VALUES (4, true, '2014-03-05 05:00:00+00', '2014-03-10 20:49:55.040125+00', 0, 0, 'PROMO 3', 'uploads/Promociones/listado/promociones-3_1.png', 'uploads/Promociones/detalle/promo_reflexologia.png', 3);
INSERT INTO web_promo VALUES (5, true, '2014-03-05 05:00:00+00', '2014-03-10 20:50:51.687976+00', 0, 0, 'PROMO 3', 'uploads/Promociones/listado/promociones-4_1.png', 'uploads/Promociones/detalle/hipertermia.png', 4);
INSERT INTO web_promo VALUES (6, true, '2014-03-05 05:00:00+00', '2014-03-10 20:52:11.176225+00', 0, 0, 'PROMO 3', 'uploads/Promociones/listado/promociones-5_1.png', 'uploads/Promociones/detalle/masaje_integral.png', 5);
INSERT INTO web_promo VALUES (7, true, '2014-03-05 05:00:00+00', '2014-03-10 20:55:01.203052+00', 0, 0, 'Omnomnom', 'uploads/Promociones/listado/promociones-6_1.png', 'uploads/Promociones/detalle/thai.png', 6);
INSERT INTO web_promo VALUES (2, true, '2014-03-05 05:00:00+00', '2014-03-13 15:16:05.69941+00', 0, 0, 'PROMO 3', 'uploads/Promociones/listado/promociones-1_1.png', 'uploads/Promociones/detalle/biomagnetismo.png', 1);


--
-- Name: web_promo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_promo_id_seq', 7, true);


--
-- Data for Name: web_servicio; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_servicio VALUES (4, true, '2014-03-05 05:00:00+00', '2014-03-11 17:14:28.248331+00', 0, 0, 'Stone Massage', 'Stone Massage', '<p>Terapia oriental milenaria que equilibra cuerpo y mente, piedras calientes que liberan energ&iacute;a y aportan serenidad, combinadas con un exquisito masaje.</p>
<p>es muy beneficioso para personas que necesitan curar algunas dolencias, ya que su deslizamiento sobre el cuerpo provee un alivio instant&aacute;neo y a su vez ofrece relajaci&oacute;n total.</p>
<p>Adem&aacute;s de estas ventajas, manifiesta, que ayuda a combatir la fatiga mental y f&iacute;sica, disminuir las contracciones e inflamaciones musculares, drenar el &aacute;cido l&aacute;ctico y carb&oacute;nico y activar la circulaci&oacute;n sangu&iacute;nea.</p>', '  ', 'uploads/servicios/listado/servicios-4.png', 'uploads/servicios/detalle/fancy-servicios.jpg', 4);
INSERT INTO web_servicio VALUES (1, true, '2014-03-05 05:00:00+00', '2014-03-11 16:52:20.818164+00', 0, 0, 'Baños de Hipertermia', 'Baños de Hipertermia', '<p>El ba&ntilde;o de Hipertermia es un m&eacute;todo en donde se induce a la &ldquo;fiebre artificial&rdquo;, mediante el est&iacute;mulo de agua y sus propiedades mec&aacute;nicas.</p>
<p>Sirve para tratamientos y prevenci&oacute;nes de diversas enfermedades tanto infecciosas como inflamatorias; y por sus excelentes cualidades se utiliza tambi&eacute;n para procesos de rehabilitaci&oacute;n de la persona enferma.</p>
<p>La fiebre es un mecanismo de defensa natural, mediante el cual muchos microorganismos mueren o pierden su actividad pat&oacute;gena. El cuerpo crea fiebre, para luchar contra las infecciones, pero a la vez propicia el fortalecimiento de las defensas del organismo.</p>', '  ', 'uploads/servicios/listado/servicios-10.png', 'uploads/servicios/detalle/fancy-servicios_1.jpg', 1);
INSERT INTO web_servicio VALUES (2, true, '2014-03-05 05:00:00+00', '2014-03-11 16:52:26.149618+00', 0, 0, 'Geoterapia', 'Geoterapia', '<p>La geoterapia es la aplicaci&oacute;n higi&eacute;nica o terap&eacute;utica de la tierra, para restaurar, mantener o mejorar la salud. Cura las fracturas ya que aumenta la elasticidad y resistencia del tejido &oacute;seo.</p>
<p>Participa en la formaci&oacute;n de los huesos, del tejido conectivo, formaci&oacute;n de nuevas c&eacute;lulas y nutrici&oacute;n de los tejidos. Es esencial para el crecimiento, siendo tambi&eacute;n muy necesario para mantener la elasticidad de los grandes vasos sangu&iacute;neos.</p>
<p>Equilibra el sistema nervioso, actuando contra la aton&iacute;a cerebral y la deficiencia intelectual (junto con el magnesio y el aluminio). Rehidrata la piel y las mucosas, favoreciendo su cicatrizaci&oacute;n.</p>', '            ', 'uploads/servicios/listado/servicios-2_1.png', 'uploads/servicios/detalle/fancy-servicios-1.jpg', 2);
INSERT INTO web_servicio VALUES (6, true, '2014-03-05 05:00:00+00', '2014-03-11 17:16:58.663968+00', 0, 0, 'Reiki', 'Reiki', '<p>El Reiki es un sistema de sanaci&oacute;n, autosanaci&oacute;n y reequilibrio bioenerg&eacute;tico mediante la transmisi&oacute;n de la energ&iacute;a Universal curativa a trav&eacute;s de la imposici&oacute;n de manos.</p>
<p>En Reiki se trabaja directamente con el campo energ&eacute;tico del paciente, incidiendo directamente sobre los bloqueos que perturban la libre circulaci&oacute;n de la energ&iacute;a en su ser, restaura y armoniza sus sistemas, posibilit&aacute;ndolo y mostr&aacute;ndole de forma sencilla, f&aacute;cil el camino hacia la salud. Reiki consiste en una din&aacute;mica en un proceso de circulaci&oacute;n de energ&iacute;a ben&eacute;fica que por s&iacute; sola determina la sanaci&oacute;n, sin que intervenga la voluntad del reikista, quien act&uacute;a como conductor o canal.</p>', ' ', 'uploads/servicios/listado/servicios-6.png', 'uploads/servicios/detalle/fancy-servicios.jpg', 6);
INSERT INTO web_servicio VALUES (8, true, '2014-03-06 15:47:17.798+00', '2014-03-11 17:18:58.121347+00', 0, 0, 'Reflexología', 'Reflexología', '<p>El masaje tailand&eacute;s se basa en las pr&aacute;cticas de terapia f&iacute;sica de la India. La presi&oacute;n y los movimientos con golpes suaves mueven la sangre, ayudando a la circulaci&oacute;n normal, y ajustan los m&uacute;sculos llenos de nudos para un mejor movimiento.</p>
<p>El masaje tailand&eacute;s es un trabajo corporal profundo que ayuda a restablecer nuestra energ&iacute;a vital y a reequilibrar nuestros aspectos f&iacute;sicos, mentales y emocionales. Las t&eacute;cnicas utilizadas son presiones y estiramientos.</p>
<p>Las presiones se realizan con los dedos, las manos, los pies, los codos o las rodillas y siguen las l&iacute;neas energ&eacute;ticas del cuerpo. Los estiramientos pasivos nos permiten recuperar flexibilidad y alcanzar una relajaci&oacute;n muy profunda.</p>', ' ', 'uploads/servicios/listado/servicios-8.png', 'uploads/servicios/detalle/fancy-servicios.jpg', 8);
INSERT INTO web_servicio VALUES (5, true, '2014-03-05 05:00:00+00', '2014-03-11 17:15:44.950018+00', 0, 0, 'Masaje Tailandes', 'Masaje Tailandés', '<p><br />Terapia oriental milenaria que equilibra cuerpo y mente, piedras calientes que liberan energ&iacute;a y aportan serenidad, combinadas con un exquisito masaje.</p>
<p>es muy beneficioso para personas que necesitan curar algunas dolencias, ya que su deslizamiento sobre el cuerpo provee un alivio instant&aacute;neo y a su vez ofrece relajaci&oacute;n total.</p>
<p>Adem&aacute;s de estas ventajas, manifiesta, que ayuda a combatir la fatiga mental y f&iacute;sica, disminuir las contracciones e inflamaciones musculares, drenar el &aacute;cido l&aacute;ctico y carb&oacute;nico y activar la circulaci&oacute;n sangu&iacute;nea.</p>', '  ', 'uploads/servicios/listado/servicios-5.png', 'uploads/servicios/detalle/fancy-servicios.jpg', 5);
INSERT INTO web_servicio VALUES (10, true, '2014-03-11 16:58:44.859438+00', '2014-03-11 16:58:44.859475+00', 0, 0, 'Bodega Naturista', 'Bodega Naturista', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', ' ', 'uploads/servicios/listado/servicios-9.png', 'uploads/servicios/detalle/fancy-servicios-9.jpg', 10);
INSERT INTO web_servicio VALUES (3, true, '2014-03-05 05:00:00+00', '2014-03-11 17:02:59.929106+00', 0, 0, 'Biomagnetismo', 'Biomagnetismo Medico', '<p>&nbsp;El biomagnetismo m&eacute;dico es un sistema terap&eacute;utico en el que se utilizan imanes para combatir par&aacute;sitos, bacterias, hongos, virus y otros g&eacute;rmenes que son la causa de diversas enfermedades.&nbsp;</p>
<p>&nbsp;Los imanes se aplican en diversas zonas del cuerpo, como si se tratara de un rastreo o escaneo. Una vez reconocidos los &oacute;rganos y tejidos que sufren una distorsi&oacute;n, el terapeuta aplica un conjunto de imanes en esos puntos durante 10 a 15 minutos a cada persona.</p>
<p>&nbsp;El biomagnetismo m&eacute;dico corrige la alteraci&oacute;n i&oacute;nica y recupera el equilibrio perdido del cuerpo.</p>', '  ', 'uploads/servicios/listado/servicios-3.png', 'uploads/servicios/detalle/fancy-servicios.jpg', 3);
INSERT INTO web_servicio VALUES (9, true, '2014-03-06 15:47:57.998+00', '2014-03-11 17:19:53.29604+00', 0, 0, 'Restaurante Vegetariano', 'Restaurante Vegetariano', '<p>Contamos con un restaurante vegetariano que se preocupa en dar una alimentaci&oacute;n sana y nutritiva sin usar ning&uacute;n tipo de carne animal. Nuestro principal objetivo es brindar una excelente alimentaci&oacute;n con ingredientes naturales y frescos.</p>
<p>Nuestra especialidad se logra por poner en cada plato, ese sabor casero y peruano agradable para todo buen paladar, acompa&ntilde;ado siempre de vegetales frescos y nutritivos que ayudan a llevar una alimentaci&oacute;n saludable. Somos expertos que ofrecen los mejores men&uacute;s con total exclusividad y exquisitez.</p>', ' ', 'uploads/servicios/listado/servicios-9.png', 'uploads/servicios/detalle/fancy-servicios.jpg', 9);
INSERT INTO web_servicio VALUES (7, true, '2014-03-05 05:00:00+00', '2014-03-14 22:25:20.698058+00', 0, 0, 'Homaterapia', 'Homaterapia', '<p>Es una Ciencia de la Sanaci&oacute;n proveniente de la Medicina Ancestral Ayurv&eacute;dica. Est&aacute; basada en la ejecuci&oacute;n de fuegos bioenerg&eacute;ticos. El equilibrio bioenerg&eacute;tico es SALUD.</p>
<p>La Terapia Homa es una Ciencia Bioenerg&eacute;tica que al igual que la f&iacute;sica y las matem&aacute;ticas no est&aacute;n basadas en creencia, sus beneficios son:</p>
<p>- Elimina el stress y la tensi&oacute;n de la mente y limpia un &aacute;rea de patrones de pensamientos negativos que dominan la mente.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', ' ', 'uploads/servicios/listado/servicios-7.png', 'uploads/servicios/detalle/fancy-servicios.jpg', 7);


--
-- Name: web_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_servicio_id_seq', 10, true);


--
-- Data for Name: web_sligaleria; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_sligaleria VALUES (5, true, '2014-03-10 20:41:01.335566+00', '2014-03-10 20:41:01.335605+00', 0, 0, 'uploads/infraestructura/image10.jpg', 1);
INSERT INTO web_sligaleria VALUES (6, true, '2014-03-10 20:41:14.934637+00', '2014-03-10 20:41:14.934671+00', 0, 0, 'uploads/infraestructura/image8.jpg', 2);
INSERT INTO web_sligaleria VALUES (7, true, '2014-03-10 20:41:27.733771+00', '2014-03-10 20:41:27.733805+00', 0, 0, 'uploads/infraestructura/image9.jpg', 3);
INSERT INTO web_sligaleria VALUES (8, true, '2014-03-10 20:41:40.635714+00', '2014-03-10 20:41:40.635748+00', 0, 0, 'uploads/infraestructura/image6.jpg', 4);
INSERT INTO web_sligaleria VALUES (9, true, '2014-03-10 20:41:54.451242+00', '2014-03-10 20:41:54.451283+00', 0, 0, 'uploads/infraestructura/image7.jpg', 5);
INSERT INTO web_sligaleria VALUES (10, true, '2014-03-10 20:42:17.867284+00', '2014-03-10 20:42:17.867317+00', 0, 0, 'uploads/infraestructura/image4.jpg', 6);
INSERT INTO web_sligaleria VALUES (11, true, '2014-03-10 20:42:28.994533+00', '2014-03-10 20:42:28.994585+00', 0, 0, 'uploads/infraestructura/image3.jpg', 7);
INSERT INTO web_sligaleria VALUES (12, true, '2014-03-10 20:42:45.822275+00', '2014-03-10 20:42:45.822313+00', 0, 0, 'uploads/infraestructura/image1.jpg', 8);


--
-- Name: web_sligaleria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_sligaleria_id_seq', 12, true);


--
-- Data for Name: web_slyder; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_slyder VALUES (5, true, '2014-03-07 16:15:34.754+00', '2014-03-07 16:15:34.754+00', 0, 0, 'uploads/slyders/slider-servicios-1.jpg', '3', 1);
INSERT INTO web_slyder VALUES (6, true, '2014-03-07 16:52:13.144+00', '2014-03-10 22:54:13.698101+00', 0, 0, 'uploads/slyders/slider-promociones_1.jpg', '4', 1);
INSERT INTO web_slyder VALUES (7, true, '2014-03-07 16:52:53.903+00', '2014-03-10 23:18:33.317637+00', 0, 0, 'uploads/slyders/slider-nosotros-1.jpg', '2', 1);
INSERT INTO web_slyder VALUES (4, true, '2014-03-07 16:14:50.278+00', '2014-03-11 14:40:32.16727+00', 0, 0, 'uploads/slyders/img-home-02.jpg', '1', 2);
INSERT INTO web_slyder VALUES (8, true, '2014-03-07 16:57:11.685+00', '2014-03-11 14:40:41.177095+00', 0, 0, 'uploads/slyders/img-home-01.jpg', '1', 1);
INSERT INTO web_slyder VALUES (10, true, '2014-03-10 20:36:59.712967+00', '2014-03-11 14:40:47.520488+00', 0, 0, 'uploads/slyders/img-home-03.jpg', '1', 3);
INSERT INTO web_slyder VALUES (11, true, '2014-03-11 15:38:12.989818+00', '2014-03-11 15:38:12.989851+00', 0, 0, 'uploads/slyders/slider-nosotros-2.jpg', '2', 2);
INSERT INTO web_slyder VALUES (12, true, '2014-03-11 15:39:00.513246+00', '2014-03-11 15:39:00.513274+00', 0, 0, 'uploads/slyders/slider-nosotros-3.jpg', '2', 3);
INSERT INTO web_slyder VALUES (13, true, '2014-03-11 20:56:12.198165+00', '2014-03-11 20:56:12.198198+00', 0, 0, 'uploads/slyders/slider-servicios-3_1.jpg', '3', 2);
INSERT INTO web_slyder VALUES (9, true, '2014-03-07 16:57:38.367+00', '2014-03-11 20:57:03.690903+00', 0, 0, 'uploads/slyders/slider-servicios-2_1.jpg', '3', 3);


--
-- Name: web_slyder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_slyder_id_seq', 13, true);


--
-- Data for Name: web_suscripcionpromo; Type: TABLE DATA; Schema: public; Owner: staff
--

INSERT INTO web_suscripcionpromo VALUES (44, '2014-03-13 17:56:26.420107+00', 'sdk@sdk.com');
INSERT INTO web_suscripcionpromo VALUES (45, '2014-03-13 19:13:39.473553+00', 'omnomnom@sdk.es');
INSERT INTO web_suscripcionpromo VALUES (46, '2014-03-13 20:37:05.809077+00', 'rawr@rawr.es');
INSERT INTO web_suscripcionpromo VALUES (47, '2014-03-14 14:54:31.74152+00', 'sdk@sdk.es');


--
-- Name: web_suscripcionpromo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff
--

SELECT pg_catalog.setval('web_suscripcionpromo_id_seq', 47, true);


--
-- Name: admin_honeypot_loginattempt_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY admin_honeypot_loginattempt
    ADD CONSTRAINT admin_honeypot_loginattempt_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cache_table_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY cache_table
    ADD CONSTRAINT cache_table_pkey PRIMARY KEY (cache_key);


--
-- Name: core_shorturl_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY core_shorturl
    ADD CONSTRAINT core_shorturl_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: web_bloque_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_bloque
    ADD CONSTRAINT web_bloque_pkey PRIMARY KEY (id);


--
-- Name: web_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_categoria
    ADD CONSTRAINT web_categoria_pkey PRIMARY KEY (id);


--
-- Name: web_contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_contacto
    ADD CONSTRAINT web_contacto_pkey PRIMARY KEY (id);


--
-- Name: web_contactohome_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_contactohome
    ADD CONSTRAINT web_contactohome_pkey PRIMARY KEY (id);


--
-- Name: web_enlaces_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_enlaces
    ADD CONSTRAINT web_enlaces_pkey PRIMARY KEY (id);


--
-- Name: web_infosite_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_infosite
    ADD CONSTRAINT web_infosite_pkey PRIMARY KEY (id);


--
-- Name: web_nosotros_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_nosotros
    ADD CONSTRAINT web_nosotros_pkey PRIMARY KEY (id);


--
-- Name: web_noticia_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_noticia
    ADD CONSTRAINT web_noticia_pkey PRIMARY KEY (id);


--
-- Name: web_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_producto
    ADD CONSTRAINT web_producto_pkey PRIMARY KEY (id);


--
-- Name: web_promo_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_promo
    ADD CONSTRAINT web_promo_pkey PRIMARY KEY (id);


--
-- Name: web_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_servicio
    ADD CONSTRAINT web_servicio_pkey PRIMARY KEY (id);


--
-- Name: web_sligaleria_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_sligaleria
    ADD CONSTRAINT web_sligaleria_pkey PRIMARY KEY (id);


--
-- Name: web_slyder_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_slyder
    ADD CONSTRAINT web_slyder_pkey PRIMARY KEY (id);


--
-- Name: web_suscripcionpromo_pkey; Type: CONSTRAINT; Schema: public; Owner: staff; Tablespace: 
--

ALTER TABLE ONLY web_suscripcionpromo
    ADD CONSTRAINT web_suscripcionpromo_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cache_table_expires; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX cache_table_expires ON cache_table USING btree (expires);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: reversion_revision_manager_slug; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_manager_slug_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_revision_user_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX reversion_revision_user_id ON reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX reversion_version_content_type_id ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_object_id_int; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX reversion_version_object_id_int ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_revision_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX reversion_version_revision_id ON reversion_version USING btree (revision_id);


--
-- Name: reversion_version_type; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX reversion_version_type ON reversion_version USING btree (type);


--
-- Name: web_categoria_level; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_categoria_level ON web_categoria USING btree (level);


--
-- Name: web_categoria_lft; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_categoria_lft ON web_categoria USING btree (lft);


--
-- Name: web_categoria_parent_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_categoria_parent_id ON web_categoria USING btree (parent_id);


--
-- Name: web_categoria_rght; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_categoria_rght ON web_categoria USING btree (rght);


--
-- Name: web_categoria_slug; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_categoria_slug ON web_categoria USING btree (slug);


--
-- Name: web_categoria_slug_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_categoria_slug_like ON web_categoria USING btree (slug varchar_pattern_ops);


--
-- Name: web_categoria_tree_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_categoria_tree_id ON web_categoria USING btree (tree_id);


--
-- Name: web_nosotros_slug; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_nosotros_slug ON web_nosotros USING btree (slug);


--
-- Name: web_nosotros_slug_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_nosotros_slug_like ON web_nosotros USING btree (slug varchar_pattern_ops);


--
-- Name: web_noticia_slug; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_noticia_slug ON web_noticia USING btree (slug);


--
-- Name: web_noticia_slug_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_noticia_slug_like ON web_noticia USING btree (slug varchar_pattern_ops);


--
-- Name: web_producto_categoria_id; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_producto_categoria_id ON web_producto USING btree (categoria_id);


--
-- Name: web_producto_slug; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_producto_slug ON web_producto USING btree (slug);


--
-- Name: web_producto_slug_like; Type: INDEX; Schema: public; Owner: staff; Tablespace: 
--

CREATE INDEX web_producto_slug_like ON web_producto USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: categoria_id_refs_id_c73a2483; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_producto
    ADD CONSTRAINT categoria_id_refs_id_c73a2483 FOREIGN KEY (categoria_id) REFERENCES web_categoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_f5dce86c; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT content_type_id_refs_id_f5dce86c FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_08398094; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY web_categoria
    ADD CONSTRAINT parent_id_refs_id_08398094 FOREIGN KEY (parent_id) REFERENCES web_categoria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: revision_id_refs_id_a685e913; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT revision_id_refs_id_a685e913 FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_d4f35b51; Type: FK CONSTRAINT; Schema: public; Owner: staff
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT user_id_refs_id_d4f35b51 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

