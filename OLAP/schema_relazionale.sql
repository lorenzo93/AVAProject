--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.4.6
-- Started on 2016-04-08 14:59:07 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 16961)
-- Name: ava; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ava;


--
-- TOC entry 1 (class 3079 OID 11897)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = ava, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 16962)
-- Name: anno_accademico; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE anno_accademico (
    id integer NOT NULL,
    nome_anno_x integer,
    nome_anno_x1 integer,
    nome_anno text
);


--
-- TOC entry 175 (class 1259 OID 16968)
-- Name: anno_accademico_id_seq; Type: SEQUENCE; Schema: ava; Owner: -
--

CREATE SEQUENCE anno_accademico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 175
-- Name: anno_accademico_id_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: -
--

ALTER SEQUENCE anno_accademico_id_seq OWNED BY anno_accademico.id;


--
-- TOC entry 176 (class 1259 OID 16970)
-- Name: corsi; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE corsi (
    id integer NOT NULL,
    codice_corso character varying(15),
    ssd character varying(97),
    nome character varying(249),
    cfu integer
);


--
-- TOC entry 177 (class 1259 OID 16973)
-- Name: corsi_id_seq; Type: SEQUENCE; Schema: ava; Owner: -
--

CREATE SEQUENCE corsi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 177
-- Name: corsi_id_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: -
--

ALTER SEQUENCE corsi_id_seq OWNED BY corsi.id;


--
-- TOC entry 178 (class 1259 OID 16975)
-- Name: corso_studi; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE corso_studi (
    id integer NOT NULL,
    data_inizio_validita date,
    data_fine_validita date,
    nome_cds character varying(150),
    tipo_cds character varying(100),
    nome_dipartimento text,
    codice_dipartimento integer,
    codice_corso_studi bigint,
    durata_legale integer,
    codice_ateneo text
);


--
-- TOC entry 179 (class 1259 OID 16981)
-- Name: corso_studi_id_seq; Type: SEQUENCE; Schema: ava; Owner: -
--

CREATE SEQUENCE corso_studi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 179
-- Name: corso_studi_id_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: -
--

ALTER SEQUENCE corso_studi_id_seq OWNED BY corso_studi.id;


--
-- TOC entry 180 (class 1259 OID 16983)
-- Name: data; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE data (
    id integer NOT NULL,
    date date,
    year integer,
    month integer,
    monthname text,
    day integer,
    dayofyear integer,
    weekdayname text,
    calendarweek integer,
    formatteddate text,
    quartal text,
    yearquartal text,
    yearmonth text,
    yearcalendarweek text,
    weekend text,
    americanholiday text,
    austrianholiday text,
    canadianholiday text,
    period text,
    cwstart date,
    cwend date,
    monthend date,
    monthstart date
);


--
-- TOC entry 191 (class 1259 OID 17393)
-- Name: data_finder; Type: VIEW; Schema: ava; Owner: -
--

CREATE VIEW data_finder AS
 SELECT data.id,
    concat(lpad((data.day)::text, 2, '0'::text), lpad((data.month)::text, 2, '0'::text), data.year) AS data
   FROM data;


--
-- TOC entry 181 (class 1259 OID 16993)
-- Name: data_id_seq; Type: SEQUENCE; Schema: ava; Owner: -
--

CREATE SEQUENCE data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 181
-- Name: data_id_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: -
--

ALTER SEQUENCE data_id_seq OWNED BY data.id;


--
-- TOC entry 182 (class 1259 OID 16995)
-- Name: esami; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE esami (
    data_id integer NOT NULL,
    studente_id integer NOT NULL,
    corso_di_studi_id integer NOT NULL,
    corso_id integer NOT NULL,
    voto bigint NOT NULL,
    cfu bigint NOT NULL,
    anno_id integer NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 16998)
-- Name: ingressi; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE ingressi (
    immatricolazione_id integer NOT NULL,
    studente_id integer NOT NULL,
    anno_id integer NOT NULL,
    data_id integer NOT NULL,
    corso_di_studi_id integer NOT NULL,
    test_ingresso bigint,
    immatricolato integer
);


--
-- TOC entry 184 (class 1259 OID 17001)
-- Name: lauree; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE lauree (
    studente_id integer NOT NULL,
    anno_id integer NOT NULL,
    voto_laurea character varying(26),
    data_id integer NOT NULL,
    corso_di_studi_id integer NOT NULL,
    voto integer
);


--
-- TOC entry 185 (class 1259 OID 17004)
-- Name: studenti; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE studenti (
    id integer NOT NULL,
    data_nascita date,
    coorte bigint,
    titolo_di_studio character varying(69),
    sesso character varying(11),
    regione_residenza character varying(21),
    provincia_residenza character varying(25),
    comune_residenza character varying(62),
    stato_residenza character varying(44),
    cittadinanza character varying(44),
    codice_fiscale character varying(38),
    voto_scuola_media_superiore character varying(24),
    nazione_diploma character varying(44),
    tipo_scuola_media_superiore character varying(79),
    istituto_scuola_media_superiore character varying(79),
    anno_diploma bigint
);


