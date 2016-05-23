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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acceptors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE acceptors (
    id integer NOT NULL,
    name_acceptor character varying,
    bank_acceptor character varying,
    account_acceptor character varying,
    key_acceptor character varying,
    mfo_acceptor character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: acceptors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE acceptors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acceptors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE acceptors_id_seq OWNED BY acceptors.id;


--
-- Name: operations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE operations (
    id integer NOT NULL,
    date_time_pay timestamp without time zone,
    date_valut date,
    num_ticket character varying,
    code_ticket character varying,
    key_operation character varying,
    destination text,
    sum_operation money,
    currency_operation character varying,
    priv_acc_payer character varying,
    period_pay_start date,
    period_pay_end date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payer_id integer,
    acceptor_id integer,
    service_id integer,
    user_id integer
);


--
-- Name: operations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE operations_id_seq OWNED BY operations.id;


--
-- Name: payers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payers (
    id integer NOT NULL,
    id_main integer,
    fio character varying,
    adress character varying,
    invoice character varying,
    telephone character varying,
    bank_payer character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: payers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payers_id_seq OWNED BY payers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: services; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE services (
    id integer NOT NULL,
    name_service character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying,
    remember_token character varying,
    admin boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY acceptors ALTER COLUMN id SET DEFAULT nextval('acceptors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY operations ALTER COLUMN id SET DEFAULT nextval('operations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY payers ALTER COLUMN id SET DEFAULT nextval('payers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: acceptors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY acceptors
    ADD CONSTRAINT acceptors_pkey PRIMARY KEY (id);


--
-- Name: operations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (id);


--
-- Name: payers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payers
    ADD CONSTRAINT payers_pkey PRIMARY KEY (id);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_operations_on_acceptor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_operations_on_acceptor_id ON operations USING btree (acceptor_id);


--
-- Name: index_operations_on_payer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_operations_on_payer_id ON operations USING btree (payer_id);


--
-- Name: index_operations_on_service_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_operations_on_service_id ON operations USING btree (service_id);


--
-- Name: index_operations_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_operations_on_user_id ON operations USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_63fbf4e94e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operations
    ADD CONSTRAINT fk_rails_63fbf4e94e FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_858b8204eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operations
    ADD CONSTRAINT fk_rails_858b8204eb FOREIGN KEY (acceptor_id) REFERENCES acceptors(id);


--
-- Name: fk_rails_c88305f84d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operations
    ADD CONSTRAINT fk_rails_c88305f84d FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fk_rails_ef2e301c75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY operations
    ADD CONSTRAINT fk_rails_ef2e301c75 FOREIGN KEY (payer_id) REFERENCES payers(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20160421202559');

INSERT INTO schema_migrations (version) VALUES ('20160422045947');

INSERT INTO schema_migrations (version) VALUES ('20160422054120');

INSERT INTO schema_migrations (version) VALUES ('20160425064400');

INSERT INTO schema_migrations (version) VALUES ('20160425072537');

INSERT INTO schema_migrations (version) VALUES ('20160425073404');

INSERT INTO schema_migrations (version) VALUES ('20160425074236');

INSERT INTO schema_migrations (version) VALUES ('20160502101223');

INSERT INTO schema_migrations (version) VALUES ('20160503070859');

INSERT INTO schema_migrations (version) VALUES ('20160503072026');

INSERT INTO schema_migrations (version) VALUES ('20160504173708');

INSERT INTO schema_migrations (version) VALUES ('20160504174650');

INSERT INTO schema_migrations (version) VALUES ('20160510074613');

INSERT INTO schema_migrations (version) VALUES ('20160516072410');

INSERT INTO schema_migrations (version) VALUES ('20160516101000');

