--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10
-- Dumped by pg_dump version 12.10

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
-- Name: node-red; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "node-red" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Korean_Korea.949' LC_CTYPE = 'Korean_Korea.949';


ALTER DATABASE "node-red" OWNER TO postgres;

\connect -reuse-previous=on "dbname='node-red'"

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

SET default_table_access_method = heap;

--
-- Name: TagMaster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TagMaster" (
    "AssetId" character varying(32) DEFAULT 'NULL::character varying'::character varying,
    "TagName" character varying(64) DEFAULT 'NULL::character varying'::character varying NOT NULL,
    "Description" character varying(256) DEFAULT 'NULL::character varying'::character varying,
    "SigType" character varying(16) DEFAULT 'NULL::character varying'::character varying,
    "EuLo" real DEFAULT '0'::real,
    "EuHi" real DEFAULT '100'::real,
    "EuUnit" character varying(32) DEFAULT 'NULL::character varying'::character varying,
    "LimitLoLo" real DEFAULT '0'::real,
    "LimitLo" real DEFAULT '0'::real,
    "LimitHi" real DEFAULT '0'::real,
    "LimitHiHi" real DEFAULT '0'::real,
    "Used" smallint DEFAULT '1'::smallint,
    "SymbolName" character varying(64) DEFAULT 'NULL::character varying'::character varying,
    "SymbolUnit" character varying(32) DEFAULT 'NULL::character varying'::character varying,
    "SymbolSection" character varying(64) DEFAULT 'NULL::character varying'::character varying,
    "SymbolDesc" character varying(256) DEFAULT 'NULL::character varying'::character varying,
    "IsAlarm" smallint DEFAULT '0'::smallint,
    "ScaleLo" real DEFAULT '0'::real,
    "ScaleHi" real DEFAULT '0'::real
);


ALTER TABLE public."TagMaster" OWNER TO postgres;

--
-- Name: TagValue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TagValue" (
    "TagName" character varying(64) DEFAULT 'NULL::character varying'::character varying NOT NULL,
    "TimeStamp" timestamp(6) without time zone,
    "Value" character varying,
    "Quality" character varying(8) DEFAULT 'NULL::character varying'::character varying
);


ALTER TABLE public."TagValue" OWNER TO postgres;

--
-- Data for Name: TagMaster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TagMaster" ("AssetId", "TagName", "Description", "SigType", "EuLo", "EuHi", "EuUnit", "LimitLoLo", "LimitLo", "LimitHi", "LimitHiHi", "Used", "SymbolName", "SymbolUnit", "SymbolSection", "SymbolDesc", "IsAlarm", "ScaleLo", "ScaleHi") FROM stdin;
KR	TagD	해수온도	PI	0	100	°C	0	0	0	0	1		°C			0	0	0
KR	TagC	강우량	PI	0	100	mm	0	0	0	0	1		mm			0	0	0
KR	TagB	습도	PI	0	100	%	0	0	0	0	1		%			0	0	0
KR	TagA	대기온도	PI	0	100	°C	0	0	0	0	1		°C			0	0	0
KR-S1	TagE	Core Exit Temp 23 - Core 089 A	PI	0	100		0	0	0	0	1	CET23_C089A				0	0	0
\.


--
-- Data for Name: TagValue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TagValue" ("TagName", "TimeStamp", "Value", "Quality") FROM stdin;
TagE	2022-03-06 00:33:15.285251	0.66	GOOD
TagB	2022-03-06 00:33:15.285251	73.23	GOOD
TagD	2022-03-06 00:33:15.285251	76.54	GOOD
TagA	2022-03-06 00:33:15.285251	85.19	GOOD
TagC	2022-03-06 00:33:15.285251	58.88	GOOD
\.


--
-- Name: TagMaster TagMaster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagMaster"
    ADD CONSTRAINT "TagMaster_pkey" PRIMARY KEY ("TagName");


--
-- Name: TagValue TagValue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TagValue"
    ADD CONSTRAINT "TagValue_pkey" PRIMARY KEY ("TagName");


--
-- PostgreSQL database dump complete
--