--
-- TOC entry 186 (class 1259 OID 17010)
-- Name: studenti_id_seq; Type: SEQUENCE; Schema: ava; Owner: -
--

CREATE SEQUENCE studenti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 186
-- Name: studenti_id_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: -
--

ALTER SEQUENCE studenti_id_seq OWNED BY studenti.id;


--
-- TOC entry 187 (class 1259 OID 17012)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE tipo_immatricolazione (
    id integer NOT NULL,
    tipo_immatricolazione character varying(61)
);


--
-- TOC entry 188 (class 1259 OID 17015)
-- Name: tipo_immatricolazione_id_seq; Type: SEQUENCE; Schema: ava; Owner: -
--

CREATE SEQUENCE tipo_immatricolazione_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 188
-- Name: tipo_immatricolazione_id_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: -
--

ALTER SEQUENCE tipo_immatricolazione_id_seq OWNED BY tipo_immatricolazione.id;


--
-- TOC entry 189 (class 1259 OID 17017)
-- Name: tipo_uscita; Type: TABLE; Schema: ava; Owner: -; Tablespace: 
--

CREATE TABLE tipo_uscita (
    id integer NOT NULL,
    tipo_uscita character varying(49)
);


--
-- TOC entry 190 (class 1259 OID 17020)
-- Name: tipo_uscita_id_seq; Type: SEQUENCE; Schema: ava; Owner: -
--

CREATE SEQUENCE tipo_uscita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 190
-- Name: tipo_uscita_id_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: -
--

ALTER SEQUENCE tipo_uscita_id_seq OWNED BY tipo_uscita.id;


--
-- TOC entry 1978 (class 2604 OID 17022)
-- Name: id; Type: DEFAULT; Schema: ava; Owner: -
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN id SET DEFAULT nextval('anno_accademico_id_seq'::regclass);


--
-- TOC entry 1979 (class 2604 OID 17023)
-- Name: id; Type: DEFAULT; Schema: ava; Owner: -
--

ALTER TABLE ONLY corsi ALTER COLUMN id SET DEFAULT nextval('corsi_id_seq'::regclass);


--
-- TOC entry 1980 (class 2604 OID 17024)
-- Name: id; Type: DEFAULT; Schema: ava; Owner: -
--

ALTER TABLE ONLY corso_studi ALTER COLUMN id SET DEFAULT nextval('corso_studi_id_seq'::regclass);


--
-- TOC entry 1981 (class 2604 OID 17025)
-- Name: id; Type: DEFAULT; Schema: ava; Owner: -
--

ALTER TABLE ONLY data ALTER COLUMN id SET DEFAULT nextval('data_id_seq'::regclass);


--
-- TOC entry 1982 (class 2604 OID 17026)
-- Name: id; Type: DEFAULT; Schema: ava; Owner: -
--

ALTER TABLE ONLY studenti ALTER COLUMN id SET DEFAULT nextval('studenti_id_seq'::regclass);


--
-- TOC entry 1983 (class 2604 OID 17027)
-- Name: id; Type: DEFAULT; Schema: ava; Owner: -
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN id SET DEFAULT nextval('tipo_immatricolazione_id_seq'::regclass);


--
-- TOC entry 1984 (class 2604 OID 17028)
-- Name: id; Type: DEFAULT; Schema: ava; Owner: -
--

ALTER TABLE ONLY tipo_uscita ALTER COLUMN id SET DEFAULT nextval('tipo_uscita_id_seq'::regclass);


--
-- TOC entry 1986 (class 2606 OID 17030)
-- Name: pri_key_anno; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT pri_key_anno PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 17032)
-- Name: pri_key_corsi; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY corsi
    ADD CONSTRAINT pri_key_corsi PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 17034)
-- Name: pri_key_corso_studi; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY corso_studi
    ADD CONSTRAINT pri_key_corso_studi PRIMARY KEY (id);


--
-- TOC entry 1992 (class 2606 OID 17036)
-- Name: pri_key_data; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data
    ADD CONSTRAINT pri_key_data PRIMARY KEY (id);


--
-- TOC entry 1995 (class 2606 OID 17173)
-- Name: pri_key_esami; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT pri_key_esami PRIMARY KEY (data_id, studente_id, corso_di_studi_id, corso_id, anno_id, cfu, voto);


--
-- TOC entry 1998 (class 2606 OID 17040)
-- Name: pri_key_ingressi; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT pri_key_ingressi PRIMARY KEY (immatricolazione_id, studente_id, anno_id, data_id, corso_di_studi_id);


--
-- TOC entry 2001 (class 2606 OID 17042)
-- Name: pri_key_lauree; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT pri_key_lauree PRIMARY KEY (studente_id, anno_id, data_id, corso_di_studi_id);


