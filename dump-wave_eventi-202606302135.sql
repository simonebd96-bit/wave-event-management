--
-- PostgreSQL database dump
--

\restrict 68oW5EXaBxO33PUN1zT9hE4FRIZM4SY4zde2bO8MzlSleplyO3Vk2y2kkZmpqbi

-- Dumped from database version 15.18
-- Dumped by pg_dump version 15.18

-- Started on 2026-06-30 21:35:42

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

DROP TABLE public.tipologia_evento;
DROP TABLE public.scope;
DROP TABLE public.refresh_token;
DROP TABLE public.redirect_uri;
DROP SEQUENCE public.prenotazione_codice_seq;
DROP TABLE public.messaggio;
DROP TABLE public.identity;
DROP SEQUENCE public.evento_codice_evento_seq;
DROP VIEW public.eventi_pubblici_disponibili;
DROP TABLE public.prenotazione;
DROP TABLE public.evento;
DROP TABLE public.device;
DROP TABLE public.code;
DROP TABLE public.claim_identity;
DROP TABLE public.claim;
DROP TABLE public.bacheca;
DROP TABLE public.authorized_resource;
DROP TABLE public.authorized_grant_type;
DROP TABLE public.approval;
DROP TABLE public.application;
DROP TABLE public."WR_DELETE_HISTORY";
DROP TABLE public."USER_3";
DROP TABLE public."TIPOLOGIA_EVENTO_2";
DROP TABLE public."PRENOTAZIONE_2";
DROP TABLE public."MESSAGGIO_2";
DROP TABLE public."EVENTO_2";
DROP TABLE public."BACHECA_2";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16704)
-- Name: BACHECA_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BACHECA_2" (
    "CODICE_BACHECA" integer NOT NULL,
    "NOME_BACHECA" character varying(255),
    "EVENTO_2_CODICE_EVENTO" integer
);


ALTER TABLE public."BACHECA_2" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16707)
-- Name: EVENTO_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EVENTO_2" (
    "CODICE_EVENTO" integer NOT NULL,
    "ISPUBBLICO" character varying(255),
    "TITOLO" character varying(255),
    "DATA_CREAZIONE" timestamp with time zone,
    "DATA_INIZIO" timestamp with time zone,
    "DATA_FINE" timestamp with time zone,
    "NUMERO_POSTI" integer,
    "COSTO_EVENTO" numeric(19,2),
    "LUOGO" character varying(255),
    "ETA_MINIMA" integer,
    "DESCRIZIONE" character varying(255),
    "USER_3_CODICE_USER" integer,
    "TIPOLOGIA_EVENTO_2_CODICE_TIPO" integer
);


ALTER TABLE public."EVENTO_2" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16712)
-- Name: MESSAGGIO_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MESSAGGIO_2" (
    "CODICE_MESSAGGIO" integer NOT NULL,
    "TESTO" character varying(255),
    "CREAZIONE" timestamp without time zone,
    "BACHECA_2_CODICE_BACHECA" integer,
    "USER_3_CODICE_USER" integer
);


ALTER TABLE public."MESSAGGIO_2" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16715)
-- Name: PRENOTAZIONE_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PRENOTAZIONE_2" (
    "CODICE_PRENOTAZIONE" integer NOT NULL,
    "DATA_PRENOTAZIONE" timestamp without time zone,
    "ISATTIVA" smallint,
    "USER_3_CODICE_USER" integer,
    "EVENTO_2_CODICE_EVENTO" integer
);


ALTER TABLE public."PRENOTAZIONE_2" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16718)
-- Name: TIPOLOGIA_EVENTO_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TIPOLOGIA_EVENTO_2" (
    "CODICE_TIPOLOGIA_EVENTO" integer NOT NULL,
    "NOME" character varying(255)
);


ALTER TABLE public."TIPOLOGIA_EVENTO_2" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16721)
-- Name: USER_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."USER_3" (
    "CODICE_USER" integer NOT NULL,
    "SECRET_KEY" character varying(255),
    "NOME" character varying(255),
    "COGNOME" character varying(255),
    "ETA" integer,
    "EMAIL" character varying(255),
    "SALDO_WALLET" numeric(19,2),
    "PASSWORD" character varying(255),
    "USERNAME" character varying(255)
);


ALTER TABLE public."USER_3" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16726)
-- Name: WR_DELETE_HISTORY; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WR_DELETE_HISTORY" (
    "OID" integer NOT NULL,
    "OBJECT_ID" character varying(255),
    "CLASS_ID" character varying(255),
    "DELETED_AT" timestamp without time zone
);


ALTER TABLE public."WR_DELETE_HISTORY" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16731)
-- Name: application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application (
    app_id character varying(255) NOT NULL,
    refresh_token_validity integer,
    access_token_validity integer,
    secret character varying(255),
    description character varying(255),
    name character varying(255),
    type character varying(255)
);


ALTER TABLE public.application OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16736)
-- Name: approval; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval (
    oid integer NOT NULL,
    application_app_id character varying(255),
    updated_at timestamp without time zone,
    expiration_date timestamp without time zone,
    status character varying(255),
    scope character varying(255),
    identity_user_id character varying(255)
);


ALTER TABLE public.approval OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16741)
-- Name: authorized_grant_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorized_grant_type (
    oid integer NOT NULL,
    application_app_id character varying(255),
    name character varying(255)
);


ALTER TABLE public.authorized_grant_type OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16746)
-- Name: authorized_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorized_resource (
    oid integer NOT NULL,
    application_app_id character varying(255),
    name character varying(255)
);


ALTER TABLE public.authorized_resource OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16751)
-- Name: bacheca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bacheca (
    codice_bacheca integer NOT NULL,
    nome_bacheca character varying(255),
    evento_codice_evento integer
);


ALTER TABLE public.bacheca OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16754)
-- Name: claim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim (
    oid integer NOT NULL,
    key character varying(255),
    value character varying(1000)
);


ALTER TABLE public.claim OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16759)
-- Name: claim_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claim_identity (
    identity_user_id character varying(255) NOT NULL,
    claim_oid integer NOT NULL
);


ALTER TABLE public.claim_identity OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16762)
-- Name: code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.code (
    code character varying(255) NOT NULL,
    authentication character varying(255),
    authenticationblob oid,
    creation_date timestamp without time zone
);


ALTER TABLE public.code OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16767)
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device (
    oid integer NOT NULL,
    application_app_id character varying(255),
    identity_user_id character varying(255),
    device_id character varying(255),
    notification_device_id character varying(255),
    model character varying(255),
    platform character varying(255),
    platform_version character varying(255),
    browser character varying(255)
);


ALTER TABLE public.device OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16772)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    codice_evento integer NOT NULL,
    ispubblico character varying(255),
    titolo character varying(255),
    data_creazione timestamp without time zone DEFAULT now(),
    data_inizio timestamp without time zone,
    data_fine timestamp without time zone,
    numero_posti integer,
    costo_evento numeric(19,2),
    luogo character varying(255),
    eta_minima integer,
    descrizione character varying(255),
    user_3_codice_user integer,
    tipologia_evento_codice_tipolo integer
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16785)
-- Name: prenotazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prenotazione (
    codice_prenotazione integer NOT NULL,
    data_prenotazione timestamp without time zone DEFAULT now(),
    isattiva boolean DEFAULT true,
    user_3_codice_user integer,
    evento_codice_evento integer
);


ALTER TABLE public.prenotazione OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25036)
-- Name: eventi_pubblici_disponibili; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.eventi_pubblici_disponibili AS
 SELECT e.codice_evento,
    e.ispubblico,
    e.titolo,
    e.data_creazione,
    e.data_inizio,
    e.data_fine,
    e.numero_posti,
    e.costo_evento,
    e.luogo,
    e.eta_minima,
    e.descrizione,
    e.user_3_codice_user,
    e.tipologia_evento_codice_tipolo,
    (e.numero_posti - COALESCE(( SELECT count(*) AS count
           FROM public.prenotazione p
          WHERE ((p.evento_codice_evento = e.codice_evento) AND (p.isattiva = true))), (0)::bigint)) AS posti_disponibili
   FROM public.evento e
  WHERE ((lower((e.ispubblico)::text) = ANY (ARRAY['si'::text, 'yes'::text, 'true'::text, '1'::text, 'pubblico'::text, 'S'::text])) AND (e.data_fine >= now()) AND (e.data_fine IS NOT NULL) AND ((e.numero_posti - COALESCE(( SELECT count(*) AS count
           FROM public.prenotazione p
          WHERE ((p.evento_codice_evento = e.codice_evento) AND (p.isattiva = true))), (0)::bigint)) > 0));


ALTER TABLE public.eventi_pubblici_disponibili OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16820)
-- Name: evento_codice_evento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_codice_evento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_codice_evento_seq OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16777)
-- Name: identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity (
    user_id character varying(255) NOT NULL,
    expired boolean,
    locked boolean,
    password character varying(255),
    disabled boolean,
    attempts_number integer,
    password_expiration_date timestamp without time zone,
    email character varying(255),
    auth_admin boolean,
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.identity OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16782)
-- Name: messaggio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messaggio (
    codice_messaggio integer NOT NULL,
    testo character varying(255),
    creazione timestamp without time zone,
    bacheca_codice_bacheca integer,
    user_3_codice_user integer
);


ALTER TABLE public.messaggio OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16822)
-- Name: prenotazione_codice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prenotazione_codice_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prenotazione_codice_seq OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16788)
-- Name: redirect_uri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirect_uri (
    oid integer NOT NULL,
    application_app_id character varying(255),
    url character varying(255)
);


ALTER TABLE public.redirect_uri OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16793)
-- Name: refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_token (
    oid integer NOT NULL,
    application_app_id character varying(255),
    token character varying(2500),
    expiration_date timestamp without time zone,
    identity_user_id character varying(255)
);


ALTER TABLE public.refresh_token OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16798)
-- Name: scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope (
    oid integer NOT NULL,
    application_app_id character varying(255),
    auto_approve boolean,
    name character varying(255)
);


ALTER TABLE public.scope OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16803)
-- Name: tipologia_evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipologia_evento (
    codice_tipologia_evento integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.tipologia_evento OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 16704)
-- Dependencies: 214
-- Data for Name: BACHECA_2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3417 (class 0 OID 16707)
-- Dependencies: 215
-- Data for Name: EVENTO_2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3418 (class 0 OID 16712)
-- Dependencies: 216
-- Data for Name: MESSAGGIO_2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3419 (class 0 OID 16715)
-- Dependencies: 217
-- Data for Name: PRENOTAZIONE_2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3420 (class 0 OID 16718)
-- Dependencies: 218
-- Data for Name: TIPOLOGIA_EVENTO_2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3421 (class 0 OID 16721)
-- Dependencies: 219
-- Data for Name: USER_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."USER_3" VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WaveEventManagementUser');
INSERT INTO public."USER_3" VALUES (1, NULL, '', NULL, NULL, NULL, NULL, NULL, 'WebEventManagementDataAnonymousUser');
INSERT INTO public."USER_3" VALUES (2, NULL, '', NULL, NULL, NULL, NULL, NULL, 'WebEventManagementDataUser');
INSERT INTO public."USER_3" VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WaveEventManagementDataAnonymousUser');
INSERT INTO public."USER_3" VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WaveEventManagementDataUser');
INSERT INTO public."USER_3" VALUES (7, 'Piscusq-Trasi1', 'Peppe', 'Unicosto', 26, 'peppe@unicosto76.it', 50.00, 'Piscusq-Trasi1', 'Peppe_v2');
INSERT INTO public."USER_3" VALUES (4, 'TestPass!2026', 'Marco', 'Bianchi', 27, 'prova@prova', 1000.00, 'TestPass!2026', 'MarcoBianchi27');


--
-- TOC entry 3422 (class 0 OID 16726)
-- Dependencies: 220
-- Data for Name: WR_DELETE_HISTORY; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."WR_DELETE_HISTORY" VALUES (1, '1', 'cls1', '2026-06-22 10:11:25.818');


--
-- TOC entry 3423 (class 0 OID 16731)
-- Dependencies: 221
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application VALUES ('WaveEventManagementData', 2592000, 3600, 'poBrIBAGtxg4nq0o35BsTJqPgsxFfb8BxvbmUqw9+KWmLeahsJA4QNVz7QWWapipzFzYFCTCo+U9o1vhmYrlXL/jo7Y=', 'WaveEventManagementData', 'WaveEventManagementData', 'SERVICE');
INSERT INTO public.application VALUES ('wr-auth', 2592000, 3600, '9pGVzGQlUrqU8DdKcE7/QjijIiafcfGEya2U9cew7V1LMKTAm790H/Dwt0K1lHdn2X5L+XHL6hR0aEC2ptHdVYZNyG4=', 'wr-auth', 'wr-auth', 'SERVICE');
INSERT INTO public.application VALUES ('WaveEventManagement', 2592000, 3600, 'o+K5/U+YEJI8Ygdg8x0N/tARlt884GFcmQaNrv2aYIMxGP0MDIUrpxjO/pJzZOKW+70oFJ0Nwo0jFU70SGKhOLl3YfM=', 'WaveEventManagement', 'WaveEventManagement', 'WEB');


--
-- TOC entry 3424 (class 0 OID 16736)
-- Dependencies: 222
-- Data for Name: approval; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.approval VALUES (1, 'WaveEventManagement', '2026-06-30 20:58:02', NULL, 'APPROVED', 'password_change', 'WaveEventManagementUser');


