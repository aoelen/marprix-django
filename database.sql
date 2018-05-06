--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Ubuntu 10.3-1.pgdg14.04+1)
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO evkxunitfmfbxq;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO evkxunitfmfbxq;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO evkxunitfmfbxq;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
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


ALTER TABLE public.auth_user OWNER TO evkxunitfmfbxq;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO evkxunitfmfbxq;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO evkxunitfmfbxq;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
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


ALTER TABLE public.django_admin_log OWNER TO evkxunitfmfbxq;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO evkxunitfmfbxq;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO evkxunitfmfbxq;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_category; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.marketplace_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sort integer
);


ALTER TABLE public.marketplace_category OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_category_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.marketplace_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketplace_category_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.marketplace_category_id_seq OWNED BY public.marketplace_category.id;


--
-- Name: marketplace_history; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.marketplace_history (
    id integer NOT NULL,
    callerid character varying(255) NOT NULL,
    last_product_id integer NOT NULL
);


ALTER TABLE public.marketplace_history OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_history_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.marketplace_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketplace_history_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.marketplace_history_id_seq OWNED BY public.marketplace_history.id;


--
-- Name: marketplace_product; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.marketplace_product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    sort integer,
    last_update timestamp with time zone NOT NULL,
    category_id integer NOT NULL,
    unit_id integer
);


ALTER TABLE public.marketplace_product OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_product_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.marketplace_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketplace_product_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.marketplace_product_id_seq OWNED BY public.marketplace_product.id;


