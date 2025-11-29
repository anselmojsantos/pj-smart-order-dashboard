--
-- PostgreSQL database dump
--

\restrict hH41eY94sMne0TwNI8Vc2iNAwxzMWamdlt0xxtC2fXv43SVLSuHmdZ73B2o3Y18

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg12+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-04 20:37:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE smart_zgd2;
--
-- TOC entry 3475 (class 1262 OID 16389)
-- Name: smart_zgd2; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE smart_zgd2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';


\unrestrict hH41eY94sMne0TwNI8Vc2iNAwxzMWamdlt0xxtC2fXv43SVLSuHmdZ73B2o3Y18
\connect smart_zgd2
\restrict hH41eY94sMne0TwNI8Vc2iNAwxzMWamdlt0xxtC2fXv43SVLSuHmdZ73B2o3Y18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3476 (class 0 OID 0)
-- Name: smart_zgd2; Type: DATABASE PROPERTIES; Schema: -; Owner: -
--

ALTER DATABASE smart_zgd2 SET "TimeZone" TO 'utc';


\unrestrict hH41eY94sMne0TwNI8Vc2iNAwxzMWamdlt0xxtC2fXv43SVLSuHmdZ73B2o3Y18
\connect smart_zgd2
\restrict hH41eY94sMne0TwNI8Vc2iNAwxzMWamdlt0xxtC2fXv43SVLSuHmdZ73B2o3Y18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 867 (class 1247 OID 16426)
-- Name: Category; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."Category" AS ENUM (
    'bebidas',
    'pratos',
    'pratos_do_dia',
    'lanches'
);


--
-- TOC entry 873 (class 1247 OID 16446)
-- Name: MethodsPayments; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."MethodsPayments" AS ENUM (
    'cash',
    'credit_card',
    'debit_card',
    'pix'
);


--
-- TOC entry 861 (class 1247 OID 16414)
-- Name: StatusOrder; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."StatusOrder" AS ENUM (
    'open',
    'closed'
);


--
-- TOC entry 903 (class 1247 OID 16584)
-- Name: StatusPayment; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."StatusPayment" AS ENUM (
    'open',
    'paid'
);


--
-- TOC entry 870 (class 1247 OID 16434)
-- Name: StatusSatisfactionSurvey; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."StatusSatisfactionSurvey" AS ENUM (
    'pessimo',
    'ruim',
    'regular',
    'bom',
    'otimo'
);


--
-- TOC entry 864 (class 1247 OID 16420)
-- Name: StatusTable; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."StatusTable" AS ENUM (
    'open',
    'closed'
);


--
-- TOC entry 858 (class 1247 OID 16408)
-- Name: UserRole; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."UserRole" AS ENUM (
    'admin',
    'user'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16398)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16489)
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id text NOT NULL,
    name text NOT NULL,
    cpf text NOT NULL,
    telephone text NOT NULL,
    email text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16473)
-- Name: order_itens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_itens (
    id text NOT NULL,
    quantity integer NOT NULL,
    order_id text NOT NULL,
    product_id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16464)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id text NOT NULL,
    customer_id text NOT NULL,
    waiter_id text NOT NULL,
    table_id text NOT NULL,
    status public."StatusOrder" DEFAULT 'open'::public."StatusOrder" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 16514)
-- Name: payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payments (
    id text NOT NULL,
    total numeric(65,30),
    order_id text NOT NULL,
    payment_type public."MethodsPayments",
    "paymentDate" timestamp(3) without time zone,
    status public."StatusPayment" DEFAULT 'open'::public."StatusPayment" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16481)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price numeric(65,30) NOT NULL,
    category public."Category" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16568)
-- Name: satisfactions_survey; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.satisfactions_survey (
    id text NOT NULL,
    note integer NOT NULL,
    status public."StatusSatisfactionSurvey" NOT NULL,
    order_id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 16505)
-- Name: tables; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tables (
    id text NOT NULL,
    table_number text NOT NULL,
    status public."StatusTable" DEFAULT 'open'::public."StatusTable" NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16455)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    role public."UserRole" DEFAULT 'user'::public."UserRole" NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16497)
