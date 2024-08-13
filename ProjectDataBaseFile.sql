--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: tbladdress; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbladdress (
    addid integer NOT NULL,
    area character varying(30) NOT NULL,
    city character varying(20) NOT NULL,
    nearme text NOT NULL,
    pin integer,
    uid integer
);


ALTER TABLE tbladdress OWNER TO postgres;

--
-- Name: tbladdress_addid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbladdress_addid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbladdress_addid_seq OWNER TO postgres;

--
-- Name: tbladdress_addid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbladdress_addid_seq OWNED BY tbladdress.addid;


--
-- Name: tblcart; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblcart (
    cartid integer NOT NULL,
    uid integer,
    veid integer,
    status integer,
    tpayment character varying(20),
    days integer
);


ALTER TABLE tblcart OWNER TO postgres;

--
-- Name: tblcart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblcart_cartid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblcart_cartid_seq OWNER TO postgres;

--
-- Name: tblcart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblcart_cartid_seq OWNED BY tblcart.cartid;


--
-- Name: tblcategory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblcategory (
    cid integer NOT NULL,
    cname character varying(30)
);


ALTER TABLE tblcategory OWNER TO postgres;

--
-- Name: tblcategory_cid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblcategory_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblcategory_cid_seq OWNER TO postgres;

--
-- Name: tblcategory_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblcategory_cid_seq OWNED BY tblcategory.cid;


--
-- Name: tblvehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblvehicle (
    veid integer NOT NULL,
    vname character varying(20),
    vprice numeric(7,2),
    vdprice numeric(7,2),
    vstock integer,
    vdesc text,
    cid integer,
    vimage text,
    vid integer,
    address text
);


ALTER TABLE tblvehicle OWNER TO postgres;

--
-- Name: tblproduct_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblproduct_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblproduct_pid_seq OWNER TO postgres;

--
-- Name: tblproduct_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblproduct_pid_seq OWNED BY tblvehicle.veid;


--
-- Name: tbluser; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbluser (
    uid integer NOT NULL,
    uname character varying(30) NOT NULL,
    upass character varying(20) NOT NULL,
    email character varying(20),
    gender character varying(10),
    dob text NOT NULL,
    phone bigint NOT NULL
);


ALTER TABLE tbluser OWNER TO postgres;

--
-- Name: tbluser_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbluser_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbluser_uid_seq OWNER TO postgres;

--
-- Name: tbluser_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbluser_uid_seq OWNED BY tbluser.uid;


--
-- Name: tblvendor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tblvendor (
    vid integer NOT NULL,
    vname character varying,
    vpass character varying,
    vemail character varying,
    phone bigint,
    address text
);


ALTER TABLE tblvendor OWNER TO postgres;

--
-- Name: tblvendor_vid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblvendor_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblvendor_vid_seq OWNER TO postgres;

--
-- Name: tblvendor_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblvendor_vid_seq OWNED BY tblvendor.vid;


--
-- Name: addid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbladdress ALTER COLUMN addid SET DEFAULT nextval('tbladdress_addid_seq'::regclass);


--
-- Name: cartid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcart ALTER COLUMN cartid SET DEFAULT nextval('tblcart_cartid_seq'::regclass);


--
-- Name: cid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcategory ALTER COLUMN cid SET DEFAULT nextval('tblcategory_cid_seq'::regclass);


--
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbluser ALTER COLUMN uid SET DEFAULT nextval('tbluser_uid_seq'::regclass);


--
-- Name: veid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblvehicle ALTER COLUMN veid SET DEFAULT nextval('tblproduct_pid_seq'::regclass);


--
-- Name: vid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblvendor ALTER COLUMN vid SET DEFAULT nextval('tblvendor_vid_seq'::regclass);


--
-- Name: tbladdress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbladdress
    ADD CONSTRAINT tbladdress_pkey PRIMARY KEY (addid);


--
-- Name: tblcart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblcart
    ADD CONSTRAINT tblcart_pkey PRIMARY KEY (cartid);


--
-- Name: tblcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblcategory
    ADD CONSTRAINT tblcategory_pkey PRIMARY KEY (cid);


--
-- Name: tblproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblvehicle
    ADD CONSTRAINT tblproduct_pkey PRIMARY KEY (veid);


--
-- Name: tbluser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbluser
    ADD CONSTRAINT tbluser_email_key UNIQUE (email);


--
-- Name: tbluser_email_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbluser
    ADD CONSTRAINT tbluser_email_phone_key UNIQUE (email, phone);


--
-- Name: tbluser_email_upass_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbluser
    ADD CONSTRAINT tbluser_email_upass_phone_key UNIQUE (email, upass, phone);


--
-- Name: tbluser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbluser
    ADD CONSTRAINT tbluser_pkey PRIMARY KEY (uid);


--
-- Name: tblvendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tblvendor
    ADD CONSTRAINT tblvendor_pkey PRIMARY KEY (vid);


--
-- Name: tbladdress_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbladdress
    ADD CONSTRAINT tbladdress_uid_fkey FOREIGN KEY (uid) REFERENCES tbluser(uid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tblcart_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblcart
    ADD CONSTRAINT tblcart_uid_fkey FOREIGN KEY (uid) REFERENCES tbluser(uid) ON UPDATE CASCADE ON DELETE CASCADE;


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

