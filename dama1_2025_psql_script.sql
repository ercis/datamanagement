--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Ubuntu 17.2-1.pgdg24.04+1)

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
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id text NOT NULL,
    company_name text NOT NULL,
    contact_person text,
    contact_person_position text,
    street text NOT NULL,
    city text NOT NULL,
    region text,
    plz text NOT NULL,
    country text NOT NULL,
    phone text,
    fax text
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    last_name text NOT NULL,
    first_name text NOT NULL,
    "position" text NOT NULL,
    salutation text,
    birthday date NOT NULL,
    employed_since date NOT NULL,
    street text,
    city text,
    region text,
    plz text,
    country text,
    phone_private text,
    phone_work_internal text,
    photo text,
    comments text,
    superior integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    unit_price numeric NOT NULL,
    quantity integer NOT NULL,
    discount numeric NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id text NOT NULL,
    employee_id integer,
    order_date timestamp without time zone NOT NULL,
    delivery_date timestamp without time zone,
    shipping_date timestamp without time zone,
    shipping_with integer,
    shipping_costs numeric,
    recipient text,
    street text,
    city text,
    region text,
    plz text,
    country text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    name text,
    supplier_id integer NOT NULL,
    category_id integer NOT NULL,
    delivery_units text,
    unit_price numeric,
    stock integer,
    ordered_units integer,
    minimum_stock integer,
    discontinued boolean NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: shipping_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_company (
    company_id integer NOT NULL,
    name text NOT NULL,
    phone text
);


ALTER TABLE public.shipping_company OWNER TO postgres;

--
-- Name: shipping_company_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_company_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_company_company_id_seq OWNER TO postgres;

--
-- Name: shipping_company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_company_company_id_seq OWNED BY public.shipping_company.company_id;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_person text,
    contact_person_position text,
    street text NOT NULL,
    city text NOT NULL,
    region text,
    plz text NOT NULL,
    country text NOT NULL,
    phone text NOT NULL,
    fax text,
    homepage text
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_supplier_id_seq OWNER TO postgres;

--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: shipping_company company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_company ALTER COLUMN company_id SET DEFAULT nextval('public.shipping_company_company_id_seq'::regclass);