-- Name: waiters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.waiters (
    id text NOT NULL,
    name text NOT NULL,
    telephone text NOT NULL,
    hiring_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 3460 (class 0 OID 16398)
-- Dependencies: 217
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public._prisma_migrations VALUES ('a6e31a7e-4277-419d-bf48-de7f04e93e11', '0cb6732c4748c5709a981859e4d160fa3df178f9c3b420140c82ec5a8071fc70', '2025-10-21 21:10:45.334471+00', '20250927210144_create_table', NULL, NULL, '2025-10-21 21:10:44.236193+00', 1);
INSERT INTO public._prisma_migrations VALUES ('43244673-fbfb-4c86-a0f6-54054000fc7a', '584240fda4b956317ba99a8172a346e53e48824093b2e8c4acc60c15c1dc71e6', '2025-10-21 21:10:46.68392+00', '20251001174430_alter_table_model', NULL, NULL, '2025-10-21 21:10:45.723622+00', 1);
INSERT INTO public._prisma_migrations VALUES ('9a56e8f7-00e5-48d5-92be-4f9d8dbb08ee', '0eb5c8874e892eb75e9cb15d3e7c604eec106cdc1bb0b677cf7ec618c8db2c16', '2025-10-21 21:10:48.038572+00', '20251003172504_alter_table_satisfactions_survey', NULL, NULL, '2025-10-21 21:10:47.071083+00', 1);
INSERT INTO public._prisma_migrations VALUES ('35cfe037-f196-4fcc-8473-9bec3ec25a21', 'd60b04f7a3c678a3f34ef1d322207d8ed14ff5f38ce720366cd87ce643afc397', '2025-10-21 21:10:49.43743+00', '20251015181150_add_enum_lanches', NULL, NULL, '2025-10-21 21:10:48.481996+00', 1);
INSERT INTO public._prisma_migrations VALUES ('84f54b56-ceb6-4e71-9844-8051788e0461', 'ff4de365c5f7001d5c25260b948484f2c266544066eebfa16f47f86aa15db361', '2025-10-21 21:10:50.774487+00', '20251015184155_add_payment_status', NULL, NULL, '2025-10-21 21:10:49.821497+00', 1);
INSERT INTO public._prisma_migrations VALUES ('66c9e66c-f863-4774-9f94-1e7cd9f42c49', '08a38d39e070227312607b16c493f853d94b36f6f8b9526e7d66be928154660e', '2025-10-21 21:10:52.173087+00', '20251015184624_refactored_payment', NULL, NULL, '2025-10-21 21:10:51.198125+00', 1);


--
-- TOC entry 3465 (class 0 OID 16489)
-- Dependencies: 222
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customers VALUES ('46fb489a-6f64-4fbd-8a9f-d3be8b0563e1', 'Ricardo Pereira Da Silva', '12223423434', '11998673234', 'ricardo.ps@gmail.com', '2025-10-23 18:50:02.892', '2025-10-23 18:50:02.892');
INSERT INTO public.customers VALUES ('3c710672-bc3f-4cef-b270-a28bac45eae1', 'Ana Carolina Silva', '12345678901', '11987654321', 'ana.silva@outlook.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('a5603126-af35-4336-880c-39c347a27b49', 'Bruno Oliveira Santos', '23456789012', '11976543210', 'bruno.santos@gmail.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('edc03daa-e122-44af-8c6f-eb806c453434', 'Carla Pereira Lima', '34567890123', '11965432109', 'carla.lima@hotmail.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('3273e48d-e6f9-41ea-8cab-1ea1d428308f', 'Daniel Costa Rodrigues', '45678901234', '11954321098', 'daniel.rodrigues@yahoo.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('ee98de81-b3d8-4a76-87ba-cccd5072dda3', 'Eduarda Almeida Souza', '56789012345', '11943210987', 'eduarda.souza@proton.me', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('00180609-4a2c-43a1-af92-4a9527e36e34', 'Felipe Martins Barbosa', '67890123456', '11932109876', 'felipe.barbosa@icloud.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('f5207ece-9ca1-4d37-a9bb-b4ef339394f8', 'Gabriela Rocha Ferreira', '78901234567', '11921098765', 'gabriela.ferreira@live.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('33021b2e-bf56-459d-9cc2-ecfa674e6f8c', 'Henrique Cardoso Nunes', '89012345678', '11910987654', 'henrique.nunes@bol.com.br', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('038b3713-a0c3-4f15-94e8-23a2018cfb3e', 'Isabela Dias Castro', '90123456789', '11909876543', 'isabela.castro@uol.com.br', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('7028b12f-bbbc-40ee-8469-1d0e4367f9f8', 'João Pedro Mendes Gomes', '01234567890', '11898765432', 'joao.gomes@terra.com.br', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('178e9cdc-9798-4672-a736-baeddaad06d2', 'Larissa Teixeira Pinto', '12345678902', '11887654321', 'larissa.pinto@empresa.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('6aebab66-65e2-4670-a53a-acbe35182e24', 'Marcos Antonio Duarte', '23456789013', '11876543210', 'marcos.duarte@faculdade.edu', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('9535b9d1-0d5b-4880-a18f-b9ada019a9dd', 'Natália Ribeiro Moreira', '34567890124', '11865432109', 'natalia.moreira@consultoria.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('e14adfe0-75a2-4782-b566-7a0f67ab7ed1', 'Otávio Correia Lopes', '45678901235', '11854321098', 'otavio.lopes@tech.com.br', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('1718cabf-4ded-46aa-8403-c412d28c0cf8', 'Patrícia Monteiro Neves', '56789012346', '11843210987', 'patricia.neves@servicos.org', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('25672c89-212b-4c1b-b58f-109007e3e05b', 'Rafael Cunha Batista', '67890123457', '11832109876', 'rafael.batista@digital.net', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('e675bbfa-8c34-436b-b7eb-c69311c224bb', 'Sofia Martins Costa', '78901234568', '11821098765', 'sofia.costa@empresarial.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('bc483dc4-2596-4486-8caf-44287e7b5f71', 'Thiago Alves Ribeiro', '89012345679', '11810987654', 'thiago.ribeiro@startup.io', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('28ecf9ba-78d2-43c5-8dd0-6deb763049fb', 'Vanessa Oliveira Campos', '90123456780', '11798765432', 'vanessa.campos@creative.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('22d277df-7f4f-49e1-a729-6815d3bf8ea5', 'William Santos Pereira', '01234567891', '11787654321', 'william.pereira@business.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('3e521f4f-94d1-42ea-b762-b5c5fce05a7b', 'Yasmin Costa Rodrigues', '12345678903', '11776543210', 'yasmin.rodrigues@inovacao.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('c9bc19da-7eb9-4460-be6d-35c368b69cb4', 'Zé Roberto Silva Neto', '23456789014', '11765432109', 'ze.neto@empresa.com.br', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('6dfec08c-fbe3-4745-8571-9c026429ef72', 'Amanda Ribeiro Teixeira', '34567890125', '11754321098', 'amanda.teixeira@grupo.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('d116d9b5-2132-4792-90cb-c76f88cb9c17', 'Carlos Eduardo Lima', '45678901236', '11743210987', 'carlos.lima@corporation.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('22a55e30-9d12-4a4c-ae5e-80c92f7df037', 'Daniela Santos Almeida', '56789012347', '11732109876', 'daniela.almeida@empresax.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('4b104571-27d7-46bd-bbac-2060a0705185', 'Erick Oliveira Costa', '67890123458', '11721098765', 'erick.costa@companhia.net', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('8d52b70e-d065-4880-afa3-14a91fe05a36', 'Fernanda Pereira Souza', '78901234569', '11710987654', 'fernanda.souza@holding.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('6f89f185-d7ed-4887-8a50-8d9019faa7ad', 'Gustavo Rodrigues Silva', '89012345680', '11698765432', 'gustavo.silva@empresay.com.br', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('2432d87e-241d-4976-b187-7a8082d37045', 'Helena Martins Nunes', '90123456781', '11687654321', 'helena.nunes@empresaz.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('22fa2f16-3a76-4bd9-848b-a392a9713d46', 'Igor Costa Barbosa', '01234567892', '11676543210', 'igor.barbosa@techsolutions.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('b2fdc905-b755-4646-bcf5-8798a9d1a2d8', 'Wendel Campos Aquiar', '12389778945', '11985621245', 'waguiar@email.com', '2025-10-21 21:23:41.564', '2025-10-21 21:23:41.564');
INSERT INTO public.customers VALUES ('5ee42b64-f185-484d-bb94-8d5bf6e249e3', 'João Rua Monteiro', '89334420065', '11956452315', 'joao@email.com', '2025-10-22 00:41:02.385', '2025-10-22 00:41:02.385');
INSERT INTO public.customers VALUES ('5e8899c1-cf4f-48d8-bce8-7f1af50e8915', 'Ana Beatriz Priolle', '12345678901', '11987734333', 'ana.priolle@gmail.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('6634615e-adb2-4f59-b5c0-37833b4fc7a0', 'Kelly Oliveira Santos', '27229033845', '11973355656', 'k.santos@gmail.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('8b3aeecf-37f8-44fb-9616-e6c4d16ec8ca', 'Carla Fafaela de Lima', '22345676590', '1196543202', 'carla.rafa@hotmail.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('273cbb2a-c302-4b00-b021-4f7532ac81db', 'Diego Almeida Costa', '45678901234', '11954321098', 'diego.costa@yahoo.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('b08046c8-1db1-43cb-a7c6-a0521409c05b', 'Eduarda Pereira Souza', '56789012345', '11943210987', 'eduarda.souza@outlook.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('629cc702-97a4-480e-a161-9c3466c2e8e1', 'Felipe Martins Rocha', '67890123456', '11932109876', 'felipe.rocha@gmail.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('453224b8-7ab1-4219-8d88-6c46f1bb6f20', 'Gabriela Fernandes Alves', '78901234567', '11921098765', 'gabriela.alves@hotmail.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('c9fc9887-e8ba-4f4e-b88c-dedc70a0ac73', 'Henrique Barbosa Gomes', '89012345678', '11910987654', 'henrique.gomes@yahoo.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('dfc31cc2-80fe-477d-b88a-eb69f2ed0b16', 'Isabela Castro Ribeiro', '90123456789', '11909876543', 'isabela.ribeiro@outlook.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('25ecda8a-cf71-4507-83d1-8a28925a04f6', 'João Pedro Nunes Dias', '01234567890', '11998765432', 'joao.dias@gmail.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('d5d3b68b-90da-4637-ac05-2542f9d3782d', 'Larissa Cardoso Monteiro', '11223344556', '11987654321', 'larissa.monteiro@hotmail.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('f31d5925-4cb8-47de-b8da-aed9b921ec89', 'Marcos Vinicius Torres', '22334455667', '11976543210', 'marcos.torres@yahoo.com', '2025-10-27 17:44:58.779', '2025-10-27 17:44:58.779');
INSERT INTO public.customers VALUES ('7b7ce040-eebc-4144-8a69-4d20978366d1', 'Camila Santos Rocha', '33445566778', '11988776655', 'camila.rocha@empresa.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('7dcef934-1e96-4357-aadc-fa4e64301b8b', 'Rafaela Costa Mendes', '44556677889', '11977665544', 'rafaela.mendes@corporation.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('d6f6e1b4-3445-41ec-8b2a-7d587b8ab1f2', 'Leonardo Silva Oliveira', '55667788990', '11966554433', 'leonardo.oliveira@tech.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('c2313034-ee4c-4aa8-ac7f-9df620370cf9', 'Juliana Pereira Alves', '66778899001', '11955443322', 'juliana.alves@services.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('56c27da6-a6cf-4bb9-bb7d-d28024ec5fb0', 'Mateus Rodrigues Lima', '77889900112', '11944332211', 'mateus.lima@business.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('c6292eb9-34e5-4324-9d43-1e98b33085e8', 'Beatriz Nunes Souza', '88990011223', '11933221100', 'beatriz.souza@innovation.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('1c132c4b-37e9-462f-98aa-11084ef8bc04', 'Vinícius Barbosa Castro', '99001122334', '11922110099', 'vinicius.castro@digital.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('9fcb8a00-8dbd-4802-a6aa-c1cc9899efe8', 'Laura Martins Dias', '00112233445', '11911009988', 'laura.dias@creative.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('895dd251-205c-48a8-9ab7-f8175fdd96d2', 'Gustavo Henrique Torres', '11223344556', '11900998877', 'gustavo.torres@enterprise.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('16ea1eb2-7eec-4589-add8-d3fd9de90fa1', 'Isadora Fernandes Monteiro', '22334455667', '11999887766', 'isadora.monteiro@group.com', '2025-10-27 18:32:08.248', '2025-10-27 18:32:08.248');
INSERT INTO public.customers VALUES ('bfcb0476-ca9f-4633-8ee8-de45af5c4a2d', 'Bruno Costa Santos', '33445566789', '11988776654', 'bruno.santos@empresa.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('3d0bc674-7dac-4fd8-98cb-96007380165a', 'Carolina Oliveira Silva', '44556677890', '11977665543', 'carolina.silva@tech.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('94e39889-4f12-4b9f-b64e-fd9b1ba6c03d', 'Daniel Pereira Almeida', '55667788901', '11966554432', 'daniel.almeida@services.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('2a07b1c7-98c4-4bd7-94f9-6a82e4dbb815', 'Eduarda Rodrigues Costa', '66778899012', '11955443321', 'eduarda.costa@business.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('f49ac9ac-4e56-42c7-a75a-6e596e28ebff', 'Felipe Martins Lima', '77889900123', '11944332210', 'felipe.lima@innovation.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('428106ae-599b-4e67-863a-5bc6c93db6fd', 'Gabriela Souza Rocha', '88990011234', '11933221109', 'gabriela.rocha@digital.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('7a1f4755-759e-49c8-9cf4-b20ec3b80414', 'Henrique Barbosa Nunes', '99001122345', '11922110098', 'henrique.nunes@creative.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('944734b0-43a6-4284-b852-a890a915b0c7', 'Isabela Castro Dias', '00112233456', '11911009987', 'isabela.dias@enterprise.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('717cf63f-050f-470f-8694-00468a76dbd3', 'João Pedro Torres Monteiro', '11223344567', '11900998876', 'joao.monteiro@group.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('9ded8404-aaf1-44e8-ba82-cf01de07dde3', 'Larissa Fernandes Ribeiro', '22334455678', '11999887765', 'larissa.ribeiro@corporation.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('1b73618d-b2d8-4c03-a1af-7c2aa030e3cf', 'Marcos Vinicius Gomes Pinto', '33445566789', '11988776654', 'marcos.pinto@company.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('e94aabdd-f343-43a2-91a5-c1dedac9584b', 'Natália Alves Mendes', '44556677890', '11977665543', 'natalia.mendes@organization.com', '2025-10-29 23:14:57.896', '2025-10-29 23:14:57.896');
INSERT INTO public.customers VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Pedro Henrique Almeida', '12345678911', '11912345678', 'pedro.almeida@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('b2c3d4e5-f6g7-8901-bcde-f23456789012', 'Mariana Costa Santos', '23456789022', '11923456789', 'mariana.santos@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('c3d4e5f6-g7h8-9012-cdef-345678901234', 'Rafael Silva Oliveira', '34567890133', '11934567890', 'rafael.oliveira@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('d4e5f6g7-h8i9-0123-defg-456789012345', 'Amanda Pereira Lima', '45678901244', '11945678901', 'amanda.lima@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('e5f6g7h8-i9j0-1234-efgh-567890123456', 'Lucas Rodrigues Souza', '56789012355', '11956789012', 'lucas.souza@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('f6g7h8i9-j0k1-2345-fghi-678901234567', 'Juliana Alves Costa', '67890123466', '11967890123', 'juliana.costa@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('g7h8i9j0-k1l2-3456-ghij-789012345678', 'Bruno Martins Pereira', '78901234577', '11978901234', 'bruno.pereira@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('h8i9j0k1-l2m3-4567-hijk-890123456789', 'Camila Ribeiro Silva', '89012345688', '11989012345', 'camila.silva@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('i9j0k1l2-m3n4-5678-ijkl-901234567890', 'Diego Oliveira Santos', '90123456799', '11990123456', 'diego.santos@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('j0k1l2m3-n4o5-6789-jklm-012345678901', 'Fernanda Souza Almeida', '01234567800', '11901234567', 'fernanda.almeida@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('k1l2m3n4-o5p6-7890-klmn-123456789012', 'Rodrigo Costa Lima', '12345678912', '11912345679', 'rodrigo.lima@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('l2m3n4o5-p6q7-8901-lmno-234567890123', 'Patricia Santos Oliveira', '23456789023', '11923456780', 'patricia.oliveira@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('m3n4o5p6-q7r8-9012-mnop-345678901234', 'Thiago Pereira Souza', '34567890134', '11934567891', 'thiago.souza@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('n4o5p6q7-r8s9-0123-nopq-456789012345', 'Vanessa Lima Costa', '45678901245', '11945678902', 'vanessa.costa@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('o5p6q7r8-s9t0-1234-opqr-567890123456', 'Marcos Almeida Santos', '56789012356', '11956789013', 'marcos.santos@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('p6q7r8s9-t0u1-2345-pqrs-678901234567', 'Cristina Oliveira Pereira', '67890123467', '11967890124', 'cristina.pereira@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('q7r8s9t0-u1v2-3456-qrst-789012345678', 'André Souza Rodrigues', '78901234578', '11978901235', 'andre.rodrigues@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('r8s9t0u1-v2w3-4567-rstu-890123456789', 'Simone Costa Alves', '89012345689', '11989012346', 'simone.alves@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('s9t0u1v2-w3x4-5678-stuv-901234567890', 'Roberto Silva Lima', '90123456790', '11990123457', 'roberto.lima@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('t0u1v2w3-x4y5-6789-tuvw-012345678901', 'Tatiane Santos Souza', '01234567801', '11901234568', 'tatiane.souza@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('u1v2w3x4-y5z6-7890-uvwx-123456789012', 'Fábio Oliveira Costa', '12345678913', '11912345680', 'fabio.costa@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('v2w3x4y5-z6a7-8901-vwxy-234567890123', 'Priscila Pereira Almeida', '23456789024', '11923456781', 'priscila.almeida@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('w3x4y5z6-a7b8-9012-wxyz-345678901234', 'Ricardo Lima Santos', '34567890135', '11934567892', 'ricardo.santos@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');
INSERT INTO public.customers VALUES ('x4y5z6a7-b8c9-0123-xyza-456789012345', 'Daniela Costa Oliveira', '45678901246', '11945678903', 'daniela.oliveira@email.com', '2025-10-23 16:01:45.534', '2025-10-23 16:01:45.534');


--
-- TOC entry 3463 (class 0 OID 16473)
-- Dependencies: 220
-- Data for Name: order_itens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 2, '1d057404-ca9b-48a4-bb94-97890e1f504b', '81a01734-8575-4df7-9cfa-4c98a0f81be1', '2025-10-20 08:00:15.123', '2025-10-20 08:00:15.123');
INSERT INTO public.order_itens VALUES ('b2c3d4e5-f6g7-8901-bcde-f23456789012', 1, '1d057404-ca9b-48a4-bb94-97890e1f504b', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-20 08:00:15.123', '2025-10-20 08:00:15.123');
INSERT INTO public.order_itens VALUES ('c3d4e5f6-g7h8-9012-cdef-345678901234', 1, '7007534d-d82d-4cbc-b76a-387134ad8e8b', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-20 08:05:22.456', '2025-10-20 08:05:22.456');
INSERT INTO public.order_itens VALUES ('d4e5f6g7-h8i9-0123-defg-456789012345', 1, '7007534d-d82d-4cbc-b76a-387134ad8e8b', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 08:05:22.456', '2025-10-20 08:05:22.456');
INSERT INTO public.order_itens VALUES ('e5f6g7h8-i9j0-1234-efgh-567890123456', 1, '158d394a-7e13-41f3-84ac-7c4fb9da9a13', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-20 08:10:30.789', '2025-10-20 08:10:30.789');
INSERT INTO public.order_itens VALUES ('f6g7h8i9-j0k1-2345-fghi-678901234567', 1, '158d394a-7e13-41f3-84ac-7c4fb9da9a13', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-20 08:10:30.789', '2025-10-20 08:10:30.789');
INSERT INTO public.order_itens VALUES ('g7h8i9j0-k1l2-3456-ghij-789012345678', 1, '2cffa0b8-ca2c-471b-9753-60a436f75de8', 'ed41ec9e-df07-4237-9193-d78d5f2845a1', '2025-10-20 08:20:45.012', '2025-10-20 08:20:45.012');
INSERT INTO public.order_itens VALUES ('h8i9j0k1-l2m3-4567-hijk-890123456789', 1, '2cffa0b8-ca2c-471b-9753-60a436f75de8', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-20 08:20:45.012', '2025-10-20 08:20:45.012');
INSERT INTO public.order_itens VALUES ('i9j0k1l2-m3n4-5678-ijkl-901234567890', 1, 'eb6cf66f-c7a4-466d-96fa-35481524c38a', '6bb88569-dd14-41e5-b3c9-9322e9125446', '2025-10-20 08:30:55.345', '2025-10-20 08:30:55.345');
INSERT INTO public.order_itens VALUES ('j0k1l2m3-n4o5-6789-jklm-012345678901', 1, 'eb6cf66f-c7a4-466d-96fa-35481524c38a', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-20 08:30:55.345', '2025-10-20 08:30:55.345');
INSERT INTO public.order_itens VALUES ('k1l2m3n4-o5p6-7890-klmn-123456789012', 1, '6ac0bf0b-f272-4f3b-933b-d18f789de042', '7f4e3124-fb0b-490c-ac7d-370088de65bb', '2025-10-20 08:33:10.678', '2025-10-20 08:33:10.678');
INSERT INTO public.order_itens VALUES ('l2m3n4o5-p6q7-8901-lmno-234567890123', 1, '6ac0bf0b-f272-4f3b-933b-d18f789de042', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-20 08:33:10.678', '2025-10-20 08:33:10.678');
INSERT INTO public.order_itens VALUES ('m3n4o5p6-q7r8-9012-mnop-345678901234', 2, '5ef796d1-de4a-4c01-be23-ef350ba28058', 'b83c4569-2d66-4a75-b567-d56157d20143', '2025-10-20 08:37:25.901', '2025-10-20 08:37:25.901');
INSERT INTO public.order_itens VALUES ('n4o5p6q7-r8s9-0123-nopq-456789012345', 1, '5ef796d1-de4a-4c01-be23-ef350ba28058', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-20 08:37:25.901', '2025-10-20 08:37:25.901');
INSERT INTO public.order_itens VALUES ('o5p6q7r8-s9t0-1234-opqr-567890123456', 1, '5cbe4a2e-8138-49a6-bba0-2062eb0d3b5c', '56222784-51e6-4219-8c45-c55abcdd65f4', '2025-10-20 08:49:40.234', '2025-10-20 08:49:40.234');
INSERT INTO public.order_itens VALUES ('p6q7r8s9-t0u1-2345-pqrs-678901234567', 1, '5cbe4a2e-8138-49a6-bba0-2062eb0d3b5c', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 08:49:40.234', '2025-10-20 08:49:40.234');
INSERT INTO public.order_itens VALUES ('q7r8s9t0-u1v2-3456-qrst-789012345678', 1, '52ef88f3-235e-4570-a195-f9d18b4bbf54', 'a79e449b-52b6-4024-9032-cb9d76cc9666', '2025-10-20 08:52:55.567', '2025-10-20 08:52:55.567');
INSERT INTO public.order_itens VALUES ('r8s9t0u1-v2w3-4567-rstu-890123456789', 1, '52ef88f3-235e-4570-a195-f9d18b4bbf54', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-20 08:52:55.567', '2025-10-20 08:52:55.567');
INSERT INTO public.order_itens VALUES ('s9t0u1v2-w3x4-5678-stuv-901234567890', 1, '23a06d9e-8b3f-44d0-a194-6e4e4de4f1c2', '0ae4d490-74d5-45c2-9667-097c4a777fdd', '2025-10-20 08:57:05.89', '2025-10-20 08:57:05.89');
INSERT INTO public.order_itens VALUES ('t0u1v2w3-x4y5-6789-tuvw-012345678901', 1, '23a06d9e-8b3f-44d0-a194-6e4e4de4f1c2', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-20 08:57:05.89', '2025-10-20 08:57:05.89');
INSERT INTO public.order_itens VALUES ('u1v2w3x4-y5z6-7890-uvwx-123456789012', 1, 'b2dad1da-d0eb-4f2a-b479-bc9ca0cce425', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-20 08:59:20.123', '2025-10-20 08:59:20.123');
INSERT INTO public.order_itens VALUES ('v2w3x4y5-z6a7-8901-vwxy-234567890123', 1, 'b2dad1da-d0eb-4f2a-b479-bc9ca0cce425', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-20 08:59:20.123', '2025-10-20 08:59:20.123');
INSERT INTO public.order_itens VALUES ('w3x4y5z6-a7b8-9012-wxyz-345678901234', 1, '1b8156e6-69b9-4c57-afe3-51c732eb35c2', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-20 09:00:35.456', '2025-10-20 09:00:35.456');
INSERT INTO public.order_itens VALUES ('x4y5z6a7-b8c9-0123-xyza-456789012345', 1, '1b8156e6-69b9-4c57-afe3-51c732eb35c2', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-20 09:00:35.456', '2025-10-20 09:00:35.456');
INSERT INTO public.order_itens VALUES ('f1f9b14a-2422-4014-8ab5-b7210914964f', 1, 'ce85ca53-b8a5-49d1-a0ff-d6b1d398edfc', '81a01734-8575-4df7-9cfa-4c98a0f81be1', '2025-10-20 10:02:15.123', '2025-10-20 10:02:15.123');
INSERT INTO public.order_itens VALUES ('6ac32fd6-8110-4733-86fd-eb02f6c199da', 1, 'ce85ca53-b8a5-49d1-a0ff-d6b1d398edfc', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-20 10:02:15.123', '2025-10-20 10:02:15.123');
INSERT INTO public.order_itens VALUES ('e7a11984-8036-4035-b944-29183461cb26', 1, '8dad126c-ed64-4bc1-a1d1-56e8acf9368b', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-20 10:08:45.456', '2025-10-20 10:08:45.456');
INSERT INTO public.order_itens VALUES ('5d4a9bb3-323d-4928-942c-949047b18421', 1, '8dad126c-ed64-4bc1-a1d1-56e8acf9368b', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 10:08:45.456', '2025-10-20 10:08:45.456');
INSERT INTO public.order_itens VALUES ('6d01a98c-5fea-418e-a54c-2eb0ad18fc6d', 1, '70dee084-26a6-4c93-b779-f2e889714c78', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-20 10:15:22.789', '2025-10-20 10:15:22.789');
INSERT INTO public.order_itens VALUES ('0f231f3c-ef13-4c42-a123-dd844cc0fc4e', 1, '70dee084-26a6-4c93-b779-f2e889714c78', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-20 10:15:22.789', '2025-10-20 10:15:22.789');
INSERT INTO public.order_itens VALUES ('a0fb0aba-279c-4c63-8b88-21dc1af01ba9', 1, '104d8b4f-7460-4739-972c-236bf4baee37', 'ed41ec9e-df07-4237-9193-d78d5f2845a1', '2025-10-20 10:23:10.012', '2025-10-20 10:23:10.012');
INSERT INTO public.order_itens VALUES ('e16e9c0a-9903-48e4-b3ce-0af5923d4480', 1, '104d8b4f-7460-4739-972c-236bf4baee37', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-20 10:23:10.012', '2025-10-20 10:23:10.012');
INSERT INTO public.order_itens VALUES ('10961e0d-df58-4116-ae5d-8a16d0010287', 1, '1c9c9292-3baa-43f0-bc8f-305bc81c48a3', '6bb88569-dd14-41e5-b3c9-9322e9125446', '2025-10-20 10:31:55.345', '2025-10-20 10:31:55.345');
INSERT INTO public.order_itens VALUES ('2800fd52-870e-4cc2-90d4-183181ee2734', 1, '1c9c9292-3baa-43f0-bc8f-305bc81c48a3', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-20 10:31:55.345', '2025-10-20 10:31:55.345');
INSERT INTO public.order_itens VALUES ('8f7136f6-716a-4f50-b0e5-a5075d7a9129', 1, 'e8f1b187-3ff7-4b30-8b47-3d161a8cf1d4', '7f4e3124-fb0b-490c-ac7d-370088de65bb', '2025-10-20 10:42:30.678', '2025-10-20 10:42:30.678');
INSERT INTO public.order_itens VALUES ('833da1e6-b3b1-4c51-824d-f25c2d01e7c0', 1, 'e8f1b187-3ff7-4b30-8b47-3d161a8cf1d4', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-20 10:42:30.678', '2025-10-20 10:42:30.678');
INSERT INTO public.order_itens VALUES ('884f6472-0a44-4571-b111-bbf858652959', 2, '7d2c17cc-44aa-4569-80cf-ac8624c551ce', 'b83c4569-2d66-4a75-b567-d56157d20143', '2025-10-20 10:48:17.901', '2025-10-20 10:48:17.901');
INSERT INTO public.order_itens VALUES ('05bc3315-868a-4098-bbbf-fee700604956', 1, '7d2c17cc-44aa-4569-80cf-ac8624c551ce', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-20 10:48:17.901', '2025-10-20 10:48:17.901');
INSERT INTO public.order_itens VALUES ('35ac19da-bcf1-482b-bc34-836ebbf2c80f', 1, '55eef92d-4965-4a7f-86c3-d7ed7d6f182f', '56222784-51e6-4219-8c45-c55abcdd65f4', '2025-10-20 10:55:05.234', '2025-10-20 10:55:05.234');
INSERT INTO public.order_itens VALUES ('f7f23b47-d141-45e5-9ab7-aacdd133890a', 1, '55eef92d-4965-4a7f-86c3-d7ed7d6f182f', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 10:55:05.234', '2025-10-20 10:55:05.234');
INSERT INTO public.order_itens VALUES ('1764d159-2441-4834-bf38-5e7d111b965c', 1, '283bfc31-fc96-4ca5-b31a-9ce560559bb5', 'a79e449b-52b6-4024-9032-cb9d76cc9666', '2025-10-20 11:03:40.567', '2025-10-20 11:03:40.567');
INSERT INTO public.order_itens VALUES ('62391c91-b3bc-40df-a00c-6061abeb88ce', 1, '283bfc31-fc96-4ca5-b31a-9ce560559bb5', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-20 11:03:40.567', '2025-10-20 11:03:40.567');
INSERT INTO public.order_itens VALUES ('32323433-b368-42a5-92db-b3af77aab46b', 1, '099fc48f-8eac-4cf7-b4ab-95ee7cce9cc8', '0ae4d490-74d5-45c2-9667-097c4a777fdd', '2025-10-20 11:12:25.89', '2025-10-20 11:12:25.89');
INSERT INTO public.order_itens VALUES ('ff0ffb63-35f5-4f6f-a065-e9cca912ae2c', 1, '099fc48f-8eac-4cf7-b4ab-95ee7cce9cc8', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-20 11:12:25.89', '2025-10-20 11:12:25.89');
INSERT INTO public.order_itens VALUES ('df3550f1-b9f1-4e92-b2e8-a0bd2209ad03', 1, '0cd78a7a-83d6-498d-ad65-21312321a630', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-20 11:20:15.123', '2025-10-20 11:20:15.123');
INSERT INTO public.order_itens VALUES ('a6bdd578-f21a-4cd8-8d84-d42afd1154f6', 1, '0cd78a7a-83d6-498d-ad65-21312321a630', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-20 11:20:15.123', '2025-10-20 11:20:15.123');
INSERT INTO public.order_itens VALUES ('f779559c-b449-4183-9550-54fa7494933e', 1, '2fc8dd5b-96b4-4e41-8a4d-b9c18d62ec02', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-20 11:28:50.456', '2025-10-20 11:28:50.456');
INSERT INTO public.order_itens VALUES ('25a4ec02-3cb5-4a3a-ba5a-b48bbb5fc43f', 1, '2fc8dd5b-96b4-4e41-8a4d-b9c18d62ec02', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-20 11:28:50.456', '2025-10-20 11:28:50.456');
INSERT INTO public.order_itens VALUES ('8b702b02-d153-4ab1-b634-8782e46a6d67', 1, 'aa754ece-2814-4dcb-85c4-fbf80753b8e3', '355d2ad5-0846-4ec3-ab59-ecf09e0ab6fb', '2025-10-20 11:35:15.123', '2025-10-20 11:35:15.123');
INSERT INTO public.order_itens VALUES ('c771b34f-a3ab-4cb9-854a-20d511517083', 1, 'aa754ece-2814-4dcb-85c4-fbf80753b8e3', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 11:35:15.123', '2025-10-20 11:35:15.123');
INSERT INTO public.order_itens VALUES ('2592e3f7-2513-4855-a6b0-18106e4abc10', 1, 'b6818216-9b70-4cdf-bba9-46c7bfec55d8', 'e3f616e6-0445-4f3a-b18a-e96f9a54dd9a', '2025-10-20 11:42:22.456', '2025-10-20 11:42:22.456');
INSERT INTO public.order_itens VALUES ('75c28765-722d-4340-8176-887e5fd010cb', 1, 'b6818216-9b70-4cdf-bba9-46c7bfec55d8', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-20 11:42:22.456', '2025-10-20 11:42:22.456');
INSERT INTO public.order_itens VALUES ('1ff05615-6026-4c88-a873-8e7e286762f8', 1, 'e323485d-cc9e-4bd7-9fbc-1b36e28fb552', '91f1e336-bbfa-44f1-a0b1-fe45f8a0c64f', '2025-10-20 11:48:30.789', '2025-10-20 11:48:30.789');
INSERT INTO public.order_itens VALUES ('950ba05b-13b4-41d0-a1d2-d46b025eaa55', 1, 'e323485d-cc9e-4bd7-9fbc-1b36e28fb552', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-20 11:48:30.789', '2025-10-20 11:48:30.789');
INSERT INTO public.order_itens VALUES ('78205a29-97f7-4262-b7b7-940fefa556a6', 1, '44f99afc-2f6c-491f-8944-6187bff0cd25', 'a736ac7d-3c3f-4365-bc10-920afc3266f4', '2025-10-20 11:55:45.012', '2025-10-20 11:55:45.012');
INSERT INTO public.order_itens VALUES ('cbb5f8c6-3c20-4bd1-92c9-3cbb13f84e8b', 1, '44f99afc-2f6c-491f-8944-6187bff0cd25', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-20 11:55:45.012', '2025-10-20 11:55:45.012');
INSERT INTO public.order_itens VALUES ('f2cc6653-de21-4984-81e4-04a72c7e9961', 1, '4b96a283-b921-4b5e-8f79-0eee7cc144c0', '482c7b3e-1a5f-4d8a-bf32-8c9e1d4a7b2c', '2025-10-20 12:02:10.345', '2025-10-20 12:02:10.345');
INSERT INTO public.order_itens VALUES ('29c63b33-84bf-4e88-90fd-e2c0de7d98ae', 1, '4b96a283-b921-4b5e-8f79-0eee7cc144c0', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-20 12:02:10.345', '2025-10-20 12:02:10.345');
INSERT INTO public.order_itens VALUES ('70df80a3-c577-427d-aa6c-b098899180a7', 1, '37e3c96c-96f2-4c0a-965e-e822ed4606b6', '17f31273-e091-491d-ae2f-ea9324d15d62', '2025-10-20 12:08:25.678', '2025-10-20 12:08:25.678');
INSERT INTO public.order_itens VALUES ('970692b2-b3a7-4d68-acfa-a8bca43fdcf9', 1, '37e3c96c-96f2-4c0a-965e-e822ed4606b6', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-20 12:08:25.678', '2025-10-20 12:08:25.678');
INSERT INTO public.order_itens VALUES ('b697d667-29aa-4d32-a267-a5a8527bccc9', 1, '60974322-2359-4779-9414-8fdbd75396fa', '7a4e9b5g-3c7h-6f0c-dh54-0e1g3f6c9d4e', '2025-10-20 12:15:40.901', '2025-10-20 12:15:40.901');
INSERT INTO public.order_itens VALUES ('3c51bc03-ad72-4f2d-b274-0b1ccff201e3', 1, '60974322-2359-4779-9414-8fdbd75396fa', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-20 12:15:40.901', '2025-10-20 12:15:40.901');
INSERT INTO public.order_itens VALUES ('82e3be9d-9f7b-48db-b188-aac0f2e62811', 1, '31152fee-8115-4c4c-9fa2-7acb93dcbe98', '30731ea5-8673-4aa3-ace1-3d6f7927896c', '2025-10-20 12:20:55.234', '2025-10-20 12:20:55.234');
INSERT INTO public.order_itens VALUES ('eb14be4d-d93c-4588-89ab-4f409cff0d8f', 1, '31152fee-8115-4c4c-9fa2-7acb93dcbe98', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-20 12:20:55.234', '2025-10-20 12:20:55.234');
INSERT INTO public.order_itens VALUES ('860cb659-6e8c-4d1b-ac12-2035d56af652', 1, '83f330dc-3dec-4293-ac25-2f9a1fb55aac', 'daf29ce4-ade8-424d-998d-5850ec136c21', '2025-10-20 12:25:15.567', '2025-10-20 12:25:15.567');
INSERT INTO public.order_itens VALUES ('c1dd573f-79b7-4ba5-bb76-2c55b5bdf7c6', 1, '83f330dc-3dec-4293-ac25-2f9a1fb55aac', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-20 12:25:15.567', '2025-10-20 12:25:15.567');
INSERT INTO public.order_itens VALUES ('4c279138-f3a8-43b9-88fc-db8f9bbae3d0', 1, '1c672639-702f-4aaf-a7dc-f33c5e4598d0', '0a96121e-e5a1-4f2c-87b6-ad270e66cf8a', '2025-10-20 12:28:30.89', '2025-10-20 12:28:30.89');
INSERT INTO public.order_itens VALUES ('01f1876a-e0cf-4480-92d1-b47a1f7d28c8', 1, '1c672639-702f-4aaf-a7dc-f33c5e4598d0', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-20 12:28:30.89', '2025-10-20 12:28:30.89');
INSERT INTO public.order_itens VALUES ('eee42441-05f8-4a1e-a08b-1ab9a394f84d', 1, 'cdbcc58a-3407-49b6-af57-0de805f49e5a', 'fae558c2-129d-40b2-a104-5f6db5df912c', '2025-10-20 12:32:45.123', '2025-10-20 12:32:45.123');
INSERT INTO public.order_itens VALUES ('64c6d9be-5ca9-4498-accd-1ef1c691c673', 1, 'cdbcc58a-3407-49b6-af57-0de805f49e5a', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-20 12:32:45.123', '2025-10-20 12:32:45.123');
INSERT INTO public.order_itens VALUES ('9bbcb78e-d91f-449a-9398-194cc608e533', 1, '082c6814-4851-4b6d-a0f2-9a595b9bdb69', 'e70064a8-9be6-441a-89e4-4b41536c37fe', '2025-10-20 12:38:20.456', '2025-10-20 12:38:20.456');
INSERT INTO public.order_itens VALUES ('e97bbb6b-1b87-4d7b-81ae-085f4a3c02d4', 1, '082c6814-4851-4b6d-a0f2-9a595b9bdb69', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-20 12:38:20.456', '2025-10-20 12:38:20.456');
INSERT INTO public.order_itens VALUES ('ff7ecf0e-2883-4919-bcd6-922126b59e0c', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567891', '355d2ad5-0846-4ec3-ab59-ecf09e0ab6fb', '2025-10-22 08:00:00', '2025-10-22 08:00:00');
INSERT INTO public.order_itens VALUES ('31399ab4-e9f7-49c9-85cb-928475889800', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567891', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-22 08:00:00', '2025-10-22 08:00:00');
INSERT INTO public.order_itens VALUES ('b7b87a90-44da-4e53-8b36-3198a31a7b67', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567892', '482c7b3e-1a5f-4d8a-bf32-8c9e1d4a7b2c', '2025-10-22 08:30:00', '2025-10-22 08:30:00');
INSERT INTO public.order_itens VALUES ('389bec84-0621-408c-ae99-703086a8af80', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567892', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-22 08:30:00', '2025-10-22 08:30:00');
INSERT INTO public.order_itens VALUES ('065c5af7-c3fc-4578-997a-6c207b442dfd', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567893', '693d8a4f-2b6g-5e9b-cg43-9d0f2e5b8c3d', '2025-10-22 09:00:00', '2025-10-22 09:00:00');
INSERT INTO public.order_itens VALUES ('4416317f-29d3-4da6-86b5-33d361241422', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567893', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-22 09:00:00', '2025-10-22 09:00:00');
INSERT INTO public.order_itens VALUES ('836e198b-4d5a-4501-9c1d-b5910c4aaad5', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567894', '7a4e9b5g-3c7h-6f0c-dh54-0e1g3f6c9d4e', '2025-10-22 09:30:00', '2025-10-22 09:30:00');
INSERT INTO public.order_itens VALUES ('7f46bdc9-011c-4d99-823b-e508f04a9421', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567894', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-22 09:30:00', '2025-10-22 09:30:00');
INSERT INTO public.order_itens VALUES ('8d93ea86-a42c-44b1-8a7d-32a4b57b195b', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567895', '8b5f0c6h-4d8i-7g1d-ei65-1f2h4g7d0e5f', '2025-10-22 10:15:00', '2025-10-22 10:15:00');
INSERT INTO public.order_itens VALUES ('902cd5ef-1b0d-430b-8026-8432f22e2119', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567895', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-22 10:15:00', '2025-10-22 10:15:00');
INSERT INTO public.order_itens VALUES ('b0cba9ec-5593-476d-94e3-7050711669e5', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567896', '9c6g1d7i-5e9j-8h2e-fj76-2g3i5h8e1f6g', '2025-10-22 10:50:00', '2025-10-22 10:50:00');
INSERT INTO public.order_itens VALUES ('fbca263e-f331-4768-85b3-9c9b24fcb8af', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567896', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-22 10:50:00', '2025-10-22 10:50:00');
INSERT INTO public.order_itens VALUES ('4e1e683a-0c38-4f7a-ba2c-a6a637cd55c6', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567897', '0d7h2e8j-6f0k-9i3f-gk87-3h4j6i9f2g7h', '2025-10-22 11:45:00', '2025-10-22 11:45:00');
INSERT INTO public.order_itens VALUES ('fce5cf0a-4dd5-4f9f-8384-a30500d81624', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567897', '7fdc228d-9040-4431-9e1b-c35b0eb68367', '2025-10-22 11:45:00', '2025-10-22 11:45:00');
INSERT INTO public.order_itens VALUES ('0e792e16-efd8-4c81-98d6-0c8e19997304', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567898', '1e8i3f9k-7g1l-0j4g-hl98-4i5k7j0g3h8i', '2025-10-22 12:20:00', '2025-10-22 12:20:00');
INSERT INTO public.order_itens VALUES ('5152d1bc-514b-435d-991a-682774794ddc', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567898', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-22 12:20:00', '2025-10-22 12:20:00');
INSERT INTO public.order_itens VALUES ('85c7088e-c386-4394-9793-7cd13d8177b6', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567899', '2f9j4g0l-8h2m-1k5h-im09-5j6l8k1h4i9j', '2025-10-22 12:50:00', '2025-10-22 12:50:00');
INSERT INTO public.order_itens VALUES ('cb942b25-9277-4044-b5b8-330ce3b04529', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567899', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-22 12:50:00', '2025-10-22 12:50:00');
INSERT INTO public.order_itens VALUES ('7771f105-0afc-411e-acc6-9dd31e38cf94', 1, '202ebe56-b9f9-419c-a78a-243f8e225e60', '355d2ad5-0846-4ec3-ab59-ecf09e0ab6fb', '2025-10-20 12:48:18.234', '2025-10-20 12:48:18.234');
INSERT INTO public.order_itens VALUES ('c34939f3-831a-4536-8c3a-e5b69d40c56a', 1, '202ebe56-b9f9-419c-a78a-243f8e225e60', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 12:48:18.234', '2025-10-20 12:48:18.234');
INSERT INTO public.order_itens VALUES ('d5fc77a9-bca5-47ad-9c65-adc878147e36', 1, '1d667dd0-c87b-4a51-b4cd-48dae1cdae97', 'dbf40098-59e9-4338-81cd-72a23fdf1ebd', '2025-10-20 12:52:27.567', '2025-10-20 12:52:27.567');
INSERT INTO public.order_itens VALUES ('1d84358e-3248-48b1-a347-d6251263906c', 1, '1d667dd0-c87b-4a51-b4cd-48dae1cdae97', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-20 12:52:27.567', '2025-10-20 12:52:27.567');
INSERT INTO public.order_itens VALUES ('6f35c59c-e794-42e4-87a9-f33ffa709bf3', 1, '2abe1516-49f0-4104-a139-fa4e07f678d4', '693d8a4f-2b6g-5e9b-cg43-9d0f2e5b8c3d', '2025-10-20 12:57:35.89', '2025-10-20 12:57:35.89');
INSERT INTO public.order_itens VALUES ('a6627c6d-ed63-42af-9ceb-69f0d9e4276b', 1, '2abe1516-49f0-4104-a139-fa4e07f678d4', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-20 12:57:35.89', '2025-10-20 12:57:35.89');
INSERT INTO public.order_itens VALUES ('b843d4c2-59a9-47c7-825a-49cbdf13d2f3', 1, '80a60362-5f9f-426f-8b10-768e79d8d5b7', '1e8i3f9k-7g1l-0j4g-hl98-4i5k7j0g3h8i', '2025-10-20 13:03:42.123', '2025-10-20 13:03:42.123');
INSERT INTO public.order_itens VALUES ('44b0defc-a2de-4147-8616-36776a8e952e', 1, '80a60362-5f9f-426f-8b10-768e79d8d5b7', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-20 13:03:42.123', '2025-10-20 13:03:42.123');
INSERT INTO public.order_itens VALUES ('1ddff92c-c4a3-483e-a7b7-252cb94b6702', 1, '3d785e5c-4bb4-4b3f-a942-4d139c33d03e', '8b5f0c6h-4d8i-7g1d-ei65-1f2h4g7d0e5f', '2025-10-20 13:08:55.456', '2025-10-20 13:08:55.456');
INSERT INTO public.order_itens VALUES ('62dd2647-083d-4e25-a02e-a406fa178ef0', 1, '3d785e5c-4bb4-4b3f-a942-4d139c33d03e', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-20 13:08:55.456', '2025-10-20 13:08:55.456');
INSERT INTO public.order_itens VALUES ('54a36fa1-5aaf-4bef-af48-168147e37c59', 1, '067e56dc-8084-4145-acfe-93b247865247', '9c6g1d7i-5e9j-8h2e-fj76-2g3i5h8e1f6g', '2025-10-20 13:15:10.789', '2025-10-20 13:15:10.789');
INSERT INTO public.order_itens VALUES ('3be57bac-4f81-40ca-ae3a-165685a5e398', 1, '067e56dc-8084-4145-acfe-93b247865247', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-20 13:15:10.789', '2025-10-20 13:15:10.789');
INSERT INTO public.order_itens VALUES ('e8fd52b5-c472-4576-bb07-6532183588be', 1, '18fb5f8d-0338-4087-8860-d8ee712b5d48', '760d0eab-82c4-4656-8da4-72f64b2552d3', '2025-10-20 13:22:25.012', '2025-10-20 13:22:25.012');
INSERT INTO public.order_itens VALUES ('947b1320-ce9d-4557-b117-3aa544e916d6', 1, '18fb5f8d-0338-4087-8860-d8ee712b5d48', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-20 13:22:25.012', '2025-10-20 13:22:25.012');
INSERT INTO public.order_itens VALUES ('a30ba015-757c-4640-9f58-d39f72b2837f', 1, '89931a84-6803-49d8-9aec-e90f6aee0d36', '4h1l6i2n-0j4o-3m7j-ko21-7l8n0m3j6k1l', '2025-10-20 13:28:40.345', '2025-10-20 13:28:40.345');
INSERT INTO public.order_itens VALUES ('bd5b2c9f-271a-459e-8fb7-d522b958e475', 1, '89931a84-6803-49d8-9aec-e90f6aee0d36', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-20 13:28:40.345', '2025-10-20 13:28:40.345');
INSERT INTO public.order_itens VALUES ('32b2c1ec-45af-4d71-9629-51928aeac76f', 1, '735c3535-efa5-4d29-803d-66a783eeee81', '5i2m7j3o-1k5p-4n8k-lp32-8m9o1n4k7l2m', '2025-10-20 13:35:55.678', '2025-10-20 13:35:55.678');
INSERT INTO public.order_itens VALUES ('4320c852-bf4e-4940-acc4-f8c7ef7a164c', 1, '735c3535-efa5-4d29-803d-66a783eeee81', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-20 13:35:55.678', '2025-10-20 13:35:55.678');
INSERT INTO public.order_itens VALUES ('35c617a0-ae6b-485a-bc14-de0e658a4439', 1, '1db79c9a-ef63-4e24-a273-3f6336d2b74c', '81daaca8-44ce-4534-8776-577370cb8ac6', '2025-10-20 13:42:15.901', '2025-10-20 13:42:15.901');
INSERT INTO public.order_itens VALUES ('e8fb65b5-9f72-4365-a67d-382bfbf07dfa', 1, '1db79c9a-ef63-4e24-a273-3f6336d2b74c', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-20 13:42:15.901', '2025-10-20 13:42:15.901');
INSERT INTO public.order_itens VALUES ('abe3b035-cd80-4d5c-b596-97715f18c641', 1, '6def25c7-7c50-4fbe-a248-4147276484d1', '827fc92f-6a3b-4f2f-803a-6755afdf9005', '2025-10-20 13:48:30.234', '2025-10-20 13:48:30.234');
INSERT INTO public.order_itens VALUES ('431e2190-f635-4a4a-ab83-0cc7e13d5f21', 1, '6def25c7-7c50-4fbe-a248-4147276484d1', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-20 13:48:30.234', '2025-10-20 13:48:30.234');
INSERT INTO public.order_itens VALUES ('1aaef717-d41a-4a7e-9db8-1fe379b27803', 1, 'c2fbbe06-0488-4f71-8db3-b99db9dc7f22', '21df60fb-7c82-499e-b472-be9ab0d5e903', '2025-10-20 13:55:45.567', '2025-10-20 13:55:45.567');
INSERT INTO public.order_itens VALUES ('18849c33-4bb9-4239-a7b4-35e2043b450e', 1, 'c2fbbe06-0488-4f71-8db3-b99db9dc7f22', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-20 13:55:45.567', '2025-10-20 13:55:45.567');
INSERT INTO public.order_itens VALUES ('d40ab5f9-4885-45cd-98db-f10dbf686ef0', 1, '8b15a701-3642-4529-b53e-3f64084635e4', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-20 14:05:15.123', '2025-10-20 14:05:15.123');
INSERT INTO public.order_itens VALUES ('c83771ed-f8c7-464a-bd91-35756f32fd57', 1, '8b15a701-3642-4529-b53e-3f64084635e4', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 14:05:15.123', '2025-10-20 14:05:15.123');
INSERT INTO public.order_itens VALUES ('0dd7362e-94f2-4ba0-9dd2-1e2b26a3cead', 1, 'fdf20aa8-f75d-4618-87a8-ac4ddb0da0ae', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-20 14:12:22.456', '2025-10-20 14:12:22.456');
INSERT INTO public.order_itens VALUES ('01c98461-eb23-4afc-a606-8d94cf02db36', 1, 'fdf20aa8-f75d-4618-87a8-ac4ddb0da0ae', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-20 14:12:22.456', '2025-10-20 14:12:22.456');
INSERT INTO public.order_itens VALUES ('6b40a7f0-af5a-4f09-af27-13482d2a281e', 1, '24216468-a617-4982-8df5-fb986e78c183', 'ed41ec9e-df07-4237-9193-d78d5f2845a1', '2025-10-20 14:18:30.789', '2025-10-20 14:18:30.789');
INSERT INTO public.order_itens VALUES ('3e05fb3e-d645-4dee-80e4-26e378fc736f', 1, '24216468-a617-4982-8df5-fb986e78c183', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-20 14:18:30.789', '2025-10-20 14:18:30.789');
INSERT INTO public.order_itens VALUES ('d0a8d560-8091-4d98-bd10-2c3f7eb5dfb6', 1, 'c850285f-cf14-451a-82f8-610e6a14403e', '0ae4d490-74d5-45c2-9667-097c4a777fdd', '2025-10-20 14:25:45.012', '2025-10-20 14:25:45.012');
INSERT INTO public.order_itens VALUES ('37b25085-abae-43a9-8d35-a9e246897866', 1, 'c850285f-cf14-451a-82f8-610e6a14403e', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-20 14:25:45.012', '2025-10-20 14:25:45.012');
INSERT INTO public.order_itens VALUES ('3b4ef60f-a9d6-45aa-af1b-746df8fba470', 1, '6a3f7bf9-3bfb-4a44-ab37-b8083d10531f', '6bb88569-dd14-41e5-b3c9-9322e9125446', '2025-10-20 14:32:10.345', '2025-10-20 14:32:10.345');
INSERT INTO public.order_itens VALUES ('ad4b55fd-9eff-4e5c-adc9-86eb92702a70', 1, '6a3f7bf9-3bfb-4a44-ab37-b8083d10531f', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-20 14:32:10.345', '2025-10-20 14:32:10.345');
INSERT INTO public.order_itens VALUES ('6ec9447d-09e8-4e54-a530-6df4307036fb', 1, '58d29ed7-26a8-4717-9533-13e36d8095f4', '7f4e3124-fb0b-490c-ac7d-370088de65bb', '2025-10-20 14:38:25.678', '2025-10-20 14:38:25.678');
INSERT INTO public.order_itens VALUES ('3624a06b-89bc-47bd-8d5d-3cb6a487af2d', 1, '58d29ed7-26a8-4717-9533-13e36d8095f4', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-20 14:38:25.678', '2025-10-20 14:38:25.678');
INSERT INTO public.order_itens VALUES ('0aa43a43-4b71-4038-9f57-f6cc9f3c1d78', 1, '87bee23c-ed9d-4c2c-b06d-2294a86b545b', 'a548b045-dd94-4f99-8e26-16603ed0b1c5', '2025-10-20 14:45:40.901', '2025-10-20 14:45:40.901');
INSERT INTO public.order_itens VALUES ('a753a80d-500f-4654-80e2-dd21c2165370', 1, '87bee23c-ed9d-4c2c-b06d-2294a86b545b', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-20 14:45:40.901', '2025-10-20 14:45:40.901');
INSERT INTO public.order_itens VALUES ('7adb260c-2ed4-4234-81ce-63049a8e14a6', 1, '78f2487d-b4a0-4d82-a2c5-ec20ffabe41e', 'f0c0b4b3-98a5-4e5a-ad45-26397850e624', '2025-10-20 14:52:55.234', '2025-10-20 14:52:55.234');
INSERT INTO public.order_itens VALUES ('f59e6616-e8b0-4a6f-9621-800e289ccc47', 1, '78f2487d-b4a0-4d82-a2c5-ec20ffabe41e', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-20 14:52:55.234', '2025-10-20 14:52:55.234');
INSERT INTO public.order_itens VALUES ('4e2592ba-9002-4f5e-84c5-d3864fa3c24a', 1, 'ee23d0ea-7661-4233-8552-78eabaccdc4e', '658c26b1-bcb5-4b3e-859e-73b3f3fe2cac', '2025-10-20 14:58:15.567', '2025-10-20 14:58:15.567');
INSERT INTO public.order_itens VALUES ('a86f0b03-7aec-46c2-a1f6-52a3552ab38a', 1, 'ee23d0ea-7661-4233-8552-78eabaccdc4e', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-20 14:58:15.567', '2025-10-20 14:58:15.567');
INSERT INTO public.order_itens VALUES ('e5c12668-e209-4a44-bf4e-1e76f5a15b2b', 1, '89a1ba1c-1f80-4064-8450-4e42b4fbab9e', '81a01734-8575-4df7-9cfa-4c98a0f81be1', '2025-10-20 15:05:30.89', '2025-10-20 15:05:30.89');
INSERT INTO public.order_itens VALUES ('3ed77319-41b3-4ab2-a56a-26bc512bb712', 1, '89a1ba1c-1f80-4064-8450-4e42b4fbab9e', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-20 15:05:30.89', '2025-10-20 15:05:30.89');
INSERT INTO public.order_itens VALUES ('47fe2913-31ed-4ed9-9305-5ae9e7085e2b', 1, '3f436c90-5369-4f92-b50f-1d443e0fc9be', 'b83c4569-2d66-4a75-b567-d56157d20143', '2025-10-20 15:32:15.123', '2025-10-20 15:32:15.123');
INSERT INTO public.order_itens VALUES ('999d7e46-dfa0-4e39-b1e4-9d64bcf2ebeb', 1, '3f436c90-5369-4f92-b50f-1d443e0fc9be', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-20 15:32:15.123', '2025-10-20 15:32:15.123');
INSERT INTO public.order_itens VALUES ('696d014c-6001-47a4-9d65-f6f466bac140', 1, '31d27555-7f20-4491-98ab-a38b30a81ec2', 'd9c63121-bb9f-4f65-8c57-9e05ee2637ee', '2025-10-20 15:35:22.456', '2025-10-20 15:35:22.456');
INSERT INTO public.order_itens VALUES ('e5df4b5b-0c9b-437f-9247-e90f59ce5a85', 1, '31d27555-7f20-4491-98ab-a38b30a81ec2', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-20 15:35:22.456', '2025-10-20 15:35:22.456');
INSERT INTO public.order_itens VALUES ('76857118-2a1f-4d70-8ce6-bfbc22506b8b', 1, '8d26b4cf-c853-4468-907f-f870cbb361be', '9bac741b-b610-4b0b-9d71-e978dcdb8544', '2025-10-20 15:40:30.789', '2025-10-20 15:40:30.789');
INSERT INTO public.order_itens VALUES ('9ba7a0a3-938d-4285-8209-2fbe70016a07', 1, '8d26b4cf-c853-4468-907f-f870cbb361be', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-20 15:40:30.789', '2025-10-20 15:40:30.789');
INSERT INTO public.order_itens VALUES ('9a1bed40-6e5b-4470-80bf-fe4a55040c98', 1, '84f43b08-d539-4dcb-b39c-7429a3de8cf8', '20eb4499-49b7-49eb-8c29-07a5d7a59aa4', '2025-10-20 15:45:45.012', '2025-10-20 15:45:45.012');
INSERT INTO public.order_itens VALUES ('9bb0a17a-06a3-483f-8cfd-ecfd83b8c396', 1, '84f43b08-d539-4dcb-b39c-7429a3de8cf8', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-20 15:45:45.012', '2025-10-20 15:45:45.012');
INSERT INTO public.order_itens VALUES ('b8cc7681-fd55-4433-b0c1-74bfc8c5be4b', 1, '67a287fb-1593-4e85-bb5b-e426373f4ddb', 'a79e449b-52b6-4024-9032-cb9d76cc9666', '2025-10-20 15:52:10.345', '2025-10-20 15:52:10.345');
INSERT INTO public.order_itens VALUES ('88f01b71-1869-4023-9db8-edc08e1ac453', 1, '67a287fb-1593-4e85-bb5b-e426373f4ddb', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-20 15:52:10.345', '2025-10-20 15:52:10.345');
INSERT INTO public.order_itens VALUES ('39dbc764-998f-4b0d-95c8-4efef0f6a65e', 1, '2d88d7c3-6bef-4fe1-8632-1219e2843617', '56222784-51e6-4219-8c45-c55abcdd65f4', '2025-10-20 15:58:25.678', '2025-10-20 15:58:25.678');
INSERT INTO public.order_itens VALUES ('cf808830-400f-4204-985d-bf7b67660ff2', 1, '2d88d7c3-6bef-4fe1-8632-1219e2843617', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-20 15:58:25.678', '2025-10-20 15:58:25.678');
INSERT INTO public.order_itens VALUES ('152a70d6-6789-47a4-8a12-467a650849c3', 1, 'f58a2f17-1170-4b00-95e8-a0849c7dfd3a', '81a01734-8575-4df7-9cfa-4c98a0f81be1', '2025-10-20 16:05:40.901', '2025-10-20 16:05:40.901');
INSERT INTO public.order_itens VALUES ('798ca081-078c-4837-9d0f-07bebc13ac14', 1, 'f58a2f17-1170-4b00-95e8-a0849c7dfd3a', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-20 16:05:40.901', '2025-10-20 16:05:40.901');
INSERT INTO public.order_itens VALUES ('77124cd3-3c9b-4ec1-80db-5c8c31964d46', 1, 'b7f39c98-9f66-437a-90bb-4f1f3be77421', 'f0c0b4b3-98a5-4e5a-ad45-26397850e624', '2025-10-20 16:12:55.234', '2025-10-20 16:12:55.234');
INSERT INTO public.order_itens VALUES ('9ed654f4-593e-4fd0-80c4-2c0165a6030b', 1, 'b7f39c98-9f66-437a-90bb-4f1f3be77421', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-20 16:12:55.234', '2025-10-20 16:12:55.234');
INSERT INTO public.order_itens VALUES ('943cbd79-97a1-4110-afc0-c570acd6e454', 1, '98290be2-dc59-4d4c-9c16-a104b6ab945f', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-20 16:20:15.567', '2025-10-20 16:20:15.567');
INSERT INTO public.order_itens VALUES ('428a96b6-22c8-4a1f-a04a-b194c6e0ddba', 1, '98290be2-dc59-4d4c-9c16-a104b6ab945f', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-20 16:20:15.567', '2025-10-20 16:20:15.567');
INSERT INTO public.order_itens VALUES ('cc24efa7-62e3-44bb-ab82-00e5e8447bfe', 1, '1faaf7c1-76ad-40ec-b27e-f44a262d12b2', '0ae4d490-74d5-45c2-9667-097c4a777fdd', '2025-10-20 16:28:30.89', '2025-10-20 16:28:30.89');
INSERT INTO public.order_itens VALUES ('6f4f29ff-ba77-4ef4-b6d8-bce9b0e75b90', 1, '1faaf7c1-76ad-40ec-b27e-f44a262d12b2', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-20 16:28:30.89', '2025-10-20 16:28:30.89');
INSERT INTO public.order_itens VALUES ('cf7775dd-a94b-44b8-9557-3e918256bb86', 1, 'dd3923e0-8825-4834-b85f-7695f2aad923', 'ed41ec9e-df07-4237-9193-d78d5f2845a1', '2025-10-20 16:35:45.123', '2025-10-20 16:35:45.123');
INSERT INTO public.order_itens VALUES ('4cf89a46-a4d6-453d-8a8a-44010f66eb26', 1, 'dd3923e0-8825-4834-b85f-7695f2aad923', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-20 16:35:45.123', '2025-10-20 16:35:45.123');
INSERT INTO public.order_itens VALUES ('5459ec2c-ebb7-4794-96a9-17cc1d38186c', 1, 'e546456d-1888-4a26-ab9c-63b8d64c2d4b', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-20 16:45:20.456', '2025-10-20 16:45:20.456');
INSERT INTO public.order_itens VALUES ('290e06f9-9d0f-4f59-9b42-ba7c5b55de88', 1, 'e546456d-1888-4a26-ab9c-63b8d64c2d4b', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-20 16:45:20.456', '2025-10-20 16:45:20.456');
INSERT INTO public.order_itens VALUES ('f26fb403-f9be-4e55-914e-50be8076cb28', 1, 'b3967fe0-c9a3-4c38-9276-94faee38293d', '81a01734-8575-4df7-9cfa-4c98a0f81be1', '2025-10-21 08:05:15.123', '2025-10-21 08:05:15.123');
INSERT INTO public.order_itens VALUES ('288f65f7-fedb-4840-bd2e-e199417c3684', 1, 'b3967fe0-c9a3-4c38-9276-94faee38293d', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 08:05:15.123', '2025-10-21 08:05:15.123');
INSERT INTO public.order_itens VALUES ('3f454254-cd5b-41ed-9820-6c67cf048dc3', 1, 'fdc0e0e1-c2e5-4999-989e-63ded9df9f2c', 'd9c63121-bb9f-4f65-8c57-9e05ee2637ee', '2025-10-21 08:12:22.456', '2025-10-21 08:12:22.456');
INSERT INTO public.order_itens VALUES ('087a79e3-d1cc-4442-805c-5870f895d80f', 1, 'fdc0e0e1-c2e5-4999-989e-63ded9df9f2c', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-21 08:12:22.456', '2025-10-21 08:12:22.456');
INSERT INTO public.order_itens VALUES ('fb50acf2-80f3-4d83-ab34-934d9f9dd04a', 1, 'd4ec5cad-f6d9-4196-b3d3-93d63da9db87', '9bac741b-b610-4b0b-9d71-e978dcdb8544', '2025-10-21 08:18:30.789', '2025-10-21 08:18:30.789');
INSERT INTO public.order_itens VALUES ('3ffec1d7-3213-46f2-baea-a824aaf10899', 1, 'd4ec5cad-f6d9-4196-b3d3-93d63da9db87', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-21 08:18:30.789', '2025-10-21 08:18:30.789');
INSERT INTO public.order_itens VALUES ('b7917e1c-4685-4146-a771-c847aa5bd105', 1, '4092b3a6-771e-48d6-a8e7-34dfb564efad', 'b83c4569-2d66-4a75-b567-d56157d20143', '2025-10-21 08:25:45.012', '2025-10-21 08:25:45.012');
INSERT INTO public.order_itens VALUES ('09908021-a8ef-4140-85ef-43dd7c9ecd5a', 1, '4092b3a6-771e-48d6-a8e7-34dfb564efad', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 08:25:45.012', '2025-10-21 08:25:45.012');
INSERT INTO public.order_itens VALUES ('e24f47f0-f9ac-48bf-aaa8-212846b6094f', 1, 'd520de3c-5456-4da0-8bce-842e5e905d13', '20eb4499-49b7-49eb-8c29-07a5d7a59aa4', '2025-10-21 08:32:10.345', '2025-10-21 08:32:10.345');
INSERT INTO public.order_itens VALUES ('f832f50b-960d-438c-8548-ffa85acc7f6f', 1, 'd520de3c-5456-4da0-8bce-842e5e905d13', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-21 08:32:10.345', '2025-10-21 08:32:10.345');
INSERT INTO public.order_itens VALUES ('59513ba1-fb97-482e-9d48-4997034da6e1', 1, '79ed9f7d-775f-4312-aa98-69f48f9b757e', 'a79e449b-52b6-4024-9032-cb9d76cc9666', '2025-10-21 08:40:25.678', '2025-10-21 08:40:25.678');
INSERT INTO public.order_itens VALUES ('4fbb68a4-3ae0-43aa-a8b2-6fadff8abb71', 1, '79ed9f7d-775f-4312-aa98-69f48f9b757e', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 08:40:25.678', '2025-10-21 08:40:25.678');
INSERT INTO public.order_itens VALUES ('02b44a55-378d-45ce-a31d-0c775c6e487f', 1, '5ac84a1c-56de-484c-b761-3aa0da105951', 'f0c0b4b3-98a5-4e5a-ad45-26397850e624', '2025-10-21 08:48:40.901', '2025-10-21 08:48:40.901');
INSERT INTO public.order_itens VALUES ('ad237a58-54bc-4f80-8cad-325f9c822b38', 1, '5ac84a1c-56de-484c-b761-3aa0da105951', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-21 08:48:40.901', '2025-10-21 08:48:40.901');
INSERT INTO public.order_itens VALUES ('45af866e-0b81-4d0e-9d3d-8dbe5724103e', 1, '0e0553d5-53cb-4e27-971e-d03267abdd08', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-21 08:55:55.234', '2025-10-21 08:55:55.234');
INSERT INTO public.order_itens VALUES ('922672ad-1dde-497d-b451-587c4a137c90', 1, '0e0553d5-53cb-4e27-971e-d03267abdd08', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-21 08:55:55.234', '2025-10-21 08:55:55.234');
INSERT INTO public.order_itens VALUES ('7c3ee8b1-6773-44d7-9d0d-7b2986bd9487', 1, 'a008b3d7-015d-4084-a75e-11e7e0422158', '56222784-51e6-4219-8c45-c55abcdd65f4', '2025-10-21 09:05:15.567', '2025-10-21 09:05:15.567');
INSERT INTO public.order_itens VALUES ('ec0a6100-41a7-447d-8d68-f31b07bb089c', 1, 'a008b3d7-015d-4084-a75e-11e7e0422158', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-21 09:05:15.567', '2025-10-21 09:05:15.567');
INSERT INTO public.order_itens VALUES ('f97766d7-e15b-4abf-b3ff-8f36e7c0f540', 1, '507388bb-cbb7-4b63-b32a-e20e7fe2de81', '0ae4d490-74d5-45c2-9667-097c4a777fdd', '2025-10-21 09:15:30.89', '2025-10-21 09:15:30.89');
INSERT INTO public.order_itens VALUES ('8332960d-7e1f-4fb2-bd38-13aac5d23fb8', 1, '507388bb-cbb7-4b63-b32a-e20e7fe2de81', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-21 09:15:30.89', '2025-10-21 09:15:30.89');
INSERT INTO public.order_itens VALUES ('d751b64f-8e28-4f62-8cd0-2234216715af', 1, 'b4edd9b6-8985-4e91-9b0b-8647d744cc09', 'ed41ec9e-df07-4237-9193-d78d5f2845a1', '2025-10-21 09:25:45.123', '2025-10-21 09:25:45.123');
INSERT INTO public.order_itens VALUES ('a84471e8-f385-42b9-a431-e407f4381e2c', 1, 'b4edd9b6-8985-4e91-9b0b-8647d744cc09', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 09:25:45.123', '2025-10-21 09:25:45.123');
INSERT INTO public.order_itens VALUES ('3da62b86-21ca-4746-bb8a-d5403995192f', 1, '01fb5bc4-08a4-4a84-8951-b5b41a5277c5', '6bb88569-dd14-41e5-b3c9-9322e9125446', '2025-10-21 09:38:20.456', '2025-10-21 09:38:20.456');
INSERT INTO public.order_itens VALUES ('19a412ac-f001-4414-9002-72b8197958a9', 1, '01fb5bc4-08a4-4a84-8951-b5b41a5277c5', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-21 09:38:20.456', '2025-10-21 09:38:20.456');
INSERT INTO public.order_itens VALUES ('3f9a75c7-f1e0-4fa4-9f88-713c93b5de6d', 1, 'c88e8f62-18a2-46b2-ada9-e00b4b55c1b2', '7f4e3124-fb0b-490c-ac7d-370088de65bb', '2025-10-21 09:45:35.789', '2025-10-21 09:45:35.789');
INSERT INTO public.order_itens VALUES ('ed4f8b25-1d63-4def-937d-4044c4e16395', 1, 'c88e8f62-18a2-46b2-ada9-e00b4b55c1b2', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-21 09:45:35.789', '2025-10-21 09:45:35.789');
INSERT INTO public.order_itens VALUES ('8e542ce4-4e27-45b1-afca-40b8e5c410b4', 1, '3ac45c7b-e2bf-4459-a395-ab4f898848cf', 'a548b045-dd94-4f99-8e26-16603ed0b1c5', '2025-10-21 09:52:50.012', '2025-10-21 09:52:50.012');
INSERT INTO public.order_itens VALUES ('7162f639-500e-4574-a11e-aba4008818c3', 1, '3ac45c7b-e2bf-4459-a395-ab4f898848cf', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 09:52:50.012', '2025-10-21 09:52:50.012');
INSERT INTO public.order_itens VALUES ('e9a103d6-e422-4a1e-afc6-7afcd2932ec0', 1, 'c4282caa-0450-41ff-aec3-8d2524462e59', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-21 10:08:15.123', '2025-10-21 10:08:15.123');
INSERT INTO public.order_itens VALUES ('4c3fc751-061f-409b-97bb-f846ce1032f6', 1, 'c4282caa-0450-41ff-aec3-8d2524462e59', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-21 10:08:15.123', '2025-10-21 10:08:15.123');
INSERT INTO public.order_itens VALUES ('8c8c7839-dfe4-4351-bf68-159416be808d', 1, '78200a8a-f7dd-4ee1-9b4b-e2c8db3d2541', '658c26b1-bcb5-4b3e-859e-73b3f3fe2cac', '2025-10-21 10:15:22.456', '2025-10-21 10:15:22.456');
INSERT INTO public.order_itens VALUES ('415bacca-42c3-468f-b986-558ada1a491e', 1, '78200a8a-f7dd-4ee1-9b4b-e2c8db3d2541', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 10:15:22.456', '2025-10-21 10:15:22.456');
INSERT INTO public.order_itens VALUES ('1d617746-d2a8-46a6-87dd-e2d8c15b2bd6', 1, '6167c694-266d-4fc3-b41e-bf5b19fca1fe', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-21 10:22:30.789', '2025-10-21 10:22:30.789');
INSERT INTO public.order_itens VALUES ('e3534115-7d33-4712-8027-04cef8c96be4', 1, '6167c694-266d-4fc3-b41e-bf5b19fca1fe', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 10:22:30.789', '2025-10-21 10:22:30.789');
INSERT INTO public.order_itens VALUES ('cc2f1125-7524-4321-be65-79d9c68e09c8', 1, '32f21866-2375-446d-a485-b1bf873314ba', '81a01734-8575-4df7-9cfa-4c98a0f81be1', '2025-10-21 10:30:45.012', '2025-10-21 10:30:45.012');
INSERT INTO public.order_itens VALUES ('99457654-ab39-4f04-b603-ac1e9ee12935', 1, '32f21866-2375-446d-a485-b1bf873314ba', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-21 10:30:45.012', '2025-10-21 10:30:45.012');
INSERT INTO public.order_itens VALUES ('56f40296-137c-47ba-9ec2-122f8fd2b2fb', 1, 'd026e257-3a78-43de-94d5-8abcb8757f14', 'd9c63121-bb9f-4f65-8c57-9e05ee2637ee', '2025-10-21 10:38:10.345', '2025-10-21 10:38:10.345');
INSERT INTO public.order_itens VALUES ('6da27eac-0c60-4299-b501-8f989000dde1', 1, 'd026e257-3a78-43de-94d5-8abcb8757f14', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-21 10:38:10.345', '2025-10-21 10:38:10.345');
INSERT INTO public.order_itens VALUES ('661f7526-a526-4e32-a732-b859c27ac734', 1, 'cd1c918b-10a3-4656-8b4b-bc3afd83d0ce', '9bac741b-b610-4b0b-9d71-e978dcdb8544', '2025-10-21 10:45:25.678', '2025-10-21 10:45:25.678');
INSERT INTO public.order_itens VALUES ('3876fdda-3f88-410f-a9d2-8a16c3ce343e', 1, 'cd1c918b-10a3-4656-8b4b-bc3afd83d0ce', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-21 10:45:25.678', '2025-10-21 10:45:25.678');
INSERT INTO public.order_itens VALUES ('e61792a1-4828-4159-9c26-54dc7da0819b', 1, 'ca5e7381-c9c8-4113-9e9e-2a73c42e050c', 'b83c4569-2d66-4a75-b567-d56157d20143', '2025-10-21 10:52:40.901', '2025-10-21 10:52:40.901');
INSERT INTO public.order_itens VALUES ('5e4cb109-ef92-47d9-a8d7-f076aad72c87', 1, 'ca5e7381-c9c8-4113-9e9e-2a73c42e050c', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-21 10:52:40.901', '2025-10-21 10:52:40.901');
INSERT INTO public.order_itens VALUES ('a22a2706-6398-4b1b-9057-0e5e8070bd0a', 1, 'a5e4a5cf-1e54-4e58-b513-36bbe16202fd', '20eb4499-49b7-49eb-8c29-07a5d7a59aa4', '2025-10-21 11:00:55.234', '2025-10-21 11:00:55.234');
INSERT INTO public.order_itens VALUES ('0a2a5063-9fc5-438f-a617-e7b4d1ad4c9c', 1, 'a5e4a5cf-1e54-4e58-b513-36bbe16202fd', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-21 11:00:55.234', '2025-10-21 11:00:55.234');
INSERT INTO public.order_itens VALUES ('1a7d15bc-b220-45ff-923b-e8b8d7f6f665', 1, '06ef4b80-130f-4e18-b34e-34b7c6e1e59f', 'a79e449b-52b6-4024-9032-cb9d76cc9666', '2025-10-21 11:08:15.567', '2025-10-21 11:08:15.567');
INSERT INTO public.order_itens VALUES ('986ce85f-756d-4f8a-94a1-539fca4da173', 1, '06ef4b80-130f-4e18-b34e-34b7c6e1e59f', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-21 11:08:15.567', '2025-10-21 11:08:15.567');
INSERT INTO public.order_itens VALUES ('475ee746-85b7-4e93-a8ed-57251a0a27ad', 1, '7557c61a-01f0-4785-af60-f716b1006655', '56222784-51e6-4219-8c45-c55abcdd65f4', '2025-10-21 11:15:30.89', '2025-10-21 11:15:30.89');
INSERT INTO public.order_itens VALUES ('47725f5e-248c-4a94-96e9-8ee97ad6f36d', 1, '7557c61a-01f0-4785-af60-f716b1006655', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-21 11:15:30.89', '2025-10-21 11:15:30.89');
INSERT INTO public.order_itens VALUES ('53342936-2039-4ba9-8e9b-68c889f06bb7', 1, '6acb6cf3-41a5-4963-a014-5da3777d269f', '0ae4d490-74d5-45c2-9667-097c4a777fdd', '2025-10-21 11:22:45.123', '2025-10-21 11:22:45.123');
INSERT INTO public.order_itens VALUES ('49d23c38-2aa0-407b-bb56-1081d4596adb', 1, '6acb6cf3-41a5-4963-a014-5da3777d269f', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-21 11:22:45.123', '2025-10-21 11:22:45.123');
INSERT INTO public.order_itens VALUES ('66492881-1ce6-48e7-a1ac-a5fca113fa41', 1, 'ad1c9492-e972-4a9d-8254-ee7459db142f', 'ed41ec9e-df07-4237-9193-d78d5f2845a1', '2025-10-21 11:28:20.456', '2025-10-21 11:28:20.456');
INSERT INTO public.order_itens VALUES ('929a6927-e954-468d-adb5-8edcea79c16c', 1, 'ad1c9492-e972-4a9d-8254-ee7459db142f', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-21 11:28:20.456', '2025-10-21 11:28:20.456');
INSERT INTO public.order_itens VALUES ('e00e470e-1684-4f98-abbb-1f622a9ff911', 1, 'cdd7cdf5-5af4-4959-9a6f-921b37c46274', '355d2ad5-0846-4ec3-ab59-ecf09e0ab6fb', '2025-10-21 11:52:15.123', '2025-10-21 11:52:15.123');
INSERT INTO public.order_itens VALUES ('d10a37ea-bd2c-411e-9436-f87b9d47f386', 1, 'cdd7cdf5-5af4-4959-9a6f-921b37c46274', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-21 11:52:15.123', '2025-10-21 11:52:15.123');
INSERT INTO public.order_itens VALUES ('c56fdd49-dd3e-4ac5-822a-f0a219593135', 1, '49b374c3-87e1-487b-a1ac-2ee94a21552b', 'e3f616e6-0445-4f3a-b18a-e96f9a54dd9a', '2025-10-21 12:00:22.456', '2025-10-21 12:00:22.456');
INSERT INTO public.order_itens VALUES ('8e2d5864-65d0-4aca-9ac8-9a7a2a93dd0e', 1, '49b374c3-87e1-487b-a1ac-2ee94a21552b', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 12:00:22.456', '2025-10-21 12:00:22.456');
INSERT INTO public.order_itens VALUES ('b5e17b7f-12c3-4a7f-ab6c-782b2d83adb0', 1, '14bae61b-b08a-4fd8-bd8b-4fca8f631a1d', '91f1e336-bbfa-44f1-a0b1-fe45f8a0c64f', '2025-10-21 12:08:30.789', '2025-10-21 12:08:30.789');
INSERT INTO public.order_itens VALUES ('972a6647-abc1-4b2e-a28e-16ee15954779', 1, '14bae61b-b08a-4fd8-bd8b-4fca8f631a1d', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 12:08:30.789', '2025-10-21 12:08:30.789');
INSERT INTO public.order_itens VALUES ('8986e17f-7cee-435e-a4bf-6a905953584e', 1, '64510b5a-07b5-4833-841a-852fb38a55a9', 'a736ac7d-3c3f-4365-bc10-920afc3266f4', '2025-10-21 12:15:45.012', '2025-10-21 12:15:45.012');
INSERT INTO public.order_itens VALUES ('4a1c8d88-471b-4478-bcf2-c79ff15cde0a', 1, '64510b5a-07b5-4833-841a-852fb38a55a9', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-21 12:15:45.012', '2025-10-21 12:15:45.012');
INSERT INTO public.order_itens VALUES ('fdc5ab41-e04d-4b2f-b59f-2043fa566083', 1, 'bd4442f9-a419-4625-988c-7352053ddc05', '482c7b3e-1a5f-4d8a-bf32-8c9e1d4a7b2c', '2025-10-21 12:23:10.345', '2025-10-21 12:23:10.345');
INSERT INTO public.order_itens VALUES ('f6c6d01f-d103-4745-918b-981b19a18417', 1, 'bd4442f9-a419-4625-988c-7352053ddc05', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-21 12:23:10.345', '2025-10-21 12:23:10.345');
INSERT INTO public.order_itens VALUES ('c7652100-51b7-41c4-96f7-42cd85597807', 1, '29cf6e46-3394-4610-a37b-3d71542b1cc2', '17f31273-e091-491d-ae2f-ea9324d15d62', '2025-10-21 12:30:25.678', '2025-10-21 12:30:25.678');
INSERT INTO public.order_itens VALUES ('3f60d45c-36a0-4f03-a9f7-85534452ed9f', 1, '29cf6e46-3394-4610-a37b-3d71542b1cc2', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-21 12:30:25.678', '2025-10-21 12:30:25.678');
INSERT INTO public.order_itens VALUES ('77887993-68b1-4be6-b884-b5e64d884531', 1, 'cc61157e-2388-44d9-8715-cb563a4a90c9', '7a4e9b5g-3c7h-6f0c-dh54-0e1g3f6c9d4e', '2025-10-21 12:38:40.901', '2025-10-21 12:38:40.901');
INSERT INTO public.order_itens VALUES ('d1009fd5-1863-48f4-bbfc-b9f148267a3b', 1, 'cc61157e-2388-44d9-8715-cb563a4a90c9', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-21 12:38:40.901', '2025-10-21 12:38:40.901');
INSERT INTO public.order_itens VALUES ('82df55cc-50df-40cd-a40f-4ac62ab25266', 1, 'c974eedf-ab19-4b3f-9c8d-397510bcdea4', '30731ea5-8673-4aa3-ace1-3d6f7927896c', '2025-10-21 12:45:55.234', '2025-10-21 12:45:55.234');
INSERT INTO public.order_itens VALUES ('a5650904-f0e7-43ec-aa87-fb68d61c50dd', 1, 'c974eedf-ab19-4b3f-9c8d-397510bcdea4', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-21 12:45:55.234', '2025-10-21 12:45:55.234');
INSERT INTO public.order_itens VALUES ('7725a168-96fc-4d27-bbac-9bb5f580d34c', 1, '8955a0f2-fa6e-4b1b-8db3-45f3cfc0442a', 'daf29ce4-ade8-424d-998d-5850ec136c21', '2025-10-21 12:53:15.567', '2025-10-21 12:53:15.567');
INSERT INTO public.order_itens VALUES ('4a84b616-95f7-4dec-9ff4-79e7ab292956', 1, '8955a0f2-fa6e-4b1b-8db3-45f3cfc0442a', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-21 12:53:15.567', '2025-10-21 12:53:15.567');
INSERT INTO public.order_itens VALUES ('30f192f5-cd3b-4f93-873d-b593699e73b3', 1, '1e35e928-e05d-4d63-9f66-abbc3a3216d1', '0a96121e-e5a1-4f2c-87b6-ad270e66cf8a', '2025-10-21 13:00:30.89', '2025-10-21 13:00:30.89');
INSERT INTO public.order_itens VALUES ('bb10fa84-6636-42cb-aeda-6f41f01f87b0', 1, '1e35e928-e05d-4d63-9f66-abbc3a3216d1', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-21 13:00:30.89', '2025-10-21 13:00:30.89');
INSERT INTO public.order_itens VALUES ('0709c148-ba60-4283-9695-844460b7fab5', 1, 'c30fe6fb-15a5-4945-b55b-b00df72867e4', 'fae558c2-129d-40b2-a104-5f6db5df912c', '2025-10-21 13:08:45.123', '2025-10-21 13:08:45.123');
INSERT INTO public.order_itens VALUES ('3bc76bb6-8f5a-42ad-a17e-0c3819412515', 1, 'c30fe6fb-15a5-4945-b55b-b00df72867e4', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-21 13:08:45.123', '2025-10-21 13:08:45.123');
INSERT INTO public.order_itens VALUES ('47b4b097-1499-4416-bcea-d7c0ca00cc4f', 1, 'bf4816d4-b2fa-4c98-ab53-ede80260ab3e', 'e70064a8-9be6-441a-89e4-4b41536c37fe', '2025-10-21 13:15:20.456', '2025-10-21 13:15:20.456');
INSERT INTO public.order_itens VALUES ('2f8831c8-37ae-4896-81bc-3b6152afc14a', 1, 'bf4816d4-b2fa-4c98-ab53-ede80260ab3e', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-21 13:15:20.456', '2025-10-21 13:15:20.456');
INSERT INTO public.order_itens VALUES ('927fb98e-fb41-4ce1-9dc1-c5d86e804b0a', 1, '68403968-d996-4190-834b-d73b70695512', '760d0eab-82c4-4656-8da4-72f64b2552d3', '2025-10-21 13:22:35.789', '2025-10-21 13:22:35.789');
INSERT INTO public.order_itens VALUES ('390e9273-643c-46b0-897e-cf1d87762ba8', 1, '68403968-d996-4190-834b-d73b70695512', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-21 13:22:35.789', '2025-10-21 13:22:35.789');
INSERT INTO public.order_itens VALUES ('f0c1dc6b-aecf-4fbf-bd21-4e888c7049df', 1, '2de582d0-6784-4abd-919c-04e5ef9fd8ac', '8b5f0c6h-4d8i-7g1d-ei65-1f2h4g7d0e5f', '2025-10-21 13:30:50.012', '2025-10-21 13:30:50.012');
INSERT INTO public.order_itens VALUES ('3704116e-f18c-44b4-8345-b5f536012756', 1, '2de582d0-6784-4abd-919c-04e5ef9fd8ac', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 13:30:50.012', '2025-10-21 13:30:50.012');
INSERT INTO public.order_itens VALUES ('ea155830-f024-4d4e-814b-6b855c3f6d14', 1, 'd6818ba9-fcca-4834-acc2-8356b84e048d', '9c6g1d7i-5e9j-8h2e-fj76-2g3i5h8e1f6g', '2025-10-21 13:38:10.345', '2025-10-21 13:38:10.345');
INSERT INTO public.order_itens VALUES ('e0dd97bb-6e38-4be6-9d22-63e9313e3533', 1, 'd6818ba9-fcca-4834-acc2-8356b84e048d', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 13:38:10.345', '2025-10-21 13:38:10.345');
INSERT INTO public.order_itens VALUES ('512f3b84-fb5e-4bbc-b78e-d9f26e643c8b', 1, 'a2a58b4b-99ea-4633-826e-3d1d9335acf5', '1e8i3f9k-7g1l-0j4g-hl98-4i5k7j0g3h8i', '2025-10-21 13:45:25.678', '2025-10-21 13:45:25.678');
INSERT INTO public.order_itens VALUES ('bf20e610-3a86-44ab-83c3-dd057fee57b5', 1, 'a2a58b4b-99ea-4633-826e-3d1d9335acf5', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-21 13:45:25.678', '2025-10-21 13:45:25.678');
INSERT INTO public.order_itens VALUES ('c109d497-7541-45ae-91d2-af444293c745', 1, 'f34f6040-d58f-4be9-826e-1293a663f916', '4h1l6i2n-0j4o-3m7j-ko21-7l8n0m3j6k1l', '2025-10-21 13:52:40.901', '2025-10-21 13:52:40.901');
INSERT INTO public.order_itens VALUES ('68ff2431-77eb-4dcc-96b0-fb0a20201b4d', 1, 'f34f6040-d58f-4be9-826e-1293a663f916', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-21 13:52:40.901', '2025-10-21 13:52:40.901');
INSERT INTO public.order_itens VALUES ('943a06e3-151d-4985-bdd2-062fa3b41532', 1, '402c5775-4db1-4239-9032-4b668474db49', '5i2m7j3o-1k5p-4n8k-lp32-8m9o1n4k7l2m', '2025-10-21 14:00:55.234', '2025-10-21 14:00:55.234');
INSERT INTO public.order_itens VALUES ('ede44720-8e4b-4119-b5da-f64650bfd697', 1, '402c5775-4db1-4239-9032-4b668474db49', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-21 14:00:55.234', '2025-10-21 14:00:55.234');
INSERT INTO public.order_itens VALUES ('0e2fdc7e-884d-4c76-9e30-b34edb9619ce', 1, 'ef22c2af-e213-47d6-afb4-37582e799df6', '81daaca8-44ce-4534-8776-577370cb8ac6', '2025-10-21 14:08:15.567', '2025-10-21 14:08:15.567');
INSERT INTO public.order_itens VALUES ('5ae10373-41cb-4961-b8d5-f76c63444de8', 1, 'ef22c2af-e213-47d6-afb4-37582e799df6', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-21 14:08:15.567', '2025-10-21 14:08:15.567');
INSERT INTO public.order_itens VALUES ('73fd7c92-ff41-4420-b55c-c309d593d0c1', 1, '37faf35a-a203-415a-8987-7b6a084bf453', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-21 14:15:30.89', '2025-10-21 14:15:30.89');
INSERT INTO public.order_itens VALUES ('27ed8db7-959f-40f6-9f85-4a88d3282808', 1, '37faf35a-a203-415a-8987-7b6a084bf453', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-21 14:15:30.89', '2025-10-21 14:15:30.89');
INSERT INTO public.order_itens VALUES ('08e2b92e-3866-4d0c-8a5b-265e0f529fd7', 1, 'b41ef5bf-cb60-4818-a8fc-cb06bb8399ce', 'dbf40098-59e9-4338-81cd-72a23fdf1ebd', '2025-10-21 14:32:15.123', '2025-10-21 14:32:15.123');
INSERT INTO public.order_itens VALUES ('2be64f66-b7c4-4b5e-9621-1e3e11c39bf7', 1, 'b41ef5bf-cb60-4818-a8fc-cb06bb8399ce', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-21 14:32:15.123', '2025-10-21 14:32:15.123');
INSERT INTO public.order_itens VALUES ('db2daef0-14a9-4d33-a637-3d3ef7aee811', 1, '9b16fcce-0ea0-4f3b-b5e7-73fb3f2a944e', '693d8a4f-2b6g-5e9b-cg43-9d0f2e5b8c3d', '2025-10-21 14:38:22.456', '2025-10-21 14:38:22.456');
INSERT INTO public.order_itens VALUES ('99754b57-b57f-4c5c-b435-fd9d254334a2', 1, '9b16fcce-0ea0-4f3b-b5e7-73fb3f2a944e', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 14:38:22.456', '2025-10-21 14:38:22.456');
INSERT INTO public.order_itens VALUES ('f338d10a-2303-4342-b65d-96f5719fcbea', 1, 'b2d3ad45-03e7-4df0-b8b2-009c4b0d5fb3', '2f9j4g0l-8h2m-1k5h-im09-5j6l8k1h4i9j', '2025-10-21 14:45:30.789', '2025-10-21 14:45:30.789');
INSERT INTO public.order_itens VALUES ('143e0f72-7fe6-430d-bc1e-3c0d0c0f98c8', 1, 'b2d3ad45-03e7-4df0-b8b2-009c4b0d5fb3', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 14:45:30.789', '2025-10-21 14:45:30.789');
INSERT INTO public.order_itens VALUES ('1d62f944-e77a-451c-af26-b85393103b33', 1, '908c4095-5a52-4eb1-bb9b-ab963d418a63', '3g0k5h1m-9i3n-2l6i-jn10-6k7m9l2i5j0k', '2025-10-21 14:52:45.012', '2025-10-21 14:52:45.012');
INSERT INTO public.order_itens VALUES ('9952ae3f-c2cd-4917-aeeb-cf4e138834b1', 1, '908c4095-5a52-4eb1-bb9b-ab963d418a63', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-21 14:52:45.012', '2025-10-21 14:52:45.012');
INSERT INTO public.order_itens VALUES ('aa5d3fe0-0071-4c61-b350-0b367ad983a1', 1, '5f98a020-f230-4676-ac96-97928eb770a1', '6j3n8k4p-2l6q-5o9l-mq43-9n0p2o5l8m3n', '2025-10-21 14:58:10.345', '2025-10-21 14:58:10.345');
INSERT INTO public.order_itens VALUES ('b7b3ea0e-7504-4dac-9335-88336990cebb', 1, '5f98a020-f230-4676-ac96-97928eb770a1', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-21 14:58:10.345', '2025-10-21 14:58:10.345');
INSERT INTO public.order_itens VALUES ('2834d406-e005-4868-aea7-ca7bcfeda380', 1, 'f9313642-3143-4c80-be62-92e5bb8c59da', '81a01734-8575-4df7-9cfa-4c98a0f81be1', '2025-10-21 15:05:25.678', '2025-10-21 15:05:25.678');
INSERT INTO public.order_itens VALUES ('b7fc0e93-1370-4732-9f24-4c532215c565', 1, 'f9313642-3143-4c80-be62-92e5bb8c59da', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-21 15:05:25.678', '2025-10-21 15:05:25.678');
INSERT INTO public.order_itens VALUES ('f4ad72fa-098a-43e0-bbca-a7582e30c4df', 1, '4dadd83a-f821-412a-b427-d7f17792fe5e', 'b83c4569-2d66-4a75-b567-d56157d20143', '2025-10-21 15:15:40.901', '2025-10-21 15:15:40.901');
INSERT INTO public.order_itens VALUES ('942b5f7e-2745-4187-b376-fe14e55312c7', 1, '4dadd83a-f821-412a-b427-d7f17792fe5e', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 15:15:40.901', '2025-10-21 15:15:40.901');
INSERT INTO public.order_itens VALUES ('e1269a1f-6140-496d-878a-0d102e9dd285', 1, '442bc282-9aa9-415b-ae6f-65209fb2745a', 'd9c63121-bb9f-4f65-8c57-9e05ee2637ee', '2025-10-21 15:22:55.234', '2025-10-21 15:22:55.234');
INSERT INTO public.order_itens VALUES ('cae10f34-6be1-45b3-9c3f-1efc39aa4fb3', 1, '442bc282-9aa9-415b-ae6f-65209fb2745a', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 15:22:55.234', '2025-10-21 15:22:55.234');
INSERT INTO public.order_itens VALUES ('1946433a-25c2-49df-aff5-c385867011e5', 1, 'ded8bf1a-8e24-41b0-ad83-3d1c9d8486ff', '9bac741b-b610-4b0b-9d71-e978dcdb8544', '2025-10-21 15:30:15.567', '2025-10-21 15:30:15.567');
INSERT INTO public.order_itens VALUES ('5ada4fa4-a88a-4302-a70c-c0b3d276f43b', 1, 'ded8bf1a-8e24-41b0-ad83-3d1c9d8486ff', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-21 15:30:15.567', '2025-10-21 15:30:15.567');
INSERT INTO public.order_itens VALUES ('77b53976-4d9e-4cca-a338-7f9374bfc2ed', 1, '8594c1a5-9b76-46e5-9bf3-da826d9c2295', '20eb4499-49b7-49eb-8c29-07a5d7a59aa4', '2025-10-21 15:38:30.89', '2025-10-21 15:38:30.89');
INSERT INTO public.order_itens VALUES ('ff13206e-e705-4359-b804-e1cb29005ab7', 1, '8594c1a5-9b76-46e5-9bf3-da826d9c2295', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-21 15:38:30.89', '2025-10-21 15:38:30.89');
INSERT INTO public.order_itens VALUES ('12e2f4d9-ad5c-44ce-9eb7-629f7b206d1c', 1, '7eea9ba5-3bb1-49e6-9598-b5dfdd692d90', 'f0c0b4b3-98a5-4e5a-ad45-26397850e624', '2025-10-21 15:45:45.123', '2025-10-21 15:45:45.123');
INSERT INTO public.order_itens VALUES ('40f45b7a-3e06-4daf-aad4-2d5fc467b3b5', 1, '7eea9ba5-3bb1-49e6-9598-b5dfdd692d90', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-21 15:45:45.123', '2025-10-21 15:45:45.123');
INSERT INTO public.order_itens VALUES ('4eb44003-388b-40ee-96bf-75447cebfa34', 1, 'dd99674c-b035-452b-9da1-d5cd665bb7c5', '658c26b1-bcb5-4b3e-859e-73b3f3fe2cac', '2025-10-21 15:52:20.456', '2025-10-21 15:52:20.456');
INSERT INTO public.order_itens VALUES ('e616212f-3bdd-410e-b9bc-7adf28ffd9f7', 1, 'dd99674c-b035-452b-9da1-d5cd665bb7c5', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-21 15:52:20.456', '2025-10-21 15:52:20.456');
INSERT INTO public.order_itens VALUES ('f642d7c5-5866-42b9-a5b0-89822aa60d90', 1, '5b41b3e7-cbd5-4208-abff-74c45250cb83', 'a79e449b-52b6-4024-9032-cb9d76cc9666', '2025-10-21 16:00:35.789', '2025-10-21 16:00:35.789');
INSERT INTO public.order_itens VALUES ('19a9e4ba-95f1-4b56-9b93-f0ac1a1926c6', 1, '5b41b3e7-cbd5-4208-abff-74c45250cb83', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-21 16:00:35.789', '2025-10-21 16:00:35.789');
INSERT INTO public.order_itens VALUES ('b90ef0b5-1be2-403f-9e9d-6bc601ab154a', 1, '726beeee-bd77-4909-85cc-65ae7ee74910', '364b658c-800f-444f-abc9-e3f60b4115a0', '2025-10-21 16:08:50.012', '2025-10-21 16:08:50.012');
INSERT INTO public.order_itens VALUES ('2628642b-52b2-4dc8-af6b-e97bc45dbbcc', 1, '726beeee-bd77-4909-85cc-65ae7ee74910', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-21 16:08:50.012', '2025-10-21 16:08:50.012');
INSERT INTO public.order_itens VALUES ('0b8827da-35e8-4195-8d9f-93b1cebcd35d', 1, 'b8591725-b995-488a-ac80-e80a5ebec505', '56222784-51e6-4219-8c45-c55abcdd65f4', '2025-10-21 16:15:10.345', '2025-10-21 16:15:10.345');
INSERT INTO public.order_itens VALUES ('5920b88e-a243-430a-87e9-7caa358511e4', 1, 'b8591725-b995-488a-ac80-e80a5ebec505', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-21 16:15:10.345', '2025-10-21 16:15:10.345');
INSERT INTO public.order_itens VALUES ('7862bf35-837d-47b0-ab74-d1911ad5d3e9', 1, 'a787228f-f136-4355-95f0-a6f0de4c7c84', '0ae4d490-74d5-45c2-9667-097c4a777fdd', '2025-10-21 16:22:25.678', '2025-10-21 16:22:25.678');
INSERT INTO public.order_itens VALUES ('0c282087-21ad-49a2-ac85-6be7bf204614', 1, 'a787228f-f136-4355-95f0-a6f0de4c7c84', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-21 16:22:25.678', '2025-10-21 16:22:25.678');
INSERT INTO public.order_itens VALUES ('6f5359f1-aca5-4258-998b-72b710cbecfc', 1, '3fc67fd7-1832-47c6-9a53-5e115ef2b8aa', 'ed41ec9e-df07-4237-9193-d78d5f2845a1', '2025-10-21 16:30:40.901', '2025-10-21 16:30:40.901');
INSERT INTO public.order_itens VALUES ('189f7b0d-d0d4-490d-87f9-ba6e3d44deb8', 1, '3fc67fd7-1832-47c6-9a53-5e115ef2b8aa', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-21 16:30:40.901', '2025-10-21 16:30:40.901');
INSERT INTO public.order_itens VALUES ('57497c85-a973-43cb-a184-8b25fcfaaa8b', 1, 'df0534b1-a5be-4398-82ba-2a5b743bac59', '74353e9b-99fc-44bc-80cf-24b2b88bc68e', '2025-10-21 16:38:55.234', '2025-10-21 16:38:55.234');
INSERT INTO public.order_itens VALUES ('b9fd6200-707a-4cd9-aea6-3cace8673d74', 1, 'df0534b1-a5be-4398-82ba-2a5b743bac59', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-21 16:38:55.234', '2025-10-21 16:38:55.234');
INSERT INTO public.order_itens VALUES ('d894a86b-88aa-4984-a732-00bd9a5779ef', 1, '47060e08-a607-4ba8-813b-ee2acbae33f4', '6bb88569-dd14-41e5-b3c9-9322e9125446', '2025-10-21 16:45:15.567', '2025-10-21 16:45:15.567');
INSERT INTO public.order_itens VALUES ('26c1abaf-2abc-4ed9-b2e5-20dd2a7d5f2c', 1, '47060e08-a607-4ba8-813b-ee2acbae33f4', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-21 16:45:15.567', '2025-10-21 16:45:15.567');
INSERT INTO public.order_itens VALUES ('7fb4bb6c-7f68-46e8-958a-b7245c41d610', 1, 'bf43bc20-edd4-4aa7-b35a-f12880550db8', '7f4e3124-fb0b-490c-ac7d-370088de65bb', '2025-10-21 16:52:30.89', '2025-10-21 16:52:30.89');
INSERT INTO public.order_itens VALUES ('a426cbaa-5347-4446-b0ea-f8f7b03c9903', 1, 'bf43bc20-edd4-4aa7-b35a-f12880550db8', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-21 16:52:30.89', '2025-10-21 16:52:30.89');
INSERT INTO public.order_itens VALUES ('b86fe3dc-b764-4b9e-9f38-2a063c4e066a', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567900', '3g0k5h1m-9i3n-2l6i-jn10-6k7m9l2i5j0k', '2025-10-22 13:25:00', '2025-10-22 13:25:00');
INSERT INTO public.order_itens VALUES ('151e411d-d814-44a1-8b52-342db6da50f1', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567900', '277699e6-5e58-41ab-8b55-6d006e64d44b', '2025-10-22 13:25:00', '2025-10-22 13:25:00');
INSERT INTO public.order_itens VALUES ('b72c67ed-a4bc-44a2-ab42-7a9c1dce7b7e', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567901', '4h1l6i2n-0j4o-3m7j-ko21-7l8n0m3j6k1l', '2025-10-22 14:00:00', '2025-10-22 14:00:00');
INSERT INTO public.order_itens VALUES ('ceb4e35a-7bbf-4519-8788-e76c77324079', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567901', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-22 14:00:00', '2025-10-22 14:00:00');
INSERT INTO public.order_itens VALUES ('0726c764-52b3-4a81-a757-5bf3d1764775', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567902', '5i2m7j3o-1k5p-4n8k-lp32-8m9o1n4k7l2m', '2025-10-22 14:35:00', '2025-10-22 14:35:00');
INSERT INTO public.order_itens VALUES ('215b9d3c-fc6b-483f-ad1e-8eb6c651776e', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567902', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-22 14:35:00', '2025-10-22 14:35:00');
INSERT INTO public.order_itens VALUES ('3fcad272-33d1-4963-91c5-68bbd7ff0b52', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567903', '6j3n8k4p-2l6q-5o9l-mq43-9n0p2o5l8m3n', '2025-10-22 15:00:00', '2025-10-22 15:00:00');
INSERT INTO public.order_itens VALUES ('6f8ee7c9-392b-4871-b6aa-f523fa3b4eef', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567903', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-22 15:00:00', '2025-10-22 15:00:00');
INSERT INTO public.order_itens VALUES ('a036fce4-6af6-498e-8f53-e43ebf5da367', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567904', 'e3f616e6-0445-4f3a-b18a-e96f9a54dd9a', '2025-10-22 15:40:00', '2025-10-22 15:40:00');
INSERT INTO public.order_itens VALUES ('21ea7c4d-b407-4fda-8c03-83609dbdc86a', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567904', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-22 15:40:00', '2025-10-22 15:40:00');
INSERT INTO public.order_itens VALUES ('c9736af8-e0f6-4106-98d1-4f0fe75d44e8', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567905', 'dbf40098-59e9-4338-81cd-72a23fdf1ebd', '2025-10-22 16:10:00', '2025-10-22 16:10:00');
INSERT INTO public.order_itens VALUES ('f125648a-1d45-4733-8780-017dbb7f9fe0', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567905', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-22 16:10:00', '2025-10-22 16:10:00');
INSERT INTO public.order_itens VALUES ('2af37c24-a47c-4625-9051-619cc7574fd9', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567906', '91f1e336-bbfa-44f1-a0b1-fe45f8a0c64f', '2025-10-22 16:45:00', '2025-10-22 16:45:00');
INSERT INTO public.order_itens VALUES ('a0f301b5-a4a3-4598-8697-5cc05c58206f', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567906', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-22 16:45:00', '2025-10-22 16:45:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567101', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567891', '355d2ad5-0846-4ec3-ab59-ecf09e0ab6fb', '2025-10-22 08:00:00', '2025-10-22 08:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567102', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567891', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-22 08:00:00', '2025-10-22 08:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567103', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567892', '482c7b3e-1a5f-4d8a-bf32-8c9e1d4a7b2c', '2025-10-22 08:30:00', '2025-10-22 08:30:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567104', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567892', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-22 08:30:00', '2025-10-22 08:30:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567105', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567893', '693d8a4f-2b6g-5e9b-cg43-9d0f2e5b8c3d', '2025-10-22 09:00:00', '2025-10-22 09:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567106', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567893', '214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', '2025-10-22 09:00:00', '2025-10-22 09:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567107', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567894', '7a4e9b5g-3c7h-6f0c-dh54-0e1g3f6c9d4e', '2025-10-22 09:30:00', '2025-10-22 09:30:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567108', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567894', 'b1619291-9f3b-461a-8d20-c964e58d3ee2', '2025-10-22 09:30:00', '2025-10-22 09:30:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567109', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567895', '8b5f0c6h-4d8i-7g1d-ei65-1f2h4g7d0e5f', '2025-10-22 10:15:00', '2025-10-22 10:15:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567110', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567895', '8aeb5b66-9740-441f-8e42-740ecd922995', '2025-10-22 10:15:00', '2025-10-22 10:15:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567111', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567896', '9c6g1d7i-5e9j-8h2e-fj76-2g3i5h8e1f6g', '2025-10-22 10:50:00', '2025-10-22 10:50:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567112', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567896', '785381ad-c383-4f9b-9ff1-d62e471a6b0f', '2025-10-22 10:50:00', '2025-10-22 10:50:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567113', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567897', '0d7h2e8j-6f0k-9i3f-gk87-3h4j6i9f2g7h', '2025-10-22 11:45:00', '2025-10-22 11:45:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567114', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567897', '7fdc228d-9040-4431-9e1b-c35b0eb68367', '2025-10-22 11:45:00', '2025-10-22 11:45:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567115', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567898', '1e8i3f9k-7g1l-0j4g-hl98-4i5k7j0g3h8i', '2025-10-22 12:20:00', '2025-10-22 12:20:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567116', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567898', '81a54ba6-0a81-403b-bde7-21f444d3593b', '2025-10-22 12:20:00', '2025-10-22 12:20:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567117', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567899', '2f9j4g0l-8h2m-1k5h-im09-5j6l8k1h4i9j', '2025-10-22 12:50:00', '2025-10-22 12:50:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567118', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567899', '0587a6a6-bcf1-441e-b359-a5b0e8abebbe', '2025-10-22 12:50:00', '2025-10-22 12:50:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567119', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567900', '3g0k5h1m-9i3n-2l6i-jn10-6k7m9l2i5j0k', '2025-10-22 13:25:00', '2025-10-22 13:25:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567120', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567900', '277699e6-5e58-41ab-8b55-6d006e64d44b', '2025-10-22 13:25:00', '2025-10-22 13:25:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567121', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567901', '4h1l6i2n-0j4o-3m7j-ko21-7l8n0m3j6k1l', '2025-10-22 14:00:00', '2025-10-22 14:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567122', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567901', 'e488134d-a9b7-40ea-ac7a-0b8e26226fb8', '2025-10-22 14:00:00', '2025-10-22 14:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567123', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567902', '5i2m7j3o-1k5p-4n8k-lp32-8m9o1n4k7l2m', '2025-10-22 14:35:00', '2025-10-22 14:35:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567124', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567902', 'eb71e20c-66f1-4dab-9285-567fcec43a9c', '2025-10-22 14:35:00', '2025-10-22 14:35:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567125', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567903', '6j3n8k4p-2l6q-5o9l-mq43-9n0p2o5l8m3n', '2025-10-22 15:00:00', '2025-10-22 15:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567126', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567903', '3ec2c669-e792-4476-ab56-c60579bcac64', '2025-10-22 15:00:00', '2025-10-22 15:00:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567127', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567904', 'e3f616e6-0445-4f3a-b18a-e96f9a54dd9a', '2025-10-22 15:40:00', '2025-10-22 15:40:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567128', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567904', '8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', '2025-10-22 15:40:00', '2025-10-22 15:40:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567129', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567905', 'dbf40098-59e9-4338-81cd-72a23fdf1ebd', '2025-10-22 16:10:00', '2025-10-22 16:10:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567130', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567905', '9db51f4f-d60e-49fb-8421-5c98eb054b39', '2025-10-22 16:10:00', '2025-10-22 16:10:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567131', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567906', '91f1e336-bbfa-44f1-a0b1-fe45f8a0c64f', '2025-10-22 16:45:00', '2025-10-22 16:45:00');
INSERT INTO public.order_itens VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567132', 1, 'a1b2c3d4-e5f6-7890-abcd-ef1234567906', '6d8aa000-804d-472b-b867-3071f22b7364', '2025-10-22 16:45:00', '2025-10-22 16:45:00');


--
-- TOC entry 3462 (class 0 OID 16464)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567891', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-22 08:00:00', '2025-10-22 08:00:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567892', 'b2c3d4e5-f6g7-8901-bcde-f23456789012', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-22 08:30:00', '2025-10-22 08:30:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567893', 'c3d4e5f6-g7h8-9012-cdef-345678901234', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-22 09:00:00', '2025-10-22 09:00:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567894', 'd4e5f6g7-h8i9-0123-defg-456789012345', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-22 09:30:00', '2025-10-22 09:30:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567895', 'e5f6g7h8-i9j0-1234-efgh-567890123456', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-22 10:15:00', '2025-10-22 10:15:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567896', 'f6g7h8i9-j0k1-2345-fghi-678901234567', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-22 10:50:00', '2025-10-22 10:50:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567897', 'g7h8i9j0-k1l2-3456-ghij-789012345678', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-22 11:45:00', '2025-10-22 11:45:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567898', 'h8i9j0k1-l2m3-4567-hijk-890123456789', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-22 12:20:00', '2025-10-22 12:20:00');
INSERT INTO public.orders VALUES ('ce85ca53-b8a5-49d1-a0ff-d6b1d398edfc', '5e8899c1-cf4f-48d8-bce8-7f1af50e8915', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-20 10:02:15.123', '2025-10-20 10:02:15.123');
INSERT INTO public.orders VALUES ('8dad126c-ed64-4bc1-a1d1-56e8acf9368b', '6634615e-adb2-4f59-b5c0-37833b4fc7a0', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-20 10:08:45.456', '2025-10-20 10:08:45.456');
INSERT INTO public.orders VALUES ('70dee084-26a6-4c93-b779-f2e889714c78', '8b3aeecf-37f8-44fb-9616-e6c4d16ec8ca', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-20 10:15:22.789', '2025-10-20 10:15:22.789');
INSERT INTO public.orders VALUES ('104d8b4f-7460-4739-972c-236bf4baee37', '273cbb2a-c302-4b00-b021-4f7532ac81db', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-20 10:23:10.012', '2025-10-20 10:23:10.012');
INSERT INTO public.orders VALUES ('1c9c9292-3baa-43f0-bc8f-305bc81c48a3', 'b08046c8-1db1-43cb-a7c6-a0521409c05b', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-20 10:31:55.345', '2025-10-20 10:31:55.345');
INSERT INTO public.orders VALUES ('e8f1b187-3ff7-4b30-8b47-3d161a8cf1d4', '629cc702-97a4-480e-a161-9c3466c2e8e1', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-20 10:42:30.678', '2025-10-20 10:42:30.678');
INSERT INTO public.orders VALUES ('7d2c17cc-44aa-4569-80cf-ac8624c551ce', '453224b8-7ab1-4219-8d88-6c46f1bb6f20', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-20 10:48:17.901', '2025-10-20 10:48:17.901');
INSERT INTO public.orders VALUES ('55eef92d-4965-4a7f-86c3-d7ed7d6f182f', 'c9fc9887-e8ba-4f4e-b88c-dedc70a0ac73', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-20 10:55:05.234', '2025-10-20 10:55:05.234');
INSERT INTO public.orders VALUES ('283bfc31-fc96-4ca5-b31a-9ce560559bb5', 'dfc31cc2-80fe-477d-b88a-eb69f2ed0b16', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-20 11:03:40.567', '2025-10-20 11:03:40.567');
INSERT INTO public.orders VALUES ('099fc48f-8eac-4cf7-b4ab-95ee7cce9cc8', '25ecda8a-cf71-4507-83d1-8a28925a04f6', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-20 11:12:25.89', '2025-10-20 11:12:25.89');
INSERT INTO public.orders VALUES ('0cd78a7a-83d6-498d-ad65-21312321a630', 'd5d3b68b-90da-4637-ac05-2542f9d3782d', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-20 11:20:15.123', '2025-10-20 11:20:15.123');
INSERT INTO public.orders VALUES ('2fc8dd5b-96b4-4e41-8a4d-b9c18d62ec02', 'f31d5925-4cb8-47de-b8da-aed9b921ec89', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-20 11:28:50.456', '2025-10-20 11:28:50.456');
INSERT INTO public.orders VALUES ('aa754ece-2814-4dcb-85c4-fbf80753b8e3', '46fb489a-6f64-4fbd-8a9f-d3be8b0563e1', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-20 11:35:15.123', '2025-10-20 11:35:15.123');
INSERT INTO public.orders VALUES ('b6818216-9b70-4cdf-bba9-46c7bfec55d8', '3c710672-bc3f-4cef-b270-a28bac45eae1', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-20 11:42:22.456', '2025-10-20 11:42:22.456');
INSERT INTO public.orders VALUES ('e323485d-cc9e-4bd7-9fbc-1b36e28fb552', 'a5603126-af35-4336-880c-39c347a27b49', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-20 11:48:30.789', '2025-10-20 11:48:30.789');
INSERT INTO public.orders VALUES ('44f99afc-2f6c-491f-8944-6187bff0cd25', 'edc03daa-e122-44af-8c6f-eb806c453434', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-20 11:55:45.012', '2025-10-20 11:55:45.012');
INSERT INTO public.orders VALUES ('4b96a283-b921-4b5e-8f79-0eee7cc144c0', '3273e48d-e6f9-41ea-8cab-1ea1d428308f', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-20 12:02:10.345', '2025-10-20 12:02:10.345');
INSERT INTO public.orders VALUES ('37e3c96c-96f2-4c0a-965e-e822ed4606b6', 'ee98de81-b3d8-4a76-87ba-cccd5072dda3', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-20 12:08:25.678', '2025-10-20 12:08:25.678');
INSERT INTO public.orders VALUES ('1d057404-ca9b-48a4-bb94-97890e1f504b', '5ee42b64-f185-484d-bb94-8d5bf6e249e3', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-20 08:00:15.123', '2025-10-20 08:00:15.123');
INSERT INTO public.orders VALUES ('7007534d-d82d-4cbc-b76a-387134ad8e8b', '46fb489a-6f64-4fbd-8a9f-d3be8b0563e1', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-20 08:05:22.456', '2025-10-20 08:10:22.456');
INSERT INTO public.orders VALUES ('158d394a-7e13-41f3-84ac-7c4fb9da9a13', '3c710672-bc3f-4cef-b270-a28bac45eae1', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-20 08:10:30.789', '2025-10-20 08:15:30.789');
INSERT INTO public.orders VALUES ('2cffa0b8-ca2c-471b-9753-60a436f75de8', 'a5603126-af35-4336-880c-39c347a27b49', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-20 08:20:45.012', '2025-10-20 08:20:45.012');
INSERT INTO public.orders VALUES ('eb6cf66f-c7a4-466d-96fa-35481524c38a', 'edc03daa-e122-44af-8c6f-eb806c453434', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-20 08:30:55.345', '2025-10-20 08:25:55.345');
INSERT INTO public.orders VALUES ('6ac0bf0b-f272-4f3b-933b-d18f789de042', '3273e48d-e6f9-41ea-8cab-1ea1d428308f', '50fe27c3-5130-423c-9d61-36b76be04bc4', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-20 08:33:10.678', '2025-10-20 08:30:10.678');
INSERT INTO public.orders VALUES ('5ef796d1-de4a-4c01-be23-ef350ba28058', 'ee98de81-b3d8-4a76-87ba-cccd5072dda3', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-20 08:37:25.901', '2025-10-20 08:35:25.901');
INSERT INTO public.orders VALUES ('5cbe4a2e-8138-49a6-bba0-2062eb0d3b5c', '00180609-4a2c-43a1-af92-4a9527e36e34', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-20 08:49:40.234', '2025-10-20 08:40:40.234');
INSERT INTO public.orders VALUES ('52ef88f3-235e-4570-a195-f9d18b4bbf54', 'f5207ece-9ca1-4d37-a9bb-b4ef339394f8', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-20 08:52:55.567', '2025-10-20 08:45:55.567');
INSERT INTO public.orders VALUES ('23a06d9e-8b3f-44d0-a194-6e4e4de4f1c2', '33021b2e-bf56-459d-9cc2-ecfa674e6f8c', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-20 08:57:05.89', '2025-10-20 08:50:05.89');
INSERT INTO public.orders VALUES ('b2dad1da-d0eb-4f2a-b479-bc9ca0cce425', '038b3713-a0c3-4f15-94e8-23a2018cfb3e', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-20 08:59:20.123', '2025-10-20 08:55:20.123');
INSERT INTO public.orders VALUES ('1b8156e6-69b9-4c57-afe3-51c732eb35c2', '7028b12f-bbbc-40ee-8469-1d0e4367f9f8', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-20 09:00:35.456', '2025-10-20 09:00:35.456');
INSERT INTO public.orders VALUES ('60974322-2359-4779-9414-8fdbd75396fa', '00180609-4a2c-43a1-af92-4a9527e36e34', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-20 12:15:40.901', '2025-10-20 12:15:40.901');
INSERT INTO public.orders VALUES ('31152fee-8115-4c4c-9fa2-7acb93dcbe98', 'f5207ece-9ca1-4d37-a9bb-b4ef339394f8', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-20 12:20:55.234', '2025-10-20 12:20:55.234');
INSERT INTO public.orders VALUES ('83f330dc-3dec-4293-ac25-2f9a1fb55aac', '33021b2e-bf56-459d-9cc2-ecfa674e6f8c', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-20 12:25:15.567', '2025-10-20 12:25:15.567');
INSERT INTO public.orders VALUES ('1c672639-702f-4aaf-a7dc-f33c5e4598d0', '038b3713-a0c3-4f15-94e8-23a2018cfb3e', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-20 12:28:30.89', '2025-10-20 12:28:30.89');
INSERT INTO public.orders VALUES ('cdbcc58a-3407-49b6-af57-0de805f49e5a', '7028b12f-bbbc-40ee-8469-1d0e4367f9f8', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-20 12:32:45.123', '2025-10-20 12:32:45.123');
INSERT INTO public.orders VALUES ('082c6814-4851-4b6d-a0f2-9a595b9bdb69', '178e9cdc-9798-4672-a736-baeddaad06d2', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-20 12:38:20.456', '2025-10-20 12:38:20.456');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567899', 'i9j0k1l2-m3n4-5678-ijkl-901234567890', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-22 12:50:00', '2025-10-22 12:50:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567900', 'j0k1l2m3-n4o5-6789-jklm-012345678901', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-22 13:25:00', '2025-10-22 13:25:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567901', 'k1l2m3n4-o5p6-7890-klmn-123456789012', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-22 14:00:00', '2025-10-22 14:00:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567902', 'l2m3n4o5-p6q7-8901-lmno-234567890123', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-22 14:35:00', '2025-10-22 14:35:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567903', 'm3n4o5p6-q7r8-9012-mnop-345678901234', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-22 15:00:00', '2025-10-22 15:00:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567904', 'n4o5p6q7-r8s9-0123-nopq-456789012345', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-22 15:40:00', '2025-10-22 15:40:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567905', 'o5p6q7r8-s9t0-1234-opqr-567890123456', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-22 16:10:00', '2025-10-22 16:10:00');
INSERT INTO public.orders VALUES ('a1b2c3d4-e5f6-7890-abcd-ef1234567906', 'p6q7r8s9-t0u1-2345-pqrs-678901234567', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-22 16:45:00', '2025-10-22 16:45:00');
INSERT INTO public.orders VALUES ('202ebe56-b9f9-419c-a78a-243f8e225e60', '6aebab66-65e2-4670-a53a-acbe35182e24', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-20 12:48:18.234', '2025-10-20 12:48:18.234');
INSERT INTO public.orders VALUES ('1d667dd0-c87b-4a51-b4cd-48dae1cdae97', '9535b9d1-0d5b-4880-a18f-b9ada019a9dd', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-20 12:52:27.567', '2025-10-20 12:52:27.567');
INSERT INTO public.orders VALUES ('2abe1516-49f0-4104-a139-fa4e07f678d4', 'e14adfe0-75a2-4782-b566-7a0f67ab7ed1', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-20 12:57:35.89', '2025-10-20 12:57:35.89');
INSERT INTO public.orders VALUES ('80a60362-5f9f-426f-8b10-768e79d8d5b7', '1718cabf-4ded-46aa-8403-c412d28c0cf8', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-20 13:03:42.123', '2025-10-20 13:03:42.123');
INSERT INTO public.orders VALUES ('3d785e5c-4bb4-4b3f-a942-4d139c33d03e', '25672c89-212b-4c1b-b58f-109007e3e05b', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-20 13:08:55.456', '2025-10-20 13:08:55.456');
INSERT INTO public.orders VALUES ('067e56dc-8084-4145-acfe-93b247865247', 'e675bbfa-8c34-436b-b7eb-c69311c224bb', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-20 13:15:10.789', '2025-10-20 13:15:10.789');
INSERT INTO public.orders VALUES ('18fb5f8d-0338-4087-8860-d8ee712b5d48', 'bc483dc4-2596-4486-8caf-44287e7b5f71', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-20 13:22:25.012', '2025-10-20 13:22:25.012');
INSERT INTO public.orders VALUES ('89931a84-6803-49d8-9aec-e90f6aee0d36', '28ecf9ba-78d2-43c5-8dd0-6deb763049fb', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-20 13:28:40.345', '2025-10-20 13:28:40.345');
INSERT INTO public.orders VALUES ('735c3535-efa5-4d29-803d-66a783eeee81', '22d277df-7f4f-49e1-a729-6815d3bf8ea5', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-20 13:35:55.678', '2025-10-20 13:35:55.678');
INSERT INTO public.orders VALUES ('1db79c9a-ef63-4e24-a273-3f6336d2b74c', '3e521f4f-94d1-42ea-b762-b5c5fce05a7b', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-20 13:42:15.901', '2025-10-20 13:42:15.901');
INSERT INTO public.orders VALUES ('6def25c7-7c50-4fbe-a248-4147276484d1', 'c9bc19da-7eb9-4460-be6d-35c368b69cb4', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-20 13:48:30.234', '2025-10-20 13:48:30.234');
INSERT INTO public.orders VALUES ('c2fbbe06-0488-4f71-8db3-b99db9dc7f22', '6dfec08c-fbe3-4745-8571-9c026429ef72', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-20 13:55:45.567', '2025-10-20 13:55:45.567');
INSERT INTO public.orders VALUES ('8b15a701-3642-4529-b53e-3f64084635e4', '7b7ce040-eebc-4144-8a69-4d20978366d1', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-20 14:05:15.123', '2025-10-20 14:05:15.123');
INSERT INTO public.orders VALUES ('fdf20aa8-f75d-4618-87a8-ac4ddb0da0ae', '7dcef934-1e96-4357-aadc-fa4e64301b8b', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-20 14:12:22.456', '2025-10-20 14:12:22.456');
INSERT INTO public.orders VALUES ('24216468-a617-4982-8df5-fb986e78c183', 'd6f6e1b4-3445-41ec-8b2a-7d587b8ab1f2', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-20 14:18:30.789', '2025-10-20 14:18:30.789');
INSERT INTO public.orders VALUES ('c850285f-cf14-451a-82f8-610e6a14403e', 'c2313034-ee4c-4aa8-ac7f-9df620370cf9', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-20 14:25:45.012', '2025-10-20 14:25:45.012');
INSERT INTO public.orders VALUES ('6a3f7bf9-3bfb-4a44-ab37-b8083d10531f', '56c27da6-a6cf-4bb9-bb7d-d28024ec5fb0', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-20 14:32:10.345', '2025-10-20 14:32:10.345');
INSERT INTO public.orders VALUES ('58d29ed7-26a8-4717-9533-13e36d8095f4', 'c6292eb9-34e5-4324-9d43-1e98b33085e8', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-20 14:38:25.678', '2025-10-20 14:38:25.678');
INSERT INTO public.orders VALUES ('87bee23c-ed9d-4c2c-b06d-2294a86b545b', '1c132c4b-37e9-462f-98aa-11084ef8bc04', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-20 14:45:40.901', '2025-10-20 14:45:40.901');
INSERT INTO public.orders VALUES ('78f2487d-b4a0-4d82-a2c5-ec20ffabe41e', '9fcb8a00-8dbd-4802-a6aa-c1cc9899efe8', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-20 14:52:55.234', '2025-10-20 14:52:55.234');
INSERT INTO public.orders VALUES ('ee23d0ea-7661-4233-8552-78eabaccdc4e', '895dd251-205c-48a8-9ab7-f8175fdd96d2', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-20 14:58:15.567', '2025-10-20 14:58:15.567');
INSERT INTO public.orders VALUES ('89a1ba1c-1f80-4064-8450-4e42b4fbab9e', '16ea1eb2-7eec-4589-add8-d3fd9de90fa1', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-20 15:05:30.89', '2025-10-20 15:05:30.89');
INSERT INTO public.orders VALUES ('3f436c90-5369-4f92-b50f-1d443e0fc9be', '7b7ce040-eebc-4144-8a69-4d20978366d1', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-20 15:32:15.123', '2025-10-20 15:32:15.123');
INSERT INTO public.orders VALUES ('31d27555-7f20-4491-98ab-a38b30a81ec2', '7dcef934-1e96-4357-aadc-fa4e64301b8b', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-20 15:35:22.456', '2025-10-20 15:35:22.456');
INSERT INTO public.orders VALUES ('8d26b4cf-c853-4468-907f-f870cbb361be', 'd6f6e1b4-3445-41ec-8b2a-7d587b8ab1f2', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-20 15:40:30.789', '2025-10-20 15:40:30.789');
INSERT INTO public.orders VALUES ('84f43b08-d539-4dcb-b39c-7429a3de8cf8', 'c2313034-ee4c-4aa8-ac7f-9df620370cf9', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-20 15:45:45.012', '2025-10-20 15:45:45.012');
INSERT INTO public.orders VALUES ('67a287fb-1593-4e85-bb5b-e426373f4ddb', '56c27da6-a6cf-4bb9-bb7d-d28024ec5fb0', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-20 15:52:10.345', '2025-10-20 15:52:10.345');
INSERT INTO public.orders VALUES ('2d88d7c3-6bef-4fe1-8632-1219e2843617', 'c6292eb9-34e5-4324-9d43-1e98b33085e8', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-20 15:58:25.678', '2025-10-20 15:58:25.678');
INSERT INTO public.orders VALUES ('f58a2f17-1170-4b00-95e8-a0849c7dfd3a', '1c132c4b-37e9-462f-98aa-11084ef8bc04', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-20 16:05:40.901', '2025-10-20 16:05:40.901');
INSERT INTO public.orders VALUES ('b7f39c98-9f66-437a-90bb-4f1f3be77421', '9fcb8a00-8dbd-4802-a6aa-c1cc9899efe8', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-20 16:12:55.234', '2025-10-20 16:12:55.234');
INSERT INTO public.orders VALUES ('98290be2-dc59-4d4c-9c16-a104b6ab945f', '895dd251-205c-48a8-9ab7-f8175fdd96d2', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-20 16:20:15.567', '2025-10-20 16:20:15.567');
INSERT INTO public.orders VALUES ('1faaf7c1-76ad-40ec-b27e-f44a262d12b2', '16ea1eb2-7eec-4589-add8-d3fd9de90fa1', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-20 16:28:30.89', '2025-10-20 16:28:30.89');
INSERT INTO public.orders VALUES ('dd3923e0-8825-4834-b85f-7695f2aad923', '5e8899c1-cf4f-48d8-bce8-7f1af50e8915', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-20 16:35:45.123', '2025-10-20 16:35:45.123');
INSERT INTO public.orders VALUES ('e546456d-1888-4a26-ab9c-63b8d64c2d4b', '6634615e-adb2-4f59-b5c0-37833b4fc7a0', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-20 16:45:20.456', '2025-10-20 16:45:20.456');
INSERT INTO public.orders VALUES ('b3967fe0-c9a3-4c38-9276-94faee38293d', 'bfcb0476-ca9f-4633-8ee8-de45af5c4a2d', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-21 08:05:15.123', '2025-10-21 08:05:15.123');
INSERT INTO public.orders VALUES ('fdc0e0e1-c2e5-4999-989e-63ded9df9f2c', '5e8899c1-cf4f-48d8-bce8-7f1af50e8915', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-21 08:12:22.456', '2025-10-21 08:12:22.456');
INSERT INTO public.orders VALUES ('d4ec5cad-f6d9-4196-b3d3-93d63da9db87', '3d0bc674-7dac-4fd8-98cb-96007380165a', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-21 08:18:30.789', '2025-10-21 08:18:30.789');
INSERT INTO public.orders VALUES ('4092b3a6-771e-48d6-a8e7-34dfb564efad', '6634615e-adb2-4f59-b5c0-37833b4fc7a0', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-21 08:25:45.012', '2025-10-21 08:25:45.012');
INSERT INTO public.orders VALUES ('d520de3c-5456-4da0-8bce-842e5e905d13', '94e39889-4f12-4b9f-b64e-fd9b1ba6c03d', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-21 08:32:10.345', '2025-10-21 08:32:10.345');
INSERT INTO public.orders VALUES ('79ed9f7d-775f-4312-aa98-69f48f9b757e', '7b7ce040-eebc-4144-8a69-4d20978366d1', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-21 08:40:25.678', '2025-10-21 08:40:25.678');
INSERT INTO public.orders VALUES ('5ac84a1c-56de-484c-b761-3aa0da105951', '2a07b1c7-98c4-4bd7-94f9-6a82e4dbb815', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-21 08:48:40.901', '2025-10-21 08:48:40.901');
INSERT INTO public.orders VALUES ('0e0553d5-53cb-4e27-971e-d03267abdd08', '7dcef934-1e96-4357-aadc-fa4e64301b8b', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-21 08:55:55.234', '2025-10-21 08:55:55.234');
INSERT INTO public.orders VALUES ('a008b3d7-015d-4084-a75e-11e7e0422158', 'f49ac9ac-4e56-42c7-a75a-6e596e28ebff', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-21 09:05:15.567', '2025-10-21 09:05:15.567');
INSERT INTO public.orders VALUES ('507388bb-cbb7-4b63-b32a-e20e7fe2de81', 'd6f6e1b4-3445-41ec-8b2a-7d587b8ab1f2', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-21 09:15:30.89', '2025-10-21 09:15:30.89');
INSERT INTO public.orders VALUES ('b4edd9b6-8985-4e91-9b0b-8647d744cc09', '428106ae-599b-4e67-863a-5bc6c93db6fd', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-21 09:25:45.123', '2025-10-21 09:25:45.123');
INSERT INTO public.orders VALUES ('01fb5bc4-08a4-4a84-8951-b5b41a5277c5', 'c2313034-ee4c-4aa8-ac7f-9df620370cf9', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-21 09:38:20.456', '2025-10-21 09:38:20.456');
INSERT INTO public.orders VALUES ('c88e8f62-18a2-46b2-ada9-e00b4b55c1b2', '7a1f4755-759e-49c8-9cf4-b20ec3b80414', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-21 09:45:35.789', '2025-10-21 09:45:35.789');
INSERT INTO public.orders VALUES ('3ac45c7b-e2bf-4459-a395-ab4f898848cf', '944734b0-43a6-4284-b852-a890a915b0c7', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-21 09:52:50.012', '2025-10-21 09:52:50.012');
INSERT INTO public.orders VALUES ('c4282caa-0450-41ff-aec3-8d2524462e59', '717cf63f-050f-470f-8694-00468a76dbd3', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-21 10:08:15.123', '2025-10-21 10:08:15.123');
INSERT INTO public.orders VALUES ('78200a8a-f7dd-4ee1-9b4b-e2c8db3d2541', '9ded8404-aaf1-44e8-ba82-cf01de07dde3', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-21 10:15:22.456', '2025-10-21 10:15:22.456');
INSERT INTO public.orders VALUES ('6167c694-266d-4fc3-b41e-bf5b19fca1fe', '1b73618d-b2d8-4c03-a1af-7c2aa030e3cf', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-21 10:22:30.789', '2025-10-21 10:22:30.789');
INSERT INTO public.orders VALUES ('32f21866-2375-446d-a485-b1bf873314ba', 'e94aabdd-f343-43a2-91a5-c1dedac9584b', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-21 10:30:45.012', '2025-10-21 10:30:45.012');
INSERT INTO public.orders VALUES ('d026e257-3a78-43de-94d5-8abcb8757f14', '56c27da6-a6cf-4bb9-bb7d-d28024ec5fb0', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-21 10:38:10.345', '2025-10-21 10:38:10.345');
INSERT INTO public.orders VALUES ('cd1c918b-10a3-4656-8b4b-bc3afd83d0ce', 'c6292eb9-34e5-4324-9d43-1e98b33085e8', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-21 10:45:25.678', '2025-10-21 10:45:25.678');
INSERT INTO public.orders VALUES ('ca5e7381-c9c8-4113-9e9e-2a73c42e050c', '1c132c4b-37e9-462f-98aa-11084ef8bc04', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-21 10:52:40.901', '2025-10-21 10:52:40.901');
INSERT INTO public.orders VALUES ('a5e4a5cf-1e54-4e58-b513-36bbe16202fd', '9fcb8a00-8dbd-4802-a6aa-c1cc9899efe8', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-21 11:00:55.234', '2025-10-21 11:00:55.234');
INSERT INTO public.orders VALUES ('06ef4b80-130f-4e18-b34e-34b7c6e1e59f', '895dd251-205c-48a8-9ab7-f8175fdd96d2', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-21 11:08:15.567', '2025-10-21 11:08:15.567');
INSERT INTO public.orders VALUES ('7557c61a-01f0-4785-af60-f716b1006655', '16ea1eb2-7eec-4589-add8-d3fd9de90fa1', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-21 11:15:30.89', '2025-10-21 11:15:30.89');
INSERT INTO public.orders VALUES ('6acb6cf3-41a5-4963-a014-5da3777d269f', '46fb489a-6f64-4fbd-8a9f-d3be8b0563e1', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-21 11:22:45.123', '2025-10-21 11:22:45.123');
INSERT INTO public.orders VALUES ('ad1c9492-e972-4a9d-8254-ee7459db142f', '3c710672-bc3f-4cef-b270-a28bac45eae1', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-21 11:28:20.456', '2025-10-21 11:28:20.456');
INSERT INTO public.orders VALUES ('cdd7cdf5-5af4-4959-9a6f-921b37c46274', 'a5603126-af35-4336-880c-39c347a27b49', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-21 11:52:15.123', '2025-10-21 11:52:15.123');
INSERT INTO public.orders VALUES ('49b374c3-87e1-487b-a1ac-2ee94a21552b', 'edc03daa-e122-44af-8c6f-eb806c453434', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-21 12:00:22.456', '2025-10-21 12:00:22.456');
INSERT INTO public.orders VALUES ('14bae61b-b08a-4fd8-bd8b-4fca8f631a1d', '3273e48d-e6f9-41ea-8cab-1ea1d428308f', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-21 12:08:30.789', '2025-10-21 12:08:30.789');
INSERT INTO public.orders VALUES ('64510b5a-07b5-4833-841a-852fb38a55a9', 'ee98de81-b3d8-4a76-87ba-cccd5072dda3', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-21 12:15:45.012', '2025-10-21 12:15:45.012');
INSERT INTO public.orders VALUES ('bd4442f9-a419-4625-988c-7352053ddc05', '00180609-4a2c-43a1-af92-4a9527e36e34', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-21 12:23:10.345', '2025-10-21 12:23:10.345');
INSERT INTO public.orders VALUES ('29cf6e46-3394-4610-a37b-3d71542b1cc2', 'f5207ece-9ca1-4d37-a9bb-b4ef339394f8', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-21 12:30:25.678', '2025-10-21 12:30:25.678');
INSERT INTO public.orders VALUES ('cc61157e-2388-44d9-8715-cb563a4a90c9', '33021b2e-bf56-459d-9cc2-ecfa674e6f8c', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-21 12:38:40.901', '2025-10-21 12:38:40.901');
INSERT INTO public.orders VALUES ('c974eedf-ab19-4b3f-9c8d-397510bcdea4', '038b3713-a0c3-4f15-94e8-23a2018cfb3e', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-21 12:45:55.234', '2025-10-21 12:45:55.234');
INSERT INTO public.orders VALUES ('8955a0f2-fa6e-4b1b-8db3-45f3cfc0442a', '7028b12f-bbbc-40ee-8469-1d0e4367f9f8', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-21 12:53:15.567', '2025-10-21 12:53:15.567');
INSERT INTO public.orders VALUES ('1e35e928-e05d-4d63-9f66-abbc3a3216d1', '178e9cdc-9798-4672-a736-baeddaad06d2', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-21 13:00:30.89', '2025-10-21 13:00:30.89');
INSERT INTO public.orders VALUES ('c30fe6fb-15a5-4945-b55b-b00df72867e4', '6aebab66-65e2-4670-a53a-acbe35182e24', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-21 13:08:45.123', '2025-10-21 13:08:45.123');
INSERT INTO public.orders VALUES ('bf4816d4-b2fa-4c98-ab53-ede80260ab3e', '9535b9d1-0d5b-4880-a18f-b9ada019a9dd', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-21 13:15:20.456', '2025-10-21 13:15:20.456');
INSERT INTO public.orders VALUES ('68403968-d996-4190-834b-d73b70695512', 'e14adfe0-75a2-4782-b566-7a0f67ab7ed1', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-21 13:22:35.789', '2025-10-21 13:22:35.789');
INSERT INTO public.orders VALUES ('2de582d0-6784-4abd-919c-04e5ef9fd8ac', '1718cabf-4ded-46aa-8403-c412d28c0cf8', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-21 13:30:50.012', '2025-10-21 13:30:50.012');
INSERT INTO public.orders VALUES ('d6818ba9-fcca-4834-acc2-8356b84e048d', '25672c89-212b-4c1b-b58f-109007e3e05b', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-21 13:38:10.345', '2025-10-21 13:38:10.345');
INSERT INTO public.orders VALUES ('a2a58b4b-99ea-4633-826e-3d1d9335acf5', 'e675bbfa-8c34-436b-b7eb-c69311c224bb', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-21 13:45:25.678', '2025-10-21 13:45:25.678');
INSERT INTO public.orders VALUES ('f34f6040-d58f-4be9-826e-1293a663f916', 'bc483dc4-2596-4486-8caf-44287e7b5f71', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-21 13:52:40.901', '2025-10-21 13:52:40.901');
INSERT INTO public.orders VALUES ('402c5775-4db1-4239-9032-4b668474db49', '28ecf9ba-78d2-43c5-8dd0-6deb763049fb', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-21 14:00:55.234', '2025-10-21 14:00:55.234');
INSERT INTO public.orders VALUES ('ef22c2af-e213-47d6-afb4-37582e799df6', '22d277df-7f4f-49e1-a729-6815d3bf8ea5', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-21 14:08:15.567', '2025-10-21 14:08:15.567');
INSERT INTO public.orders VALUES ('37faf35a-a203-415a-8987-7b6a084bf453', '3e521f4f-94d1-42ea-b762-b5c5fce05a7b', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-21 14:15:30.89', '2025-10-21 14:15:30.89');
INSERT INTO public.orders VALUES ('b41ef5bf-cb60-4818-a8fc-cb06bb8399ce', 'c9bc19da-7eb9-4460-be6d-35c368b69cb4', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-21 14:32:15.123', '2025-10-21 14:32:15.123');
INSERT INTO public.orders VALUES ('9b16fcce-0ea0-4f3b-b5e7-73fb3f2a944e', '6dfec08c-fbe3-4745-8571-9c026429ef72', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-21 14:38:22.456', '2025-10-21 14:38:22.456');
INSERT INTO public.orders VALUES ('b2d3ad45-03e7-4df0-b8b2-009c4b0d5fb3', 'd116d9b5-2132-4792-90cb-c76f88cb9c17', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-21 14:45:30.789', '2025-10-21 14:45:30.789');
INSERT INTO public.orders VALUES ('908c4095-5a52-4eb1-bb9b-ab963d418a63', '22a55e30-9d12-4a4c-ae5e-80c92f7df037', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-21 14:52:45.012', '2025-10-21 14:52:45.012');
INSERT INTO public.orders VALUES ('5f98a020-f230-4676-ac96-97928eb770a1', '4b104571-27d7-46bd-bbac-2060a0705185', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-21 14:58:10.345', '2025-10-21 14:58:10.345');
INSERT INTO public.orders VALUES ('f9313642-3143-4c80-be62-92e5bb8c59da', '8d52b70e-d065-4880-afa3-14a91fe05a36', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-21 15:05:25.678', '2025-10-21 15:05:25.678');
INSERT INTO public.orders VALUES ('4dadd83a-f821-412a-b427-d7f17792fe5e', '6f89f185-d7ed-4887-8a50-8d9019faa7ad', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-21 15:15:40.901', '2025-10-21 15:15:40.901');
INSERT INTO public.orders VALUES ('442bc282-9aa9-415b-ae6f-65209fb2745a', '2432d87e-241d-4976-b187-7a8082d37045', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-21 15:22:55.234', '2025-10-21 15:22:55.234');
INSERT INTO public.orders VALUES ('ded8bf1a-8e24-41b0-ad83-3d1c9d8486ff', '22fa2f16-3a76-4bd9-848b-a392a9713d46', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-21 15:30:15.567', '2025-10-21 15:30:15.567');
INSERT INTO public.orders VALUES ('8594c1a5-9b76-46e5-9bf3-da826d9c2295', 'b2fdc905-b755-4646-bcf5-8798a9d1a2d8', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'b06f67bc-32c8-4943-abaa-e8498f217829', 'closed', '2025-10-21 15:38:30.89', '2025-10-21 15:38:30.89');
INSERT INTO public.orders VALUES ('7eea9ba5-3bb1-49e6-9598-b5dfdd692d90', '5ee42b64-f185-484d-bb94-8d5bf6e249e3', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-21 15:45:45.123', '2025-10-21 15:45:45.123');
INSERT INTO public.orders VALUES ('dd99674c-b035-452b-9da1-d5cd665bb7c5', '8b3aeecf-37f8-44fb-9616-e6c4d16ec8ca', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-21 15:52:20.456', '2025-10-21 15:52:20.456');
INSERT INTO public.orders VALUES ('5b41b3e7-cbd5-4208-abff-74c45250cb83', '273cbb2a-c302-4b00-b021-4f7532ac81db', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-21 16:00:35.789', '2025-10-21 16:00:35.789');
INSERT INTO public.orders VALUES ('726beeee-bd77-4909-85cc-65ae7ee74910', 'b08046c8-1db1-43cb-a7c6-a0521409c05b', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-21 16:08:50.012', '2025-10-21 16:08:50.012');
INSERT INTO public.orders VALUES ('b8591725-b995-488a-ac80-e80a5ebec505', '629cc702-97a4-480e-a161-9c3466c2e8e1', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-21 16:15:10.345', '2025-10-21 16:15:10.345');
INSERT INTO public.orders VALUES ('a787228f-f136-4355-95f0-a6f0de4c7c84', '453224b8-7ab1-4219-8d88-6c46f1bb6f20', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-21 16:22:25.678', '2025-10-21 16:22:25.678');
INSERT INTO public.orders VALUES ('3fc67fd7-1832-47c6-9a53-5e115ef2b8aa', 'c9fc9887-e8ba-4f4e-b88c-dedc70a0ac73', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-21 16:30:40.901', '2025-10-21 16:30:40.901');
INSERT INTO public.orders VALUES ('df0534b1-a5be-4398-82ba-2a5b743bac59', 'dfc31cc2-80fe-477d-b88a-eb69f2ed0b16', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', 'closed', '2025-10-21 16:38:55.234', '2025-10-21 16:38:55.234');
INSERT INTO public.orders VALUES ('47060e08-a607-4ba8-813b-ee2acbae33f4', '25ecda8a-cf71-4507-83d1-8a28925a04f6', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-21 16:45:15.567', '2025-10-21 16:45:15.567');
INSERT INTO public.orders VALUES ('bf43bc20-edd4-4aa7-b35a-f12880550db8', 'd5d3b68b-90da-4637-ac05-2542f9d3782d', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '395203d1-6bd9-46e4-82ba-04d8ddfdb861', 'closed', '2025-10-21 16:52:30.89', '2025-10-21 16:52:30.89');
INSERT INTO public.orders VALUES ('c98817ab-4ef4-48f0-bc05-78774a97cffc', '46fb489a-6f64-4fbd-8a9f-d3be8b0563e1', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-22 08:15:00', '2025-10-22 08:15:00');
INSERT INTO public.orders VALUES ('6dc05064-958e-42ff-9900-0e8a7b9e4bc7', '3c710672-bc3f-4cef-b270-a28bac45eae1', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-22 08:45:00', '2025-10-22 08:45:00');
INSERT INTO public.orders VALUES ('c853cba5-bcc2-482e-aa45-ab5f091021da', 'a5603126-af35-4336-880c-39c347a27b49', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-22 09:20:00', '2025-10-22 09:20:00');
INSERT INTO public.orders VALUES ('dd47b4bc-93aa-430a-8c4e-746c9e7d34b0', 'edc03daa-e122-44af-8c6f-eb806c453434', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-22 10:00:00', '2025-10-22 10:00:00');
INSERT INTO public.orders VALUES ('cb908593-fc3c-4eac-830e-b3aa1d98057a', '3273e48d-e6f9-41ea-8cab-1ea1d428308f', '0411373b-9d6c-4771-a9d9-cb797de05f9c', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-22 10:40:00', '2025-10-22 10:40:00');
INSERT INTO public.orders VALUES ('fda64b05-7a11-4dd4-8886-42d1e3357452', 'ee98de81-b3d8-4a76-87ba-cccd5072dda3', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-22 11:10:00', '2025-10-22 11:10:00');
INSERT INTO public.orders VALUES ('a5e29b86-b5ec-4e9a-b2e1-01fb5903ef4a', '00180609-4a2c-43a1-af92-4a9527e36e34', '50fe27c3-5130-423c-9d61-36b76be04bc4', '425004b2-dd5c-4261-8684-0ba7e014f73d', 'closed', '2025-10-22 11:30:00', '2025-10-22 11:30:00');
INSERT INTO public.orders VALUES ('57912516-6416-4119-b78b-2e2e87d0497b', 'f5207ece-9ca1-4d37-a9bb-b4ef339394f8', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', 'a3084620-0e7d-4175-b50f-3d4f43e5c072', 'closed', '2025-10-22 12:15:00', '2025-10-22 12:15:00');
INSERT INTO public.orders VALUES ('4d36d62a-f43c-4513-86bf-a88dac227b7e', '33021b2e-bf56-459d-9cc2-ecfa674e6f8c', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', '5b433ca1-5df2-4bd1-93d9-27d79e221cb4', 'closed', '2025-10-22 13:00:00', '2025-10-22 13:00:00');
INSERT INTO public.orders VALUES ('233e3709-4dc9-4d3c-abdd-a0f462bae2c8', '038b3713-a0c3-4f15-94e8-23a2018cfb3e', 'c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', 'd8a6294b-7b18-4245-bc19-1c287c883d45', 'closed', '2025-10-22 13:45:00', '2025-10-22 13:45:00');
INSERT INTO public.orders VALUES ('cc5ab77e-9a57-450b-9b4c-387efec9c418', '7028b12f-bbbc-40ee-8469-1d0e4367f9f8', '0411373b-9d6c-4771-a9d9-cb797de05f9c', 'f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', 'closed', '2025-10-22 14:30:00', '2025-10-22 14:30:00');
INSERT INTO public.orders VALUES ('9b5ff3a9-ece9-4772-98e4-9e6577610fc7', '178e9cdc-9798-4672-a736-baeddaad06d2', '997e2af7-3a4f-4f9c-a17f-5f930bb9c089', '8263c6bc-00b3-4a17-997b-381ec1812276', 'closed', '2025-10-22 15:15:00', '2025-10-22 15:15:00');
INSERT INTO public.orders VALUES ('aeeaaa34-1ed1-4f5c-93d4-8feefc273972', '6aebab66-65e2-4670-a53a-acbe35182e24', '50fe27c3-5130-423c-9d61-36b76be04bc4', 'fb00b835-58ba-4f7b-bd00-e1feadbd531e', 'closed', '2025-10-22 15:30:00', '2025-10-22 15:30:00');
INSERT INTO public.orders VALUES ('647516ad-96e3-4e84-a08a-78b93d962aa2', '9535b9d1-0d5b-4880-a18f-b9ada019a9dd', 'ab9d8f3f-5db0-41da-8919-0010ae53713f', '83408d47-e65e-464e-a8cf-bbb4413b12a1', 'closed', '2025-10-22 16:00:00', '2025-10-22 16:00:00');
INSERT INTO public.orders VALUES ('0be23448-0343-49e8-bddb-c665d526b521', 'e14adfe0-75a2-4782-b566-7a0f67ab7ed1', '328e46a9-b679-4417-a0f7-cfaecfb0f6e7', '920adb85-921d-45d3-8532-37d16e1ee251', 'closed', '2025-10-22 16:30:00', '2025-10-22 16:30:00');


--
-- TOC entry 3468 (class 0 OID 16514)
-- Dependencies: 225
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payments VALUES ('426c588a-d41e-4c2a-9bd6-e36f8025c98c', 20.000000000000000000000000000000, '7557c61a-01f0-4785-af60-f716b1006655', 'pix', '2025-10-30 11:15:30.89', 'paid', '2025-10-30 11:15:30.89');
INSERT INTO public.payments VALUES ('5f6d61a6-5b32-45e4-ac20-71b68f234838', 19.000000000000000000000000000000, '6acb6cf3-41a5-4963-a014-5da3777d269f', 'credit_card', '2025-10-30 11:22:45.123', 'paid', '2025-10-30 11:22:45.123');
INSERT INTO public.payments VALUES ('17d68525-e411-4938-8eb8-d23a20f44da4', 23.000000000000000000000000000000, 'ad1c9492-e972-4a9d-8254-ee7459db142f', 'debit_card', '2025-10-30 11:28:20.456', 'paid', '2025-10-30 11:28:20.456');
INSERT INTO public.payments VALUES ('dd751ba3-6d72-462f-b25e-bcb962758838', 26.900000000000000000000000000000, 'cdd7cdf5-5af4-4959-9a6f-921b37c46274', 'cash', '2025-10-30 11:52:15.123', 'paid', '2025-10-30 11:52:15.123');
INSERT INTO public.payments VALUES ('c7af5559-d2ed-4dec-bc47-eb3fbbaffad7', 27.500000000000000000000000000000, '49b374c3-87e1-487b-a1ac-2ee94a21552b', 'pix', '2025-10-30 12:00:22.456', 'paid', '2025-10-30 12:00:22.456');
INSERT INTO public.payments VALUES ('bf2c0d74-66b2-4dd9-98cc-744030c1c413', 27.500000000000000000000000000000, '14bae61b-b08a-4fd8-bd8b-4fca8f631a1d', 'credit_card', '2025-10-30 12:08:30.789', 'paid', '2025-10-30 12:08:30.789');
INSERT INTO public.payments VALUES ('5ddfd68a-5df3-4221-b397-105f9742cda3', 28.000000000000000000000000000000, '64510b5a-07b5-4833-841a-852fb38a55a9', 'debit_card', '2025-10-30 12:15:45.012', 'paid', '2025-10-30 12:15:45.012');
INSERT INTO public.payments VALUES ('e1629d07-6244-446b-be3f-192a903b8854', 25.900000000000000000000000000000, 'bd4442f9-a419-4625-988c-7352053ddc05', 'cash', '2025-10-30 12:23:10.345', 'paid', '2025-10-30 12:23:10.345');
INSERT INTO public.payments VALUES ('c687c29b-e4c0-47c0-a8f7-218f236a56f5', 26.000000000000000000000000000000, '29cf6e46-3394-4610-a37b-3d71542b1cc2', 'pix', '2025-10-30 12:30:25.678', 'paid', '2025-10-30 12:30:25.678');
INSERT INTO public.payments VALUES ('41564760-38de-4350-822b-5855519eefa3', 28.400000000000000000000000000000, 'cc61157e-2388-44d9-8715-cb563a4a90c9', 'credit_card', '2025-10-30 12:38:40.901', 'paid', '2025-10-30 12:38:40.901');
INSERT INTO public.payments VALUES ('6b9f9df2-a848-4b3c-976d-738041bf5122', 112.400000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567893', 'pix', '2025-10-31 09:15:04.3', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('def3af85-f9e5-4fa6-94a4-fe8d0df03a7f', 124.500000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567894', 'cash', '2025-10-31 09:45:50.05', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('ddd889a0-3f75-4065-83c1-7ae930b7e772', 134.300000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567895', 'debit_card', '2025-10-31 10:30:10', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('c27ed420-0f02-4a0a-a144-d4ca13aace94', 128.400000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567896', 'credit_card', '2025-10-31 11:05:20', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('62d5c48d-a1ab-4bff-a39c-9ecf883eca86', 142.900000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567897', 'pix', '2025-10-31 12:00:50', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('5abf9763-c7dd-4311-be9e-edb3b38ea34f', 129.000000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567898', 'cash', '2025-10-31 12:35:10', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('149c45c4-f5fa-4144-a904-46e54f8b4032', 138.000000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567899', 'debit_card', '2025-10-31 13:05:40', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('d02b05ba-ab2c-44e8-bb24-a485faf9b743', 146.000000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567900', 'credit_card', '2025-10-31 13:40:30', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('329721b5-9477-415c-9ca1-859a2b3dda4d', 131.500000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567892', 'credit_card', '2025-10-31 08:45:30.1', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('b0c884b4-e92f-439f-9ba9-e6236f79bec8', 28.000000000000000000000000000000, 'c974eedf-ab19-4b3f-9c8d-397510bcdea4', 'debit_card', '2025-10-30 12:45:55.234', 'paid', '2025-10-30 12:45:55.234');
INSERT INTO public.payments VALUES ('fb8bbc26-4aee-4a36-b58a-557b6db3d04b', 29.000000000000000000000000000000, '8955a0f2-fa6e-4b1b-8db3-45f3cfc0442a', 'cash', '2025-10-30 12:53:15.567', 'paid', '2025-10-30 12:53:15.567');
INSERT INTO public.payments VALUES ('5763533a-770e-4cc5-9a23-28767ef2a891', 24.000000000000000000000000000000, '37faf35a-a203-415a-8987-7b6a084bf453', 'debit_card', '2025-10-30 14:15:30.89', 'paid', '2025-10-30 14:15:30.89');
INSERT INTO public.payments VALUES ('22476607-42e5-45ef-9fcf-54c9dea6ab10', 20.000000000000000000000000000000, '01fb5bc4-08a4-4a84-8951-b5b41a5277c5', 'pix', '2025-10-30 09:38:20.456', 'paid', '2025-10-30 09:38:20.456');
INSERT INTO public.payments VALUES ('61e44282-f8ad-483c-8f8c-a38499d37209', 22.000000000000000000000000000000, 'c88e8f62-18a2-46b2-ada9-e00b4b55c1b2', 'credit_card', '2025-10-30 09:45:35.789', 'paid', '2025-10-30 09:45:35.789');
INSERT INTO public.payments VALUES ('5063afe9-a9d2-43fa-85b4-83fcc46cc276', 17.500000000000000000000000000000, '3ac45c7b-e2bf-4459-a395-ab4f898848cf', 'debit_card', '2025-10-30 09:52:50.012', 'paid', '2025-10-30 09:52:50.012');
INSERT INTO public.payments VALUES ('6f90deb0-ffaf-45d2-a80f-3d4c706688e6', 22.000000000000000000000000000000, 'c4282caa-0450-41ff-aec3-8d2524462e59', 'cash', '2025-10-30 10:08:15.123', 'paid', '2025-10-30 10:08:15.123');
INSERT INTO public.payments VALUES ('62cd279e-da51-4a58-aa64-7f9e7e22e728', 18.500000000000000000000000000000, '78200a8a-f7dd-4ee1-9b4b-e2c8db3d2541', 'pix', '2025-10-30 10:15:22.456', 'paid', '2025-10-30 10:15:22.456');
INSERT INTO public.payments VALUES ('6eb5a8d4-4835-4563-9417-daefe7e39b7d', 16.500000000000000000000000000000, '6167c694-266d-4fc3-b41e-bf5b19fca1fe', 'credit_card', '2025-10-30 10:22:30.789', 'paid', '2025-10-30 10:22:30.789');
INSERT INTO public.payments VALUES ('cd2f14c7-3dc9-467a-b72a-1a7f9bbba32c', 17.000000000000000000000000000000, '32f21866-2375-446d-a485-b1bf873314ba', 'debit_card', '2025-10-30 10:30:45.012', 'paid', '2025-10-30 10:30:45.012');
INSERT INTO public.payments VALUES ('c8000d51-e60c-49c2-ba23-d58b85f4ea20', 12.000000000000000000000000000000, 'd026e257-3a78-43de-94d5-8abcb8757f14', 'cash', '2025-10-30 10:38:10.345', 'paid', '2025-10-30 10:38:10.345');
INSERT INTO public.payments VALUES ('f698ea8f-fbd5-4ff2-b3a5-0b6b9d31cdea', 14.500000000000000000000000000000, 'cd1c918b-10a3-4656-8b4b-bc3afd83d0ce', 'pix', '2025-10-30 10:45:25.678', 'paid', '2025-10-30 10:45:25.678');
INSERT INTO public.payments VALUES ('a4a86c54-2aa8-46b8-8d1b-508f2e309136', 17.000000000000000000000000000000, 'ca5e7381-c9c8-4113-9e9e-2a73c42e050c', 'credit_card', '2025-10-30 10:52:40.901', 'paid', '2025-10-30 10:52:40.901');
INSERT INTO public.payments VALUES ('0bd386eb-dcdd-4fc3-914d-0c4a38bb5f23', 14.000000000000000000000000000000, 'a5e4a5cf-1e54-4e58-b513-36bbe16202fd', 'debit_card', '2025-10-30 11:00:55.234', 'paid', '2025-10-30 11:00:55.234');
INSERT INTO public.payments VALUES ('63a20723-b6bb-468f-9bc0-703917895fca', 16.000000000000000000000000000000, '06ef4b80-130f-4e18-b34e-34b7c6e1e59f', 'cash', '2025-10-30 11:08:15.567', 'paid', '2025-10-30 11:08:15.567');
INSERT INTO public.payments VALUES ('5cad83ef-0c63-465b-b353-ac7455be9ee6', 32.500000000000000000000000000000, 'ef22c2af-e213-47d6-afb4-37582e799df6', 'credit_card', '2025-10-30 14:08:15.567', 'paid', '2025-10-30 14:08:15.567');
INSERT INTO public.payments VALUES ('401e91c5-5294-4eae-a94e-cbc52a824641', 20.000000000000000000000000000000, '726beeee-bd77-4909-85cc-65ae7ee74910', 'pix', '2025-10-30 16:08:50.012', 'paid', '2025-10-30 16:08:50.012');
INSERT INTO public.payments VALUES ('6f554831-a5e5-4b42-be04-7c04ba5ee39e', 21.000000000000000000000000000000, 'b8591725-b995-488a-ac80-e80a5ebec505', 'credit_card', '2025-10-30 16:15:10.345', 'paid', '2025-10-30 16:15:10.345');
INSERT INTO public.payments VALUES ('a0c1bf70-3f71-4265-9f5e-076c76f2a18e', 20.000000000000000000000000000000, 'a787228f-f136-4355-95f0-a6f0de4c7c84', 'debit_card', '2025-10-30 16:22:25.678', 'paid', '2025-10-30 16:22:25.678');
INSERT INTO public.payments VALUES ('de7c3aa4-19f3-4473-95e7-8b4af33af26b', 16.000000000000000000000000000000, '3fc67fd7-1832-47c6-9a53-5e115ef2b8aa', 'cash', '2025-10-30 16:30:40.901', 'paid', '2025-10-30 16:30:40.901');
INSERT INTO public.payments VALUES ('58128057-0d77-4f5d-a9df-336bba37e348', 21.500000000000000000000000000000, 'df0534b1-a5be-4398-82ba-2a5b743bac59', 'pix', '2025-10-30 16:38:55.234', 'paid', '2025-10-30 16:38:55.234');
INSERT INTO public.payments VALUES ('177f23d5-5825-4a1f-8e7e-c3dd78aa16be', 14.500000000000000000000000000000, '1d057404-ca9b-48a4-bb94-97890e1f504b', 'credit_card', '2025-10-29 08:00:15.123', 'paid', '2025-10-29 08:00:15.123');
INSERT INTO public.payments VALUES ('905b9019-f42e-422b-9370-49e5a89c01bf', 17.000000000000000000000000000000, '7007534d-d82d-4cbc-b76a-387134ad8e8b', 'debit_card', '2025-10-29 08:05:22.456', 'paid', '2025-10-29 08:05:22.456');
INSERT INTO public.payments VALUES ('a381d1ac-2967-4043-9e0b-b630dbcd3cb2', 17.500000000000000000000000000000, '47060e08-a607-4ba8-813b-ee2acbae33f4', 'credit_card', '2025-10-30 16:45:15.567', 'paid', '2025-10-30 16:45:15.567');
INSERT INTO public.payments VALUES ('858fc55b-8b44-4944-8e91-84e786775eaa', 20.500000000000000000000000000000, 'bf43bc20-edd4-4aa7-b35a-f12880550db8', 'debit_card', '2025-10-30 16:52:30.89', 'paid', '2025-10-30 16:52:30.89');
INSERT INTO public.payments VALUES ('bad020e2-ee6c-45f4-832f-fe311b5c0e89', 14.500000000000000000000000000000, 'b3967fe0-c9a3-4c38-9276-94faee38293d', 'credit_card', '2025-10-30 08:05:15.123', 'paid', '2025-10-30 08:05:15.123');
INSERT INTO public.payments VALUES ('fb6c38ff-cf5e-4af8-9a43-2473f7fa67c0', 17.000000000000000000000000000000, 'fdc0e0e1-c2e5-4999-989e-63ded9df9f2c', 'debit_card', '2025-10-30 08:12:22.456', 'paid', '2025-10-30 08:12:22.456');
INSERT INTO public.payments VALUES ('9cc82fdc-bff3-4e05-9e88-deed08f48220', 15.000000000000000000000000000000, 'd4ec5cad-f6d9-4196-b3d3-93d63da9db87', 'cash', '2025-10-30 08:18:30.789', 'paid', '2025-10-30 08:18:30.789');
INSERT INTO public.payments VALUES ('32c10da0-6ee1-4335-981b-5ee68c0beb00', 14.500000000000000000000000000000, '4092b3a6-771e-48d6-a8e7-34dfb564efad', 'pix', '2025-10-30 08:25:45.012', 'paid', '2025-10-30 08:25:45.012');
INSERT INTO public.payments VALUES ('5087b521-7374-4df2-bfa1-6e233fcd891b', 13.000000000000000000000000000000, 'd520de3c-5456-4da0-8bce-842e5e905d13', 'credit_card', '2025-10-30 08:32:10.345', 'paid', '2025-10-30 08:32:10.345');
INSERT INTO public.payments VALUES ('ff46a03b-48de-4bf4-a09b-32bb7d7914f0', 14.500000000000000000000000000000, '79ed9f7d-775f-4312-aa98-69f48f9b757e', 'debit_card', '2025-10-30 08:40:25.678', 'paid', '2025-10-30 08:40:25.678');
INSERT INTO public.payments VALUES ('7e21bb87-3ee9-4b98-bcf5-1793c9f59394', 19.000000000000000000000000000000, '5ac84a1c-56de-484c-b761-3aa0da105951', 'cash', '2025-10-30 08:48:40.901', 'paid', '2025-10-30 08:48:40.901');
INSERT INTO public.payments VALUES ('e8ef8cc5-304e-477e-aca9-7e28770ed17d', 16.500000000000000000000000000000, '0e0553d5-53cb-4e27-971e-d03267abdd08', 'pix', '2025-10-30 08:55:55.234', 'paid', '2025-10-30 08:55:55.234');
INSERT INTO public.payments VALUES ('e461359a-ba1f-40f6-b5f6-01873956692c', 15.000000000000000000000000000000, 'a008b3d7-015d-4084-a75e-11e7e0422158', 'credit_card', '2025-10-30 09:05:15.567', 'paid', '2025-10-30 09:05:15.567');
INSERT INTO public.payments VALUES ('47408e5e-c9ee-4d10-a528-7c25d468cdf1', 18.000000000000000000000000000000, '507388bb-cbb7-4b63-b32a-e20e7fe2de81', 'debit_card', '2025-10-30 09:15:30.89', 'paid', '2025-10-30 09:15:30.89');
INSERT INTO public.payments VALUES ('34078de9-45d4-432e-aa9d-f35e3fd73665', 18.500000000000000000000000000000, 'b4edd9b6-8985-4e91-9b0b-8647d744cc09', 'cash', '2025-10-30 09:25:45.123', 'paid', '2025-10-30 09:25:45.123');
INSERT INTO public.payments VALUES ('b27d8bdc-1be0-4139-a8d4-82529a3379fd', 127.000000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567903', 'debit_card', '2025-10-31 15:15:00', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('58fa7f33-6fcf-4d35-87ed-826b443c4504', 128.000000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567901', 'pix', '2025-10-31 14:15:34', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('44503402-d486-49fa-a983-53997af0cef2', 141.500000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567902', 'cash', '2025-10-31 14:50:45', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('f4331a22-426b-4a24-ad49-c9bb2939370e', 133.500000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567904', 'credit_card', '2025-10-31 15:55:01', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('9a8d1f8c-4c90-498e-aab0-867ab7ea7df9', 135.800000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567905', 'pix', '2025-10-31 16:25:05', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('52fdac71-71ff-4c14-aa84-c18f9b4f78da', 140.200000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567906', 'cash', '2025-10-31 17:00:06', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('bf95a6c6-28d3-4316-97bb-05ed0027d45c', 24.000000000000000000000000000000, '158d394a-7e13-41f3-84ac-7c4fb9da9a13', 'cash', '2025-10-29 08:10:30.789', 'paid', '2025-10-29 08:10:30.789');
INSERT INTO public.payments VALUES ('e958cc22-e9e2-4ca6-b856-9fb401df61da', 18.500000000000000000000000000000, '2cffa0b8-ca2c-471b-9753-60a436f75de8', 'pix', '2025-10-29 08:20:45.012', 'paid', '2025-10-29 08:20:45.012');
INSERT INTO public.payments VALUES ('32001f55-0021-4dcc-b758-62318f27f394', 15.000000000000000000000000000000, 'eb6cf66f-c7a4-466d-96fa-35481524c38a', 'credit_card', '2025-10-29 08:30:55.345', 'paid', '2025-10-29 08:30:55.345');
INSERT INTO public.payments VALUES ('baf09806-00a8-4762-a80f-c30fea098936', 22.000000000000000000000000000000, '6ac0bf0b-f272-4f3b-933b-d18f789de042', 'debit_card', '2025-10-29 08:33:10.678', 'paid', '2025-10-29 08:33:10.678');
INSERT INTO public.payments VALUES ('4fd4afb0-cf41-47f3-a103-e7b3031e8b1c', 23.500000000000000000000000000000, '5ef796d1-de4a-4c01-be23-ef350ba28058', 'cash', '2025-10-29 08:37:25.901', 'paid', '2025-10-29 08:37:25.901');
INSERT INTO public.payments VALUES ('922e51a7-e362-4b7f-bfe8-b5586618ecb0', 17.000000000000000000000000000000, '5cbe4a2e-8138-49a6-bba0-2062eb0d3b5c', 'pix', '2025-10-29 08:49:40.234', 'paid', '2025-10-29 08:49:40.234');
INSERT INTO public.payments VALUES ('ea32b7d0-67cd-4c4b-a1d4-9c047e08838d', 13.000000000000000000000000000000, '52ef88f3-235e-4570-a195-f9d18b4bbf54', 'credit_card', '2025-10-29 08:52:55.567', 'paid', '2025-10-29 08:52:55.567');
INSERT INTO public.payments VALUES ('d60c9024-22fb-47ba-a2c3-f8dfe834fc63', 19.000000000000000000000000000000, '23a06d9e-8b3f-44d0-a194-6e4e4de4f1c2', 'debit_card', '2025-10-29 08:57:05.89', 'paid', '2025-10-29 08:57:05.89');
INSERT INTO public.payments VALUES ('fb0da0da-d526-4602-860b-f3037800a9b6', 25.000000000000000000000000000000, 'b2dad1da-d0eb-4f2a-b479-bc9ca0cce425', 'cash', '2025-10-29 08:59:20.123', 'paid', '2025-10-29 08:59:20.123');
INSERT INTO public.payments VALUES ('23c59219-9371-49a0-b5b4-d60e9b1f7aa5', 21.000000000000000000000000000000, '1b8156e6-69b9-4c57-afe3-51c732eb35c2', 'pix', '2025-10-29 09:00:35.456', 'paid', '2025-10-29 09:00:35.456');
INSERT INTO public.payments VALUES ('c406ea82-6aaa-4d3d-84b2-3983babfc187', 31.000000000000000000000000000000, '1e35e928-e05d-4d63-9f66-abbc3a3216d1', 'pix', '2025-10-30 13:00:30.89', 'paid', '2025-10-30 13:00:30.89');
INSERT INTO public.payments VALUES ('79a956d3-f7ba-48a0-a086-b2d950e59a63', 29.000000000000000000000000000000, 'c30fe6fb-15a5-4945-b55b-b00df72867e4', 'credit_card', '2025-10-30 13:08:45.123', 'paid', '2025-10-30 13:08:45.123');
INSERT INTO public.payments VALUES ('881f7e3e-c753-4eb4-8fb0-f89b81235706', 35.000000000000000000000000000000, 'bf4816d4-b2fa-4c98-ab53-ede80260ab3e', 'debit_card', '2025-10-30 13:15:20.456', 'paid', '2025-10-30 13:15:20.456');
INSERT INTO public.payments VALUES ('423b1c92-5802-49ea-bb94-014163f7b68b', 31.000000000000000000000000000000, '68403968-d996-4190-834b-d73b70695512', 'cash', '2025-10-30 13:22:35.789', 'paid', '2025-10-30 13:22:35.789');
INSERT INTO public.payments VALUES ('5f115eb3-8d8b-46ad-a4b5-54fcae8dff92', 24.400000000000000000000000000000, '2de582d0-6784-4abd-919c-04e5ef9fd8ac', 'pix', '2025-10-30 13:30:50.012', 'paid', '2025-10-30 13:30:50.012');
INSERT INTO public.payments VALUES ('6cea6d79-d14c-4fe5-8ea9-a0ebc174d0df', 24.400000000000000000000000000000, 'd6818ba9-fcca-4834-acc2-8356b84e048d', 'credit_card', '2025-10-30 13:38:10.345', 'paid', '2025-10-30 13:38:10.345');
INSERT INTO public.payments VALUES ('26876d4e-be7e-43b9-97e8-1f606f8a8e80', 26.900000000000000000000000000000, 'a2a58b4b-99ea-4633-826e-3d1d9335acf5', 'debit_card', '2025-10-30 13:45:25.678', 'paid', '2025-10-30 13:45:25.678');
INSERT INTO public.payments VALUES ('ed998fbc-fe17-47f1-85a9-1affa0a431aa', 21.900000000000000000000000000000, 'f34f6040-d58f-4be9-826e-1293a663f916', 'cash', '2025-10-30 13:52:40.901', 'paid', '2025-10-30 13:52:40.901');
INSERT INTO public.payments VALUES ('c6764d6c-4f97-4c59-b017-643cb1d4144c', 28.900000000000000000000000000000, '402c5775-4db1-4239-9032-4b668474db49', 'pix', '2025-10-30 14:00:55.234', 'paid', '2025-10-30 14:00:55.234');
INSERT INTO public.payments VALUES ('4e0dbd4e-7812-4f82-ba87-ae694d78e1f4', 125.400000000000000000000000000000, 'a1b2c3d4-e5f6-7890-abcd-ef1234567891', 'debit_card', '2025-10-31 08:15:30', 'paid', '2025-10-31 17:01:26.86');
INSERT INTO public.payments VALUES ('ccaf57ce-3be8-4a63-b924-30304c5df38a', 28.000000000000000000000000000000, 'b41ef5bf-cb60-4818-a8fc-cb06bb8399ce', 'cash', '2025-10-30 14:32:15.123', 'paid', '2025-10-30 14:32:15.123');
INSERT INTO public.payments VALUES ('9828ed30-a22d-4d0b-866b-86a73415eb01', 26.400000000000000000000000000000, '9b16fcce-0ea0-4f3b-b5e7-73fb3f2a944e', 'pix', '2025-10-30 14:38:22.456', 'paid', '2025-10-30 14:38:22.456');
INSERT INTO public.payments VALUES ('fd6ee60b-06b9-467b-8d3e-06e684cc2bf2', 24.400000000000000000000000000000, 'b2d3ad45-03e7-4df0-b8b2-009c4b0d5fb3', 'credit_card', '2025-10-30 14:45:30.789', 'paid', '2025-10-30 14:45:30.789');
INSERT INTO public.payments VALUES ('1e06509d-d19e-4cec-98e7-4ce1189e96a7', 28.900000000000000000000000000000, '908c4095-5a52-4eb1-bb9b-ab963d418a63', 'debit_card', '2025-10-30 14:52:45.012', 'paid', '2025-10-30 14:52:45.012');
INSERT INTO public.payments VALUES ('e3aaadf6-1e13-4dd6-ac71-16aaa816d80c', 26.900000000000000000000000000000, '5f98a020-f230-4676-ac96-97928eb770a1', 'cash', '2025-10-30 14:58:10.345', 'paid', '2025-10-30 14:58:10.345');
INSERT INTO public.payments VALUES ('a4d0f723-080e-452b-b3bb-21b3004898b9', 15.000000000000000000000000000000, 'f9313642-3143-4c80-be62-92e5bb8c59da', 'pix', '2025-10-30 15:05:25.678', 'paid', '2025-10-30 15:05:25.678');
INSERT INTO public.payments VALUES ('565f060a-bb1d-4cc8-a67b-cd0dacff5cbc', 14.500000000000000000000000000000, '4dadd83a-f821-412a-b427-d7f17792fe5e', 'credit_card', '2025-10-30 15:15:40.901', 'paid', '2025-10-30 15:15:40.901');
INSERT INTO public.payments VALUES ('7703bc6f-5b47-41a1-bab7-ef3179c0df56', 14.500000000000000000000000000000, '442bc282-9aa9-415b-ae6f-65209fb2745a', 'debit_card', '2025-10-30 15:22:55.234', 'paid', '2025-10-30 15:22:55.234');
INSERT INTO public.payments VALUES ('011e3e12-aa70-48d9-b027-acb64f8bcc6a', 17.000000000000000000000000000000, 'ded8bf1a-8e24-41b0-ad83-3d1c9d8486ff', 'cash', '2025-10-30 15:30:15.567', 'paid', '2025-10-30 15:30:15.567');
INSERT INTO public.payments VALUES ('971c9170-6855-4f68-bd3e-5d042eb4d5dd', 14.000000000000000000000000000000, '8594c1a5-9b76-46e5-9bf3-da826d9c2295', 'pix', '2025-10-30 15:38:30.89', 'paid', '2025-10-30 15:38:30.89');
INSERT INTO public.payments VALUES ('4faf3c53-d6a0-476d-ae2a-82ac7c33f42d', 18.000000000000000000000000000000, '7eea9ba5-3bb1-49e6-9598-b5dfdd692d90', 'credit_card', '2025-10-30 15:45:45.123', 'paid', '2025-10-30 15:45:45.123');
INSERT INTO public.payments VALUES ('c599aa09-e7d2-44e2-be80-621b1112f006', 18.500000000000000000000000000000, 'dd99674c-b035-452b-9da1-d5cd665bb7c5', 'debit_card', '2025-10-30 15:52:20.456', 'paid', '2025-10-30 15:52:20.456');
INSERT INTO public.payments VALUES ('b905637a-e576-4f3a-b433-fb6b69fb524b', 14.500000000000000000000000000000, 'ce85ca53-b8a5-49d1-a0ff-d6b1d398edfc', 'credit_card', '2025-10-29 10:02:15.123', 'paid', '2025-10-29 10:02:15.123');
INSERT INTO public.payments VALUES ('7be79f43-eda3-4735-a5a5-f5f45c746d86', 17.000000000000000000000000000000, '8dad126c-ed64-4bc1-a1d1-56e8acf9368b', 'debit_card', '2025-10-29 10:08:45.456', 'paid', '2025-10-29 10:08:45.456');
INSERT INTO public.payments VALUES ('dd0bd4e5-14c9-4ff9-b594-915fd47682bf', 16.000000000000000000000000000000, '5b41b3e7-cbd5-4208-abff-74c45250cb83', 'cash', '2025-10-30 16:00:35.789', 'paid', '2025-10-30 16:00:35.789');
INSERT INTO public.payments VALUES ('8c8a9d06-e0da-45aa-8bb7-c3e629f15586', 24.000000000000000000000000000000, '70dee084-26a6-4c93-b779-f2e889714c78', 'cash', '2025-10-29 10:15:22.789', 'paid', '2025-10-29 10:15:22.789');
INSERT INTO public.payments VALUES ('e54274e9-b8d5-4eef-9db6-c9197aeeefb9', 18.500000000000000000000000000000, '104d8b4f-7460-4739-972c-236bf4baee37', 'pix', '2025-10-29 10:23:10.012', 'paid', '2025-10-29 10:23:10.012');
INSERT INTO public.payments VALUES ('f822a4b6-9d81-42bf-bf2b-04121299fe87', 15.000000000000000000000000000000, '1c9c9292-3baa-43f0-bc8f-305bc81c48a3', 'credit_card', '2025-10-29 10:31:55.345', 'paid', '2025-10-29 10:31:55.345');
INSERT INTO public.payments VALUES ('66e46b36-8c59-4d4e-b050-2198a12907f9', 22.000000000000000000000000000000, 'e8f1b187-3ff7-4b30-8b47-3d161a8cf1d4', 'debit_card', '2025-10-29 10:42:30.678', 'paid', '2025-10-29 10:42:30.678');
INSERT INTO public.payments VALUES ('b54a6bda-d981-482f-ba68-bf509b1dc594', 23.500000000000000000000000000000, '7d2c17cc-44aa-4569-80cf-ac8624c551ce', 'cash', '2025-10-29 10:48:17.901', 'paid', '2025-10-29 10:48:17.901');
INSERT INTO public.payments VALUES ('859049bd-1ce2-4caa-80ce-5bb5263f33c7', 17.000000000000000000000000000000, '55eef92d-4965-4a7f-86c3-d7ed7d6f182f', 'pix', '2025-10-29 10:55:05.234', 'paid', '2025-10-29 10:55:05.234');
INSERT INTO public.payments VALUES ('9e8e8dea-6886-4327-b7f3-a6c5f389d2e2', 13.000000000000000000000000000000, '283bfc31-fc96-4ca5-b31a-9ce560559bb5', 'credit_card', '2025-10-29 11:03:40.567', 'paid', '2025-10-29 11:03:40.567');
INSERT INTO public.payments VALUES ('b9e2d6b5-325b-4f4d-ac9f-c352be872c0c', 19.000000000000000000000000000000, '099fc48f-8eac-4cf7-b4ab-95ee7cce9cc8', 'debit_card', '2025-10-29 11:12:25.89', 'paid', '2025-10-29 11:12:25.89');
INSERT INTO public.payments VALUES ('dc7a4205-584a-4d26-890b-e76e45db8c05', 25.000000000000000000000000000000, '0cd78a7a-83d6-498d-ad65-21312321a630', 'cash', '2025-10-29 11:20:15.123', 'paid', '2025-10-29 11:20:15.123');
INSERT INTO public.payments VALUES ('b0db4522-6b51-44e3-aff3-9082497d317d', 21.000000000000000000000000000000, '2fc8dd5b-96b4-4e41-8a4d-b9c18d62ec02', 'pix', '2025-10-29 11:28:50.456', 'paid', '2025-10-29 11:28:50.456');
INSERT INTO public.payments VALUES ('08aad665-f66e-4008-b70b-8210ff43e329', 26.900000000000000000000000000000, 'aa754ece-2814-4dcb-85c4-fbf80753b8e3', 'credit_card', '2025-10-29 11:35:15.123', 'paid', '2025-10-29 11:35:15.123');
INSERT INTO public.payments VALUES ('25e2de3c-bef6-4916-9152-e99a4abaefaa', 27.500000000000000000000000000000, 'b6818216-9b70-4cdf-bba9-46c7bfec55d8', 'debit_card', '2025-10-29 11:42:22.456', 'paid', '2025-10-29 11:42:22.456');
INSERT INTO public.payments VALUES ('3d888b04-fb09-48aa-9b95-f25b63f8f8cc', 27.500000000000000000000000000000, 'e323485d-cc9e-4bd7-9fbc-1b36e28fb552', 'cash', '2025-10-29 11:48:30.789', 'paid', '2025-10-29 11:48:30.789');
INSERT INTO public.payments VALUES ('4aa810c1-fa64-4f9c-a179-1d5e26d89352', 28.000000000000000000000000000000, '44f99afc-2f6c-491f-8944-6187bff0cd25', 'pix', '2025-10-29 11:55:45.012', 'paid', '2025-10-29 11:55:45.012');
INSERT INTO public.payments VALUES ('ee7db12e-7618-485a-b119-87755a6dbaa3', 25.900000000000000000000000000000, '4b96a283-b921-4b5e-8f79-0eee7cc144c0', 'credit_card', '2025-10-29 12:02:10.345', 'paid', '2025-10-29 12:02:10.345');
INSERT INTO public.payments VALUES ('6004a3c1-1b0f-493e-b010-68deaa2a17df', 23.000000000000000000000000000000, '37e3c96c-96f2-4c0a-965e-e822ed4606b6', 'debit_card', '2025-10-29 12:08:25.678', 'paid', '2025-10-29 12:08:25.678');
INSERT INTO public.payments VALUES ('954225b4-7b4b-4b2f-b129-07115e7026c1', 29.900000000000000000000000000000, '60974322-2359-4779-9414-8fdbd75396fa', 'cash', '2025-10-29 12:15:40.901', 'paid', '2025-10-29 12:15:40.901');
INSERT INTO public.payments VALUES ('896e5835-20ce-40bd-87de-c343862fe51c', 25.500000000000000000000000000000, '31152fee-8115-4c4c-9fa2-7acb93dcbe98', 'pix', '2025-10-29 12:20:55.234', 'paid', '2025-10-29 12:20:55.234');
INSERT INTO public.payments VALUES ('1383cade-a477-4694-b3c2-2752a726746b', 32.000000000000000000000000000000, '83f330dc-3dec-4293-ac25-2f9a1fb55aac', 'credit_card', '2025-10-29 12:25:15.567', 'paid', '2025-10-29 12:25:15.567');
INSERT INTO public.payments VALUES ('bbd75ba9-55b9-4517-958e-93e0bbe3e2b8', 30.000000000000000000000000000000, '1c672639-702f-4aaf-a7dc-f33c5e4598d0', 'debit_card', '2025-10-29 12:28:30.89', 'paid', '2025-10-29 12:28:30.89');
INSERT INTO public.payments VALUES ('9cdaf2f9-b359-47a9-8c67-5d2a0e5244b6', 31.000000000000000000000000000000, 'cdbcc58a-3407-49b6-af57-0de805f49e5a', 'cash', '2025-10-29 12:32:45.123', 'paid', '2025-10-29 12:32:45.123');
INSERT INTO public.payments VALUES ('56b16b11-fa53-4657-ab1a-15e500219c74', 35.000000000000000000000000000000, '082c6814-4851-4b6d-a0f2-9a595b9bdb69', 'pix', '2025-10-29 12:38:20.456', 'paid', '2025-10-29 12:38:20.456');
INSERT INTO public.payments VALUES ('e9fe1c4b-689e-45bb-8753-cc838dac1a2a', 26.900000000000000000000000000000, '202ebe56-b9f9-419c-a78a-243f8e225e60', 'credit_card', '2025-10-29 12:48:18.234', 'paid', '2025-10-29 12:48:18.234');
INSERT INTO public.payments VALUES ('529b9c08-e924-4cc0-a696-1cd94e4c8d8e', 27.500000000000000000000000000000, '1d667dd0-c87b-4a51-b4cd-48dae1cdae97', 'debit_card', '2025-10-29 12:52:27.567', 'paid', '2025-10-29 12:52:27.567');
INSERT INTO public.payments VALUES ('ac426b4c-7a8f-45dd-a57e-d26c1f4a8fcc', 26.400000000000000000000000000000, '2abe1516-49f0-4104-a139-fa4e07f678d4', 'cash', '2025-10-29 12:57:35.89', 'paid', '2025-10-29 12:57:35.89');
INSERT INTO public.payments VALUES ('6b0a22f5-85c6-43f4-b2b8-fc53908042ae', 26.900000000000000000000000000000, '80a60362-5f9f-426f-8b10-768e79d8d5b7', 'pix', '2025-10-29 13:03:42.123', 'paid', '2025-10-29 13:03:42.123');
INSERT INTO public.payments VALUES ('6b82f525-4bfd-4110-8275-7bc2d10ccfca', 21.900000000000000000000000000000, '3d785e5c-4bb4-4b3f-a942-4d139c33d03e', 'credit_card', '2025-10-29 13:08:55.456', 'paid', '2025-10-29 13:08:55.456');
INSERT INTO public.payments VALUES ('fd66d508-7102-4ad6-9180-c81fdc83222f', 22.900000000000000000000000000000, '067e56dc-8084-4145-acfe-93b247865247', 'debit_card', '2025-10-29 13:15:10.789', 'paid', '2025-10-29 13:15:10.789');
INSERT INTO public.payments VALUES ('edabd804-07ac-4680-aae2-25441038b88e', 32.000000000000000000000000000000, '18fb5f8d-0338-4087-8860-d8ee712b5d48', 'cash', '2025-10-29 13:22:25.012', 'paid', '2025-10-29 13:22:25.012');
INSERT INTO public.payments VALUES ('bfbafa65-80ca-4d90-af77-3bddb7c979da', 24.400000000000000000000000000000, '89931a84-6803-49d8-9aec-e90f6aee0d36', 'pix', '2025-10-29 13:28:40.345', 'paid', '2025-10-29 13:28:40.345');
INSERT INTO public.payments VALUES ('aafebf19-831f-4958-91aa-af1b98862ca6', 28.900000000000000000000000000000, '735c3535-efa5-4d29-803d-66a783eeee81', 'credit_card', '2025-10-29 13:35:55.678', 'paid', '2025-10-29 13:35:55.678');
INSERT INTO public.payments VALUES ('a4007ab3-4f48-4124-b5f5-dccfdd0b6115', 35.000000000000000000000000000000, '1db79c9a-ef63-4e24-a273-3f6336d2b74c', 'debit_card', '2025-10-29 13:42:15.901', 'paid', '2025-10-29 13:42:15.901');
INSERT INTO public.payments VALUES ('483de642-b3a8-4170-92ff-aad20b8ea6ad', 39.000000000000000000000000000000, '6def25c7-7c50-4fbe-a248-4147276484d1', 'cash', '2025-10-29 13:48:30.234', 'paid', '2025-10-29 13:48:30.234');
INSERT INTO public.payments VALUES ('50265ca9-23a1-488e-a785-602ab874b60a', 40.000000000000000000000000000000, 'c2fbbe06-0488-4f71-8db3-b99db9dc7f22', 'pix', '2025-10-29 13:55:45.567', 'paid', '2025-10-29 13:55:45.567');
INSERT INTO public.payments VALUES ('9d5b2379-43cb-48c7-8158-ebde3873b496', 22.000000000000000000000000000000, '8b15a701-3642-4529-b53e-3f64084635e4', 'credit_card', '2025-10-29 14:05:15.123', 'paid', '2025-10-29 14:05:15.123');
INSERT INTO public.payments VALUES ('f7d1e90a-5667-4ed5-815b-d33be604cf50', 16.500000000000000000000000000000, 'fdf20aa8-f75d-4618-87a8-ac4ddb0da0ae', 'debit_card', '2025-10-29 14:12:22.456', 'paid', '2025-10-29 14:12:22.456');
INSERT INTO public.payments VALUES ('5bc793e4-abfd-415b-a4c2-7466c26c5d75', 18.500000000000000000000000000000, '24216468-a617-4982-8df5-fb986e78c183', 'cash', '2025-10-29 14:18:30.789', 'paid', '2025-10-29 14:18:30.789');
INSERT INTO public.payments VALUES ('32e88044-0179-4021-9c48-cd97f5a63f33', 20.000000000000000000000000000000, 'c850285f-cf14-451a-82f8-610e6a14403e', 'pix', '2025-10-29 14:25:45.012', 'paid', '2025-10-29 14:25:45.012');
INSERT INTO public.payments VALUES ('d4a87508-4101-4148-9b1d-6e27b7ad2456', 15.000000000000000000000000000000, '6a3f7bf9-3bfb-4a44-ab37-b8083d10531f', 'credit_card', '2025-10-29 14:32:10.345', 'paid', '2025-10-29 14:32:10.345');
INSERT INTO public.payments VALUES ('de65d0e6-47ec-4d50-aadf-9551973f5c40', 22.000000000000000000000000000000, '58d29ed7-26a8-4717-9533-13e36d8095f4', 'debit_card', '2025-10-29 14:38:25.678', 'paid', '2025-10-29 14:38:25.678');
INSERT INTO public.payments VALUES ('fed44e31-e94c-4333-a21a-884b3b35f264', 17.500000000000000000000000000000, '87bee23c-ed9d-4c2c-b06d-2294a86b545b', 'cash', '2025-10-29 14:45:40.901', 'paid', '2025-10-29 14:45:40.901');
INSERT INTO public.payments VALUES ('d61a221f-3c77-493a-bf55-6870dc8b3121', 19.000000000000000000000000000000, '78f2487d-b4a0-4d82-a2c5-ec20ffabe41e', 'pix', '2025-10-29 14:52:55.234', 'paid', '2025-10-29 14:52:55.234');
INSERT INTO public.payments VALUES ('5634c4c2-8f7f-400f-b497-bf507b8962de', 22.000000000000000000000000000000, 'ee23d0ea-7661-4233-8552-78eabaccdc4e', 'credit_card', '2025-10-29 14:58:15.567', 'paid', '2025-10-29 14:58:15.567');
INSERT INTO public.payments VALUES ('c5c9f5c5-5ea8-4748-addc-4ef8952e785d', 13.000000000000000000000000000000, '89a1ba1c-1f80-4064-8450-4e42b4fbab9e', 'debit_card', '2025-10-29 15:05:30.89', 'paid', '2025-10-29 15:05:30.89');
INSERT INTO public.payments VALUES ('04fc9d0f-64c7-4b1e-9f4a-b1980b7d7168', 15.000000000000000000000000000000, '3f436c90-5369-4f92-b50f-1d443e0fc9be', 'cash', '2025-10-29 15:32:15.123', 'paid', '2025-10-29 15:32:15.123');
INSERT INTO public.payments VALUES ('15f93c62-98cd-414b-a8e9-f1d348e1bc75', 14.500000000000000000000000000000, '31d27555-7f20-4491-98ab-a38b30a81ec2', 'pix', '2025-10-29 15:35:22.456', 'paid', '2025-10-29 15:35:22.456');
INSERT INTO public.payments VALUES ('6dd8a126-5967-4eb4-83bc-e16746f759a3', 14.500000000000000000000000000000, '8d26b4cf-c853-4468-907f-f870cbb361be', 'credit_card', '2025-10-29 15:40:30.789', 'paid', '2025-10-29 15:40:30.789');
INSERT INTO public.payments VALUES ('af6aa472-ecb0-4094-8a16-183a6bbb46fe', 18.000000000000000000000000000000, '84f43b08-d539-4dcb-b39c-7429a3de8cf8', 'debit_card', '2025-10-29 15:45:45.012', 'paid', '2025-10-29 15:45:45.012');
INSERT INTO public.payments VALUES ('7e13dc4d-a0d1-488b-9eef-e0a1f28e6ede', 12.000000000000000000000000000000, '67a287fb-1593-4e85-bb5b-e426373f4ddb', 'cash', '2025-10-29 15:52:10.345', 'paid', '2025-10-29 15:52:10.345');
INSERT INTO public.payments VALUES ('373f71fe-cabd-430a-a0dc-695dbafcc007', 18.000000000000000000000000000000, '2d88d7c3-6bef-4fe1-8632-1219e2843617', 'pix', '2025-10-29 15:58:25.678', 'paid', '2025-10-29 15:58:25.678');
INSERT INTO public.payments VALUES ('22701f74-2c41-479b-b83f-e8ab9e1641a2', 14.500000000000000000000000000000, 'f58a2f17-1170-4b00-95e8-a0849c7dfd3a', 'credit_card', '2025-10-29 16:05:40.901', 'paid', '2025-10-29 16:05:40.901');
INSERT INTO public.payments VALUES ('2163b717-aa5c-4cdc-bf19-5a48cdc5b94e', 19.000000000000000000000000000000, 'b7f39c98-9f66-437a-90bb-4f1f3be77421', 'debit_card', '2025-10-29 16:12:55.234', 'paid', '2025-10-29 16:12:55.234');
INSERT INTO public.payments VALUES ('b42329d3-b894-4f23-9551-0dcc17460d48', 18.000000000000000000000000000000, '98290be2-dc59-4d4c-9c16-a104b6ab945f', 'cash', '2025-10-29 16:20:15.567', 'paid', '2025-10-29 16:20:15.567');
INSERT INTO public.payments VALUES ('6f6b2678-287e-40ff-ad1a-2316d8432ea6', 16.000000000000000000000000000000, '1faaf7c1-76ad-40ec-b27e-f44a262d12b2', 'pix', '2025-10-29 16:28:30.89', 'paid', '2025-10-29 16:28:30.89');
INSERT INTO public.payments VALUES ('a7bae502-81f9-4a8d-bc1a-720393ceb92c', 22.000000000000000000000000000000, 'dd3923e0-8825-4834-b85f-7695f2aad923', 'credit_card', '2025-10-29 16:35:45.123', 'paid', '2025-10-29 16:35:45.123');
INSERT INTO public.payments VALUES ('acab82b7-09b4-4897-8dd6-7f273ff10f9f', 26.000000000000000000000000000000, 'e546456d-1888-4a26-ab9c-63b8d64c2d4b', 'debit_card', '2025-10-29 16:45:20.456', 'paid', '2025-10-29 16:45:20.456');


--
-- TOC entry 3464 (class 0 OID 16481)
-- Dependencies: 221
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products VALUES ('355d2ad5-0846-4ec3-ab59-ecf09e0ab6fb', 'Bife Acebolado', 'Bife acebolado com arroz, feijão e batata frita', 20.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('482c7b3e-1a5f-4d8a-bf32-8c9e1d4a7b2c', 'Bife à Cavalo', 'Bife à cavalo com ovo, queijo, arroz e feijão', 22.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('693d8a4f-2b6g-5e9b-cg43-9d0f2e5b8c3d', 'Bife à Milanesa', 'Bife à milanesa com arroz, feijão e batata frita', 20.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('7a4e9b5g-3c7h-6f0c-dh54-0e1g3f6c9d4e', 'Bife à Parmegiana', 'Bife à parmegiana com arroz, feijão e batata frita', 22.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('8b5f0c6h-4d8i-7g1d-ei65-1f2h4g7d0e5f', 'Bisteca de Porco', 'Bisteca de porco com arroz, feijão e legumes', 18.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('9c6g1d7i-5e9j-8h2e-fj76-2g3i5h8e1f6g', 'Linguiça Calabresa', 'Linguiça calabresa acebolada com arroz e feijão', 18.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('0d7h2e8j-6f0k-9i3f-gk87-3h4j6i9f2g7h', 'Linguiça Toscana', 'Linguiça toscana acebolada com arroz e feijão', 18.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('1e8i3f9k-7g1l-0j4g-hl98-4i5k7j0g3h8i', 'Filé de Frango Grelhado', 'Filé de frango grelhado com arroz e salada', 18.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('2f9j4g0l-8h2m-1k5h-im09-5j6l8k1h4i9j', 'Filé de Frango à Milanesa', 'Filé de frango à milanesa com arroz e batata', 18.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('3g0k5h1m-9i3n-2l6i-jn10-6k7m9l2i5j0k', 'Filé de Frango à Parmegiana', 'Filé de frango à parmegiana com arroz e batata', 20.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('4h1l6i2n-0j4o-3m7j-ko21-7l8n0m3j6k1l', 'Omelete Misto', 'Omelete misto com presunto e queijo', 18.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('5i2m7j3o-1k5p-4n8k-lp32-8m9o1n4k7l2m', 'Peixe Frito à Milanesa', 'Peixe frito à milanesa com arroz e purê', 21.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('6j3n8k4p-2l6q-5o9l-mq43-9n0p2o5l8m3n', 'Peixe Frito à Parmegiana', 'Peixe frito à parmegiana com arroz e purê', 23.900000000000000000000000000000, 'pratos', '2025-10-23 13:44:19.996', '2025-10-23 13:44:19.996');
INSERT INTO public.products VALUES ('e3f616e6-0445-4f3a-b18a-e96f9a54dd9a', 'Virado à Paulista', 'Arroz, tutu, bife, linguiça, ovo, couve, banana e salada', 22.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('dbf40098-59e9-4338-81cd-72a23fdf1ebd', 'Carne de Panela', 'Arroz, feijão, carne cozida com batata e salada', 22.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('91f1e336-bbfa-44f1-a0b1-fe45f8a0c64f', 'Carne Assada', 'Arroz, feijão, carne, purê e salada', 22.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('17f31273-e091-491d-ae2f-ea9324d15d62', 'Frango ao Molho', 'Arroz, feijão, frango cozido com batata, salada e farofa', 19.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('a736ac7d-3c3f-4365-bc10-920afc3266f4', 'Strogonoff de Frango', 'Arroz, feijão, strogonoff, batata palha e salada', 20.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('e70064a8-9be6-441a-89e4-4b41536c37fe', 'Feijoada Magra', 'Arroz, feijoada, couve, torresmo, farofa e molho vinagrete', 25.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('30731ea5-8673-4aa3-ace1-3d6f7927896c', 'Macarronada com Frango', 'Arroz, feijão, macarrão, frango, batata e salada', 20.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('daf29ce4-ade8-424d-998d-5850ec136c21', 'Lasanha de Frango', 'Arroz, lasanha, frango e salada', 25.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('0a96121e-e5a1-4f2c-87b6-ad270e66cf8a', 'Vaca Atolada', 'Arroz, feijão, costela cozida com mandioca e salada', 22.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('827fc92f-6a3b-4f2f-803a-6755afdf9005', 'Vaca Atolada Casal', 'Arroz, feijão, costela cozida com mandioca e salada - Porção para 2', 30.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('fae558c2-129d-40b2-a104-5f6db5df912c', 'Peixe Frito com Purê', 'Arroz, feijão, peixe, purê de batata e salada', 22.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('21df60fb-7c82-499e-b472-be9ab0d5e903', 'Peixe Frito Casal', 'Arroz, feijão, peixe, purê de batata e salada - Porção para 2', 30.000000000000000000000000000000, 'pratos_do_dia', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('760d0eab-82c4-4656-8da4-72f64b2552d3', 'Prato Executivo', 'Prato executivo completo', 25.000000000000000000000000000000, 'pratos', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('6e92cd2c-d4d4-443f-aaa9-29dc94440a41', 'Prato Executivo Grande', 'Prato executivo grande (salão e viagem)', 48.000000000000000000000000000000, 'pratos', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('714cb0fe-cc52-4d1c-b74b-029c4467e77a', 'Marmitex Simples', 'Marmitex simples', 24.000000000000000000000000000000, 'pratos', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('81daaca8-44ce-4534-8776-577370cb8ac6', 'Marmitex Executiva', 'Marmitex executiva', 27.000000000000000000000000000000, 'pratos', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('e4635d04-fbcb-4399-82e4-df0f03a8112b', 'Bisteca (unidade)', 'Bisteca avulsa', 6.000000000000000000000000000000, 'pratos', '2025-10-23 13:56:13.083', '2025-10-23 13:56:13.083');
INSERT INTO public.products VALUES ('9db51f4f-d60e-49fb-8421-5c98eb054b39', 'Coca-Cola 350ml', 'Refrigerante Coca-Cola lata', 6.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('6d8aa000-804d-472b-b867-3071f22b7364', 'Guaraná 350ml', 'Refrigerante Guaraná lata', 5.500000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('e488134d-a9b7-40ea-ac7a-0b8e26226fb8', 'Fanta Laranja 350ml', 'Refrigerante Fanta Laranja lata', 5.500000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('eb71e20c-66f1-4dab-9285-567fcec43a9c', 'Sprite 350ml', 'Refrigerante Sprite lata', 5.500000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('214a0fa7-0a91-4eb6-bcf9-101e1183f1ef', 'Água Mineral 500ml', 'Água mineral sem gás', 3.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('3ec2c669-e792-4476-ab56-c60579bcac64', 'Água com Gás 500ml', 'Água mineral com gás', 4.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('b1619291-9f3b-461a-8d20-c964e58d3ee2', 'Suco de Laranja 300ml', 'Suco natural de laranja', 8.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('8dd4f72d-1ac8-423b-8228-d1bc812c5ce4', 'Suco de Uva 300ml', 'Suco natural de uva', 8.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('8aeb5b66-9740-441f-8e42-740ecd922995', 'Skol 350ml', 'Cerveja Skol lata', 7.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('785381ad-c383-4f9b-9ff1-d62e471a6b0f', 'Brahma 350ml', 'Cerveja Brahma lata', 7.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('7fdc228d-9040-4431-9e1b-c35b0eb68367', 'Antarctica 350ml', 'Cerveja Antarctica lata', 7.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('81a54ba6-0a81-403b-bde7-21f444d3593b', 'Heineken 350ml', 'Cerveja Heineken lata', 9.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('0587a6a6-bcf1-441e-b359-a5b0e8abebbe', 'Stella Artois 275ml', 'Cerveja Stella Artois long neck', 10.000000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('277699e6-5e58-41ab-8b55-6d006e64d44b', 'Budweiser 350ml', 'Cerveja Budweiser lata', 8.500000000000000000000000000000, 'bebidas', '2025-10-23 14:12:29.833', '2025-10-23 14:12:29.833');
INSERT INTO public.products VALUES ('81a01734-8575-4df7-9cfa-4c98a0f81be1', 'Misto Quente', 'Pão, presunto e queijo', 9.000000000000000000000000000000, 'pratos', '2025-10-24 18:22:08.829', '2025-10-24 18:22:08.829');
INSERT INTO public.products VALUES ('b83c4569-2d66-4a75-b567-d56157d20143', 'Bauru', 'Pão, presunto, queijo e tomate', 9.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('d9c63121-bb9f-4f65-8c57-9e05ee2637ee', 'Pão com Ovo e Queijo', 'Pão, ovo e queijo', 9.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('9bac741b-b610-4b0b-9d71-e978dcdb8544', 'Queijo Quente', 'Pão com queijo derretido', 9.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('20eb4499-49b7-49eb-8c29-07a5d7a59aa4', 'Queijo Branco', 'Pão com queijo branco', 10.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('f0c0b4b3-98a5-4e5a-ad45-26397850e624', 'Americano', 'Pão, hambúrguer, queijo, alface e tomate', 11.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('658c26b1-bcb5-4b3e-859e-73b3f3fe2cac', 'Americano com Bacon', 'Pão, hambúrguer, queijo, bacon, alface e tomate', 13.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('a79e449b-52b6-4024-9032-cb9d76cc9666', 'Hambúrguer Simples', 'Pão com hambúrguer', 9.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('364b658c-800f-444f-abc9-e3f60b4115a0', 'X-Burger', 'Pão, hambúrguer, queijo, alface e tomate', 11.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('56222784-51e6-4219-8c45-c55abcdd65f4', 'X-Salada', 'Pão, hambúrguer, queijo, presunto, alface e tomate', 11.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('0ae4d490-74d5-45c2-9667-097c4a777fdd', 'X-Egg Salada', 'Pão, hambúrguer, queijo, ovo, alface e tomate', 12.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('ed41ec9e-df07-4237-9193-d78d5f2845a1', 'X-Bacon Salada', 'Pão, hambúrguer, queijo, bacon, alface e tomate', 13.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('74353e9b-99fc-44bc-80cf-24b2b88bc68e', 'X-Tudo', 'Pão, hambúrguer, queijo, presunto, bacon, ovo, alface e tomate', 16.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('6bb88569-dd14-41e5-b3c9-9322e9125446', 'X-Filé de Frango', 'Pão, filé de frango, queijo, alface e tomate', 12.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('7f4e3124-fb0b-490c-ac7d-370088de65bb', 'X-Churrasco', 'Pão, carne de churrasco, queijo, alface e tomate', 15.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');
INSERT INTO public.products VALUES ('a548b045-dd94-4f99-8e26-16603ed0b1c5', 'X-Calabresa', 'Pão, calabresa, queijo, alface e tomate', 12.000000000000000000000000000000, 'pratos', '2025-10-25 14:05:22.97', '2025-10-25 14:05:22.97');


--
-- TOC entry 3469 (class 0 OID 16568)
-- Dependencies: 226
-- Data for Name: satisfactions_survey; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.satisfactions_survey VALUES ('088ca8e1-ce94-41c3-a522-d1cb08898cc2', 4, 'bom', '1d057404-ca9b-48a4-bb94-97890e1f504b', '2025-10-20 08:00:15.123');
INSERT INTO public.satisfactions_survey VALUES ('ea87b8e9-09fc-47b4-963a-8bba701e7e8d', 3, 'regular', '7007534d-d82d-4cbc-b76a-387134ad8e8b', '2025-10-20 08:05:22.456');
INSERT INTO public.satisfactions_survey VALUES ('ad76c3c3-5cb1-47ff-8ca5-bedf7332e6ec', 4, 'bom', '158d394a-7e13-41f3-84ac-7c4fb9da9a13', '2025-10-20 08:10:30.789');
INSERT INTO public.satisfactions_survey VALUES ('18633ade-60e6-49a1-a93e-79adb747a072', 5, 'otimo', '2cffa0b8-ca2c-471b-9753-60a436f75de8', '2025-10-20 08:20:45.012');
INSERT INTO public.satisfactions_survey VALUES ('9294c594-4b89-46c5-bb0e-3d9c8d01e63a', 3, 'regular', 'eb6cf66f-c7a4-466d-96fa-35481524c38a', '2025-10-20 08:30:55.345');
INSERT INTO public.satisfactions_survey VALUES ('af5ad424-28af-4d80-9c11-5d21aa705315', 4, 'bom', '6ac0bf0b-f272-4f3b-933b-d18f789de042', '2025-10-20 08:33:10.678');
INSERT INTO public.satisfactions_survey VALUES ('302152e5-cc43-40a9-b2e9-03d08b68662b', 2, 'ruim', '5ef796d1-de4a-4c01-be23-ef350ba28058', '2025-10-20 08:37:25.901');
INSERT INTO public.satisfactions_survey VALUES ('01614dd8-de68-43f3-9790-3ed9bff063a5', 4, 'bom', '5cbe4a2e-8138-49a6-bba0-2062eb0d3b5c', '2025-10-20 08:49:40.234');
INSERT INTO public.satisfactions_survey VALUES ('ad9e25f3-b324-441d-9b3a-8882cd311c81', 3, 'regular', '52ef88f3-235e-4570-a195-f9d18b4bbf54', '2025-10-20 08:52:55.567');
INSERT INTO public.satisfactions_survey VALUES ('8132ec5e-ead1-452a-b108-f6349ba078a3', 1, 'pessimo', '23a06d9e-8b3f-44d0-a194-6e4e4de4f1c2', '2025-10-20 08:57:05.89');
INSERT INTO public.satisfactions_survey VALUES ('cf835502-626a-4be2-a5b3-4e4c9e607862', 4, 'bom', 'b2dad1da-d0eb-4f2a-b479-bc9ca0cce425', '2025-10-20 08:59:20.123');
INSERT INTO public.satisfactions_survey VALUES ('71bab078-473f-4987-93f8-0e4b36d66fa5', 4, 'bom', '1b8156e6-69b9-4c57-afe3-51c732eb35c2', '2025-10-20 09:00:35.456');
INSERT INTO public.satisfactions_survey VALUES ('87977365-1f2a-4f45-8a99-f8dc069d0a0f', 3, 'regular', 'ce85ca53-b8a5-49d1-a0ff-d6b1d398edfc', '2025-10-20 10:02:15.123');
INSERT INTO public.satisfactions_survey VALUES ('b3d460a5-0597-4806-8608-1b4bcebef96c', 5, 'otimo', '8dad126c-ed64-4bc1-a1d1-56e8acf9368b', '2025-10-20 10:08:45.456');
INSERT INTO public.satisfactions_survey VALUES ('48309aa8-69af-498c-acad-018c81254e26', 4, 'bom', '70dee084-26a6-4c93-b779-f2e889714c78', '2025-10-20 10:15:22.789');
INSERT INTO public.satisfactions_survey VALUES ('ec916cca-bb7d-4cdc-86f6-f311c25c0ece', 4, 'bom', 'b3967fe0-c9a3-4c38-9276-94faee38293d', '2025-10-21 08:05:15.123');
INSERT INTO public.satisfactions_survey VALUES ('40293ace-cab5-4159-b662-737e0cc73771', 3, 'regular', '104d8b4f-7460-4739-972c-236bf4baee37', '2025-10-20 10:23:10.012');
INSERT INTO public.satisfactions_survey VALUES ('87ac0d39-f5ed-4bd2-8e3f-47cd05071326', 4, 'bom', '1c9c9292-3baa-43f0-bc8f-305bc81c48a3', '2025-10-20 10:31:55.345');
INSERT INTO public.satisfactions_survey VALUES ('6a55a754-207f-429c-9074-4a15b38fa938', 5, 'otimo', 'e8f1b187-3ff7-4b30-8b47-3d161a8cf1d4', '2025-10-20 10:42:30.678');
INSERT INTO public.satisfactions_survey VALUES ('3631b52d-dac7-4e93-83a4-70257faff2f2', 4, 'bom', '7d2c17cc-44aa-4569-80cf-ac8624c551ce', '2025-10-20 10:48:17.901');
INSERT INTO public.satisfactions_survey VALUES ('da9c03f7-5991-4319-a84c-a934a5afc49d', 3, 'regular', '55eef92d-4965-4a7f-86c3-d7ed7d6f182f', '2025-10-20 10:55:05.234');
INSERT INTO public.satisfactions_survey VALUES ('bafe602a-60e3-4eed-bc3b-f5c1378ffb36', 4, 'bom', '283bfc31-fc96-4ca5-b31a-9ce560559bb5', '2025-10-20 11:03:40.567');
INSERT INTO public.satisfactions_survey VALUES ('ed423d18-9cf5-4899-8dd0-1c4c984f0dae', 2, 'ruim', '099fc48f-8eac-4cf7-b4ab-95ee7cce9cc8', '2025-10-20 11:12:25.89');
INSERT INTO public.satisfactions_survey VALUES ('48454627-d79e-4d8e-bb04-c7a43aa967e7', 4, 'bom', '0cd78a7a-83d6-498d-ad65-21312321a630', '2025-10-20 11:20:15.123');
INSERT INTO public.satisfactions_survey VALUES ('314f6315-aad3-4561-9e24-3cc28739c9de', 4, 'bom', '2fc8dd5b-96b4-4e41-8a4d-b9c18d62ec02', '2025-10-20 11:28:50.456');
INSERT INTO public.satisfactions_survey VALUES ('a3a0ac70-0e8b-459f-b348-fa29966aa785', 3, 'regular', 'aa754ece-2814-4dcb-85c4-fbf80753b8e3', '2025-10-20 11:35:15.123');
INSERT INTO public.satisfactions_survey VALUES ('d0399206-e50b-4be0-b070-1705c3d50566', 4, 'bom', 'b6818216-9b70-4cdf-bba9-46c7bfec55d8', '2025-10-20 11:42:22.456');
INSERT INTO public.satisfactions_survey VALUES ('74be9824-dbd3-49d7-a2b3-ee64d8bdc8ab', 5, 'otimo', 'e323485d-cc9e-4bd7-9fbc-1b36e28fb552', '2025-10-20 11:48:30.789');
INSERT INTO public.satisfactions_survey VALUES ('a8deec18-c8b7-400e-a764-0098b919d4e2', 4, 'bom', '44f99afc-2f6c-491f-8944-6187bff0cd25', '2025-10-20 11:55:45.012');
INSERT INTO public.satisfactions_survey VALUES ('ebeace98-f0ea-49bc-8bd5-e41fc735ccfe', 3, 'regular', '4b96a283-b921-4b5e-8f79-0eee7cc144c0', '2025-10-20 12:02:10.345');
INSERT INTO public.satisfactions_survey VALUES ('2d78354c-c119-42a8-b55d-e8f113647396', 4, 'bom', '37e3c96c-96f2-4c0a-965e-e822ed4606b6', '2025-10-20 12:08:25.678');
INSERT INTO public.satisfactions_survey VALUES ('420a7690-0fea-4f0e-a479-e4b65d781bde', 4, 'bom', '60974322-2359-4779-9414-8fdbd75396fa', '2025-10-20 12:15:40.901');
INSERT INTO public.satisfactions_survey VALUES ('e9dc99cf-a473-46ed-9e07-d60782ed79a3', 3, 'regular', '31152fee-8115-4c4c-9fa2-7acb93dcbe98', '2025-10-20 12:20:55.234');
INSERT INTO public.satisfactions_survey VALUES ('1f9381bb-36b6-4a08-9311-9fa9d8e4ac31', 5, 'otimo', '83f330dc-3dec-4293-ac25-2f9a1fb55aac', '2025-10-20 12:25:15.567');
INSERT INTO public.satisfactions_survey VALUES ('7a4eb29c-78d2-4066-b238-1abadc9d4767', 4, 'bom', '1c672639-702f-4aaf-a7dc-f33c5e4598d0', '2025-10-20 12:28:30.89');
INSERT INTO public.satisfactions_survey VALUES ('3fbd6cfb-dbc0-4921-9100-360e03c6ab8f', 4, 'bom', 'cdbcc58a-3407-49b6-af57-0de805f49e5a', '2025-10-20 12:32:45.123');
INSERT INTO public.satisfactions_survey VALUES ('b58d96ac-fbbe-4850-802a-0639f2335ae3', 3, 'regular', '082c6814-4851-4b6d-a0f2-9a595b9bdb69', '2025-10-20 12:38:20.456');
INSERT INTO public.satisfactions_survey VALUES ('44e7e6bc-f589-432c-a3ba-47e56a5daf73', 4, 'bom', '202ebe56-b9f9-419c-a78a-243f8e225e60', '2025-10-20 12:48:18.234');
INSERT INTO public.satisfactions_survey VALUES ('e6ff9037-a770-49cf-a74f-4d33c4ccce36', 2, 'ruim', '1d667dd0-c87b-4a51-b4cd-48dae1cdae97', '2025-10-20 12:52:27.567');
INSERT INTO public.satisfactions_survey VALUES ('b46da95f-71c1-4729-840e-434a1155b2f1', 4, 'bom', '2abe1516-49f0-4104-a139-fa4e07f678d4', '2025-10-20 12:57:35.89');
INSERT INTO public.satisfactions_survey VALUES ('094618b2-a8bb-4427-ada7-f921f8e822ff', 4, 'bom', '80a60362-5f9f-426f-8b10-768e79d8d5b7', '2025-10-20 13:03:42.123');
INSERT INTO public.satisfactions_survey VALUES ('3b3d2077-166b-4c1f-bbc2-85cab020acc3', 3, 'regular', '3d785e5c-4bb4-4b3f-a942-4d139c33d03e', '2025-10-20 13:08:55.456');
INSERT INTO public.satisfactions_survey VALUES ('fd2f15e2-1d67-474c-92eb-36181a6d9079', 4, 'bom', '067e56dc-8084-4145-acfe-93b247865247', '2025-10-20 13:15:10.789');
INSERT INTO public.satisfactions_survey VALUES ('49a21c81-3249-4429-bbdc-5dc0a646d3e5', 5, 'otimo', '18fb5f8d-0338-4087-8860-d8ee712b5d48', '2025-10-20 13:22:25.012');
INSERT INTO public.satisfactions_survey VALUES ('51d368c1-0ca3-49cf-bb76-c3618f410862', 4, 'bom', '89931a84-6803-49d8-9aec-e90f6aee0d36', '2025-10-20 13:28:40.345');
INSERT INTO public.satisfactions_survey VALUES ('9fed15c1-8176-4b40-966b-035b2e21f3ad', 4, 'bom', '735c3535-efa5-4d29-803d-66a783eeee81', '2025-10-20 13:35:55.678');
INSERT INTO public.satisfactions_survey VALUES ('b81b5511-980a-41c8-8405-8089d78bfce4', 3, 'regular', '1db79c9a-ef63-4e24-a273-3f6336d2b74c', '2025-10-20 13:42:15.901');
INSERT INTO public.satisfactions_survey VALUES ('5d0789df-ee60-467f-b2b8-aa6dec4820d7', 4, 'bom', '6def25c7-7c50-4fbe-a248-4147276484d1', '2025-10-20 13:48:30.234');
INSERT INTO public.satisfactions_survey VALUES ('35b540d8-a30a-4a8b-9d11-df017ec26d44', 4, 'bom', 'c2fbbe06-0488-4f71-8db3-b99db9dc7f22', '2025-10-20 13:55:45.567');
INSERT INTO public.satisfactions_survey VALUES ('831a3019-f9af-409e-a017-494501fed7ee', 3, 'regular', '8b15a701-3642-4529-b53e-3f64084635e4', '2025-10-20 14:05:15.123');
INSERT INTO public.satisfactions_survey VALUES ('ec711f1b-3ac1-4428-841b-5e09dc33b5c8', 4, 'bom', 'fdf20aa8-f75d-4618-87a8-ac4ddb0da0ae', '2025-10-20 14:12:22.456');
INSERT INTO public.satisfactions_survey VALUES ('26d039f9-fae4-40ab-9c36-8bbc7dd35291', 4, 'bom', '24216468-a617-4982-8df5-fb986e78c183', '2025-10-20 14:18:30.789');
INSERT INTO public.satisfactions_survey VALUES ('879f2ed3-6f6c-4ba0-944b-1b2c80fd4811', 5, 'otimo', 'c850285f-cf14-451a-82f8-610e6a14403e', '2025-10-20 14:25:45.012');
INSERT INTO public.satisfactions_survey VALUES ('03f3d647-5f8f-47e9-8490-4880fe37a103', 4, 'bom', '6a3f7bf9-3bfb-4a44-ab37-b8083d10531f', '2025-10-20 14:32:10.345');
INSERT INTO public.satisfactions_survey VALUES ('c21da4f6-701f-4417-85b2-9afd3061bc53', 4, 'bom', '58d29ed7-26a8-4717-9533-13e36d8095f4', '2025-10-20 14:38:25.678');
INSERT INTO public.satisfactions_survey VALUES ('32943af6-484e-4b2b-8bec-5a908a04f97b', 3, 'regular', '87bee23c-ed9d-4c2c-b06d-2294a86b545b', '2025-10-20 14:45:40.901');
INSERT INTO public.satisfactions_survey VALUES ('44b68064-c1a4-4f5d-8ea8-5c40f752e6f3', 2, 'ruim', '78f2487d-b4a0-4d82-a2c5-ec20ffabe41e', '2025-10-20 14:52:55.234');
INSERT INTO public.satisfactions_survey VALUES ('7ae9b352-f2ff-4bff-97c0-6acae36121f2', 4, 'bom', 'ee23d0ea-7661-4233-8552-78eabaccdc4e', '2025-10-20 14:58:15.567');
INSERT INTO public.satisfactions_survey VALUES ('8f96e118-3561-4ebb-ba93-f873513b433f', 4, 'bom', '89a1ba1c-1f80-4064-8450-4e42b4fbab9e', '2025-10-20 15:05:30.89');
INSERT INTO public.satisfactions_survey VALUES ('b7c21822-4138-407f-8661-d7e3d587b020', 3, 'regular', '3f436c90-5369-4f92-b50f-1d443e0fc9be', '2025-10-20 15:32:15.123');
INSERT INTO public.satisfactions_survey VALUES ('70149664-4156-48fd-9e1d-28500602524a', 4, 'bom', '31d27555-7f20-4491-98ab-a38b30a81ec2', '2025-10-20 15:35:22.456');
INSERT INTO public.satisfactions_survey VALUES ('cf0f55a5-5702-41dd-8fad-b4607e8a83d3', 4, 'bom', '8d26b4cf-c853-4468-907f-f870cbb361be', '2025-10-20 15:40:30.789');
INSERT INTO public.satisfactions_survey VALUES ('2d340232-c9e9-42c5-9c1f-970ce6336d02', 5, 'otimo', '84f43b08-d539-4dcb-b39c-7429a3de8cf8', '2025-10-20 15:45:45.012');
INSERT INTO public.satisfactions_survey VALUES ('17150cbc-a5ca-4cfb-bff5-5f5cbb313420', 4, 'bom', '67a287fb-1593-4e85-bb5b-e426373f4ddb', '2025-10-20 15:52:10.345');
INSERT INTO public.satisfactions_survey VALUES ('b00b36b8-01ef-456b-9b7d-f0bca7234868', 4, 'bom', '2d88d7c3-6bef-4fe1-8632-1219e2843617', '2025-10-20 15:58:25.678');
INSERT INTO public.satisfactions_survey VALUES ('bdbd099c-9b10-4585-b6af-bc332f075367', 3, 'regular', 'f58a2f17-1170-4b00-95e8-a0849c7dfd3a', '2025-10-20 16:05:40.901');
INSERT INTO public.satisfactions_survey VALUES ('af624d9b-443e-4d47-93cd-6a02aaaf3699', 4, 'bom', 'b7f39c98-9f66-437a-90bb-4f1f3be77421', '2025-10-20 16:12:55.234');
INSERT INTO public.satisfactions_survey VALUES ('ea422aae-832f-4c79-867f-e8c9db75c9f6', 1, 'pessimo', '98290be2-dc59-4d4c-9c16-a104b6ab945f', '2025-10-20 16:20:15.567');
INSERT INTO public.satisfactions_survey VALUES ('4e56ba35-1762-4538-9679-72d2484e2295', 4, 'bom', '1faaf7c1-76ad-40ec-b27e-f44a262d12b2', '2025-10-20 16:28:30.89');
INSERT INTO public.satisfactions_survey VALUES ('db3425de-09c1-42e4-96c9-b29ebc0b7adf', 3, 'regular', 'fdc0e0e1-c2e5-4999-989e-63ded9df9f2c', '2025-10-21 08:12:22.456');
INSERT INTO public.satisfactions_survey VALUES ('0ac3d007-d950-4c02-a13e-66532ae47fde', 4, 'bom', 'd4ec5cad-f6d9-4196-b3d3-93d63da9db87', '2025-10-21 08:18:30.789');
INSERT INTO public.satisfactions_survey VALUES ('ad0fb5e7-18be-4a25-9f07-e1f93c7e14f9', 5, 'otimo', '4092b3a6-771e-48d6-a8e7-34dfb564efad', '2025-10-21 08:25:45.012');
INSERT INTO public.satisfactions_survey VALUES ('9b4c4926-bde2-4614-aeeb-1df9a8588bab', 3, 'regular', 'd520de3c-5456-4da0-8bce-842e5e905d13', '2025-10-21 08:32:10.345');
INSERT INTO public.satisfactions_survey VALUES ('0d355bd7-1874-451e-9ff1-65f9de8070da', 4, 'bom', '79ed9f7d-775f-4312-aa98-69f48f9b757e', '2025-10-21 08:40:25.678');
INSERT INTO public.satisfactions_survey VALUES ('15382e9c-44d5-46c8-a134-c69889190743', 4, 'bom', '5ac84a1c-56de-484c-b761-3aa0da105951', '2025-10-21 08:48:40.901');
INSERT INTO public.satisfactions_survey VALUES ('a6ef4d27-e93e-4e7b-8d92-479613e55aa8', 3, 'regular', '0e0553d5-53cb-4e27-971e-d03267abdd08', '2025-10-21 08:55:55.234');
INSERT INTO public.satisfactions_survey VALUES ('5a031079-f4df-42c3-b6a5-a75127a7f2f8', 2, 'ruim', 'a008b3d7-015d-4084-a75e-11e7e0422158', '2025-10-21 09:05:15.567');
INSERT INTO public.satisfactions_survey VALUES ('fbd97fff-3934-42a7-b950-41b06392b39d', 4, 'bom', '507388bb-cbb7-4b63-b32a-e20e7fe2de81', '2025-10-21 09:15:30.89');
INSERT INTO public.satisfactions_survey VALUES ('5e7bc025-66b5-484d-a8a2-e3f9920ffff2', 4, 'bom', 'b4edd9b6-8985-4e91-9b0b-8647d744cc09', '2025-10-21 09:25:45.123');
INSERT INTO public.satisfactions_survey VALUES ('7c8f9fb7-aaa0-40cc-97f2-0a5e7f64f4d4', 3, 'regular', '01fb5bc4-08a4-4a84-8951-b5b41a5277c5', '2025-10-21 09:38:20.456');
INSERT INTO public.satisfactions_survey VALUES ('06556e5a-6ba9-4df4-8278-79288bae95b2', 4, 'bom', 'c88e8f62-18a2-46b2-ada9-e00b4b55c1b2', '2025-10-21 09:45:35.789');
INSERT INTO public.satisfactions_survey VALUES ('a79913f5-8278-41e5-8d5c-dd6b658fb18c', 5, 'otimo', '3ac45c7b-e2bf-4459-a395-ab4f898848cf', '2025-10-21 09:52:50.012');
INSERT INTO public.satisfactions_survey VALUES ('75a2f84e-a51e-4248-8f29-293b488d43a2', 4, 'bom', 'c4282caa-0450-41ff-aec3-8d2524462e59', '2025-10-21 10:08:15.123');
INSERT INTO public.satisfactions_survey VALUES ('e1cada62-6f85-4204-a86e-ce0d2e5e11d2', 4, 'bom', '78200a8a-f7dd-4ee1-9b4b-e2c8db3d2541', '2025-10-21 10:15:22.456');
INSERT INTO public.satisfactions_survey VALUES ('da18989f-c435-4d44-9dcb-018acf09e1c6', 3, 'regular', '6167c694-266d-4fc3-b41e-bf5b19fca1fe', '2025-10-21 10:22:30.789');
INSERT INTO public.satisfactions_survey VALUES ('c664dccd-61a2-463d-a480-db430605ebf7', 4, 'bom', '32f21866-2375-446d-a485-b1bf873314ba', '2025-10-21 10:30:45.012');
INSERT INTO public.satisfactions_survey VALUES ('9818936f-b244-49bc-88f6-932d208c591c', 4, 'bom', 'd026e257-3a78-43de-94d5-8abcb8757f14', '2025-10-21 10:38:10.345');
INSERT INTO public.satisfactions_survey VALUES ('c85bec16-dd30-4878-bec4-5db4fd18a30b', 3, 'regular', 'cd1c918b-10a3-4656-8b4b-bc3afd83d0ce', '2025-10-21 10:45:25.678');
INSERT INTO public.satisfactions_survey VALUES ('2c0e5537-2738-4048-90d3-51e4fcd6317f', 2, 'ruim', 'ca5e7381-c9c8-4113-9e9e-2a73c42e050c', '2025-10-21 10:52:40.901');
INSERT INTO public.satisfactions_survey VALUES ('8d13383f-9f5f-424a-91d7-63ddb225c636', 4, 'bom', 'a5e4a5cf-1e54-4e58-b513-36bbe16202fd', '2025-10-21 11:00:55.234');
INSERT INTO public.satisfactions_survey VALUES ('714c76d0-5189-48fb-a8e0-372d1111e662', 4, 'bom', '06ef4b80-130f-4e18-b34e-34b7c6e1e59f', '2025-10-21 11:08:15.567');
INSERT INTO public.satisfactions_survey VALUES ('4c47f714-2213-4108-a0ab-5eab6c0a673d', 3, 'regular', '7557c61a-01f0-4785-af60-f716b1006655', '2025-10-21 11:15:30.89');
INSERT INTO public.satisfactions_survey VALUES ('20765e86-6b57-4405-a364-f0b3d3a00d32', 4, 'bom', '6acb6cf3-41a5-4963-a014-5da3777d269f', '2025-10-21 11:22:45.123');
INSERT INTO public.satisfactions_survey VALUES ('36baefc5-2ddc-4691-af6a-271c9bdef8b1', 5, 'otimo', 'ad1c9492-e972-4a9d-8254-ee7459db142f', '2025-10-21 11:28:20.456');
INSERT INTO public.satisfactions_survey VALUES ('11c8aba5-0f75-414f-8e55-459541fb56e9', 4, 'bom', 'cdd7cdf5-5af4-4959-9a6f-921b37c46274', '2025-10-21 11:52:15.123');
INSERT INTO public.satisfactions_survey VALUES ('9caee532-5815-4cee-b887-0268ae5aa668', 4, 'bom', '49b374c3-87e1-487b-a1ac-2ee94a21552b', '2025-10-21 12:00:22.456');
INSERT INTO public.satisfactions_survey VALUES ('cf73f3bc-b1cd-4262-b66d-98ed7b7b9dfc', 3, 'regular', '14bae61b-b08a-4fd8-bd8b-4fca8f631a1d', '2025-10-21 12:08:30.789');
INSERT INTO public.satisfactions_survey VALUES ('44b8aed2-7044-4553-8d19-077f6e62bfe6', 4, 'bom', '64510b5a-07b5-4833-841a-852fb38a55a9', '2025-10-21 12:15:45.012');
INSERT INTO public.satisfactions_survey VALUES ('6bc5f770-166e-4746-930d-4a1a6a51d7ce', 4, 'bom', 'bd4442f9-a419-4625-988c-7352053ddc05', '2025-10-21 12:23:10.345');
INSERT INTO public.satisfactions_survey VALUES ('ea07bb0f-6d4c-443e-b815-c6e8c55a4311', 3, 'regular', '29cf6e46-3394-4610-a37b-3d71542b1cc2', '2025-10-21 12:30:25.678');
INSERT INTO public.satisfactions_survey VALUES ('03c91a39-911c-47e2-b9ca-fe3dda2c0070', 5, 'otimo', 'cc61157e-2388-44d9-8715-cb563a4a90c9', '2025-10-21 12:38:40.901');
INSERT INTO public.satisfactions_survey VALUES ('52c86ca2-7f6e-440e-ae65-effb2d85454d', 4, 'bom', 'c974eedf-ab19-4b3f-9c8d-397510bcdea4', '2025-10-21 12:45:55.234');
INSERT INTO public.satisfactions_survey VALUES ('8d5be1d3-ec5e-4f60-82a2-a3baf57c39e3', 4, 'bom', '8955a0f2-fa6e-4b1b-8db3-45f3cfc0442a', '2025-10-21 12:53:15.567');
INSERT INTO public.satisfactions_survey VALUES ('9c47ee85-6f45-484c-9e4c-bd31de05ee78', 3, 'regular', '1e35e928-e05d-4d63-9f66-abbc3a3216d1', '2025-10-21 13:00:30.89');
INSERT INTO public.satisfactions_survey VALUES ('712343bf-096b-4867-ae97-f4ec16056cb6', 4, 'bom', 'c30fe6fb-15a5-4945-b55b-b00df72867e4', '2025-10-21 13:08:45.123');
INSERT INTO public.satisfactions_survey VALUES ('653189ab-37d9-49cb-a0f7-85f1fbaf6419', 2, 'ruim', 'bf4816d4-b2fa-4c98-ab53-ede80260ab3e', '2025-10-21 13:15:20.456');
INSERT INTO public.satisfactions_survey VALUES ('22624d2a-c82e-4ab7-ad4d-032ebc626142', 4, 'bom', '68403968-d996-4190-834b-d73b70695512', '2025-10-21 13:22:35.789');
INSERT INTO public.satisfactions_survey VALUES ('323edabb-cab1-4ef6-b41f-eff5fb0d0c62', 4, 'bom', '2de582d0-6784-4abd-919c-04e5ef9fd8ac', '2025-10-21 13:30:50.012');
INSERT INTO public.satisfactions_survey VALUES ('6b43faf6-0e9e-4245-9120-c29b67d92f83', 3, 'regular', 'd6818ba9-fcca-4834-acc2-8356b84e048d', '2025-10-21 13:38:10.345');
INSERT INTO public.satisfactions_survey VALUES ('3880e38c-8407-461d-af66-212ab107f763', 4, 'bom', 'a2a58b4b-99ea-4633-826e-3d1d9335acf5', '2025-10-21 13:45:25.678');
INSERT INTO public.satisfactions_survey VALUES ('10f5d642-50e4-4a44-9dbf-503ba636e673', 4, 'bom', 'f34f6040-d58f-4be9-826e-1293a663f916', '2025-10-21 13:52:40.901');
INSERT INTO public.satisfactions_survey VALUES ('cd85032e-b69b-4662-85f0-fa6dece6e660', 3, 'regular', '402c5775-4db1-4239-9032-4b668474db49', '2025-10-21 14:00:55.234');
INSERT INTO public.satisfactions_survey VALUES ('cacc3eae-c514-43ad-b401-7f3037b36661', 5, 'otimo', 'ef22c2af-e213-47d6-afb4-37582e799df6', '2025-10-21 14:08:15.567');
INSERT INTO public.satisfactions_survey VALUES ('4341be01-951f-4d98-acb7-e6a82106435c', 4, 'bom', '37faf35a-a203-415a-8987-7b6a084bf453', '2025-10-21 14:15:30.89');
INSERT INTO public.satisfactions_survey VALUES ('68348f06-9c56-4c3e-91c1-d680e43716ae', 4, 'bom', 'b41ef5bf-cb60-4818-a8fc-cb06bb8399ce', '2025-10-21 14:32:15.123');
INSERT INTO public.satisfactions_survey VALUES ('37ccd06b-555a-4edf-9239-5d6ceaed77ef', 3, 'regular', '9b16fcce-0ea0-4f3b-b5e7-73fb3f2a944e', '2025-10-21 14:38:22.456');
INSERT INTO public.satisfactions_survey VALUES ('1aea33b4-f8b1-4518-a692-433593df8001', 4, 'bom', 'b2d3ad45-03e7-4df0-b8b2-009c4b0d5fb3', '2025-10-21 14:45:30.789');
INSERT INTO public.satisfactions_survey VALUES ('b914d100-95dc-4317-b0a4-9cf9d5d007c7', 4, 'bom', '908c4095-5a52-4eb1-bb9b-ab963d418a63', '2025-10-21 14:52:45.012');
INSERT INTO public.satisfactions_survey VALUES ('4bbbc03e-751f-4c03-8054-467b747d9824', 3, 'regular', '5f98a020-f230-4676-ac96-97928eb770a1', '2025-10-21 14:58:10.345');
INSERT INTO public.satisfactions_survey VALUES ('62bcac9f-ac9b-4e5f-8f41-adecb8a3dee1', 2, 'ruim', 'f9313642-3143-4c80-be62-92e5bb8c59da', '2025-10-21 15:05:25.678');
INSERT INTO public.satisfactions_survey VALUES ('c24cfcfa-12d6-4eec-aadd-9b97dd3d1ed7', 4, 'bom', '4dadd83a-f821-412a-b427-d7f17792fe5e', '2025-10-21 15:15:40.901');
INSERT INTO public.satisfactions_survey VALUES ('ade4bc4b-73e3-4113-9e5b-2d5d9aac03cd', 4, 'bom', '442bc282-9aa9-415b-ae6f-65209fb2745a', '2025-10-21 15:22:55.234');
INSERT INTO public.satisfactions_survey VALUES ('7097a89f-1f82-47a1-a892-bb822e7bc1d6', 3, 'regular', 'ded8bf1a-8e24-41b0-ad83-3d1c9d8486ff', '2025-10-21 15:30:15.567');
INSERT INTO public.satisfactions_survey VALUES ('2814ba3f-3af8-4473-ba3d-e6590ee4d87b', 4, 'bom', '8594c1a5-9b76-46e5-9bf3-da826d9c2295', '2025-10-21 15:38:30.89');
INSERT INTO public.satisfactions_survey VALUES ('cb52cb0c-94eb-4a6e-9e81-2c7ef63bceac', 5, 'otimo', '7eea9ba5-3bb1-49e6-9598-b5dfdd692d90', '2025-10-21 15:45:45.123');
INSERT INTO public.satisfactions_survey VALUES ('c99e4f51-6545-44ca-95ef-2e08699eecb7', 4, 'bom', 'dd99674c-b035-452b-9da1-d5cd665bb7c5', '2025-10-21 15:52:20.456');
INSERT INTO public.satisfactions_survey VALUES ('f541abe3-ead5-4db8-b243-456dd9a5472a', 4, 'bom', '5b41b3e7-cbd5-4208-abff-74c45250cb83', '2025-10-21 16:00:35.789');
INSERT INTO public.satisfactions_survey VALUES ('225af7a3-8e4b-43b4-8fb9-97719ff6fab2', 3, 'regular', '726beeee-bd77-4909-85cc-65ae7ee74910', '2025-10-21 16:08:50.012');
INSERT INTO public.satisfactions_survey VALUES ('2cfd1240-0d01-4560-a4bf-7165c8672ad5', 4, 'bom', 'b8591725-b995-488a-ac80-e80a5ebec505', '2025-10-21 16:15:10.345');
INSERT INTO public.satisfactions_survey VALUES ('bd6425d9-aeb5-4fc7-9f00-3c009955fd92', 1, 'pessimo', 'a787228f-f136-4355-95f0-a6f0de4c7c84', '2025-10-21 16:22:25.678');
INSERT INTO public.satisfactions_survey VALUES ('92edc80e-49be-46e7-817c-13a859bfc509', 4, 'bom', '3fc67fd7-1832-47c6-9a53-5e115ef2b8aa', '2025-10-21 16:30:40.901');
INSERT INTO public.satisfactions_survey VALUES ('c56052b9-1930-43cc-9e02-6d478d65c7c3', 4, 'bom', 'df0534b1-a5be-4398-82ba-2a5b743bac59', '2025-10-21 16:38:55.234');
INSERT INTO public.satisfactions_survey VALUES ('0df9b527-81eb-41fb-9042-7ffe1d915583', 3, 'regular', '47060e08-a607-4ba8-813b-ee2acbae33f4', '2025-10-21 16:45:15.567');
INSERT INTO public.satisfactions_survey VALUES ('629376f7-bf4b-4952-9901-e0936608631c', 4, 'bom', 'bf43bc20-edd4-4aa7-b35a-f12880550db8', '2025-10-21 16:52:30.89');
INSERT INTO public.satisfactions_survey VALUES ('39fad925-d6c1-49f1-85f0-7d3d2efebea5', 4, 'bom', 'c98817ab-4ef4-48f0-bc05-78774a97cffc', '2025-10-22 08:15:00');
INSERT INTO public.satisfactions_survey VALUES ('1fe7fed1-a98b-4b79-a743-4f0fbc7f80e0', 3, 'regular', '6dc05064-958e-42ff-9900-0e8a7b9e4bc7', '2025-10-22 08:45:00');
INSERT INTO public.satisfactions_survey VALUES ('cc9faada-7c2f-47a5-a00f-0392ee709cfb', 4, 'bom', 'c853cba5-bcc2-482e-aa45-ab5f091021da', '2025-10-22 09:20:00');
INSERT INTO public.satisfactions_survey VALUES ('8cc97bcf-3a2f-43ca-8533-e655f7c3c969', 5, 'otimo', 'dd47b4bc-93aa-430a-8c4e-746c9e7d34b0', '2025-10-22 10:00:00');
INSERT INTO public.satisfactions_survey VALUES ('ab412c22-2b06-454f-9f1c-43e39554f964', 3, 'regular', 'cb908593-fc3c-4eac-830e-b3aa1d98057a', '2025-10-22 10:40:00');
INSERT INTO public.satisfactions_survey VALUES ('20c11154-bf01-45bd-bd7b-72324e439438', 4, 'bom', 'fda64b05-7a11-4dd4-8886-42d1e3357452', '2025-10-22 11:10:00');
INSERT INTO public.satisfactions_survey VALUES ('3f015b28-c613-4e08-baab-597293fc5610', 4, 'bom', 'a5e29b86-b5ec-4e9a-b2e1-01fb5903ef4a', '2025-10-22 11:30:00');
INSERT INTO public.satisfactions_survey VALUES ('f82648c3-eb29-428f-8a3f-afe1877e36af', 3, 'regular', '57912516-6416-4119-b78b-2e2e87d0497b', '2025-10-22 12:15:00');
INSERT INTO public.satisfactions_survey VALUES ('3d4e2ab4-9175-4405-85d9-f726fdd9c2af', 2, 'ruim', '4d36d62a-f43c-4513-86bf-a88dac227b7e', '2025-10-22 13:00:00');
INSERT INTO public.satisfactions_survey VALUES ('098bae61-601a-473f-b704-56a43bab7428', 4, 'bom', '233e3709-4dc9-4d3c-abdd-a0f462bae2c8', '2025-10-22 13:45:00');
INSERT INTO public.satisfactions_survey VALUES ('c02bde5e-fb51-4292-81c9-9e97b0e2d60e', 4, 'bom', 'cc5ab77e-9a57-450b-9b4c-387efec9c418', '2025-10-22 14:30:00');
INSERT INTO public.satisfactions_survey VALUES ('008c154c-f541-438c-a22c-edbdac0f2725', 3, 'regular', '9b5ff3a9-ece9-4772-98e4-9e6577610fc7', '2025-10-22 15:15:00');
INSERT INTO public.satisfactions_survey VALUES ('7b6770c3-e452-4d52-a119-c292943ed692', 5, 'otimo', 'aeeaaa34-1ed1-4f5c-93d4-8feefc273972', '2025-10-22 15:30:00');
INSERT INTO public.satisfactions_survey VALUES ('1dce90bd-b253-4a54-a28f-d03c65a79716', 4, 'bom', '647516ad-96e3-4e84-a08a-78b93d962aa2', '2025-10-22 16:00:00');
INSERT INTO public.satisfactions_survey VALUES ('a2d4c77e-71ab-4ad1-a6e8-4e69cd5f8a9e', 1, 'pessimo', '0be23448-0343-49e8-bddb-c665d526b521', '2025-10-22 16:30:00');


--
-- TOC entry 3467 (class 0 OID 16505)
-- Dependencies: 224
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tables VALUES ('425004b2-dd5c-4261-8684-0ba7e014f73d', '1', 'open');
INSERT INTO public.tables VALUES ('fb00b835-58ba-4f7b-bd00-e1feadbd531e', '2', 'open');
INSERT INTO public.tables VALUES ('a3084620-0e7d-4175-b50f-3d4f43e5c072', '3', 'open');
INSERT INTO public.tables VALUES ('83408d47-e65e-464e-a8cf-bbb4413b12a1', '4', 'open');
INSERT INTO public.tables VALUES ('5b433ca1-5df2-4bd1-93d9-27d79e221cb4', '5', 'open');
INSERT INTO public.tables VALUES ('920adb85-921d-45d3-8532-37d16e1ee251', '6', 'open');
INSERT INTO public.tables VALUES ('d8a6294b-7b18-4245-bc19-1c287c883d45', '7', 'open');
INSERT INTO public.tables VALUES ('0a3bc4fb-5263-4b01-92a6-b5e7f1f9f01f', '8', 'open');
INSERT INTO public.tables VALUES ('f7ea6d09-47d1-488c-8ba3-65aa599e4bc2', '8', 'open');
INSERT INTO public.tables VALUES ('395203d1-6bd9-46e4-82ba-04d8ddfdb861', '10', 'open');
INSERT INTO public.tables VALUES ('8263c6bc-00b3-4a17-997b-381ec1812276', '11', 'open');
INSERT INTO public.tables VALUES ('b06f67bc-32c8-4943-abaa-e8498f217829', '12', 'open');


--
-- TOC entry 3461 (class 0 OID 16455)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES ('b98443db-a823-4818-83bd-50f3d3273645', 'Wendel', 'wendel@email.com', '$2b$08$gMorA0QJcgTPOrhAsDPoYecGtBWwmNyKS4KOszmTbbA4LGiNfOYI.', 'user', '2025-10-21 21:15:44.131', '2025-10-21 21:15:44.131');
INSERT INTO public.users VALUES ('d7f0acde-f325-4e3d-9945-60e70fd897e5', 'Anselmo José dos Santos', 'anselmo3.santos@gmail.com', '$2b$08$0P7KeCsMG.eEFD0a/ZIeu.DlzdyWmOx3Z5k3ij/lzGOjNCqSqER5e', 'user', '2025-10-23 13:12:11.404', '2025-10-23 15:06:06.676');


--
-- TOC entry 3466 (class 0 OID 16497)
-- Dependencies: 223
-- Data for Name: waiters; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.waiters VALUES ('50fe27c3-5130-423c-9d61-36b76be04bc4', 'Wendel Campos Aguiar', '11997281386', '2025-10-21 21:22:51.788');
INSERT INTO public.waiters VALUES ('ab9d8f3f-5db0-41da-8919-0010ae53713f', 'William Da Silva Costa', '1198765-4321', '2025-10-23 15:18:37.64');
INSERT INTO public.waiters VALUES ('328e46a9-b679-4417-a0f7-cfaecfb0f6e7', 'Carlos Jose Sacramento Teodoro', '1194567-1234', '2025-10-23 15:18:37.64');
INSERT INTO public.waiters VALUES ('c1e4af8f-8396-4cc3-b9ce-16a4468ac0f3', 'Gabriel Santos Oliveira', '1199876-5432', '2025-10-23 15:18:37.64');
INSERT INTO public.waiters VALUES ('0411373b-9d6c-4771-a9d9-cb797de05f9c', 'Ana Clara Ferreira Lima', '1191234-5678', '2025-10-23 15:18:37.64');
INSERT INTO public.waiters VALUES ('997e2af7-3a4f-4f9c-a17f-5f930bb9c089', 'Rafael Mendes Pontes', '1197654-3210', '2025-10-23 15:18:37.64');


--
-- TOC entry 3285 (class 2606 OID 16406)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 16496)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 16480)
-- Name: order_itens order_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_itens
    ADD CONSTRAINT order_itens_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 16472)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 16520)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 16488)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 16575)
-- Name: satisfactions_survey satisfactions_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.satisfactions_survey
    ADD CONSTRAINT satisfactions_survey_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 16513)
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 16463)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 16504)
-- Name: waiters waiters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.waiters
    ADD CONSTRAINT waiters_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 1259 OID 16530)
-- Name: customers_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX customers_email_key ON public.customers USING btree (email);


--
-- TOC entry 3302 (class 1259 OID 16531)
-- Name: payments_order_id_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX payments_order_id_key ON public.payments USING btree (order_id);


--
-- TOC entry 3305 (class 1259 OID 16576)
-- Name: satisfactions_survey_order_id_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX satisfactions_survey_order_id_key ON public.satisfactions_survey USING btree (order_id);


--
-- TOC entry 3286 (class 1259 OID 16529)
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- TOC entry 3311 (class 2606 OID 16548)
-- Name: order_itens order_itens_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_itens
    ADD CONSTRAINT order_itens_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3312 (class 2606 OID 16553)
-- Name: order_itens order_itens_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_itens
    ADD CONSTRAINT order_itens_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3308 (class 2606 OID 16533)
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3309 (class 2606 OID 16543)
-- Name: orders orders_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3310 (class 2606 OID 16538)
-- Name: orders orders_waiter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_waiter_id_fkey FOREIGN KEY (waiter_id) REFERENCES public.waiters(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3313 (class 2606 OID 16558)
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3314 (class 2606 OID 16577)
-- Name: satisfactions_survey satisfactions_survey_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.satisfactions_survey
    ADD CONSTRAINT satisfactions_survey_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2025-11-04 20:38:06

--
-- PostgreSQL database dump complete
--

\unrestrict hH41eY94sMne0TwNI8Vc2iNAwxzMWamdlt0xxtC2fXv43SVLSuHmdZ73B2o3Y18