--
-- Name: marketplace_unit; Type: TABLE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE TABLE public.marketplace_unit (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.marketplace_unit OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: evkxunitfmfbxq
--

CREATE SEQUENCE public.marketplace_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketplace_unit_id_seq OWNER TO evkxunitfmfbxq;

--
-- Name: marketplace_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evkxunitfmfbxq
--

ALTER SEQUENCE public.marketplace_unit_id_seq OWNED BY public.marketplace_unit.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: marketplace_category id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_category ALTER COLUMN id SET DEFAULT nextval('public.marketplace_category_id_seq'::regclass);


--
-- Name: marketplace_history id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_history ALTER COLUMN id SET DEFAULT nextval('public.marketplace_history_id_seq'::regclass);


--
-- Name: marketplace_product id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_product ALTER COLUMN id SET DEFAULT nextval('public.marketplace_product_id_seq'::regclass);


--
-- Name: marketplace_unit id; Type: DEFAULT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_unit ALTER COLUMN id SET DEFAULT nextval('public.marketplace_unit_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add category	1	add_category
2	Can change category	1	change_category
3	Can delete category	1	delete_category
4	Can add product	2	add_product
5	Can change product	2	change_product
6	Can delete product	2	delete_product
7	Can add log entry	3	add_logentry
8	Can change log entry	3	change_logentry
9	Can delete log entry	3	delete_logentry
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add group	5	add_group
14	Can change group	5	change_group
15	Can delete group	5	delete_group
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add content type	7	add_contenttype
20	Can change content type	7	change_contenttype
21	Can delete content type	7	delete_contenttype
22	Can add session	8	add_session
23	Can change session	8	change_session
24	Can delete session	8	delete_session
25	Can add unit	9	add_unit
26	Can change unit	9	change_unit
27	Can delete unit	9	delete_unit
28	Can add history	10	add_history
29	Can change history	10	change_history
30	Can delete history	10	delete_history
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$epLExiwXXfG2$jQkhjo67F++Iw9FUCNGQRmM+yltvaPPfiKdmngIxulE=	2018-05-03 07:01:55.401452+00	t	admin			user@site.com	t	t	2018-05-01 20:51:38.116702+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-05-01 20:52:13.382735+00	1	Fruits	1	[{"added": {}}]	1	1
2	2018-05-01 20:52:21.405239+00	2	Other	1	[{"added": {}}]	1	1
3	2018-05-01 20:52:24.820374+00	1	Bananas	1	[{"added": {}}]	2	1
4	2018-05-01 20:56:02.715712+00	3	Vegatables	1	[{"added": {}}]	1	1
5	2018-05-02 09:01:08.736405+00	2	Onions	1	[{"added": {}}]	2	1
6	2018-05-02 09:01:38.217762+00	3	Oranges	1	[{"added": {}}]	2	1
7	2018-05-02 09:01:44.532527+00	4	Pineapple	1	[{"added": {}}]	2	1
8	2018-05-02 09:01:50.442441+00	5	Watermelon	1	[{"added": {}}]	2	1
9	2018-05-02 09:01:56.249+00	6	Pawpaw	1	[{"added": {}}]	2	1
10	2018-05-02 09:02:05.235737+00	7	Tomatoes	1	[{"added": {}}]	2	1
11	2018-05-02 09:02:12.535816+00	8	Okra	1	[{"added": {}}]	2	1
12	2018-05-02 09:02:18.490709+00	9	Peppers	1	[{"added": {}}]	2	1
13	2018-05-02 09:02:27.383061+00	10	Cabbage	1	[{"added": {}}]	2	1
14	2018-05-02 09:02:34.383016+00	11	Rice	1	[{"added": {}}]	2	1
15	2018-05-02 09:02:39.65015+00	12	Mais	1	[{"added": {}}]	2	1
16	2018-05-02 09:02:44.718085+00	13	Millet	1	[{"added": {}}]	2	1
17	2018-05-02 09:02:50.035915+00	14	Sorghum	1	[{"added": {}}]	2	1
18	2018-05-02 09:03:12.631396+00	2	Cereals	2	[{"changed": {"fields": ["name"]}}]	1	1
19	2018-05-02 09:28:16.489158+00	8	Okro	2	[{"changed": {"fields": ["name"]}}]	2	1
20	2018-05-02 10:06:53.362263+00	1	Bag	1	[{"added": {}}]	9	1
21	2018-05-02 10:07:02.490605+00	2	Bunch	1	[{"added": {}}]	9	1
22	2018-05-02 10:07:14.242111+00	3	Piece	1	[{"added": {}}]	9	1
23	2018-05-02 10:07:38.429069+00	4	Crate	1	[{"added": {}}]	9	1
24	2018-05-02 10:07:46.474401+00	5	Bowl	1	[{"added": {}}]	9	1
25	2018-05-02 10:10:33.963468+00	14	Sorghum	2	[{"changed": {"fields": ["unit"]}}]	2	1
26	2018-05-02 10:10:39.597142+00	14	Sorghum	2	[]	2	1
27	2018-05-02 10:11:02.599522+00	13	Millet	2	[{"changed": {"fields": ["unit"]}}]	2	1
28	2018-05-02 10:11:11.64194+00	12	Mais	2	[{"changed": {"fields": ["unit"]}}]	2	1
29	2018-05-02 10:11:19.686124+00	11	Rice	2	[{"changed": {"fields": ["unit"]}}]	2	1
30	2018-05-02 10:11:27.669193+00	10	Cabbage	2	[{"changed": {"fields": ["unit"]}}]	2	1
31	2018-05-02 10:11:32.971346+00	9	Peppers	2	[{"changed": {"fields": ["unit"]}}]	2	1
32	2018-05-02 10:11:51.674324+00	8	Okro	2	[{"changed": {"fields": ["unit"]}}]	2	1
33	2018-05-02 10:12:01.241194+00	7	Tomatoes	2	[{"changed": {"fields": ["unit"]}}]	2	1
34	2018-05-02 10:12:40.041725+00	7	Tomatoes	2	[]	2	1
35	2018-05-02 10:12:49.264566+00	6	Pawpaw	2	[{"changed": {"fields": ["unit"]}}]	2	1
36	2018-05-02 10:12:56.779049+00	5	Watermelon	2	[{"changed": {"fields": ["unit"]}}]	2	1
37	2018-05-02 10:13:07.631882+00	4	Pineapple	2	[{"changed": {"fields": ["unit"]}}]	2	1
38	2018-05-02 10:13:12.7915+00	3	Oranges	2	[{"changed": {"fields": ["unit"]}}]	2	1
39	2018-05-02 10:13:21.10464+00	10	Cabbage	2	[]	2	1
40	2018-05-02 10:13:27.776175+00	1	Bananas	2	[{"changed": {"fields": ["unit"]}}]	2	1
41	2018-05-02 10:13:37.374533+00	2	Onions	2	[{"changed": {"fields": ["unit"]}}]	2	1
42	2018-05-02 10:13:42.045955+00	3	Oranges	2	[]	2	1
43	2018-05-03 07:13:50.856156+00	15	Barley	1	[{"added": {}}]	2	1
44	2018-05-03 08:09:52.088341+00	15	Barley	2	[]	2	1
45	2018-05-03 08:09:53.799711+00	15	Barley	2	[]	2	1
46	2018-05-03 08:09:59.800784+00	14	Sorghum	2	[{"changed": {"fields": ["price"]}}]	2	1
47	2018-05-04 09:18:25.662836+00	3	Vegetables	2	[{"changed": {"fields": ["name"]}}]	1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	marketplace	category
2	marketplace	product
3	admin	logentry
4	auth	permission
5	auth	group
6	auth	user
7	contenttypes	contenttype
8	sessions	session
9	marketplace	unit
10	marketplace	history
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-05-01 18:30:00.662219+00
2	auth	0001_initial	2018-05-01 18:30:00.856632+00
3	admin	0001_initial	2018-05-01 18:30:00.915059+00
4	admin	0002_logentry_remove_auto_add	2018-05-01 18:30:00.951448+00
5	contenttypes	0002_remove_content_type_name	2018-05-01 18:30:00.99797+00
6	auth	0002_alter_permission_name_max_length	2018-05-01 18:30:01.014982+00
7	auth	0003_alter_user_email_max_length	2018-05-01 18:30:01.038253+00
8	auth	0004_alter_user_username_opts	2018-05-01 18:30:01.057394+00
9	auth	0005_alter_user_last_login_null	2018-05-01 18:30:01.080134+00
10	auth	0006_require_contenttypes_0002	2018-05-01 18:30:01.086247+00
11	auth	0007_alter_validators_add_error_messages	2018-05-01 18:30:01.108426+00
12	auth	0008_alter_user_username_max_length	2018-05-01 18:30:01.148396+00
13	auth	0009_alter_user_last_name_max_length	2018-05-01 18:30:01.172945+00
14	marketplace	0001_initial	2018-05-01 18:30:01.204113+00
15	marketplace	0002_auto_20180430_1925	2018-05-01 18:30:01.235479+00
16	sessions	0001_initial	2018-05-01 18:30:01.264386+00
17	marketplace	0003_auto_20180502_0944	2018-05-02 10:06:33.871746+00
18	marketplace	0004_history	2018-05-02 20:28:53.32057+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
b1wz1irtih668lqzsojj7vgkl2almza2	M2M0YjcxN2NiOWUxMTVjZTY2YWFmMjQxMjJiMmNiZmVkOTYzNjE2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjRlNGEzZjNiYjNmNWE1NjAzZGQyZDVlYTk4ZWUwYTcxZjNiNzU3In0=	2018-05-15 20:51:48.62943+00
0m8uftq5mr8lbl7zgbm65ltw7uxo8fo9	M2M0YjcxN2NiOWUxMTVjZTY2YWFmMjQxMjJiMmNiZmVkOTYzNjE2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjRlNGEzZjNiYjNmNWE1NjAzZGQyZDVlYTk4ZWUwYTcxZjNiNzU3In0=	2018-05-16 09:00:36.285366+00
z583mdoc6kem2l7z911yz7kzwog6d9r3	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-16 20:29:36.443192+00
urkh61tjge4i7xl25jaizeihur0gv6m8	NDAzYzlhZDEwNDczYjg0ZjFkNWFiN2I4M2ZkZmU4YmJkOWI3ZDU3OTp7ImNhbGxlcmlkIjoiMDY0NTgxNTAwNCJ9	2018-05-16 20:38:18.509372+00
4i8jbjb7skroeo8lqq7g61gc5m49gjxw	NDAzYzlhZDEwNDczYjg0ZjFkNWFiN2I4M2ZkZmU4YmJkOWI3ZDU3OTp7ImNhbGxlcmlkIjoiMDY0NTgxNTAwNCJ9	2018-05-16 20:39:07.178636+00
648pvtcsz3czz5wjuixrlqw54smi4872	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 07:01:06.286031+00
cgro2xavyyonjlg8dukyrtlq28zc4ni2	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 07:08:18.477267+00
nrpx40pc351t8uhq8oyo782yp7q5y2h2	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 10:44:48.54705+00
ybv83sotncnohjcwqvowcfw7yjf5v41o	YjIzZjVhYjZhNDI3ODdjMWI2NDFlMGJhYjQwNjhhNzNlMTI5YWJhODp7ImNhbGxlcmlkIjoiMDY0ODYzMTE4MyJ9	2018-05-17 11:12:41.799165+00
yf8upo7vqygtq6z4rmiy9tu4mzv5y5h9	YjIzZjVhYjZhNDI3ODdjMWI2NDFlMGJhYjQwNjhhNzNlMTI5YWJhODp7ImNhbGxlcmlkIjoiMDY0ODYzMTE4MyJ9	2018-05-17 11:16:12.415457+00
obu97exik76ygz9z5y7ygcrip9ome5y5	ZjNhN2Y3ZTdkNmUwZTM1ZTJmZDkxNmU3NjlhYTdiM2I1NWViZWY1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjRlNGEzZjNiYjNmNWE1NjAzZGQyZDVlYTk4ZWUwYTcxZjNiNzU3IiwiY2FsbGVyaWQiOiJVbmtub3duIn0=	2018-05-17 16:23:14.895571+00
vv6mpsjx1nfxd029emt8xnxwb19rt3ml	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 16:25:36.333481+00
eufb1g1pii46bngki4a70ov137e1lwih	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 16:29:27.099595+00
sa4e3crtxppchajbjotn4cpncivslqow	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 16:30:31.139765+00
1g3bez4hoevkkqydtqmk2b402ryzajta	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 16:32:49.528401+00
411es4icafe1xj06qwleki02ngtlavsb	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 16:33:25.923738+00
kcllbjr7tm72srrspynb5tf556d1e9w6	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 19:27:36.85687+00
8l371bkn9ffy6opirwpr34sgbjyiggmy	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 19:47:23.699191+00
cwzdjkby49d21bjbyxbkvobow8nrdlbb	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 19:52:01.565408+00
8qz3y8g84uzpih25xsu0u78efava0po3	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 19:52:29.528461+00
sin8d45qhua7vjnd2cu90h1dvhom8lrx	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 19:53:37.396324+00
nl3iai76g9g9kmzumhy3f6ivkbg17jg1	ZGY3YmQ3YzU1N2YyOWZiYzZkMDllYTYxMWQ0OWExOTI5M2YxYjM1Yjp7ImNhbGxlcmlkIjoiYW5vbnltb3VzIn0=	2018-05-17 20:25:00.867145+00
aevxiv7hdvgd5vsg202qhe7fe0g93fdf	ZGY3YmQ3YzU1N2YyOWZiYzZkMDllYTYxMWQ0OWExOTI5M2YxYjM1Yjp7ImNhbGxlcmlkIjoiYW5vbnltb3VzIn0=	2018-05-17 20:26:44.035121+00
8f1n266w463qxg341sm9lkc9k7lksrdk	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 21:24:48.428182+00
nwtq7587pgpy4662eypj1h3q470cd6om	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-17 21:26:55.565607+00
125i0wf0iebujf199xbl1v2u6c5jww20	YjIzZjVhYjZhNDI3ODdjMWI2NDFlMGJhYjQwNjhhNzNlMTI5YWJhODp7ImNhbGxlcmlkIjoiMDY0ODYzMTE4MyJ9	2018-05-18 08:48:33.584874+00
goww7rlrqpeftwqdcne6i0e3gxybuspb	YjIzZjVhYjZhNDI3ODdjMWI2NDFlMGJhYjQwNjhhNzNlMTI5YWJhODp7ImNhbGxlcmlkIjoiMDY0ODYzMTE4MyJ9	2018-05-18 08:50:11.047403+00
z8b1j1ul169jv4dslyjpdhaazfuyhw58	ODlhMGZkMzZhMzU2N2E1MWFmMDM5MDg1MmJhMTA0MDZmNTkxM2MxYzp7ImNhbGxlcmlkIjoiVW5rbm93biJ9	2018-05-18 09:39:35.838952+00
eurkp1sldf63hgt48lmvuldjtn0fu7ya	ODlhMGZkMzZhMzU2N2E1MWFmMDM5MDg1MmJhMTA0MDZmNTkxM2MxYzp7ImNhbGxlcmlkIjoiVW5rbm93biJ9	2018-05-18 09:41:49.085279+00
52y86hlj40hqmi7yvg1x61xh5grrkrlt	ODlhMGZkMzZhMzU2N2E1MWFmMDM5MDg1MmJhMTA0MDZmNTkxM2MxYzp7ImNhbGxlcmlkIjoiVW5rbm93biJ9	2018-05-18 09:43:09.239951+00
22i33gfs3qvz6bvwrlqkbba0a9r650eq	OTVhNGY4NzVmYzc0YTg3OGIzOWY0OTMzMDFlMjFkYmI4ZjlhZDAwNjp7ImNhbGxlcmlkIjoiMDYxMjQ4NjkxMyJ9	2018-05-18 09:59:29.368789+00
jvbmny8l1vbm82c6ts4c0wmy5hts5nc3	ODlhMGZkMzZhMzU2N2E1MWFmMDM5MDg1MmJhMTA0MDZmNTkxM2MxYzp7ImNhbGxlcmlkIjoiVW5rbm93biJ9	2018-05-18 14:54:01.412741+00
a9tyjrloy2w4cah5yna93crl6f8376fi	YjIzZjVhYjZhNDI3ODdjMWI2NDFlMGJhYjQwNjhhNzNlMTI5YWJhODp7ImNhbGxlcmlkIjoiMDY0ODYzMTE4MyJ9	2018-05-20 11:23:36.49085+00
mmg2pal4js172b6hhhvm215lzah7029d	ZjNhN2Y3ZTdkNmUwZTM1ZTJmZDkxNmU3NjlhYTdiM2I1NWViZWY1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NjRlNGEzZjNiYjNmNWE1NjAzZGQyZDVlYTk4ZWUwYTcxZjNiNzU3IiwiY2FsbGVyaWQiOiJVbmtub3duIn0=	2018-05-20 11:23:49.016624+00
5s18l84ooj33z5pmei7jf4q7xd3yama8	YjIzZjVhYjZhNDI3ODdjMWI2NDFlMGJhYjQwNjhhNzNlMTI5YWJhODp7ImNhbGxlcmlkIjoiMDY0ODYzMTE4MyJ9	2018-05-20 11:24:10.642656+00
\.


--
-- Data for Name: marketplace_category; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.marketplace_category (id, name, sort) FROM stdin;
1	Fruits	\N
2	Cereals	\N
3	Vegetables	\N
\.


--
-- Data for Name: marketplace_history; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.marketplace_history (id, callerid, last_product_id) FROM stdin;
19	0648631183	96
20	0648631183	104
21	0648631183	92
22	Unknown	92
23	Unknown	101
\.


--
-- Data for Name: marketplace_product; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.marketplace_product (id, name, price, sort, last_update, category_id, unit_id) FROM stdin;
92	Bananas	4	\N	2018-05-04 11:57:46.990468+00	1	2
93	Oranges	2	\N	2018-05-04 11:57:46.995546+00	1	1
94	Pawpaw	3	\N	2018-05-04 11:57:46.999587+00	1	3
95	Pineapple	2	\N	2018-05-04 11:57:47.003826+00	1	3
96	Watermelon	5	\N	2018-05-04 11:57:47.01153+00	1	3
97	Barley	3	\N	2018-05-04 11:57:47.023876+00	2	1
98	Mais	5	\N	2018-05-04 11:57:47.031674+00	2	1
99	Millet	6	\N	2018-05-04 11:57:47.035822+00	2	1
100	Rice	7	\N	2018-05-04 11:57:47.040308+00	2	1
101	Sorghum	9	\N	2018-05-04 11:57:47.045357+00	2	1
102	Cabbage	3	\N	2018-05-04 11:57:47.049217+00	3	3
103	Okro	2	\N	2018-05-04 11:57:47.053201+00	3	5
104	Onions	87	\N	2018-05-04 11:57:47.057156+00	3	4
105	Peppers	5	\N	2018-05-04 11:57:47.061183+00	3	1
106	Tomatoes	20	\N	2018-05-04 11:57:47.065076+00	3	4
\.


--
-- Data for Name: marketplace_unit; Type: TABLE DATA; Schema: public; Owner: evkxunitfmfbxq
--

COPY public.marketplace_unit (id, name) FROM stdin;
1	Bag
2	Bunch
3	Piece
4	Crate
5	Bowl
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 30, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 47, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: marketplace_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.marketplace_category_id_seq', 3, true);


--
-- Name: marketplace_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.marketplace_history_id_seq', 23, true);


--
-- Name: marketplace_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.marketplace_product_id_seq', 106, true);


--
-- Name: marketplace_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evkxunitfmfbxq
--

SELECT pg_catalog.setval('public.marketplace_unit_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: marketplace_category marketplace_category_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_category
    ADD CONSTRAINT marketplace_category_pkey PRIMARY KEY (id);


--
-- Name: marketplace_history marketplace_history_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_history
    ADD CONSTRAINT marketplace_history_pkey PRIMARY KEY (id);


--
-- Name: marketplace_product marketplace_product_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_product
    ADD CONSTRAINT marketplace_product_pkey PRIMARY KEY (id);


--
-- Name: marketplace_unit marketplace_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_unit
    ADD CONSTRAINT marketplace_unit_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: marketplace_history_last_product_id_0c28c153; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX marketplace_history_last_product_id_0c28c153 ON public.marketplace_history USING btree (last_product_id);


--
-- Name: marketplace_product_category_id_id_7566fb1e; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX marketplace_product_category_id_id_7566fb1e ON public.marketplace_product USING btree (category_id);


--
-- Name: marketplace_product_unit_id_9ad70c48; Type: INDEX; Schema: public; Owner: evkxunitfmfbxq
--

CREATE INDEX marketplace_product_unit_id_9ad70c48 ON public.marketplace_product USING btree (unit_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketplace_history marketplace_history_last_product_id_0c28c153_fk_marketpla; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_history
    ADD CONSTRAINT marketplace_history_last_product_id_0c28c153_fk_marketpla FOREIGN KEY (last_product_id) REFERENCES public.marketplace_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketplace_product marketplace_product_category_id_2f8b8b50_fk_marketpla; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_product
    ADD CONSTRAINT marketplace_product_category_id_2f8b8b50_fk_marketpla FOREIGN KEY (category_id) REFERENCES public.marketplace_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: marketplace_product marketplace_product_unit_id_9ad70c48_fk_marketplace_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: evkxunitfmfbxq
--

ALTER TABLE ONLY public.marketplace_product
    ADD CONSTRAINT marketplace_product_unit_id_9ad70c48_fk_marketplace_unit_id FOREIGN KEY (unit_id) REFERENCES public.marketplace_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: evkxunitfmfbxq
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO evkxunitfmfbxq;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO evkxunitfmfbxq;


--
-- PostgreSQL database dump complete
--