--
-- TOC entry 3425 (class 0 OID 16741)
-- Dependencies: 223
-- Data for Name: authorized_grant_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authorized_grant_type VALUES (1, 'WaveEventManagement', 'refresh_token');
INSERT INTO public.authorized_grant_type VALUES (2, 'WaveEventManagement', 'client_credentials');
INSERT INTO public.authorized_grant_type VALUES (3, 'WaveEventManagement', 'password');
INSERT INTO public.authorized_grant_type VALUES (4, 'WaveEventManagement', 'authorization_code');
INSERT INTO public.authorized_grant_type VALUES (5, 'WaveEventManagement', 'urn:ietf:params:oauth:grant-type:jwt-bearer');
INSERT INTO public.authorized_grant_type VALUES (6, 'WaveEventManagementData', 'refresh_token');
INSERT INTO public.authorized_grant_type VALUES (7, 'WaveEventManagementData', 'client_credentials');
INSERT INTO public.authorized_grant_type VALUES (8, 'WaveEventManagementData', 'password');
INSERT INTO public.authorized_grant_type VALUES (9, 'WaveEventManagementData', 'authorization_code');
INSERT INTO public.authorized_grant_type VALUES (10, 'WaveEventManagementData', 'urn:ietf:params:oauth:grant-type:jwt-bearer');
INSERT INTO public.authorized_grant_type VALUES (11, 'wr-auth', 'refresh_token');
INSERT INTO public.authorized_grant_type VALUES (12, 'wr-auth', 'client_credentials');
INSERT INTO public.authorized_grant_type VALUES (13, 'wr-auth', 'password');
INSERT INTO public.authorized_grant_type VALUES (14, 'wr-auth', 'authorization_code');
INSERT INTO public.authorized_grant_type VALUES (15, 'wr-auth', 'urn:ietf:params:oauth:grant-type:jwt-bearer');


--
-- TOC entry 3426 (class 0 OID 16746)
-- Dependencies: 224
-- Data for Name: authorized_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authorized_resource VALUES (1, 'WaveEventManagement', 'WaveEventManagement');
INSERT INTO public.authorized_resource VALUES (2, 'WaveEventManagement', 'WaveEventManagementData');
INSERT INTO public.authorized_resource VALUES (3, 'WaveEventManagement', 'wr-auth');
INSERT INTO public.authorized_resource VALUES (4, 'WaveEventManagementData', 'WaveEventManagement');
INSERT INTO public.authorized_resource VALUES (5, 'WaveEventManagementData', 'WaveEventManagementData');
INSERT INTO public.authorized_resource VALUES (6, 'WaveEventManagementData', 'wr-auth');
INSERT INTO public.authorized_resource VALUES (7, 'wr-auth', 'wr-auth');


--
-- TOC entry 3427 (class 0 OID 16751)
-- Dependencies: 225
-- Data for Name: bacheca; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3428 (class 0 OID 16754)
-- Dependencies: 226
-- Data for Name: claim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3429 (class 0 OID 16759)
-- Dependencies: 227
-- Data for Name: claim_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3430 (class 0 OID 16762)
-- Dependencies: 228
-- Data for Name: code; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3431 (class 0 OID 16767)
-- Dependencies: 229
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3432 (class 0 OID 16772)
-- Dependencies: 230
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.evento VALUES (1, 'si', 'Ebike in rome', '2026-06-13 14:53:00', '2026-06-13 14:53:00', '2026-06-13 14:53:00', 30, 25.00, 'Circo Massimo, Roma', 18, 'Evento sportivo per tutti in bicicletta', 4, NULL);
INSERT INTO public.evento VALUES (2, 'si', 'Rock in Rome', '2026-06-13 14:53:00', '2026-06-13 14:53:00', '2026-06-13 14:53:00', 300, 150.00, 'Circo Massimo, Roma', 18, 'tutto il rock che vuoi in una serata', 4, NULL);
INSERT INTO public.evento VALUES (3, 'si', 'Canoa volante', '2026-06-13 14:53:00', '2026-06-13 14:53:00', '2026-06-13 14:53:00', 10, 70.00, 'Subiaco', 25, 'Evento di lancio con la canoa paracadutistica', 4, NULL);
INSERT INTO public.evento VALUES (4, 'si', 'Canoa su Aniene', '2026-06-13 14:53:00', '2026-06-13 14:53:00', '2026-06-13 14:53:00', 30, 78.00, 'Fiume Aniene', 18, 'Evento di canoa per amatoriali', 4, NULL);
INSERT INTO public.evento VALUES (5, 'si', 'Evento Peppe Calcio', '2026-06-13 14:53:00', '2026-06-13 14:53:00', '2026-06-13 14:53:00', 30, 25.00, 'Stadio Olimpico, Roma', 18, 'Torneo di calcio', 4, NULL);
INSERT INTO public.evento VALUES (6, 'si', 'Computing for all', '2026-06-17 21:33:00', '2026-06-17 14:53:00', '2026-06-17 14:53:00', 30, 25.00, 'Circo Massimo, Roma', 18, 'Evento di e-code', 7, NULL);
INSERT INTO public.evento VALUES (7, 'si', 'Design cloud event', '2026-06-17 14:53:00', '2026-06-20 14:53:00', '2026-06-21 14:53:00', 30, 25.00, 'Circo Massimo, Roma', 18, 'evento cloud informatico', 7, NULL);
INSERT INTO public.evento VALUES (8, 'si', 'Puglia Cost to cost', '2026-06-20 14:53:00', '2026-06-27 14:53:00', '2026-07-11 14:53:00', 10, 700.00, 'Puglia', 18, 'travel in camper', 4, NULL);
INSERT INTO public.evento VALUES (9, 'si', 'Todos a lo mar', '2026-06-20 14:53:00', '2026-06-20 14:53:00', '2026-06-20 14:53:00', 30, 25.00, 'Ostia', 18, 'Gara di nuoto al mare', 4, NULL);


--
-- TOC entry 3433 (class 0 OID 16777)
-- Dependencies: 231
-- Data for Name: identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.identity VALUES ('admin', false, false, 'G0CBoOtjDran8IfVSk+8NFjzRyHIRPD/zc4QJhUl4p0qGjk5lDIqRVMt486nZguAY0gzxMPfCMI4AjogVM1hbi/azsQ=', false, 0, NULL, 'wradmin@webratio.com', true, 'System', 'Administrator');
INSERT INTO public.identity VALUES ('WaveEventManagementUser', false, false, 'Q7J44q8BDoZPxm/Upd/ftaGJ/MliM+PASlihfYJdeHXv73dMr68v1SabzenmSx4MJ7T8CFuCaus7ux3ov2VE/PAWuFc=', false, 0, '2026-07-19 21:23:20', 'WaveEventManagementUser@domain.com', false, 'WaveEventManagementUser', '');
INSERT INTO public.identity VALUES ('WaveEventManagementDataAnonymousUser', false, false, 'h2D2knGioq3OdIJ8kwhXRFuYoOb1+N3PHP1i3LV6XVHnLYlK/2GlbOFSH9onxHHf129Xa+Hpnjr6VkQVDpqHWIjY8fE=', false, 0, '2026-07-19 21:23:20', 'WaveEventManagementDataAnonymousUser@domain.com', false, 'WaveEventManagementDataAnonymousUser', '');
INSERT INTO public.identity VALUES ('WaveEventManagementDataUser', false, false, 't57+bG5F+O4CCzKsT7Gzlg262WXoPHvGpfeoqk9Oahkdd1IMHlUlZ03mec3aWxA6ZEfH2ai/vQpwyMyfAhh/RWOR2xU=', false, 0, '2026-07-19 21:23:20', 'WaveEventManagementDataUser@domain.com', false, 'WaveEventManagementDataUser', '');