--
-- Name: supplier supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_supplier_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, name, description) FROM stdin;
1	Getränke	Alkoholfreie Getränke, Kaffee, Tee, Bier
2	Gewürze	Süße und saure Soßen, Gewürze
3	Süßwaren	Desserts und Süßigkeiten
4	Milchprodukte	Käsesorten
5	Getreideprodukte	Brot, Kräcker, Nudeln, Müsli
6	Fleischprodukte	Fleisch-Fertiggerichte
7	Naturprodukte	Getrocknete Früchte, Tofu usw.
8	Meeresfrüchte	Meerespflanzen und -früchte, Fisch
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, company_name, contact_person, contact_person_position, street, city, region, plz, country, phone, fax) FROM stdin;
ALFKI	Alfreds Futterkiste	Maria Anders	Vertriebsmitarbeiterin	Obere Str. 57	Berlin	\N	12209	Deutschland	030-0074321	030-0076545
ANATR	Ana Trujillo Emparedados y helados	Ana Trujillo	Inhaberin	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexiko	(5) 555-4729	(5) 555-3745
ANTON	Antonio Moreno Taquería	Antonio Moreno	Inhaber	Mataderos  2312	México D.F.	\N	05023	Mexiko	(5) 555-3932	\N
AROUT	Around the Horn	Thomas Hardy	Vertriebsmitarbeiter	120 Hanover Sq.	London	\N	WA1 1DP	Großbritannien	(71) 555-7788	(71) 555-6750
BERGS	Berglunds snabbköp	Christina Berglund	Einkaufsleitung	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden	0921-12 34 65	0921-12 34 67
BLAUS	Blauer See Delikatessen	Hanna Moos	Vertriebsmitarbeiterin	Forsterstr. 57	Mannheim	\N	68306	Deutschland	0621-08460	0621-08924
BLONP	Blondel père et fils	Frédérique Citeaux	Marketingmanager	24, place Kléber	Strasbourg	\N	67000	Frankreich	88.60.15.31	88.60.15.32
BOLID	Bólido Comidas preparadas	Martín Sommer	Inhaber	C/ Araquil, 67	Madrid	\N	28023	Spanien	(91) 555 22 82	(91) 555 91 99
BONAP	Bon app'	Laurence Lebihan	Inhaber	12, rue des Bouchers	Marseille	\N	13008	Frankreich	91.24.45.40	91.24.45.41
BOTTM	Bottom-Dollar Markets	Elizabeth Lincoln	Buchhalterin	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada	(604) 555-4729	(604) 555-3745
BSBEV	B's Beverages	Victoria Ashworth	Vertriebsmitarbeiterin	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien	(71) 555-1212	\N
CACTU	Cactus Comidas para llevar	Patricio Simpson	Vertriebsagent	Cerrito 333	Buenos Aires	\N	1010	Argentinien	(1) 135-5555	(1) 135-4892
CENTC	Centro comercial Moctezuma	Francisco Chang	Marketingmanager	Sierras de Granada 9993	México D.F.	\N	05022	Mexiko	(5) 555-3392	(5) 555-7293
CHOPS	Chop-suey Chinese	Yang Wang	Inhaber	Hauptstr. 29	Bern	\N	3012	Schweiz	0452-076545	\N
COMMI	Comércio Mineiro	Pedro Afonso	Vertriebsassistent	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brasilien	(11) 555-7647	\N
CONSH	Consolidated Holdings	Elizabeth Brown	Vertriebsmitarbeiterin	Berkeley Gardens\\r\\n12  Brewery 	London	\N	WX1 6LT	Großbritannien	(71) 555-2282	(71) 555-9199
DRACD	Drachenblut Delikatessen	Sven Ottlieb	Einkaufsleitung	Walserweg 21	Aachen	\N	52066	Deutschland	0241-039123	0241-059428
DUMON	Du monde entier	Janine Labrune	Inhaberin	67, rue des Cinquante Otages	Nantes	\N	44000	Frankreich	40.67.88.88	40.67.89.89
EASTC	Eastern Connection	Ann Devon	Vertriebsagent	35 King George	London	\N	WX3 6FW	Großbritannien	(71) 555-0297	(71) 555-3373
ERNSH	Ernst Handel	Roland Mendel	Vertriebsmanager	Kirchgasse 6	Graz	\N	8010	Österreich	7675-3425	7675-3426
FAMIA	Familia Arquibaldo	Aria Cruz	Marketingassistentin	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien	(11) 555-9857	\N
FISSA	FISSA Fabrica Inter. Salchichas S.A.	Diego Roel	Buchhalter	C/ Moralzarzal, 86	Madrid	\N	28034	Spanien	(91) 555 94 44	(91) 555 55 93
FOLIG	Folies gourmandes	Martine Rancé	Vertriebsagentassistent	184, chaussée de Tournai	Lille	\N	59000	Frankreich	20.16.10.16	20.16.10.17
FOLKO	Folk och fä HB	Maria Larsson	Inhaberin	Åkergatan 24	Bräcke	\N	S-844 67	Schweden	0695-34 67 21	\N
FRANK	Frankenversand	Peter Franken	Marketingmanager	Berliner Platz 43	München	\N	80805	Deutschland	089-0877310	089-0877451
FRANR	France restauration	Carine Schmitt	Marketingmanager	54, rue Royale	Nantes	\N	44000	Frankreich	40.32.21.21	40.32.21.20
FRANS	Franchi S.p.A.	Paolo Accorti	Vertriebsmitarbeiterin	Via Monte Bianco 34	Torino	\N	10100	Italien	011-4988260	011-4988261
FURIB	Furia Bacalhau e Frutos do Mar	Lino Rodriguez 	Vertriebsmanager	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal	(1) 354-2534	(1) 354-2535
GALED	Galería del gastrónomo	Eduardo Saavedra	Marketingmanager	Rambla de Cataluña, 23	Barcelona	\N	08022	Spanien	(93) 203 4560	(93) 203 4561
GODOS	Godos Cocina Típica	José Pedro Freyre	Vertriebsmanager	C/ Romero, 33	Sevilla	\N	41101	Spanien	(95) 555 82 82	\N
GOURL	Gourmet Lanchonetes	André Fonseca	Vertriebsassistent	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien	(11) 555-9482	\N
GREAL	Great Lakes Food Market	Howard Snyder	Marketingmanager	2732 Baker Blvd.	Eugene	OR	97403	USA	(503) 555-7555	\N
GROSR	GROSELLA-Restaurante	Manuel Pereira	Inhaber	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela	(2) 283-2951	(2) 283-3397
HANAR	Hanari Carnes	Mario Pontes	Buchhalter	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien	(21) 555-0091	(21) 555-8765
HILAA	HILARIÓN-Abastos	Carlos Hernández	Vertriebsmitarbeiter	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela	(5) 555-1340	(5) 555-1948
HUNGC	Hungry Coyote Import Store	Yoshi Latimer	Vertriebsmitarbeiter	City Center Plaza\\r\\n516 Main St.	Elgin	OR	97827	USA	(503) 555-6874	(503) 555-2376
HUNGO	Hungry Owl All-Night Grocers	Patricia McKenna	Vertriebsassistentin	8 Johnstown Road	Cork	Co. Cork	VZ6 78	Irland	2967 542	2967 3333
ISLAT	Island Trading	Helen Bennett	Marketingmanager	Garden House\\r\\nCrowther Way	Hedge End	Lancashire	LA9 PX8	Großbritannien	(24) 555-8888	\N
KOENE	Königlich Essen	Philip Cramer	Vertriebsassistent	Maubelstr. 90	Brandenburg	\N	14776	Deutschland	0555-09876	\N
LACOR	La corne d'abondance	Daniel Tonini	Vertriebsmitarbeiter	67, avenue de l'Europe	Versailles	\N	78000	Frankreich	30.59.84.10	30.59.85.11
LAMAI	La maison d'Asie	Annette Roulet	Vertriebsmanager	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich	61.77.61.10	61.77.61.11
LAUGB	Laughing Bacchus Wine Cellars	Yoshi Tannamuri	Marketingassistent	1900 Oak St.	Vancouver	BC	V3F 2K1	Kanada	(604) 555-3392	(604) 555-7293
LAZYK	Lazy K Kountry Store	John Steel	Marketingmanager	12 Orchestra Terrace	Walla Walla	WA	99362	USA	(509) 555-7969	(509) 555-6221
LEHMS	Lehmanns Marktstand	Renate Messner	Vertriebsmitarbeiterin	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland	069-0245984	069-0245874
LETSS	Let's Stop N Shop	Jaime Yorres	Inhaber	87 Polk St.\\r\\nSuite 5	San Francisco	CA	94117	USA	(415) 555-5938	\N
LILAS	LILA-Supermercado	Carlos González	Buchhalter	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela	(9) 331-6954	(9) 331-7256
LINOD	LINO-Delicateses	Felipe Izquierdo	Inhaber	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela	(8) 34-56-12	(8) 34-93-93
LONEP	Lonesome Pine Restaurant	Fran Wilson	Vertriebsmanager	89 Chiaroscuro Rd.	Portland	OR	97219	USA	(503) 555-9573	(503) 555-9646
MAGAA	Magazzini Alimentari Riuniti	Giovanni Rovelli	Marketingmanager	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien	035-640230	035-640231
MAISD	Maison Dewey	Catherine Dewey	Vertriebsagent	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien	(02) 201 24 67	(02) 201 24 68
MEREP	Mère Paillarde	Jean Fresnière	Marketingassistent	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada	(514) 555-8054	(514) 555-8055
MORGK	Morgenstern Gesundkost	Alexander Feuer	Marketingassistent	Heerstr. 22	Leipzig	\N	04179	Deutschland	0342-023176	\N
NORTS	North/South	Simon Crowther	Vertriebsassistent	South House\\r\\n300 Queensbridge	London	\N	SW7 1RZ	Großbritannien	(71) 555-7733	(71) 555-2530
OCEAN	Océano Atlántico Ltda.	Yvonne Moncada	Vertriebsagentin	Ing. Gustavo Moncada 8585\\r\\nPiso 20-A	Buenos Aires	\N	1010	Argentinien	(1) 135-5333	(1) 135-5535
OLDWO	Old World Delicatessen	Rene Phillips	Vertriebsmitarbeiter	2743 Bering St.	Anchorage	AK	99508	USA	(907) 555-7584	(907) 555-2880
OTTIK	Ottilies Käseladen	Henriette Pfalzheim	Inhaberin	Mehrheimerstr. 369	Köln	\N	50739	Deutschland	0221-0644327	0221-0765721
PARIS	Paris spécialités 	Marie Bertrand	Inhaberin	265, boulevard Charonne	Paris	\N	75012	Frankreich	(1) 42.34.22.66	(1) 42.34.22.77
PERIC	Pericles Comidas clásicas	Guillermo Fernández	Vertriebsmitarbeiter	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexiko	(5) 552-3745	(5) 545-3745
PICCO	Piccolo und mehr	Georg Pipps	Vertriebsmanager	Geislweg 14	Salzburg	\N	5020	Österreich	6562-9722	6562-9723
PRINI	Princesa Isabel Vinhos	Isabel de Castro	Vertriebsmitarbeiterin	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal	(1) 356-5634	\N
QUEDE	Que Delícia	Bernardo Batista	Buchhalter	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien	(21) 555-4252	(21) 555-4545
QUEEN	Queen Cozinha	Lúcia Carvalho	Marketingassistentin	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien	(11) 555-1189	\N
QUICK	QUICK-Stop	Horst Kloss	Buchhalter	Taucherstraße 10	Cunewalde	\N	01307	Deutschland	0372-035188	\N
RANCH	Rancho grande	Sergio Gutiérrez	Vertriebsmitarbeiter	Av. del Libertador 900	Buenos Aires	\N	1010	Argentinien	(1) 123-5555	(1) 123-5556
RATTC	Rattlesnake Canyon Grocery	Paula Wilson	Vertriebsassistentin	2817 Milton Dr.	Albuquerque	NM	87110	USA	(505) 555-5939	(505) 555-3620
REGGC	Reggiani Caseifici	Maurizio Moroni	Vertriebsassistent	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien	0522-556721	0522-556722
RICAR	Ricardo Adocicados	Janete Limeira	Vertriebsagentassistentin	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien	(21) 555-3412	\N
RICSU	Richter Supermarkt	Michael Holz	Vertriebsmanager	Grenzacherweg 237	Genève	\N	1203	Schweiz	0897-034214	\N
ROMEY	Romero y tomillo	Alejandra Camino	Buchhalterin	Gran Vía, 1	Madrid	\N	28001	Spanien	(91) 745 6200	(91) 745 6210
SANTG	Santé Gourmet	Jonas Bergulfsen	Inhaber	Erling Skakkes gate 78	Stavern	\N	4110	Norwegen	07-98 92 35	07-98 92 47
SAVEA	Save-a-lot Markets	Jose Pavarotti	Vertriebsmitarbeiter	187 Suffolk Ln.	Boise	ID	83720	USA	(208) 555-8097	\N
SEVES	Seven Seas Imports	Hari Kumar	Vertriebsmanager	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien	(71) 555-1717	(71) 555-5646
SIMOB	Simons bistro	Jytte Petersen	Inhaberin	Vinbæltet 34	København	\N	1734	Dänemark	31 12 34 56	31 13 35 57
SPECD	Spécialités du monde	Dominique Perrier	Marketingmanager	25, rue Lauriston	Paris	\N	75016	Frankreich	(1) 47.55.60.10	(1) 47.55.60.20
SPLIR	Split Rail Beer & Ale	Art Braunschweiger	Vertriebsmanager	P.O. Box 555	Lander	WY	82520	USA	(307) 555-4680	(307) 555-6525
SUPRD	Suprêmes délices	Pascale Cartrain	Buchhalterin	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien	(071) 23 67 22 20	(071) 23 67 22 21
THEBI	The Big Cheese	Liz Nixon	Marketingmanager	89 Jefferson Way\\r\\nSuite 2	Portland	OR	97201	USA	(503) 555-3612	\N
THECR	The Cracker Box	Liu Wong	Marketingassistent	55 Grizzly Peak Rd.	Butte	MT	59801	USA	(406) 555-5834	(406) 555-8083
TOMSP	Toms Spezialitäten	Karin Josephs	Marketingmanager	Luisenstr. 48	Münster	\N	44087	Deutschland	0251-031259	0251-035695
TORTU	Tortuga Restaurante	Miguel Angel Paolino	Inhaber	Avda. Azteca 123	México D.F.	\N	05033	Mexiko	(5) 555-2933	\N
TRADH	Tradição Hipermercados	Anabela Domingues	Vertriebsmitarbeiterin	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brasilien	(11) 555-2167	(11) 555-2168
TRAIH	Trail's Head Gourmet Provisioners	Helvetius Nagy	Vertriebsassistent	722 DaVinci Blvd.	Kirkland	WA	98034	USA	(206) 555-8257	(206) 555-2174
VAFFE	Vaffeljernet	Palle Ibsen	Vertriebsmanager	Smagsløget 45	Århus	\N	8200	Dänemark	86 21 32 43	86 22 33 44
VICTE	Victuailles en stock	Mary Saveley	Vertriebsagent	2, rue du Commerce	Lyon	\N	69004	Frankreich	78.32.54.86	78.32.54.87
VINET	Vins et alcools Chevalier	Paul Henriot	Buchhalter	59 rue de l'Abbaye	Reims	\N	51100	Frankreich	26.47.15.10	26.47.15.11
WANDK	Die Wandernde Kuh	Rita Müller	Vertriebsmitarbeiterin	Adenauerallee 900	Stuttgart	\N	70563	Deutschland	0711-020361	0711-035428
WARTH	Wartian Herkku	Pirkko Koskitalo	Buchhalterin	Torikatu 38	Oulu	\N	90110	Finnland	981-443655	981-443655
WELLI	Wellington Importadora	Paula Parente	Vertriebsmanager	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien	(14) 555-8122	\N
WHITC	White Clover Markets	Karl Jablonski	Inhaber	305 - 14th Ave. S.\\r\\nSuite 3B	Seattle	WA	98128	USA	(206) 555-4112	(206) 555-4115
WILMK	Wilman Kala	Matti Karttunen	Inhaber/Marketingassistent	Keskuskatu 45	Helsinki	\N	21240	Finnland	90-224 8858	90-224 8858
WOLZA	Wolski  Zajazd	Zbyszek Piestrzeniewicz	Inhaber	ul. Filtrowa 68	Warszawa	\N	01-012	Polen	(26) 642-7012	(26) 642-7012
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, last_name, first_name, "position", salutation, birthday, employed_since, street, city, region, plz, country, phone_private, phone_work_internal, photo, comments, superior) FROM stdin;
1	Davolio	Nancy	Vertriebsmitarbeiterin	Frau	1968-12-08	1992-05-01	507 - 20th Ave. E.\\r\\nApt. 2A	Seattle	WA	98122	USA	(206) 555-9857	5467	EmpID1.bmp	Studium mit Abschluß BA in Psychologie an der Colorado State University. Kurs \\"The Art of the Cold Call.\\"  Mitglied des Clubs \\"Toastmasters International\\".	2
2	Fuller	Andrew	Geschäftsführer	Herr	1952-02-19	1992-08-14	908 W. Capital Way	Tacoma	WA	98401	USA	(206) 555-9482	3457	EmpID2.bmp	Studium der Betriebswirtschaft an der University of Dallas; Doktorarbeit über Internationales Marketing. Andrew spricht fließend Französisch und Italienisch. Er versteht Deutsch und liest deutsche Zeitungen und Zeitschriften. Eintritt in die Firma als Verkaufsrepräsentant, später Verkaufsleiter, jetzt Geschäftsführer. Mitglied des Sales Management Roundtable und des Verbandes \\"Pacific Rim Importers\\".	8
3	Leverling	Janet	Vertriebsmitarbeiterin	Frau	1963-08-30	1992-04-01	722 Moss Bay Blvd.	Kirkland	WA	98033	USA	(206) 555-3412	3355	EmpID3.bmp	Studium mit Abschluß BS in Chemie vom Boston College. Sie hat dort außerdem an dem Kurs \\"Betriebsführung und -organisation im Lebensmittel-Einzelhandel\\" teilgenommen. Eintritt in die Firma als Verkaufsassistentin. Sie wurde zur Verkaufsrepräsentantin befördert.	8
4	Peacock	Margaret	Vertriebsmitarbeiterin	Frau	1958-09-19	1993-05-03	4110 Old Redmond Rd.	Redmond	WA	98052	USA	(206) 555-8122	5176	EmpID4.bmp	Studium der Englischen Literatur am Concordia College mit Abschluß BA. Studium am American Institute of Culinary Arts mit Abschluß MA. Margaret arbeitete temporär in der Londoner Abteilung bevor sie nach Seattle kam.	\N
5	Buchanan	Steven	Vertriebsmanager	Herr	1955-03-04	1993-10-17	14 Garrett Hill	London	\N	SW1 8JR	UK	(71) 555-4848	3453	EmpID5.bmp	Studium an der St. Andrews University, Scotland, mit Abschluß BSC. Eintritt in die Firma als Verkaufsrepräsentant. Steven nahm an einem Orientierungskurs in der Seattle Abteilung teil und kehrte dann auf seinen Posten im Londoner Büro zurück, wo er zum Verkaufsleiter befördert wurde. Steven Buchanan hat an mehreren Weiterbildungskursen teilgenommen, darunter \\"Erfolgreiches Telemarketing\\" und \\"Internationales Verkaufsmanagement\\". Er spricht fließend Französisch.	\N
6	Suyama	Michael	Vertriebsmitarbeiter	Herr	1963-07-02	1993-10-17	Coventry House\\r\\nMiner Rd.	London	\N	EC2 7JR	UK	(71) 555-7773	428	EmpID6.bmp	Abschlüsse: MA in Wirtschaft (Sussex University) und MBA in Marketing (University of California at Los Angeles). Weiterbildungskurse: Internationale Verkaufsstrategien sowie Zeit-Management für professionelle Verkaufspersonen. Er spricht fließend Japanisch und liest französische, portugiesische und spanische Fachliteratur, Zeitungen und Zeitschriften.	\N
7	King	Robert	Vertriebsmitarbeiter	Dr.	1960-05-29	1994-01-02	Edgeham Hollow\\r\\nWinchester Way	London	\N	RG1 9SP	UK	(71) 555-5598	465	EmpID7.bmp	Englischstudium an der University of Michigan.  Vorher war Robert King ein Mitglied der amerikanischen Hilfsorganisation \\"Peace Corps\\". Dann Eintritt in die Firma. Nach Teilnahme am Kurs: \\"Selling in Europe\\",  Versetzung in die Londoner Abteilung.	\N
8	Callahan	Laura	Vertriebskoordinatorin	Frau	1958-01-09	1994-03-05	4726 - 11th Ave. N.E.	Seattle	WA	98105	USA	(206) 555-1189	2344	EmpID8.bmp	Studium mit Abschluß BA in Psychologie an der University of Washington. Kurs: Geschäftsfranzösisch. Laura liest französische Zeitschriften und Zeitungen.	\N
9	Dodsworth	Anne	Vertriebsmitarbeiterin	Frau	1969-07-02	1994-11-15	7 Houndstooth Rd.	London	\N	WG2 7LT	UK	(71) 555-4444	452	EmpID9.bmp	Studienabschluß am St. Lawrence College mit BA. Sie spricht fließend Französisch und Deutsch.	\N
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (order_id, product_id, unit_price, quantity, discount) FROM stdin;
10248	11	7.0000	12	0.00
10248	42	4.9000	10	0.00
10248	72	12.1500	5	0.00
10249	14	9.3000	9	0.00
10249	51	21.2000	40	0.00
10250	41	3.8500	10	0.00
10250	51	21.2000	35	0.15
10250	65	8.4000	15	0.15
10251	22	8.4000	6	0.05
10251	57	7.8000	15	0.05
10251	65	8.4000	20	0.00
10252	20	32.4000	40	0.05
10252	33	1.0000	25	0.05
10252	60	13.6000	40	0.00
10253	31	5.0000	20	0.00
10253	39	7.2000	42	0.00
10253	49	8.0000	40	0.00
10254	24	1.8000	15	0.15
10254	55	9.6000	21	0.15
10254	74	4.0000	21	0.00
10255	2	7.6000	20	0.00
10255	16	6.9500	35	0.00
10255	36	7.6000	25	0.00
10255	59	22.0000	30	0.00
10256	53	13.1000	15	0.00
10256	77	5.2000	12	0.00
10257	27	17.5500	25	0.00
10257	39	7.2000	6	0.00
10257	77	5.2000	15	0.00
10258	2	7.6000	50	0.20
10258	5	8.5000	65	0.20
10258	32	12.8000	6	0.20
10259	21	4.0000	10	0.00
10259	37	10.4000	1	0.00
10260	41	3.8500	16	0.25
10260	57	7.8000	50	0.00
10260	62	19.7000	15	0.25
10260	70	6.0000	21	0.25
10261	21	4.0000	20	0.00
10261	35	7.2000	20	0.00
10262	5	8.5000	12	0.20
10262	7	12.0000	15	0.00
10262	56	15.2000	2	0.00
10263	16	6.9500	60	0.25
10263	24	1.8000	28	0.00
10263	30	10.3500	60	0.25
10263	74	4.0000	36	0.25
10264	2	7.6000	35	0.00
10264	41	3.8500	25	0.15
10265	17	15.6000	30	0.00
10265	70	6.0000	20	0.00
10266	12	15.2000	12	0.05
10267	40	7.3500	50	0.00
10267	59	22.0000	70	0.15
10267	76	7.2000	15	0.15
10268	29	49.5000	10	0.00
10268	72	13.9000	4	0.00
10269	33	1.0000	60	0.05
10269	72	13.9000	20	0.05
10270	36	7.6000	30	0.00
10270	43	18.4000	25	0.00
10271	33	1.0000	24	0.00
10272	20	32.4000	6	0.00
10272	31	5.0000	40	0.00
10272	72	13.9000	24	0.00
10273	10	12.4000	24	0.05
10273	31	5.0000	15	0.05
10273	33	1.0000	20	0.00
10273	40	7.3500	60	0.05
10273	76	7.2000	33	0.05
10274	71	8.6000	20	0.00
10274	72	13.9000	7	0.00
10275	24	1.8000	12	0.05
10275	59	22.0000	6	0.05
10276	10	12.4000	15	0.00
10276	13	2.4000	10	0.00
10277	28	18.2000	20	0.00
10277	62	19.7000	12	0.00
10278	44	7.7500	16	0.00
10278	59	22.0000	15	0.00
10278	63	17.5500	8	0.00
10278	73	6.0000	25	0.00
10279	17	15.6000	15	0.25
10280	24	1.8000	12	0.00
10280	55	9.6000	20	0.00
10280	75	3.1000	30	0.00
10281	19	3.6500	1	0.00
10281	24	1.8000	6	0.00
10281	35	7.2000	4	0.00
10282	30	10.3500	6	0.00
10282	57	7.8000	2	0.00
10283	15	6.2000	20	0.00
10283	19	3.6500	18	0.00
10283	60	13.6000	35	0.00
10283	72	13.9000	3	0.00
10284	27	17.5500	15	0.25
10284	44	7.7500	21	0.00
10284	60	13.6000	20	0.25
10284	67	5.6000	5	0.25
10285	1	7.2000	45	0.20
10285	40	7.3500	40	0.20
10285	53	13.1000	36	0.20
10286	35	7.2000	100	0.00
10286	62	19.7000	40	0.00
10287	16	6.9500	40	0.15
10287	34	5.6000	20	0.00
10287	46	4.8000	15	0.15
10288	54	2.9500	10	0.10
10288	68	5.0000	3	0.10
10289	3	4.0000	30	0.00
10289	64	13.3000	9	0.00
10290	5	8.5000	20	0.00
10290	29	49.5000	15	0.00
10290	49	8.0000	15	0.00
10290	77	5.2000	10	0.00
10291	13	2.4000	20	0.10
10291	44	7.7500	24	0.10
10291	51	21.2000	2	0.10
10292	20	32.4000	20	0.00
10293	18	25.0000	12	0.00
10293	24	1.8000	10	0.00
10293	63	17.5500	5	0.00
10293	75	3.1000	6	0.00
10294	1	7.2000	18	0.00
10294	17	15.6000	15	0.00
10294	43	18.4000	15	0.00
10294	60	13.6000	21	0.00
10294	75	3.1000	6	0.00
10295	56	15.2000	4	0.00
10296	11	8.4000	12	0.00
10296	16	6.9500	30	0.00
10296	69	14.4000	15	0.00
10297	39	7.2000	60	0.00
10297	72	13.9000	20	0.00
10298	2	7.6000	40	0.00
10298	36	7.6000	40	0.25
10298	59	22.0000	30	0.25
10298	62	19.7000	15	0.00
10299	19	3.6500	15	0.00
10299	70	6.0000	20	0.00
10300	66	6.8000	30	0.00
10300	68	5.0000	20	0.00
10301	40	7.3500	10	0.00
10301	56	15.2000	20	0.00
10302	17	15.6000	40	0.00
10302	28	18.2000	28	0.00
10302	43	18.4000	12	0.00
10303	40	7.3500	40	0.10
10303	65	8.4000	30	0.10
10303	68	5.0000	15	0.10
10304	49	8.0000	30	0.00
10304	59	22.0000	10	0.00
10304	71	8.6000	2	0.00
10305	18	25.0000	25	0.10
10305	29	49.5000	25	0.10
10305	39	7.2000	30	0.10
10306	30	10.3500	10	0.00
10306	53	13.1000	10	0.00
10306	54	2.9500	5	0.00
10307	62	19.7000	10	0.00
10307	68	5.0000	3	0.00
10308	69	14.4000	1	0.00
10308	70	6.0000	5	0.00
10309	4	8.8000	20	0.00
10309	6	10.0000	30	0.00
10309	42	5.6000	2	0.00
10309	43	18.4000	20	0.00
10309	71	8.6000	3	0.00
10310	16	6.9500	10	0.00
10310	62	19.7000	5	0.00
10311	42	5.6000	6	0.00
10311	69	14.4000	7	0.00
10312	28	18.2000	4	0.00
10312	43	18.4000	24	0.00
10312	53	13.1000	20	0.00
10312	75	3.1000	10	0.00
10313	36	7.6000	12	0.00
10314	32	12.8000	40	0.10
10314	58	5.3000	30	0.10
10314	62	19.7000	25	0.10
10315	34	5.6000	14	0.00
10315	70	6.0000	30	0.00
10316	41	3.8500	10	0.00
10316	62	19.7000	70	0.00
10317	1	7.2000	20	0.00
10318	41	3.8500	20	0.00
10318	76	7.2000	6	0.00
10319	17	15.6000	8	0.00
10319	28	18.2000	14	0.00
10319	76	7.2000	30	0.00
10320	71	8.6000	30	0.00
10321	35	7.2000	10	0.00
10322	52	2.8000	20	0.00
10323	15	6.2000	5	0.00
10323	25	5.6000	4	0.00
10323	39	7.2000	4	0.00
10324	16	6.9500	21	0.15
10324	35	7.2000	70	0.15
10324	46	4.8000	30	0.00
10324	59	22.0000	40	0.15
10324	63	17.5500	80	0.15
10325	6	10.0000	6	0.00
10325	13	2.4000	12	0.00
10325	14	9.3000	9	0.00
10325	31	5.0000	4	0.00
10325	72	13.9000	40	0.00
10326	4	8.8000	24	0.00
10326	57	7.8000	16	0.00
10326	75	3.1000	50	0.00
10327	2	7.6000	25	0.20
10327	11	8.4000	50	0.20
10327	30	10.3500	35	0.20
10327	58	5.3000	30	0.20
10328	59	22.0000	9	0.00
10328	65	8.4000	40	0.00
10328	68	5.0000	10	0.00
10329	19	3.6500	10	0.05
10329	30	10.3500	8	0.05
10329	38	105.4000	20	0.05
10329	56	15.2000	12	0.05
10330	26	12.4500	50	0.15
10330	72	13.9000	25	0.15
10331	54	2.9500	15	0.00
10332	18	25.0000	40	0.20
10332	42	5.6000	10	0.20
10332	47	3.8000	16	0.20
10333	14	9.3000	10	0.00
10333	21	4.0000	10	0.10
10333	71	8.6000	40	0.10
10334	52	2.8000	8	0.00
10334	68	5.0000	10	0.00
10335	2	7.6000	7	0.20
10335	31	5.0000	25	0.20
10335	32	12.8000	6	0.20
10335	51	21.2000	48	0.20
10336	4	8.8000	18	0.10
10337	23	3.6000	40	0.00
10337	26	12.4500	24	0.00
10337	36	7.6000	20	0.00
10337	37	10.4000	28	0.00
10337	72	13.9000	25	0.00
10338	17	15.6000	20	0.00
10338	30	10.3500	15	0.00
10339	4	8.8000	10	0.00
10339	17	15.6000	70	0.05
10339	62	19.7000	28	0.00
10340	18	25.0000	20	0.05
10340	41	3.8500	12	0.05
10340	43	18.4000	40	0.05
10341	33	1.0000	8	0.00
10341	59	22.0000	9	0.15
10342	2	7.6000	24	0.20
10342	31	5.0000	56	0.20
10342	36	7.6000	40	0.20
10342	55	9.6000	40	0.20
10343	64	13.3000	50	0.00
10343	68	5.0000	4	0.05
10343	76	7.2000	15	0.00
10344	4	8.8000	35	0.00
10344	8	16.0000	70	0.25
10345	8	16.0000	70	0.00
10345	19	3.6500	80	0.00
10345	42	5.6000	9	0.00
10346	17	15.6000	36	0.10
10346	56	15.2000	20	0.00
10347	25	5.6000	10	0.00
10347	39	7.2000	50	0.15
10347	40	7.3500	4	0.00
10347	75	3.1000	6	0.15
10348	1	7.2000	15	0.15
10348	23	3.6000	25	0.00
10349	54	2.9500	24	0.00
10350	50	6.5000	15	0.10
10350	69	14.4000	18	0.10
10351	38	105.4000	20	0.05
10351	41	3.8500	13	0.00
10351	44	7.7500	77	0.05
10351	65	8.4000	10	0.05
10352	24	1.8000	10	0.00
10352	54	2.9500	20	0.15
10353	11	8.4000	12	0.20
10353	38	105.4000	50	0.20
10354	1	7.2000	12	0.00
10354	29	49.5000	4	0.00
10355	24	1.8000	25	0.00
10355	57	7.8000	25	0.00
10356	31	5.0000	30	0.00
10356	55	9.6000	12	0.00
10356	69	14.4000	20	0.00
10357	10	12.4000	30	0.20
10357	26	12.4500	16	0.00
10357	60	13.6000	8	0.20
10358	24	1.8000	10	0.05
10358	34	5.6000	10	0.05
10358	36	7.6000	20	0.05
10359	16	6.9500	56	0.05
10359	31	5.0000	70	0.05
10359	60	13.6000	80	0.05
10360	28	18.2000	30	0.00
10360	29	49.5000	35	0.00
10360	38	105.4000	10	0.00
10360	49	8.0000	35	0.00
10360	54	2.9500	28	0.00
10361	39	7.2000	54	0.10
10361	60	13.6000	55	0.10
10362	25	5.6000	50	0.00
10362	51	21.2000	20	0.00
10362	54	2.9500	24	0.00
10363	31	5.0000	20	0.00
10363	75	3.1000	12	0.00
10363	76	7.2000	12	0.00
10364	69	14.4000	30	0.00
10364	71	8.6000	5	0.00
10365	11	8.4000	24	0.00
10366	65	8.4000	5	0.00
10366	77	5.2000	5	0.00
10367	34	5.6000	36	0.00
10367	54	2.9500	18	0.00
10367	65	8.4000	15	0.00
10367	77	5.2000	7	0.00
10368	21	4.0000	5	0.10
10368	28	18.2000	13	0.10
10368	57	7.8000	25	0.00
10368	64	13.3000	35	0.10
10369	29	49.5000	20	0.00
10369	56	15.2000	18	0.25
10370	1	7.2000	15	0.15
10370	64	13.3000	30	0.00
10370	74	4.0000	20	0.15
10371	36	7.6000	6	0.20
10372	20	32.4000	12	0.25
10372	38	105.4000	40	0.25
10372	60	13.6000	70	0.25
10372	72	13.9000	42	0.25
10373	58	5.3000	80	0.20
10373	71	8.6000	50	0.20
10374	31	5.0000	30	0.00
10374	58	5.3000	15	0.00
10375	14	9.3000	15	0.00
10375	54	2.9500	10	0.00
10376	31	5.0000	42	0.05
10377	28	18.2000	20	0.15
10377	39	7.2000	20	0.15
10378	71	8.6000	6	0.00
10379	41	3.8500	8	0.10
10379	63	17.5500	16	0.10
10379	65	8.4000	20	0.10
10380	30	10.3500	18	0.10
10380	53	13.1000	20	0.10
10380	60	13.6000	6	0.10
10380	70	6.0000	30	0.00
10381	74	4.0000	14	0.00
10382	5	8.5000	32	0.00
10382	18	25.0000	9	0.00
10382	29	49.5000	14	0.00
10382	33	1.0000	60	0.00
10382	74	4.0000	50	0.00
10383	13	2.4000	20	0.00
10383	50	6.5000	15	0.00
10383	56	15.2000	20	0.00
10384	20	32.4000	28	0.00
10384	60	13.6000	15	0.00
10385	7	12.0000	10	0.20
10385	60	13.6000	20	0.20
10385	68	5.0000	8	0.20
10386	24	1.8000	15	0.00
10386	34	5.6000	10	0.00
10387	24	1.8000	15	0.00
10387	28	18.2000	6	0.00
10387	59	22.0000	12	0.00
10387	71	8.6000	15	0.00
10388	45	3.8000	15	0.20
10388	52	2.8000	20	0.20
10388	53	13.1000	40	0.00
10389	10	12.4000	16	0.00
10389	55	9.6000	15	0.00
10389	62	19.7000	20	0.00
10389	70	6.0000	30	0.00
10390	31	5.0000	60	0.10
10390	35	7.2000	40	0.10
10390	46	4.8000	45	0.00
10390	72	13.9000	24	0.10
10391	13	2.4000	18	0.00
10392	69	14.4000	50	0.00
10393	2	7.6000	25	0.25
10393	14	9.3000	42	0.25
10393	25	5.6000	7	0.25
10393	26	12.4500	70	0.25
10393	31	5.0000	32	0.00
10394	13	2.4000	10	0.00
10394	62	19.7000	10	0.00
10395	46	4.8000	28	0.10
10395	53	13.1000	70	0.10
10395	69	14.4000	8	0.00
10396	23	3.6000	40	0.00
10396	71	8.6000	60	0.00
10396	72	13.9000	21	0.00
10397	21	4.0000	10	0.15
10397	51	21.2000	18	0.15
10398	35	7.2000	30	0.00
10398	55	9.6000	120	0.10
10399	68	5.0000	60	0.00
10399	71	8.6000	30	0.00
10399	76	7.2000	35	0.00
10399	77	5.2000	14	0.00
10400	29	49.5000	21	0.00
10400	35	7.2000	35	0.00
10400	49	8.0000	30	0.00
10401	30	10.3500	18	0.00
10401	56	15.2000	70	0.00
10401	65	8.4000	20	0.00
10401	71	8.6000	60	0.00
10402	23	3.6000	60	0.00
10402	63	17.5500	65	0.00
10403	16	6.9500	21	0.15
10403	48	5.1000	70	0.15
10404	26	12.4500	30	0.05
10404	42	5.6000	40	0.05
10404	49	8.0000	30	0.05
10405	3	4.0000	50	0.00
10406	1	7.2000	10	0.00
10406	21	4.0000	30	0.10
10406	28	18.2000	42	0.10
10406	36	7.6000	5	0.10
10406	40	7.3500	2	0.10
10407	11	8.4000	30	0.00
10407	69	14.4000	15	0.00
10407	71	8.6000	15	0.00
10408	37	10.4000	10	0.00
10408	54	2.9500	6	0.00
10408	62	19.7000	35	0.00
10409	14	9.3000	12	0.00
10409	21	4.0000	12	0.00
10410	33	1.0000	49	0.00
10410	59	22.0000	16	0.00
10411	41	3.8500	25	0.20
10411	44	7.7500	40	0.20
10411	59	22.0000	9	0.20
10412	14	9.3000	20	0.10
10413	1	7.2000	24	0.00
10413	62	19.7000	40	0.00
10413	76	7.2000	14	0.00
10414	19	3.6500	18	0.05
10414	33	1.0000	50	0.00
10415	17	15.6000	2	0.00
10415	33	1.0000	20	0.00
10416	19	3.6500	20	0.00
10416	53	13.1000	10	0.00
10416	57	7.8000	20	0.00
10417	38	105.4000	50	0.00
10417	46	4.8000	2	0.25
10417	68	5.0000	36	0.25
10417	77	5.2000	35	0.00
10418	2	7.6000	60	0.00
10418	47	3.8000	55	0.00
10418	61	11.4000	16	0.00
10418	74	4.0000	15	0.00
10419	60	13.6000	60	0.05
10419	69	14.4000	20	0.05
10420	9	38.8000	20	0.10
10420	13	2.4000	2	0.10
10420	70	6.0000	8	0.10
10420	73	6.0000	20	0.10
10421	19	3.6500	4	0.15
10421	26	12.4500	30	0.00
10421	53	13.1000	15	0.15
10421	77	5.2000	10	0.15
10422	26	12.4500	2	0.00
10423	31	5.0000	14	0.00
10423	59	22.0000	20	0.00
10424	35	7.2000	60	0.20
10424	38	105.4000	49	0.20
10424	68	5.0000	30	0.20
10425	55	9.6000	10	0.25
10425	76	7.2000	20	0.25
10426	56	15.2000	5	0.00
10426	64	13.3000	7	0.00
10427	14	9.3000	35	0.00
10428	46	4.8000	20	0.00
10429	50	6.5000	40	0.00
10429	63	17.5500	35	0.25
10430	17	15.6000	45	0.20
10430	21	4.0000	50	0.00
10430	56	15.2000	30	0.00
10430	59	22.0000	70	0.20
10431	17	15.6000	50	0.25
10431	40	7.3500	50	0.25
10431	47	3.8000	30	0.25
10432	26	12.4500	10	0.00
10432	54	2.9500	40	0.00
10433	56	15.2000	28	0.00
10434	11	8.4000	6	0.00
10434	76	7.2000	18	0.15
10435	2	7.6000	10	0.00
10435	22	8.4000	12	0.00
10435	72	13.9000	10	0.00
10436	46	4.8000	5	0.00
10436	56	15.2000	40	0.10
10436	64	13.3000	30	0.10
10436	75	3.1000	24	0.10
10437	53	13.1000	15	0.00
10438	19	3.6500	15	0.20
10438	34	5.6000	20	0.20
10438	57	7.8000	15	0.20
10439	12	15.2000	15	0.00
10439	16	6.9500	16	0.00
10439	64	13.3000	6	0.00
10439	74	4.0000	30	0.00
10440	2	7.6000	45	0.15
10440	16	6.9500	49	0.15
10440	29	49.5000	24	0.15
10440	61	11.4000	90	0.15
10441	27	17.5500	50	0.00
10442	11	8.4000	30	0.00
10442	54	2.9500	80	0.00
10442	66	6.8000	60	0.00
10443	11	8.4000	6	0.20
10443	28	18.2000	12	0.00
10444	17	15.6000	10	0.00
10444	26	12.4500	15	0.00
10444	35	7.2000	8	0.00
10444	41	3.8500	30	0.00
10445	39	7.2000	6	0.00
10445	54	2.9500	15	0.00
10446	19	3.6500	12	0.10
10446	24	1.8000	20	0.10
10446	31	5.0000	3	0.10
10446	52	2.8000	15	0.10
10447	19	3.6500	40	0.00
10447	65	8.4000	35	0.00
10447	71	8.6000	2	0.00
10448	26	12.4500	6	0.00
10448	40	7.3500	20	0.00
10449	10	12.4000	14	0.00
10449	52	2.8000	20	0.00
10449	62	19.7000	35	0.00
10450	10	12.4000	20	0.20
10450	54	2.9500	6	0.20
10451	55	9.6000	120	0.10
10451	64	13.3000	35	0.10
10451	65	8.4000	28	0.10
10451	77	5.2000	55	0.10
10452	28	18.2000	15	0.00
10452	44	7.7500	100	0.05
10453	48	5.1000	15	0.10
10453	70	6.0000	25	0.10
10454	16	6.9500	20	0.20
10454	33	1.0000	20	0.20
10454	46	4.8000	10	0.20
10455	39	7.2000	20	0.00
10455	53	13.1000	50	0.00
10455	61	11.4000	25	0.00
10455	71	8.6000	30	0.00
10456	21	4.0000	40	0.15
10456	49	8.0000	21	0.15
10457	59	22.0000	36	0.00
10458	26	12.4500	30	0.00
10458	28	18.2000	30	0.00
10458	43	18.4000	20	0.00
10458	56	15.2000	15	0.00
10458	71	8.6000	50	0.00
10459	7	12.0000	16	0.05
10459	46	4.8000	20	0.05
10459	72	13.9000	40	0.00
10460	68	5.0000	21	0.25
10460	75	3.1000	4	0.25
10461	21	4.0000	40	0.25
10461	30	10.3500	28	0.25
10461	55	9.6000	60	0.25
10462	13	2.4000	1	0.00
10462	23	3.6000	21	0.00
10463	19	3.6500	21	0.00
10463	42	5.6000	50	0.00
10464	4	8.8000	16	0.20
10464	43	18.4000	3	0.00
10464	56	15.2000	30	0.20
10464	60	13.6000	20	0.00
10465	24	1.8000	25	0.00
10465	29	49.5000	18	0.10
10465	40	7.3500	20	0.00
10465	45	3.8000	30	0.10
10465	50	6.5000	25	0.00
10466	11	8.4000	10	0.00
10466	46	4.8000	5	0.00
10467	24	1.8000	28	0.00
10467	25	5.6000	12	0.00
10468	30	10.3500	8	0.00
10468	43	18.4000	15	0.00
10469	2	7.6000	40	0.15
10469	16	6.9500	35	0.15
10469	44	7.7500	2	0.15
10470	18	25.0000	30	0.00
10470	23	3.6000	15	0.00
10470	64	13.3000	8	0.00
10471	7	12.0000	30	0.00
10471	56	15.2000	20	0.00
10472	24	1.8000	80	0.05
10472	51	21.2000	18	0.00
10473	33	1.0000	12	0.00
10473	71	8.6000	12	0.00
10474	14	9.3000	12	0.00
10474	28	18.2000	18	0.00
10474	40	7.3500	21	0.00
10474	75	3.1000	10	0.00
10475	31	5.0000	35	0.15
10475	66	6.8000	60	0.15
10475	76	7.2000	42	0.15
10476	55	9.6000	2	0.05
10476	70	6.0000	12	0.00
10477	1	7.2000	15	0.00
10477	21	4.0000	21	0.25
10477	39	7.2000	20	0.25
10478	10	12.4000	20	0.05
10479	38	105.4000	30	0.00
10479	53	13.1000	28	0.00
10479	59	22.0000	60	0.00
10479	64	13.3000	30	0.00
10480	47	3.8000	30	0.00
10480	59	22.0000	12	0.00
10481	49	8.0000	24	0.00
10481	60	13.6000	40	0.00
10482	40	7.3500	10	0.00
10483	34	5.6000	35	0.05
10483	77	5.2000	30	0.05
10484	21	4.0000	14	0.00
10484	40	7.3500	10	0.00
10484	51	21.2000	3	0.00
10485	2	7.6000	20	0.10
10485	3	4.0000	20	0.10
10485	55	9.6000	30	0.10
10485	70	6.0000	60	0.10
10486	11	8.4000	5	0.00
10486	51	21.2000	25	0.00
10486	74	4.0000	16	0.00
10487	19	3.6500	5	0.00
10487	26	12.4500	30	0.00
10487	54	2.9500	24	0.25
10488	59	22.0000	30	0.00
10488	73	6.0000	20	0.20
10489	11	8.4000	15	0.25
10489	16	6.9500	18	0.00
10490	59	22.0000	60	0.00
10490	68	5.0000	30	0.00
10490	75	3.1000	36	0.00
10491	44	7.7500	15	0.15
10491	77	5.2000	7	0.15
10492	25	5.6000	60	0.05
10492	42	5.6000	20	0.05
10493	65	8.4000	15	0.10
10493	66	6.8000	10	0.10
10493	69	14.4000	10	0.10
10494	56	15.2000	30	0.00
10495	23	3.6000	10	0.00
10495	41	3.8500	20	0.00
10495	77	5.2000	5	0.00
10496	31	5.0000	20	0.05
10497	56	15.2000	14	0.00
10497	72	13.9000	25	0.00
10497	77	5.2000	25	0.00
10498	24	2.2500	14	0.00
10498	40	9.2000	5	0.00
10498	42	7.0000	30	0.00
10499	28	22.8000	20	0.00
10499	49	10.0000	25	0.00
10500	15	7.7500	12	0.05
10500	28	22.8000	8	0.05
10501	54	3.7250	20	0.00
10502	45	4.7500	21	0.00
10502	53	16.4000	6	0.00
10502	67	7.0000	30	0.00
10503	14	11.6250	70	0.00
10503	65	10.5250	20	0.00
10504	2	9.5000	12	0.00
10504	21	5.0000	12	0.00
10504	53	16.4000	10	0.00
10504	61	14.2500	25	0.00
10505	62	24.6500	3	0.00
10506	25	7.0000	18	0.10
10506	70	7.5000	14	0.10
10507	43	23.0000	15	0.15
10507	48	6.3750	15	0.15
10508	13	3.0000	10	0.00
10508	39	9.0000	10	0.00
10509	28	22.8000	3	0.00
10510	29	61.8950	36	0.00
10510	75	3.8750	36	0.10
10511	4	11.0000	50	0.15
10511	7	15.0000	50	0.15
10511	8	20.0000	10	0.15
10512	24	2.2500	10	0.15
10512	46	6.0000	9	0.15
10512	47	4.7500	6	0.15
10512	60	17.0000	12	0.15
10513	21	5.0000	40	0.20
10513	32	16.0000	50	0.20
10513	61	14.2500	15	0.20
10514	20	40.5000	39	0.00
10514	28	22.8000	35	0.00
10514	56	19.0000	70	0.00
10514	65	10.5250	39	0.00
10514	75	3.8750	50	0.00
10515	9	48.5000	16	0.15
10515	16	8.7250	50	0.00
10515	27	21.9500	120	0.00
10515	33	1.2500	16	0.15
10515	60	17.0000	84	0.15
10516	18	31.2500	25	0.10
10516	41	4.8250	80	0.10
10516	42	7.0000	20	0.00
10517	52	3.5000	6	0.00
10517	59	27.5000	4	0.00
10517	70	7.5000	6	0.00
10518	24	2.2500	5	0.00
10518	38	131.7500	15	0.00
10518	44	9.7250	9	0.00
10519	10	15.5000	16	0.05
10519	56	19.0000	40	0.00
10519	60	17.0000	10	0.05
10520	24	2.2500	8	0.00
10520	53	16.4000	5	0.00
10521	35	9.0000	3	0.00
10521	41	4.8250	10	0.00
10521	68	6.2500	6	0.00
10522	1	9.0000	40	0.20
10522	8	20.0000	24	0.00
10522	30	12.9450	20	0.20
10522	40	9.2000	25	0.20
10523	17	19.5000	25	0.10
10523	20	40.5000	15	0.10
10523	37	13.0000	18	0.10
10523	41	4.8250	6	0.10
10524	10	15.5000	2	0.00
10524	30	12.9450	10	0.00
10524	43	23.0000	60	0.00
10524	54	3.7250	15	0.00
10525	36	9.5000	30	0.00
10525	40	9.2000	15	0.10
10526	1	9.0000	8	0.15
10526	13	3.0000	10	0.00
10526	56	19.0000	30	0.15
10527	4	11.0000	50	0.10
10527	36	9.5000	30	0.10
10528	11	10.5000	3	0.00
10528	33	1.2500	8	0.20
10528	72	17.4000	9	0.00
10529	55	12.0000	14	0.00
10529	68	6.2500	20	0.00
10529	69	18.0000	10	0.00
10530	17	19.5000	40	0.00
10530	43	23.0000	25	0.00
10530	61	14.2500	20	0.00
10530	76	9.0000	50	0.00
10531	59	27.5000	2	0.00
10532	30	12.9450	15	0.00
10532	66	8.5000	24	0.00
10533	4	11.0000	50	0.05
10533	72	17.4000	24	0.00
10533	73	7.5000	24	0.05
10534	30	12.9450	10	0.00
10534	40	9.2000	10	0.20
10534	54	3.7250	10	0.20
10535	11	10.5000	50	0.10
10535	40	9.2000	10	0.10
10535	57	9.7500	5	0.10
10535	59	27.5000	15	0.10
10536	12	19.0000	15	0.25
10536	31	6.2500	20	0.00
10536	33	1.2500	30	0.00
10536	60	17.0000	35	0.25
10537	31	6.2500	30	0.00
10537	51	26.5000	6	0.00
10537	58	6.6250	20	0.00
10537	72	17.4000	21	0.00
10537	73	7.5000	9	0.00
10538	70	7.5000	7	0.00
10538	72	17.4000	1	0.00
10539	13	3.0000	8	0.00
10539	21	5.0000	15	0.00
10539	33	1.2500	15	0.00
10539	49	10.0000	6	0.00
10540	3	5.0000	60	0.00
10540	26	15.6150	40	0.00
10540	38	131.7500	30	0.00
10540	68	6.2500	35	0.00
10541	24	2.2500	35	0.10
10541	38	131.7500	4	0.10
10541	65	10.5250	36	0.10
10541	71	10.7500	9	0.10
10542	11	10.5000	15	0.05
10542	54	3.7250	24	0.05
10543	12	19.0000	30	0.15
10543	23	4.5000	70	0.15
10544	28	22.8000	7	0.00
10544	67	7.0000	7	0.00
10545	11	10.5000	10	0.00
10546	7	15.0000	10	0.00
10546	35	9.0000	30	0.00
10546	62	24.6500	40	0.00
10547	32	16.0000	24	0.15
10547	36	9.5000	60	0.00
10548	34	7.0000	10	0.25
10548	41	4.8250	14	0.00
10549	31	6.2500	55	0.15
10549	45	4.7500	100	0.15
10549	51	26.5000	48	0.15
10550	17	19.5000	8	0.10
10550	19	4.6000	10	0.00
10550	21	5.0000	6	0.10
10550	61	14.2500	10	0.10
10551	16	8.7250	40	0.15
10551	35	9.0000	20	0.15
10551	44	9.7250	40	0.00
10552	69	18.0000	18	0.00
10552	75	3.8750	30	0.00
10553	11	10.5000	15	0.00
10553	16	8.7250	14	0.00
10553	22	10.5000	24	0.00
10553	31	6.2500	30	0.00
10553	35	9.0000	6	0.00
10554	16	8.7250	30	0.05
10554	23	4.5000	20	0.05
10554	62	24.6500	20	0.05
10554	77	6.5000	10	0.05
10555	14	11.6250	30	0.20
10555	19	4.6000	35	0.20
10555	24	2.2500	18	0.20
10555	51	26.5000	20	0.20
10555	56	19.0000	40	0.20
10556	72	17.4000	24	0.00
10557	64	16.6250	30	0.00
10557	75	3.8750	20	0.00
10558	47	4.7500	25	0.00
10558	51	26.5000	20	0.00
10558	52	3.5000	30	0.00
10558	53	16.4000	18	0.00
10558	73	7.5000	3	0.00
10559	41	4.8250	12	0.05
10559	55	12.0000	18	0.05
10560	30	12.9450	20	0.00
10560	62	24.6500	15	0.25
10561	44	9.7250	10	0.00
10561	51	26.5000	50	0.00
10562	33	1.2500	20	0.10
10562	62	24.6500	10	0.10
10563	36	9.5000	25	0.00
10563	52	3.5000	70	0.00
10564	17	19.5000	16	0.05
10564	31	6.2500	6	0.05
10564	55	12.0000	25	0.05
10565	24	2.2500	25	0.10
10565	64	16.6250	18	0.10
10566	11	10.5000	35	0.15
10566	18	31.2500	18	0.15
10566	76	9.0000	10	0.00
10567	31	6.2500	60	0.20
10567	51	26.5000	3	0.00
10567	59	27.5000	40	0.20
10568	10	15.5000	5	0.00
10569	31	6.2500	35	0.20
10569	76	9.0000	30	0.00
10570	11	10.5000	15	0.05
10570	56	19.0000	60	0.05
10571	14	11.6250	11	0.15
10571	42	7.0000	28	0.15
10572	16	8.7250	12	0.10
10572	32	16.0000	10	0.10
10572	40	9.2000	50	0.00
10572	75	3.8750	15	0.10
10573	17	19.5000	18	0.00
10573	34	7.0000	40	0.00
10573	53	16.4000	25	0.00
10574	33	1.2500	14	0.00
10574	40	9.2000	2	0.00
10574	62	24.6500	10	0.00
10574	64	16.6250	6	0.00
10575	59	27.5000	12	0.00
10575	63	21.9500	6	0.00
10575	72	17.4000	30	0.00
10575	76	9.0000	10	0.00
10576	1	9.0000	10	0.00
10576	31	6.2500	20	0.00
10576	44	9.7250	21	0.00
10577	39	9.0000	10	0.00
10577	75	3.8750	20	0.00
10577	77	6.5000	18	0.00
10578	35	9.0000	20	0.00
10578	57	9.7500	6	0.00
10579	15	7.7500	10	0.00
10579	75	3.8750	21	0.00
10580	14	11.6250	15	0.05
10580	41	4.8250	9	0.05
10580	65	10.5250	30	0.05
10581	75	3.8750	50	0.20
10582	57	9.7500	4	0.00
10582	76	9.0000	14	0.00
10583	29	61.8950	10	0.00
10583	60	17.0000	24	0.15
10583	69	18.0000	10	0.15
10584	31	6.2500	50	0.05
10585	47	4.7500	15	0.00
10586	52	3.5000	4	0.15
10587	26	15.6150	6	0.00
10587	35	9.0000	20	0.00
10587	77	6.5000	20	0.00
10588	18	31.2500	40	0.20
10588	42	7.0000	100	0.20
10589	35	9.0000	4	0.00
10590	1	9.0000	20	0.00
10590	77	6.5000	60	0.05
10591	3	5.0000	14	0.00
10591	7	15.0000	10	0.00
10591	54	3.7250	50	0.00
10592	15	7.7500	25	0.05
10592	26	15.6150	5	0.05
10593	20	40.5000	21	0.20
10593	69	18.0000	20	0.20
10593	76	9.0000	4	0.20
10594	52	3.5000	24	0.00
10594	58	6.6250	30	0.00
10595	35	9.0000	30	0.25
10595	61	14.2500	120	0.25
10595	69	18.0000	65	0.25
10596	56	19.0000	5	0.20
10596	63	21.9500	24	0.20
10596	75	3.8750	30	0.20
10597	24	2.2500	35	0.20
10597	57	9.7500	20	0.00
10597	65	10.5250	12	0.20
10598	27	21.9500	50	0.00
10598	71	10.7500	9	0.00
10599	62	24.6500	10	0.00
10600	54	3.7250	4	0.00
10600	73	7.5000	30	0.00
10601	13	3.0000	60	0.00
10601	59	27.5000	35	0.00
10602	77	6.5000	5	0.25
10603	22	10.5000	48	0.00
10603	49	10.0000	25	0.05
10604	48	6.3750	6	0.10
10604	76	9.0000	10	0.10
10605	16	8.7250	30	0.05
10605	59	27.5000	20	0.05
10605	60	17.0000	70	0.05
10605	71	10.7500	15	0.05
10606	4	11.0000	20	0.20
10606	55	12.0000	20	0.20
10606	62	24.6500	10	0.20
10607	7	15.0000	45	0.00
10607	17	19.5000	100	0.00
10607	33	1.2500	14	0.00
10607	40	9.2000	42	0.00
10607	72	17.4000	12	0.00
10608	56	19.0000	28	0.00
10609	1	9.0000	3	0.00
10609	10	15.5000	10	0.00
10609	21	5.0000	6	0.00
10610	36	9.5000	21	0.25
10611	1	9.0000	6	0.00
10611	2	9.5000	10	0.00
10611	60	17.0000	15	0.00
10612	10	15.5000	70	0.00
10612	36	9.5000	55	0.00
10612	49	10.0000	18	0.00
10612	60	17.0000	40	0.00
10612	76	9.0000	80	0.00
10613	13	3.0000	8	0.10
10613	75	3.8750	40	0.00
10614	11	10.5000	14	0.00
10614	21	5.0000	8	0.00
10614	39	9.0000	5	0.00
10615	55	12.0000	5	0.00
10616	38	131.7500	15	0.05
10616	56	19.0000	14	0.00
10616	70	7.5000	15	0.05
10616	71	10.7500	15	0.05
10617	59	27.5000	30	0.15
10618	6	12.5000	70	0.00
10618	56	19.0000	20	0.00
10618	68	6.2500	15	0.00
10619	21	5.0000	42	0.00
10619	22	10.5000	40	0.00
10620	24	2.2500	5	0.00
10620	52	3.5000	5	0.00
10621	19	4.6000	5	0.00
10621	23	4.5000	10	0.00
10621	70	7.5000	20	0.00
10621	71	10.7500	15	0.00
10622	2	9.5000	20	0.00
10622	68	6.2500	18	0.20
10623	14	11.6250	21	0.00
10623	19	4.6000	15	0.10
10623	21	5.0000	25	0.10
10623	24	2.2500	3	0.00
10623	35	9.0000	30	0.10
10624	28	22.8000	10	0.00
10624	29	61.8950	6	0.00
10624	44	9.7250	10	0.00
10625	14	11.6250	3	0.00
10625	42	7.0000	5	0.00
10625	60	17.0000	10	0.00
10626	53	16.4000	12	0.00
10626	60	17.0000	20	0.00
10626	71	10.7500	20	0.00
10627	62	24.6500	15	0.00
10627	73	7.5000	35	0.15
10628	1	9.0000	25	0.00
10629	29	61.8950	20	0.00
10629	64	16.6250	9	0.00
10630	55	12.0000	12	0.05
10630	76	9.0000	35	0.00
10631	75	3.8750	8	0.10
10632	2	9.5000	30	0.05
10632	33	1.2500	20	0.05
10633	12	19.0000	36	0.15
10633	13	3.0000	13	0.15
10633	26	15.6150	35	0.15
10633	62	24.6500	80	0.15
10634	7	15.0000	35	0.00
10634	18	31.2500	50	0.00
10634	51	26.5000	15	0.00
10634	75	3.8750	2	0.00
10635	4	11.0000	10	0.10
10635	5	10.6750	15	0.10
10635	22	10.5000	40	0.00
10636	4	11.0000	25	0.00
10636	58	6.6250	6	0.00
10637	11	10.5000	10	0.00
10637	50	8.1250	25	0.05
10637	56	19.0000	60	0.05
10638	45	4.7500	20	0.00
10638	65	10.5250	21	0.00
10638	72	17.4000	60	0.00
10639	18	31.2500	8	0.00
10640	69	18.0000	20	0.25
10640	70	7.5000	15	0.25
10641	2	9.5000	50	0.00
10641	40	9.2000	60	0.00
10642	21	5.0000	30	0.20
10642	61	14.2500	20	0.20
10643	28	22.8000	15	0.25
10643	39	9.0000	21	0.25
10643	46	6.0000	2	0.25
10644	18	31.2500	4	0.10
10644	43	23.0000	20	0.00
10644	46	6.0000	21	0.10
10645	18	31.2500	20	0.00
10645	36	9.5000	15	0.00
10646	1	9.0000	15	0.25
10646	10	15.5000	18	0.25
10646	71	10.7500	30	0.25
10646	77	6.5000	35	0.25
10647	19	4.6000	30	0.00
10647	39	9.0000	20	0.00
10648	22	10.5000	15	0.00
10648	24	2.2500	15	0.15
10649	28	22.8000	20	0.00
10649	72	17.4000	15	0.00
10650	30	12.9450	30	0.00
10650	53	16.4000	25	0.05
10650	54	3.7250	30	0.00
10651	19	4.6000	12	0.25
10651	22	10.5000	20	0.25
10652	30	12.9450	2	0.25
10652	42	7.0000	20	0.00
10653	16	8.7250	30	0.10
10653	60	17.0000	20	0.10
10654	4	11.0000	12	0.10
10654	39	9.0000	20	0.10
10654	54	3.7250	6	0.10
10655	41	4.8250	20	0.20
10656	14	11.6250	3	0.10
10656	44	9.7250	28	0.10
10656	47	4.7500	6	0.10
10657	15	7.7500	50	0.00
10657	41	4.8250	24	0.00
10657	46	6.0000	45	0.00
10657	47	4.7500	10	0.00
10657	56	19.0000	45	0.00
10657	60	17.0000	30	0.00
10658	21	5.0000	60	0.00
10658	40	9.2000	70	0.05
10658	60	17.0000	55	0.05
10658	77	6.5000	70	0.05
10659	31	6.2500	20	0.05
10659	40	9.2000	24	0.05
10659	70	7.5000	40	0.05
10660	20	40.5000	21	0.00
10661	39	9.0000	3	0.20
10661	58	6.6250	49	0.20
10662	68	6.2500	10	0.00
10663	40	9.2000	30	0.05
10663	42	7.0000	30	0.05
10663	51	26.5000	20	0.05
10664	10	15.5000	24	0.15
10664	56	19.0000	12	0.15
10664	65	10.5250	15	0.15
10665	51	26.5000	20	0.00
10665	59	27.5000	1	0.00
10665	76	9.0000	10	0.00
10666	29	61.8950	36	0.00
10666	65	10.5250	10	0.00
10667	69	18.0000	45	0.20
10667	71	10.7500	14	0.20
10668	31	6.2500	8	0.10
10668	55	12.0000	4	0.10
10668	64	16.6250	15	0.10
10669	36	9.5000	30	0.00
10670	23	4.5000	32	0.00
10670	46	6.0000	60	0.00
10670	67	7.0000	25	0.00
10670	73	7.5000	50	0.00
10670	75	3.8750	25	0.00
10671	16	8.7250	10	0.00
10671	62	24.6500	10	0.00
10671	65	10.5250	12	0.00
10672	38	131.7500	15	0.10
10672	71	10.7500	12	0.00
10673	16	8.7250	3	0.00
10673	42	7.0000	6	0.00
10673	43	23.0000	6	0.00
10674	23	4.5000	5	0.00
10675	14	11.6250	30	0.00
10675	53	16.4000	10	0.00
10675	58	6.6250	30	0.00
10676	10	15.5000	2	0.00
10676	19	4.6000	7	0.00
10676	44	9.7250	21	0.00
10677	26	15.6150	30	0.15
10677	33	1.2500	8	0.15
10678	12	19.0000	100	0.00
10678	33	1.2500	30	0.00
10678	41	4.8250	120	0.00
10678	54	3.7250	30	0.00
10679	59	27.5000	12	0.00
10680	16	8.7250	50	0.25
10680	31	6.2500	20	0.25
10680	42	7.0000	40	0.25
10681	19	4.6000	30	0.10
10681	21	5.0000	12	0.10
10681	64	16.6250	28	0.00
10682	33	1.2500	30	0.00
10682	66	8.5000	4	0.00
10682	75	3.8750	30	0.00
10683	52	3.5000	9	0.00
10684	40	9.2000	20	0.00
10684	47	4.7500	40	0.00
10684	60	17.0000	30	0.00
10685	10	15.5000	20	0.00
10685	41	4.8250	4	0.00
10685	47	4.7500	15	0.00
10686	17	19.5000	30	0.20
10686	26	15.6150	15	0.00
10687	9	48.5000	50	0.25
10687	29	61.8950	10	0.00
10687	36	9.5000	6	0.25
10688	10	15.5000	18	0.10
10688	28	22.8000	60	0.10
10688	34	7.0000	14	0.00
10689	1	9.0000	35	0.25
10690	56	19.0000	20	0.25
10690	77	6.5000	30	0.25
10691	1	9.0000	30	0.00
10691	29	61.8950	40	0.00
10691	43	23.0000	40	0.00
10691	44	9.7250	24	0.00
10691	62	24.6500	48	0.00
10692	63	21.9500	20	0.00
10693	9	48.5000	6	0.00
10693	54	3.7250	60	0.15
10693	69	18.0000	30	0.15
10693	73	7.5000	15	0.15
10694	7	15.0000	90	0.00
10694	59	27.5000	25	0.00
10694	70	7.5000	50	0.00
10695	8	20.0000	10	0.00
10695	12	19.0000	4	0.00
10695	24	2.2500	20	0.00
10696	17	19.5000	20	0.00
10696	46	6.0000	18	0.00
10697	19	4.6000	7	0.25
10697	35	9.0000	9	0.25
10697	58	6.6250	30	0.25
10697	70	7.5000	30	0.25
10698	11	10.5000	15	0.00
10698	17	19.5000	8	0.05
10698	29	61.8950	12	0.05
10698	65	10.5250	65	0.05
10698	70	7.5000	8	0.05
10699	47	4.7500	12	0.00
10700	1	9.0000	5	0.20
10700	34	7.0000	12	0.20
10700	68	6.2500	40	0.20
10700	71	10.7500	60	0.20
10701	59	27.5000	42	0.15
10701	71	10.7500	20	0.15
10701	76	9.0000	35	0.15
10702	3	5.0000	6	0.00
10702	76	9.0000	15	0.00
10703	2	9.5000	5	0.00
10703	59	27.5000	35	0.00
10703	73	7.5000	35	0.00
10704	4	11.0000	6	0.00
10704	24	2.2500	35	0.00
10704	48	6.3750	24	0.00
10705	31	6.2500	20	0.00
10705	32	16.0000	4	0.00
10706	16	8.7250	20	0.00
10706	43	23.0000	24	0.00
10706	59	27.5000	8	0.00
10707	55	12.0000	21	0.00
10707	57	9.7500	40	0.00
10707	70	7.5000	28	0.15
10708	5	10.6750	4	0.00
10708	36	9.5000	5	0.00
10709	8	20.0000	40	0.00
10709	51	26.5000	28	0.00
10709	60	17.0000	10	0.00
10710	19	4.6000	5	0.00
10710	47	4.7500	5	0.00
10711	19	4.6000	12	0.00
10711	41	4.8250	42	0.00
10711	53	16.4000	120	0.00
10712	53	16.4000	3	0.05
10712	56	19.0000	30	0.00
10713	10	15.5000	18	0.00
10713	26	15.6150	30	0.00
10713	45	4.7500	110	0.00
10713	46	6.0000	24	0.00
10714	2	9.5000	30	0.25
10714	17	19.5000	27	0.25
10714	47	4.7500	50	0.25
10714	56	19.0000	18	0.25
10714	58	6.6250	12	0.25
10715	10	15.5000	21	0.00
10715	71	10.7500	30	0.00
10716	21	5.0000	5	0.00
10716	51	26.5000	7	0.00
10716	61	14.2500	10	0.00
10717	21	5.0000	32	0.05
10717	54	3.7250	15	0.00
10717	69	18.0000	25	0.05
10718	12	19.0000	36	0.00
10718	16	8.7250	20	0.00
10718	36	9.5000	40	0.00
10718	62	24.6500	20	0.00
10719	18	31.2500	12	0.25
10719	30	12.9450	3	0.25
10719	54	3.7250	40	0.25
10720	35	9.0000	21	0.00
10720	71	10.7500	8	0.00
10721	44	9.7250	50	0.05
10722	2	9.5000	3	0.00
10722	31	6.2500	50	0.00
10722	68	6.2500	45	0.00
10722	75	3.8750	42	0.00
10723	26	15.6150	15	0.00
10724	10	15.5000	16	0.00
10724	61	14.2500	5	0.00
10725	41	4.8250	12	0.00
10725	52	3.5000	4	0.00
10725	55	12.0000	6	0.00
10726	4	11.0000	25	0.00
10726	11	10.5000	5	0.00
10727	17	19.5000	20	0.05
10727	56	19.0000	10	0.05
10727	59	27.5000	10	0.05
10728	30	12.9450	15	0.00
10728	40	9.2000	6	0.00
10728	55	12.0000	12	0.00
10728	60	17.0000	15	0.00
10729	1	9.0000	50	0.00
10729	21	5.0000	30	0.00
10729	50	8.1250	40	0.00
10730	16	8.7250	15	0.05
10730	31	6.2500	3	0.05
10730	65	10.5250	10	0.05
10731	21	5.0000	40	0.05
10731	51	26.5000	30	0.05
10732	76	9.0000	20	0.00
10733	14	11.6250	16	0.00
10733	28	22.8000	20	0.00
10733	52	3.5000	25	0.00
10734	6	12.5000	30	0.00
10734	30	12.9450	15	0.00
10734	76	9.0000	20	0.00
10735	61	14.2500	20	0.10
10735	77	6.5000	2	0.10
10736	65	10.5250	40	0.00
10736	75	3.8750	20	0.00
10737	13	3.0000	4	0.00
10737	41	4.8250	12	0.00
10738	16	8.7250	3	0.00
10739	36	9.5000	6	0.00
10739	52	3.5000	18	0.00
10740	28	22.8000	5	0.20
10740	35	9.0000	35	0.20
10740	45	4.7500	40	0.20
10740	56	19.0000	14	0.20
10741	2	9.5000	15	0.20
10742	3	5.0000	20	0.00
10742	60	17.0000	50	0.00
10742	72	17.4000	35	0.00
10743	46	6.0000	28	0.05
10744	40	9.2000	50	0.20
10745	18	31.2500	24	0.00
10745	44	9.7250	16	0.00
10745	59	27.5000	45	0.00
10745	72	17.4000	7	0.00
10746	13	3.0000	6	0.00
10746	42	7.0000	28	0.00
10746	62	24.6500	9	0.00
10746	69	18.0000	40	0.00
10747	31	6.2500	8	0.00
10747	41	4.8250	35	0.00
10747	63	21.9500	9	0.00
10747	69	18.0000	30	0.00
10748	23	4.5000	44	0.00
10748	40	9.2000	40	0.00
10748	56	19.0000	28	0.00
10749	56	19.0000	15	0.00
10749	59	27.5000	6	0.00
10749	76	9.0000	10	0.00
10750	14	11.6250	5	0.15
10750	45	4.7500	40	0.15
10750	59	27.5000	25	0.15
10751	26	15.6150	12	0.10
10751	30	12.9450	30	0.00
10751	50	8.1250	20	0.10
10751	73	7.5000	15	0.00
10752	1	9.0000	8	0.00
10752	69	18.0000	3	0.00
10753	45	4.7500	4	0.00
10753	74	5.0000	5	0.00
10754	40	9.2000	3	0.00
10755	47	4.7500	30	0.25
10755	56	19.0000	30	0.25
10755	57	9.7500	14	0.25
10755	69	18.0000	25	0.25
10756	18	31.2500	21	0.20
10756	36	9.5000	20	0.20
10756	68	6.2500	6	0.20
10756	69	18.0000	20	0.20
10757	34	7.0000	30	0.00
10757	59	27.5000	7	0.00
10757	62	24.6500	30	0.00
10757	64	16.6250	24	0.00
10758	26	15.6150	20	0.00
10758	52	3.5000	60	0.00
10758	70	7.5000	40	0.00
10759	32	16.0000	10	0.00
10760	25	7.0000	12	0.25
10760	27	21.9500	40	0.00
10760	43	23.0000	30	0.25
10761	25	7.0000	35	0.25
10761	75	3.8750	18	0.00
10762	39	9.0000	16	0.00
10762	47	4.7500	30	0.00
10762	51	26.5000	28	0.00
10762	56	19.0000	60	0.00
10763	21	5.0000	40	0.00
10763	22	10.5000	6	0.00
10763	24	2.2500	20	0.00
10764	3	5.0000	20	0.10
10764	39	9.0000	130	0.10
10765	65	10.5250	80	0.10
10766	2	9.5000	40	0.00
10766	7	15.0000	35	0.00
10766	68	6.2500	40	0.00
10767	42	7.0000	2	0.00
10768	22	10.5000	4	0.00
10768	31	6.2500	50	0.00
10768	60	17.0000	15	0.00
10768	71	10.7500	12	0.00
10769	41	4.8250	30	0.05
10769	52	3.5000	15	0.05
10769	61	14.2500	20	0.00
10769	62	24.6500	15	0.00
10770	11	10.5000	15	0.25
10771	71	10.7500	16	0.00
10772	29	61.8950	18	0.00
10772	59	27.5000	25	0.00
10773	17	19.5000	33	0.00
10773	31	6.2500	70	0.20
10773	75	3.8750	7	0.20
10774	31	6.2500	2	0.25
10774	66	8.5000	50	0.00
10775	10	15.5000	6	0.00
10775	67	7.0000	3	0.00
10776	31	6.2500	16	0.05
10776	42	7.0000	12	0.05
10776	45	4.7500	27	0.05
10776	51	26.5000	120	0.05
10777	42	7.0000	20	0.20
10778	41	4.8250	10	0.00
10779	16	8.7250	20	0.00
10779	62	24.6500	20	0.00
10780	70	7.5000	35	0.00
10780	77	6.5000	15	0.00
10781	54	3.7250	3	0.20
10781	56	19.0000	20	0.20
10781	74	5.0000	35	0.00
10782	31	6.2500	1	0.00
10783	31	6.2500	10	0.00
10783	38	131.7500	5	0.00
10784	36	9.5000	30	0.00
10784	39	9.0000	2	0.15
10784	72	17.4000	30	0.15
10785	10	15.5000	10	0.00
10785	75	3.8750	10	0.00
10786	8	20.0000	30	0.20
10786	30	12.9450	15	0.20
10786	75	3.8750	42	0.20
10787	2	9.5000	15	0.05
10787	29	61.8950	20	0.05
10788	19	4.6000	50	0.05
10788	75	3.8750	40	0.05
10789	18	31.2500	30	0.00
10789	35	9.0000	15	0.00
10789	63	21.9500	30	0.00
10789	68	6.2500	18	0.00
10790	7	15.0000	3	0.15
10790	56	19.0000	20	0.15
10791	29	61.8950	14	0.05
10791	41	4.8250	20	0.05
10792	2	9.5000	10	0.00
10792	54	3.7250	3	0.00
10792	68	6.2500	15	0.00
10793	41	4.8250	14	0.00
10793	52	3.5000	8	0.00
10794	14	11.6250	15	0.20
10794	54	3.7250	6	0.20
10795	16	8.7250	65	0.00
10795	17	19.5000	35	0.25
10796	26	15.6150	21	0.20
10796	44	9.7250	10	0.00
10796	64	16.6250	35	0.20
10796	69	18.0000	24	0.20
10797	11	10.5000	20	0.00
10798	62	24.6500	2	0.00
10798	72	17.4000	10	0.00
10799	13	3.0000	20	0.15
10799	24	2.2500	20	0.15
10799	59	27.5000	25	0.00
10800	11	10.5000	50	0.10
10800	51	26.5000	10	0.10
10800	54	3.7250	7	0.10
10801	17	19.5000	40	0.25
10801	29	61.8950	20	0.25
10802	30	12.9450	25	0.25
10802	51	26.5000	30	0.25
10802	55	12.0000	60	0.25
10802	62	24.6500	5	0.25
10803	19	4.6000	24	0.05
10803	25	7.0000	15	0.05
10803	59	27.5000	15	0.05
10804	10	15.5000	36	0.00
10804	28	22.8000	24	0.00
10804	49	10.0000	4	0.15
10805	34	7.0000	10	0.00
10805	38	131.7500	10	0.00
10806	2	9.5000	20	0.25
10806	65	10.5250	2	0.00
10806	74	5.0000	15	0.25
10807	40	9.2000	1	0.00
10808	56	19.0000	20	0.15
10808	76	9.0000	50	0.15
10809	52	3.5000	20	0.00
10810	13	3.0000	7	0.00
10810	25	7.0000	5	0.00
10810	70	7.5000	5	0.00
10811	19	4.6000	15	0.00
10811	23	4.5000	18	0.00
10811	40	9.2000	30	0.00
10812	31	6.2500	16	0.10
10812	72	17.4000	40	0.10
10812	77	6.5000	20	0.00
10813	2	9.5000	12	0.20
10813	46	6.0000	35	0.00
10814	41	4.8250	20	0.00
10814	43	23.0000	20	0.15
10814	48	6.3750	8	0.15
10814	61	14.2500	30	0.15
10815	33	1.2500	16	0.00
10816	38	131.7500	30	0.05
10816	62	24.6500	20	0.05
10817	26	15.6150	40	0.15
10817	38	131.7500	30	0.00
10817	40	9.2000	60	0.15
10817	62	24.6500	25	0.15
10818	32	16.0000	20	0.00
10818	41	4.8250	20	0.00
10819	43	23.0000	7	0.00
10819	75	3.8750	20	0.00
10820	56	19.0000	30	0.00
10821	35	9.0000	20	0.00
10821	51	26.5000	6	0.00
10822	62	24.6500	3	0.00
10822	70	7.5000	6	0.00
10823	11	10.5000	20	0.10
10823	57	9.7500	15	0.00
10823	59	27.5000	40	0.10
10823	77	6.5000	15	0.10
10824	41	4.8250	12	0.00
10824	70	7.5000	9	0.00
10825	26	15.6150	12	0.00
10825	53	16.4000	20	0.00
10826	31	6.2500	35	0.00
10826	57	9.7500	15	0.00
10827	10	15.5000	15	0.00
10827	39	9.0000	21	0.00
10828	20	40.5000	5	0.00
10828	38	131.7500	2	0.00
10829	2	9.5000	10	0.00
10829	8	20.0000	20	0.00
10829	13	3.0000	10	0.00
10829	60	17.0000	21	0.00
10830	6	12.5000	6	0.00
10830	39	9.0000	28	0.00
10830	60	17.0000	30	0.00
10830	68	6.2500	24	0.00
10831	19	4.6000	2	0.00
10831	35	9.0000	8	0.00
10831	38	131.7500	8	0.00
10831	43	23.0000	9	0.00
10832	13	3.0000	3	0.20
10832	25	7.0000	10	0.20
10832	44	9.7250	16	0.20
10832	64	16.6250	3	0.00
10833	7	15.0000	20	0.10
10833	31	6.2500	9	0.10
10833	53	16.4000	9	0.10
10834	29	61.8950	8	0.05
10834	30	12.9450	20	0.05
10835	59	27.5000	15	0.00
10835	77	6.5000	2	0.20
10836	22	10.5000	52	0.00
10836	35	9.0000	6	0.00
10836	57	9.7500	24	0.00
10836	60	17.0000	60	0.00
10836	64	16.6250	30	0.00
10837	13	3.0000	6	0.00
10837	40	9.2000	25	0.00
10837	47	4.7500	40	0.25
10837	76	9.0000	21	0.25
10838	1	9.0000	4	0.25
10838	18	31.2500	25	0.25
10838	36	9.5000	50	0.25
10839	58	6.6250	30	0.10
10839	72	17.4000	15	0.10
10840	25	7.0000	6	0.20
10840	39	9.0000	10	0.20
10841	10	15.5000	16	0.00
10841	56	19.0000	30	0.00
10841	59	27.5000	50	0.00
10841	77	6.5000	15	0.00
10842	11	10.5000	15	0.00
10842	43	23.0000	5	0.00
10842	68	6.2500	20	0.00
10842	70	7.5000	12	0.00
10843	51	26.5000	4	0.25
10844	22	10.5000	35	0.00
10845	23	4.5000	70	0.10
10845	35	9.0000	25	0.10
10845	42	7.0000	42	0.10
10845	58	6.6250	60	0.10
10845	64	16.6250	48	0.00
10846	4	11.0000	21	0.00
10846	70	7.5000	30	0.00
10846	74	5.0000	20	0.00
10847	1	9.0000	80	0.20
10847	19	4.6000	12	0.20
10847	37	13.0000	60	0.20
10847	45	4.7500	36	0.20
10847	60	17.0000	45	0.20
10847	71	10.7500	55	0.20
10848	5	10.6750	30	0.00
10848	9	48.5000	3	0.00
10849	3	5.0000	49	0.00
10849	26	15.6150	18	0.15
10850	25	7.0000	20	0.15
10850	33	1.2500	4	0.15
10850	70	7.5000	30	0.15
10851	2	9.5000	5	0.05
10851	25	7.0000	10	0.05
10851	57	9.7500	10	0.05
10851	59	27.5000	42	0.05
10852	2	9.5000	15	0.00
10852	17	19.5000	6	0.00
10852	62	24.6500	50	0.00
10853	18	31.2500	10	0.00
10854	10	15.5000	100	0.15
10854	13	3.0000	65	0.15
10855	16	8.7250	50	0.00
10855	31	6.2500	14	0.00
10855	56	19.0000	24	0.00
10855	65	10.5250	15	0.15
10856	2	9.5000	20	0.00
10856	42	7.0000	20	0.00
10857	3	5.0000	30	0.00
10857	26	15.6150	35	0.25
10857	29	61.8950	10	0.25
10858	7	15.0000	5	0.00
10858	27	21.9500	10	0.00
10858	70	7.5000	4	0.00
10859	24	2.2500	40	0.25
10859	54	3.7250	35	0.25
10859	64	16.6250	30	0.25
10860	51	26.5000	3	0.00
10860	76	9.0000	20	0.00
10861	17	19.5000	42	0.00
10861	18	31.2500	20	0.00
10861	21	5.0000	40	0.00
10861	33	1.2500	35	0.00
10861	62	24.6500	3	0.00
10862	11	10.5000	25	0.00
10862	52	3.5000	8	0.00
10863	1	9.0000	20	0.15
10863	58	6.6250	12	0.15
10864	35	9.0000	4	0.00
10864	67	7.0000	15	0.00
10865	38	131.7500	60	0.05
10865	39	9.0000	80	0.05
10866	2	9.5000	21	0.25
10866	24	2.2500	6	0.25
10866	30	12.9450	40	0.25
10867	53	16.4000	3	0.00
10868	26	15.6150	20	0.00
10868	35	9.0000	30	0.00
10868	49	10.0000	42	0.10
10869	1	9.0000	40	0.00
10869	11	10.5000	10	0.00
10869	23	4.5000	50	0.00
10869	68	6.2500	20	0.00
10870	35	9.0000	3	0.00
10870	51	26.5000	2	0.00
10871	6	12.5000	50	0.05
10871	16	8.7250	12	0.05
10871	17	19.5000	16	0.05
10872	55	12.0000	10	0.05
10872	62	24.6500	20	0.05
10872	64	16.6250	15	0.05
10872	65	10.5250	21	0.05
10873	21	5.0000	20	0.00
10873	28	22.8000	3	0.00
10874	10	15.5000	10	0.00
10875	19	4.6000	25	0.00
10875	47	4.7500	21	0.10
10875	49	10.0000	15	0.00
10876	46	6.0000	21	0.00
10876	64	16.6250	20	0.00
10877	16	8.7250	30	0.25
10877	18	31.2500	25	0.00
10878	20	40.5000	20	0.05
10879	40	9.2000	12	0.00
10879	65	10.5250	10	0.00
10879	76	9.0000	10	0.00
10880	23	4.5000	30	0.20
10880	61	14.2500	30	0.20
10880	70	7.5000	50	0.20
10881	73	7.5000	10	0.00
10882	42	7.0000	25	0.00
10882	49	10.0000	20	0.15
10882	54	3.7250	32	0.15
10883	24	2.2500	8	0.00
10884	21	5.0000	40	0.05
10884	56	19.0000	21	0.05
10884	65	10.5250	12	0.05
10885	2	9.5000	20	0.00
10885	24	2.2500	12	0.00
10885	70	7.5000	30	0.00
10885	77	6.5000	25	0.00
10886	10	15.5000	70	0.00
10886	31	6.2500	35	0.00
10886	77	6.5000	40	0.00
10887	25	7.0000	5	0.00
10888	2	9.5000	20	0.00
10888	68	6.2500	18	0.00
10889	11	10.5000	40	0.00
10889	38	131.7500	40	0.00
10890	17	19.5000	15	0.00
10890	34	7.0000	10	0.00
10890	41	4.8250	14	0.00
10891	30	12.9450	15	0.05
10892	59	27.5000	40	0.05
10893	8	20.0000	30	0.00
10893	24	2.2500	10	0.00
10893	29	61.8950	24	0.00
10893	30	12.9450	35	0.00
10893	36	9.5000	20	0.00
10894	13	3.0000	28	0.05
10894	69	18.0000	50	0.05
10894	75	3.8750	120	0.05
10895	24	2.2500	110	0.00
10895	39	9.0000	45	0.00
10895	40	9.2000	91	0.00
10895	60	17.0000	100	0.00
10896	45	4.7500	15	0.00
10896	56	19.0000	16	0.00
10897	29	61.8950	80	0.00
10897	30	12.9450	36	0.00
10898	13	3.0000	5	0.00
10899	39	9.0000	8	0.15
10900	70	7.5000	3	0.25
10901	41	4.8250	30	0.00
10901	71	10.7500	30	0.00
10902	55	12.0000	30	0.15
10902	62	24.6500	6	0.15
10903	13	3.0000	40	0.00
10903	65	10.5250	21	0.00
10903	68	6.2500	20	0.00
10904	58	6.6250	15	0.00
10904	62	24.6500	35	0.00
10905	1	9.0000	20	0.05
10906	61	14.2500	15	0.00
10907	75	3.8750	14	0.00
10908	7	15.0000	20	0.05
10908	52	3.5000	14	0.05
10909	7	15.0000	12	0.00
10909	16	8.7250	15	0.00
10909	41	4.8250	5	0.00
10910	19	4.6000	12	0.00
10910	49	10.0000	10	0.00
10910	61	14.2500	5	0.00
10911	1	9.0000	10	0.00
10911	17	19.5000	12	0.00
10911	67	7.0000	15	0.00
10912	11	10.5000	40	0.25
10912	29	61.8950	60	0.25
10913	4	11.0000	30	0.25
10913	33	1.2500	40	0.25
10913	58	6.6250	15	0.00
10914	71	10.7500	25	0.00
10915	17	19.5000	10	0.00
10915	33	1.2500	30	0.00
10915	54	3.7250	10	0.00
10916	16	8.7250	6	0.00
10916	32	16.0000	6	0.00
10916	57	9.7500	20	0.00
10917	30	12.9450	1	0.00
10917	60	17.0000	10	0.00
10918	1	9.0000	60	0.25
10918	60	17.0000	25	0.25
10919	16	8.7250	24	0.00
10919	25	7.0000	24	0.00
10919	40	9.2000	20	0.00
10920	50	8.1250	24	0.00
10921	35	9.0000	10	0.00
10921	63	21.9500	40	0.00
10922	17	19.5000	15	0.00
10922	24	2.2500	35	0.00
10923	42	7.0000	10	0.20
10923	43	23.0000	10	0.20
10923	67	7.0000	24	0.20
10924	10	15.5000	20	0.10
10924	28	22.8000	30	0.10
10924	75	3.8750	6	0.00
10925	36	9.5000	25	0.15
10925	52	3.5000	12	0.15
10926	11	10.5000	2	0.00
10926	13	3.0000	10	0.00
10926	19	4.6000	7	0.00
10926	72	17.4000	10	0.00
10927	20	40.5000	5	0.00
10927	52	3.5000	5	0.00
10927	76	9.0000	20	0.00
10928	47	4.7500	5	0.00
10928	76	9.0000	5	0.00
10929	21	5.0000	60	0.00
10929	75	3.8750	49	0.00
10929	77	6.5000	15	0.00
10930	21	5.0000	36	0.00
10930	27	21.9500	25	0.00
10930	55	12.0000	25	0.20
10930	58	6.6250	30	0.20
10931	13	3.0000	42	0.15
10931	57	9.7500	30	0.00
10932	16	8.7250	30	0.10
10932	62	24.6500	14	0.10
10932	72	17.4000	16	0.00
10932	75	3.8750	20	0.10
10933	53	16.4000	2	0.00
10933	61	14.2500	30	0.00
10934	6	12.5000	20	0.00
10935	1	9.0000	21	0.00
10935	18	31.2500	4	0.25
10935	23	4.5000	8	0.25
10936	36	9.5000	30	0.20
10937	28	22.8000	8	0.00
10937	34	7.0000	20	0.00
10938	13	3.0000	20	0.25
10938	43	23.0000	24	0.25
10938	60	17.0000	49	0.25
10938	71	10.7500	35	0.25
10939	2	9.5000	10	0.15
10939	67	7.0000	40	0.15
10940	7	15.0000	8	0.00
10940	13	3.0000	20	0.00
10941	31	6.2500	44	0.25
10941	62	24.6500	30	0.25
10941	68	6.2500	80	0.25
10941	72	17.4000	50	0.00
10942	49	10.0000	28	0.00
10943	13	3.0000	15	0.00
10943	22	10.5000	21	0.00
10943	46	6.0000	15	0.00
10944	11	10.5000	5	0.25
10944	44	9.7250	18	0.25
10944	56	19.0000	18	0.00
10945	13	3.0000	20	0.00
10945	31	6.2500	10	0.00
10946	10	15.5000	25	0.00
10946	24	2.2500	25	0.00
10946	77	6.5000	40	0.00
10947	59	27.5000	4	0.00
10948	50	8.1250	9	0.00
10948	51	26.5000	40	0.00
10948	55	12.0000	4	0.00
10949	6	12.5000	12	0.00
10949	10	15.5000	30	0.00
10949	17	19.5000	6	0.00
10949	62	24.6500	60	0.00
10950	4	11.0000	5	0.00
10951	33	1.2500	15	0.05
10951	41	4.8250	6	0.05
10951	75	3.8750	50	0.05
10952	6	12.5000	16	0.05
10952	28	22.8000	2	0.00
10953	20	40.5000	50	0.05
10953	31	6.2500	50	0.05
10954	16	8.7250	28	0.15
10954	31	6.2500	25	0.15
10954	45	4.7500	30	0.00
10954	60	17.0000	24	0.15
10955	75	3.8750	12	0.20
10956	21	5.0000	12	0.00
10956	47	4.7500	14	0.00
10956	51	26.5000	8	0.00
10957	30	12.9450	30	0.00
10957	35	9.0000	40	0.00
10957	64	16.6250	8	0.00
10958	5	10.6750	20	0.00
10958	7	15.0000	6	0.00
10958	72	17.4000	5	0.00
10959	75	3.8750	20	0.15
10960	24	2.2500	10	0.25
10960	41	4.8250	24	0.00
10961	52	3.5000	6	0.05
10961	76	9.0000	60	0.00
10962	7	15.0000	45	0.00
10962	13	3.0000	77	0.00
10962	53	16.4000	20	0.00
10962	69	18.0000	9	0.00
10962	76	9.0000	44	0.00
10963	60	17.0000	2	0.15
10964	18	31.2500	6	0.00
10964	38	131.7500	5	0.00
10964	69	18.0000	10	0.00
10965	51	26.5000	16	0.00
10966	37	13.0000	8	0.00
10966	56	19.0000	12	0.15
10966	62	24.6500	12	0.15
10967	19	4.6000	12	0.00
10967	49	10.0000	40	0.00
10968	12	19.0000	30	0.00
10968	24	2.2500	30	0.00
10968	64	16.6250	4	0.00
10969	46	6.0000	9	0.00
10970	52	3.5000	40	0.20
10971	29	61.8950	14	0.00
10972	17	19.5000	6	0.00
10972	33	1.2500	7	0.00
10973	26	15.6150	5	0.00
10973	41	4.8250	6	0.00
10973	75	3.8750	10	0.00
10974	63	21.9500	10	0.00
10975	8	20.0000	16	0.00
10975	75	3.8750	10	0.00
10976	28	22.8000	20	0.00
10977	39	9.0000	30	0.00
10977	47	4.7500	30	0.00
10977	51	26.5000	10	0.00
10977	63	21.9500	20	0.00
10978	8	20.0000	20	0.15
10978	21	5.0000	40	0.15
10978	40	9.2000	10	0.00
10978	44	9.7250	6	0.15
10979	7	15.0000	18	0.00
10979	12	19.0000	20	0.00
10979	24	2.2500	80	0.00
10979	27	21.9500	30	0.00
10979	31	6.2500	24	0.00
10979	63	21.9500	35	0.00
10980	75	3.8750	40	0.20
10981	38	131.7500	60	0.00
10982	7	15.0000	20	0.00
10982	43	23.0000	9	0.00
10983	13	3.0000	84	0.15
10983	57	9.7500	15	0.00
10984	16	8.7250	55	0.00
10984	24	2.2500	20	0.00
10984	36	9.5000	40	0.00
10985	16	8.7250	36	0.10
10985	18	31.2500	8	0.10
10985	32	16.0000	35	0.10
10986	11	10.5000	30	0.00
10986	20	40.5000	15	0.00
10986	76	9.0000	10	0.00
10986	77	6.5000	15	0.00
10987	7	15.0000	60	0.00
10987	43	23.0000	6	0.00
10987	72	17.4000	20	0.00
10988	7	15.0000	60	0.00
10988	62	24.6500	40	0.10
10989	6	12.5000	40	0.00
10989	11	10.5000	15	0.00
10989	41	4.8250	4	0.00
10990	21	5.0000	65	0.00
10990	34	7.0000	60	0.15
10990	55	12.0000	65	0.15
10990	61	14.2500	66	0.15
10991	2	9.5000	50	0.20
10991	70	7.5000	20	0.20
10991	76	9.0000	90	0.20
10992	72	17.4000	2	0.00
10993	29	61.8950	50	0.25
10993	41	4.8250	35	0.25
10994	59	27.5000	18	0.05
10995	51	26.5000	20	0.00
10995	60	17.0000	4	0.00
10996	42	7.0000	40	0.00
10997	32	16.0000	50	0.00
10997	46	6.0000	20	0.25
10997	52	3.5000	20	0.25
10998	24	2.2500	12	0.00
10998	61	14.2500	7	0.00
10998	74	5.0000	20	0.00
10998	75	3.8750	30	0.00
10999	41	4.8250	20	0.05
10999	51	26.5000	15	0.05
10999	77	6.5000	21	0.05
11000	4	11.0000	25	0.25
11000	24	2.2500	30	0.25
11000	77	6.5000	30	0.00
11001	7	15.0000	60	0.00
11001	22	10.5000	25	0.00
11001	46	6.0000	25	0.00
11001	55	12.0000	6	0.00
11002	13	3.0000	56	0.00
11002	35	9.0000	15	0.15
11002	42	7.0000	24	0.15
11002	55	12.0000	40	0.00
11003	1	9.0000	4	0.00
11003	40	9.2000	10	0.00
11003	52	3.5000	10	0.00
11004	26	15.6150	6	0.00
11004	76	9.0000	6	0.00
11005	1	9.0000	2	0.00
11005	59	27.5000	10	0.00
11006	1	9.0000	8	0.00
11006	29	61.8950	2	0.25
11007	8	20.0000	30	0.00
11007	29	61.8950	10	0.00
11007	42	7.0000	14	0.00
11008	28	22.8000	70	0.05
11008	34	7.0000	90	0.05
11008	71	10.7500	21	0.00
11009	24	2.2500	12	0.00
11009	36	9.5000	18	0.25
11009	60	17.0000	9	0.00
11010	7	15.0000	20	0.00
11010	24	2.2500	10	0.00
11011	58	6.6250	40	0.05
11011	71	10.7500	20	0.00
11012	19	4.6000	50	0.05
11012	60	17.0000	36	0.05
11012	71	10.7500	60	0.05
11013	23	4.5000	10	0.00
11013	42	7.0000	4	0.00
11013	45	4.7500	20	0.00
11013	68	6.2500	2	0.00
11014	41	4.8250	28	0.10
11015	30	12.9450	15	0.00
11015	77	6.5000	18	0.00
11016	31	6.2500	15	0.00
11016	36	9.5000	16	0.00
11017	3	5.0000	25	0.00
11017	59	27.5000	110	0.00
11017	70	7.5000	30	0.00
11018	12	19.0000	20	0.00
11018	18	31.2500	10	0.00
11018	56	19.0000	5	0.00
11019	46	6.0000	3	0.00
11019	49	10.0000	2	0.00
11020	10	15.5000	24	0.15
11021	2	9.5000	11	0.25
11021	20	40.5000	15	0.00
11021	26	15.6150	63	0.00
11021	51	26.5000	44	0.25
11021	72	17.4000	35	0.00
11022	19	4.6000	35	0.00
11022	69	18.0000	30	0.00
11023	7	15.0000	4	0.00
11023	43	23.0000	30	0.00
11024	26	15.6150	12	0.00
11024	33	1.2500	30	0.00
11024	65	10.5250	21	0.00
11024	71	10.7500	50	0.00
11025	1	9.0000	10	0.10
11025	13	3.0000	20	0.10
11026	18	31.2500	8	0.00
11026	51	26.5000	10	0.00
11027	24	2.2500	30	0.25
11027	62	24.6500	21	0.25
11028	55	12.0000	35	0.00
11028	59	27.5000	24	0.00
11029	56	19.0000	20	0.00
11029	63	21.9500	12	0.00
11030	2	9.5000	100	0.25
11030	5	10.6750	70	0.00
11030	29	61.8950	60	0.25
11030	59	27.5000	100	0.25
11031	1	9.0000	45	0.00
11031	13	3.0000	80	0.00
11031	24	2.2500	21	0.00
11031	64	16.6250	20	0.00
11031	71	10.7500	16	0.00
11032	36	9.5000	35	0.00
11032	38	131.7500	25	0.00
11032	59	27.5000	30	0.00
11033	53	16.4000	70	0.10
11033	69	18.0000	36	0.10
11034	21	5.0000	15	0.10
11034	44	9.7250	12	0.00
11034	61	14.2500	6	0.00
11035	1	9.0000	10	0.00
11035	35	9.0000	60	0.00
11035	42	7.0000	30	0.00
11035	54	3.7250	10	0.00
11036	13	3.0000	7	0.00
11036	59	27.5000	30	0.00
11037	70	7.5000	4	0.00
11038	40	9.2000	5	0.20
11038	52	3.5000	2	0.00
11038	71	10.7500	30	0.00
11039	28	22.8000	20	0.00
11039	35	9.0000	24	0.00
11039	49	10.0000	60	0.00
11039	57	9.7500	28	0.00
11040	21	5.0000	20	0.00
11041	2	9.5000	30	0.20
11041	63	21.9500	30	0.00
11042	44	9.7250	15	0.00
11042	61	14.2500	4	0.00
11043	11	10.5000	10	0.00
11044	62	24.6500	12	0.00
11045	33	1.2500	15	0.00
11045	51	26.5000	24	0.00
11046	12	19.0000	20	0.05
11046	32	16.0000	15	0.05
11046	35	9.0000	18	0.05
11047	1	9.0000	25	0.25
11047	5	10.6750	30	0.25
11048	68	6.2500	42	0.00
11049	2	9.5000	10	0.20
11049	12	19.0000	4	0.20
11050	76	9.0000	50	0.10
11051	24	2.2500	10	0.20
11052	43	23.0000	30	0.20
11052	61	14.2500	10	0.20
11053	18	31.2500	35	0.20
11053	32	16.0000	20	0.00
11053	64	16.6250	25	0.20
11054	33	1.2500	10	0.00
11054	67	7.0000	20	0.00
11055	24	2.2500	15	0.00
11055	25	7.0000	15	0.00
11055	51	26.5000	20	0.00
11055	57	9.7500	20	0.00
11056	7	15.0000	40	0.00
11056	55	12.0000	35	0.00
11056	60	17.0000	50	0.00
11057	70	7.5000	3	0.00
11058	21	5.0000	3	0.00
11058	60	17.0000	21	0.00
11058	61	14.2500	4	0.00
11059	13	3.0000	30	0.00
11059	17	19.5000	12	0.00
11059	60	17.0000	35	0.00
11060	60	17.0000	4	0.00
11060	77	6.5000	10	0.00
11061	60	17.0000	15	0.00
11062	53	16.4000	10	0.20
11062	70	7.5000	12	0.20
11063	34	7.0000	30	0.00
11063	40	9.2000	40	0.10
11063	41	4.8250	30	0.10
11064	17	19.5000	77	0.10
11064	41	4.8250	12	0.00
11064	53	16.4000	25	0.10
11064	55	12.0000	4	0.10
11064	68	6.2500	55	0.00
11065	30	12.9450	4	0.25
11065	54	3.7250	20	0.25
11066	16	8.7250	3	0.00
11066	19	4.6000	42	0.00
11066	34	7.0000	35	0.00
11067	41	4.8250	9	0.00
11068	28	22.8000	8	0.15
11068	43	23.0000	36	0.15
11068	77	6.5000	28	0.15
11069	39	9.0000	20	0.00
11070	1	9.0000	40	0.15
11070	2	9.5000	20	0.15
11070	16	8.7250	30	0.15
11070	31	6.2500	20	0.00
11071	7	15.0000	15	0.05
11071	13	3.0000	10	0.05
11072	2	9.5000	8	0.00
11072	41	4.8250	40	0.00
11072	50	8.1250	22	0.00
11072	64	16.6250	130	0.00
11073	11	10.5000	10	0.00
11073	24	2.2500	20	0.00
11074	16	8.7250	14	0.05
11075	2	9.5000	10	0.15
11075	46	6.0000	30	0.15
11075	76	9.0000	2	0.15
11076	6	12.5000	20	0.25
11076	14	11.6250	20	0.25
11076	19	4.6000	10	0.25
11077	2	9.5000	24	0.20
11077	3	5.0000	4	0.00
11077	4	11.0000	1	0.00
11077	6	12.5000	1	0.02
11077	7	15.0000	1	0.05
11077	8	20.0000	2	0.10
11077	10	15.5000	1	0.00
11077	12	19.0000	2	0.05
11077	13	3.0000	4	0.00
11077	14	11.6250	1	0.03
11077	16	8.7250	2	0.03
11077	20	40.5000	1	0.04
11077	23	4.5000	2	0.00
11077	32	16.0000	1	0.00
11077	39	9.0000	2	0.05
11077	41	4.8250	3	0.00
11077	46	6.0000	3	0.02
11077	52	3.5000	2	0.00
11077	55	12.0000	2	0.00
11077	60	17.0000	2	0.06
11077	64	16.6250	2	0.03
11077	66	8.5000	1	0.00
11077	73	7.5000	2	0.01
11077	75	3.8750	4	0.00
11077	77	6.5000	2	0.00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, employee_id, order_date, delivery_date, shipping_date, shipping_with, shipping_costs, recipient, street, city, region, plz, country) FROM stdin;
10248	WILMK	5	1996-07-04 00:00:00	1996-08-01 00:00:00	1996-07-16 00:00:00	3	16.1900	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	Frankreich
10249	TRADH	6	1996-07-05 00:00:00	1996-08-16 00:00:00	1996-07-10 00:00:00	1	5.8050	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Deutschland
10250	HANAR	4	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-12 00:00:00	2	32.9150	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10251	VICTE	3	1996-07-08 00:00:00	1996-08-05 00:00:00	1996-07-15 00:00:00	1	20.6700	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10252	SUPRD	4	1996-07-09 00:00:00	1996-08-06 00:00:00	1996-07-11 00:00:00	2	25.6500	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10253	HANAR	3	1996-07-10 00:00:00	1996-07-24 00:00:00	1996-07-16 00:00:00	2	29.0850	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10254	CHOPS	5	1996-07-11 00:00:00	1996-08-08 00:00:00	1996-07-23 00:00:00	2	11.4900	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
10255	RICSU	9	1996-07-12 00:00:00	1996-08-09 00:00:00	1996-07-15 00:00:00	3	74.1650	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10256	WELLI	3	1996-07-15 00:00:00	1996-08-12 00:00:00	1996-07-17 00:00:00	2	6.9850	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10257	HILAA	4	1996-07-16 00:00:00	1996-08-13 00:00:00	1996-07-22 00:00:00	3	40.9550	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10258	ERNSH	1	1996-07-17 00:00:00	1996-08-14 00:00:00	1996-07-23 00:00:00	1	70.2550	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10259	CENTC	4	1996-07-18 00:00:00	1996-08-15 00:00:00	1996-07-25 00:00:00	3	1.6250	Centro comercial Moctezuma	Sierras de Granada 9993	México D.F.	\N	05022	Mexiko
10260	OLDWO	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-29 00:00:00	1	27.5450	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10261	QUEDE	4	1996-07-19 00:00:00	1996-08-16 00:00:00	1996-07-30 00:00:00	2	1.5250	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10262	RATTC	8	1996-07-22 00:00:00	1996-08-19 00:00:00	1996-07-25 00:00:00	3	24.1450	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10263	ERNSH	9	1996-07-23 00:00:00	1996-08-20 00:00:00	1996-07-31 00:00:00	3	73.0300	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10264	FOLKO	6	1996-07-24 00:00:00	1996-08-21 00:00:00	1996-08-23 00:00:00	3	1.8350	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10265	BLONP	2	1996-07-25 00:00:00	1996-08-22 00:00:00	1996-08-12 00:00:00	1	27.6400	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10266	WARTH	3	1996-07-26 00:00:00	1996-09-06 00:00:00	1996-07-31 00:00:00	3	12.8650	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10267	FRANK	4	1996-07-29 00:00:00	1996-08-26 00:00:00	1996-08-06 00:00:00	1	104.2900	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10268	GROSR	8	1996-07-30 00:00:00	1996-08-27 00:00:00	1996-08-02 00:00:00	3	33.1450	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10269	WHITC	5	1996-07-31 00:00:00	1996-08-14 00:00:00	1996-08-09 00:00:00	1	2.2800	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10270	WARTH	1	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-02 00:00:00	1	68.2700	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10271	SPLIR	6	1996-08-01 00:00:00	1996-08-29 00:00:00	1996-08-30 00:00:00	2	2.2700	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10272	RATTC	6	1996-08-02 00:00:00	1996-08-30 00:00:00	1996-08-06 00:00:00	2	49.0150	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10273	QUICK	3	1996-08-05 00:00:00	1996-09-02 00:00:00	1996-08-12 00:00:00	3	38.0350	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10274	VINET	6	1996-08-06 00:00:00	1996-09-03 00:00:00	1996-08-16 00:00:00	1	3.0050	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	Frankreich
10275	MAGAA	1	1996-08-07 00:00:00	1996-09-04 00:00:00	1996-08-09 00:00:00	1	13.4650	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10276	TORTU	8	1996-08-08 00:00:00	1996-08-22 00:00:00	1996-08-14 00:00:00	3	6.9200	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10277	MORGK	2	1996-08-09 00:00:00	1996-09-06 00:00:00	1996-08-13 00:00:00	3	62.8850	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Deutschland
10278	BERGS	8	1996-08-12 00:00:00	1996-09-09 00:00:00	1996-08-16 00:00:00	2	46.3450	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10279	LEHMS	8	1996-08-13 00:00:00	1996-09-10 00:00:00	1996-08-16 00:00:00	2	12.9150	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10280	BERGS	2	1996-08-14 00:00:00	1996-09-11 00:00:00	1996-09-12 00:00:00	1	4.4900	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10281	ROMEY	4	1996-08-14 00:00:00	1996-08-28 00:00:00	1996-08-21 00:00:00	1	1.4700	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spanien
10282	ROMEY	4	1996-08-15 00:00:00	1996-09-12 00:00:00	1996-08-21 00:00:00	1	6.3450	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spanien
10283	LILAS	3	1996-08-16 00:00:00	1996-09-13 00:00:00	1996-08-23 00:00:00	3	42.4050	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10284	LEHMS	4	1996-08-19 00:00:00	1996-09-16 00:00:00	1996-08-27 00:00:00	1	38.2800	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10285	QUICK	1	1996-08-20 00:00:00	1996-09-17 00:00:00	1996-08-26 00:00:00	2	38.4150	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10286	QUICK	8	1996-08-21 00:00:00	1996-09-18 00:00:00	1996-08-30 00:00:00	3	114.6200	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10287	RICAR	8	1996-08-22 00:00:00	1996-09-19 00:00:00	1996-08-28 00:00:00	3	6.3800	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10288	REGGC	4	1996-08-23 00:00:00	1996-09-20 00:00:00	1996-09-03 00:00:00	1	3.7250	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10289	BSBEV	7	1996-08-26 00:00:00	1996-09-23 00:00:00	1996-08-28 00:00:00	3	11.3850	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10290	COMMI	8	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-03 00:00:00	1	39.8500	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brasilien
10291	QUEDE	6	1996-08-27 00:00:00	1996-09-24 00:00:00	1996-09-04 00:00:00	2	3.2000	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10292	TRADH	1	1996-08-28 00:00:00	1996-09-25 00:00:00	1996-09-02 00:00:00	2	0.6750	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brasilien
10293	TORTU	1	1996-08-29 00:00:00	1996-09-26 00:00:00	1996-09-11 00:00:00	3	10.5900	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10294	RATTC	4	1996-08-30 00:00:00	1996-09-27 00:00:00	1996-09-05 00:00:00	2	73.6300	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10295	VINET	2	1996-09-02 00:00:00	1996-09-30 00:00:00	1996-09-10 00:00:00	2	0.5750	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	Frankreich
10296	LILAS	6	1996-09-03 00:00:00	1996-10-01 00:00:00	1996-09-11 00:00:00	1	0.0600	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10297	BLONP	5	1996-09-04 00:00:00	1996-10-16 00:00:00	1996-09-10 00:00:00	2	2.8700	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10298	HUNGO	6	1996-09-05 00:00:00	1996-10-03 00:00:00	1996-09-11 00:00:00	2	84.1100	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10299	RICAR	4	1996-09-06 00:00:00	1996-10-04 00:00:00	1996-09-13 00:00:00	2	14.8800	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10300	MAGAA	2	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-18 00:00:00	2	8.8400	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10301	WANDK	8	1996-09-09 00:00:00	1996-10-07 00:00:00	1996-09-17 00:00:00	2	22.5400	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10302	SUPRD	4	1996-09-10 00:00:00	1996-10-08 00:00:00	1996-10-09 00:00:00	2	3.1350	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10303	GODOS	7	1996-09-11 00:00:00	1996-10-09 00:00:00	1996-09-18 00:00:00	2	53.9150	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10304	TORTU	1	1996-09-12 00:00:00	1996-10-10 00:00:00	1996-09-17 00:00:00	2	31.8950	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10305	OLDWO	8	1996-09-13 00:00:00	1996-10-11 00:00:00	1996-10-09 00:00:00	3	128.8100	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10306	ROMEY	1	1996-09-16 00:00:00	1996-10-14 00:00:00	1996-09-23 00:00:00	3	3.7800	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spanien
10307	LONEP	2	1996-09-17 00:00:00	1996-10-15 00:00:00	1996-09-25 00:00:00	2	0.2800	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10308	ANATR	7	1996-09-18 00:00:00	1996-10-16 00:00:00	1996-09-24 00:00:00	3	0.8050	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexiko
10309	HUNGO	3	1996-09-19 00:00:00	1996-10-17 00:00:00	1996-10-23 00:00:00	1	23.6500	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10310	THEBI	8	1996-09-20 00:00:00	1996-10-18 00:00:00	1996-09-27 00:00:00	2	8.7600	The Big Cheese	89 Jefferson Way\\r\\nSuite 2	Portland	OR	97201	USA
10311	DUMON	1	1996-09-20 00:00:00	1996-10-04 00:00:00	1996-09-26 00:00:00	3	12.3450	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	Frankreich
10312	WANDK	2	1996-09-23 00:00:00	1996-10-21 00:00:00	1996-10-03 00:00:00	2	20.1300	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10313	QUICK	2	1996-09-24 00:00:00	1996-10-22 00:00:00	1996-10-04 00:00:00	2	0.9800	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10314	RATTC	1	1996-09-25 00:00:00	1996-10-23 00:00:00	1996-10-04 00:00:00	2	37.0800	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10315	ISLAT	4	1996-09-26 00:00:00	1996-10-24 00:00:00	1996-10-03 00:00:00	2	20.8800	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10316	RATTC	1	1996-09-27 00:00:00	1996-10-25 00:00:00	1996-10-08 00:00:00	3	75.0750	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10317	LONEP	6	1996-09-30 00:00:00	1996-10-28 00:00:00	1996-10-10 00:00:00	1	6.3450	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10318	ISLAT	8	1996-10-01 00:00:00	1996-10-29 00:00:00	1996-10-04 00:00:00	2	2.3650	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10319	TORTU	7	1996-10-02 00:00:00	1996-10-30 00:00:00	1996-10-11 00:00:00	3	32.2500	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10320	WARTH	5	1996-10-03 00:00:00	1996-10-17 00:00:00	1996-10-18 00:00:00	3	17.2850	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10321	ISLAT	3	1996-10-03 00:00:00	1996-10-31 00:00:00	1996-10-11 00:00:00	2	1.7150	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10322	PERIC	7	1996-10-04 00:00:00	1996-11-01 00:00:00	1996-10-23 00:00:00	3	0.2000	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexiko
10323	KOENE	4	1996-10-07 00:00:00	1996-11-04 00:00:00	1996-10-14 00:00:00	1	2.4400	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10324	SAVEA	9	1996-10-08 00:00:00	1996-11-05 00:00:00	1996-10-10 00:00:00	1	107.1350	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10325	KOENE	1	1996-10-09 00:00:00	1996-10-23 00:00:00	1996-10-14 00:00:00	3	32.4300	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10326	BOLID	4	1996-10-10 00:00:00	1996-11-07 00:00:00	1996-10-14 00:00:00	2	38.9600	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spanien
10327	FOLKO	2	1996-10-11 00:00:00	1996-11-08 00:00:00	1996-10-14 00:00:00	1	31.6800	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10328	FURIB	4	1996-10-14 00:00:00	1996-11-11 00:00:00	1996-10-17 00:00:00	3	43.5150	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10329	SPLIR	4	1996-10-15 00:00:00	1996-11-26 00:00:00	1996-10-23 00:00:00	2	95.8350	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10330	LILAS	3	1996-10-16 00:00:00	1996-11-13 00:00:00	1996-10-28 00:00:00	1	6.3750	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10331	BONAP	9	1996-10-16 00:00:00	1996-11-27 00:00:00	1996-10-21 00:00:00	1	5.0950	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10332	MEREP	3	1996-10-17 00:00:00	1996-11-28 00:00:00	1996-10-21 00:00:00	2	26.4200	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10333	WARTH	5	1996-10-18 00:00:00	1996-11-15 00:00:00	1996-10-25 00:00:00	3	0.2950	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10334	VICTE	8	1996-10-21 00:00:00	1996-11-18 00:00:00	1996-10-28 00:00:00	2	4.2800	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10335	HUNGO	7	1996-10-22 00:00:00	1996-11-19 00:00:00	1996-10-24 00:00:00	2	21.0550	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10336	PRINI	7	1996-10-23 00:00:00	1996-11-20 00:00:00	1996-10-25 00:00:00	2	7.7550	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10337	FRANK	4	1996-10-24 00:00:00	1996-11-21 00:00:00	1996-10-29 00:00:00	3	54.1300	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10338	OLDWO	4	1996-10-25 00:00:00	1996-11-22 00:00:00	1996-10-29 00:00:00	3	42.1050	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10339	MEREP	2	1996-10-28 00:00:00	1996-11-25 00:00:00	1996-11-04 00:00:00	2	7.8300	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10340	BONAP	1	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-08 00:00:00	3	83.1550	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10341	SIMOB	7	1996-10-29 00:00:00	1996-11-26 00:00:00	1996-11-05 00:00:00	3	13.3900	Simons bistro	Vinbæltet 34	København	\N	1734	Dänemark
10342	FRANK	4	1996-10-30 00:00:00	1996-11-13 00:00:00	1996-11-04 00:00:00	2	27.4150	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10343	LEHMS	4	1996-10-31 00:00:00	1996-11-28 00:00:00	1996-11-06 00:00:00	1	55.1850	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10344	WHITC	4	1996-11-01 00:00:00	1996-11-29 00:00:00	1996-11-05 00:00:00	2	11.6450	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10345	QUICK	2	1996-11-04 00:00:00	1996-12-02 00:00:00	1996-11-11 00:00:00	2	124.5300	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10346	RATTC	3	1996-11-05 00:00:00	1996-12-17 00:00:00	1996-11-08 00:00:00	3	71.0400	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10347	FAMIA	4	1996-11-06 00:00:00	1996-12-04 00:00:00	1996-11-08 00:00:00	3	1.5500	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien
10348	WANDK	4	1996-11-07 00:00:00	1996-12-05 00:00:00	1996-11-15 00:00:00	2	0.3900	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10349	SPLIR	7	1996-11-08 00:00:00	1996-12-06 00:00:00	1996-11-15 00:00:00	1	4.3150	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10350	LAMAI	6	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-12-03 00:00:00	2	32.0950	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10351	ERNSH	1	1996-11-11 00:00:00	1996-12-09 00:00:00	1996-11-20 00:00:00	1	81.1650	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10352	FURIB	3	1996-11-12 00:00:00	1996-11-26 00:00:00	1996-11-18 00:00:00	3	0.6500	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10353	PICCO	7	1996-11-13 00:00:00	1996-12-11 00:00:00	1996-11-25 00:00:00	3	180.3150	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10354	PERIC	8	1996-11-14 00:00:00	1996-12-12 00:00:00	1996-11-20 00:00:00	3	26.9000	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexiko
10355	AROUT	6	1996-11-15 00:00:00	1996-12-13 00:00:00	1996-11-20 00:00:00	1	20.9750	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10356	WANDK	6	1996-11-18 00:00:00	1996-12-16 00:00:00	1996-11-27 00:00:00	2	18.3550	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10357	LILAS	1	1996-11-19 00:00:00	1996-12-17 00:00:00	1996-12-02 00:00:00	3	17.4400	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10358	LAMAI	5	1996-11-20 00:00:00	1996-12-18 00:00:00	1996-11-27 00:00:00	1	9.8200	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10359	SEVES	5	1996-11-21 00:00:00	1996-12-19 00:00:00	1996-11-26 00:00:00	3	144.2150	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10360	BLONP	4	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-02 00:00:00	3	65.8500	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10361	QUICK	1	1996-11-22 00:00:00	1996-12-20 00:00:00	1996-12-03 00:00:00	2	91.5850	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10362	BONAP	3	1996-11-25 00:00:00	1996-12-23 00:00:00	1996-11-28 00:00:00	1	48.0200	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10363	DRACD	4	1996-11-26 00:00:00	1996-12-24 00:00:00	1996-12-04 00:00:00	3	15.2700	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Deutschland
10364	EASTC	1	1996-11-26 00:00:00	1997-01-07 00:00:00	1996-12-04 00:00:00	1	35.9850	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
10365	ANTON	3	1996-11-27 00:00:00	1996-12-25 00:00:00	1996-12-02 00:00:00	2	11.0000	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexiko
10366	GALED	8	1996-11-28 00:00:00	1997-01-09 00:00:00	1996-12-30 00:00:00	2	5.0700	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spanien
10367	VAFFE	7	1996-11-28 00:00:00	1996-12-26 00:00:00	1996-12-02 00:00:00	3	6.7750	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10368	ERNSH	2	1996-11-29 00:00:00	1996-12-27 00:00:00	1996-12-02 00:00:00	2	50.9750	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10369	SPLIR	8	1996-12-02 00:00:00	1996-12-30 00:00:00	1996-12-09 00:00:00	2	97.8400	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10370	CHOPS	6	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-27 00:00:00	2	0.5850	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
10371	LAMAI	1	1996-12-03 00:00:00	1996-12-31 00:00:00	1996-12-24 00:00:00	1	0.2250	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10372	QUEEN	5	1996-12-04 00:00:00	1997-01-01 00:00:00	1996-12-09 00:00:00	2	445.3900	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10373	HUNGO	4	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-11 00:00:00	3	62.0600	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10374	WOLZA	1	1996-12-05 00:00:00	1997-01-02 00:00:00	1996-12-09 00:00:00	3	1.9700	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Polen
10375	HUNGC	3	1996-12-06 00:00:00	1997-01-03 00:00:00	1996-12-09 00:00:00	2	10.0600	Hungry Coyote Import Store	City Center Plaza\\r\\n516 Main St.	Elgin	OR	97827	USA
10376	MEREP	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00	2	10.1950	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10377	SEVES	1	1996-12-09 00:00:00	1997-01-06 00:00:00	1996-12-13 00:00:00	3	11.1050	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10378	FOLKO	5	1996-12-10 00:00:00	1997-01-07 00:00:00	1996-12-19 00:00:00	3	2.7200	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10379	QUEDE	2	1996-12-11 00:00:00	1997-01-08 00:00:00	1996-12-13 00:00:00	1	22.5150	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10380	HUNGO	8	1996-12-12 00:00:00	1997-01-09 00:00:00	1997-01-16 00:00:00	3	17.5150	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10381	LILAS	3	1996-12-12 00:00:00	1997-01-09 00:00:00	1996-12-13 00:00:00	3	3.9950	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10382	ERNSH	4	1996-12-13 00:00:00	1997-01-10 00:00:00	1996-12-16 00:00:00	1	47.3850	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10383	AROUT	8	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-18 00:00:00	3	17.1200	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10384	BERGS	3	1996-12-16 00:00:00	1997-01-13 00:00:00	1996-12-20 00:00:00	3	84.3200	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10385	SPLIR	1	1996-12-17 00:00:00	1997-01-14 00:00:00	1996-12-23 00:00:00	2	15.4800	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10386	FAMIA	9	1996-12-18 00:00:00	1997-01-01 00:00:00	1996-12-25 00:00:00	3	6.9950	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien
10387	SANTG	1	1996-12-18 00:00:00	1997-01-15 00:00:00	1996-12-20 00:00:00	2	46.8150	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norwegen
10388	SEVES	2	1996-12-19 00:00:00	1997-01-16 00:00:00	1996-12-20 00:00:00	1	17.4300	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10389	BOTTM	4	1996-12-20 00:00:00	1997-01-17 00:00:00	1996-12-24 00:00:00	2	23.7100	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10390	ERNSH	6	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-26 00:00:00	1	63.1900	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10391	DRACD	3	1996-12-23 00:00:00	1997-01-20 00:00:00	1996-12-31 00:00:00	3	2.7250	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Deutschland
10392	PICCO	2	1996-12-24 00:00:00	1997-01-21 00:00:00	1997-01-01 00:00:00	3	61.2300	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10393	SAVEA	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00	3	63.2800	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10394	HUNGC	1	1996-12-25 00:00:00	1997-01-22 00:00:00	1997-01-03 00:00:00	3	15.1700	Hungry Coyote Import Store	City Center Plaza\\r\\n516 Main St.	Elgin	OR	97827	USA
10395	HILAA	6	1996-12-26 00:00:00	1997-01-23 00:00:00	1997-01-03 00:00:00	1	92.2050	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10396	FRANK	1	1996-12-27 00:00:00	1997-01-10 00:00:00	1997-01-06 00:00:00	3	67.6750	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10397	PRINI	5	1996-12-27 00:00:00	1997-01-24 00:00:00	1997-01-02 00:00:00	1	30.1300	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10398	SAVEA	2	1996-12-30 00:00:00	1997-01-27 00:00:00	1997-01-09 00:00:00	3	44.5800	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10399	VAFFE	8	1996-12-31 00:00:00	1997-01-14 00:00:00	1997-01-08 00:00:00	3	13.6800	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10400	EASTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-16 00:00:00	3	41.9650	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
10401	RATTC	1	1997-01-01 00:00:00	1997-01-29 00:00:00	1997-01-10 00:00:00	1	6.2550	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10402	ERNSH	8	1997-01-02 00:00:00	1997-02-13 00:00:00	1997-01-10 00:00:00	2	33.9400	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10403	ERNSH	4	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-09 00:00:00	3	36.8950	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10404	MAGAA	2	1997-01-03 00:00:00	1997-01-31 00:00:00	1997-01-08 00:00:00	1	77.9850	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10405	LINOD	1	1997-01-06 00:00:00	1997-02-03 00:00:00	1997-01-22 00:00:00	1	17.4100	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10406	QUEEN	7	1997-01-07 00:00:00	1997-02-18 00:00:00	1997-01-13 00:00:00	1	54.0200	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10407	OTTIK	2	1997-01-07 00:00:00	1997-02-04 00:00:00	1997-01-30 00:00:00	2	45.7400	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10408	FOLIG	8	1997-01-08 00:00:00	1997-02-05 00:00:00	1997-01-14 00:00:00	1	5.6300	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	Frankreich
10409	OCEAN	3	1997-01-09 00:00:00	1997-02-06 00:00:00	1997-01-14 00:00:00	1	14.9150	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\\r\\nPiso 20-A	Buenos Aires	\N	1010	Argentinien
10410	BOTTM	3	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-15 00:00:00	3	1.2000	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10411	BOTTM	9	1997-01-10 00:00:00	1997-02-07 00:00:00	1997-01-21 00:00:00	3	11.8250	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10412	WARTH	8	1997-01-13 00:00:00	1997-02-10 00:00:00	1997-01-15 00:00:00	2	1.8850	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10413	LAMAI	3	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-16 00:00:00	2	47.8300	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10414	FAMIA	2	1997-01-14 00:00:00	1997-02-11 00:00:00	1997-01-17 00:00:00	3	10.7400	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien
10415	HUNGC	3	1997-01-15 00:00:00	1997-02-12 00:00:00	1997-01-24 00:00:00	1	0.1000	Hungry Coyote Import Store	City Center Plaza\\r\\n516 Main St.	Elgin	OR	97827	USA
10416	WARTH	8	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-27 00:00:00	3	11.3600	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10417	SIMOB	4	1997-01-16 00:00:00	1997-02-13 00:00:00	1997-01-28 00:00:00	3	35.1450	Simons bistro	Vinbæltet 34	København	\N	1734	Dänemark
10418	QUICK	4	1997-01-17 00:00:00	1997-02-14 00:00:00	1997-01-24 00:00:00	1	8.7750	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10419	RICSU	4	1997-01-20 00:00:00	1997-02-17 00:00:00	1997-01-30 00:00:00	2	68.6750	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10420	WELLI	3	1997-01-21 00:00:00	1997-02-18 00:00:00	1997-01-27 00:00:00	1	22.0600	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10421	QUEDE	8	1997-01-21 00:00:00	1997-03-04 00:00:00	1997-01-27 00:00:00	1	49.6150	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10422	FRANS	2	1997-01-22 00:00:00	1997-02-19 00:00:00	1997-01-31 00:00:00	1	1.5100	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italien
10423	GOURL	6	1997-01-23 00:00:00	1997-02-06 00:00:00	1997-02-24 00:00:00	3	12.2500	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10424	MEREP	7	1997-01-23 00:00:00	1997-02-20 00:00:00	1997-01-27 00:00:00	2	185.3050	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10425	LAMAI	6	1997-01-24 00:00:00	1997-02-21 00:00:00	1997-02-14 00:00:00	2	3.9650	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10426	GALED	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-02-06 00:00:00	1	9.3450	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spanien
10427	PICCO	4	1997-01-27 00:00:00	1997-02-24 00:00:00	1997-03-03 00:00:00	2	15.6450	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10428	REGGC	7	1997-01-28 00:00:00	1997-02-25 00:00:00	1997-02-04 00:00:00	1	5.5450	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10429	HUNGO	3	1997-01-29 00:00:00	1997-03-12 00:00:00	1997-02-07 00:00:00	2	28.3150	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10430	ERNSH	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-03 00:00:00	1	229.3900	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10431	BOTTM	4	1997-01-30 00:00:00	1997-02-13 00:00:00	1997-02-07 00:00:00	2	22.0850	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10432	SPLIR	3	1997-01-31 00:00:00	1997-02-14 00:00:00	1997-02-07 00:00:00	2	2.1700	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10433	PRINI	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-03-04 00:00:00	3	36.9150	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10434	FOLKO	3	1997-02-03 00:00:00	1997-03-03 00:00:00	1997-02-13 00:00:00	2	8.9600	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10435	CONSH	8	1997-02-04 00:00:00	1997-03-18 00:00:00	1997-02-07 00:00:00	2	4.6050	Consolidated Holdings	Berkeley Gardens\\r\\n12  Brewery 	London	\N	WX1 6LT	Großbritannien
10436	BLONP	3	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-11 00:00:00	2	78.3300	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10437	WARTH	8	1997-02-05 00:00:00	1997-03-05 00:00:00	1997-02-12 00:00:00	1	9.9850	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10438	TOMSP	3	1997-02-06 00:00:00	1997-03-06 00:00:00	1997-02-14 00:00:00	2	4.1200	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Deutschland
10439	MEREP	6	1997-02-07 00:00:00	1997-03-07 00:00:00	1997-02-10 00:00:00	3	2.0350	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10440	SAVEA	4	1997-02-10 00:00:00	1997-03-10 00:00:00	1997-02-28 00:00:00	2	43.2650	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10441	OLDWO	3	1997-02-10 00:00:00	1997-03-24 00:00:00	1997-03-14 00:00:00	2	36.5100	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10442	ERNSH	3	1997-02-11 00:00:00	1997-03-11 00:00:00	1997-02-18 00:00:00	2	23.9700	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10443	REGGC	8	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-14 00:00:00	1	6.9750	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10444	BERGS	3	1997-02-12 00:00:00	1997-03-12 00:00:00	1997-02-21 00:00:00	3	1.7500	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10445	BERGS	3	1997-02-13 00:00:00	1997-03-13 00:00:00	1997-02-20 00:00:00	1	4.6500	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10446	TOMSP	6	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-02-19 00:00:00	1	7.3400	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Deutschland
10447	RICAR	4	1997-02-14 00:00:00	1997-03-14 00:00:00	1997-03-07 00:00:00	2	34.3300	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10448	RANCH	4	1997-02-17 00:00:00	1997-03-17 00:00:00	1997-02-24 00:00:00	2	19.4100	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentinien
10449	BLONP	3	1997-02-18 00:00:00	1997-03-18 00:00:00	1997-02-27 00:00:00	2	26.6500	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10450	VICTE	8	1997-02-19 00:00:00	1997-03-19 00:00:00	1997-03-11 00:00:00	2	3.6150	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10451	QUICK	4	1997-02-19 00:00:00	1997-03-05 00:00:00	1997-03-12 00:00:00	3	94.5450	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10452	SAVEA	8	1997-02-20 00:00:00	1997-03-20 00:00:00	1997-02-26 00:00:00	1	70.1300	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10453	AROUT	1	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-26 00:00:00	2	12.6800	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10454	LAMAI	4	1997-02-21 00:00:00	1997-03-21 00:00:00	1997-02-25 00:00:00	3	1.3700	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10455	WARTH	8	1997-02-24 00:00:00	1997-04-07 00:00:00	1997-03-03 00:00:00	2	90.2250	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10456	KOENE	8	1997-02-25 00:00:00	1997-04-08 00:00:00	1997-02-28 00:00:00	2	4.0600	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10457	KOENE	2	1997-02-25 00:00:00	1997-03-25 00:00:00	1997-03-03 00:00:00	1	5.7850	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10458	SUPRD	7	1997-02-26 00:00:00	1997-03-26 00:00:00	1997-03-04 00:00:00	3	73.5300	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10459	VICTE	4	1997-02-27 00:00:00	1997-03-27 00:00:00	1997-02-28 00:00:00	2	12.5450	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10460	FOLKO	8	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-03 00:00:00	1	8.1350	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10461	LILAS	1	1997-02-28 00:00:00	1997-03-28 00:00:00	1997-03-05 00:00:00	3	74.3050	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10462	CONSH	2	1997-03-03 00:00:00	1997-03-31 00:00:00	1997-03-18 00:00:00	1	3.0850	Consolidated Holdings	Berkeley Gardens\\r\\n12  Brewery 	London	\N	WX1 6LT	Großbritannien
10463	SUPRD	5	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-06 00:00:00	3	7.3900	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10464	FURIB	4	1997-03-04 00:00:00	1997-04-01 00:00:00	1997-03-14 00:00:00	2	44.5000	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10465	VAFFE	1	1997-03-05 00:00:00	1997-04-02 00:00:00	1997-03-14 00:00:00	3	72.5200	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10466	COMMI	4	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-13 00:00:00	1	5.9650	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brasilien
10467	MAGAA	8	1997-03-06 00:00:00	1997-04-03 00:00:00	1997-03-11 00:00:00	2	2.4650	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10468	KOENE	3	1997-03-07 00:00:00	1997-04-04 00:00:00	1997-03-12 00:00:00	3	22.0600	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10469	WHITC	1	1997-03-10 00:00:00	1997-04-07 00:00:00	1997-03-14 00:00:00	1	30.0900	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10470	BONAP	4	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-14 00:00:00	2	32.2800	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10471	BSBEV	2	1997-03-11 00:00:00	1997-04-08 00:00:00	1997-03-18 00:00:00	3	22.7950	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10472	SEVES	8	1997-03-12 00:00:00	1997-04-09 00:00:00	1997-03-19 00:00:00	1	2.1000	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10473	ISLAT	1	1997-03-13 00:00:00	1997-03-27 00:00:00	1997-03-21 00:00:00	3	8.1850	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10474	PERIC	5	1997-03-13 00:00:00	1997-04-10 00:00:00	1997-03-21 00:00:00	2	41.7450	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexiko
10475	SUPRD	9	1997-03-14 00:00:00	1997-04-11 00:00:00	1997-04-04 00:00:00	1	34.2600	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10476	HILAA	8	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-24 00:00:00	3	2.2050	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10477	PRINI	5	1997-03-17 00:00:00	1997-04-14 00:00:00	1997-03-25 00:00:00	2	6.5100	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
10478	VICTE	2	1997-03-18 00:00:00	1997-04-01 00:00:00	1997-03-26 00:00:00	3	2.4050	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10479	RATTC	3	1997-03-19 00:00:00	1997-04-16 00:00:00	1997-03-21 00:00:00	3	354.4750	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10480	FOLIG	6	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-24 00:00:00	2	0.6750	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	Frankreich
10481	RICAR	8	1997-03-20 00:00:00	1997-04-17 00:00:00	1997-03-25 00:00:00	2	32.1650	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10482	LAZYK	1	1997-03-21 00:00:00	1997-04-18 00:00:00	1997-04-10 00:00:00	3	3.7400	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10483	WHITC	7	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-25 00:00:00	2	7.6400	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10484	BSBEV	3	1997-03-24 00:00:00	1997-04-21 00:00:00	1997-04-01 00:00:00	3	3.4400	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10485	LINOD	4	1997-03-25 00:00:00	1997-04-08 00:00:00	1997-03-31 00:00:00	2	32.2250	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10486	HILAA	1	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-04-02 00:00:00	2	15.2650	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10487	QUEEN	2	1997-03-26 00:00:00	1997-04-23 00:00:00	1997-03-28 00:00:00	2	35.5350	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10488	FRANK	8	1997-03-27 00:00:00	1997-04-24 00:00:00	1997-04-02 00:00:00	2	2.4650	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10489	PICCO	6	1997-03-28 00:00:00	1997-04-25 00:00:00	1997-04-09 00:00:00	2	2.6450	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10490	HILAA	7	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-03 00:00:00	2	105.0950	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10491	FURIB	8	1997-03-31 00:00:00	1997-04-28 00:00:00	1997-04-08 00:00:00	3	8.4800	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10492	BOTTM	3	1997-04-01 00:00:00	1997-04-29 00:00:00	1997-04-11 00:00:00	1	31.4450	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10493	LAMAI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-10 00:00:00	3	5.3200	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10494	COMMI	4	1997-04-02 00:00:00	1997-04-30 00:00:00	1997-04-09 00:00:00	2	32.9950	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brasilien
10495	LAUGB	3	1997-04-03 00:00:00	1997-05-01 00:00:00	1997-04-11 00:00:00	3	2.3250	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Kanada
10496	TRADH	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00	2	23.3850	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brasilien
10497	LEHMS	7	1997-04-04 00:00:00	1997-05-02 00:00:00	1997-04-07 00:00:00	1	18.1050	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10498	HILAA	8	1997-04-07 00:00:00	1997-05-05 00:00:00	1997-04-11 00:00:00	2	14.8750	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10499	LILAS	4	1997-04-08 00:00:00	1997-05-06 00:00:00	1997-04-16 00:00:00	2	51.0100	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10500	LAMAI	6	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-17 00:00:00	1	21.3400	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10501	BLAUS	9	1997-04-09 00:00:00	1997-05-07 00:00:00	1997-04-16 00:00:00	3	4.4250	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Deutschland
10502	PERIC	2	1997-04-10 00:00:00	1997-05-08 00:00:00	1997-04-29 00:00:00	1	34.6600	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexiko
10503	HUNGO	6	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-16 00:00:00	2	8.3700	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10504	WHITC	4	1997-04-11 00:00:00	1997-05-09 00:00:00	1997-04-18 00:00:00	3	29.5650	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10505	MEREP	3	1997-04-14 00:00:00	1997-05-12 00:00:00	1997-04-21 00:00:00	3	3.5650	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10506	KOENE	9	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-05-02 00:00:00	2	10.5950	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10507	ANTON	7	1997-04-15 00:00:00	1997-05-13 00:00:00	1997-04-22 00:00:00	1	23.7250	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexiko
10508	OTTIK	1	1997-04-16 00:00:00	1997-05-14 00:00:00	1997-05-13 00:00:00	2	2.4950	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10509	BLAUS	4	1997-04-17 00:00:00	1997-05-15 00:00:00	1997-04-29 00:00:00	1	0.0750	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Deutschland
10510	SAVEA	6	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-28 00:00:00	3	183.8150	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10511	BONAP	4	1997-04-18 00:00:00	1997-05-16 00:00:00	1997-04-21 00:00:00	3	175.3200	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10512	FAMIA	7	1997-04-21 00:00:00	1997-05-19 00:00:00	1997-04-24 00:00:00	2	1.7650	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien
10513	WANDK	7	1997-04-22 00:00:00	1997-06-03 00:00:00	1997-04-28 00:00:00	1	52.8250	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10514	ERNSH	3	1997-04-22 00:00:00	1997-05-20 00:00:00	1997-05-16 00:00:00	2	394.9750	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10515	QUICK	2	1997-04-23 00:00:00	1997-05-07 00:00:00	1997-05-23 00:00:00	1	102.2350	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10516	HUNGO	2	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-05-01 00:00:00	3	31.3900	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10517	NORTS	3	1997-04-24 00:00:00	1997-05-22 00:00:00	1997-04-29 00:00:00	3	16.0350	North/South	South House\\r\\n300 Queensbridge	London	\N	SW7 1RZ	Großbritannien
10518	TORTU	4	1997-04-25 00:00:00	1997-05-09 00:00:00	1997-05-05 00:00:00	2	109.0750	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10519	CHOPS	6	1997-04-28 00:00:00	1997-05-26 00:00:00	1997-05-01 00:00:00	3	45.8800	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
10520	SANTG	7	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-01 00:00:00	1	6.6850	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norwegen
10521	CACTU	8	1997-04-29 00:00:00	1997-05-27 00:00:00	1997-05-02 00:00:00	2	8.6100	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentinien
10522	LEHMS	4	1997-04-30 00:00:00	1997-05-28 00:00:00	1997-05-06 00:00:00	1	22.6650	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10523	SEVES	7	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-30 00:00:00	2	38.8150	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10524	BERGS	1	1997-05-01 00:00:00	1997-05-29 00:00:00	1997-05-07 00:00:00	2	122.3950	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10525	BONAP	1	1997-05-02 00:00:00	1997-05-30 00:00:00	1997-05-23 00:00:00	2	5.5300	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10526	WARTH	4	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-15 00:00:00	2	29.2950	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10527	QUICK	7	1997-05-05 00:00:00	1997-06-02 00:00:00	1997-05-07 00:00:00	1	20.9500	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10528	GREAL	6	1997-05-06 00:00:00	1997-05-20 00:00:00	1997-05-09 00:00:00	2	1.6750	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10529	MAISD	5	1997-05-07 00:00:00	1997-06-04 00:00:00	1997-05-09 00:00:00	2	33.3450	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien
10530	PICCO	3	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-12 00:00:00	2	169.6100	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10531	OCEAN	7	1997-05-08 00:00:00	1997-06-05 00:00:00	1997-05-19 00:00:00	1	4.0600	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\\r\\nPiso 20-A	Buenos Aires	\N	1010	Argentinien
10532	EASTC	7	1997-05-09 00:00:00	1997-06-06 00:00:00	1997-05-12 00:00:00	3	37.2300	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
10533	FOLKO	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-22 00:00:00	1	94.0200	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10534	LEHMS	8	1997-05-12 00:00:00	1997-06-09 00:00:00	1997-05-14 00:00:00	2	13.9700	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10535	ANTON	4	1997-05-13 00:00:00	1997-06-10 00:00:00	1997-05-21 00:00:00	1	7.8200	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexiko
10536	LEHMS	3	1997-05-14 00:00:00	1997-06-11 00:00:00	1997-06-06 00:00:00	2	29.4400	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10537	RICSU	1	1997-05-14 00:00:00	1997-05-28 00:00:00	1997-05-19 00:00:00	1	39.4250	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10538	BSBEV	9	1997-05-15 00:00:00	1997-06-12 00:00:00	1997-05-16 00:00:00	3	2.4350	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10539	BSBEV	6	1997-05-16 00:00:00	1997-06-13 00:00:00	1997-05-23 00:00:00	3	6.1800	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10540	QUICK	3	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-06-13 00:00:00	3	503.8200	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10541	HANAR	2	1997-05-19 00:00:00	1997-06-16 00:00:00	1997-05-29 00:00:00	1	34.3250	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10542	KOENE	1	1997-05-20 00:00:00	1997-06-17 00:00:00	1997-05-26 00:00:00	3	5.4750	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10543	LILAS	8	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-23 00:00:00	2	24.0850	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10544	LONEP	4	1997-05-21 00:00:00	1997-06-18 00:00:00	1997-05-30 00:00:00	1	12.4550	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10545	LAZYK	8	1997-05-22 00:00:00	1997-06-19 00:00:00	1997-06-26 00:00:00	2	5.9600	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10546	VICTE	1	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-05-27 00:00:00	3	97.3600	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10547	SEVES	3	1997-05-23 00:00:00	1997-06-20 00:00:00	1997-06-02 00:00:00	2	89.2150	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10548	TOMSP	3	1997-05-26 00:00:00	1997-06-23 00:00:00	1997-06-02 00:00:00	2	0.7150	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Deutschland
10549	QUICK	5	1997-05-27 00:00:00	1997-06-10 00:00:00	1997-05-30 00:00:00	1	85.6200	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10550	GODOS	7	1997-05-28 00:00:00	1997-06-25 00:00:00	1997-06-06 00:00:00	3	2.1600	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10551	FURIB	4	1997-05-28 00:00:00	1997-07-09 00:00:00	1997-06-06 00:00:00	3	36.4750	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10552	HILAA	2	1997-05-29 00:00:00	1997-06-26 00:00:00	1997-06-05 00:00:00	1	41.6100	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10553	WARTH	2	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-03 00:00:00	2	74.7450	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10554	OTTIK	4	1997-05-30 00:00:00	1997-06-27 00:00:00	1997-06-05 00:00:00	3	60.4850	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10555	SAVEA	6	1997-06-02 00:00:00	1997-06-30 00:00:00	1997-06-04 00:00:00	3	126.2450	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10556	SIMOB	2	1997-06-03 00:00:00	1997-07-15 00:00:00	1997-06-13 00:00:00	1	4.9000	Simons bistro	Vinbæltet 34	København	\N	1734	Dänemark
10557	LEHMS	9	1997-06-03 00:00:00	1997-06-17 00:00:00	1997-06-06 00:00:00	2	48.3600	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10558	AROUT	1	1997-06-04 00:00:00	1997-07-02 00:00:00	1997-06-10 00:00:00	2	36.4850	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10559	BLONP	6	1997-06-05 00:00:00	1997-07-03 00:00:00	1997-06-13 00:00:00	1	4.0250	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10560	FRANK	8	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00	1	18.3250	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10561	FOLKO	2	1997-06-06 00:00:00	1997-07-04 00:00:00	1997-06-09 00:00:00	2	121.1050	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10562	REGGC	1	1997-06-09 00:00:00	1997-07-07 00:00:00	1997-06-12 00:00:00	1	11.4750	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10563	RICAR	2	1997-06-10 00:00:00	1997-07-22 00:00:00	1997-06-24 00:00:00	2	30.2150	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10564	RATTC	4	1997-06-10 00:00:00	1997-07-08 00:00:00	1997-06-16 00:00:00	3	6.8750	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10565	MEREP	8	1997-06-11 00:00:00	1997-07-09 00:00:00	1997-06-18 00:00:00	2	3.5750	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10566	BLONP	9	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-18 00:00:00	1	44.2000	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10567	HUNGO	1	1997-06-12 00:00:00	1997-07-10 00:00:00	1997-06-17 00:00:00	1	16.9850	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10568	GALED	3	1997-06-13 00:00:00	1997-07-11 00:00:00	1997-07-09 00:00:00	3	3.2700	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spanien
10569	RATTC	5	1997-06-16 00:00:00	1997-07-14 00:00:00	1997-07-11 00:00:00	1	29.4900	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10570	MEREP	3	1997-06-17 00:00:00	1997-07-15 00:00:00	1997-06-19 00:00:00	3	94.4950	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10571	ERNSH	8	1997-06-17 00:00:00	1997-07-29 00:00:00	1997-07-04 00:00:00	3	13.0300	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10572	BERGS	3	1997-06-18 00:00:00	1997-07-16 00:00:00	1997-06-25 00:00:00	2	58.2150	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10573	ANTON	7	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-20 00:00:00	3	42.4200	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexiko
10574	TRAIH	4	1997-06-19 00:00:00	1997-07-17 00:00:00	1997-06-30 00:00:00	2	18.8000	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10575	MORGK	5	1997-06-20 00:00:00	1997-07-04 00:00:00	1997-06-30 00:00:00	1	63.6700	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Deutschland
10576	TORTU	3	1997-06-23 00:00:00	1997-07-07 00:00:00	1997-06-30 00:00:00	3	9.2800	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10577	TRAIH	9	1997-06-23 00:00:00	1997-08-04 00:00:00	1997-06-30 00:00:00	2	12.7050	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10578	BSBEV	4	1997-06-24 00:00:00	1997-07-22 00:00:00	1997-07-25 00:00:00	3	14.8000	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10579	LETSS	1	1997-06-25 00:00:00	1997-07-23 00:00:00	1997-07-04 00:00:00	2	6.8650	Let's Stop N Shop	87 Polk St.\\r\\nSuite 5	San Francisco	CA	94117	USA
10580	OTTIK	4	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-01 00:00:00	3	37.9450	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10581	FAMIA	3	1997-06-26 00:00:00	1997-07-24 00:00:00	1997-07-02 00:00:00	1	1.5050	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien
10582	BLAUS	3	1997-06-27 00:00:00	1997-07-25 00:00:00	1997-07-14 00:00:00	2	13.8550	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Deutschland
10583	WARTH	2	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00	2	3.6400	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10584	BLONP	4	1997-06-30 00:00:00	1997-07-28 00:00:00	1997-07-04 00:00:00	1	29.5700	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10585	WELLI	7	1997-07-01 00:00:00	1997-07-29 00:00:00	1997-07-10 00:00:00	1	6.7050	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10586	REGGC	9	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00	1	0.2400	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10587	QUEDE	1	1997-07-02 00:00:00	1997-07-30 00:00:00	1997-07-09 00:00:00	1	31.2600	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10588	QUICK	2	1997-07-03 00:00:00	1997-07-31 00:00:00	1997-07-10 00:00:00	3	97.3350	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10589	GREAL	8	1997-07-04 00:00:00	1997-08-01 00:00:00	1997-07-14 00:00:00	2	2.2100	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10590	MEREP	4	1997-07-07 00:00:00	1997-08-04 00:00:00	1997-07-14 00:00:00	3	22.3850	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10591	VAFFE	1	1997-07-07 00:00:00	1997-07-21 00:00:00	1997-07-16 00:00:00	1	27.9600	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10592	LEHMS	3	1997-07-08 00:00:00	1997-08-05 00:00:00	1997-07-16 00:00:00	1	16.0500	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10593	LEHMS	7	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-08-13 00:00:00	2	87.1000	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10594	OLDWO	3	1997-07-09 00:00:00	1997-08-06 00:00:00	1997-07-16 00:00:00	2	2.6200	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10595	ERNSH	2	1997-07-10 00:00:00	1997-08-07 00:00:00	1997-07-14 00:00:00	1	48.3900	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10596	WHITC	8	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-08-12 00:00:00	1	8.1700	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10597	PICCO	7	1997-07-11 00:00:00	1997-08-08 00:00:00	1997-07-18 00:00:00	3	17.5600	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10598	RATTC	1	1997-07-14 00:00:00	1997-08-11 00:00:00	1997-07-18 00:00:00	3	22.2100	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10599	BSBEV	6	1997-07-15 00:00:00	1997-08-26 00:00:00	1997-07-21 00:00:00	3	14.9900	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10600	HUNGC	4	1997-07-16 00:00:00	1997-08-13 00:00:00	1997-07-21 00:00:00	1	22.5650	Hungry Coyote Import Store	City Center Plaza\\r\\n516 Main St.	Elgin	OR	97827	USA
10601	HILAA	7	1997-07-16 00:00:00	1997-08-27 00:00:00	1997-07-22 00:00:00	1	29.1500	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10602	VAFFE	8	1997-07-17 00:00:00	1997-08-14 00:00:00	1997-07-22 00:00:00	2	1.4600	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10603	SAVEA	8	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-08-08 00:00:00	2	24.3850	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10604	FURIB	1	1997-07-18 00:00:00	1997-08-15 00:00:00	1997-07-29 00:00:00	1	3.7300	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10605	MEREP	1	1997-07-21 00:00:00	1997-08-18 00:00:00	1997-07-29 00:00:00	2	189.5650	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10606	TRADH	4	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-31 00:00:00	3	39.7000	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brasilien
10607	SAVEA	5	1997-07-22 00:00:00	1997-08-19 00:00:00	1997-07-25 00:00:00	1	100.1200	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10608	TOMSP	4	1997-07-23 00:00:00	1997-08-20 00:00:00	1997-08-01 00:00:00	2	13.8950	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Deutschland
10609	DUMON	7	1997-07-24 00:00:00	1997-08-21 00:00:00	1997-07-30 00:00:00	2	0.9250	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	Frankreich
10610	LAMAI	8	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-06 00:00:00	1	13.3900	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10611	WOLZA	6	1997-07-25 00:00:00	1997-08-22 00:00:00	1997-08-01 00:00:00	2	40.3250	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Polen
10612	SAVEA	1	1997-07-28 00:00:00	1997-08-25 00:00:00	1997-08-01 00:00:00	2	272.0400	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10613	HILAA	4	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00	2	4.0550	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10614	BLAUS	8	1997-07-29 00:00:00	1997-08-26 00:00:00	1997-08-01 00:00:00	3	0.9650	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Deutschland
10615	WILMK	2	1997-07-30 00:00:00	1997-08-27 00:00:00	1997-08-06 00:00:00	3	0.3750	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finnland
10616	GREAL	1	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-05 00:00:00	2	58.2650	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10617	GREAL	4	1997-07-31 00:00:00	1997-08-28 00:00:00	1997-08-04 00:00:00	2	9.2650	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10618	MEREP	1	1997-08-01 00:00:00	1997-09-12 00:00:00	1997-08-08 00:00:00	1	77.3400	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10619	MEREP	3	1997-08-04 00:00:00	1997-09-01 00:00:00	1997-08-07 00:00:00	3	45.5250	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10620	LAUGB	2	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-14 00:00:00	3	0.4700	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Kanada
10621	ISLAT	4	1997-08-05 00:00:00	1997-09-02 00:00:00	1997-08-11 00:00:00	2	11.8650	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10622	RICAR	4	1997-08-06 00:00:00	1997-09-03 00:00:00	1997-08-11 00:00:00	3	25.4850	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10623	FRANK	8	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-12 00:00:00	2	48.5900	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10624	THECR	4	1997-08-07 00:00:00	1997-09-04 00:00:00	1997-08-19 00:00:00	2	47.4000	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10625	ANATR	3	1997-08-08 00:00:00	1997-09-05 00:00:00	1997-08-14 00:00:00	1	21.9500	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexiko
10626	BERGS	1	1997-08-11 00:00:00	1997-09-08 00:00:00	1997-08-20 00:00:00	2	69.3450	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10627	SAVEA	8	1997-08-11 00:00:00	1997-09-22 00:00:00	1997-08-21 00:00:00	3	53.7300	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10628	BLONP	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00	3	15.1800	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10629	GODOS	4	1997-08-12 00:00:00	1997-09-09 00:00:00	1997-08-20 00:00:00	3	42.7300	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10630	KOENE	1	1997-08-13 00:00:00	1997-09-10 00:00:00	1997-08-19 00:00:00	2	16.1750	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10631	LAMAI	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-15 00:00:00	1	0.4350	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10632	WANDK	8	1997-08-14 00:00:00	1997-09-11 00:00:00	1997-08-19 00:00:00	1	20.6900	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10633	ERNSH	7	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-18 00:00:00	3	238.9500	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10634	FOLIG	4	1997-08-15 00:00:00	1997-09-12 00:00:00	1997-08-21 00:00:00	3	243.6900	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	Frankreich
10635	MAGAA	8	1997-08-18 00:00:00	1997-09-15 00:00:00	1997-08-21 00:00:00	3	23.7300	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10636	WARTH	4	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00	1	0.5750	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10637	QUEEN	6	1997-08-19 00:00:00	1997-09-16 00:00:00	1997-08-26 00:00:00	1	100.6450	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10638	LINOD	3	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-09-01 00:00:00	1	79.2200	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10639	SANTG	7	1997-08-20 00:00:00	1997-09-17 00:00:00	1997-08-27 00:00:00	3	19.3200	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norwegen
10640	WANDK	4	1997-08-21 00:00:00	1997-09-18 00:00:00	1997-08-28 00:00:00	1	11.7750	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10641	HILAA	4	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-08-26 00:00:00	2	89.8050	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10642	SIMOB	7	1997-08-22 00:00:00	1997-09-19 00:00:00	1997-09-05 00:00:00	3	20.9450	Simons bistro	Vinbæltet 34	København	\N	1734	Dänemark
10643	ALFKI	6	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-02 00:00:00	1	14.7300	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Deutschland
10644	WELLI	3	1997-08-25 00:00:00	1997-09-22 00:00:00	1997-09-01 00:00:00	2	0.0700	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10645	HANAR	4	1997-08-26 00:00:00	1997-09-23 00:00:00	1997-09-02 00:00:00	1	6.2050	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10646	HUNGO	9	1997-08-27 00:00:00	1997-10-08 00:00:00	1997-09-03 00:00:00	3	71.1650	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10647	QUEDE	4	1997-08-27 00:00:00	1997-09-10 00:00:00	1997-09-03 00:00:00	2	22.7700	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10648	RICAR	5	1997-08-28 00:00:00	1997-10-09 00:00:00	1997-09-09 00:00:00	2	7.1250	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10649	MAISD	5	1997-08-28 00:00:00	1997-09-25 00:00:00	1997-08-29 00:00:00	3	3.1000	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien
10650	FAMIA	5	1997-08-29 00:00:00	1997-09-26 00:00:00	1997-09-03 00:00:00	3	88.4050	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien
10651	WANDK	8	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-11 00:00:00	2	10.3000	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10652	GOURL	4	1997-09-01 00:00:00	1997-09-29 00:00:00	1997-09-08 00:00:00	2	3.5700	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10653	FRANK	1	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-19 00:00:00	1	46.6250	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10654	BERGS	5	1997-09-02 00:00:00	1997-09-30 00:00:00	1997-09-11 00:00:00	1	27.6300	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10655	REGGC	1	1997-09-03 00:00:00	1997-10-01 00:00:00	1997-09-11 00:00:00	2	2.2050	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10656	GREAL	6	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-10 00:00:00	1	28.5750	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10657	SAVEA	2	1997-09-04 00:00:00	1997-10-02 00:00:00	1997-09-15 00:00:00	2	176.3450	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10658	QUICK	4	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-08 00:00:00	1	182.0750	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10659	QUEEN	7	1997-09-05 00:00:00	1997-10-03 00:00:00	1997-09-10 00:00:00	2	52.9050	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10660	HUNGC	8	1997-09-08 00:00:00	1997-10-06 00:00:00	1997-10-15 00:00:00	1	55.6450	Hungry Coyote Import Store	City Center Plaza\\r\\n516 Main St.	Elgin	OR	97827	USA
10661	HUNGO	7	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-15 00:00:00	3	8.7750	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10662	LONEP	3	1997-09-09 00:00:00	1997-10-07 00:00:00	1997-09-18 00:00:00	2	0.6400	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10663	BONAP	2	1997-09-10 00:00:00	1997-09-24 00:00:00	1997-10-03 00:00:00	2	56.5750	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10664	FURIB	1	1997-09-10 00:00:00	1997-10-08 00:00:00	1997-09-19 00:00:00	3	0.6350	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10665	LONEP	1	1997-09-11 00:00:00	1997-10-09 00:00:00	1997-09-17 00:00:00	2	13.1550	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10666	RICSU	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-22 00:00:00	2	116.2100	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10667	ERNSH	7	1997-09-12 00:00:00	1997-10-10 00:00:00	1997-09-19 00:00:00	1	39.0450	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10668	WANDK	1	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-23 00:00:00	2	23.6100	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
10669	SIMOB	2	1997-09-15 00:00:00	1997-10-13 00:00:00	1997-09-22 00:00:00	1	12.1950	Simons bistro	Vinbæltet 34	København	\N	1734	Dänemark
10670	FRANK	4	1997-09-16 00:00:00	1997-10-14 00:00:00	1997-09-18 00:00:00	1	101.7400	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10671	FRANR	1	1997-09-17 00:00:00	1997-10-15 00:00:00	1997-09-24 00:00:00	1	15.1700	France restauration	54, rue Royale	Nantes	\N	44000	Frankreich
10672	BERGS	9	1997-09-17 00:00:00	1997-10-01 00:00:00	1997-09-26 00:00:00	2	47.8750	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10673	WILMK	2	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-19 00:00:00	1	11.3800	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finnland
10674	ISLAT	4	1997-09-18 00:00:00	1997-10-16 00:00:00	1997-09-30 00:00:00	2	0.4500	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10675	FRANK	5	1997-09-19 00:00:00	1997-10-17 00:00:00	1997-09-23 00:00:00	2	15.9250	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10676	TORTU	2	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-29 00:00:00	2	1.0050	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10677	ANTON	1	1997-09-22 00:00:00	1997-10-20 00:00:00	1997-09-26 00:00:00	3	2.0150	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexiko
10678	SAVEA	7	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-10-16 00:00:00	3	194.4900	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10679	BLONP	8	1997-09-23 00:00:00	1997-10-21 00:00:00	1997-09-30 00:00:00	3	13.9700	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10680	OLDWO	1	1997-09-24 00:00:00	1997-10-22 00:00:00	1997-09-26 00:00:00	1	13.3050	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10681	GREAL	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-09-30 00:00:00	3	38.0650	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10682	ANTON	3	1997-09-25 00:00:00	1997-10-23 00:00:00	1997-10-01 00:00:00	2	18.0650	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexiko
10683	DUMON	2	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-10-01 00:00:00	1	2.2000	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	Frankreich
10684	OTTIK	3	1997-09-26 00:00:00	1997-10-24 00:00:00	1997-09-30 00:00:00	1	72.8150	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10685	GOURL	4	1997-09-29 00:00:00	1997-10-13 00:00:00	1997-10-03 00:00:00	2	16.8750	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10686	PICCO	2	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-08 00:00:00	1	48.2500	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10687	HUNGO	9	1997-09-30 00:00:00	1997-10-28 00:00:00	1997-10-30 00:00:00	2	148.2150	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10688	VAFFE	4	1997-10-01 00:00:00	1997-10-15 00:00:00	1997-10-07 00:00:00	2	149.5450	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10689	BERGS	1	1997-10-01 00:00:00	1997-10-29 00:00:00	1997-10-07 00:00:00	2	6.7100	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10690	HANAR	1	1997-10-02 00:00:00	1997-10-30 00:00:00	1997-10-03 00:00:00	1	7.9000	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10691	QUICK	2	1997-10-03 00:00:00	1997-11-14 00:00:00	1997-10-22 00:00:00	2	405.0250	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10692	ALFKI	4	1997-10-03 00:00:00	1997-10-31 00:00:00	1997-10-13 00:00:00	2	30.5100	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Deutschland
10693	WHITC	3	1997-10-06 00:00:00	1997-10-20 00:00:00	1997-10-10 00:00:00	3	69.6700	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10694	QUICK	8	1997-10-06 00:00:00	1997-11-03 00:00:00	1997-10-09 00:00:00	3	199.1800	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10695	WILMK	7	1997-10-07 00:00:00	1997-11-18 00:00:00	1997-10-14 00:00:00	1	8.3600	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finnland
10696	WHITC	8	1997-10-08 00:00:00	1997-11-19 00:00:00	1997-10-14 00:00:00	3	51.2750	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10697	LINOD	3	1997-10-08 00:00:00	1997-11-05 00:00:00	1997-10-14 00:00:00	1	22.7600	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10698	ERNSH	4	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-17 00:00:00	1	136.2350	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10699	MORGK	3	1997-10-09 00:00:00	1997-11-06 00:00:00	1997-10-13 00:00:00	3	0.2900	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Deutschland
10700	SAVEA	3	1997-10-10 00:00:00	1997-11-07 00:00:00	1997-10-16 00:00:00	1	32.5500	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10701	HUNGO	6	1997-10-13 00:00:00	1997-10-27 00:00:00	1997-10-15 00:00:00	3	110.1550	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10702	ALFKI	4	1997-10-13 00:00:00	1997-11-24 00:00:00	1997-10-21 00:00:00	1	11.9700	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Deutschland
10703	FOLKO	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-10-20 00:00:00	2	76.1500	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10704	QUEEN	6	1997-10-14 00:00:00	1997-11-11 00:00:00	1997-11-07 00:00:00	1	2.3900	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10705	HILAA	9	1997-10-15 00:00:00	1997-11-12 00:00:00	1997-11-18 00:00:00	2	1.7600	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10706	OLDWO	8	1997-10-16 00:00:00	1997-11-13 00:00:00	1997-10-21 00:00:00	3	67.8150	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10707	AROUT	4	1997-10-16 00:00:00	1997-10-30 00:00:00	1997-10-23 00:00:00	3	10.8700	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10708	THEBI	6	1997-10-17 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00	2	1.4800	The Big Cheese	89 Jefferson Way\\r\\nSuite 2	Portland	OR	97201	USA
10709	GOURL	1	1997-10-17 00:00:00	1997-11-14 00:00:00	1997-11-20 00:00:00	3	105.4000	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10710	FRANS	1	1997-10-20 00:00:00	1997-11-17 00:00:00	1997-10-23 00:00:00	1	2.4900	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italien
10711	SAVEA	5	1997-10-21 00:00:00	1997-12-02 00:00:00	1997-10-29 00:00:00	2	26.2050	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10712	HUNGO	3	1997-10-21 00:00:00	1997-11-18 00:00:00	1997-10-31 00:00:00	1	44.9650	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10713	SAVEA	1	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-24 00:00:00	1	83.5250	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10714	SAVEA	5	1997-10-22 00:00:00	1997-11-19 00:00:00	1997-10-27 00:00:00	3	12.2450	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10715	BONAP	3	1997-10-23 00:00:00	1997-11-06 00:00:00	1997-10-29 00:00:00	1	31.6000	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10716	RANCH	4	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-27 00:00:00	2	11.2850	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentinien
10717	FRANK	1	1997-10-24 00:00:00	1997-11-21 00:00:00	1997-10-29 00:00:00	2	29.6250	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10718	KOENE	1	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-10-29 00:00:00	3	85.4400	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10719	LETSS	8	1997-10-27 00:00:00	1997-11-24 00:00:00	1997-11-05 00:00:00	2	25.7200	Let's Stop N Shop	87 Polk St.\\r\\nSuite 5	San Francisco	CA	94117	USA
10720	QUEDE	8	1997-10-28 00:00:00	1997-11-11 00:00:00	1997-11-05 00:00:00	2	4.7650	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10721	QUICK	5	1997-10-29 00:00:00	1997-11-26 00:00:00	1997-10-31 00:00:00	3	24.4600	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10722	SAVEA	8	1997-10-29 00:00:00	1997-12-10 00:00:00	1997-11-04 00:00:00	1	37.2900	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10723	WHITC	3	1997-10-30 00:00:00	1997-11-27 00:00:00	1997-11-25 00:00:00	1	10.8600	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10724	MEREP	8	1997-10-30 00:00:00	1997-12-11 00:00:00	1997-11-05 00:00:00	2	28.8750	Mère Paillarde	43 rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada
10725	FAMIA	4	1997-10-31 00:00:00	1997-11-28 00:00:00	1997-11-05 00:00:00	3	5.4150	Familia Arquibaldo	Rua Orós, 92	São Paulo	SP	05442-030	Brasilien
10726	EASTC	4	1997-11-03 00:00:00	1997-11-17 00:00:00	1997-12-05 00:00:00	1	8.2800	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
10727	REGGC	2	1997-11-03 00:00:00	1997-12-01 00:00:00	1997-12-05 00:00:00	1	44.9500	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10728	QUEEN	4	1997-11-04 00:00:00	1997-12-02 00:00:00	1997-11-11 00:00:00	2	29.1650	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10729	LINOD	8	1997-11-04 00:00:00	1997-12-16 00:00:00	1997-11-14 00:00:00	3	70.5300	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10730	BONAP	5	1997-11-05 00:00:00	1997-12-03 00:00:00	1997-11-14 00:00:00	1	10.0600	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10731	CHOPS	7	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-14 00:00:00	1	48.3250	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
10732	BONAP	3	1997-11-06 00:00:00	1997-12-04 00:00:00	1997-11-07 00:00:00	1	8.4850	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10733	BERGS	1	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-10 00:00:00	3	55.0550	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10734	GOURL	2	1997-11-07 00:00:00	1997-12-05 00:00:00	1997-11-12 00:00:00	3	0.8150	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10735	LETSS	6	1997-11-10 00:00:00	1997-12-08 00:00:00	1997-11-21 00:00:00	2	22.9850	Let's Stop N Shop	87 Polk St.\\r\\nSuite 5	San Francisco	CA	94117	USA
10736	HUNGO	9	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-21 00:00:00	2	22.0500	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10737	VINET	2	1997-11-11 00:00:00	1997-12-09 00:00:00	1997-11-18 00:00:00	2	3.8950	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	Frankreich
10738	SPECD	2	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-18 00:00:00	1	1.4550	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	Frankreich
10739	VINET	3	1997-11-12 00:00:00	1997-12-10 00:00:00	1997-11-17 00:00:00	3	5.5400	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	\N	51100	Frankreich
10740	WHITC	4	1997-11-13 00:00:00	1997-12-11 00:00:00	1997-11-25 00:00:00	2	40.9400	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10741	AROUT	4	1997-11-14 00:00:00	1997-11-28 00:00:00	1997-11-18 00:00:00	3	5.4800	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10742	BOTTM	3	1997-11-14 00:00:00	1997-12-12 00:00:00	1997-11-18 00:00:00	3	121.8650	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10743	AROUT	1	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-21 00:00:00	2	11.8600	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10744	VAFFE	6	1997-11-17 00:00:00	1997-12-15 00:00:00	1997-11-24 00:00:00	1	34.5950	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10745	QUICK	9	1997-11-18 00:00:00	1997-12-16 00:00:00	1997-11-27 00:00:00	1	1.7600	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10746	CHOPS	1	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-21 00:00:00	3	15.7150	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
10747	PICCO	6	1997-11-19 00:00:00	1997-12-17 00:00:00	1997-11-26 00:00:00	1	58.6650	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10748	SAVEA	3	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-11-28 00:00:00	1	116.2750	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10749	ISLAT	4	1997-11-20 00:00:00	1997-12-18 00:00:00	1997-12-19 00:00:00	2	30.7650	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10750	WARTH	9	1997-11-21 00:00:00	1997-12-19 00:00:00	1997-11-24 00:00:00	1	39.6500	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10751	RICSU	3	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-12-03 00:00:00	3	65.3950	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10752	NORTS	2	1997-11-24 00:00:00	1997-12-22 00:00:00	1997-11-28 00:00:00	3	0.6950	North/South	South House\\r\\n300 Queensbridge	London	\N	SW7 1RZ	Großbritannien
10753	FRANS	3	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00	1	3.8500	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italien
10754	MAGAA	6	1997-11-25 00:00:00	1997-12-23 00:00:00	1997-11-27 00:00:00	3	1.1900	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10755	BONAP	4	1997-11-26 00:00:00	1997-12-24 00:00:00	1997-11-28 00:00:00	2	8.3550	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10756	SPLIR	8	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-02 00:00:00	2	36.6050	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10757	SAVEA	6	1997-11-27 00:00:00	1997-12-25 00:00:00	1997-12-15 00:00:00	1	4.0950	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10758	RICSU	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-04 00:00:00	3	69.0850	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10759	ANATR	3	1997-11-28 00:00:00	1997-12-26 00:00:00	1997-12-12 00:00:00	3	5.9950	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexiko
10760	MAISD	4	1997-12-01 00:00:00	1997-12-29 00:00:00	1997-12-10 00:00:00	1	77.8200	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien
10761	RATTC	5	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-08 00:00:00	2	9.3300	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10762	FOLKO	3	1997-12-02 00:00:00	1997-12-30 00:00:00	1997-12-09 00:00:00	1	164.3700	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10763	FOLIG	3	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00	3	18.6750	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	Frankreich
10764	ERNSH	6	1997-12-03 00:00:00	1997-12-31 00:00:00	1997-12-08 00:00:00	3	72.7250	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10765	QUICK	3	1997-12-04 00:00:00	1998-01-01 00:00:00	1997-12-09 00:00:00	3	21.3700	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10766	OTTIK	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-09 00:00:00	1	78.7750	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10767	SUPRD	4	1997-12-05 00:00:00	1998-01-02 00:00:00	1997-12-15 00:00:00	3	0.7950	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10768	AROUT	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-15 00:00:00	2	73.1600	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10769	VAFFE	3	1997-12-08 00:00:00	1998-01-05 00:00:00	1997-12-12 00:00:00	1	32.5300	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10770	HANAR	8	1997-12-09 00:00:00	1998-01-06 00:00:00	1997-12-17 00:00:00	3	2.6600	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10771	ERNSH	9	1997-12-10 00:00:00	1998-01-07 00:00:00	1998-01-02 00:00:00	2	5.5950	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10772	LEHMS	3	1997-12-10 00:00:00	1998-01-07 00:00:00	1997-12-19 00:00:00	2	45.6400	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10773	ERNSH	1	1997-12-11 00:00:00	1998-01-08 00:00:00	1997-12-16 00:00:00	3	48.2150	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10774	FOLKO	4	1997-12-11 00:00:00	1997-12-25 00:00:00	1997-12-12 00:00:00	1	24.1000	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10775	THECR	7	1997-12-12 00:00:00	1998-01-09 00:00:00	1997-12-26 00:00:00	1	10.1250	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10776	ERNSH	1	1997-12-15 00:00:00	1998-01-12 00:00:00	1997-12-18 00:00:00	3	175.7650	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10777	GOURL	7	1997-12-15 00:00:00	1997-12-29 00:00:00	1998-01-21 00:00:00	2	1.5050	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10778	BERGS	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1997-12-24 00:00:00	1	3.3950	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10779	MORGK	3	1997-12-16 00:00:00	1998-01-13 00:00:00	1998-01-14 00:00:00	2	29.0650	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Deutschland
10780	LILAS	2	1997-12-16 00:00:00	1997-12-30 00:00:00	1997-12-25 00:00:00	1	21.0650	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10781	WARTH	2	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-19 00:00:00	3	36.5800	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
10782	CACTU	9	1997-12-17 00:00:00	1998-01-14 00:00:00	1997-12-22 00:00:00	3	0.5500	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentinien
10783	HANAR	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-19 00:00:00	2	62.4900	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10784	MAGAA	4	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-22 00:00:00	3	35.0450	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10785	GROSR	1	1997-12-18 00:00:00	1998-01-15 00:00:00	1997-12-24 00:00:00	3	0.7550	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10786	QUEEN	8	1997-12-19 00:00:00	1998-01-16 00:00:00	1997-12-23 00:00:00	1	55.4350	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10787	LAMAI	2	1997-12-19 00:00:00	1998-01-02 00:00:00	1997-12-26 00:00:00	1	124.9650	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10788	QUICK	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1998-01-19 00:00:00	2	21.3500	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10789	FOLIG	1	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-31 00:00:00	2	50.3000	Folies gourmandes	184, chaussée de Tournai	Lille	\N	59000	Frankreich
10790	GOURL	6	1997-12-22 00:00:00	1998-01-19 00:00:00	1997-12-26 00:00:00	1	14.1150	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10791	FRANK	6	1997-12-23 00:00:00	1998-01-20 00:00:00	1998-01-01 00:00:00	2	8.4250	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10792	WOLZA	1	1997-12-23 00:00:00	1998-01-20 00:00:00	1997-12-31 00:00:00	3	11.8950	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Polen
10793	AROUT	3	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-08 00:00:00	3	2.2600	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10794	QUEDE	6	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-02 00:00:00	1	10.7450	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10795	ERNSH	8	1997-12-24 00:00:00	1998-01-21 00:00:00	1998-01-20 00:00:00	2	63.3300	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10796	HILAA	3	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-14 00:00:00	1	13.2600	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10797	DRACD	7	1997-12-25 00:00:00	1998-01-22 00:00:00	1998-01-05 00:00:00	2	16.6750	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Deutschland
10798	ISLAT	2	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00	1	1.1650	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10799	KOENE	9	1997-12-26 00:00:00	1998-02-06 00:00:00	1998-01-05 00:00:00	3	15.3800	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10800	SEVES	1	1997-12-26 00:00:00	1998-01-23 00:00:00	1998-01-05 00:00:00	3	68.7200	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10801	BOLID	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1997-12-31 00:00:00	2	48.5450	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spanien
10802	SIMOB	4	1997-12-29 00:00:00	1998-01-26 00:00:00	1998-01-02 00:00:00	2	128.6300	Simons bistro	Vinbæltet 34	København	\N	1734	Dänemark
10803	WELLI	4	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-06 00:00:00	1	27.6150	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10804	SEVES	6	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-07 00:00:00	2	13.6650	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10805	THEBI	2	1997-12-30 00:00:00	1998-01-27 00:00:00	1998-01-09 00:00:00	3	118.6700	The Big Cheese	89 Jefferson Way\\r\\nSuite 2	Portland	OR	97201	USA
10806	VICTE	3	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-05 00:00:00	2	11.0550	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10807	FRANS	4	1997-12-31 00:00:00	1998-01-28 00:00:00	1998-01-30 00:00:00	1	0.6800	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italien
10808	OLDWO	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-09 00:00:00	3	22.7650	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10809	WELLI	7	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00	1	2.4350	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10810	LAUGB	2	1998-01-01 00:00:00	1998-01-29 00:00:00	1998-01-07 00:00:00	3	2.1650	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Kanada
10811	LINOD	8	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-08 00:00:00	1	15.6100	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10812	REGGC	5	1998-01-02 00:00:00	1998-01-30 00:00:00	1998-01-12 00:00:00	1	29.8900	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10813	RICAR	1	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-09 00:00:00	1	23.6900	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10814	VICTE	3	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00	3	65.4700	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10815	SAVEA	2	1998-01-05 00:00:00	1998-02-02 00:00:00	1998-01-14 00:00:00	3	7.3100	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10816	GREAL	4	1998-01-06 00:00:00	1998-02-03 00:00:00	1998-02-04 00:00:00	2	359.8900	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10817	KOENE	3	1998-01-06 00:00:00	1998-01-20 00:00:00	1998-01-13 00:00:00	2	153.0350	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10818	MAGAA	7	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-12 00:00:00	3	32.7400	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10819	CACTU	2	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-16 00:00:00	3	9.8800	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentinien
10820	RATTC	3	1998-01-07 00:00:00	1998-02-04 00:00:00	1998-01-13 00:00:00	2	18.7600	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10821	SPLIR	1	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-15 00:00:00	1	18.3400	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10822	TRAIH	6	1998-01-08 00:00:00	1998-02-05 00:00:00	1998-01-16 00:00:00	3	3.5000	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10823	LILAS	5	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-13 00:00:00	2	81.9850	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10824	FOLKO	8	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-30 00:00:00	1	0.6150	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10825	DRACD	1	1998-01-09 00:00:00	1998-02-06 00:00:00	1998-01-14 00:00:00	1	39.6250	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Deutschland
10826	BLONP	6	1998-01-12 00:00:00	1998-02-09 00:00:00	1998-02-06 00:00:00	1	3.5450	Blondel père et fils	24, place Kléber	Strasbourg	\N	67000	Frankreich
10827	BONAP	1	1998-01-12 00:00:00	1998-01-26 00:00:00	1998-02-06 00:00:00	2	31.7700	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10828	RANCH	9	1998-01-13 00:00:00	1998-01-27 00:00:00	1998-02-04 00:00:00	1	45.4250	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentinien
10829	ISLAT	9	1998-01-13 00:00:00	1998-02-10 00:00:00	1998-01-23 00:00:00	1	77.3600	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10830	TRADH	4	1998-01-13 00:00:00	1998-02-24 00:00:00	1998-01-21 00:00:00	2	40.9150	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brasilien
10831	SANTG	3	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-23 00:00:00	2	36.0950	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norwegen
10832	LAMAI	2	1998-01-14 00:00:00	1998-02-11 00:00:00	1998-01-19 00:00:00	2	21.6300	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10833	OTTIK	6	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-23 00:00:00	2	35.7450	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
10834	TRADH	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-19 00:00:00	3	14.8900	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brasilien
10835	ALFKI	1	1998-01-15 00:00:00	1998-02-12 00:00:00	1998-01-21 00:00:00	3	34.7650	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Deutschland
10836	ERNSH	7	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-21 00:00:00	1	205.9400	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10837	BERGS	9	1998-01-16 00:00:00	1998-02-13 00:00:00	1998-01-23 00:00:00	3	6.6600	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10838	LINOD	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-23 00:00:00	3	29.6400	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10839	TRADH	3	1998-01-19 00:00:00	1998-02-16 00:00:00	1998-01-22 00:00:00	3	17.7150	Tradição Hipermercados	Av. Inês de Castro, 414	São Paulo	SP	05634-030	Brasilien
10840	LINOD	4	1998-01-19 00:00:00	1998-03-02 00:00:00	1998-02-16 00:00:00	2	1.3550	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10841	SUPRD	5	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00	2	212.1500	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10842	TORTU	1	1998-01-20 00:00:00	1998-02-17 00:00:00	1998-01-29 00:00:00	3	27.2100	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10843	VICTE	4	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00	2	4.6300	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10844	PICCO	8	1998-01-21 00:00:00	1998-02-18 00:00:00	1998-01-26 00:00:00	2	12.6100	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
10845	QUICK	8	1998-01-21 00:00:00	1998-02-04 00:00:00	1998-01-30 00:00:00	1	106.4900	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10846	SUPRD	2	1998-01-22 00:00:00	1998-03-05 00:00:00	1998-01-23 00:00:00	3	28.2300	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10847	SAVEA	4	1998-01-22 00:00:00	1998-02-05 00:00:00	1998-02-10 00:00:00	3	243.7850	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10848	CONSH	7	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-29 00:00:00	2	19.1200	Consolidated Holdings	Berkeley Gardens\\r\\n12  Brewery 	London	\N	WX1 6LT	Großbritannien
10849	KOENE	9	1998-01-23 00:00:00	1998-02-20 00:00:00	1998-01-30 00:00:00	2	0.2800	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10850	VICTE	1	1998-01-23 00:00:00	1998-03-06 00:00:00	1998-01-30 00:00:00	1	24.5950	Victuailles en stock	2, rue du Commerce	Lyon	\N	69004	Frankreich
10851	RICAR	5	1998-01-26 00:00:00	1998-02-23 00:00:00	1998-02-02 00:00:00	1	80.2750	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10852	RATTC	8	1998-01-26 00:00:00	1998-02-09 00:00:00	1998-01-30 00:00:00	1	87.0250	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10853	BLAUS	9	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-03 00:00:00	2	26.9150	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Deutschland
10854	ERNSH	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-05 00:00:00	2	50.1100	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10855	OLDWO	3	1998-01-27 00:00:00	1998-02-24 00:00:00	1998-02-04 00:00:00	1	85.4850	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10856	ANTON	3	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-10 00:00:00	2	29.2150	Antonio Moreno Taquería	Mataderos  2312	México D.F.	\N	05023	Mexiko
10857	BERGS	8	1998-01-28 00:00:00	1998-02-25 00:00:00	1998-02-06 00:00:00	2	94.4250	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10858	LACOR	2	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-03 00:00:00	1	26.2550	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	Frankreich
10859	FRANK	1	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-02 00:00:00	2	38.0500	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10860	FRANR	3	1998-01-29 00:00:00	1998-02-26 00:00:00	1998-02-04 00:00:00	3	9.6300	France restauration	54, rue Royale	Nantes	\N	44000	Frankreich
10861	WHITC	4	1998-01-30 00:00:00	1998-02-27 00:00:00	1998-02-17 00:00:00	2	7.4650	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10862	LEHMS	8	1998-01-30 00:00:00	1998-03-13 00:00:00	1998-02-02 00:00:00	2	26.6150	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10863	HILAA	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-17 00:00:00	2	15.1300	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10864	AROUT	4	1998-02-02 00:00:00	1998-03-02 00:00:00	1998-02-09 00:00:00	2	1.5200	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10865	QUICK	2	1998-02-02 00:00:00	1998-02-16 00:00:00	1998-02-12 00:00:00	1	174.0700	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10866	BERGS	5	1998-02-03 00:00:00	1998-03-03 00:00:00	1998-02-12 00:00:00	1	54.5550	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10867	LONEP	6	1998-02-03 00:00:00	1998-03-17 00:00:00	1998-02-11 00:00:00	1	0.9650	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10868	QUEEN	7	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-23 00:00:00	2	95.6350	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10869	SEVES	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-09 00:00:00	1	71.6400	Seven Seas Imports	90 Wadhurst Rd.	London	\N	OX15 4NB	Großbritannien
10870	WOLZA	5	1998-02-04 00:00:00	1998-03-04 00:00:00	1998-02-13 00:00:00	3	6.0200	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Polen
10871	BONAP	9	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-10 00:00:00	2	56.1350	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10872	GODOS	5	1998-02-05 00:00:00	1998-03-05 00:00:00	1998-02-09 00:00:00	2	87.6600	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10873	WILMK	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-09 00:00:00	1	0.4100	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finnland
10874	GODOS	5	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-02-11 00:00:00	2	9.7900	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10875	BERGS	4	1998-02-06 00:00:00	1998-03-06 00:00:00	1998-03-03 00:00:00	2	16.1850	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10876	BONAP	7	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-12 00:00:00	3	30.2100	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10877	RICAR	1	1998-02-09 00:00:00	1998-03-09 00:00:00	1998-02-19 00:00:00	1	19.0300	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
10878	QUICK	4	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00	1	23.3450	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10879	WILMK	3	1998-02-10 00:00:00	1998-03-10 00:00:00	1998-02-12 00:00:00	3	4.2500	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finnland
10880	FOLKO	7	1998-02-10 00:00:00	1998-03-24 00:00:00	1998-02-18 00:00:00	1	44.0050	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10881	CACTU	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-18 00:00:00	1	1.4200	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentinien
10882	SAVEA	4	1998-02-11 00:00:00	1998-03-11 00:00:00	1998-02-20 00:00:00	3	11.5500	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10883	LONEP	8	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-20 00:00:00	3	0.2650	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10884	LETSS	4	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-13 00:00:00	2	45.4850	Let's Stop N Shop	87 Polk St.\\r\\nSuite 5	San Francisco	CA	94117	USA
10885	SUPRD	6	1998-02-12 00:00:00	1998-03-12 00:00:00	1998-02-18 00:00:00	3	2.8200	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10886	HANAR	1	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-03-02 00:00:00	1	2.4950	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10887	GALED	8	1998-02-13 00:00:00	1998-03-13 00:00:00	1998-02-16 00:00:00	3	0.6250	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spanien
10888	GODOS	1	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00	2	25.9350	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10889	RATTC	9	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-23 00:00:00	3	140.3050	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10890	DUMON	7	1998-02-16 00:00:00	1998-03-16 00:00:00	1998-02-18 00:00:00	1	16.3800	Du monde entier	67, rue des Cinquante Otages	Nantes	\N	44000	Frankreich
10891	LEHMS	7	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00	2	10.1850	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10892	MAISD	4	1998-02-17 00:00:00	1998-03-17 00:00:00	1998-02-19 00:00:00	2	60.1350	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien
10893	KOENE	9	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00	2	38.8900	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
10894	SAVEA	1	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-20 00:00:00	1	58.0650	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10895	ERNSH	3	1998-02-18 00:00:00	1998-03-18 00:00:00	1998-02-23 00:00:00	1	81.3750	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10896	MAISD	7	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-27 00:00:00	3	16.2250	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien
10897	HUNGO	3	1998-02-19 00:00:00	1998-03-19 00:00:00	1998-02-25 00:00:00	2	301.7700	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10898	OCEAN	4	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-06 00:00:00	2	0.6350	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\\r\\nPiso 20-A	Buenos Aires	\N	1010	Argentinien
10899	LILAS	5	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-02-26 00:00:00	3	0.6050	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10900	WELLI	1	1998-02-20 00:00:00	1998-03-20 00:00:00	1998-03-04 00:00:00	2	0.8300	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10901	HILAA	4	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-02-26 00:00:00	1	31.0450	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10902	FOLKO	1	1998-02-23 00:00:00	1998-03-23 00:00:00	1998-03-03 00:00:00	1	22.0750	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10903	HANAR	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-04 00:00:00	3	18.3550	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10904	WHITC	3	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-02-27 00:00:00	3	81.4750	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10905	WELLI	9	1998-02-24 00:00:00	1998-03-24 00:00:00	1998-03-06 00:00:00	2	6.8600	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10906	WOLZA	4	1998-02-25 00:00:00	1998-03-11 00:00:00	1998-03-03 00:00:00	3	13.1450	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Polen
10907	SPECD	6	1998-02-25 00:00:00	1998-03-25 00:00:00	1998-02-27 00:00:00	3	4.5950	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	Frankreich
10908	REGGC	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-06 00:00:00	2	16.4800	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10909	SANTG	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-10 00:00:00	2	26.5250	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norwegen
10910	WILMK	1	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00	3	19.0550	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finnland
10911	GODOS	3	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-05 00:00:00	1	19.0950	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10912	HUNGO	2	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-18 00:00:00	2	290.4550	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10913	QUEEN	4	1998-02-26 00:00:00	1998-03-26 00:00:00	1998-03-04 00:00:00	1	16.5250	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10914	QUEEN	6	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00	1	10.5950	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10915	TORTU	2	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-02 00:00:00	2	1.7550	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
10916	RANCH	1	1998-02-27 00:00:00	1998-03-27 00:00:00	1998-03-09 00:00:00	2	31.8850	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentinien
10917	ROMEY	4	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00	2	4.1450	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spanien
10918	BOTTM	3	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-11 00:00:00	3	24.4150	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10919	LINOD	2	1998-03-02 00:00:00	1998-03-30 00:00:00	1998-03-04 00:00:00	2	9.9000	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10920	AROUT	4	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-09 00:00:00	2	14.8050	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10921	VAFFE	1	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-09 00:00:00	1	88.2400	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10922	HANAR	5	1998-03-03 00:00:00	1998-03-31 00:00:00	1998-03-05 00:00:00	3	31.3700	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10923	LAMAI	7	1998-03-03 00:00:00	1998-04-14 00:00:00	1998-03-13 00:00:00	3	34.1300	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
10924	BERGS	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-04-08 00:00:00	2	75.7600	Berglunds snabbköp	Berguvsvägen  8	Luleå	\N	S-958 22	Schweden
10925	HANAR	3	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-13 00:00:00	1	1.1350	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10926	ANATR	4	1998-03-04 00:00:00	1998-04-01 00:00:00	1998-03-11 00:00:00	3	19.9600	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	\N	05021	Mexiko
10927	LACOR	4	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00	1	9.8950	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	Frankreich
10928	GALED	1	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-18 00:00:00	1	0.6800	Galería del gastronómo	Rambla de Cataluña, 23	Barcelona	\N	8022	Spanien
10929	FRANK	6	1998-03-05 00:00:00	1998-04-02 00:00:00	1998-03-12 00:00:00	1	16.9650	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
10930	SUPRD	4	1998-03-06 00:00:00	1998-04-17 00:00:00	1998-03-18 00:00:00	3	7.7750	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
10931	RICSU	4	1998-03-06 00:00:00	1998-03-20 00:00:00	1998-03-19 00:00:00	2	6.8000	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10932	BONAP	8	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-24 00:00:00	1	67.3200	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10933	ISLAT	6	1998-03-06 00:00:00	1998-04-03 00:00:00	1998-03-16 00:00:00	3	27.0750	Island Trading	Garden House\\r\\nCrowther Way	Cowes	Isle of Wight	PO31 7PJ	Großbritannien
10934	LEHMS	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-12 00:00:00	3	16.0050	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
10935	WELLI	4	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00	3	23.7950	Wellington Importadora	Rua do Mercado, 12	Resende	SP	08737-363	Brasilien
10936	GREAL	3	1998-03-09 00:00:00	1998-04-06 00:00:00	1998-03-18 00:00:00	2	16.8400	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10937	CACTU	7	1998-03-10 00:00:00	1998-03-24 00:00:00	1998-03-13 00:00:00	3	15.7550	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentinien
10938	QUICK	3	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-16 00:00:00	2	15.9450	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10939	MAGAA	2	1998-03-10 00:00:00	1998-04-07 00:00:00	1998-03-13 00:00:00	2	38.1650	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10940	BONAP	8	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-23 00:00:00	3	9.8850	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
10941	SAVEA	7	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-20 00:00:00	2	200.4050	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10942	REGGC	9	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-18 00:00:00	3	8.9750	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
10943	BSBEV	4	1998-03-11 00:00:00	1998-04-08 00:00:00	1998-03-19 00:00:00	2	1.0850	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10944	BOTTM	6	1998-03-12 00:00:00	1998-03-26 00:00:00	1998-03-13 00:00:00	3	26.4600	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10945	MORGK	4	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-18 00:00:00	1	5.1100	Morgenstern Gesundkost	Heerstr. 22	Leipzig	\N	04179	Deutschland
10946	VAFFE	1	1998-03-12 00:00:00	1998-04-09 00:00:00	1998-03-19 00:00:00	2	13.6000	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10947	BSBEV	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-16 00:00:00	2	1.6300	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
10948	GODOS	3	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-19 00:00:00	3	11.6950	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
10949	BOTTM	2	1998-03-13 00:00:00	1998-04-10 00:00:00	1998-03-17 00:00:00	3	37.2200	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10950	MAGAA	1	1998-03-16 00:00:00	1998-04-13 00:00:00	1998-03-23 00:00:00	2	1.2500	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	\N	24100	Italien
10951	RICSU	9	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-04-07 00:00:00	2	15.4250	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
10952	ALFKI	1	1998-03-16 00:00:00	1998-04-27 00:00:00	1998-03-24 00:00:00	1	20.2100	Alfred's Futterkiste	Obere Str. 57	Berlin	\N	12209	Deutschland
10953	AROUT	9	1998-03-16 00:00:00	1998-03-30 00:00:00	1998-03-25 00:00:00	2	11.8600	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
10954	LINOD	5	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00	1	13.9550	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10955	FOLKO	8	1998-03-17 00:00:00	1998-04-14 00:00:00	1998-03-20 00:00:00	2	1.6300	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10956	BLAUS	6	1998-03-17 00:00:00	1998-04-28 00:00:00	1998-03-20 00:00:00	2	22.3250	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Deutschland
10957	HILAA	8	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00	3	52.6800	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10958	OCEAN	7	1998-03-18 00:00:00	1998-04-15 00:00:00	1998-03-27 00:00:00	2	24.7800	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\\r\\nPiso 20-A	Buenos Aires	\N	1010	Argentinien
10959	GOURL	6	1998-03-18 00:00:00	1998-04-29 00:00:00	1998-03-23 00:00:00	2	2.4900	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
10960	HILAA	3	1998-03-19 00:00:00	1998-04-02 00:00:00	1998-04-08 00:00:00	1	1.0400	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10961	QUEEN	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-30 00:00:00	1	52.2350	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
10962	QUICK	8	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-23 00:00:00	2	137.8950	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10963	FURIB	9	1998-03-19 00:00:00	1998-04-16 00:00:00	1998-03-26 00:00:00	3	1.3500	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	\N	1675	Portugal
10964	SPECD	3	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-24 00:00:00	2	43.6900	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	Frankreich
10965	OLDWO	6	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-03-30 00:00:00	3	72.1900	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10966	CHOPS	4	1998-03-20 00:00:00	1998-04-17 00:00:00	1998-04-08 00:00:00	1	13.5950	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
10967	TOMSP	2	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-02 00:00:00	2	31.1100	Toms Spezialitäten	Luisenstr. 48	Münster	\N	44087	Deutschland
10968	ERNSH	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-04-01 00:00:00	3	37.3000	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10969	COMMI	1	1998-03-23 00:00:00	1998-04-20 00:00:00	1998-03-30 00:00:00	2	0.1050	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brasilien
10970	BOLID	9	1998-03-24 00:00:00	1998-04-07 00:00:00	1998-04-24 00:00:00	1	8.0800	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	\N	28023	Spanien
10971	FRANR	2	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-04-02 00:00:00	2	60.9100	France restauration	54, rue Royale	Nantes	\N	44000	Frankreich
10972	LACOR	4	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-26 00:00:00	2	0.0100	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	Frankreich
10973	LACOR	6	1998-03-24 00:00:00	1998-04-21 00:00:00	1998-03-27 00:00:00	2	7.5850	La corne d'abondance	67, avenue de l'Europe	Versailles	\N	78000	Frankreich
10974	SPLIR	3	1998-03-25 00:00:00	1998-04-08 00:00:00	1998-04-03 00:00:00	3	6.4800	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10975	BOTTM	1	1998-03-25 00:00:00	1998-04-22 00:00:00	1998-03-27 00:00:00	3	16.1350	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10976	HILAA	1	1998-03-25 00:00:00	1998-05-06 00:00:00	1998-04-03 00:00:00	1	18.9850	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
10977	FOLKO	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-10 00:00:00	3	104.2500	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10978	MAISD	9	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-04-23 00:00:00	2	16.4100	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien
10979	ERNSH	8	1998-03-26 00:00:00	1998-04-23 00:00:00	1998-03-31 00:00:00	2	176.5350	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10980	FOLKO	4	1998-03-27 00:00:00	1998-05-08 00:00:00	1998-04-17 00:00:00	1	0.6300	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10981	HANAR	1	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-02 00:00:00	2	96.6850	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
10982	BOTTM	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-08 00:00:00	1	7.0050	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
10983	SAVEA	2	1998-03-27 00:00:00	1998-04-24 00:00:00	1998-04-06 00:00:00	2	328.7700	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10984	SAVEA	1	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-03 00:00:00	3	105.6100	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10985	HUNGO	2	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-02 00:00:00	1	45.7550	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
10986	OCEAN	8	1998-03-30 00:00:00	1998-04-27 00:00:00	1998-04-21 00:00:00	2	108.9300	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585\\r\\nPiso 20-A	Buenos Aires	\N	1010	Argentinien
10987	EASTC	8	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-06 00:00:00	1	92.7400	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
10988	RATTC	3	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-10 00:00:00	2	30.5700	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10989	QUEDE	2	1998-03-31 00:00:00	1998-04-28 00:00:00	1998-04-02 00:00:00	1	17.3800	Que Delícia	Rua da Panificadora, 12	Rio de Janeiro	RJ	02389-673	Brasilien
10990	ERNSH	2	1998-04-01 00:00:00	1998-05-13 00:00:00	1998-04-07 00:00:00	3	58.8050	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
10991	QUICK	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-07 00:00:00	1	19.2550	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10992	THEBI	1	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-03 00:00:00	3	2.1350	The Big Cheese	89 Jefferson Way\\r\\nSuite 2	Portland	OR	97201	USA
10993	FOLKO	7	1998-04-01 00:00:00	1998-04-29 00:00:00	1998-04-10 00:00:00	3	4.4050	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
10994	VAFFE	2	1998-04-02 00:00:00	1998-04-16 00:00:00	1998-04-09 00:00:00	3	32.7650	Vaffeljernet	Smagsløget 45	Århus	\N	8200	Dänemark
10995	PERIC	1	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-06 00:00:00	3	23.0000	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexiko
10996	QUICK	4	1998-04-02 00:00:00	1998-04-30 00:00:00	1998-04-10 00:00:00	2	0.5600	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
10997	LILAS	8	1998-04-03 00:00:00	1998-05-15 00:00:00	1998-04-13 00:00:00	2	36.9550	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10998	WOLZA	8	1998-04-03 00:00:00	1998-04-17 00:00:00	1998-04-17 00:00:00	2	10.1550	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Polen
10999	OTTIK	6	1998-04-03 00:00:00	1998-05-01 00:00:00	1998-04-10 00:00:00	2	48.1750	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
11000	RATTC	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00	3	27.5600	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
11001	FOLKO	2	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-14 00:00:00	2	98.6500	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
11002	SAVEA	4	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-16 00:00:00	1	70.5800	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11003	THECR	3	1998-04-06 00:00:00	1998-05-04 00:00:00	1998-04-08 00:00:00	3	7.4550	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
11004	MAISD	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-20 00:00:00	1	22.4200	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	\N	B-1180	Belgien
11005	WILMK	2	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-10 00:00:00	1	0.3750	Wilman Kala	Keskuskatu 45	Helsinki	\N	21240	Finnland
11006	GREAL	3	1998-04-07 00:00:00	1998-05-05 00:00:00	1998-04-15 00:00:00	2	12.5950	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11007	PRINI	8	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-13 00:00:00	2	101.1200	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	\N	1756	Portugal
11008	ERNSH	7	1998-04-08 00:00:00	1998-05-06 00:00:00	\N	3	39.7300	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
11009	GODOS	2	1998-04-08 00:00:00	1998-05-06 00:00:00	1998-04-10 00:00:00	1	29.5550	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
11010	REGGC	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-21 00:00:00	2	14.3550	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
11011	ALFKI	3	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-13 00:00:00	1	0.6050	Bottom-Dollar Markets	23 Tsawassen Blvd.	Berlin	\N	12209	Kanada
11012	FRANK	1	1998-04-09 00:00:00	1998-04-23 00:00:00	1998-04-17 00:00:00	3	121.4750	Frankenversand	Berliner Platz 43	München	\N	80805	Deutschland
11013	ROMEY	2	1998-04-09 00:00:00	1998-05-07 00:00:00	1998-04-10 00:00:00	1	16.4950	Romero y tomillo	Gran Vía, 1	Madrid	\N	28001	Spanien
11014	LINOD	2	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-15 00:00:00	3	11.8000	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11015	SANTG	2	1998-04-10 00:00:00	1998-04-24 00:00:00	1998-04-20 00:00:00	2	2.3100	Santé Gourmet	Erling Skakkes gate 78	Stavern	\N	4110	Norwegen
11016	AROUT	9	1998-04-10 00:00:00	1998-05-08 00:00:00	1998-04-13 00:00:00	2	16.9000	Around the Horn	Brook Farm\\r\\nStratford St. Mary	Colchester	Essex	CO7 6JX	Großbritannien
11017	ERNSH	9	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-20 00:00:00	2	377.1300	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
11018	LONEP	4	1998-04-13 00:00:00	1998-05-11 00:00:00	1998-04-16 00:00:00	2	5.8250	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
11019	RANCH	6	1998-04-13 00:00:00	1998-05-11 00:00:00	\N	3	1.5850	Rancho grande	Av. del Libertador 900	Buenos Aires	\N	1010	Argentinien
11020	OTTIK	2	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-16 00:00:00	2	21.6500	Ottilies Käseladen	Mehrheimerstr. 369	Köln	\N	50739	Deutschland
11021	QUICK	3	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-04-21 00:00:00	1	148.5900	QUICK-Stop	Taucherstraße 10	Cunewalde	\N	01307	Deutschland
11022	HANAR	9	1998-04-14 00:00:00	1998-05-12 00:00:00	1998-05-04 00:00:00	2	3.1350	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
11023	BSBEV	1	1998-04-14 00:00:00	1998-04-28 00:00:00	1998-04-24 00:00:00	2	61.9150	B's Beverages	Fauntleroy Circus	London	\N	EC2 5NT	Großbritannien
11024	EASTC	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-20 00:00:00	1	37.1800	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
11025	WARTH	6	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-24 00:00:00	3	14.5850	Wartian Herkku	Torikatu 38	Oulu	\N	90110	Finnland
11026	FRANS	4	1998-04-15 00:00:00	1998-05-13 00:00:00	1998-04-28 00:00:00	1	23.5450	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italien
11027	BOTTM	1	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-20 00:00:00	1	26.2600	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
11028	KOENE	2	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-22 00:00:00	1	14.7950	Königlich Essen	Maubelstr. 90	Brandenburg	\N	14776	Deutschland
11029	CHOPS	4	1998-04-16 00:00:00	1998-05-14 00:00:00	1998-04-27 00:00:00	1	23.9200	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
11030	SAVEA	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-27 00:00:00	2	415.3750	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11031	SAVEA	6	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-24 00:00:00	2	113.6100	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11032	WHITC	2	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00	3	303.0950	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11033	RICSU	7	1998-04-17 00:00:00	1998-05-15 00:00:00	1998-04-23 00:00:00	3	42.3700	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
11034	OLDWO	8	1998-04-20 00:00:00	1998-06-01 00:00:00	1998-04-27 00:00:00	1	20.1600	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
11035	SUPRD	2	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-24 00:00:00	2	0.0850	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
11036	DRACD	8	1998-04-20 00:00:00	1998-05-18 00:00:00	1998-04-22 00:00:00	3	74.7350	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Deutschland
11037	GODOS	7	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-27 00:00:00	1	1.6000	Godos Cocina Típica	C/ Romero, 33	Sevilla	\N	41101	Spanien
11038	SUPRD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	1998-04-30 00:00:00	2	14.7950	Suprêmes délices	Boulevard Tirou, 255	Charleroi	\N	B-6000	Belgien
11039	LINOD	1	1998-04-21 00:00:00	1998-05-19 00:00:00	\N	2	32.5000	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11040	GREAL	4	1998-04-22 00:00:00	1998-05-20 00:00:00	\N	3	9.4200	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11041	CHOPS	3	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-28 00:00:00	2	24.1100	Chop-suey Chinese	Hauptstr. 31	Bern	\N	3012	Schweiz
11042	COMMI	2	1998-04-22 00:00:00	1998-05-06 00:00:00	1998-05-01 00:00:00	1	14.9950	Comércio Mineiro	Av. dos Lusíadas, 23	São Paulo	SP	05432-043	Brasilien
11043	SPECD	5	1998-04-22 00:00:00	1998-05-20 00:00:00	1998-04-29 00:00:00	2	4.4000	Spécialités du monde	25, rue Lauriston	Paris	\N	75016	Frankreich
11044	WOLZA	4	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-05-01 00:00:00	1	4.3600	Wolski Zajazd	ul. Filtrowa 68	Warszawa	\N	01-012	Polen
11045	BOTTM	6	1998-04-23 00:00:00	1998-05-21 00:00:00	\N	2	35.2900	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
11046	WANDK	8	1998-04-23 00:00:00	1998-05-21 00:00:00	1998-04-24 00:00:00	2	35.8200	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	\N	70563	Deutschland
11047	EASTC	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-01 00:00:00	3	23.3100	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
11048	BOTTM	7	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-04-30 00:00:00	3	12.0600	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Kanada
11049	GOURL	3	1998-04-24 00:00:00	1998-05-22 00:00:00	1998-05-04 00:00:00	1	4.1700	Gourmet Lanchonetes	Av. Brasil, 442	Campinas	SP	04876-786	Brasilien
11050	FOLKO	8	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-05 00:00:00	2	29.7050	Folk och fä HB	Åkergatan 24	Bräcke	\N	S-844 67	Schweden
11051	LAMAI	7	1998-04-27 00:00:00	1998-05-25 00:00:00	\N	3	1.3950	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	\N	31000	Frankreich
11052	HANAR	3	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-05-01 00:00:00	1	33.6300	Hanari Carnes	Rua do Paço, 67	Rio de Janeiro	RJ	05454-876	Brasilien
11053	PICCO	2	1998-04-27 00:00:00	1998-05-25 00:00:00	1998-04-29 00:00:00	2	26.5250	Piccolo und mehr	Geislweg 14	Salzburg	\N	5020	Österreich
11054	CACTU	8	1998-04-28 00:00:00	1998-05-26 00:00:00	\N	1	0.1650	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	\N	1010	Argentinien
11055	HILAA	7	1998-04-28 00:00:00	1998-05-26 00:00:00	1998-05-05 00:00:00	2	60.4600	HILARIÓN-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	Táchira	5022	Venezuela
11056	EASTC	8	1998-04-28 00:00:00	1998-05-12 00:00:00	1998-05-01 00:00:00	2	139.4800	Eastern Connection	35 King George	London	\N	WX3 6FW	Großbritannien
11057	NORTS	3	1998-04-29 00:00:00	1998-05-27 00:00:00	1998-05-01 00:00:00	3	2.0650	North/South	South House\\r\\n300 Queensbridge	London	\N	SW7 1RZ	Großbritannien
11058	BLAUS	9	1998-04-29 00:00:00	1998-05-27 00:00:00	\N	\N	15.5700	Blauer See Delikatessen	Forsterstr. 57	Mannheim	\N	68306	Deutschland
11059	RICAR	2	1998-04-29 00:00:00	1998-06-10 00:00:00	\N	2	42.9000	Ricardo Adocicados	Av. Copacabana, 267	Rio de Janeiro	RJ	02389-890	Brasilien
11060	FRANS	2	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-04 00:00:00	2	5.4900	Franchi S.p.A.	Via Monte Bianco 34	Torino	\N	10100	Italien
11061	GREAL	4	1998-04-30 00:00:00	1998-06-11 00:00:00	\N	3	7.0050	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11062	REGGC	4	1998-04-30 00:00:00	1998-05-28 00:00:00	\N	2	14.9650	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	\N	42100	Italien
11063	HUNGO	3	1998-04-30 00:00:00	1998-05-28 00:00:00	1998-05-06 00:00:00	2	40.8650	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	\N	Irland
11064	SAVEA	1	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00	1	15.0450	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11065	LILAS	8	1998-05-01 00:00:00	1998-05-29 00:00:00	\N	1	6.4550	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11066	WHITC	7	1998-05-01 00:00:00	1998-05-29 00:00:00	1998-05-04 00:00:00	2	22.3600	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11067	DRACD	1	1998-05-04 00:00:00	1998-05-18 00:00:00	1998-05-06 00:00:00	2	3.9900	Drachenblut Delikatessen	Walserweg 21	Aachen	\N	52066	Deutschland
11068	QUEEN	8	1998-05-04 00:00:00	1998-06-01 00:00:00	\N	2	40.8750	Queen Cozinha	Alameda dos Canàrios, 891	São Paulo	SP	05487-020	Brasilien
11069	TORTU	1	1998-05-04 00:00:00	1998-06-01 00:00:00	1998-05-06 00:00:00	2	7.8350	Tortuga Restaurante	Avda. Azteca 123	México D.F.	\N	05033	Mexiko
11070	LEHMS	2	1998-05-05 00:00:00	1998-06-02 00:00:00	\N	\N	68.0000	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M. 	\N	60528	Deutschland
11071	LILAS	1	1998-05-05 00:00:00	1998-06-02 00:00:00	\N	1	0.4650	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11072	ERNSH	4	1998-05-05 00:00:00	1998-06-02 00:00:00	\N	2	129.3200	Ernst Handel	Kirchgasse 6	Graz	\N	8010	Österreich
11073	PERIC	2	1998-05-05 00:00:00	1998-06-02 00:00:00	\N	2	12.4750	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	\N	05033	Mexiko
11074	SIMOB	7	1998-05-06 00:00:00	1998-06-03 00:00:00	\N	\N	9.2200	Simons bistro	Vinbæltet 34	København	\N	1734	Dänemark
11075	RICSU	8	1998-05-06 00:00:00	1998-06-03 00:00:00	\N	2	3.0950	Richter Supermarkt	Starenweg 5	Genève	\N	1204	Schweiz
11076	BONAP	4	1998-05-06 00:00:00	1998-06-03 00:00:00	\N	2	19.1400	Bon app'	12, rue des Bouchers	Marseille	\N	13008	Frankreich
11077	RATTC	1	1998-05-06 00:00:00	1998-06-03 00:00:00	\N	2	4.2650	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, name, supplier_id, category_id, delivery_units, unit_price, stock, ordered_units, minimum_stock, discontinued) FROM stdin;
1	Chai	1	1	10 Kartons x 20 Beutel	9.0000	39	0	10	f
2	Chang	1	1	24 x 12-oz-Flaschen	9.5000	17	40	25	f
3	Aniseed Syrup	1	2	12 x 550-ml-Flaschen	5.0000	13	70	25	f
4	Chef Anton's Cajun Seasoning	2	2	48 x 6-oz-Gläser	11.0000	53	0	0	f
6	Grandma's Boysenberry Spread	3	2	12 x 8-oz-Gläser	12.5000	120	0	25	f
7	Uncle Bob's Organic Dried Pears	3	7	12 x 1-lb-Packungen	15.0000	15	0	10	f
8	Northwoods Cranberry Sauce	3	2	12 x 12-oz-Gläser	20.0000	6	0	0	f
10	Ikura	4	8	12 x 200-ml-Gläser	15.5000	31	0	0	f
11	Queso Cabrales	5	4	1-kg-Paket	10.5000	22	30	30	f
12	Queso Manchego La Pastora	5	4	10 x 500-g-Packungen	19.0000	86	0	0	f
13	Konbu	6	8	2-kg-Karton	3.0000	24	0	5	f
14	Tofu	6	7	40 x 100-g-Packungen	11.6250	35	0	0	f
15	Genen Shouyu	6	2	24 x 250-ml-Flaschen	7.7500	39	0	5	f
16	Pavlova	7	3	32 x 500-g-Kartons	8.7250	29	0	10	f
18	Carnarvon Tigers	7	8	16-kg-Paket	31.2500	42	0	0	f
19	Teatime Chocolate Biscuits	8	3	10 Kartons x 12 Stück	4.6000	25	0	5	f
20	Sir Rodney's Marmalade	8	3	30 Geschenkkartons	40.5000	40	0	0	f
21	Sir Rodney's Scones	8	3	24 Packungen x 4 Stück	5.0000	3	40	5	f
22	Gustaf's Knäckebröd	9	5	24 x 500-g-Packungen	10.5000	104	0	25	f
23	Tunnbröd	9	5	12 x 250-g-Packungen	4.5000	61	0	25	f
25	NuNuCa Nuß-Nougat-Creme	11	3	20 x 450-g-Gläser	7.0000	76	0	30	f
26	Gumbär Gummibärchen	11	3	100 x 250-g-Beutel	15.6150	15	0	0	f
27	Schoggi Schokolade	11	3	100 x 100-g-Stück	21.9500	49	0	30	f
30	Nord-Ost Matjeshering	13	8	10 x 200-g-Gläser	12.9450	10	0	15	f
31	Gorgonzola Telino	14	4	12 x 100-g-Packungen	6.2500	0	70	20	f
32	Mascarpone Fabioli	14	4	24 x 200-g-Packungen	16.0000	9	40	25	f
33	Geitost	15	4	500-g-Packung	1.2500	112	0	20	f
34	Sasquatch Ale	16	1	24 x 12-oz-Flaschen	7.0000	111	0	15	f
35	Steeleye Stout	16	1	24 x 12-oz-Flaschen	9.0000	20	0	15	f
36	Inlagd Sill	17	8	24 x 250-g -Gläser	9.5000	112	0	20	f
37	Gravad lax	17	8	12 x 500-g-Packungen	13.0000	11	50	25	f
38	Côte de Blaye	18	1	12 x 75-cl-Flaschen	131.7500	17	0	15	f
39	Chartreuse verte	18	1	750-ml-Flasche	9.0000	69	0	5	f
40	Boston Crab Meat	19	8	24 x 4-oz-Dosen	9.2000	123	0	30	f
41	Jack's New England Clam Chowder	19	8	12 x 12-oz-Dosen	4.8250	85	0	10	f
43	Ipoh Coffee	20	1	16 x 500-g-Dosen	23.0000	17	10	25	f
44	Gula Malacca	20	2	20 x 2-kg-Beutel	9.7250	27	0	15	f
45	Røgede sild	21	8	1-kg-Paket	4.7500	5	70	15	f
46	Spegesild	21	8	4 x 450-g-Gläser	6.0000	95	0	0	f
47	Zaanse koeken	22	3	10 x 4-oz-Kartons	4.7500	36	0	0	f
48	Chocolade	22	3	10 Packungen	6.3750	15	70	25	f
49	Maxilaku	23	3	24 x 50-g-Packungen	10.0000	10	60	15	f
50	Valkoinen suklaa	23	3	12 x 100-g-Riegel	8.1250	65	0	30	f
51	Manjimup Dried Apples	24	7	50 x 300-g-Packungen	26.5000	20	0	10	f
52	Filo Mix	24	5	16 x 2-kg-Kartons	3.5000	38	0	25	f
54	Tourtière	25	6	16 Pasteten	3.7250	21	0	10	f
55	Pâté chinois	25	6	24 Kartons x 2 Pasteten	12.0000	115	0	20	f
56	Gnocchi di nonna Alice	26	5	24 x 250-g-Packungen	19.0000	21	10	30	f
57	Ravioli Angelo	26	5	24 x 250-g-Packungen	9.7500	36	0	20	f
58	Escargots de Bourgogne	27	8	24 Stück	6.6250	62	0	20	f
59	Raclette Courdavault	28	4	5-kg-Packung	27.5000	79	0	0	f
60	Camembert Pierrot	28	4	15 x 300-g-Stücke	17.0000	19	0	0	f
61	Sirop d'érable	29	2	24 x 500-ml-Flaschen	14.2500	113	0	25	f
62	Tarte au sucre	29	3	48 Törtchen	24.6500	17	0	0	f
63	Vegie-spread	7	2	15 x 625-g-Gläser	21.9500	24	0	5	f
64	Wimmers gute Semmelknödel	12	5	20 Beutel x 4 Stück	16.6250	22	80	30	f
65	Louisiana Fiery Hot Pepper Sauce	2	2	32 x 8-oz-Flaschen	10.5250	76	0	0	f
66	Louisiana Hot Spiced Okra	2	2	24 x 8-oz-Gläser	8.5000	4	100	20	f
67	Laughing Lumberjack Lager	16	1	24 x 12-oz-Flaschen	7.0000	52	0	10	f
68	Scottish Longbreads	8	3	10 Kartons x 8 Stück	6.2500	6	10	15	f
69	Gudbrandsdalsost	15	4	10-kg-Paket	18.0000	26	0	15	f
70	Outback Lager	7	1	24 x 355-ml-Flaschen	7.5000	15	10	30	f
71	Fløtemysost	15	4	10 x 500-g-Packungen	10.7500	26	0	0	f
72	Mozzarella di Giovanni	14	4	24 x 200 g-Packungen	17.4000	14	0	0	f
73	Röd Kaviar	17	8	24 x 150-g-Gläser	7.5000	101	0	5	f
74	Longlife Tofu	4	7	5-kg-Paket	5.0000	4	20	5	f
75	Rhönbräu Klosterbier	12	1	24 x 0,5-l-Flaschen	3.8750	125	0	25	f
76	Lakkalikööri	23	1	500-ml-Flasche	9.0000	57	0	20	f
77	Original Frankfurter grüne Soße	12	2	12 Kartons	6.5000	32	0	15	f
42	Singaporean Hokkien Fried Mee	20	5	32 x 1-kg-Packungen	7.0000	26	0	0	t
17	Alice Mutton	7	6	20 x 1-kg-Dosen	19.5000	0	0	0	t
29	Thüringer Rostbratwurst	12	6	50 Beutel x 30 Würstchen	61.8950	0	0	0	t
9	Mishi Kobe Niku	4	6	18 x 500-g-Packungen	48.5000	29	0	0	t
5	Chef Anton's Gumbo Mix	2	2	36 Kartons	10.6750	0	0	0	t
24	Guaraná Fantástica	10	1	12 x 355-ml-Dosen	2.2500	20	0	0	t
53	Perth Pasties	24	6	48 Stück	16.4000	0	0	0	t
28	Rössle Sauerkraut	12	7	25 x 825-g-Dosen	22.8000	26	0	0	t
\.