--
-- TOC entry 2003 (class 2606 OID 17044)
-- Name: pri_key_studenti; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY studenti
    ADD CONSTRAINT pri_key_studenti PRIMARY KEY (id);


--
-- TOC entry 2005 (class 2606 OID 17046)
-- Name: pri_key_tipo_immatricolazione; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT pri_key_tipo_immatricolazione PRIMARY KEY (id);


--
-- TOC entry 2007 (class 2606 OID 17048)
-- Name: pri_key_tipo_uscita; Type: CONSTRAINT; Schema: ava; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_uscita
    ADD CONSTRAINT pri_key_tipo_uscita PRIMARY KEY (id);


--
-- TOC entry 1993 (class 1259 OID 17049)
-- Name: idx_esami_lookup; Type: INDEX; Schema: ava; Owner: -; Tablespace: 
--

CREATE INDEX idx_esami_lookup ON esami USING btree (data_id, studente_id, corso_di_studi_id, corso_id, voto, cfu);


--
-- TOC entry 1996 (class 1259 OID 17050)
-- Name: idx_ingressi_lookup; Type: INDEX; Schema: ava; Owner: -; Tablespace: 
--

CREATE INDEX idx_ingressi_lookup ON ingressi USING btree (test_ingresso, immatricolazione_id, studente_id, anno_id, data_id, corso_di_studi_id);


--
-- TOC entry 1999 (class 1259 OID 17051)
-- Name: idx_lauree_lookup; Type: INDEX; Schema: ava; Owner: -; Tablespace: 
--

CREATE INDEX idx_lauree_lookup ON lauree USING btree (studente_id, anno_id, voto_laurea, data_id, corso_di_studi_id);


--
-- TOC entry 2008 (class 2606 OID 17052)
-- Name: for_key_esami2anno; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT for_key_esami2anno FOREIGN KEY (anno_id) REFERENCES anno_accademico(id);


--
-- TOC entry 2009 (class 2606 OID 17057)
-- Name: for_key_esami2corsi; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT for_key_esami2corsi FOREIGN KEY (corso_id) REFERENCES corsi(id);


--
-- TOC entry 2010 (class 2606 OID 17062)
-- Name: for_key_esami2corsostudi; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT for_key_esami2corsostudi FOREIGN KEY (corso_di_studi_id) REFERENCES corso_studi(id);


--
-- TOC entry 2011 (class 2606 OID 17067)
-- Name: for_key_esami2data; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT for_key_esami2data FOREIGN KEY (data_id) REFERENCES data(id);


--
-- TOC entry 2012 (class 2606 OID 17072)
-- Name: for_key_esami2studenti; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT for_key_esami2studenti FOREIGN KEY (studente_id) REFERENCES studenti(id);


--
-- TOC entry 2013 (class 2606 OID 17077)
-- Name: for_key_ingressi2anno; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT for_key_ingressi2anno FOREIGN KEY (anno_id) REFERENCES anno_accademico(id);


--
-- TOC entry 2014 (class 2606 OID 17082)
-- Name: for_key_ingressi2corso; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT for_key_ingressi2corso FOREIGN KEY (corso_di_studi_id) REFERENCES corso_studi(id);


--
-- TOC entry 2015 (class 2606 OID 17087)
-- Name: for_key_ingressi2data; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT for_key_ingressi2data FOREIGN KEY (data_id) REFERENCES data(id);


--
-- TOC entry 2016 (class 2606 OID 17092)
-- Name: for_key_ingressi2immat; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT for_key_ingressi2immat FOREIGN KEY (immatricolazione_id) REFERENCES tipo_immatricolazione(id);


--
-- TOC entry 2017 (class 2606 OID 17097)
-- Name: for_key_ingressi2studente; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT for_key_ingressi2studente FOREIGN KEY (studente_id) REFERENCES studenti(id);


--
-- TOC entry 2018 (class 2606 OID 17102)
-- Name: for_key_lauree2anno; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT for_key_lauree2anno FOREIGN KEY (anno_id) REFERENCES anno_accademico(id);


--
-- TOC entry 2019 (class 2606 OID 17107)
-- Name: for_key_lauree2corso; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT for_key_lauree2corso FOREIGN KEY (corso_di_studi_id) REFERENCES corso_studi(id);


--
-- TOC entry 2020 (class 2606 OID 17112)
-- Name: for_key_lauree2data; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT for_key_lauree2data FOREIGN KEY (data_id) REFERENCES data(id);


--
-- TOC entry 2021 (class 2606 OID 17117)
-- Name: for_key_lauree2studente; Type: FK CONSTRAINT; Schema: ava; Owner: -
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT for_key_lauree2studente FOREIGN KEY (studente_id) REFERENCES studenti(id);


-- Completed on 2016-04-08 14:59:07 CEST

--
-- PostgreSQL database dump complete
--