--
-- TOC entry 3434 (class 0 OID 16782)
-- Dependencies: 232
-- Data for Name: messaggio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3435 (class 0 OID 16785)
-- Dependencies: 233
-- Data for Name: prenotazione; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3436 (class 0 OID 16788)
-- Dependencies: 234
-- Data for Name: redirect_uri; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3437 (class 0 OID 16793)
-- Dependencies: 235
-- Data for Name: refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.refresh_token VALUES (1, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI1MjI1ZDQ0Mi03Mjg5LTRiOTQtOWQ5MS1jMmQyMjMyYThmYzIiLCJleHAiOjE3ODQ0OTA1ODcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZTYyMGY4NzktOTM2OS00OWE4LTkzY2EtMjc1ODM4MjY2N2YxIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ0OTA1ODcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.HHGpHx2p5ZkfJrwJB_RqSDeTbfPOiStMLacoQsyjy7jXxXuyEjDU6ScQPbndwGTUoL2WBkAYE6fPNkysI-02kfktQVK5A3fX0HNLE-FCRHvi0l--J6P2CgirjYORFWadRDM5U9seSHgy0_fJPTg488QWTzb_H-x_-RGb5ywuS0gH_HkIzrhIhETRFPI2QcsC041ELK0dGTb0N6zNk6sZ1Y5dpPqwpOw5e97nTW3IcUV-rPvXoQLwx9diaftDzzMbeZfhoOUDoAgMMhHAdC-_9tZYHJ4AJB_rnC5kG3EbWHZeCYBfg_E4ZKynj9YxeWW2Oslmi5IHMLHZ4RS8upo7kA', '2026-07-19 21:49:47', NULL);
INSERT INTO public.refresh_token VALUES (2, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIxMjBiYzllNy05MTQyLTRhMWMtOTc5YS1lNGFiOGZmY2VhZWQiLCJleHAiOjE3ODQ1NDE2ODUsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZTA4ZjljM2QtZDAwZi00N2FkLWFhMTAtMWU1ZTRhM2RmYjNhIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NDE2ODUsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.S2NyJt_yi3q_tqkZjd0Z4zQ8TxTBCN0rU3pkuMtwJ5Ssd0DTIu-TegCkbf5kyQPL8Uw9x7uCgew9_F_yrwWBQH_ftqrTHMs0u345A7ZoXSQ6oBLqSZDAjdkpZGvVaIqLCHGNIsdwM4i3BYxX-qehUn3gV9xZ8SA01WUHujEd449QLWEfv36L86WQ6L9A51zUnaJGd0-NM7Vhj2f4KgRSbSzLwIeNGGJdG4SwWGfLOBjfXJjdnLZLraL5CpiI5OIOVYIrvw2YKJLG1HybpGLorGBO-SaJl9luwrM4I6ML0hDXKgGYnmdv20JaFLjqCjcuKHH9a1ufZTqXUnhj3XcaYA', '2026-07-20 12:01:25', NULL);
INSERT INTO public.refresh_token VALUES (3, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2YzQxM2IwMi1lMzIyLTQ2NWUtOGZiMC04YzZjODI1NDY1ZDkiLCJleHAiOjE3ODQ1NDI2MDYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiYWZiODJjZDQtMWYyNC00NjlhLWI2NzEtZTJmMTE2N2Q3ZjJjIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NDI2MDYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.FdSDcFp9ju530efRN9XwEcx6D24zUKYvWPer_kYTwHlU2N36D2QFcOPOfBXSHNUTfKOmE2SyF2d-6ChZIBh6sCqXMbTTuoHnNgaCf48AsEsM1xx3AHP2-uXez16Xe6Ui-7RBlC2CFw7p5aAvVPaNwBtfQluNd881SR7BrzQbj7mH-dZg2WH_v5t3QtkFBu8l-A_9KKAyospI81VO-6PCavtDjF_N7Ok2kNqSbdIvxAdhpRNrZjTfSCd3VD3jBicg0hKjDTp5EqGElc7WnWRkuBu-ePRtHGO1Nh2WQLCYEa3auQOUzlseGXqH1XLogk9IQcyJsOXI7uNSjabP6bW6ag', '2026-07-20 12:16:46', NULL);
INSERT INTO public.refresh_token VALUES (4, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJiZWE2ZGQ1OS1mYWJlLTQyOTktYWEwYS04ODQ0YzRkZmFkZDEiLCJleHAiOjE3ODQ1NDI2NTYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZGY4MDBiZjctMzM1Yy00YmY5LWJhZWEtNWZjODFjZTQxOTVjIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NDI2NTYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Dv9Bdh3e56Ao2EY8qTvecrSAN2jWYXfmDSPfz1kIe74UPvI02WtVkQJs-CVa5ZJU54p85OyomnK7JIS3XM6OIJtiN3joXSt34WV7AkSo-m9WLB7OvF02rJBmh2EtBffzpUsvjIiKLO3XRSHRzUdqOACWbv6IwPlEeMZTo7Ad5d3F1salGHh_EwKQFqXVTMKibExhCEG38GOowlU-ozE13UBE4YBhmpWHrM-LFBuHl0Ej2LowOO1pzSDjNShKiDMcAeIkbITYzxpLF7fdEqd7yx7GP0p1Dxqd9gm5KRdTwsIERTEs3zSW6MUNAqp5KONGERi_SomP9a7RS-NbuFLqhw', '2026-07-20 12:17:36', NULL);
INSERT INTO public.refresh_token VALUES (5, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI3N2Y5YWQ4Mi00ZmVjLTRkZTctYTU4ZS04YzhiYTBiNmU0NzEiLCJleHAiOjE3ODQ1NDI2NjIsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNmMwZTEzNWEtMzk4Yi00ZGFhLWE4YjItN2Q4MTM1MjQzNTkwIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NDI2NjIsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.GzaWuAxyzOxX4x3V1PZjyjtIXixXYvtk9P89yna3H_wrT9jtZ2f_p6tQtY8gLquFBDbfK3Aw2PnV_DGogOOnrRVVa-9wO3XaF2NjpduW5tjC3STFEddrvKgIk58fiGeOWS9N-wFwn7Wwu6GDT2LG89tDuhVpoB1Ekrq1oS0oMbetnKlX_Gu0NBbY3XU7WR9J9pXuwi3ydsbZlCrpEOTc-CxSSeYC38gzlU7gEvQNpoO6Tsu_aY6KR26arXfj-0-bTkn7X9xzVJTr7pRTCgt4p6vA_I4OsLBhGQRcUkpqkzuY0e7_tc1ecY4wv1Rq2XKHcgzZcKKrfgvBsGxRXKf5Hg', '2026-07-20 12:17:42', NULL);
INSERT INTO public.refresh_token VALUES (6, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJhMDJlNzJkNi03YWFhLTRjYzctYTBhNy00ODc2OGUzYWNiOTYiLCJleHAiOjE3ODQ1NDI2OTcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMTUxZTExMGEtZDgyNC00NzI4LWFjYWUtYzBjOTlkYWU2MGM2IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NDI2OTcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.VgBn48IHh0tQelkE85Re-lMtMWqoqaW1jLo6KPxO5U6GOs_05mmsyHyDRDFsRwtYoZh_Pv0srbBe-Sesgq8o1x7Bdj9UOcXt-XzpW5zAiGU63PM3FCpCOqE-yH77ch8h9RktVfBOFo8FGbzy8UZE0W-48FLcKvYqntfjrHafYVH9SEbEf1zYlH2NMUTXPOWOtFGwCUvqXahtEeDuOnMkLLNVqyLj5A7tROUQubtQLJTvmVWy862QtQlD7NrxeXsFUS4H5AHWJXBStGEJ-aD-NgG9OlV3I71Td1GRexYdcRform7NEQ-IwNCcKqtj2IMupSS_clUOwMsEI6mRfAjPTA', '2026-07-20 12:18:17', NULL);
INSERT INTO public.refresh_token VALUES (7, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI0ZmFmNGExOC1kNzA2LTQ5MDEtOWQxZS1hYzgxNmUxNWJhYzciLCJleHAiOjE3ODQ1NTAwMTEsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZDhiMjY3ZWQtM2ZiNy00ZWNkLTg3NjctYzc4NmU5OTA3YTIwIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NTAwMTEsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.UENt6J_GEo-lOCxDLv0A56OFttE49xPX3BecIk-syeKWDXM5K8yt5t3r1BNsPT-lDli-dpUO49P_doSbMBHe0KIIIqqBSXGJ08ZI30_mi8krSB1YH7HnixIj4L4D39Lby2y5lu7v-o8roI3JOaW5uy9xAqNR_tm0IfJocneZjdCTKWZgyuqY2sL4jFfQ3O2wH1_ZR4CrPNXcabGNUfcgEIc9eL9lth9Oz3EwSu2GwSHPYVY1DyH4OxoXRtfwMUnZR-ktHhl9EXqZw9xY_RdVl3Tgxo-1IkY0QDK2aqnOqXCICEGF0YaPjbrLFOroc1hJGUaFJ6BpYOsN8uZyT4dPPw', '2026-07-20 14:20:11', NULL);
INSERT INTO public.refresh_token VALUES (8, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJjZmUzODA4Mi05ZDJlLTQwZjgtYjUyMS0zYTkwOTVhMDgxMjUiLCJleHAiOjE3ODQ1NTA4NjAsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMzRkYjhlZmQtM2NmMS00MjBlLWJlYjgtOTEwNmY5MGM1NzczIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NTA4NjAsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Ifj-5NoV9DeR1SI-OOVJx580vSPJ4NQB422tkbzHIuS8jC-G726S0d_7VR8pQmOkVkbXjMjlwmRW4EeoQ5hHn6DhQY21ppZIt4HQiUtdhDqnqTzlpZ9Uj1PTELK4YndGtk2NaX4PDCNwb9y_74QZd_e28VWaYIDIjJyandxRp7LHtmljA7pcXTLiJxHlWrl6R4-zPE1eJrIX-nv5nqVoaFHZ2nbLj9DexvFXi6TJzTxVir9X6ZZJ37czz4HVWVMPrWmNzz6_7PDNiNbFK13hb9nEr8wq0woZMZiufcTuBcurq8xUNB7sMfcN3HMujn0hsj2N-GLq1uc7wSYpqH0A6Q', '2026-07-20 14:34:20', NULL);
INSERT INTO public.refresh_token VALUES (9, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJjZGQyMDM3NC1hODdiLTQwYWMtYmU0Yy02YzdjYWJhMWE3YzMiLCJleHAiOjE3ODQ1NTY0MzksImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMmNjZjBlMmItYTFjZS00N2UwLTgyOGQtYmFmZTIyNmZiMmEyIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ1NTY0MzksImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.G5vRJqJeDn0MSUw48hLgGTycffTDYr2pzS1yCnWrq8Ai2YvrOsHm7PIWVt-Vz_b2txqUT2LpctH0T101zeplboAeO4zMPp9SFvLpVk8zGFz12C2WQlIQwYNxZoFTQPHXEgi5yoeE7sju5bOPWTsP76roNEmhtJzkSS2KXBulofQcx5f1SBEJcwfXcBJwBAm7tvewXozeDzM-eEZBi5hTe-URjjJ9-vgfDEuB5k7dTg5_ovZvrycFq2oRbwDMDgEQC0f41NZsu3f5IXoq95Dqy-GFKnVm4wN-aL6_f2zM4whT6pjH6AGTiY1taCVI_0SNYCXSOX4tZdtFpoCCsFyIKg', '2026-07-20 16:07:19', NULL);
INSERT INTO public.refresh_token VALUES (10, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI1Y2E3YTRjNS00YWMyLTQ2YzQtYmQ5Mi00NTM0OGViOWJjZDYiLCJleHAiOjE3ODQ2NDQyNTcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMTA4ZWQ0NzYtMDgwYi00Y2VhLWE1Y2YtNzAwNDA1ODBmYmY1IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDQyNTcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.ck7Ju0WrR9KHP31PCvtnlH4dDD0tmXyx9UviPnEHPImLGnY3AquRQGKlxl3TXvL2Ex-HMjEsR9kXR6DfvoYE9TVKmH2-GwyUGbkyhdR2Hpchi7hGW5Z4UDb4BUaCGLxSrcop9FzUs05JlITkqUYIpAr0-WqRzHZIrnixu11GxosEzwJztbxy3Qq8RJNAcsourL6Aq6GUJvi8-ZWmz-z8YvR4Y-Pm3PSrOupAdo7m_WP4fyevf5xV0pnoddUMbN-tDoBnDwGoNoFYHBGoTEUQTz01VMc_o7HzDeOINlKZ8QAX2asV6Qrq33Aw4hfVVPgPmE7AmAXRYWF898iYHcCbRQ', '2026-07-21 16:30:57', NULL);
INSERT INTO public.refresh_token VALUES (11, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI5N2YzNGIyOS0wMTQ3LTRjZWEtOTUxNy1iYWFmN2VkYTE1NzgiLCJleHAiOjE3ODQ2NDQ0OTcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZGU0ZjhlM2QtMjVkYS00NmMzLTk0ZjQtMjk3ODBkMjdiZmVjIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDQ0OTcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.CQ-4-UktDasciuYwQ5QTYWExpFsCbT6WgdrX6XwPpS8cL-1vn2FunCk_hBhYffOiEPXvBHWLkiXFvOdrSbG0F_nUSqggjD-LLwhAlhRmlSBk1m0FuwwIBZlK_DCs5nL4rBbiXCdV5_5WGR96HNVI-4Em9Ok5EqfDuWtw9B5myopeBDfJA-SG3tXJLu4KaqUXGn2wPJglrRrKOGtJj29lgTkzfg2ZDfvZrqIiVZZDjxwPeykAxicsfdciA4uo_qs1Nq_djDyQnhfX-K81kF7PGk-fDA0-Q5skaqsuvrzaNnner_qZ0Uog2BybkV9NnDNQwvjM5djES43cVMuFWAtHQQ', '2026-07-21 16:34:57', NULL);
INSERT INTO public.refresh_token VALUES (12, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI3OTk1ZGIxNi1jMTY0LTQ4ZjItYTI3MC1kY2E4NjEyOTk5NWMiLCJleHAiOjE3ODQ2NDQ3OTgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZmIxZTJlNzEtNjhmZi00MjViLTk2MGYtMGNjOTg2MWE0M2RjIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDQ3OTgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.eG8RkCqhybu9uD6gPcv2N02OjROL3JiMWOBNxaMW9z3CjvmvoIhZBuLnQrLUFMFx54ie5DLQVU5LD0q2BA5M0msx7pErrQNSTMddAZ66jwn3YRHQjJ7tsRwDrdxohvOWn3z-b0ugZJj9tV9fm7fLAzOy-MGUrK8F98yEeCs-JcR-FIw-r2A-vVS-h098wZX73d1Wl_wXgKKuyxSQbCmW6ikQvN6uHStama3Bcc8aZlNC9kPvztCsJTWiaomx72cUTT1R-3Kr_Hffc4r2Ih_6SOEnegO86dsQmzAeOqzk4IDxm0KRRuhwUsj0X8cuzq4e7dEuO58eqHecNfByzUEehQ', '2026-07-21 16:39:58', NULL);
INSERT INTO public.refresh_token VALUES (13, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIzYjk1YjM3NS04YWY3LTRkZTMtOWZiZC0wOGU4Njg2OTI2NTgiLCJleHAiOjE3ODQ2NDU1MzMsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiODgzMTljOTYtMDBjMC00ZjA1LTkzY2QtZWYxODU0ZmYwYjgwIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDU1MzMsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.BazdS5M2uoRswOEAO1LfBSD3sNWvQH13DGyB8keb9b4kVtBgs106sIIbVzJu3K16BbOGONKDn6S0rO_zPfJjXLqPb57Y86pV0k_6viABoc7LXdyKAk21qQgtlaDrmi6qkiYFpcRRUXHkqSLqudXpwu8B87UIFU8xM7RdmNGe84M6A7xZP8GDhp27HmQdejdTDTckY_AdAgNYU1nO_d4nf9-IL-Jrgw-Q26qmB7-RI6HCxgufhzwEc1ykAcFrPqdjl335CmNwne6QLH50VLgISEede0ma7EHaeMHpZaHb67xOba7RGTI1kkKLh4LLdhO8TPKONaM4HZLbbyD0C1W84Q', '2026-07-21 16:52:13', NULL);
INSERT INTO public.refresh_token VALUES (14, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI3ZWQ5YjBhOC03MmFmLTQ3Y2UtOGJiYy1jNmJlYzA4OWQ1NGUiLCJleHAiOjE3ODQ2NDYyMzEsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZDZmMDVlNTUtMzlhZi00YTEwLTlmNzQtNTI1NmQyNWQ5Yzk2IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDYyMzEsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Z2F8fs1rEoPxKEsHk3sHizShF_yd4d85Pk3Rkm_Xc8H5AIlC38q9xtA_PfS7cz51_6cjVo93Df_44pvuneTs0PgOCitUA_HbhWvt2G7I7nbWPG9SlS_L2d8eO_f3TAvdzNpinw_zm9KGt5ofFlR6FAIBpO1hEDGXvrUizwCV8F1ux854qTRXgI24nOZStyE-tCQgi4SYX8Q0A5EjvQJ4ZdCCKFp4bbqdeeRCd1d5RkBWZKFf79VWFV-F9nn16OHSlL7bCwKnDNWDLeFu8ib3dScV6BrSaANf0zyXjmSvxxaSYzpRAPtBEQxPXLIHBRr8VZjejSs7WZDilWKa49bUcw', '2026-07-21 17:03:51', NULL);
INSERT INTO public.refresh_token VALUES (15, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJhMWI3YTU5Mi04MGFmLTRiNWItOTEwYy00ZjU1Y2Y5MjliYmQiLCJleHAiOjE3ODQ2NDY0MzAsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiODg2NGE2ZDItMGRiOC00MWM5LWFjZWItMWZjMjNjMjdkNDJlIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDY0MzAsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.J61f1Sa6RVSNCJDTdrmsip02eeJBeMIfnqxtfXVPpnxo7eNZD3LQeYADpyRq06uzyYO37Py6b3mwlBUhUsqFqslPtVSV7F_lzvHZ-CFrhGQz5LeuV6tCOKo9hv_GvExSBoiyoiyp3HnOhA5LMvCao7bufbA8Y2crkpaFLPf181O45ME9Ln_599S_s2HNwx6ja4N2MfF6eEavwpCn9NCBDfXb1gvvv9cSOr5aHW33jxkgLzXQ8dZzoO6l6MIU_AAmKCNjMAxtJL3NxOaoT_2VMFaxA0DCWVH6LPiTGBOUpDA-yJbzaSaYytSxTB1ItEy7ceZd1tzSuZUwuco_LESJRw', '2026-07-21 17:07:10', NULL);
INSERT INTO public.refresh_token VALUES (16, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI1ZjhjMjlmOS0yYWExLTRiOGItOGQ0OC00OWY1MjAwZjk3MTQiLCJleHAiOjE3ODQ2NDcxODgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZDQxMmRkZmEtZTY2Mi00NjQzLWFmYzEtMjY5MjFiMTlhZWM5IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDcxODgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.gEf2HBv2cSx7dJs_tSOubkZPmGtIgt_f8u195hQrK1GqylpUiV8H3LrPHz0XPGC4M12C686xnuQIz4KrS3bfmfFeyHYDiTTMXTJCL1CqUxQ6N7O7RXnjgKQhkDSzgnKByxcdgBgGnGc6uGB9b4PB-VJZV3E281zm9cPHVZ-SIpAQnQ3V167bO1RThFGTzqZQehe5aJFYbeFwgQjNAam138OTAnxuyry517v_9Nnkjt1Qtd3pZd0s5wuUMVoKtBW0dE4bUriBbVA7KIJbt8W4BnS5qJRQVJ6fhcMirHsMcqSp3JKRNshkh8lz8J79_a2MwdrhZ7ii_dzhf549OgMzYw', '2026-07-21 17:19:48', NULL);
INSERT INTO public.refresh_token VALUES (17, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIxNGQ5NDIyZi1lMDFjLTQ0MDQtOGQzZS0wYjUxNjM5MGFmOGUiLCJleHAiOjE3ODQ2NDc0OTcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNmI2MDQ5ZWItYjE3YS00N2VlLWExMGItMjJkMDRjY2I4NjJmIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDc0OTcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Ex8p3Nne-8403usSdJP9Y91F5lHRhMyjxiqidzFOSGk1n3tyly-S7ekEjaYtvHOBqo9uQk7iLt6-lDsI6DcA-gv5SeGjghjJhI4jjgiZrguS8JFDVLbeJiAR0pttXtZTVXQs2AwYIxgV2pXJ7iG-DXBJpgGJ0ZxmaXwHN9dZeF_qhzXMe1OURPsISrNjwRC6CL0pHc79PlAEyHM3mi3gRH-FBEmiUy6O95gGwU8efK0y4EnFvKf20zbF7WxsNSqO7xzyc9OxPSZmVhE0Z2y37ZsKFAk1ykmqEq96yI3YM74lN3JtpG7broG8nMvbe4usfn9RX3FYQPDYStEuHpqGTQ', '2026-07-21 17:24:57', NULL);
INSERT INTO public.refresh_token VALUES (18, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJhZTBiMGMxOC1mYjhmLTQyMjktYjdlMi05OThhN2Q5NzExMTEiLCJleHAiOjE3ODQ2NDgwMTUsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNGI3YWQxYTItM2E4NC00ZjY3LTg5OGMtZjczOGI1MDJjODBmIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDgwMTUsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.NCgHiJP-_S-MGOPQoINrZw7xNNPUZokgNV_AZxCQWt7YB1pjNSTsYqwuiGvrx6GJRa_qs23lPd4rf61k0S3y9C4LnC_HG-exrheE6SdoNOedmRIaQSk4DrrfcxHNe7SVzSBRtjzCcURWIIh3neWnQXPFhEfkzEyzNvXwURARLxd7l245654kYAdXqaACji43frN09U83_uDKuUQO-sg1NyCcAW9cmvas2LsUpgZNkJjCWV5SxXHQ_chVYNDulwF7oAomZnCFKn81uloQktMTcK-sLbD6-3pHnNxYYpzvT2ihSkgQhK8IX1oVUUxz1Wk1eQak-4L6ykIno3bh_THBfg', '2026-07-21 17:33:35', NULL);
INSERT INTO public.refresh_token VALUES (19, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI0NjE4Y2UyYy1hYzE1LTQ2OWUtYTc0Zi1hMTU3NjgzZDY3OTciLCJleHAiOjE3ODQ2NDgxMjIsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiN2IzMDg0YzItYWYyMi00NTNiLTk2MmYtZWU1MDgzY2JkZjA3IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NDgxMjIsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.ZeqHfHY5wrboFhrkvvpoMAJCVa20bnYQbjNj9NVTRCLbAQ9CzQF611-UygykaTyXq1QX2w2M8XqnKNkJm0gDc8G7h_RwGvN8f346ZBwlTa_cGUEn_dY8mGDJnHapttXh8GkAp9qoXlljkLfUi_Era_aD5PFQwWXwtTBLt1-OcdQgiP_HiHomtckKtcMuziMMZ9QC9XtSOcFzmXXFC3u9Qy3oG3qTeQRLTZV8FFLVscp5C-IKYni1qatapOrFHuvPQHNM8NVBNEUMBVcKORfw5cFBkFZgMXqcRxRXRIteddW60u5UvpadpQMlzyeOvjAjVqGGB2ZAzONbBCSjoR-3Gw', '2026-07-21 17:35:22', NULL);
INSERT INTO public.refresh_token VALUES (20, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI1YWUwN2E4ZS1hMjEwLTQ4NTItYjMxMy02ZWMyZmRhYjljNDgiLCJleHAiOjE3ODQ2NTE2NjEsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNzNjODA1MzUtNWVlYS00MzRiLWI0MTItNTg2NWIxYzRhMTlhIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTE2NjEsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Ukl-BbSmH8Xu1yrYNveIDL6CtS3hkv8TRQcdYwgU7AXY4zBT2bBqGZjPjzuYlNPTcbcHGmJAv0qG9ndqed8kvkINZoijl_P4wp8W05xWnoYLvE1_jymx34AseMeZS4AeC0vHVqI2XLG2zpm68TrqTRqb5WPD9aqH9bwl3eBJtpbuNIFt63a4G4_qz5wL_VeYLWbBUp0TprWUrNZcwwuJAWWJVna0lx21YpOL2meb3-owKPCHlLW5gS_6A1k-jEg7Z1bspd-uhDpr-bRKt_DCNrBj7nSH-pg-eeTxOGbdOyJXOiCieA6jdGeMUXCvnnRp5Xry2cIbl2AYVLK3pdvvRA', '2026-07-21 18:34:21', NULL);
INSERT INTO public.refresh_token VALUES (21, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2ZjJkNmM3Yy04ZDMwLTQ3ZmQtYTZhMC0xYjQzNGM4OTM1NjkiLCJleHAiOjE3ODQ2NTI3NTcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZjFlNGFhZjEtYWU3OC00YWYwLWFmMmYtYmY4Zjk0ZGM3ZDAwIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTI3NTcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Qv_JIBdCQ9xZD2W1ow-Hm-Re3579tiEluSHCZ9nSTK7efqXS3gS3bVfkcfZ0bGzhT6Xmn1lKQX1URtz5kL_mmqxGw05JibgjnTPHY5KrxLOifxrtIO_wR-KhBO073MW8vSti8NtyUCn0qFcm8F9unpim5H94de_UkLIEyBaWV5GTVVQ8FY-HjiBdk9VcJN2nFriTtrUl0eT_0PEiF5DTmoH_crZL3NfdEnzUeqlgy5rFmyUqIIu2F_0fwuWMbDq454gEd3nR7AQt_6lEfF3Cp0UAbEnIzfdmx7fW5bJGmGLf_cGF_-dzKSVsy_b3PMggK0TyzlVlRjMxGR3OCyTH4w', '2026-07-21 18:52:37', NULL);
INSERT INTO public.refresh_token VALUES (22, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI5YTVlNzQ2Ni1mMmE1LTQ4ODYtOWUzOS0zNWM0YzQwZGJiZDIiLCJleHAiOjE3ODQ2NTMzNjYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMGUyY2JkMWUtZjUzOC00ZmZkLWJmMDEtNDM4OWViMzkyZjA4IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTMzNjYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.HySKCYS7czV2_tNZuwGYY6auNq_Kx9B1pbfxf2xluoWO3h1IzeYR85WiuGgoGzrwqLF5FOpDbgoigkZjtK19oJ7BlMNQIoqTzNv_IBJomF9i5MYT2RtsNJwMAwmwP-3xpkOiHqDKXUpiPjrJW5u8qgdh0QrBBS2qR_bSNQz3F6F46l2IF5KKL1pcBbuuuKtkdHOMOUMiwGfv9VSja2s4vyTGIFKM-ZglfLJwfqYpECuxpRh8uxMHIGpykAuV7gUdeYwMAIZzi7Rv1iYvoGQABq-9LM-8G5jFpshu_-3k4VJcQWMBwp0v0fYDkt28LNlgqKzTAJwM4J8j7plcpxYcNw', '2026-07-21 19:02:46', NULL);
INSERT INTO public.refresh_token VALUES (23, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIwNjBkMDMzMy02ZDAwLTRhNTctYjFmMC01MDg0Y2ZiYWIyNjgiLCJleHAiOjE3ODQ2NTM0MDYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiYjE5MmEwY2QtMGM0Ny00NTYyLTg0MzMtZDFlMjFkYmVhMWYzIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTM0MDYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Zw7E031UjMkn_Z4czVA3wCcybIA8ridWPhsghhepyvvN72EkhYyylX3nSfJD-kjBg28fLOAjq6tnGvRvyJDs6Eo_vbWFwgxUs893kVcKF5h7CMp6Ew1m0LkrM9z-qzn231uE9FcRZVtNqF02bEYjKl7kUk5HRR3tqXgLBppIyF683DuU56WXxbBH0aTpQcyNSNtS2zxTZ-Y6WcnlJ7iJ8m4VGr9_mX-fOzCqfT_8tCni8vZ2quoz-aYZaGz799eAGIlnuHvlA1lOnzbLHuixdTsnMmEo2Ou3NZDxJLx9vT1EgwhH3LBcFvBWJfIxfXaX09kiMks2d6u1N4CnEh7BoA', '2026-07-21 19:03:26', NULL);
INSERT INTO public.refresh_token VALUES (24, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJkZjRlOGNiOS0xYzliLTRkOGItYjE3MS0xYWViY2Q1ZDg1NzYiLCJleHAiOjE3ODQ2NTM1NTcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiM2MzMGI4OWQtMWE1Yy00MTk5LTkyYmQtYzU2NWMyY2JiNzhlIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTM1NTcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.aiXOZ8DbHYKLcPELBoew-925mmtuYO6FoyLh2j7CDPYNMufxAgpGZSXyVn6W3ahuIqvSSnDoBT7useTMfmqkjmiX-wcIU_FVKsslgAt5BHRxR-ThnhOKApVqMxYCK6d0vAcwW3uPU97WKZFmIOquLgz7CY--L8c5ytLDjSZ80f5sMt-n7PVRpD46ajfOvE9XT63orWSZZ3SfGk-xASwzsuFPhn8VKO-Gdod29917VqIEL88xtQleJDoyx7W7Rd4P9JmW2v2Vx-1b3aQyIttDSZB9iUEcX4Yj-mCE3IPGTZYExHxaDSI6cnaH9pnb_R1lMnwQiL0e0QdxT_26Q5Qwhw', '2026-07-21 19:05:57', NULL);
INSERT INTO public.refresh_token VALUES (25, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2NTFhNmU0ZS0yY2U3LTQ3M2ItYjdjOC02YTY1NDYzMDlhYjgiLCJleHAiOjE3ODQ2NTM4NzcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNDU1MzA1MWItZTA3YS00MTA4LTkyZWYtZDc1Njc5NjhhOTA3IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTM4NzcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.aBFU85Khx7P0qwvcXH-1d4c6hk04Fvtw_S4cznjOVJ8fzCxNonPsH9fn6F3Y28Eg5_OsYjaaTMEL6EccgbO0cG5pPJx_Yl4NUcdp9qwBpNBfB9SlfhbqAzXTJeyBsRgJVVnVKyVSU9hSQPgHitWYaY8_LNE1AroGaSuo2G4ohn0KbHnx6673r8t4-_svs2o579KtNTYklGP6Ajmkxm1joZ9aPicF0awblQlb6l3RLh8liCJ-y8G07l1NNm8tFe6s3H9lKWNWdLyjiSZ2-pFTzDPA714QDEyfLrlrx89v-L7X0I5fikWzsUIRtAYINREXyJpdAW1pm1iObRs6b0R4bQ', '2026-07-21 19:11:17', NULL);
INSERT INTO public.refresh_token VALUES (26, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJhZTIxOTIxMi1kZTg3LTQ2ZGMtODExMi00ZDMwYTUxZjliNmMiLCJleHAiOjE3ODQ2NTQ1NDEsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNzkzZTM4ZTQtZDE3NS00M2M3LWIyYTEtOGMzYjgyZDkzZTRlIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTQ1NDEsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Rjx_xqIRJIPlaWSFsvq9KECF2yq1NJW5GtURLb9rAVS5hzGZT5hO0R99d8Jw6W_WfUHft_WFREbdDPlPHzffkNB-XwluBZyU2_l3DxqYKwiRFQU_hzs6rTyeudWxHXUGHEkZxvG6GRj8KQdf3JLy5yQnPthOmKXD7Z7At-pIKW9m_a1Szbte_l_pzIhtUSYnmAgyQtevMqOAckE3WoM2JOrqO-Ug0jeBSfKMnVprcNlzsY2XvmproBITWPvWz8ScVtLSF3fyo5k4FXajZLF5oX6oCCezniXVeNTLNEAVQ8lshb-w5W8wCUjlI1qXIxK64n2-22b2JLAC-hRgx-ry4Q', '2026-07-21 19:22:21', NULL);
INSERT INTO public.refresh_token VALUES (27, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJmZTE5OGU2MS1kM2I4LTQ3ZGQtOWVjMy0yYzIxZTAwMGRhZWQiLCJleHAiOjE3ODQ2NTQ3OTAsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMzljODhmY2YtMTAwMy00MTgxLWFiNTgtZDczY2Y5YjcwMjM1IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTQ3OTAsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.NmzQ1YTV_sAurlG62WPNHYnMtle0zIRgUMTElE9gI0BMwFtCAWJV2E4_kgSm1-tY6NN6xrtTMicr1OYR9B_e2Y7FGW-eKE0DhxRvTEpLWaEhtiq9CxtnvleSHjUrFpDsAlCWrGzJBq6M4iukNn-OruNmvAmEO9Psi2PIs0wLFOyURPvl6CI2MDa_4IU6EmMoeyO-nhH6vPfLVgPQPCTekCqQVbZNpaO9MaznYUQ8-ecbADBQlaGjoePO7wsppFExiqshtadO_DMvYObfbrqn4nWZpYJGWm9clHxQ_eOTd7eEnjJuPOwwnqj4v4kWHG6zhe6XuPnNUQbPY2oLQcOw3Q', '2026-07-21 19:26:30', NULL);
INSERT INTO public.refresh_token VALUES (28, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI3ZjJiMzM4Mi02MzE1LTRmNWMtOWNlZS0wMTI3ZmFjMzIwZDMiLCJleHAiOjE3ODQ2NTY5MTgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiN2JhYWVjNzktNjlkNi00YTZjLWE1MjUtMDVlYzBhNzc1OGNkIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTY5MTgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Pf-gPRWFiq8vq5ovI1SoJs-uPqPZL_lZOrqP_sduVs1pRPi0LFdDxeeqScZXseLe7IhxmiFo4iIdink-t29MupucfBJ4Llih8lnkyH9sGd4Nafc8fC6BNfY3DU_sEzESCVzRW4ifh4GASD_2hOl1f-SLEBXWjYkLsWi-LlfrRH3ctaps1bpBcqoTIY-EsVe5R5Av2hJlQwpo_Pg1chMzZHnma-mRbqcL0azRP0FMUAcRNNqZlXE3wC_PYlzUOoLrCrcvZ07rwnGOpILjCU6EiSHBif-DJjmPJfme516Y0wPgyGzZWnhzomudhkL5irYFJeDxFs2pSWQ-S9C2ghPKUQ', '2026-07-21 20:01:58', NULL);
INSERT INTO public.refresh_token VALUES (29, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIwMzIzNDhhNC1iMjQ3LTRlNjAtOTI3OS1kMGRhMTkxZjU2NzgiLCJleHAiOjE3ODQ2NTY5NDYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNzY3NzAwYmMtZDRhYi00ZjBjLTlmNDUtYzU1YWUzMDQxZTVmIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTY5NDYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.X5zydsLQ4RydGxC8pVMS7G2x9kLK3wqRHFHIGvalE0LQ8yrHfEng30Dsd4XFR0eEErUhsolwSbRv5qnsOU1WGmYDP9htPDLPI3yRRWepIH0NXAUj2Iqcq2nRoL2zurOpO5nbXGwZLsRSOCwFlrKnuEvqikymGm2nvtCHUe8cxs4Lpk6av_TtHl__rTn_s2CLrMpSJmjQaf-6_uWXpOAj1omuE4wbKay6oyIXwY5TeJM7AHZhzG-7q_2OJuxMJQxOml0LlMawOTOejb4ztxFuEMrfAhQTovpvJKznn6bepPIUOaCwiAQfheR59WCht9H50t-aM0hbGqU2WEMQePLRPQ', '2026-07-21 20:02:26', NULL);
INSERT INTO public.refresh_token VALUES (30, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJiMWFiMzYwNS1iNWI4LTRiNGQtOTcyNS0xOTRjOTI3OTMxMjMiLCJleHAiOjE3ODQ2NTc0NjQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNDQyYmVlMTQtN2Q0OC00OGUwLTk1YzktMGVhNDFjNDM3NWU0IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTc0NjQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.DtirYtrBZfIIjvgDIN4K85W0Pj5eqgBNfUW2aqNkLkZU15X3wrZOjv9kyfsLwKkOw9oMERcdP2e5P_bPI6a-6VwNDxIwWS9-bgD-CgmQl50Zqkv6cbfTndBK1q135STF-mtoJMBeQgHYHKnGljTl9Xm_cIT8SBOj9vDAT-HPfeM8hf6iG5xyqVZkzjLcT297pkl9SW7UCjfdpBicytswpNkEgfRQx_p3yBZa7gs1vbV4Pg_m1RJjf4ZSZcVYPkX_Wt4JMrdmzkRwgCRMNe06G-k4FfzCrzwrR264RU122tLN3hu-d6op4E3tGDvCK2wIzMOGqv6JZWglyhu9OoyOBA', '2026-07-21 20:11:04', NULL);
INSERT INTO public.refresh_token VALUES (31, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI5OGU2NTBlYS1jMjYwLTRmNWQtOGNlOC00M2MzMjlmOGFlMWEiLCJleHAiOjE3ODQ2NTc2MjgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMTlmNzgxNTktOTY2My00NjkwLWFhZTAtZDA3OGY1MTk4YWRiIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NTc2MjgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.O5TBPWvA6shqxVkeu6i6BMxlKt4t1ixeQxj84-VuYx2Pl34GFyoYb_htAdToEkT85gL0qehpt8NbGX4FTXUdaQh0qRzf2HOJGTcfeT67LIkWg3lE3jfbTxp3QhVjQO2W_NKuxqwraVJjRQOZAfUhwfy3s1CPgTeO59VTR0FztIT4eJkaVtrEK8L22rrmHRhqq4kGX4TlKPHIJEGBWkPfdPaksknJsTVQYjsrygnQ4kmrcqpLIITSGC11EWsbobwZOa4TvVg5Ac54tZX26NKxlaBYE8E7W3p6ZRHll2NQzmA98JDfHd79ziR-KTnEmB9r8m_kl51q_mblgI270mCxIA', '2026-07-21 20:13:48', NULL);
INSERT INTO public.refresh_token VALUES (32, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJlOGI2MWE4Ni1iOWIzLTQ2ZTctOTFmOC1iMDc1ZTk1NjlhNGMiLCJleHAiOjE3ODQ2NjAyNTMsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiYWY4N2I2ZTQtM2Y4Ni00MWE5LWI4MDAtZDRjZjViODc4ODljIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjAyNTMsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.TCKrtggKuAd0HZjaSjlFRnSYMFAL6KijcJhl5iSGjqe5VtwsDrQTOEsLpwsjgJzNETglbh0VGMtJoAWeHU040KFxot2C8aIvZvXJi4SJmotOIim2i5ZPeIjaQS4YTADstGsPxit73_Y97dy8l1X0Mzw18iIvilXUTXBhACoREzjAh3GPV1cEA_WKMhTV51s70k5KLG4gBF7QWPLBJKXoufFH7p4PJdv0gUU4UrJJ2M_azrxVFKnDSYiLcjxpcI3QKEf8E2IBfXkzGq4AvRDr_9nrVBuKAiJ-USY5DcrtNzW-ak5etiMIAcNVa-7nBWX-DdLaaI0c_kLaqXL7aeVxNg', '2026-07-21 20:57:33', NULL);
INSERT INTO public.refresh_token VALUES (33, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI1N2EzMGI0My01OTc5LTQwNzMtOGFiOS00YzM3ZjBiZGUzYjciLCJleHAiOjE3ODQ2NjA5OTIsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMzI4YjhkYTctMGYwZC00YzMzLWE3MmEtMjNkM2Q2OGJmYWRjIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjA5OTIsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.HkKI9R8f4kyLlIgEWrDMYFrIqdXL_QZAFqsG8B6aTPNUwqMYhV-k6mSCF-Yp2K67wG0NEss19bpTNhcgatOxq-yM-oMD3wo1Y8m3qgnx8PF87W_bc1bCzgatED7GWtZgBhAzrHK_y0UoGoho9I0nu-Wsu1T6TpsgHG4CCMcY8Lp29JorEOHkE8h26N13Xs-qRbdNen_lattegO36BSVtCl_Rx-GAqbbn87APqf9NFtLJHYQksJvdV5lbskDn1GgpCst1Zr9_x9d-kjwp18P8nczgvMKiM3RR78rtzMS5a35G4JVHiPKjR296b7Me6MadcTmL-USKqDlFnYoJTiZfHA', '2026-07-21 21:09:52', NULL);
INSERT INTO public.refresh_token VALUES (34, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI4YzA1YjQyOS1jODA4LTQxNTMtOGNlZS1kYjFjZTMyN2E1YjEiLCJleHAiOjE3ODQ2NjIxNTksImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiY2Y5MDJkZTEtMWNjNy00NjM5LWJhOGEtOWYxMWY1NjIzODlkIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjIxNTksImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.SZrMMUIwQZx2Kw5IGE341Oqd6P_H10MnVzRuZmO6FhOHB7Ot1rjBJS9_7bHmuyeA16AVczKDGtHVMFUi1o-8W0RO_1ei614jUQpdYocx2sXgL2z7jGEFzPK448lZYjVnqTFxUAdvgKEizMkf0J5K3TpiFsKy-NQEB9E5WDJP6Z3UFOIRz3rkZ5_jua8QPj-DfnZ3U2xZJVvMjTvo_p8jL7DMCaHMO4QN431j54b9mSBxgDSR1S36TWKQiK3qQKVM13fo29ZvbHjzPXT5duFalKMMfSaVtB0i2u7-F6_XxzpyJvFFco3_biFzrWs7WSf6HE-H997Qdd1Ci4zffrEXuA', '2026-07-21 21:29:19', NULL);
INSERT INTO public.refresh_token VALUES (35, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI0MTAxYTgzYS1mMDg1LTRlZjAtODc2YS0xMmUyMjZkODk0ZmMiLCJleHAiOjE3ODQ2NjI4MTMsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZGQyZDVjNzgtNGVlNS00NzYxLWI4ZmItNzM2MDE0ZDIzODBhIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjI4MTMsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.KPISQ_qFnH8W2XZQIJtzdpKfXLn4PNMwpjSaneJfKW10fb0rsDEGL29KewDuA7FVrKPnmpU0hKaEFKjte8LY7MLk7usXDeS20fUxG47VPA-vdcPQiVYG4laDOeqh_gbGWac8hAPFzarhgdv2BFkluaBaHwjIcBGEIGKif3RAqlQbAl-oOgOAQFNe3WMn3Gn8tIoxPaPKAAM9PYsGlq18OGUXHBNnOyfJX_5_GQ9yo5h7yT_QtJbNIga0LiIOxXvV2J0jZ-9ABeA-N5FwOMX1Xbl5E_2tutEvecmojQkoYyPsVFSeJt5kzQ5Qug7a_Hl2sIsKIj9D7v4Fzi8U4puLiA', '2026-07-21 21:40:13', NULL);
INSERT INTO public.refresh_token VALUES (36, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJlYzNkYjVjMy0xMTJjLTRhNzAtYTE4Mi03MzdkYzc0YTZlOGYiLCJleHAiOjE3ODQ2NjM2MDMsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZjRjNmI0YzgtYTY0My00MjQ5LWIyYjQtYWQyMDk4MjhiOGFkIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjM2MDMsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.V3ZZEb6gaYc-6HNwFyuIO-sAOAcCOBGhL2mYOpIHowo-rCuKDu63KMr2PYqs8BCfXjoM_KBVQGImTwqQpFnS7NlnIK5f-Kna9I-PjpA_9RkGtyfdzeTH3ao2Qy9G8-zqoLgV1Gv_FR2GVo4z1tNxrr4Lf6fbNj7rGnylwslUECFr94IsqrPtQZOkmhGW-Mc1WFEoP2Z5pF9bnttApvlZBmStsRQ3sMNqJnRVfmcoqq9ime0cizYnD-SO7AScVMnQlMAKYeVqNnbwBoep2DuH9HK8B4HFZNVvMDLD0L4p7AZ1X9BXIbg1xaGynEfeX8BFCORHwj_ODEsNzPyQcE3xzA', '2026-07-21 21:53:23', NULL);
INSERT INTO public.refresh_token VALUES (37, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIzOWRjNmRhMC04ZDdjLTQ3NWQtYTY4YS1iZjg3MTgwZjgyMjEiLCJleHAiOjE3ODQ2NjQzODksImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNGIxMmYzOTEtZTljMi00ZTBhLTk2ZWUtYmIzMjdmMTI1YTFlIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjQzODksImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.EoBPErGQbTjgY_851kUFydu-DOQ_0ZHEZYSCjk7NQ_jNUXShFR-vvtw4C6AJuzS3Un0VA-84n_sDK2qJytgIATqnf2MlnUdS7oEEe9-kg9vlkEpSE9664w0Ob5xdpeV6wWlL6gHlA_UB_Wcem-R7P2qv5W21SqKxBaG8mZ9s0hGekhIkTdl0-S--I0Cb42NoB3fFlTHAAYvHnmNLuT1dIEPfuo_RvqmYzHjSgia0LE1EqjLwAC4oyeheWZb8F_Z0inEqTO_3V0oo1ooZ4LDQ7jIvuD30Yn7_iriQjNglx2gnvAHLViK2FZxVUSONP2tsf-fy5f3po3olJwoVKkRerA', '2026-07-21 22:06:29', NULL);
INSERT INTO public.refresh_token VALUES (38, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJlMWNmNGFkMS02MzVmLTQzN2YtODZkZS05ZmI0NDFiMWNiNDQiLCJleHAiOjE3ODQ2NjU2NTMsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZTYzZDI3N2EtYWY0Mi00N2U2LTljMWUtYWRmZDdiN2ZlMTliIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjU2NTMsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.ELyKB7Y_nSmq19x4NR0Li6uXShS8wgM9nGOKPScaQla6f30_Nxv_MAKLlviCdfy6bBZGahEdIdsqOhukjDhJdjXW8PL7krEHY1EloG-dvdomAIsiPbckuigYGBYy06kPUCG72jEfVnuKVwTahNFhvKNNcNn5yjoVdOG9ZfjuQpK3JskzE-kIOwzFPbYu4flYXs04vJusfqWU5KNneP3-ow4TlvkiT2WjoHB_0w1LeaCM6ryWPXotJl-6Z65SF58rX8kxWBq9TZOlG--1tmTVkr3UWTTi13zzsJeUhScOx6EmwA36GUL8sZkfURhIE1iEk8Y5oxNUqC-JnfffNlXl9g', '2026-07-21 22:27:33', NULL);
INSERT INTO public.refresh_token VALUES (39, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJmNjVjMmM2Zi05M2FiLTRlNDAtOWZlMC1mZjQ3NmFkMjY0YmQiLCJleHAiOjE3ODQ2NjYwMzQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNTIzYzQ3ZmYtOWVjZi00NWY0LTg4MmEtZmE4YjA1M2E0NGNkIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjYwMzQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.LGw1F3PmI_zv0WiOUIlA3v8xV8N3isaLbdeN6H8V9ebKAtSYENKZeBW8VS7gSTuwsXS1cUHbHtEbgiFZHmC4SHL7DAIMGRuU32UXlCFsA0jRXpfj1v4fzB2pIj-X2EamwAa5jqok4t4MkNX2J44VsQAQCwfjnYMILnmvPEwO0hqd85mPSYv8YLFPkAuYmzbuvD_eEyZSFpc4OXCUN3lKOicLJyhk0FzvFCCObBNR8iMA-_Z6eF5rtsoLeTdN0CIjmuPc8dYPstt0QyTb-YXLPoX0R7FOFxg77VK5XGOYtfwXkpKzi3Wx1ItM6Yz03Pwcf8UQniG9CtRLxmZt_N_f0w', '2026-07-21 22:33:54', NULL);
INSERT INTO public.refresh_token VALUES (40, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIwNzI5NWEwYy04MWUzLTQ0OWEtYmI2Ni03YjlhNzNkMDJjNzgiLCJleHAiOjE3ODQ2NjY3ODAsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZjRkOWQzYzQtZjliMy00MTAxLThiOWQtYmY2MDgzZWU1NDJmIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjY3ODAsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.RUP7rYjdzqTdJIrU0bkVT1OGrwwbCZjqzWysxiQkh5paWVzKsY1IbSoA_6RhG13M1_A4NiJ5YMe0_wUuZhNhrb1YaokTzjbOs1lUmbBmkz5ZFMZMBkRRXqlrBdadkvzdJ3I1-97lVYNPBta6RHqa-UkwO7uUmD7-E_zLRrUjaZMOnvoORTeFnq2wM9AeGKMCTZpwVI1pRFBi-nRE06Sy7RNxTU6eHbxU7fzqBZRbICQTvSxkAx_5iIPHJPvHJJMDh9NrL-rzWvVov-ahejjHYAdXgYjWSkujpbY07KlJZxDO7hMXjVH_b41TnpyUz9t_gZ356KhA5lglxTBM4c0tDw', '2026-07-21 22:46:20', NULL);
INSERT INTO public.refresh_token VALUES (41, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI4ZmRlOGM4Ni0yNmRhLTRlMDctOWM2Ni1jOGY1YTY1ZjQ5NTYiLCJleHAiOjE3ODQ2Njc4OTQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZGExMjA2YjQtOTZlNC00ZTdlLWIwMWItYWI1ZWZkMzM4NDA2IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njc4OTQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.CHZo5Vpx9cSiEzRgPNG1GpBXlD-sxdBk1A8XOn6xGJksTwdwTA-S7f66q6dJlm64S23BlhQ8yRWGEb3z3pqJx46vx1m5QFzmFiiBKMmIbrkkkGtDopOQczM964t94fDokFzESUeE8aDiT257_XhECgi6VoU6UoPByH8224ThHpx6bJofZiMGsafRfDdrfyk9NG_teDzg-MPT7bjjhnVD5DjzCuLGnonyW1pc61e7t7fd_1lq049lyndR87-JoqRpX3dXXhq0STa3VtLJVvcmpMR-7m4BqcFetc3VHLgzVGoccPlvbE-DqXqHIJ5lHIUSDJy6MMU1VYhP4ysUBrP8qw', '2026-07-21 23:04:54', NULL);
INSERT INTO public.refresh_token VALUES (42, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJmYzZjMmE0Mi01NmQ2LTQ0ZGMtYmYzNC05ODA2ZWM2OTk3N2YiLCJleHAiOjE3ODQ2Njc5MTUsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMzYzNmVlYmEtNGZkYi00ZDgyLTk0YmItNTMwYjc3NzBjNzU2IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njc5MTUsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.LNSQLNfV0kLYINETEU1ci7mG-jUwljGzeM7J_gN1PZDwnnpRhXZWenkjpkOAARxIQZaW2OI4529D5dX-MXtEA4K6Po53rNguMp3QjduperqrIMohXocDOqM7_ghMIaN3-cm7G5Z0JsNmUlcI-XKNUtAL6y0drR8bDgx7_FhLZ3R0XuOb4tW02-DqFKMpxE9lm8b72JQK-avjae2ikuaaCiGJCdXaqv7Lcd-wlQppdwsS9Nicw2I8CIInAwFhVUmqc-mfP__BfggPQv1p0y33QPqLKOENw1gBd4rUS6Y74SLP5KZjMON8-NnMQuf56hkgG3x_ZtwMDVyXAlCNDPyNlw', '2026-07-21 23:05:15', NULL);
INSERT INTO public.refresh_token VALUES (43, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJkNTQ0N2Q1Mi04ZTU1LTQ4YWItYWY5Zi1lNzhjZWQ4NzYzYjkiLCJleHAiOjE3ODQ2Njc5NTksImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZWUzYjczMTktYmMxZS00MWJlLTk5N2UtM2JjODcyYjlmYTMyIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njc5NTksImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.B-76LgeqSjR-E9VbvIsOxxXTCEqjlmwv1RhJAH70grdSKARed9ByrZjsC_k0-2XemXSKbSWyVZALTgXPmSRAAEJff52qYX8x3r8fe1jWajOJDIgwgLn19r6ZeL6u0Z53IgVol3uvLXXUq-FAEyS1VhaYFq19zs3UzYz5qJFnJGbywMipJwvPmz7vEP_-fTwxo7_ExynkoIGI-4yCb9QZCaLuahXp0LGDjDoxldt2_--qHRnpK8eqR4LclTo_EGe9enE_ocDsThSRuonBJDtV7Ma21sj2Hr893GxrxZF9efturjo38YOSpZk86SuqSkul9txXK0oH21Zzn28IRVNxyQ', '2026-07-21 23:05:59', NULL);
INSERT INTO public.refresh_token VALUES (44, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2ZjBjMDYyMC1mMDdiLTQ2NDEtYmMwMi00ZjVmZDY4YjNkYmMiLCJleHAiOjE3ODQ2Njc5ODMsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNDNlNjkwMTgtYjRiYy00ZjNjLTg0OTEtMzk1MWIyMDczNjBlIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njc5ODMsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.L49fvra-x0uUCOTqHRp0KUOXzTB5L7XDLrNdPq3O-fiaZQJa1Zd-PRxQVuOO2xK2waZ7ffVTKMGawyCucuusJdfTJM3gyEnL9WNFAQym5wd0URn4wFtqq9lI7oRyjEVSxoABe3BMWU0L7j9lunbNKBQXjnOEX8vqz_qXiEHh00r4tY6R4Kj5FgOx5HbBhSWbR_OMgQ6Etb00Mkg5lfcM_8K7kSVriXjUlsowENlE03Ii8aUzGH1GFdy6EkCzfWQa8q9IELxwdgd2O9ODJWloxQ8vV8kt4QxelB8Youxbq6e6xuqhfkjz27MmtAIB2Zvtedkr8VDgZVbO3xGrFf8cYg', '2026-07-21 23:06:23', NULL);
INSERT INTO public.refresh_token VALUES (45, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2NDAwODc0ZS1kMDEwLTQ4OWEtYjgyYy00MmFmZWM0NTFlMWEiLCJleHAiOjE3ODQ2Njg1OTQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZTk2ZDNlMzEtNWEyOC00Nzk0LWJlOWUtZjYxYzhhMDJiZTdkIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njg1OTQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.GI5yHdBkYpyBuToqWB32CN_0p1e5BA3rRwcenAC9OtrxRm59_asDoBHEbR4OKNyBxtWhs4-k1PtVgaZBpfLwHHmXg4896dS8j1nuS-kF7MqLmCeNVsxzRIJc26TRrwZl6BBsWBL9yS8yR_F-8JP4ntY-J3suNhVsIqDWSONmAIHIzZjpREHlt_bpmw5M6L2tyEcFBmuSQ6WAwM22juAa_XhMOBmbdLgj1iwYVPoeUDFLHtc_Jb0YZMy3XaraSW5Ak9CcqiCQ5Lbo4MpNsQ3IEikN3-7iax3T8iB0lk1iTDQNx4VUFA4GL8WwXqYMj5xc2ppiBnRvTadiUs8wMtGwMA', '2026-07-21 23:16:34', NULL);
INSERT INTO public.refresh_token VALUES (46, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI5Njk0ZWVkYi0yNDlkLTRhZTQtYjk5YS00YmE1NjNlZjE0YjIiLCJleHAiOjE3ODQ2Njg4MzQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNDIxMGU3MDItZDBmYi00Y2VlLWE3NjYtMDJmOWQwOTA2NjZlIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njg4MzQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.UYMAQY03vzCXuYdd5CP3cebLQiT8xIkQfmqYIKfX_Oxd6or8fasBWKXYQfggKO0zNH5j87PpYCBdl7NSmM_To3jssH5lDb-4lDvdvL3BSq1IFxObwWaGtx2T_e_nL1OIYI6U8-AjJSvBc7w0ykqKXJMs4JSqcmAGpTkrrxaej0A2E0k0t229vqW0ZzvEuxqOowxcXQpQj6kDWbhzCt0iAziX1spF085ClHnKinMaJjBMdQD3EuoEx0e_Up8vfbdeMQ791QqEYcYYRUM7XT_iOBd-gHo-F-ClAzGoL2I8wAsb6AGGifLf8siYpeFvbM_hGNNw22IvVG1FIRIssKnOsg', '2026-07-21 23:20:34', NULL);
INSERT INTO public.refresh_token VALUES (47, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI3NDVlMzk0OS02ODllLTRhNmQtOWE2Yy02NGJiNDJiMTc1MmIiLCJleHAiOjE3ODQ2Njg5MzcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiM2M1YzJhMTEtMDkxMS00ZWQ1LTg2MmUtYmQ1NDk0ZmJjMTU5IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njg5MzcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.JX4tHJKCm_HCYDvens5_pv21NLHDE5ne3at8vtLQVL4iufpeM2k0kXz5LchaTogP3_2iYDniAp5Z-0PGfhLL5h6avR9ldezp7depAtLYrIoIP5wqLp5yVO352p8h4owOVPvyEVQza9JyvppFVdTPbDfFJIwXpcPHs1VE-CHSl3hMscnrwrdzJBfD_crkNoKYStN7sEZQDc9QKr1EddZQIr7rljJEU_djDuvAAF489izeCPQvbzMJeua93xCQ_SP0w8acJYkXj27AZ8EjihdfLKXHHXAgbMgU8B_8sTe3jaHhkH7TriXzvNcBI7gPf5gBMzpoCwVa4pYiI2X3oiqxYg', '2026-07-21 23:22:17', NULL);
INSERT INTO public.refresh_token VALUES (48, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJlZDY4YjU3MC1jODMwLTRjOGQtYjJkZC1lYzA0NjY3ZjMxOGYiLCJleHAiOjE3ODQ2NjkzMDcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiYjY2NGVkN2QtYWU3NS00YzEzLWEyOTEtNDI2YWU0NTc0Zjg2IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NjkzMDcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.CfUx0-oTQ7p3qL85RxcsPQ4qcUCxJh7XZjIUrcK02Cg2MtfrOvgolp_KUGN-ZzrWDgBqTC1F9QSIe5HuDj5Rfn_9Puskj-DYTIkyCKuMiWpJly1aMSSP7xtxhx7Ob1UO9bFcnjGawBkp4yk6ihCz2h_GtUjTD3U410BmMNpB1Ra2U0gNGN1E-BWByy11v3zugOmSTcxjyWNwLxMfQSsYxJVPlYUfJ67kt6kEc_6EplTN82V-F8c9dhfv_Zxtk_7-UKXA4ALlvCROM-wG3msIJZRhL7EtDYby3YUaGb3Ut_b40CJJFu0xvqF8_MtlDxGSPITm4HR_3HkJddt8Kl3AIg', '2026-07-21 23:28:27', NULL);
INSERT INTO public.refresh_token VALUES (49, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJmNThmNzIxYi0xODQyLTRjNGYtOGNmZS00YjM0OGRlYWNlNjYiLCJleHAiOjE3ODQ2Njk1MDEsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZmIwNDcxN2UtNzQwNi00YzFhLWFiZGItMjM1NDkxOWQ5ODYyIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2Njk1MDEsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.ZOq6WGdb3E3beXmiocmTexqjJOBFGXZzNHZ-Rz7Q229TVLgriMLFt4A-tqh_Myc8pEO_f94Yac63DZTQdu7srfUEKSwfa4S13vGdcy5DU8nBi1VKZER0SDV8RWOm1rOjl6jEKWoBH08Git7BYOn5H43H28HyrSTRLDBsAtoZJC-kZxLAkRy1bhz2HWugk5u8lC33jZ3R8QBDbD9cpDkXwerXc0TxEvmtT36MVvZCn2QCcbifch7zvSX3ALrRJnn6-gzmjNBj0c-11OJ7Doc-950D-AVPaMO91AEwf7bn5PmiBvrJWtBV0BwjxxuXpxMWG30SFkqoOIGlHS4RYthZBA', '2026-07-21 23:31:41', NULL);
INSERT INTO public.refresh_token VALUES (50, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI3OTYzZDMzMC04OTFhLTRkNWQtYTU3My1iYTEyMTEyZWQ0ZmIiLCJleHAiOjE3ODQ2NzAwNTQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMDE1Mzc3OGMtY2UxMi00ZWYwLWE5ZTctZWMyNjA3MzljMGQ5IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NzAwNTQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.M2_4TyfIZ5fKfmzazz07XzuY5uedyWrmeBLsj3EMSGJpb7jHAeVg1GjfYLUwdz8DllrmzslZwd6egeyD0fRnso75K3-kDgaZnpQeOyuYh2jeFZ5HNGLyjKWdatH6zk4jpY66XzVZTH5tfWlaMbH6NwxIcLidAcV800LHfYxTiKFWNvcqAc8Wc6O1cG3HMv9jSylhX-6qYM4Dy1Bm2M6lQxYDTXx4zpGVn5UZjnSi_vfE-NsHepH3HzkvTo9MT_QhcMgzyj8lwAd2MIWiJwUKoeZ-nvDnPfTXWZ-Z6td08ySpACoRFEuS7jUKK4IcnHaDpqL8Kevlu44LIytFERCQ6g', '2026-07-21 23:40:54', NULL);
INSERT INTO public.refresh_token VALUES (51, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2Nzc3NTI2NS05ZmIxLTQ1YzEtOGQ0Zi0wMTUzMGE0MTEwNWYiLCJleHAiOjE3ODQ2NzA2MzgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNWFkYjRlMDktNzY2Yy00MTM2LTgwNzAtNWI2OGMzOWIzNmI1IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NzA2MzgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.W_9XXtgj_WUCDgDzYGXCtNbnFM-0YSRZKnfEMOYHj1A8JPdkU89Zy9In44kM_nZnr8ODf6T-aiCRqJS-wfc2XlS7QyhfUIOLB7N90Ypu-UD6WkEhaTRGEGbWnBo5yVIUCP8_T5IERcjE_qvQniDynYQVUXOM8w8jkG5f0-hXWzwopIwVBLvfrAw3dvQfwV_XvfczEz4sS0UivYZOqiwsv9-G4vfmXjcuYOMvFWZngxVMGOg5XUczANOsh8vdUU_h43gehvJqjluQO1V1nJ8TmcLrxZSVBqOf7zzEOpKxyvQHoJQSgTdyZVeLtK51L3TABS1qLqsSTCD3Bwbe903Gqg', '2026-07-21 23:50:38', NULL);
INSERT INTO public.refresh_token VALUES (52, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI4MWFhY2I4OS1hOGQ4LTQzZGEtYWYxMC01ZDE5ZWRiODY0MTAiLCJleHAiOjE3ODQ2NzE1MzIsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMDM3YWUwMTYtNjNjNy00ZDUyLWJiMDYtMGZiYjBlMWM0NTBmIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NzE1MzIsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.NQhUpNiPk7lVRzE3foLNxwHc03rLv7q5t3zIg-jZGsyftLp7Db2V6CruJXkDUJ5Wm18Z_zKoH6t8GrkA4JhVX9atefLV1H6TfaAU6E6g6biYLp7uG_IA3VW0QQwl1MZmeOnNgJ6XhZKp9PHXarEmGVv0J6nuaisxKkKiVFU0O6tdIhayTY9xTnEF3AhMp5E-VN31fqIVRh9LHbsWqKnWhzhQ23t-UfwCv3CHDBJSz_HF0gJutAAilMmPj8obTMVACpS5f7OVlHqMzendTN5SurKBJeegdaLMADoY6FrFQJyhl57urpkF5H36gX3dIxUlpilQ6KG-6-E2OnJMASwp6g', '2026-07-22 00:05:32', NULL);
INSERT INTO public.refresh_token VALUES (53, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJhZWRmZGYzMi0xY2M3LTQxNGQtOWRhNi05ZTVjMGEyM2UxYzkiLCJleHAiOjE3ODQ2NzIwMDgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiY2I3OWNiMjEtOWYzNi00ODljLWEwYmYtYWNhM2EyMzhjM2ZmIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NzIwMDgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.fefI0uZ_GsuW2nV25aUtrPUVbAzXRf5GC4tq8ueblmQ5v8wr47fIj_zxxj3jTIjLprOQBI-6C0ErQuimA7SKQtGMac81tiJRvbyMzENUNzLD96HOWAnGnL-pfr4MI-LpMoVgq4tm2kgPRpfqMOPFZMoT4QazKwDOP80dhSp2R7C1yabba1WeUq5bUs-lTXeIW1ogK8dDNi_beEJfXW0DhBI1emX8ZHTeAlVG6wEqoWAURFGCwg6LkR2b2a5eJ_KZiNnfxdkFNXJ1yQB0glqpf9UlB_AdVq8HNHQo06KwCg2AnFDziyOm-qrxeoLxuwLxVwn3LM1HNqjVkQJA_GuKXQ', '2026-07-22 00:13:28', NULL);
INSERT INTO public.refresh_token VALUES (54, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2MGUyOTIyMS1lMTk2LTRiZTEtOTM3MS0yYTkxYTBhZTE4NWUiLCJleHAiOjE3ODQ2NzIzNTUsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZTk0NmJlZWYtY2VjMi00Mjc2LWIzY2EtYTE0MmRmNzIxYjMzIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ2NzIzNTUsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.ZxIpdXRC_Yk2sqbogAEASKj2-cvKlzE73ytwdfQMhz9dBJNJeNQEjny2XRlFPt0CM5p3lPhF2bsPznekNf3RiDxtcwD1bUvB9FmT0ni8Gw5HddrG-1wnKbHM3Ne6IA1vSt0KPctg_Cndyg0FPFBE0XnQO0dI3x3xzMOOGSLgC7HqFwOn0QMkf8obMGBF3_guy6mh0mfjDnI18iM2lqxieuku2xtIquERKX4lpa-Ki810umAzrIYmzxMUkxrS1-ByxEv64Balhmnn9CqjkGcaGq66j4vhKL_gHzCr7LscsfQPLPgYcyAWULyO4T5dUWtdpDs04ywBmzWMuJE643nXTQ', '2026-07-22 00:19:15', NULL);
INSERT INTO public.refresh_token VALUES (55, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJmZGI5MjNmMS0yOThiLTQwOTUtOGZjMy1jYzM3NTUxOTQyMTEiLCJleHAiOjE3ODQ3MDY1MTUsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNDUwNjI2YTctMDkxNS00ZTZkLWE3NTYtYTkyNjQ2YzliMzI4IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3MDY1MTUsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Y6IpBM8p_oLdIkBSMBtwvbuFt4Fcfx0rE8nTSCEUcPpt8Lc7chAT-E-3NL7-fIbi3CPO6tB1V-M_m3NES_3T6ELN8H6dz6pEizVqFYgaDV7fUXyIaCDGOLx79klF-rHhkmhG_ufYJYw3YXzMu7BN_SG4lF75_dGT6FdWziPK41wrhn7QIx3BkugRVK-ZQElzvbKqpe0rxSRO96UpbGOKSDuVPAnUbOPuyWUnE8ZTbHmRf8zcSJjwEoL1DDAUZIwWfivdNqO8d4uIDW3_0p0RAoy9ALavmrKC9SJrfgJoLCzn2T_Q0Y6p62Ir7l1tYejvP6ljdZRM8b2PWcvdVTSMMA', '2026-07-22 09:48:35', NULL);
INSERT INTO public.refresh_token VALUES (56, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI5ZjdmOTQ1My1jNWVhLTQwZmUtODRjMi02MzZjOWYzN2IzMTYiLCJleHAiOjE3ODQ3MDY2MjcsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZjMxMTJkYmYtZDk3Ni00NWJjLTg4YzUtNTY4M2U5ZWMzNzcxIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3MDY2MjcsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.YU4j0SQHr0DS1QdYndXYW2G1GieQRAi5fJhs5PSLXlff_b6yGMXGu3orsdaFsLuJD5bSGtWALCgGZFCyiMW4IwxiI6dG06skKY2eK2PZClcJQL2gPprdFogT_BkdwCgWh--JkrwWbVGQ56bq1kNTdBYGIqxpgxFTOnUHmZinDf1y428SJCGf7-6oFTDpKbZUL57JlIQ7jix3-PRVkQ_DJ6iQcyDXOtRzAP7WEU0-CTAcU86eWPPPNTqgEdDQVfOqGuvZnucb4pXDm98sfm1pxb9UmlsZN5nz3lNZy_md817MHbZE1VH8bBzIZXlIzKZrZu7ahHWzygjjS5z3gK57nA', '2026-07-22 09:50:27', NULL);
INSERT INTO public.refresh_token VALUES (57, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIyYzhjN2QyNi1kZWQ5LTQ0NjktYTU2MS1jMzhjMzdmOWY2ZjciLCJleHAiOjE3ODQ3MzcxODQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNjA1ZTZmZTItOTBlNi00YzIwLTk4M2QtYTQ0YzcxOWE0MWE5IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3MzcxODQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.KNv1BonyO9yHiT-POfyvxEjEupl11J7U5mgcmcjAMOiRZA4Ghf1p_04qgpz4G7yuffG7urRGmPjelb3KHvM52H6AOAvwc3KGleB3zY_fQTEPSV1OZs_zFC1-G5qgachPt8FU1LsAhw0qOwAtUKbp3XgD0wVxxciSrMX1TXtg7yC4WolxCToxZORUoVJZiCEK29d8fge28NDqJv2O8o-rysAEJLTNO434zCAYkkDrqokKlCuAANiyrikUVPStbjrZr5lSru-5qIBF9RmZPr92NlU6tzH7JfFvA44JOaKo0j96VvrXewoeHBG-Gho1cecLeS5B6E5coiTupxQuAy9x3Q', '2026-07-22 18:19:44', NULL);
INSERT INTO public.refresh_token VALUES (58, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJlMGRjMzA3OC0yYjE1LTQ3ZmQtYjEwNi0xZmUzNDUyMzliYzMiLCJleHAiOjE3ODQ3Mzc0MDgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiYWFiZGM1YzctODgyYS00MDQzLWIyY2QtNjg1MmRlYzI3NjE2IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3Mzc0MDgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.OJDLGSwoty5NS6zscpUimC773_RKYJ0gmM0UT8leLxd5eknnm82yD2SQsvhHNzgw1w4Y6RHekN9Kd6eVvkVCXpsTZLpVdSTGO2mcZKYdXDX-uZC_YvYXMLHx1eqgLWQ3I2IQe4lcVm7GUo_Xov8pXFr6CB2y3HB9umN4OcXia4FjTDltgxDB6RpxaCeV114R8eLNFJI-V5eM80hmhjQuj2oMr1ZZeCjWx5fNmZrgCGU2MBYTbksw4wXyNoLwjWMTKFWPtHPACyOH2LRDnMAxWAf5_kg3bt14PZqf_DKNzs1aPok-5gQISCcUHH5M9nh9vOLIBrMVSKIUfJ0NIhj19g', '2026-07-22 18:23:28', NULL);
INSERT INTO public.refresh_token VALUES (59, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJiYWQ4NDFhOS1lZTAwLTQwOWItYmI0NC03ZDQ4ZTM4ZWViMDkiLCJleHAiOjE3ODQ3NDczOTAsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZjMzYzM1ZDYtZjZjNy00ZWJhLTliZTEtNzVkMjBhYmM4NzhjIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NDczOTAsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.DGWMEYHbQ2FokvSF4mlrspvy3TMLOBPArsQlKNFVvZtqLqCBo-E2E4x_9hwNA0OYQ85c9J1Wuy5QSyt9c5CXCBrVErB455mgbJs_REt6iTNzKALbpVGGiTbDWW5YkDbDmQtv5I3oTG3RVgAbWmTK2WNn00_hS5WYVvyU3zrj6mQagNnus-GilL1VZdH86o-mXh9tpS35SmGnWDaFqlnkUuvepzcMlBk54a7Of2PR6FZWoaPK_qoRuV-rxIQkF_rX1rQ3iiCT906qyBM5HbYmO4QNLHF_8gSEZxRdj-4sOfOgNJhvYn1f0s7BESOiwM6HUR4yY0u8NIouBvFxsZ97FQ', '2026-07-22 21:09:50', NULL);
INSERT INTO public.refresh_token VALUES (60, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJhZjVkM2ZjMS1jZThmLTQyZDgtYmRhNS1kNDA1YThjYzg2ZTgiLCJleHAiOjE3ODQ3NDgzOTAsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNWEwMDExMmEtYjI1MC00YTY2LThiYjMtZjg3ZDhhYjI1YjYyIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NDgzOTAsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.FDc1gkTaHZUoY77RS11-HhYzZqP0MHeA6S7o0Ey0DFz4ll4ulS2MrXcR2SVdslcDhR3EC7nW0L3ih4Cegao_9bVJjLol7M_43x0ktrMZfGiHJg4OZnH-TnZajTzuvHnQThFrUBjq2kdAwdhRkqr42LDSSq570tcXw2gEzVtBVbRZSbPpAzSfUiltRFArLQ-_-YnqsnLfAbCwgqTrJPwE2_dqxE9AlnKV9mNRGFJ0yGVQB_SaJodh7w9iqgb64yod8IPrTcM7ogY3ziQA4radrtV2OnLWRYpyUE_mVmoejMFsuICPoUvyoH_rqyTy7kYCIZQy52jiOXPD7WuzddAPwQ', '2026-07-22 21:26:30', NULL);
INSERT INTO public.refresh_token VALUES (61, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJiYWNlMGVmZC02NmNkLTQ5NTItOTlkNS1mYzAzMzkxYjZjZmMiLCJleHAiOjE3ODQ3NDg5NTgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZDAzN2JkMDMtNWE3Yi00NDg2LTlhOTQtOWIxMDY4YWM2NzYyIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NDg5NTgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.NIltb3M68XHUJrL27cP95UWW4MqLRGab3x29cMo0U4e9YmMlQOpjEutSQngZSCym-Fct1pggLKII8qgZ-h1YA0Ouyz1h3WAQt8dxxesscs7tqpz_FFgh7FygmDMS_Wb0RREU8p2XqkElJukpY-DK8nlLb9m9oArn-J6wL0KvBGGhmpDt0BUcSjpU9738LT8Ng9ZZjCVjplFOqRZZ6NPr1yvHTx6T5Te5hH1IpHs78wZ23C_Uq8sxaZhDpDeAtI6xbPKHj7QlPHd6SlaoM0Pxp34Fb-_hiAhsLfCjsAtEKahEPozjIE9VuCJP_jS48tvoggA6wbGQSa9XVSmXssZIjA', '2026-07-22 21:35:58', NULL);
INSERT INTO public.refresh_token VALUES (62, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI4N2JlYmZiMi0zMjVhLTQwZjItODI2NC1iNDVhNmQxZWFhMTQiLCJleHAiOjE3ODQ3NTAwNjIsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZjgxYzZmZGYtNGExOS00ZWQ4LTlhMTUtMGZhODQ3MGQ4ZjNiIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTAwNjIsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Y0VExnjso_OPI3OIkJPe03PtqZeTnsrp0psV_D019dzWp-aCYPZwwWKd7uekyoXJoc5xv9tpdBJXom2GuR98ahhr-F78xXcbFE5-iMsfzonZAPMYeClXMCtnl3kMDLjsHAmgLTu2UZlcYI4ZTfb9gWtzMRyyRNwBVcSo-tCKGrU6HOuW97ij0BnydfPwM7jj4SF9pcn3rNpBdz3Y39l_ahCHvWjAE6wx_upuFho1XiCBpDTVgVC3gZoizF2-_uMIsr5w2jgeGpWnOenva0loO-m926N5rtvfmDvu2ZZrDXRPld3XB1Hp8aGs_kLuDJseVJD-ZtCBBXSEik2Q_8YzSg', '2026-07-22 21:54:22', NULL);
INSERT INTO public.refresh_token VALUES (63, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI0MjQ4ODAxNy02ZjM4LTQ3MDMtYmFkZS1lMWU4MTI3OGJlNjQiLCJleHAiOjE3ODQ3NTE2MjMsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZmY5Y2M4MDktMmM1OS00NmJiLTk3MGItMTlhOWRiNzRiMmJkIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTE2MjMsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.eSdpNM52nwcdV74cTB85fmb4rkQbUG2yrshVXbV3ZQ7Ae4o3wFs1KS0ELVKAHyjkXdh48cqbYCS5McGsYeKkNGZUCbFi4A9_kcFao-Nc3fbCkNNo1S7CKijkdIgKYe0tERG8c8m34mPSSz2J_cYy4RbVuh4Kc9Y0EY7X4KU458Mp_SIZLAgPBLzAxUlLpdq9AOBFIwLXjtFL4a102ND2DfeBaqXFzwNVdtLBg_j7tejnKx6Mu-GCBOuurE38jQJYh-h6BWn3iLqY_WYBiBWIlH1ftNtHn-OnFtiAH2J1arnSf9QXzSVfaH0WDO023XeRPd3nX9dn3_01B2aeNpUy0A', '2026-07-22 22:20:23', NULL);
INSERT INTO public.refresh_token VALUES (64, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJlOTkwYjY1Yi00M2MxLTRiMzYtOGIzMC1kN2FlODc2NzI5MjAiLCJleHAiOjE3ODQ3NTIzODYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMjgwZTU0MWItZGU1NS00OGQ4LWFjYmYtNzBiOTBiYTI1MzgzIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTIzODYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.fKohHMfwAL7mz2w8U6EaIMka4xeZ8v-ub3pZ00miQyacSQRYGstU2uR-TBb7GcZkU0iU7XM1re_8VfT148uSXfLwZPzcL_WcWMzN6tHt1WNc2_fn2-qr17-LkvDPhJdLOlIa-RF6fxL3ybKReP-HltdB7oaq8xhX0P4QK0sqWk6bL8SsOSl1g62Q0pgSPAXAjh6pagohMhLrbdOsH_5GXrhkt1pM0-yvgHXvA2hTOFlhlCW5dx1b3MTGgU9vDRv7BUAB__Vw6WAAySU8yLx0L4AJtMjmHJ2n87gU_EmCTqbdugKf8HMltHWNL2vbnK26f3OrFz5C_hdOqXC8SgdxWA', '2026-07-22 22:33:06', NULL);
INSERT INTO public.refresh_token VALUES (65, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIwNmI3MzBkZi04YzIzLTRjZGItOTVjOC05OTc4NDI3ZmJkNjEiLCJleHAiOjE3ODQ3NTI3NzEsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiYzJmMTI0NjQtNWJmYS00ZjIwLWE4NWEtYzZhZjkzNzkwYjkxIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTI3NzEsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.DrN9Uu6v1gSo2Wg_LvqPcwrzw1OPcy57JhVxKhRHMsnF1QApUDd3TBA33W0aBjDTMYMoQNuqXGBcvOlTK26WuNa84U9Cy1Nc0lmiZb6HJkQcFwavXMx4ZdfDnqk51jFBhZs0dX2pjfOBN95KmG1DN7aQzNLvn204AsbxS4BltG_CeK97sVzrwwQCDdfq6PZpufRFv9N0FJdJV535tdUCZhGvw9eekFrElbc6-2kzqQGMGJ9u00PaUD04kofS80f-H4gnLzoqVBmxrPBu5tHaOEA_zSh39u--vjnQ20wEdxP4uhVn2auYs5rB9CdRB9sHeXtEwofl8CT9eLvcQxf_1w', '2026-07-22 22:39:31', NULL);
INSERT INTO public.refresh_token VALUES (66, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI2MTBlZmY1NC1iM2FhLTQ1MTEtYmY5Ni1jNDhiOGM3NTkwMmYiLCJleHAiOjE3ODQ3NTI5NTYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNDAwMDEwNjYtOTFhZC00ODE4LTgzYzUtZGQ0MGZlMzVjYTdmIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTI5NTYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.AiL8wTFbKABqallIR9VmiAjgQ31pTbNXA3dECwZ6x1BTmA-OMWggJn06RzeucrxY5gKjwlnci5HQctzutLbdkxk-YFniT7n5gS4VZvLC20eQdYJN5hprwBmYtU_pWgzT-la3iO-nWnOsfRiI1Eux3LmgJ86LTv8X3Ue__Be8BqmGDFwBWocIUwT3StDeSHqaX3BfCJB8918hyZXYwNO22mBwMcXvvRiwoNEzOEwsPl0y40_Kw6DdrhRN4aRwc2ZJVDhC742osBv55BAw4yeUmU9R8Z5rpF7J9mcB9PLx7trtpdz-IGODqfq2z8W-ydZUfP-m8EUG2Vv0al4LzLE3CQ', '2026-07-22 22:42:36', NULL);
INSERT INTO public.refresh_token VALUES (67, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIzMDY3NzY5MC1mMmY3LTQwY2QtYmQ3ZS1kNGE2ZTBkZTFkYzciLCJleHAiOjE3ODQ3NTM3NTgsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiODhkMWI3NmYtNmQxZS00ZjllLWFhNjktNzhlMjg1OGFlMWI5IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTM3NTgsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Nx1PyRjlpR4wH9rO9eWYqKbwo9FeHnotS-9q-j5wDu9_ucpy5CD5J32XQGDV17cdAbu1P216INrpjo4hFlp7bHkkIYW5GxPbGR4P-uXBM456oP-MwVC78mAllyhonkg4SgoEoqb7av6SrIhC_F4LZ_9ATPXf9rP7clkAX7W1TWavKmXyuSMUJhuNJrlQcxrpY7N-lKYrTKgYMwxxUWbsmNcsITIfIK7Fyb84a7VaE3ZksbAOVo_2YH6VeLpMQtUL65shbkkLLOd1IYB9Rv2rtpFqcx7CH2xViUXQali5UNoht9Ro6prDh_lhLhBLI2Js_RpeagMjcDu2vyvZNLWKtQ', '2026-07-22 22:55:58', NULL);
INSERT INTO public.refresh_token VALUES (68, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiJlMDRjMjVlOS1iN2M2LTQ5NWQtYWMwZC0zNThjODlhY2M4NzAiLCJleHAiOjE3ODQ3NTQxOTQsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZDYxZDA2N2ItNmJmMS00MDhjLWI3NTktMzExM2Q2MDc2ZDJiIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTQxOTQsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.epJsCGZUF6bA9s-g_jbE3gzvSRX97wCWGBZQwEQWdeM6SEIkGnoA9VZ6BlLhwll6ckd2WWAZr65XGzCVkHlTwEuf2UCCTdIbDI5NvMBg04UDCsnI9nzVotN8HSj68_KUA0WfgnItF9IBh0ADOkzGNPQq-Vx3J_uHd6FgIhs0nQsLiNOStkmv6afa2zkClb1mnYPyYVtHCqfPb1efi95h1hm8OCJRGNky1jKBMS1decP91qIR9tobwUlAu-ULaZ2sg1s-eZOCRSQOz16R6LF2DpAA24yFj0xTYiZm3q_RA-gLgSHfveuYv5A1Ob3OU8klB6coQxI7slUhNFeG8ELZHA', '2026-07-22 23:03:14', NULL);
INSERT INTO public.refresh_token VALUES (69, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI5NDc5MGQ5My1jZWVkLTQwMzAtYjQwZS0wOWEwYmI4NWZkNjciLCJleHAiOjE3ODQ3NTQ3MjksImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZTg5YTllOTItMjlkZi00Y2YzLTg0YmMtM2Y3OTFkYzczYmM3IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTQ3MjksImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.MDGGnvPoN0d3-TKe3XeBRYAuc-_GdjVN8_NAU2JeAostok0bpogjm3Q_rSWWF4GmUYvjAsU22U-7YOA6W_8-1sXJQKHQg_b_5Y-KaJJV9oSjQPhvzbUamUiBLI9RXe7kTQ3UdNNKq1A-gdWDgzproE3sXLCeUNTUt-1cAa1gN5JUyqGBvvbxaYMuWoDKgdXL4JBMo_sm99YQal3oiZP6ofj-8lFmJZUHSc-RwCBP_8nuAxNwpEo1gNMY5KBtZcZV23CbhhNVDeak2WXoxXamx2JY4MzMXugs0d9c1KEtEnWn9Upnzq0G0WyLIJD38oQ6aHX9tQPxsn0wWJk36_PPbA', '2026-07-22 23:12:09', NULL);
INSERT INTO public.refresh_token VALUES (70, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIwMjRkNzlhNS05ZmEwLTRmNzItODdlMC0wZTk5N2ZkMDM2Y2MiLCJleHAiOjE3ODQ3NTU0ODAsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiZDNhZDI2ZTAtNmQzZC00NGEyLWI2ODUtNzMyMmZjMTYwZmM4IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODQ3NTU0ODAsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.GbNT3MqmsBpbigYstHg63MwRpiRGR3Fb2LifSuEquChYtAwoIPE1RwmMr4yR18jDXRdW-rQAcvi-De_sh8D2t4iGpgHZcmoEE7iLor8S95PlHFQQbajDKOkVJi53M65m2xszlkUyBscCfjTrMHeUtXbgQy8y43zGQe7rqwB-h3FgtB2NSIOzZvwmOV0A0Va5nxdTUBQonyf2idwvF42c-Z74KfDiLx3lmjgZwM0UABZdIVrPSqYLlFSw6FHtM8A-ICu4lR6G2LAQr2ctkbLV9Q26XhAJh7KT1GSVZeXBQMBjP4jG1dm-IrhG5B4vBLqy-SLhpFFPWExNDxmrUZWtCA', '2026-07-22 23:24:40', NULL);
INSERT INTO public.refresh_token VALUES (71, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI1MzljZTAxYy1lNDc3LTQxMTgtOGYxMS1jNzFjNzRjZjU2OWMiLCJleHAiOjE3ODU0MzQ5NjYsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMjNjNThhYjItMjU3Ny00ZmY5LTlmMjAtZGI3YTNlNmYzY2E0IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODU0MzQ5NjYsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.Y9hFurcVJhSLxkrEwpvB7qtDJmoZg60wevVdz2iVtYeIgsz7-2zH6dhf7JRWsdKHiD9KEucSc5RNUbbwNP2ANRLQuqx4UCK9IaKqRKwcAE_kfG23qY7SNEqd3lrGFEWugiIWid70VUxnRHvOnBIi3kPklxBBxN25iCcOHzElGtzuGV5QYPameUwnWaKoTcq_y9ORnTLpBApmz03IS8B6tNJRsrgUQIuMSjSLUyXEJamIzNcsmMu54M7xGN7Xmz1tOn3AQse_16r8krhjcUU2ZcE-nWl12BxCN4YDGa6yOKfhTJDwK6U34vq2RFtHWPdmOaR_HO8x7shvxKsEjAlG-Q', '2026-07-30 20:09:26', NULL);
INSERT INTO public.refresh_token VALUES (72, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiIxYWE1YTRkMC0wODM3LTQyODUtYWE3Yi04Y2I3ZTgwYTM3YjAiLCJleHAiOjE3ODU0Mzc0MjIsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiMDI2NzFiNjEtNDBiYy00NWJkLWJlMTAtODNlZDMzYjM1NjExIiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODU0Mzc0MjIsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.CBStXuGI5JC-OAETjLoj3R6tQM6JMzXocpO8iMrllfJkHIKBCqlRBPKjcnZbz_OoPVXP179Y0Bx-LEv9tCoKqcmaB5bJf5kaI604el2e0s4uhNHemXzHYslIpi7Xqo74enIViMTLbgJVNmgIyHo0OQlsVTeZ6IvY67sxwHDlimpLnjKm3_5Yuz7xc___hNp4GTxBYz9NQI2LDkmbhlfJ0NHP9bWRt710k2pj8DC7fE6NItv23yXOZoQZgTYhRJZvyTF9OxCJL61rSbEzC681usxpnufMTf9NjD1uc2kB-V8WYFmr2IYu7IowRfM6B-fpKG6-qSDN9wprXExjkWYx9w', '2026-07-30 20:50:22', NULL);
INSERT INTO public.refresh_token VALUES (73, 'WaveEventManagement', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiV2F2ZUV2ZW50TWFuYWdlbWVudCIsIldhdmVFdmVudE1hbmFnZW1lbnREYXRhIiwid3ItYXV0aCJdLCJzY29wZSI6WyJhbm9ueW1vdXNfdXNlciJdLCJhdGkiOiI5NDFmMzY0ZC03MGYwLTQ4YWItYWQ4Yy0wZjJhMWYyZTMzMGUiLCJleHAiOjE3ODU0MzgxNDUsImF1dGhvcml0aWVzIjpbIkFVVEhTRVJWRVJfQURNSU4iXSwianRpIjoiNzFlOTMxYjMtMDFkMy00YjY5LTg3ZGUtNzYyMDI1N2U1Nzg3IiwicmVmcmVzaF90b2tlbl9leHAiOjE3ODU0MzgxNDUsImNsaWVudF9pZCI6IldhdmVFdmVudE1hbmFnZW1lbnQifQ.cAl5bx1eGC76MKRtsSpkrBf93NNgYSsmEpsOKvQyhc8ZbjRkxVwfPOp1Yl3Vr2Jjp1dTomiseYwL2vSN8hVRzcpAQI4pNOKI_L9Jge6tcf8yFGAcpz6BdYJq_Ao1sA2iuRAgzVfPjf4912Ms0ea4fb7H-xiA8OCkcDvjqZjgg9LLHyz9gg6pDmrGwHOnbqxv0vvJS0iRl_ErVbFIjqrXuiwOeNzRlcrnTRWJrAHYcvSzJ9l6Wo8d_HuOj2TsVVOC-ORbcMtUPpjX-ugs6XsVjd9KnHkFQHu-N7bEotQSjACS-E7doi7VmLdwXQdjgcRLWA4GdwqlngZ9lEUgaNfqWQ', '2026-07-30 21:02:25', NULL);


--
-- TOC entry 3438 (class 0 OID 16798)
-- Dependencies: 236
-- Data for Name: scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.scope VALUES (1, 'WaveEventManagement', true, 'anonymous_user');
INSERT INTO public.scope VALUES (2, 'WaveEventManagement', true, 'password_change');
INSERT INTO public.scope VALUES (3, 'WaveEventManagement', true, 'identity_registration');
INSERT INTO public.scope VALUES (4, 'WaveEventManagementData', true, 'anonymous_user');
INSERT INTO public.scope VALUES (5, 'WaveEventManagementData', true, 'password_change');
INSERT INTO public.scope VALUES (6, 'WaveEventManagementData', true, 'identity_registration');
INSERT INTO public.scope VALUES (7, 'wr-auth', true, 'anonymous_user');
INSERT INTO public.scope VALUES (8, 'wr-auth', true, 'password_change');
INSERT INTO public.scope VALUES (9, 'wr-auth', true, 'identity_registration');


--
-- TOC entry 3439 (class 0 OID 16803)
-- Dependencies: 237
-- Data for Name: tipologia_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 238
-- Name: evento_codice_evento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_codice_evento_seq', 17, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 239
-- Name: prenotazione_codice_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prenotazione_codice_seq', 1, false);


-- Completed on 2026-06-30 21:35:43

--
-- PostgreSQL database dump complete
--

\unrestrict 68oW5EXaBxO33PUN1zT9hE4FRIZM4SY4zde2bO8MzlSleplyO3Vk2y2kkZmpqbi