--
-- Data for Name: shipping_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_company (company_id, name, phone) FROM stdin;
1	Speedy Express	(503) 555-9831
2	United Package	(503) 555-3199
3	Federal Shipping	(503) 555-9931
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplier_id, company_name, contact_person, contact_person_position, street, city, region, plz, country, phone, fax, homepage) FROM stdin;
1	Exotic Liquids	Charlotte Cooper	Einkaufsmanager	49 Gilbert St.	London	\N	EC1 4SD	Großbritannien	(71) 555-2222	\N	\N
2	New Orleans Cajun Delights	Shelley Burke	Bestellungen-Sachbearbeiterin	P.O. Box 78934	New Orleans	LA	70117	USA	(100) 555-4822	\N	\N
3	Grandma Kelly's Homestead	Regina Murphy	Vertriebsmitarbeiterin	707 Oxford Rd.	Ann Arbor	MI	48104	USA	(313) 555-5735	(313) 555-3349	\N
4	Tokyo Traders	Yoshi Nagase	Marketingmanager	9-8 Sekimai\\r\\nMusashino-shi	Tokyo	\N	100	Japan	(03) 3555-5011	\N	\N
5	Cooperativa de Quesos 'Las Cabras'	Antonio del Valle Saavedra 	Exportadministrator	Calle del Rosal 4	Oviedo	Asturias	33007	Spanien	(98) 598 76 54	\N	\N
6	Mayumi's	Mayumi Ohno	Marketingrepräsentant	92 Setsuko\\r\\nChuo-ku	Osaka	\N	545	Japan	(06) 431-7877	\N	Mayumi's (im World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#
7	Pavlova, Ltd.	Ian Devling	Marketingmanager	74 Rose St.\\r\\nMoonie Ponds	Melbourne	Victoria	3058	Australien	(03) 444-2343	(03) 444-6588	\N
8	Specialty Biscuits, Ltd.	Peter Wilson	Vertriebsmitarbeiter	29 King's Way	Manchester	\N	M14 GSD	Großbritannien	(26) 555-4448	\N	\N
9	PB Knäckebröd AB	Lars Peterson	Vertriebsagent	Kaloadagatan 13	Göteborg	\N	S-345 67	Schweden	031-987 65 43	031-987 65 91	\N
10	Refrescos Americanas LTDA	Carlos Diaz	Marketingmanager	Av. das Americanas 12.890	São Paulo	\N	5442	Brasilien	(11) 555 4640	\N	\N
11	Heli Süßwaren GmbH & Co. KG	Petra Winkler	Vertriebsmanager	Tiergartenstraße 5	Berlin	\N	10785	Deutschland	(010) 9984510	\N	\N
12	Plutzer Lebensmittelgroßmärkte AG	Martin Bein	Marketingmanager International	Bogenallee 51	Frankfurt	\N	60439	Deutschland	(069) 992755	\N	Plutzer (im World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#
13	Nord-Ost-Fisch Handelsgesellschaft mbH	Sven Petersen	Koordinator Auslandsmärkte	Frahmredder 112a	Cuxhaven	\N	27478	Deutschland	(04721) 8713	(04721) 8714	\N
14	Formaggi Fortini s.r.l.	Elio Rossi	Vertriebsmitarbeiter	Viale Dante, 75	Ravenna	\N	48100	Italien	(0544) 60323	(0544) 60603	\N
15	Norske Meierier	Beate Vileid	Marketingmanager	Hatlevegen 5	Sandvika	\N	1320	Norwegen	(0)2-953010	\N	\N
16	Bigfoot Breweries	Cheryl Saylor	Regionalvertreterin	3400 - 8th Avenue\\r\\nSuite 210	Bend	OR	97101	USA	(503) 555-9931	\N	\N
17	Svensk Sjöföda AB	Michael Björn	Vertriebsmitarbeiter	Brovallavägen 231	Stockholm	\N	S-123 45	Schweden	08-123 45 67	\N	\N
18	Aux joyeux ecclésiastiques	Guylène Nodier	Vertriebsmanager	203, Rue des Francs-Bourgeois	Paris	\N	75004	Frankreich	(1) 03.83.00.68	(1) 03.83.00.62	\N
19	New England Seafood Cannery	Robb Merchant	Großhandelsvertreter	Order Processing Dept.\\r\\n2100 Paul Revere Blvd.	Boston	MA	02134	USA	(617) 555-3267	(617) 555-3389	\N
20	Leka Trading	Chandra Leka	Inhaberin	471 Serangoon Loop, Suite #402	Singapore	\N	0512	Singapur	555-8787	\N	\N
21	Lyngbysild	Niels Petersen	Vertriebsmanager	Lyngbysild\\r\\nFiskebakken 10	Lyngby	\N	2800	Dänemark	43844108	43844115	\N
22	Zaanse Snoepfabriek	Dirk Luchte	Buchhaltung-Sachbearbeiter	Verkoop\\r\\nRijnweg 22	Zaandam	\N	9999 ZZ	Niederlande	(12345) 1212	(12345) 1210	\N
23	Karkki Oy	Anne Heikkonen	Produktmanager	Valtakatu 12	Lappeenranta	\N	53120	Finnland	(953) 10956	\N	\N
24	G'day, Mate	Wendy Mackenzie	Vertriebsmitarbeiterin	170 Prince Edward Parade\\r\\nHunter's Hill	Sydney	NSW	2042	Australien	(02) 555-5914	(02) 555-4873	G'day Mate (im World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#
25	Ma Maison	Jean-Guy Lauzon	Marketingmanager	2960 Rue St. Laurent	Montréal	Québec	H1J 1C3	Kanada	(514) 555-9022	\N	\N
26	Pasta Buttini s.r.l.	Giovanni Giudici	Bestellungen-Sachbearbeiter	Via dei Gelsomini, 153	Salerno	\N	84100	Italien	(089) 6547665	(089) 6547667	\N
27	Escargots Nouveaux	Marie Delamare	Vertriebsmanager	22, rue H. Voiron	Montceau	\N	71300	Frankreich	85.57.00.07	\N	\N
28	Gai pâturage	Eliane Noz	Vertriebsmitarbeiterin	Bat. B\\r\\n3, rue des Alpes	Annecy	\N	74000	Frankreich	38.76.98.06	38.76.98.58	\N
29	Forêts d'érables	Chantal Goulet	Buchhaltung-Sachbearbeiterin	148 rue Chasseur	Ste-Hyacinthe	Québec	J2S 7S8	Kanada	(514) 555-2955	(514) 555-2921	\N
\.


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);


--
-- Name: shipping_company_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_company_company_id_seq', 1, false);


--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 1, false);


--
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (category_id);


--
-- Name: customer customer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (customer_id);


--
-- Name: employee employee_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (employee_id);


--
-- Name: order_details order_details_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pk PRIMARY KEY (order_id, product_id);


--
-- Name: orders order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pk PRIMARY KEY (order_id);


--
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (product_id);


--
-- Name: shipping_company shpping_company_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_company
    ADD CONSTRAINT shpping_company_pk PRIMARY KEY (company_id);


--
-- Name: supplier supplier_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pk PRIMARY KEY (supplier_id);


--
-- Name: orders customer_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT customer_order_fk FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE;


--
-- Name: orders employee_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT employee_order_fk FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: order_details order_details_orders_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_orders_order_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- Name: order_details order_details_product_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_product_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product product_category_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_category_id_fk FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- Name: product product_supplier_supplier_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_supplier_supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


--
-- Name: orders supplier_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT supplier_order_fk FOREIGN KEY (shipping_with) REFERENCES public.shipping_company(company_id);


--
-- PostgreSQL database dump complete
--

