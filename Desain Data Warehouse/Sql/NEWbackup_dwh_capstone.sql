--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

-- Started on 2026-06-17 17:43:37

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
-- TOC entry 7 (class 2615 OID 27300)
-- Name: dwh; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dwh;


ALTER SCHEMA dwh OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 231 (class 1259 OID 27302)
-- Name: dim_category; Type: TABLE; Schema: dwh; Owner: postgres
--

CREATE TABLE dwh.dim_category (
    sk_category integer NOT NULL,
    category_id integer,
    category_name character varying(100),
    sub_category_name character varying(100)
);


ALTER TABLE dwh.dim_category OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 27301)
-- Name: dim_category_sk_category_seq; Type: SEQUENCE; Schema: dwh; Owner: postgres
--

CREATE SEQUENCE dwh.dim_category_sk_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh.dim_category_sk_category_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 230
-- Name: dim_category_sk_category_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

ALTER SEQUENCE dwh.dim_category_sk_category_seq OWNED BY dwh.dim_category.sk_category;


--
-- TOC entry 233 (class 1259 OID 27309)
-- Name: dim_customer; Type: TABLE; Schema: dwh; Owner: postgres
--

CREATE TABLE dwh.dim_customer (
    sk_customer integer NOT NULL,
    customer_id integer,
    customer_segment character varying(100),
    customer_city character varying(100),
    customer_state character varying(100),
    customer_region character varying(100),
    customer_postalcode character varying(100),
    customer_country character varying(100)
);


ALTER TABLE dwh.dim_customer OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 27308)
-- Name: dim_customer_sk_customer_seq; Type: SEQUENCE; Schema: dwh; Owner: postgres
--

CREATE SEQUENCE dwh.dim_customer_sk_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh.dim_customer_sk_customer_seq OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 232
-- Name: dim_customer_sk_customer_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

ALTER SEQUENCE dwh.dim_customer_sk_customer_seq OWNED BY dwh.dim_customer.sk_customer;


--
-- TOC entry 235 (class 1259 OID 27318)
-- Name: dim_product; Type: TABLE; Schema: dwh; Owner: postgres
--

CREATE TABLE dwh.dim_product (
    sk_product integer NOT NULL,
    product_id character varying(50),
    category_id integer,
    product_category character varying(100),
    product_subcategory character varying(100),
    product_costprice numeric(10,2),
    product_listprice numeric(10,2)
);


ALTER TABLE dwh.dim_product OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 27317)
-- Name: dim_product_sk_product_seq; Type: SEQUENCE; Schema: dwh; Owner: postgres
--

CREATE SEQUENCE dwh.dim_product_sk_product_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh.dim_product_sk_product_seq OWNER TO postgres;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 234
-- Name: dim_product_sk_product_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

ALTER SEQUENCE dwh.dim_product_sk_product_seq OWNED BY dwh.dim_product.sk_product;


--
-- TOC entry 237 (class 1259 OID 27325)
-- Name: dim_shipping; Type: TABLE; Schema: dwh; Owner: postgres
--

CREATE TABLE dwh.dim_shipping (
    sk_shipping integer NOT NULL,
    shipping_id integer,
    ship_mode character varying(50)
);


ALTER TABLE dwh.dim_shipping OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 27324)
-- Name: dim_shipping_sk_shipping_seq; Type: SEQUENCE; Schema: dwh; Owner: postgres
--

CREATE SEQUENCE dwh.dim_shipping_sk_shipping_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh.dim_shipping_sk_shipping_seq OWNER TO postgres;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 236
-- Name: dim_shipping_sk_shipping_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

ALTER SEQUENCE dwh.dim_shipping_sk_shipping_seq OWNED BY dwh.dim_shipping.sk_shipping;


--
-- TOC entry 239 (class 1259 OID 27332)
-- Name: fact_sales; Type: TABLE; Schema: dwh; Owner: postgres
--

CREATE TABLE dwh.fact_sales (
    trx_id integer NOT NULL,
    order_id integer,
    sk_customer integer,
    sk_product integer,
    sk_shipping integer,
    order_date date,
    quantity integer,
    discount_percent numeric(5,2),
    product_costprice numeric(10,2),
    product_listprice numeric(10,2),
    sales_amount numeric(15,2),
    profit_amount numeric(15,2)
);


ALTER TABLE dwh.fact_sales OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 27331)
-- Name: fact_sales_trx_id_seq; Type: SEQUENCE; Schema: dwh; Owner: postgres
--

CREATE SEQUENCE dwh.fact_sales_trx_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dwh.fact_sales_trx_id_seq OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 238
-- Name: fact_sales_trx_id_seq; Type: SEQUENCE OWNED BY; Schema: dwh; Owner: postgres
--

ALTER SEQUENCE dwh.fact_sales_trx_id_seq OWNED BY dwh.fact_sales.trx_id;


--
-- TOC entry 3229 (class 2604 OID 27305)
-- Name: dim_category sk_category; Type: DEFAULT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_category ALTER COLUMN sk_category SET DEFAULT nextval('dwh.dim_category_sk_category_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 27312)
-- Name: dim_customer sk_customer; Type: DEFAULT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_customer ALTER COLUMN sk_customer SET DEFAULT nextval('dwh.dim_customer_sk_customer_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 27321)
-- Name: dim_product sk_product; Type: DEFAULT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_product ALTER COLUMN sk_product SET DEFAULT nextval('dwh.dim_product_sk_product_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 27328)
-- Name: dim_shipping sk_shipping; Type: DEFAULT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_shipping ALTER COLUMN sk_shipping SET DEFAULT nextval('dwh.dim_shipping_sk_shipping_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 27335)
-- Name: fact_sales trx_id; Type: DEFAULT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.fact_sales ALTER COLUMN trx_id SET DEFAULT nextval('dwh.fact_sales_trx_id_seq'::regclass);


--
-- TOC entry 3387 (class 0 OID 27302)
-- Dependencies: 231
-- Data for Name: dim_category; Type: TABLE DATA; Schema: dwh; Owner: postgres
--

COPY dwh.dim_category (sk_category, category_id, category_name, sub_category_name) FROM stdin;
1	1	Furniture	Bookcases
2	2	Furniture	Chairs
3	3	Office Supplies	Labels
4	4	Furniture	Tables
5	5	Office Supplies	Storage
6	6	Furniture	Furnishings
7	7	Office Supplies	Art
8	8	Technology	Phones
9	9	Office Supplies	Binders
10	10	Office Supplies	Appliances
11	11	Office Supplies	Paper
12	12	Technology	Accessories
13	13	Office Supplies	Envelopes
14	14	Office Supplies	Fasteners
15	15	Office Supplies	Supplies
16	16	Technology	Machines
17	17	Technology	Copiers
\.


--
-- TOC entry 3389 (class 0 OID 27309)
-- Dependencies: 233
-- Data for Name: dim_customer; Type: TABLE DATA; Schema: dwh; Owner: postgres
--

COPY dwh.dim_customer (sk_customer, customer_id, customer_segment, customer_city, customer_state, customer_region, customer_postalcode, customer_country) FROM stdin;
1	1	Consumer	Henderson	Kentucky	South	42420	United States of America
2	2	Corporate	Los Angeles	California	West	90036	United States of America
3	3	Consumer	Fort Lauderdale	Florida	South	33311	United States of America
4	4	Consumer	Los Angeles	California	West	90032	United States of America
5	5	Consumer	Concord	North Carolina	South	28027	United States of America
6	6	Consumer	Seattle	Washington	West	98103	United States of America
7	7	Home Office	Fort Worth	Texas	Central	76106	United States of America
8	8	Consumer	Madison	Wisconsin	Central	53711	United States of America
9	9	Consumer	West Jordan	Utah	West	84084	United States of America
10	10	Consumer	San Francisco	California	West	94109	United States of America
11	11	Corporate	Fremont	Nebraska	Central	68025	United States of America
12	12	Consumer	Philadelphia	Pennsylvania	East	19140	United States of America
13	13	Consumer	Orem	Utah	West	84057	United States of America
14	14	Consumer	Los Angeles	California	West	90049	United States of America
15	15	Home Office	Houston	Texas	Central	77095	United States of America
16	16	Corporate	Richardson	Texas	Central	75080	United States of America
17	17	Home Office	Houston	Texas	Central	77041	United States of America
18	18	Corporate	Naperville	Illinois	Central	60540	United States of America
19	19	Corporate	Los Angeles	California	West	90049	United States of America
20	20	Corporate	Melbourne	Florida	South	32935	United States of America
21	21	Corporate	Eagan	Minnesota	Central	55122	United States of America
22	22	Consumer	Westland	Michigan	Central	48185	United States of America
23	23	Consumer	Dover	Delaware	East	19901	United States of America
24	24	Consumer	New Albany	Indiana	Central	47150	United States of America
25	25	Corporate	New York City	New York	East	10024	United States of America
26	26	Consumer	Troy	New York	East	12180	United States of America
27	27	Consumer	Los Angeles	California	West	90004	United States of America
28	28	Home Office	Chicago	Illinois	Central	60610	United States of America
29	29	Corporate	Gilbert	Arizona	West	85234	United States of America
30	30	Consumer	Springfield	Virginia	South	22153	United States of America
31	31	Consumer	New York City	New York	East	10009	United States of America
32	32	Consumer	Jackson	Michigan	Central	49201	United States of America
33	33	Consumer	Memphis	Tennessee	South	38109	United States of America
34	34	Corporate	Houston	Texas	Central	77041	United States of America
35	35	Consumer	Houston	Texas	Central	77070	United States of America
36	36	Corporate	Decatur	Alabama	South	35601	United States of America
37	37	Consumer	San Francisco	California	West	94122	United States of America
38	38	Corporate	Durham	North Carolina	South	27707	United States of America
39	39	Home Office	Chicago	Illinois	Central	60623	United States of America
40	40	Consumer	Columbia	South Carolina	South	29203	United States of America
41	41	Consumer	Rochester	Minnesota	Central	55901	United States of America
42	42	Consumer	Minneapolis	Minnesota	Central	55407	United States of America
43	43	Home Office	Portland	Oregon	West	97206	United States of America
44	44	Home Office	New York City	New York	East	10009	United States of America
45	45	Corporate	Saint Paul	Minnesota	Central	55106	United States of America
46	46	Consumer	Aurora	Colorado	West	80013	United States of America
47	47	Consumer	Charlotte	North Carolina	South	28205	United States of America
48	48	Home Office	Orland Park	Illinois	Central	60462	United States of America
49	49	Corporate	New York City	New York	East	10035	United States of America
50	50	Consumer	Urbandale	Iowa	Central	50322	United States of America
51	51	Consumer	Columbus	Ohio	East	43229	United States of America
52	52	Corporate	Bristol	Tennessee	South	37620	United States of America
53	53	Consumer	Wilmington	Delaware	East	19805	United States of America
54	54	Consumer	Bloomington	Illinois	Central	61701	United States of America
55	55	Consumer	Phoenix	Arizona	West	85023	United States of America
56	56	Home Office	Los Angeles	California	West	90004	United States of America
57	57	Corporate	Columbus	Ohio	East	43229	United States of America
58	58	Consumer	Roseville	California	West	95661	United States of America
59	59	Corporate	Philadelphia	Pennsylvania	East	19140	United States of America
60	60	Corporate	San Francisco	California	West	94122	United States of America
61	61	Consumer	Independence	Missouri	Central	64055	United States of America
62	62	Consumer	Pasadena	California	West	91104	United States of America
63	63	Home Office	Newark	Ohio	East	43055	United States of America
64	64	Corporate	Franklin	Wisconsin	Central	53132	United States of America
65	65	Home Office	Scottsdale	Arizona	West	85254	United States of America
66	66	Corporate	San Jose	California	West	95123	United States of America
67	67	Home Office	Seattle	Washington	West	98105	United States of America
68	68	Consumer	Seattle	Washington	West	98115	United States of America
69	69	Consumer	Edmond	Oklahoma	Central	73034	United States of America
70	70	Consumer	Los Angeles	California	West	90045	United States of America
71	71	Consumer	Philadelphia	Pennsylvania	East	19134	United States of America
72	72	Consumer	Carlsbad	New Mexico	West	88220	United States of America
73	73	Consumer	San Antonio	Texas	Central	78207	United States of America
74	74	Corporate	Chicago	Illinois	Central	60623	United States of America
75	75	Consumer	Houston	Texas	Central	77036	United States of America
76	76	Consumer	Newark	Ohio	East	43055	United States of America
77	77	Corporate	Decatur	Illinois	Central	62521	United States of America
78	78	Home Office	Monroe	Louisiana	South	71203	United States of America
79	79	Consumer	Fairfield	Connecticut	East	6824	United States of America
80	80	Home Office	Los Angeles	California	West	90032	United States of America
81	81	Corporate	Grand Prairie	Texas	Central	75051	United States of America
82	82	Home Office	New York City	New York	East	10035	United States of America
83	83	Corporate	Redlands	California	West	92374	United States of America
84	84	Consumer	Hamilton	Ohio	East	45011	United States of America
85	85	Home Office	Westfield	New Jersey	East	7090	United States of America
86	86	Corporate	Philadelphia	Pennsylvania	East	19120	United States of America
87	87	Consumer	Akron	Ohio	East	44312	United States of America
88	88	Consumer	Denver	Colorado	West	80219	United States of America
89	89	Consumer	Dallas	Texas	Central	75220	United States of America
90	90	Corporate	Franklin	Tennessee	South	37064	United States of America
91	91	Consumer	Whittier	California	West	90604	United States of America
92	92	Consumer	Saginaw	Michigan	Central	48601	United States of America
93	93	Corporate	Dallas	Texas	Central	75220	United States of America
94	94	Corporate	Medina	Ohio	East	44256	United States of America
95	95	Consumer	Dublin	Ohio	East	43017	United States of America
96	96	Corporate	Detroit	Michigan	Central	48227	United States of America
97	97	Consumer	Columbia	Tennessee	South	38401	United States of America
98	98	Corporate	Charlotte	North Carolina	South	28205	United States of America
99	99	Home Office	Tampa	Florida	South	33614	United States of America
100	100	Corporate	Santa Clara	California	West	95051	United States of America
101	101	Consumer	Chicago	Illinois	Central	60610	United States of America
102	102	Home Office	Lakeville	Minnesota	Central	55044	United States of America
103	103	Consumer	San Diego	California	West	92037	United States of America
104	104	Consumer	New York City	New York	East	10024	United States of America
105	105	Corporate	Pasadena	Texas	Central	77506	United States of America
106	106	Corporate	Houston	Texas	Central	77036	United States of America
107	107	Consumer	Brentwood	California	West	94513	United States of America
108	108	Corporate	Chapel Hill	North Carolina	South	27514	United States of America
109	109	Consumer	Morristown	New Jersey	East	7960	United States of America
110	110	Corporate	Cincinnati	Ohio	East	45231	United States of America
111	111	Corporate	San Francisco	California	West	94110	United States of America
112	112	Corporate	Inglewood	California	West	90301	United States of America
113	113	Consumer	Portland	Oregon	West	97206	United States of America
114	114	Corporate	Tamarac	Florida	South	33319	United States of America
115	115	Home Office	Columbus	Ohio	East	43229	United States of America
116	116	Corporate	Colorado Springs	Colorado	West	80906	United States of America
117	117	Corporate	Belleville	New Jersey	East	7109	United States of America
118	118	Consumer	Chicago	Illinois	Central	60623	United States of America
119	119	Corporate	Taylor	Michigan	Central	48180	United States of America
120	120	Home Office	Lakewood	New Jersey	East	8701	United States of America
121	121	Consumer	Arlington	Virginia	South	22204	United States of America
122	122	Corporate	Arvada	Colorado	West	80004	United States of America
123	123	Corporate	Hackensack	New Jersey	East	7601	United States of America
124	124	Corporate	Saint Petersburg	Florida	South	33710	United States of America
125	125	Corporate	Philadelphia	Pennsylvania	East	19143	United States of America
126	126	Home Office	New York City	New York	East	10024	United States of America
127	127	Corporate	Long Beach	California	West	90805	United States of America
128	128	Corporate	Hesperia	California	West	92345	United States of America
129	129	Corporate	Murfreesboro	Tennessee	South	37130	United States of America
130	130	Consumer	Philadelphia	Pennsylvania	East	19143	United States of America
131	131	Consumer	Layton	Utah	West	84041	United States of America
132	132	Consumer	Austin	Texas	Central	78745	United States of America
133	133	Consumer	Lowell	Massachusetts	East	1852	United States of America
134	134	Consumer	New York City	New York	East	10035	United States of America
135	135	Corporate	Columbus	Georgia	South	31907	United States of America
136	136	Corporate	Manchester	Connecticut	East	6040	United States of America
137	137	Consumer	Harlingen	Texas	Central	78550	United States of America
138	138	Consumer	Tucson	Arizona	West	85705	United States of America
139	139	Corporate	Quincy	Illinois	Central	62301	United States of America
140	140	Corporate	Franklin	Massachusetts	East	2038	United States of America
141	141	Consumer	Houston	Texas	Central	77095	United States of America
142	142	Corporate	San Francisco	California	West	94109	United States of America
143	143	Consumer	Pembroke Pines	Florida	South	33024	United States of America
144	144	Consumer	Cincinnati	Ohio	East	45231	United States of America
145	145	Consumer	Des Moines	Washington	West	98198	United States of America
146	146	Corporate	Peoria	Illinois	Central	61604	United States of America
147	147	Home Office	Las Vegas	Nevada	West	89115	United States of America
148	148	Corporate	Warwick	Rhode Island	East	2886	United States of America
149	149	Home Office	Jackson	Michigan	Central	49201	United States of America
150	150	Consumer	Miami	Florida	South	33180	United States of America
151	151	Corporate	Wilmington	North Carolina	South	28403	United States of America
152	152	Consumer	San Francisco	California	West	94110	United States of America
153	153	Corporate	Seattle	Washington	West	98105	United States of America
154	154	Consumer	Huntington Beach	California	West	92646	United States of America
155	155	Corporate	Richmond	Kentucky	South	40475	United States of America
156	156	Corporate	Los Angeles	California	West	90045	United States of America
157	157	Consumer	Louisville	Colorado	West	80027	United States of America
158	158	Corporate	Lawrence	Massachusetts	East	1841	United States of America
159	159	Consumer	Jackson	Mississippi	South	39212	United States of America
160	160	Corporate	Canton	Michigan	Central	48187	United States of America
161	161	Home Office	New Rochelle	New York	East	10801	United States of America
162	162	Corporate	San Antonio	Texas	Central	78207	United States of America
163	163	Home Office	Gastonia	North Carolina	South	28052	United States of America
164	164	Consumer	Jacksonville	Florida	South	32216	United States of America
165	165	Corporate	Houston	Texas	Central	77070	United States of America
166	166	Consumer	Detroit	Michigan	Central	48227	United States of America
167	167	Consumer	Columbus	Indiana	Central	47201	United States of America
168	168	Consumer	Auburn	New York	East	13021	United States of America
169	169	Corporate	Akron	Ohio	East	44312	United States of America
170	170	Corporate	Norman	Oklahoma	Central	73071	United States of America
171	171	Consumer	Concord	California	West	94521	United States of America
172	172	Consumer	Decatur	Illinois	Central	62521	United States of America
173	173	Home Office	Phoenix	Arizona	West	85023	United States of America
174	174	Home Office	Park Ridge	Illinois	Central	60068	United States of America
175	175	Corporate	Amarillo	Texas	Central	79109	United States of America
176	176	Corporate	Lindenhurst	New York	East	11757	United States of America
177	177	Corporate	Los Angeles	California	West	90008	United States of America
178	178	Consumer	San Diego	California	West	92024	United States of America
179	179	Home Office	Los Angeles	California	West	90045	United States of America
180	180	Home Office	Huntsville	Texas	Central	77340	United States of America
181	181	Consumer	Rochester	New York	East	14609	United States of America
182	182	Consumer	Fayetteville	Arkansas	South	72701	United States of America
183	183	Consumer	Costa Mesa	California	West	92627	United States of America
184	184	Corporate	Parker	Colorado	West	80134	United States of America
185	185	Consumer	Atlanta	Georgia	South	30318	United States of America
186	186	Consumer	Gladstone	Missouri	Central	64118	United States of America
187	187	Home Office	Great Falls	Montana	West	59405	United States of America
188	188	Consumer	Houston	Texas	Central	77041	United States of America
189	189	Corporate	Detroit	Michigan	Central	48234	United States of America
190	190	Consumer	Lawrence	Massachusetts	East	1841	United States of America
191	191	Home Office	Lakeland	Florida	South	33801	United States of America
192	192	Consumer	Montgomery	Alabama	South	36116	United States of America
193	193	Consumer	Mesa	Arizona	West	85204	United States of America
194	194	Consumer	Chicago	Illinois	Central	60653	United States of America
195	195	Consumer	Green Bay	Wisconsin	Central	54302	United States of America
196	196	Corporate	Tucson	Arizona	West	85705	United States of America
197	197	Consumer	Springfield	Ohio	East	45503	United States of America
198	198	Consumer	Fort Worth	Texas	Central	76106	United States of America
199	199	Corporate	Chicago	Illinois	Central	60653	United States of America
200	200	Corporate	Anaheim	California	West	92804	United States of America
201	201	Consumer	Wilmington	North Carolina	South	28403	United States of America
202	202	Consumer	Tampa	Florida	South	33614	United States of America
203	203	Consumer	Seattle	Washington	West	98105	United States of America
204	204	Consumer	Los Angeles	California	West	90008	United States of America
205	205	Consumer	Marysville	Washington	West	98270	United States of America
206	206	Consumer	Long Beach	California	West	90805	United States of America
207	207	Consumer	Richmond	Kentucky	South	40475	United States of America
208	208	Consumer	Salem	Oregon	West	97301	United States of America
209	209	Consumer	Laredo	Texas	Central	78041	United States of America
210	210	Consumer	Philadelphia	Pennsylvania	East	19120	United States of America
211	211	Corporate	Dallas	Texas	Central	75217	United States of America
212	212	Consumer	Grove City	Ohio	East	43123	United States of America
213	213	Corporate	New York City	New York	East	10011	United States of America
214	214	Corporate	Dearborn	Michigan	Central	48126	United States of America
215	215	Corporate	Warner Robins	Georgia	South	31088	United States of America
216	216	Home Office	Vallejo	California	West	94591	United States of America
217	217	Corporate	Minneapolis	Minnesota	Central	55407	United States of America
218	218	Consumer	Mission Viejo	California	West	92691	United States of America
219	219	Consumer	Rochester Hills	Michigan	Central	48307	United States of America
220	220	Home Office	Plainfield	New Jersey	East	7060	United States of America
221	221	Home Office	Columbus	Indiana	Central	47201	United States of America
222	222	Corporate	Sierra Vista	Arizona	West	85635	United States of America
223	223	Corporate	Vancouver	Washington	West	98661	United States of America
224	224	Home Office	Aurora	Illinois	Central	60505	United States of America
225	225	Consumer	Arlington	Texas	Central	76017	United States of America
226	226	Consumer	Louisville	Kentucky	South	40214	United States of America
227	227	Corporate	Dallas	Texas	Central	75081	United States of America
228	228	Consumer	Cleveland	Ohio	East	44105	United States of America
229	229	Home Office	Chicago	Illinois	Central	60653	United States of America
230	230	Consumer	Quincy	Illinois	Central	62301	United States of America
231	231	Consumer	Tyler	Texas	Central	75701	United States of America
232	232	Corporate	Burlington	North Carolina	South	27217	United States of America
233	233	Consumer	Waynesboro	Virginia	South	22980	United States of America
234	234	Consumer	Los Angeles	California	West	90036	United States of America
235	235	Home Office	Chester	Pennsylvania	East	19013	United States of America
236	236	Corporate	Cleveland	Ohio	East	44105	United States of America
237	237	Corporate	Seattle	Washington	West	98103	United States of America
238	238	Corporate	Cary	North Carolina	South	27511	United States of America
239	239	Consumer	Palm Coast	Florida	South	32137	United States of America
240	240	Corporate	Mount Vernon	New York	East	10550	United States of America
241	241	Home Office	Orem	Utah	West	84057	United States of America
242	242	Corporate	Detroit	Michigan	Central	48205	United States of America
243	243	Home Office	Philadelphia	Pennsylvania	East	19140	United States of America
244	244	Corporate	Hialeah	Florida	South	33012	United States of America
245	245	Consumer	Oceanside	New York	East	11572	United States of America
246	246	Home Office	Seattle	Washington	West	98115	United States of America
247	247	Home Office	Naperville	Illinois	Central	60540	United States of America
248	248	Corporate	San Diego	California	West	92105	United States of America
249	249	Consumer	Evanston	Illinois	Central	60201	United States of America
250	250	Consumer	Trenton	Michigan	Central	48183	United States of America
251	251	Corporate	Jacksonville	Florida	South	32216	United States of America
252	252	Consumer	Cottage Grove	Minnesota	Central	55016	United States of America
253	253	Corporate	New York City	New York	East	10009	United States of America
254	254	Corporate	Green Bay	Wisconsin	Central	54302	United States of America
255	255	Corporate	Atlanta	Georgia	South	30318	United States of America
256	256	Corporate	Bossier City	Louisiana	South	71111	United States of America
257	257	Corporate	Des Moines	Iowa	Central	50315	United States of America
258	258	Home Office	San Francisco	California	West	94110	United States of America
259	259	Corporate	Columbia	South Carolina	South	29203	United States of America
260	260	Consumer	Lancaster	California	West	93534	United States of America
261	261	Consumer	Richmond	Virginia	South	23223	United States of America
262	262	Consumer	Asheville	North Carolina	South	28806	United States of America
263	263	Corporate	Rochester	New York	East	14609	United States of America
264	264	Consumer	Lake Elsinore	California	West	92530	United States of America
265	265	Corporate	Monroe	Louisiana	South	71203	United States of America
266	266	Consumer	Omaha	Nebraska	Central	68104	United States of America
267	267	Consumer	Edmonds	Washington	West	98026	United States of America
268	268	Consumer	Santa Ana	California	West	92704	United States of America
269	269	Corporate	Milwaukee	Wisconsin	Central	53209	United States of America
270	270	Consumer	Belleville	New Jersey	East	7109	United States of America
271	271	Consumer	Lakeville	Minnesota	Central	55044	United States of America
272	272	Consumer	Florence	Kentucky	South	41042	United States of America
273	273	Corporate	Tampa	Florida	South	33614	United States of America
274	274	Home Office	Columbia	Tennessee	South	38401	United States of America
275	275	Corporate	Fort Worth	Texas	Central	76106	United States of America
276	276	Consumer	Lorain	Ohio	East	44052	United States of America
277	277	Corporate	Linden	New Jersey	East	7036	United States of America
278	278	Corporate	Salinas	California	West	93905	United States of America
279	279	Home Office	New Brunswick	New Jersey	East	8901	United States of America
280	280	Corporate	Springfield	Virginia	South	22153	United States of America
281	281	Corporate	Lancaster	Pennsylvania	East	17602	United States of America
282	282	Home Office	Philadelphia	Pennsylvania	East	19143	United States of America
283	283	Consumer	Concord	New Hampshire	East	3301	United States of America
284	284	Home Office	Concord	New Hampshire	East	3301	United States of America
285	285	Home Office	Philadelphia	Pennsylvania	East	19120	United States of America
286	286	Home Office	Detroit	Michigan	Central	48227	United States of America
287	287	Consumer	San Diego	California	West	92105	United States of America
288	288	Home Office	Columbia	Maryland	East	21044	United States of America
289	289	Consumer	New Rochelle	New York	East	10801	United States of America
290	290	Corporate	Auburn	New York	East	13021	United States of America
291	291	Corporate	Springfield	Ohio	East	45503	United States of America
292	292	Consumer	Garland	Texas	Central	75043	United States of America
293	293	Home Office	Norwich	Connecticut	East	6360	United States of America
294	294	Consumer	Alexandria	Virginia	South	22304	United States of America
295	295	Home Office	Springfield	Virginia	South	22153	United States of America
296	296	Consumer	Toledo	Ohio	East	43615	United States of America
297	297	Corporate	Farmington	New Mexico	West	87401	United States of America
298	298	Corporate	Riverside	California	West	92503	United States of America
299	299	Corporate	Torrance	California	West	90503	United States of America
300	300	Consumer	Round Rock	Texas	Central	78664	United States of America
301	301	Consumer	Oceanside	California	West	92054	United States of America
302	302	Home Office	Fayetteville	Arkansas	South	72701	United States of America
303	303	Consumer	Boca Raton	Florida	South	33433	United States of America
304	304	Home Office	New York City	New York	East	10011	United States of America
305	305	Corporate	Columbus	Indiana	Central	47201	United States of America
306	306	Home Office	Pasadena	Texas	Central	77506	United States of America
307	307	Home Office	Jacksonville	Florida	South	32216	United States of America
308	308	Consumer	San Jose	California	West	95123	United States of America
309	309	Corporate	Virginia Beach	Virginia	South	23464	United States of America
310	310	Home Office	Vancouver	Washington	West	98661	United States of America
311	311	Consumer	Murrieta	California	West	92563	United States of America
312	312	Consumer	Jacksonville	North Carolina	South	28540	United States of America
313	313	Consumer	Scottsdale	Arizona	West	85254	United States of America
314	314	Consumer	Burlington	Iowa	Central	52601	United States of America
315	315	Consumer	Olympia	Washington	West	98502	United States of America
316	316	Home Office	Los Angeles	California	West	90036	United States of America
317	317	Consumer	Washington	District of Columbia	East	20016	United States of America
318	318	Home Office	Springfield	Ohio	East	45503	United States of America
319	319	Home Office	Jefferson City	Missouri	Central	65109	United States of America
320	320	Consumer	Burlington	North Carolina	South	27217	United States of America
321	321	Home Office	Saint Peters	Missouri	Central	63376	United States of America
322	322	Corporate	Chicago	Illinois	Central	60610	United States of America
323	323	Home Office	Rockford	Illinois	Central	61107	United States of America
324	324	Consumer	Miami	Florida	South	33142	United States of America
325	325	Corporate	Philadelphia	Pennsylvania	East	19134	United States of America
326	326	Corporate	San Diego	California	West	92037	United States of America
327	327	Corporate	Toledo	Ohio	East	43615	United States of America
328	328	Consumer	Brownsville	Texas	Central	78521	United States of America
329	329	Home Office	Los Angeles	California	West	90008	United States of America
330	330	Home Office	Denver	Colorado	West	80219	United States of America
331	331	Consumer	Yonkers	New York	East	10701	United States of America
332	332	Consumer	Des Moines	Iowa	Central	50315	United States of America
333	333	Corporate	Oakland	California	West	94601	United States of America
334	334	Corporate	Monroe	North Carolina	South	28110	United States of America
335	335	Home Office	Clinton	Maryland	East	20735	United States of America
336	336	Home Office	Charlotte	North Carolina	South	28205	United States of America
337	337	Home Office	San Francisco	California	West	94122	United States of America
338	338	Consumer	Riverside	California	West	92503	United States of America
339	339	Consumer	Encinitas	California	West	92024	United States of America
340	340	Consumer	Roswell	Georgia	South	30076	United States of America
341	341	Consumer	Jonesboro	Arkansas	South	72401	United States of America
342	342	Home Office	Richmond	Indiana	Central	47374	United States of America
343	343	Corporate	Antioch	California	West	94509	United States of America
344	344	Home Office	Philadelphia	Pennsylvania	East	19134	United States of America
345	345	Consumer	Homestead	Florida	South	33030	United States of America
346	346	Corporate	La Porte	Indiana	Central	46350	United States of America
347	347	Consumer	Lansing	Michigan	Central	48911	United States of America
348	348	Corporate	Cuyahoga Falls	Ohio	East	44221	United States of America
349	349	Corporate	Reno	Nevada	West	89502	United States of America
350	350	Home Office	Harrisonburg	Virginia	South	22801	United States of America
351	351	Corporate	Los Angeles	California	West	90004	United States of America
352	352	Consumer	Escondido	California	West	92025	United States of America
353	353	Consumer	Royal Oak	Michigan	Central	48073	United States of America
354	354	Consumer	Rockville	Maryland	East	20852	United States of America
355	355	Home Office	Houston	Texas	Central	77070	United States of America
356	356	Consumer	Lakewood	New Jersey	East	8701	United States of America
357	357	Corporate	Coral Springs	Florida	South	33065	United States of America
358	358	Corporate	Denver	Colorado	West	80219	United States of America
359	359	Consumer	Buffalo	New York	East	14215	United States of America
360	360	Consumer	Boynton Beach	Florida	South	33437	United States of America
361	361	Consumer	Gulfport	Mississippi	South	39503	United States of America
362	362	Consumer	Fresno	California	West	93727	United States of America
363	363	Consumer	Milwaukee	Wisconsin	Central	53209	United States of America
364	364	Corporate	Greenville	North Carolina	South	27834	United States of America
365	365	Consumer	Long Beach	New York	East	11561	United States of America
366	366	Consumer	La Porte	Indiana	Central	46350	United States of America
367	367	Corporate	Louisville	Colorado	West	80027	United States of America
368	368	Consumer	Florence	Alabama	South	35630	United States of America
369	369	Corporate	Macon	Georgia	South	31204	United States of America
370	370	Consumer	Cedar Rapids	Iowa	Central	52402	United States of America
371	371	Consumer	Providence	Rhode Island	East	2908	United States of America
372	372	Consumer	Pueblo	Colorado	West	81001	United States of America
373	373	Corporate	Fairfield	California	West	94533	United States of America
374	374	Home Office	Arlington	Virginia	South	22204	United States of America
375	375	Consumer	Columbus	Georgia	South	31907	United States of America
376	376	Corporate	Los Angeles	California	West	90032	United States of America
377	377	Corporate	Deltona	Florida	South	32725	United States of America
378	378	Consumer	Murray	Kentucky	South	42071	United States of America
379	379	Corporate	Norwich	Connecticut	East	6360	United States of America
380	380	Home Office	Lorain	Ohio	East	44052	United States of America
381	381	Home Office	Los Angeles	California	West	90049	United States of America
382	382	Consumer	Middletown	Connecticut	East	6457	United States of America
383	383	Consumer	New York City	New York	East	10011	United States of America
384	384	Corporate	Jacksonville	North Carolina	South	28540	United States of America
385	385	Consumer	Freeport	New York	East	11520	United States of America
386	386	Corporate	Arlington	Virginia	South	22204	United States of America
387	387	Home Office	Pico Rivera	California	West	90660	United States of America
388	388	Consumer	Colorado Springs	Colorado	West	80906	United States of America
389	389	Consumer	Vallejo	California	West	94591	United States of America
390	390	Consumer	Provo	Utah	West	84604	United States of America
391	391	Consumer	Pleasant Grove	Utah	West	84062	United States of America
392	392	Home Office	Smyrna	Georgia	South	30080	United States of America
393	393	Corporate	Aurora	Illinois	Central	60505	United States of America
394	394	Home Office	Salem	Virginia	South	24153	United States of America
395	395	Home Office	Grand Prairie	Texas	Central	75051	United States of America
396	396	Home Office	Costa Mesa	California	West	92627	United States of America
397	397	Corporate	Mesa	Arizona	West	85204	United States of America
398	398	Consumer	Parma	Ohio	East	44134	United States of America
399	399	Consumer	Amarillo	Texas	Central	79109	United States of America
400	400	Corporate	Aurora	Colorado	West	80013	United States of America
401	401	Corporate	Mobile	Alabama	South	36608	United States of America
402	402	Home Office	Columbus	Georgia	South	31907	United States of America
403	403	Corporate	New Bedford	Massachusetts	East	2740	United States of America
404	404	Corporate	Irving	Texas	Central	75061	United States of America
405	405	Consumer	Vineland	New Jersey	East	8360	United States of America
406	406	Consumer	Glendale	Arizona	West	85301	United States of America
407	407	Home Office	Niagara Falls	New York	East	14304	United States of America
408	408	Consumer	Thomasville	North Carolina	South	27360	United States of America
409	409	Consumer	Westminster	California	West	92683	United States of America
410	410	Consumer	Jackson	Tennessee	South	38301	United States of America
411	411	Corporate	Seattle	Washington	West	98115	United States of America
412	412	Consumer	Coppell	Texas	Central	75019	United States of America
413	413	Home Office	Omaha	Nebraska	Central	68104	United States of America
414	414	Corporate	Pomona	California	West	91767	United States of America
415	415	Consumer	North Las Vegas	Nevada	West	89031	United States of America
416	416	Consumer	Allentown	Pennsylvania	East	18103	United States of America
417	417	Corporate	Newark	Delaware	East	19711	United States of America
418	418	Corporate	Miami	Florida	South	33142	United States of America
419	419	Consumer	Tempe	Arizona	West	85281	United States of America
420	420	Home Office	Laguna Niguel	California	West	92677	United States of America
421	421	Corporate	Bridgeton	New Jersey	East	8302	United States of America
422	422	Consumer	Everett	Massachusetts	East	2149	United States of America
423	423	Home Office	San Diego	California	West	92024	United States of America
424	424	Corporate	Watertown	New York	East	13601	United States of America
425	425	Home Office	Appleton	Wisconsin	Central	54915	United States of America
426	426	Corporate	Bellevue	Washington	West	98006	United States of America
427	427	Home Office	San Francisco	California	West	94109	United States of America
428	428	Consumer	Allen	Texas	Central	75002	United States of America
429	429	Consumer	El Paso	Texas	Central	79907	United States of America
430	430	Home Office	Florence	Alabama	South	35630	United States of America
431	431	Corporate	Grapevine	Texas	Central	76051	United States of America
432	432	Home Office	Peoria	Illinois	Central	61604	United States of America
433	433	Consumer	Carrollton	Texas	Central	75007	United States of America
434	434	Corporate	Dover	Delaware	East	19901	United States of America
435	435	Consumer	Smyrna	Tennessee	South	37167	United States of America
436	436	Consumer	Newark	Delaware	East	19711	United States of America
437	437	Home Office	Eagan	Minnesota	Central	55122	United States of America
438	438	Consumer	Kent	Washington	West	98031	United States of America
439	439	Consumer	Lafayette	Louisiana	South	70506	United States of America
440	440	Consumer	Tigard	Oregon	West	97224	United States of America
441	441	Corporate	Skokie	Illinois	Central	60076	United States of America
442	442	Consumer	Dallas	Texas	Central	75217	United States of America
443	443	Corporate	North Las Vegas	Nevada	West	89031	United States of America
444	444	Consumer	Plano	Texas	Central	75023	United States of America
445	445	Consumer	Suffolk	Virginia	South	23434	United States of America
446	446	Consumer	Indianapolis	Indiana	Central	46203	United States of America
447	447	Home Office	Plano	Texas	Central	75023	United States of America
448	448	Home Office	Bayonne	New Jersey	East	7002	United States of America
449	449	Home Office	San Diego	California	West	92037	United States of America
450	450	Corporate	Dublin	Ohio	East	43017	United States of America
451	451	Corporate	Fayetteville	North Carolina	South	28314	United States of America
452	452	Consumer	Dallas	Texas	Central	75081	United States of America
453	453	Home Office	San Antonio	Texas	Central	78207	United States of America
454	454	Consumer	Oakland	California	West	94601	United States of America
455	455	Home Office	Suffolk	Virginia	South	23434	United States of America
456	456	Consumer	Greensboro	North Carolina	South	27405	United States of America
457	457	Corporate	Baltimore	Maryland	East	21215	United States of America
458	458	Corporate	Kenosha	Wisconsin	Central	53142	United States of America
459	459	Home Office	Olathe	Kansas	Central	66062	United States of America
460	460	Home Office	Auburn	Washington	West	98002	United States of America
461	461	Corporate	Tulsa	Oklahoma	Central	74133	United States of America
462	462	Consumer	Harrisonburg	Virginia	South	22801	United States of America
463	463	Consumer	Redmond	Oregon	West	97756	United States of America
464	464	Home Office	Raleigh	North Carolina	South	27604	United States of America
465	465	Home Office	Muskogee	Oklahoma	Central	74403	United States of America
466	466	Corporate	Austin	Texas	Central	78745	United States of America
467	467	Consumer	Meriden	Connecticut	East	6450	United States of America
468	468	Corporate	Roswell	Georgia	South	30076	United States of America
469	469	Corporate	Bowling Green	Kentucky	South	42104	United States of America
470	470	Home Office	Washington	District of Columbia	East	20016	United States of America
471	471	Consumer	South Bend	Indiana	Central	46614	United States of America
472	472	Corporate	Bristol	Connecticut	East	6010	United States of America
473	473	Corporate	Newark	Ohio	East	43055	United States of America
474	474	Corporate	Henderson	Nevada	West	89015	United States of America
475	475	Consumer	Spokane	Washington	West	99207	United States of America
476	476	Consumer	Keller	Texas	Central	76248	United States of America
477	477	Home Office	Hialeah	Florida	South	33012	United States of America
478	478	Consumer	Fairfield	Ohio	East	45014	United States of America
479	479	Corporate	Huntington Beach	California	West	92646	United States of America
480	480	Consumer	Port Orange	Florida	South	32127	United States of America
481	481	Consumer	Medford	Oregon	West	97504	United States of America
482	482	Consumer	Charlottesville	Virginia	South	22901	United States of America
483	483	Consumer	Missoula	Montana	West	59801	United States of America
484	484	Consumer	Miami	Florida	South	33178	United States of America
485	485	Consumer	Florence	South Carolina	South	29501	United States of America
486	486	Home Office	Detroit	Michigan	Central	48205	United States of America
487	487	Corporate	Springfield	Oregon	West	97477	United States of America
488	488	Corporate	Indianapolis	Indiana	Central	46203	United States of America
489	489	Corporate	Apopka	Florida	South	32712	United States of America
490	490	Home Office	Boynton Beach	Florida	South	33437	United States of America
491	491	Consumer	Franklin	Massachusetts	East	2038	United States of America
492	492	Corporate	Reading	Pennsylvania	East	19601	United States of America
493	493	Corporate	Arlington	Texas	Central	76017	United States of America
494	494	Consumer	Broomfield	Colorado	West	80020	United States of America
495	495	Corporate	Carrollton	Texas	Central	75007	United States of America
496	496	Consumer	Springfield	Missouri	Central	65807	United States of America
497	497	Consumer	Paterson	New Jersey	East	7501	United States of America
498	498	Consumer	Tulsa	Oklahoma	Central	74133	United States of America
499	499	Corporate	Montgomery	Alabama	South	36116	United States of America
500	500	Consumer	Oklahoma City	Oklahoma	Central	73120	United States of America
501	501	Corporate	Brentwood	California	West	94513	United States of America
502	502	Home Office	Springfield	Oregon	West	97477	United States of America
503	503	Corporate	Chesapeake	Virginia	South	23320	United States of America
504	504	Home Office	Lubbock	Texas	Central	79424	United States of America
505	505	Corporate	Columbia	Missouri	Central	65203	United States of America
506	506	Consumer	Johnson City	Tennessee	South	37604	United States of America
507	507	Consumer	Auburn	Alabama	South	36830	United States of America
508	508	Consumer	San Bernardino	California	West	92404	United States of America
509	509	Home Office	Providence	Rhode Island	East	2908	United States of America
510	510	Home Office	Lancaster	California	West	93534	United States of America
511	511	Corporate	Leominster	Massachusetts	East	1453	United States of America
512	512	Home Office	Bozeman	Montana	West	59715	United States of America
513	513	Home Office	Peoria	Arizona	West	85345	United States of America
514	514	Corporate	Lakewood	Ohio	East	44107	United States of America
515	515	Corporate	Houston	Texas	Central	77095	United States of America
516	516	Corporate	Perth Amboy	New Jersey	East	8861	United States of America
517	517	Consumer	Richmond	Indiana	Central	47374	United States of America
518	518	Consumer	Pomona	California	West	91767	United States of America
519	519	Consumer	Ontario	California	West	91761	United States of America
520	520	Home Office	Brentwood	California	West	94513	United States of America
521	521	Consumer	Baltimore	Maryland	East	21215	United States of America
522	522	Home Office	Houston	Texas	Central	77036	United States of America
523	523	Corporate	Rancho Cucamonga	California	West	91730	United States of America
524	524	Home Office	Moorhead	Minnesota	Central	56560	United States of America
525	525	Consumer	Farmington	New Mexico	West	87401	United States of America
526	526	Home Office	Jackson	Mississippi	South	39212	United States of America
527	527	Home Office	Tucson	Arizona	West	85705	United States of America
528	528	Corporate	Mesquite	Texas	Central	75150	United States of America
529	529	Consumer	Redlands	California	West	92374	United States of America
530	530	Consumer	Stockton	California	West	95207	United States of America
531	531	Consumer	Ormond Beach	Florida	South	32174	United States of America
532	532	Corporate	Sunnyvale	California	West	94086	United States of America
533	533	Home Office	Lansing	Michigan	Central	48911	United States of America
534	534	Corporate	Dover	New Hampshire	East	3820	United States of America
535	535	Consumer	Grand Prairie	Texas	Central	75051	United States of America
536	536	Corporate	Long Beach	New York	East	11561	United States of America
537	537	Corporate	York	Pennsylvania	East	17403	United States of America
538	538	Consumer	College Station	Texas	Central	77840	United States of America
539	539	Consumer	Saint Louis	Missouri	Central	63116	United States of America
540	540	Consumer	Quincy	Massachusetts	East	2169	United States of America
541	541	Home Office	Dallas	Texas	Central	75081	United States of America
542	542	Home Office	Deltona	Florida	South	32725	United States of America
543	543	Home Office	Oakland	California	West	94601	United States of America
544	544	Home Office	Manteca	California	West	95336	United States of America
545	545	Consumer	Kent	Ohio	East	44240	United States of America
546	546	Corporate	San Angelo	Texas	Central	76903	United States of America
547	547	Home Office	Salt Lake City	Utah	West	84106	United States of America
548	548	Consumer	Huntsville	Alabama	South	35810	United States of America
549	549	Consumer	Knoxville	Tennessee	South	37918	United States of America
550	550	Consumer	Little Rock	Arkansas	South	72209	United States of America
551	551	Home Office	Seattle	Washington	West	98103	United States of America
552	552	Consumer	Lancaster	Pennsylvania	East	17602	United States of America
553	553	Home Office	Bristol	Tennessee	South	37620	United States of America
554	554	Corporate	Lincoln Park	Michigan	Central	48146	United States of America
555	555	Consumer	Marion	Ohio	East	43302	United States of America
556	556	Consumer	Littleton	Colorado	West	80122	United States of America
557	557	Corporate	Burlington	Vermont	East	5408	United States of America
558	558	Home Office	Provo	Utah	West	84604	United States of America
559	559	Home Office	Pasadena	California	West	91104	United States of America
560	560	Home Office	San Diego	California	West	92105	United States of America
561	561	Corporate	Bangor	Maine	East	4401	United States of America
562	562	Home Office	Monroe	North Carolina	South	28110	United States of America
563	563	Corporate	Miami	Florida	South	33180	United States of America
564	564	Consumer	Southaven	Mississippi	South	38671	United States of America
565	565	Corporate	Middletown	Connecticut	East	6457	United States of America
566	566	Consumer	New Castle	Indiana	Central	47362	United States of America
567	567	Consumer	Salem	Virginia	South	24153	United States of America
568	568	Consumer	Midland	Michigan	Central	48640	United States of America
569	569	Home Office	Roswell	Georgia	South	30076	United States of America
570	570	Corporate	Sioux Falls	South Dakota	Central	57103	United States of America
571	571	Corporate	Henderson	Kentucky	South	42420	United States of America
572	572	Home Office	Fort Collins	Colorado	West	80525	United States of America
573	573	Consumer	Lafayette	Indiana	Central	47905	United States of America
574	574	Consumer	Clarksville	Tennessee	South	37042	United States of America
575	575	Consumer	Warner Robins	Georgia	South	31088	United States of America
576	576	Home Office	Franklin	Massachusetts	East	2038	United States of America
577	577	Home Office	Milwaukee	Wisconsin	Central	53209	United States of America
578	578	Home Office	Waynesboro	Virginia	South	22980	United States of America
579	579	Consumer	Sacramento	California	West	95823	United States of America
580	580	Consumer	Clinton	Maryland	East	20735	United States of America
581	581	Corporate	Fairfield	Ohio	East	45014	United States of America
582	582	Consumer	Smyrna	Georgia	South	30080	United States of America
583	583	Home Office	Thousand Oaks	California	West	91360	United States of America
584	584	Consumer	Malden	Massachusetts	East	2148	United States of America
585	585	Corporate	Florence	South Carolina	South	29501	United States of America
586	586	Corporate	Huntsville	Texas	Central	77340	United States of America
587	587	Home Office	Holyoke	Massachusetts	East	1040	United States of America
588	588	Corporate	Albuquerque	New Mexico	West	87105	United States of America
589	589	Corporate	Sparks	Nevada	West	89431	United States of America
590	590	Corporate	Coachella	California	West	92236	United States of America
591	591	Home Office	Elmhurst	Illinois	Central	60126	United States of America
592	592	Consumer	Passaic	New Jersey	East	7055	United States of America
593	593	Consumer	North Charleston	South Carolina	South	29406	United States of America
594	594	Home Office	San Jose	California	West	95123	United States of America
595	595	Consumer	Plainfield	New Jersey	East	7060	United States of America
596	596	Consumer	Newport News	Virginia	South	23602	United States of America
597	597	Consumer	Fayetteville	North Carolina	South	28314	United States of America
598	598	Consumer	Jamestown	New York	East	14701	United States of America
599	599	Consumer	Mishawaka	Indiana	Central	46544	United States of America
600	600	Home Office	Oklahoma City	Oklahoma	Central	73120	United States of America
601	601	Consumer	Monroe	Louisiana	South	71203	United States of America
602	602	Consumer	Bowling Green	Ohio	East	43402	United States of America
603	603	Corporate	Westfield	New Jersey	East	7090	United States of America
604	604	Home Office	Fort Lauderdale	Florida	South	33311	United States of America
605	605	Corporate	Little Rock	Arkansas	South	72209	United States of America
606	606	Corporate	La Quinta	California	West	92253	United States of America
607	607	Corporate	Scottsdale	Arizona	West	85254	United States of America
608	608	Home Office	Malden	Massachusetts	East	2148	United States of America
609	609	Home Office	Columbia	South Carolina	South	29203	United States of America
610	610	Consumer	Tallahassee	Florida	South	32303	United States of America
611	611	Consumer	Nashville	Tennessee	South	37211	United States of America
612	612	Consumer	Bowling Green	Kentucky	South	42104	United States of America
613	613	Consumer	Bellingham	Washington	West	98226	United States of America
614	614	Home Office	Woodstock	Illinois	Central	60098	United States of America
615	615	Home Office	Lafayette	Indiana	Central	47905	United States of America
616	616	Home Office	Alexandria	Virginia	South	22304	United States of America
617	617	Corporate	Haltom City	Texas	Central	76117	United States of America
618	618	Consumer	Wheeling	Illinois	Central	60090	United States of America
619	619	Corporate	Summerville	South Carolina	South	29483	United States of America
620	620	Corporate	Carlsbad	New Mexico	West	88220	United States of America
621	621	Corporate	Saint Louis	Missouri	Central	63116	United States of America
622	622	Consumer	Hot Springs	Arkansas	South	71901	United States of America
623	623	Consumer	Aurora	Illinois	Central	60505	United States of America
624	624	Corporate	Provo	Utah	West	84604	United States of America
625	625	Home Office	Springfield	Missouri	Central	65807	United States of America
626	626	Corporate	Lowell	Massachusetts	East	1852	United States of America
627	627	Consumer	Peoria	Illinois	Central	61604	United States of America
628	628	Consumer	Englewood	Colorado	West	80112	United States of America
629	629	Consumer	Hialeah	Florida	South	33012	United States of America
630	630	Consumer	Lancaster	Ohio	East	43130	United States of America
631	631	Home Office	Carlsbad	New Mexico	West	88220	United States of America
632	632	Consumer	Las Cruces	New Mexico	West	88001	United States of America
633	633	Corporate	Hoover	Alabama	South	35244	United States of America
634	634	Home Office	Frisco	Texas	Central	75034	United States of America
635	635	Consumer	Vacaville	California	West	95687	United States of America
636	636	Home Office	Murray	Utah	West	84107	United States of America
637	637	Consumer	Waukesha	Wisconsin	Central	53186	United States of America
638	638	Consumer	Detroit	Michigan	Central	48205	United States of America
639	639	Consumer	Bakersfield	California	West	93309	United States of America
640	640	Corporate	Pompano Beach	Florida	South	33068	United States of America
641	641	Consumer	Detroit	Michigan	Central	48234	United States of America
642	642	Corporate	Troy	Ohio	East	45373	United States of America
643	643	Corporate	Corpus Christi	Texas	Central	78415	United States of America
644	644	Corporate	Omaha	Nebraska	Central	68104	United States of America
645	645	Corporate	Redondo Beach	California	West	90278	United States of America
646	646	Consumer	Anaheim	California	West	92804	United States of America
647	647	Home Office	Chesapeake	Virginia	South	23320	United States of America
648	648	Consumer	Huntsville	Texas	Central	77340	United States of America
649	649	Corporate	Woodstock	Illinois	Central	60098	United States of America
650	650	Corporate	Palm Coast	Florida	South	32137	United States of America
651	651	Consumer	Sioux Falls	South Dakota	Central	57103	United States of America
652	652	Consumer	Orlando	Florida	South	32839	United States of America
653	653	Consumer	Saint Petersburg	Florida	South	33710	United States of America
654	654	Home Office	Orange	New Jersey	East	7050	United States of America
655	655	Consumer	Woodstock	Illinois	Central	60098	United States of America
656	656	Consumer	Lake Charles	Louisiana	South	70601	United States of America
657	657	Corporate	Highland Park	Illinois	Central	60035	United States of America
658	658	Consumer	Eagan	Minnesota	Central	55122	United States of America
659	659	Consumer	Coral Springs	Florida	South	33065	United States of America
660	660	Consumer	Hempstead	New York	East	11550	United States of America
661	661	Consumer	Noblesville	Indiana	Central	46060	United States of America
662	662	Home Office	Austin	Texas	Central	78745	United States of America
663	663	Consumer	Watertown	New York	East	13601	United States of America
664	664	Consumer	Apple Valley	Minnesota	Central	55124	United States of America
665	665	Home Office	Burlington	North Carolina	South	27217	United States of America
666	666	Home Office	Saginaw	Michigan	Central	48601	United States of America
667	667	Home Office	Glendale	Arizona	West	85301	United States of America
668	668	Home Office	Watertown	New York	East	13601	United States of America
669	669	Corporate	Oceanside	California	West	92054	United States of America
670	670	Consumer	Skokie	Illinois	Central	60076	United States of America
671	671	Consumer	Mount Pleasant	South Carolina	South	29464	United States of America
672	672	Consumer	Springfield	Oregon	West	97477	United States of America
673	673	Home Office	Sterling Heights	Michigan	Central	48310	United States of America
674	674	Home Office	Rochester	New York	East	14609	United States of America
675	675	Home Office	Eau Claire	Wisconsin	Central	54703	United States of America
676	676	Consumer	Rancho Cucamonga	California	West	91730	United States of America
677	677	Home Office	Louisville	Colorado	West	80027	United States of America
678	678	Home Office	Pharr	Texas	Central	78577	United States of America
679	679	Corporate	Billings	Montana	West	59102	United States of America
680	680	Consumer	Chesapeake	Virginia	South	23320	United States of America
681	681	Corporate	Gresham	Oregon	West	97030	United States of America
682	682	Consumer	Gresham	Oregon	West	97030	United States of America
683	683	Corporate	Pasadena	California	West	91104	United States of America
684	684	Consumer	Chattanooga	Tennessee	South	37421	United States of America
685	685	Home Office	Long Beach	California	West	90805	United States of America
686	686	Consumer	Troy	Ohio	East	45373	United States of America
687	687	Home Office	Minneapolis	Minnesota	Central	55407	United States of America
688	688	Home Office	Meridian	Idaho	West	83642	United States of America
689	689	Home Office	Albuquerque	New Mexico	West	87105	United States of America
690	690	Home Office	Toledo	Ohio	East	43615	United States of America
691	691	Home Office	Dallas	Texas	Central	75217	United States of America
692	692	Home Office	Apple Valley	California	West	92307	United States of America
693	693	Home Office	Louisville	Kentucky	South	40214	United States of America
694	694	Home Office	Henderson	Kentucky	South	42420	United States of America
695	695	Consumer	Bolingbrook	Illinois	Central	60440	United States of America
696	696	Corporate	Providence	Rhode Island	East	2908	United States of America
697	697	Corporate	Lakeland	Florida	South	33801	United States of America
698	698	Corporate	Oceanside	New York	East	11572	United States of America
699	699	Corporate	Maple Grove	Minnesota	Central	55369	United States of America
700	700	Corporate	Tallahassee	Florida	South	32303	United States of America
701	701	Consumer	Fort Collins	Colorado	West	80525	United States of America
702	702	Corporate	Columbia	Maryland	East	21044	United States of America
703	703	Corporate	Woodland	California	West	95695	United States of America
704	704	Corporate	Missouri City	Texas	Central	77489	United States of America
705	705	Corporate	Fresno	California	West	93727	United States of America
706	706	Corporate	Pearland	Texas	Central	77581	United States of America
707	707	Consumer	San Mateo	California	West	94403	United States of America
708	708	Corporate	Lakewood	New Jersey	East	8701	United States of America
709	709	Corporate	Tempe	Arizona	West	85281	United States of America
710	710	Corporate	Grand Rapids	Michigan	Central	49505	United States of America
711	711	Home Office	Highland Park	Illinois	Central	60035	United States of America
712	712	Consumer	Decatur	Alabama	South	35601	United States of America
713	713	Corporate	Visalia	California	West	93277	United States of America
714	714	Corporate	Overland Park	Kansas	Central	66212	United States of America
715	715	Corporate	Alexandria	Virginia	South	22304	United States of America
716	716	Consumer	Raleigh	North Carolina	South	27604	United States of America
717	717	Consumer	Temecula	California	West	92592	United States of America
718	718	Consumer	Sterling Heights	Michigan	Central	48310	United States of America
719	719	Corporate	Laredo	Texas	Central	78041	United States of America
720	720	Corporate	Gulfport	Mississippi	South	39503	United States of America
721	721	Corporate	Round Rock	Texas	Central	78664	United States of America
722	722	Corporate	Yucaipa	California	West	92399	United States of America
723	723	Home Office	Revere	Massachusetts	East	2151	United States of America
724	724	Consumer	Las Vegas	Nevada	West	89115	United States of America
725	725	Consumer	Norman	Oklahoma	Central	73071	United States of America
726	726	Corporate	Conroe	Texas	Central	77301	United States of America
727	727	Consumer	Pasadena	Texas	Central	77506	United States of America
728	728	Home Office	Indianapolis	Indiana	Central	46203	United States of America
729	729	Corporate	Tinley Park	Illinois	Central	60477	United States of America
730	730	Home Office	Aurora	Colorado	West	80013	United States of America
731	731	Home Office	Dubuque	Iowa	Central	52001	United States of America
732	732	Home Office	Lancaster	Ohio	East	43130	United States of America
733	733	Consumer	Inglewood	California	West	90301	United States of America
734	734	Consumer	Bellevue	Washington	West	98006	United States of America
735	735	Home Office	Auburn	Alabama	South	36830	United States of America
736	736	Consumer	Macon	Georgia	South	31204	United States of America
737	737	Consumer	Perth Amboy	New Jersey	East	8861	United States of America
738	738	Corporate	Revere	Massachusetts	East	2151	United States of America
739	739	Consumer	Dearborn Heights	Michigan	Central	48127	United States of America
740	740	Consumer	Santa Fe	New Mexico	West	87505	United States of America
741	741	Consumer	Mobile	Alabama	South	36608	United States of America
742	742	Consumer	Hickory	North Carolina	South	28601	United States of America
743	743	Consumer	Carol Stream	Illinois	Central	60188	United States of America
744	744	Corporate	Saint Cloud	Minnesota	Central	56301	United States of America
745	745	Corporate	Sacramento	California	West	95823	United States of America
746	746	Corporate	Lafayette	Indiana	Central	47905	United States of America
747	747	Home Office	Richmond	Kentucky	South	40475	United States of America
748	748	Home Office	Independence	Missouri	Central	64055	United States of America
749	749	Home Office	Dallas	Texas	Central	75220	United States of America
750	750	Consumer	North Miami	Florida	South	33161	United States of America
751	751	Home Office	Bakersfield	California	West	93309	United States of America
752	752	Consumer	Fremont	Nebraska	Central	68025	United States of America
753	753	Corporate	Jackson	Michigan	Central	49201	United States of America
754	754	Corporate	Smyrna	Tennessee	South	37167	United States of America
755	755	Consumer	Lawrence	Indiana	Central	46226	United States of America
756	756	Corporate	Plantation	Florida	South	33317	United States of America
757	757	Corporate	Glendale	Arizona	West	85301	United States of America
758	758	Home Office	Quincy	Massachusetts	East	2169	United States of America
759	759	Home Office	Troy	Ohio	East	45373	United States of America
760	760	Consumer	Port Saint Lucie	Florida	South	34952	United States of America
761	761	Home Office	Yonkers	New York	East	10701	United States of America
762	762	Corporate	Phoenix	Arizona	West	85023	United States of America
763	763	Corporate	Clinton	Maryland	East	20735	United States of America
764	764	Consumer	Rock Hill	South Carolina	South	29730	United States of America
765	765	Corporate	Odessa	Texas	Central	79762	United States of America
766	766	Corporate	West Allis	Wisconsin	Central	53214	United States of America
767	767	Home Office	Chula Vista	California	West	91911	United States of America
768	768	Home Office	Miami	Florida	South	33180	United States of America
769	769	Home Office	Manhattan	Kansas	Central	66502	United States of America
770	770	Corporate	Altoona	Pennsylvania	East	16602	United States of America
771	771	Corporate	Greensboro	North Carolina	South	27405	United States of America
772	772	Home Office	Canton	Michigan	Central	48187	United States of America
773	773	Corporate	Springfield	Missouri	Central	65807	United States of America
774	774	Consumer	Rockford	Illinois	Central	61107	United States of America
775	775	Consumer	Thornton	Colorado	West	80229	United States of America
776	776	Consumer	Champaign	Illinois	Central	61821	United States of America
777	777	Consumer	Gilbert	Arizona	West	85234	United States of America
778	778	Corporate	Knoxville	Tennessee	South	37918	United States of America
779	779	Consumer	Bloomington	Indiana	Central	47401	United States of America
780	780	Home Office	Bolingbrook	Illinois	Central	60440	United States of America
781	781	Home Office	Texarkana	Arkansas	South	71854	United States of America
782	782	Consumer	Edinburg	Texas	Central	78539	United States of America
783	783	Corporate	Baytown	Texas	Central	77520	United States of America
784	784	Consumer	Pearland	Texas	Central	77581	United States of America
785	785	Consumer	Greenwood	Indiana	Central	46142	United States of America
786	786	Corporate	Asheville	North Carolina	South	28806	United States of America
787	787	Home Office	Colorado Springs	Colorado	West	80906	United States of America
788	788	Consumer	Lakewood	California	West	90712	United States of America
789	789	Corporate	Columbia	Tennessee	South	38401	United States of America
790	790	Consumer	Woonsocket	Rhode Island	East	2895	United States of America
791	791	Consumer	Kenosha	Wisconsin	Central	53142	United States of America
792	792	Corporate	Port Saint Lucie	Florida	South	34952	United States of America
793	793	Home Office	Superior	Wisconsin	Central	54880	United States of America
794	794	Consumer	Chester	Pennsylvania	East	19013	United States of America
795	795	Corporate	Bedford	Texas	Central	76021	United States of America
796	796	Home Office	Covington	Washington	West	98042	United States of America
797	797	Corporate	Lorain	Ohio	East	44052	United States of America
798	798	Home Office	Broken Arrow	Oklahoma	Central	74012	United States of America
799	799	Consumer	Miramar	Florida	South	33023	United States of America
800	800	Corporate	Tigard	Oregon	West	97224	United States of America
801	801	Home Office	Fremont	Nebraska	Central	68025	United States of America
802	802	Consumer	Hollywood	Florida	South	33021	United States of America
803	803	Corporate	Deer Park	Texas	Central	77536	United States of America
804	804	Consumer	Wichita	Kansas	Central	67212	United States of America
805	805	Consumer	Dover	New Hampshire	East	3820	United States of America
806	806	Home Office	Mesa	Arizona	West	85204	United States of America
807	807	Home Office	Santa Ana	California	West	92704	United States of America
808	808	Corporate	Mcallen	Texas	Central	78501	United States of America
809	809	Corporate	Iowa City	Iowa	Central	52240	United States of America
810	810	Corporate	Boise	Idaho	West	83704	United States of America
811	811	Consumer	Cranston	Rhode Island	East	2920	United States of America
812	812	Consumer	Mount Vernon	New York	East	10550	United States of America
813	813	Corporate	Richmond	Indiana	Central	47374	United States of America
814	814	Home Office	Baltimore	Maryland	East	21215	United States of America
815	815	Consumer	Lakeland	Florida	South	33801	United States of America
816	816	Consumer	Freeport	Illinois	Central	61032	United States of America
817	817	Corporate	Medford	Oregon	West	97504	United States of America
818	818	Corporate	Fairfield	Connecticut	East	6824	United States of America
819	819	Consumer	Moorhead	Minnesota	Central	56560	United States of America
820	820	Corporate	Jackson	Tennessee	South	38301	United States of America
821	821	Consumer	Murray	Utah	West	84107	United States of America
822	822	Corporate	Port Arthur	Texas	Central	77642	United States of America
823	823	Home Office	Nashville	Tennessee	South	37211	United States of America
824	824	Corporate	Redmond	Oregon	West	97756	United States of America
825	825	Consumer	Citrus Heights	California	West	95610	United States of America
826	826	Home Office	Lakewood	Ohio	East	44107	United States of America
827	827	Consumer	The Colony	Texas	Central	75056	United States of America
828	828	Consumer	Albuquerque	New Mexico	West	87105	United States of America
829	829	Corporate	Plainfield	New Jersey	East	7060	United States of America
830	830	Consumer	Redmond	Washington	West	98052	United States of America
831	831	Consumer	Daytona Beach	Florida	South	32114	United States of America
832	832	Consumer	Bullhead City	Arizona	West	86442	United States of America
833	833	Consumer	Franklin	Tennessee	South	37064	United States of America
834	834	Consumer	Portage	Indiana	Central	46368	United States of America
835	835	Consumer	Fargo	North Dakota	Central	58103	United States of America
836	836	Home Office	Lawrence	Indiana	Central	46226	United States of America
837	837	Consumer	Elkhart	Indiana	Central	46514	United States of America
838	838	Corporate	Kent	Ohio	East	44240	United States of America
839	839	Home Office	San Gabriel	California	West	91776	United States of America
840	840	Consumer	Highland Park	Illinois	Central	60035	United States of America
841	841	Corporate	San Diego	California	West	92024	United States of America
842	842	Consumer	Columbia	Maryland	East	21044	United States of America
843	843	Consumer	Margate	Florida	South	33063	United States of America
844	844	Corporate	Sandy Springs	Georgia	South	30328	United States of America
845	845	Consumer	Orange	New Jersey	East	7050	United States of America
846	846	Consumer	Port Arthur	Texas	Central	77642	United States of America
847	847	Home Office	Bloomington	Indiana	Central	47401	United States of America
848	848	Home Office	Mentor	Ohio	East	44060	United States of America
849	849	Consumer	Lawton	Oklahoma	Central	73505	United States of America
850	850	Corporate	Bakersfield	California	West	93309	United States of America
851	851	Consumer	Hampton	Virginia	South	23666	United States of America
852	852	Home Office	Tulsa	Oklahoma	Central	74133	United States of America
853	853	Home Office	Rome	New York	East	13440	United States of America
854	854	Corporate	Marion	Ohio	East	43302	United States of America
855	855	Consumer	Manchester	Connecticut	East	6040	United States of America
856	856	Consumer	La Crosse	Wisconsin	Central	54601	United States of America
857	857	Corporate	El Paso	Texas	Central	79907	United States of America
858	858	Home Office	Miramar	Florida	South	33023	United States of America
859	859	Home Office	Wichita	Kansas	Central	67212	United States of America
860	860	Consumer	Lewiston	Idaho	West	83501	United States of America
861	861	Home Office	Hampton	Virginia	South	23666	United States of America
862	862	Corporate	Hattiesburg	Mississippi	South	39401	United States of America
863	863	Home Office	Danville	California	West	94526	United States of America
864	864	Home Office	Jacksonville	North Carolina	South	28540	United States of America
865	865	Home Office	Everett	Massachusetts	East	2149	United States of America
866	866	Corporate	Wilmington	Delaware	East	19805	United States of America
867	867	Consumer	Mount Pleasant	Michigan	Central	48858	United States of America
868	868	Corporate	Richmond	Virginia	South	23223	United States of America
869	869	Home Office	Perth Amboy	New Jersey	East	8861	United States of America
870	870	Corporate	Freeport	Illinois	Central	61032	United States of America
871	871	Consumer	Logan	Utah	West	84321	United States of America
872	872	Consumer	Waterbury	Connecticut	East	6708	United States of America
873	873	Consumer	Athens	Georgia	South	30605	United States of America
874	874	Home Office	Apopka	Florida	South	32712	United States of America
875	875	Home Office	Lewiston	Maine	East	4240	United States of America
876	876	Corporate	Spokane	Washington	West	99207	United States of America
877	877	Home Office	Danville	Illinois	Central	61832	United States of America
878	878	Consumer	Chula Vista	California	West	91911	United States of America
879	879	Consumer	Avondale	Arizona	West	85323	United States of America
880	880	Home Office	Escondido	California	West	92025	United States of America
881	881	Consumer	Marietta	Georgia	South	30062	United States of America
882	882	Consumer	Eau Claire	Wisconsin	Central	54703	United States of America
883	883	Consumer	Norwich	Connecticut	East	6360	United States of America
884	884	Home Office	Yuma	Arizona	West	85364	United States of America
885	885	Consumer	Wausau	Wisconsin	Central	54401	United States of America
886	886	Corporate	Salem	Oregon	West	97301	United States of America
887	887	Consumer	Pasco	Washington	West	99301	United States of America
888	888	Corporate	Oak Park	Illinois	Central	60302	United States of America
889	889	Corporate	Morristown	New Jersey	East	7960	United States of America
890	890	Home Office	Durham	North Carolina	South	27707	United States of America
891	891	Consumer	Pensacola	Florida	South	32503	United States of America
892	892	Corporate	Marietta	Georgia	South	30062	United States of America
893	893	Corporate	Concord	New Hampshire	East	3301	United States of America
894	894	Consumer	League City	Texas	Central	77573	United States of America
895	895	Corporate	Gaithersburg	Maryland	East	20877	United States of America
896	896	Home Office	Huntsville	Alabama	South	35810	United States of America
897	897	Home Office	Fairfield	Connecticut	East	6824	United States of America
898	898	Corporate	Lehi	Utah	West	84043	United States of America
899	899	Home Office	Tuscaloosa	Alabama	South	35401	United States of America
900	900	Consumer	Redondo Beach	California	West	90278	United States of America
901	901	Home Office	Oceanside	California	West	92054	United States of America
902	902	Corporate	Nashville	Tennessee	South	37211	United States of America
903	903	Corporate	Memphis	Tennessee	South	38109	United States of America
904	904	Corporate	Raleigh	North Carolina	South	27604	United States of America
905	905	Home Office	Newport News	Virginia	South	23602	United States of America
906	906	Home Office	Cleveland	Ohio	East	44105	United States of America
907	907	Corporate	Vineland	New Jersey	East	8360	United States of America
908	908	Consumer	Naperville	Illinois	Central	60540	United States of America
909	909	Home Office	Des Moines	Washington	West	98198	United States of America
910	910	Consumer	Moreno Valley	California	West	92553	United States of America
911	911	Consumer	Georgetown	Kentucky	South	40324	United States of America
912	912	Home Office	Trenton	Michigan	Central	48183	United States of America
913	913	Consumer	Monroe	North Carolina	South	28110	United States of America
914	914	Corporate	Loveland	Colorado	West	80538	United States of America
915	915	Consumer	Loveland	Colorado	West	80538	United States of America
916	916	Corporate	Woonsocket	Rhode Island	East	2895	United States of America
917	917	Consumer	Deltona	Florida	South	32725	United States of America
918	918	Corporate	Lafayette	Louisiana	South	70506	United States of America
919	919	Corporate	Oklahoma City	Oklahoma	Central	73120	United States of America
920	920	Home Office	Chandler	Arizona	West	85224	United States of America
921	921	Corporate	Helena	Montana	West	59601	United States of America
922	922	Consumer	Kirkwood	Missouri	Central	63122	United States of America
923	923	Corporate	Peoria	Arizona	West	85345	United States of America
924	924	Consumer	Taylor	Michigan	Central	48180	United States of America
925	925	Corporate	Pueblo	Colorado	West	81001	United States of America
926	926	Consumer	Waco	Texas	Central	76706	United States of America
927	927	Consumer	Roseville	Michigan	Central	48066	United States of America
928	928	Home Office	Detroit	Michigan	Central	48234	United States of America
929	929	Corporate	Texarkana	Arkansas	South	71854	United States of America
930	930	Consumer	Frankfort	Illinois	Central	60423	United States of America
931	931	Consumer	Virginia Beach	Virginia	South	23464	United States of America
932	932	Corporate	Bethlehem	Pennsylvania	East	18018	United States of America
933	933	Home Office	Miami	Florida	South	33142	United States of America
934	934	Consumer	Burlington	Vermont	East	5408	United States of America
935	935	Corporate	Fayetteville	Arkansas	South	72701	United States of America
936	936	Home Office	Odessa	Texas	Central	79762	United States of America
937	937	Corporate	Rochester	Minnesota	Central	55901	United States of America
938	938	Consumer	Medina	Ohio	East	44256	United States of America
939	939	Corporate	Roseville	Minnesota	Central	55113	United States of America
940	940	Home Office	Garland	Texas	Central	75043	United States of America
941	941	Home Office	Greenville	North Carolina	South	27834	United States of America
942	942	Home Office	Knoxville	Tennessee	South	37918	United States of America
943	943	Consumer	Grand Island	Nebraska	Central	68801	United States of America
944	944	Corporate	Woodbury	Minnesota	Central	55125	United States of America
945	945	Consumer	Park Ridge	Illinois	Central	60068	United States of America
946	946	Corporate	Oak Park	Michigan	Central	48237	United States of America
947	947	Consumer	Rogers	Arkansas	South	72756	United States of America
948	948	Corporate	Lancaster	Ohio	East	43130	United States of America
949	949	Consumer	Clovis	New Mexico	West	88101	United States of America
950	950	Consumer	Chandler	Arizona	West	85224	United States of America
951	951	Consumer	Jupiter	Florida	South	33458	United States of America
952	952	Home Office	Sparks	Nevada	West	89431	United States of America
953	953	Corporate	Rockford	Illinois	Central	61107	United States of America
954	954	Consumer	Parker	Colorado	West	80134	United States of America
955	955	Home Office	Maple Grove	Minnesota	Central	55369	United States of America
956	956	Corporate	Huntsville	Alabama	South	35810	United States of America
957	957	Consumer	Santa Clara	California	West	95051	United States of America
958	958	Home Office	Santa Barbara	California	West	93101	United States of America
959	959	Corporate	Cedar Hill	Texas	Central	75104	United States of America
960	960	Consumer	Norfolk	Nebraska	Central	68701	United States of America
961	961	Consumer	Draper	Utah	West	84020	United States of America
962	962	Corporate	Jackson	Mississippi	South	39212	United States of America
963	963	Corporate	La Crosse	Wisconsin	Central	54601	United States of America
964	964	Home Office	Ann Arbor	Michigan	Central	48104	United States of America
965	965	Home Office	La Mesa	California	West	91941	United States of America
966	966	Home Office	Meriden	Connecticut	East	6450	United States of America
967	967	Consumer	Salt Lake City	Utah	West	84106	United States of America
968	968	Corporate	Apple Valley	California	West	92307	United States of America
969	969	Home Office	Salem	Oregon	West	97301	United States of America
970	970	Consumer	Pocatello	Idaho	West	83201	United States of America
971	971	Home Office	Holland	Michigan	Central	49423	United States of America
972	972	Consumer	Broken Arrow	Oklahoma	Central	74012	United States of America
973	973	Consumer	Apopka	Florida	South	32712	United States of America
974	974	Corporate	Ann Arbor	Michigan	Central	48104	United States of America
975	975	Corporate	Milford	Connecticut	East	6460	United States of America
976	976	Consumer	Greenville	North Carolina	South	27834	United States of America
977	977	Consumer	Buffalo Grove	Illinois	Central	60089	United States of America
978	978	Consumer	Lake Forest	California	West	92630	United States of America
979	979	Consumer	Redding	California	West	96003	United States of America
980	980	Consumer	Leominster	Massachusetts	East	1453	United States of America
981	981	Consumer	Chico	California	West	95928	United States of America
982	982	Consumer	Thousand Oaks	California	West	91360	United States of America
983	983	Corporate	Chattanooga	Tennessee	South	37421	United States of America
984	984	Consumer	Utica	New York	East	13501	United States of America
985	985	Home Office	Roseville	Minnesota	Central	55113	United States of America
986	986	Home Office	Virginia Beach	Virginia	South	23464	United States of America
987	987	Consumer	Conway	Arkansas	South	72032	United States of America
988	988	Corporate	Meriden	Connecticut	East	6450	United States of America
989	989	Home Office	Cheyenne	Wyoming	West	82001	United States of America
990	990	Home Office	Jonesboro	Arkansas	South	72401	United States of America
991	991	Home Office	Lawrence	Massachusetts	East	1841	United States of America
992	992	Corporate	Cranston	Rhode Island	East	2920	United States of America
993	993	Consumer	Owensboro	Kentucky	South	42301	United States of America
994	994	Corporate	Owensboro	Kentucky	South	42301	United States of America
995	995	Corporate	Bellingham	Washington	West	98226	United States of America
996	996	Home Office	Des Moines	Iowa	Central	50315	United States of America
997	997	Corporate	Southaven	Mississippi	South	38671	United States of America
998	998	Consumer	Hattiesburg	Mississippi	South	39401	United States of America
999	999	Corporate	Caldwell	Idaho	West	83605	United States of America
1000	1000	Consumer	Kenner	Louisiana	South	70065	United States of America
1001	1001	Consumer	Cedar Hill	Texas	Central	75104	United States of America
1002	1002	Corporate	Nashua	New Hampshire	East	3060	United States of America
1003	1003	Consumer	Sierra Vista	Arizona	West	85635	United States of America
1004	1004	Consumer	Bartlett	Tennessee	South	38134	United States of America
1005	1005	Home Office	Lakewood	California	West	90712	United States of America
1006	1006	Consumer	Lubbock	Texas	Central	79424	United States of America
1007	1007	Corporate	Miami	Florida	South	33178	United States of America
1008	1008	Corporate	Redwood City	California	West	94061	United States of America
1009	1009	Home Office	Bedford	Texas	Central	76021	United States of America
1010	1010	Consumer	Lebanon	Tennessee	South	37087	United States of America
1011	1011	Home Office	Mcallen	Texas	Central	78501	United States of America
1012	1012	Consumer	Santa Maria	California	West	93454	United States of America
1013	1013	Consumer	Des Plaines	Illinois	Central	60016	United States of America
1014	1014	Consumer	Apple Valley	California	West	92307	United States of America
1015	1015	Home Office	Marion	Ohio	East	43302	United States of America
1016	1016	Consumer	Longview	Washington	West	98632	United States of America
1017	1017	Consumer	Hendersonville	Tennessee	South	37075	United States of America
1018	1018	Consumer	Irving	Texas	Central	75061	United States of America
1019	1019	Consumer	Waterloo	Iowa	Central	50701	United States of America
1020	1020	Home Office	Bellevue	Washington	West	98006	United States of America
1021	1021	Home Office	Marietta	Georgia	South	30062	United States of America
1022	1022	Corporate	Plano	Texas	Central	75023	United States of America
1023	1023	Home Office	Tamarac	Florida	South	33319	United States of America
1024	1024	Home Office	Cambridge	Massachusetts	East	2138	United States of America
1025	1025	Corporate	Palatine	Illinois	Central	60067	United States of America
1026	1026	Home Office	Lebanon	Tennessee	South	37087	United States of America
1027	1027	Home Office	Chico	California	West	95928	United States of America
1028	1028	Corporate	Beverly	Massachusetts	East	1915	United States of America
1029	1029	Home Office	Corpus Christi	Texas	Central	78415	United States of America
1030	1030	Corporate	Eugene	Oregon	West	97405	United States of America
1031	1031	Consumer	Oxnard	California	West	93030	United States of America
1032	1032	Corporate	Laguna Niguel	California	West	92677	United States of America
1033	1033	Home Office	Midland	Michigan	Central	48640	United States of America
1034	1034	Home Office	Newark	Delaware	East	19711	United States of America
1035	1035	Consumer	Renton	Washington	West	98059	United States of America
1036	1036	Home Office	Waterbury	Connecticut	East	6708	United States of America
1037	1037	Home Office	Hollywood	Florida	South	33021	United States of America
1038	1038	Corporate	Chandler	Arizona	West	85224	United States of America
1039	1039	Corporate	Draper	Utah	West	84020	United States of America
1040	1040	Consumer	Glenview	Illinois	Central	60025	United States of America
1041	1041	Corporate	Orlando	Florida	South	32839	United States of America
1042	1042	Home Office	El Paso	Texas	Central	79907	United States of America
1043	1043	Corporate	Buffalo	New York	East	14215	United States of America
1044	1044	Corporate	Roseville	California	West	95661	United States of America
1045	1045	Corporate	Edmonds	Washington	West	98026	United States of America
1046	1046	Consumer	Delray Beach	Florida	South	33445	United States of America
1047	1047	Consumer	Commerce City	Colorado	West	80022	United States of America
1048	1048	Consumer	Texas City	Texas	Central	77590	United States of America
1049	1049	Home Office	Wilson	North Carolina	South	27893	United States of America
1050	1050	Home Office	Gilbert	Arizona	West	85234	United States of America
1051	1051	Home Office	Charlottesville	Virginia	South	22901	United States of America
1052	1052	Home Office	Franklin	Wisconsin	Central	53132	United States of America
1053	1053	Home Office	Lake Charles	Louisiana	South	70601	United States of America
1054	1054	Consumer	Wilson	North Carolina	South	27893	United States of America
1055	1055	Corporate	Fort Lauderdale	Florida	South	33311	United States of America
1056	1056	Consumer	Rio Rancho	New Mexico	West	87124	United States of America
1057	1057	Corporate	Stockton	California	West	95207	United States of America
1058	1058	Home Office	Hot Springs	Arkansas	South	71901	United States of America
1059	1059	Consumer	Goldsboro	North Carolina	South	27534	United States of America
1060	1060	Consumer	Nashua	New Hampshire	East	3060	United States of America
1061	1061	Home Office	Sacramento	California	West	95823	United States of America
1062	1062	Corporate	Everett	Washington	West	98208	United States of America
1063	1063	Corporate	Montebello	California	West	90640	United States of America
1064	1064	Corporate	Thousand Oaks	California	West	91360	United States of America
1065	1065	Home Office	El Cajon	California	West	92020	United States of America
1066	1066	Consumer	Beaumont	Texas	Central	77705	United States of America
1067	1067	Consumer	Lakewood	Ohio	East	44107	United States of America
1068	1068	Corporate	Trenton	Michigan	Central	48183	United States of America
1069	1069	Corporate	North Charleston	South Carolina	South	29406	United States of America
1070	1070	Consumer	West Palm Beach	Florida	South	33407	United States of America
1071	1071	Consumer	Santa Barbara	California	West	93101	United States of America
1072	1072	Home Office	Roseville	California	West	95661	United States of America
1073	1073	Home Office	Riverside	California	West	92503	United States of America
1074	1074	Consumer	Abilene	Texas	Central	79605	United States of America
1075	1075	Corporate	Las Vegas	Nevada	West	89115	United States of America
1076	1076	Corporate	Louisville	Kentucky	South	40214	United States of America
1077	1077	Home Office	Normal	Illinois	Central	61761	United States of America
1078	1078	Home Office	Salinas	California	West	93905	United States of America
1079	1079	Home Office	Concord	California	West	94521	United States of America
1080	1080	Corporate	Pleasant Grove	Utah	West	84062	United States of America
1081	1081	Consumer	Mcallen	Texas	Central	78501	United States of America
1082	1082	Corporate	Concord	California	West	94521	United States of America
1083	1083	Corporate	Chester	Pennsylvania	East	19013	United States of America
1084	1084	Consumer	Sparks	Nevada	West	89431	United States of America
1085	1085	Consumer	Saint Charles	Missouri	Central	63301	United States of America
1086	1086	Corporate	Troy	New York	East	12180	United States of America
1087	1087	Corporate	Athens	Georgia	South	30605	United States of America
1088	1088	Home Office	Saint Charles	Illinois	Central	60174	United States of America
1089	1089	Consumer	Camarillo	California	West	93010	United States of America
1090	1090	Corporate	Hollywood	Florida	South	33021	United States of America
1091	1091	Corporate	Roseville	Michigan	Central	48066	United States of America
1092	1092	Home Office	Helena	Montana	West	59601	United States of America
1093	1093	Corporate	Yuma	Arizona	West	85364	United States of America
1094	1094	Corporate	Hillsboro	Oregon	West	97123	United States of America
1095	1095	Home Office	Burbank	California	West	91505	United States of America
1096	1096	Consumer	Modesto	California	West	95351	United States of America
1097	1097	Corporate	Garden City	Kansas	Central	67846	United States of America
1098	1098	Corporate	Bloomington	Illinois	Central	61701	United States of America
1099	1099	Corporate	Camarillo	California	West	93010	United States of America
1100	1100	Home Office	Tigard	Oregon	West	97224	United States of America
1101	1101	Corporate	Oxnard	California	West	93030	United States of America
1102	1102	Corporate	Covington	Washington	West	98042	United States of America
1103	1103	Corporate	Brownsville	Texas	Central	78521	United States of America
1104	1104	Consumer	Visalia	California	West	93277	United States of America
1105	1105	Home Office	Lehi	Utah	West	84043	United States of America
1106	1106	Home Office	Huntington Beach	California	West	92646	United States of America
1107	1107	Home Office	Fargo	North Dakota	Central	58103	United States of America
1108	1108	Home Office	Dover	New Hampshire	East	3820	United States of America
1109	1109	Corporate	Atlantic City	New Jersey	East	8401	United States of America
1110	1110	Consumer	Longmont	Colorado	West	80501	United States of America
1111	1111	Corporate	Newport News	Virginia	South	23602	United States of America
1112	1112	Consumer	Garden City	Kansas	Central	67846	United States of America
1113	1113	Home Office	Brownsville	Texas	Central	78521	United States of America
1114	1114	Home Office	Pueblo	Colorado	West	81001	United States of America
1115	1115	Corporate	Suffolk	Virginia	South	23434	United States of America
1116	1116	Corporate	Orem	Utah	West	84057	United States of America
1117	1117	Home Office	Tallahassee	Florida	South	32303	United States of America
1118	1118	Corporate	Waterbury	Connecticut	East	6708	United States of America
1119	1119	Home Office	Long Beach	New York	East	11561	United States of America
1120	1120	Home Office	Moreno Valley	California	West	92553	United States of America
1121	1121	Home Office	Franklin	Tennessee	South	37064	United States of America
1122	1122	Home Office	North Las Vegas	Nevada	West	89031	United States of America
1123	1123	Home Office	Cranston	Rhode Island	East	2920	United States of America
1124	1124	Corporate	Rome	New York	East	13440	United States of America
1125	1125	Home Office	West Palm Beach	Florida	South	33407	United States of America
1126	1126	Consumer	Pharr	Texas	Central	78577	United States of America
1127	1127	Consumer	Cuyahoga Falls	Ohio	East	44221	United States of America
1128	1128	Home Office	Lake Forest	California	West	92630	United States of America
1129	1129	Corporate	Portland	Oregon	West	97206	United States of America
1130	1130	Consumer	Davis	California	West	95616	United States of America
1131	1131	Home Office	Wheeling	West Virginia	East	26003	United States of America
1132	1132	Consumer	Morgan Hill	California	West	95037	United States of America
1133	1133	Consumer	Saint Charles	Illinois	Central	60174	United States of America
1134	1134	Corporate	Chico	California	West	95928	United States of America
1135	1135	Corporate	Miramar	Florida	South	33023	United States of America
1136	1136	Consumer	Clifton	New Jersey	East	7011	United States of America
1137	1137	Home Office	Sheboygan	Wisconsin	Central	53081	United States of America
1138	1138	Consumer	Dubuque	Iowa	Central	52001	United States of America
1139	1139	Corporate	Modesto	California	West	95351	United States of America
1140	1140	Corporate	East Point	Georgia	South	30344	United States of America
1141	1141	Consumer	San Angelo	Texas	Central	76903	United States of America
1142	1142	Corporate	Rapid City	South Dakota	Central	57701	United States of America
1143	1143	Home Office	Milford	Connecticut	East	6460	United States of America
1144	1144	Consumer	Durham	North Carolina	South	27707	United States of America
1145	1145	Corporate	Santa Barbara	California	West	93101	United States of America
1146	1146	Home Office	Troy	New York	East	12180	United States of America
1147	1147	Consumer	Sandy Springs	Georgia	South	30328	United States of America
1148	1148	Home Office	Roseville	Michigan	Central	48066	United States of America
1149	1149	Corporate	El Cajon	California	West	92020	United States of America
1150	1150	Home Office	League City	Texas	Central	77573	United States of America
1151	1151	Consumer	Andover	Massachusetts	East	1810	United States of America
1152	1152	Consumer	Great Falls	Montana	West	59405	United States of America
1153	1153	Consumer	Kissimmee	Florida	South	34741	United States of America
1154	1154	Home Office	Fresno	California	West	93727	United States of America
1155	1155	Home Office	Shelton	Connecticut	East	6484	United States of America
1156	1156	Corporate	Orange	New Jersey	East	7050	United States of America
1157	1157	Home Office	Akron	Ohio	East	44312	United States of America
1158	1158	Home Office	Danbury	Connecticut	East	6810	United States of America
1159	1159	Home Office	San Bernardino	California	West	92404	United States of America
1160	1160	Home Office	Marion	Iowa	Central	52302	United States of America
1161	1161	Consumer	Reading	Pennsylvania	East	19601	United States of America
1162	1162	Consumer	Bristol	Connecticut	East	6010	United States of America
1163	1163	Consumer	Holland	Michigan	Central	49423	United States of America
1164	1164	Corporate	Noblesville	Indiana	Central	46060	United States of America
1165	1165	Home Office	Clarksville	Tennessee	South	37042	United States of America
1166	1166	Consumer	Grand Rapids	Michigan	Central	49505	United States of America
1167	1167	Corporate	Longmont	Colorado	West	80501	United States of America
1168	1168	Corporate	Florence	Kentucky	South	41042	United States of America
1169	1169	Consumer	Frisco	Texas	Central	75034	United States of America
1170	1170	Consumer	Plantation	Florida	South	33317	United States of America
1171	1171	Home Office	Sanford	Florida	South	32771	United States of America
1172	1172	Corporate	Hempstead	New York	East	11550	United States of America
1173	1173	Corporate	San Marcos	Texas	Central	78666	United States of America
1174	1174	Corporate	Escondido	California	West	92025	United States of America
1175	1175	Consumer	Greeley	Colorado	West	80634	United States of America
1176	1176	Home Office	Reno	Nevada	West	89502	United States of America
1177	1177	Consumer	New Bedford	Massachusetts	East	2740	United States of America
1178	1178	Consumer	Bethlehem	Pennsylvania	East	18018	United States of America
1179	1179	Home Office	Kenosha	Wisconsin	Central	53142	United States of America
1180	1180	Consumer	Peoria	Arizona	West	85345	United States of America
1181	1181	Consumer	Mansfield	Texas	Central	76063	United States of America
1182	1182	Home Office	Grand Rapids	Michigan	Central	49505	United States of America
1183	1183	Corporate	Elyria	Ohio	East	44035	United States of America
1184	1184	Home Office	Miami	Florida	South	33178	United States of America
1185	1185	Consumer	Hillsboro	Oregon	West	97123	United States of America
1186	1186	Home Office	Atlanta	Georgia	South	30318	United States of America
1187	1187	Corporate	Twin Falls	Idaho	West	83301	United States of America
1188	1188	Home Office	Burlington	Vermont	East	5408	United States of America
1189	1189	Corporate	Utica	New York	East	13501	United States of America
1190	1190	Corporate	Saint Charles	Missouri	Central	63301	United States of America
1191	1191	Home Office	Sandy Springs	Georgia	South	30328	United States of America
1192	1192	Corporate	Meridian	Idaho	West	83642	United States of America
1193	1193	Home Office	Paterson	New Jersey	East	7501	United States of America
1194	1194	Home Office	Stockton	California	West	95207	United States of America
1195	1195	Home Office	Columbia	Missouri	Central	65203	United States of America
1196	1196	Corporate	Moreno Valley	California	West	92553	United States of America
1197	1197	Corporate	Jamestown	New York	East	14701	United States of America
1198	1198	Corporate	Coral Gables	Florida	South	33134	United States of America
1199	1199	Consumer	Romeoville	Illinois	Central	60441	United States of America
1200	1200	Consumer	Marlborough	Massachusetts	East	1752	United States of America
1201	1201	Corporate	Santa Ana	California	West	92704	United States of America
1202	1202	Home Office	Richmond	Virginia	South	23223	United States of America
1203	1203	Home Office	Las Cruces	New Mexico	West	88001	United States of America
1204	1204	Corporate	Laurel	Maryland	East	20707	United States of America
1205	1205	Corporate	Wilson	North Carolina	South	27893	United States of America
1206	1206	Home Office	Hendersonville	Tennessee	South	37075	United States of America
1207	1207	Home Office	Oxnard	California	West	93030	United States of America
1208	1208	Home Office	Allentown	Pennsylvania	East	18103	United States of America
1209	1209	Consumer	Milford	Connecticut	East	6460	United States of America
1210	1210	Home Office	Burlington	Iowa	Central	52601	United States of America
1211	1211	Home Office	Bryan	Texas	Central	77803	United States of America
1212	1212	Corporate	Marion	Iowa	Central	52302	United States of America
1213	1213	Consumer	Pine Bluff	Arkansas	South	71603	United States of America
1214	1214	Consumer	Columbia	Missouri	Central	65203	United States of America
1215	1215	Consumer	Aberdeen	South Dakota	Central	57401	United States of America
1216	1216	Corporate	Delray Beach	Florida	South	33445	United States of America
1217	1217	Corporate	Waco	Texas	Central	76706	United States of America
1218	1218	Consumer	Hagerstown	Maryland	East	21740	United States of America
1219	1219	Home Office	Santa Fe	New Mexico	West	87505	United States of America
1220	1220	Consumer	East Orange	New Jersey	East	7017	United States of America
1221	1221	Corporate	Eau Claire	Wisconsin	Central	54703	United States of America
1222	1222	Consumer	Arlington Heights	Illinois	Central	60004	United States of America
1223	1223	Home Office	Fayetteville	North Carolina	South	28314	United States of America
1224	1224	Corporate	Coppell	Texas	Central	75019	United States of America
1225	1225	Home Office	Redmond	Washington	West	98052	United States of America
1226	1226	Home Office	Spokane	Washington	West	99207	United States of America
1227	1227	Home Office	Chattanooga	Tennessee	South	37421	United States of America
1228	1228	Consumer	Oswego	Illinois	Central	60543	United States of America
1229	1229	Consumer	Wheeling	West Virginia	East	26003	United States of America
1230	1230	Corporate	Paterson	New Jersey	East	7501	United States of America
1231	1231	Corporate	Broken Arrow	Oklahoma	Central	74012	United States of America
1232	1232	Home Office	Greenwood	Indiana	Central	46142	United States of America
1233	1233	Consumer	Rome	New York	East	13440	United States of America
1234	1234	Consumer	Appleton	Wisconsin	Central	54915	United States of America
1235	1235	Corporate	Beaumont	Texas	Central	77705	United States of America
1236	1236	Corporate	Broomfield	Colorado	West	80020	United States of America
1237	1237	Corporate	Mansfield	Texas	Central	76063	United States of America
1238	1238	Consumer	Woodland	California	West	95695	United States of America
1239	1239	Corporate	Bowling Green	Ohio	East	43402	United States of America
1240	1240	Corporate	Lubbock	Texas	Central	79424	United States of America
1241	1241	Consumer	Coon Rapids	Minnesota	Central	55433	United States of America
1242	1242	Consumer	San Clemente	California	West	92672	United States of America
1243	1243	Consumer	Dublin	California	West	94568	United States of America
1244	1244	Home Office	Arlington	Texas	Central	76017	United States of America
1245	1245	Consumer	San Luis Obispo	California	West	93405	United States of America
1246	1246	Home Office	Wilmington	Delaware	East	19805	United States of America
1247	1247	Consumer	Boise	Idaho	West	83704	United States of America
1248	1248	Corporate	Hampton	Virginia	South	23666	United States of America
1249	1249	Home Office	Springdale	Arkansas	South	72762	United States of America
1250	1250	Consumer	Lodi	California	West	95240	United States of America
1251	1251	Consumer	La Porte	Texas	Central	77571	United States of America
1252	1252	Corporate	Lodi	California	West	95240	United States of America
1253	1253	Corporate	Mason	Ohio	East	45040	United States of America
1254	1254	Home Office	Parma	Ohio	East	44134	United States of America
1255	1255	Consumer	Woodstock	Georgia	South	30188	United States of America
1256	1256	Consumer	Marion	Iowa	Central	52302	United States of America
1257	1257	Corporate	Bryan	Texas	Central	77803	United States of America
1258	1258	Consumer	Niagara Falls	New York	East	14304	United States of America
1259	1259	Home Office	Florence	Kentucky	South	41042	United States of America
\.


--
-- TOC entry 3391 (class 0 OID 27318)
-- Dependencies: 235
-- Data for Name: dim_product; Type: TABLE DATA; Schema: dwh; Owner: postgres
--

COPY dwh.dim_product (sk_product, product_id, category_id, product_category, product_subcategory, product_costprice, product_listprice) FROM stdin;
1	FUR-BO-10001798	1	Furniture	Bookcases	240.00	260.00
2	FUR-CH-10000454	2	Furniture	Chairs	600.00	730.00
3	OFF-LA-10000240	3	Office Supplies	Labels	10.00	10.00
4	FUR-TA-10000577	4	Furniture	Tables	780.00	960.00
5	OFF-ST-10000760	5	Office Supplies	Storage	20.00	20.00
6	FUR-FU-10001487	6	Furniture	Furnishings	50.00	50.00
7	OFF-AR-10002833	7	Office Supplies	Art	10.00	10.00
8	TEC-PH-10002275	8	Technology	Phones	860.00	910.00
9	OFF-BI-10003910	9	Office Supplies	Binders	20.00	20.00
10	OFF-AP-10002892	10	Office Supplies	Appliances	90.00	110.00
11	FUR-TA-10001539	4	Furniture	Tables	1470.00	1710.00
12	TEC-PH-10002033	8	Technology	Phones	750.00	910.00
13	OFF-PA-10002365	11	Office Supplies	Paper	20.00	20.00
14	OFF-BI-10003656	9	Office Supplies	Binders	360.00	410.00
15	OFF-AP-10002311	10	Office Supplies	Appliances	60.00	70.00
16	OFF-BI-10000756	9	Office Supplies	Binders	0.00	0.00
17	OFF-ST-10004186	5	Office Supplies	Storage	610.00	670.00
18	OFF-ST-10000107	5	Office Supplies	Storage	60.00	60.00
19	OFF-AR-10003056	7	Office Supplies	Art	10.00	10.00
20	TEC-PH-10001949	8	Technology	Phones	170.00	210.00
21	OFF-BI-10002215	9	Office Supplies	Binders	20.00	20.00
22	OFF-AR-10000246	7	Office Supplies	Art	20.00	20.00
23	OFF-AP-10001492	10	Office Supplies	Appliances	50.00	60.00
24	FUR-CH-10002774	2	Furniture	Chairs	60.00	70.00
25	OFF-BI-10001634	9	Office Supplies	Binders	10.00	10.00
26	TEC-AC-10003027	12	Technology	Accessories	80.00	90.00
27	FUR-BO-10004834	1	Furniture	Bookcases	2740.00	3080.00
28	OFF-BI-10000474	9	Office Supplies	Binders	10.00	10.00
29	FUR-FU-10004848	6	Furniture	Furnishings	100.00	120.00
30	OFF-EN-10001509	13	Office Supplies	Envelopes	0.00	0.00
31	OFF-AR-10004042	7	Office Supplies	Art	70.00	90.00
32	OFF-BI-10001525	9	Office Supplies	Binders	10.00	10.00
33	OFF-AR-10001683	7	Office Supplies	Art	20.00	20.00
34	OFF-PA-10000249	11	Office Supplies	Paper	30.00	30.00
35	TEC-PH-10004977	8	Technology	Phones	1020.00	1100.00
36	FUR-FU-10003664	6	Furniture	Furnishings	180.00	190.00
37	OFF-EN-10002986	13	Office Supplies	Envelopes	90.00	110.00
38	FUR-BO-10002545	1	Furniture	Bookcases	460.00	530.00
39	FUR-CH-10004218	2	Furniture	Chairs	200.00	210.00
40	TEC-PH-10000486	8	Technology	Phones	350.00	370.00
41	TEC-PH-10004093	8	Technology	Phones	140.00	150.00
42	OFF-ST-10003479	5	Office Supplies	Storage	70.00	80.00
43	OFF-ST-10003282	5	Office Supplies	Storage	90.00	100.00
44	TEC-AC-10000171	12	Technology	Accessories	40.00	50.00
45	OFF-BI-10003291	9	Office Supplies	Binders	20.00	20.00
46	OFF-ST-10001713	5	Office Supplies	Storage	180.00	210.00
47	TEC-AC-10002167	12	Technology	Accessories	50.00	50.00
48	TEC-PH-10003988	8	Technology	Phones	20.00	20.00
49	OFF-BI-10004410	9	Office Supplies	Binders	30.00	40.00
50	OFF-LA-10002762	3	Office Supplies	Labels	70.00	80.00
51	FUR-FU-10001706	6	Furniture	Furnishings	10.00	10.00
52	FUR-CH-10003061	2	Furniture	Chairs	70.00	90.00
53	OFF-FA-10000304	14	Office Supplies	Fasteners	20.00	20.00
54	TEC-PH-10002447	8	Technology	Phones	850.00	1030.00
55	OFF-ST-10000604	5	Office Supplies	Storage	200.00	210.00
56	OFF-PA-10001569	11	Office Supplies	Paper	30.00	30.00
57	FUR-CH-10003968	2	Furniture	Chairs	290.00	320.00
58	OFF-PA-10000587	11	Office Supplies	Paper	10.00	10.00
59	OFF-BI-10001460	9	Office Supplies	Binders	40.00	50.00
60	OFF-AR-10001868	7	Office Supplies	Art	0.00	0.00
61	TEC-AC-10004633	12	Technology	Accessories	10.00	10.00
62	OFF-BI-10001078	9	Office Supplies	Binders	20.00	30.00
63	OFF-PA-10003892	11	Office Supplies	Paper	130.00	150.00
64	FUR-FU-10000397	6	Furniture	Furnishings	70.00	80.00
65	FUR-CH-10001146	2	Furniture	Chairs	180.00	210.00
66	OFF-AR-10002671	7	Office Supplies	Art	940.00	1110.00
67	TEC-PH-10002726	8	Technology	Phones	160.00	170.00
68	OFF-PA-10000482	11	Office Supplies	Paper	70.00	80.00
69	OFF-BI-10004654	9	Office Supplies	Binders	0.00	0.00
70	OFF-PA-10004675	11	Office Supplies	Paper	20.00	20.00
71	FUR-CH-10000513	2	Furniture	Chairs	790.00	830.00
72	FUR-FU-10003708	6	Furniture	Furnishings	90.00	100.00
73	OFF-ST-10004123	5	Office Supplies	Storage	60.00	70.00
74	OFF-BI-10004182	9	Office Supplies	Binders	0.00	0.00
75	FUR-FU-10000260	6	Furniture	Furnishings	10.00	10.00
76	OFF-ST-10000615	5	Office Supplies	Storage	20.00	30.00
77	FUR-FU-10003194	6	Furniture	Furnishings	20.00	20.00
78	OFF-AP-10002118	10	Office Supplies	Appliances	190.00	210.00
79	OFF-BI-10002309	9	Office Supplies	Binders	20.00	20.00
80	OFF-AR-10002053	7	Office Supplies	Art	10.00	10.00
81	OFF-ST-10002370	5	Office Supplies	Storage	20.00	20.00
82	OFF-EN-10000927	13	Office Supplies	Envelopes	180.00	200.00
83	OFF-ST-10003656	5	Office Supplies	Storage	210.00	230.00
84	FUR-CH-10000863	2	Furniture	Chairs	260.00	300.00
85	TEC-AC-10001998	12	Technology	Accessories	20.00	20.00
86	OFF-LA-10000134	3	Office Supplies	Labels	10.00	10.00
87	OFF-ST-10003442	5	Office Supplies	Storage	140.00	160.00
88	OFF-AR-10004930	7	Office Supplies	Art	20.00	20.00
89	OFF-PA-10000304	11	Office Supplies	Paper	10.00	10.00
90	OFF-PA-10003177	11	Office Supplies	Paper	10.00	10.00
91	FUR-FU-10003799	6	Furniture	Furnishings	50.00	50.00
92	OFF-BI-10002852	9	Office Supplies	Binders	20.00	30.00
93	OFF-BI-10004738	9	Office Supplies	Binders	10.00	10.00
94	FUR-FU-10000629	6	Furniture	Furnishings	80.00	100.00
95	OFF-BI-10001721	9	Office Supplies	Binders	40.00	50.00
96	OFF-AP-10000358	10	Office Supplies	Appliances	70.00	80.00
97	OFF-PA-10003256	11	Office Supplies	Paper	60.00	60.00
98	TEC-AC-10001767	12	Technology	Accessories	80.00	100.00
99	OFF-BI-10002609	9	Office Supplies	Binders	0.00	0.00
100	OFF-PA-10004040	11	Office Supplies	Paper	20.00	20.00
101	TEC-AC-10001552	12	Technology	Accessories	220.00	240.00
102	FUR-FU-10004006	6	Furniture	Furnishings	90.00	100.00
103	OFF-BI-10002794	9	Office Supplies	Binders	30.00	40.00
104	TEC-AC-10003499	12	Technology	Accessories	60.00	70.00
105	TEC-PH-10002844	8	Technology	Phones	30.00	30.00
106	OFF-AR-10000390	7	Office Supplies	Art	0.00	0.00
107	TEC-AC-10000844	12	Technology	Accessories	290.00	340.00
108	FUR-FU-10001934	6	Furniture	Furnishings	30.00	40.00
109	OFF-AR-10000380	7	Office Supplies	Art	70.00	80.00
110	OFF-BI-10003981	9	Office Supplies	Binders	30.00	30.00
111	OFF-FA-10000621	14	Office Supplies	Fasteners	40.00	40.00
112	OFF-EN-10002600	13	Office Supplies	Envelopes	0.00	0.00
113	OFF-PA-10004965	11	Office Supplies	Paper	20.00	20.00
114	OFF-EN-10002504	13	Office Supplies	Envelopes	120.00	130.00
115	FUR-TA-10001768	4	Furniture	Tables	720.00	790.00
116	OFF-BI-10003650	9	Office Supplies	Binders	140.00	160.00
117	FUR-FU-10002157	6	Furniture	Furnishings	50.00	50.00
118	OFF-ST-10000777	5	Office Supplies	Storage	190.00	230.00
119	OFF-EN-10002500	13	Office Supplies	Envelopes	110.00	120.00
120	TEC-PH-10003875	8	Technology	Phones	60.00	70.00
121	FUR-CH-10004063	2	Furniture	Chairs	550.00	600.00
122	FUR-TA-10004534	4	Furniture	Tables	540.00	620.00
123	OFF-BI-10003274	9	Office Supplies	Binders	0.00	0.00
124	OFF-ST-10002974	5	Office Supplies	Storage	200.00	240.00
125	FUR-FU-10003773	6	Furniture	Furnishings	220.00	240.00
126	TEC-PH-10002293	8	Technology	Phones	50.00	60.00
127	OFF-PA-10002377	11	Office Supplies	Paper	80.00	80.00
128	OFF-FA-10002780	14	Office Supplies	Fasteners	20.00	20.00
129	OFF-PA-10001804	11	Office Supplies	Paper	20.00	20.00
130	OFF-PA-10001736	11	Office Supplies	Paper	30.00	40.00
131	OFF-AR-10001149	7	Office Supplies	Art	10.00	10.00
132	OFF-FA-10002988	14	Office Supplies	Fasteners	0.00	0.00
133	OFF-BI-10004781	9	Office Supplies	Binders	70.00	80.00
134	OFF-SU-10001218	15	Office Supplies	Supplies	60.00	70.00
135	OFF-AR-10000940	7	Office Supplies	Art	10.00	10.00
136	OFF-EN-10004030	13	Office Supplies	Envelopes	10.00	10.00
137	OFF-PA-10004327	11	Office Supplies	Paper	130.00	140.00
138	OFF-AP-10001058	10	Office Supplies	Appliances	780.00	840.00
139	FUR-FU-10000521	6	Furniture	Furnishings	80.00	90.00
140	TEC-PH-10000215	8	Technology	Phones	350.00	380.00
141	TEC-PH-10001448	8	Technology	Phones	140.00	150.00
142	OFF-BI-10002735	9	Office Supplies	Binders	150.00	170.00
143	OFF-AP-10000326	10	Office Supplies	Appliances	140.00	160.00
144	TEC-PH-10001254	8	Technology	Phones	160.00	200.00
145	OFF-PA-10001950	11	Office Supplies	Paper	50.00	60.00
146	OFF-PA-10002254	11	Office Supplies	Paper	100.00	110.00
147	OFF-ST-10001590	5	Office Supplies	Storage	60.00	80.00
148	OFF-AR-10001547	7	Office Supplies	Art	10.00	10.00
149	OFF-LA-10002475	3	Office Supplies	Labels	10.00	10.00
150	TEC-PH-10004536	8	Technology	Phones	870.00	940.00
151	OFF-PA-10002751	11	Office Supplies	Paper	10.00	10.00
152	TEC-AC-10003657	12	Technology	Accessories	40.00	50.00
153	OFF-EN-10001990	13	Office Supplies	Envelopes	30.00	30.00
154	OFF-BI-10004002	9	Office Supplies	Binders	20.00	30.00
155	OFF-AR-10004441	7	Office Supplies	Art	10.00	10.00
156	TEC-MA-10000822	16	Technology	Machines	6850.00	8160.00
157	OFF-ST-10000991	5	Office Supplies	Storage	250.00	280.00
158	FUR-CH-10004287	2	Furniture	Chairs	1620.00	1740.00
159	OFF-AR-10002656	7	Office Supplies	Art	30.00	30.00
160	OFF-AP-10002518	10	Office Supplies	Appliances	150.00	180.00
161	TEC-PH-10003931	8	Technology	Phones	120.00	140.00
162	OFF-PA-10000659	11	Office Supplies	Paper	20.00	20.00
163	OFF-PA-10001144	11	Office Supplies	Paper	100.00	110.00
164	FUR-CH-10003817	2	Furniture	Chairs	290.00	340.00
165	OFF-AP-10000891	10	Office Supplies	Appliances	50.00	50.00
166	OFF-LA-10003148	3	Office Supplies	Labels	20.00	20.00
167	OFF-AP-10002684	10	Office Supplies	Appliances	90.00	100.00
168	FUR-CH-10004698	2	Furniture	Chairs	370.00	400.00
169	OFF-SU-10002189	15	Office Supplies	Supplies	20.00	20.00
170	OFF-AR-10001940	7	Office Supplies	Art	0.00	0.00
171	OFF-ST-10003455	5	Office Supplies	Storage	20.00	20.00
172	TEC-AC-10004659	12	Technology	Accessories	380.00	410.00
173	TEC-PH-10003273	8	Technology	Phones	470.00	500.00
174	TEC-PH-10004896	8	Technology	Phones	140.00	150.00
175	TEC-AC-10002345	12	Technology	Accessories	30.00	30.00
176	OFF-BI-10001890	9	Office Supplies	Binders	10.00	10.00
177	TEC-AC-10002323	12	Technology	Accessories	160.00	180.00
178	OFF-ST-10001328	5	Office Supplies	Storage	40.00	40.00
179	FUR-BO-10002613	1	Furniture	Bookcases	820.00	900.00
180	TEC-PH-10001552	8	Technology	Phones	60.00	70.00
181	OFF-PA-10000061	11	Office Supplies	Paper	50.00	50.00
182	OFF-AR-10003514	7	Office Supplies	Art	20.00	20.00
183	OFF-AR-10004685	7	Office Supplies	Art	10.00	10.00
184	OFF-AR-10004027	7	Office Supplies	Art	10.00	10.00
185	OFF-ST-10001414	5	Office Supplies	Storage	40.00	50.00
186	OFF-BI-10000343	9	Office Supplies	Binders	0.00	0.00
187	OFF-PA-10002749	11	Office Supplies	Paper	20.00	20.00
188	OFF-PA-10002666	11	Office Supplies	Paper	20.00	20.00
189	FUR-TA-10004289	4	Furniture	Tables	200.00	220.00
190	OFF-AP-10003622	10	Office Supplies	Appliances	0.00	0.00
191	OFF-AP-10003217	10	Office Supplies	Appliances	60.00	70.00
192	FUR-FU-10002960	6	Furniture	Furnishings	40.00	40.00
193	TEC-PH-10001918	8	Technology	Phones	370.00	440.00
194	OFF-ST-10000642	5	Office Supplies	Storage	70.00	80.00
195	TEC-PH-10001700	8	Technology	Phones	120.00	130.00
196	OFF-FA-10000134	14	Office Supplies	Fasteners	50.00	50.00
197	OFF-ST-10001522	5	Office Supplies	Storage	80.00	90.00
198	TEC-AC-10001266	12	Technology	Accessories	20.00	20.00
199	OFF-LA-10004544	3	Office Supplies	Labels	20.00	20.00
200	FUR-BO-10004695	1	Furniture	Bookcases	390.00	450.00
201	TEC-MA-10000864	16	Technology	Machines	1040.00	1190.00
202	TEC-AC-10000109	12	Technology	Accessories	80.00	90.00
203	TEC-PH-10002563	8	Technology	Phones	250.00	300.00
204	OFF-FA-10000585	14	Office Supplies	Fasteners	10.00	10.00
205	OFF-PA-10004000	11	Office Supplies	Paper	20.00	20.00
206	FUR-FU-10000087	6	Furniture	Furnishings	60.00	70.00
207	TEC-MA-10001148	16	Technology	Machines	410.00	480.00
208	OFF-AR-10001958	7	Office Supplies	Art	30.00	30.00
209	OFF-AR-10001026	7	Office Supplies	Art	0.00	0.00
210	FUR-TA-10003748	4	Furniture	Tables	510.00	620.00
211	OFF-ST-10002485	5	Office Supplies	Storage	20.00	20.00
212	FUR-CH-10004860	2	Furniture	Chairs	130.00	160.00
213	FUR-CH-10004477	2	Furniture	Chairs	360.00	390.00
214	OFF-BI-10001679	9	Office Supplies	Binders	20.00	20.00
215	FUR-TA-10001705	4	Furniture	Tables	210.00	230.00
216	FUR-TA-10003473	4	Furniture	Tables	510.00	620.00
217	FUR-FU-10004017	6	Furniture	Furnishings	250.00	260.00
218	TEC-AC-10003832	12	Technology	Accessories	500.00	620.00
219	OFF-PA-10002479	11	Office Supplies	Paper	10.00	10.00
220	OFF-PA-10003349	11	Office Supplies	Paper	30.00	30.00
221	FUR-FU-10000576	6	Furniture	Furnishings	340.00	420.00
222	FUR-FU-10004351	6	Furniture	Furnishings	10.00	10.00
223	TEC-PH-10000011	8	Technology	Phones	30.00	30.00
224	FUR-TA-10002607	4	Furniture	Tables	150.00	180.00
225	FUR-FU-10002505	6	Furniture	Furnishings	0.00	0.00
226	OFF-ST-10002276	5	Office Supplies	Storage	150.00	170.00
227	OFF-PA-10004082	11	Office Supplies	Paper	40.00	50.00
228	OFF-AP-10002945	10	Office Supplies	Appliances	1380.00	1500.00
229	FUR-CH-10002965	2	Furniture	Chairs	300.00	320.00
230	OFF-PA-10004569	11	Office Supplies	Paper	10.00	10.00
231	OFF-ST-10001228	5	Office Supplies	Storage	70.00	80.00
232	OFF-EN-10003296	13	Office Supplies	Envelopes	330.00	360.00
233	OFF-ST-10004804	5	Office Supplies	Storage	70.00	80.00
234	TEC-PH-10001580	8	Technology	Phones	590.00	650.00
235	TEC-AC-10000290	12	Technology	Accessories	20.00	20.00
236	OFF-ST-10002790	5	Office Supplies	Storage	180.00	220.00
237	OFF-BI-10003460	9	Office Supplies	Binders	20.00	20.00
238	OFF-AP-10002203	10	Office Supplies	Appliances	0.00	0.00
239	TEC-MA-10003353	16	Technology	Machines	2170.00	2520.00
240	TEC-PH-10001433	8	Technology	Phones	300.00	330.00
241	TEC-AC-10004469	12	Technology	Accessories	70.00	80.00
242	OFF-AR-10003602	7	Office Supplies	Art	10.00	10.00
243	OFF-FA-10003472	14	Office Supplies	Fasteners	10.00	10.00
244	OFF-ST-10004180	5	Office Supplies	Storage	30.00	40.00
245	OFF-EN-10004386	13	Office Supplies	Envelopes	50.00	60.00
246	OFF-ST-10003208	5	Office Supplies	Storage	590.00	730.00
247	TEC-AC-10003628	12	Technology	Accessories	200.00	210.00
248	FUR-FU-10003274	6	Furniture	Furnishings	10.00	10.00
249	OFF-BI-10002557	9	Office Supplies	Binders	10.00	10.00
250	OFF-PA-10002615	11	Office Supplies	Paper	10.00	10.00
251	OFF-AR-10001427	7	Office Supplies	Art	10.00	10.00
252	OFF-PA-10000673	11	Office Supplies	Paper	10.00	10.00
253	OFF-PA-10004470	11	Office Supplies	Paper	20.00	20.00
254	OFF-ST-10000876	5	Office Supplies	Storage	50.00	60.00
255	OFF-LA-10002043	3	Office Supplies	Labels	20.00	20.00
256	OFF-BI-10004967	9	Office Supplies	Binders	0.00	0.00
257	TEC-PH-10001760	8	Technology	Phones	1050.00	1110.00
258	FUR-TA-10002903	4	Furniture	Tables	950.00	1040.00
259	OFF-PA-10000474	11	Office Supplies	Paper	130.00	140.00
260	TEC-AC-10001956	12	Technology	Accessories	210.00	240.00
261	OFF-PA-10004100	11	Office Supplies	Paper	30.00	30.00
262	OFF-BI-10000778	9	Office Supplies	Binders	230.00	250.00
263	OFF-SU-10000646	15	Office Supplies	Supplies	810.00	960.00
264	OFF-FA-10002983	14	Office Supplies	Fasteners	20.00	20.00
265	OFF-LA-10004689	3	Office Supplies	Labels	20.00	20.00
266	TEC-AC-10002001	12	Technology	Accessories	220.00	260.00
267	FUR-BO-10004709	1	Furniture	Bookcases	80.00	90.00
268	FUR-FU-10004091	6	Furniture	Furnishings	280.00	300.00
269	FUR-CH-10001891	2	Furniture	Chairs	190.00	230.00
270	FUR-FU-10002918	6	Furniture	Furnishings	180.00	220.00
271	OFF-BI-10004593	9	Office Supplies	Binders	70.00	80.00
272	OFF-FA-10004854	14	Office Supplies	Fasteners	30.00	30.00
273	OFF-PA-10002105	11	Office Supplies	Paper	20.00	30.00
274	OFF-ST-10002756	5	Office Supplies	Storage	930.00	1080.00
275	OFF-PA-10004243	11	Office Supplies	Paper	50.00	60.00
276	FUR-FU-10001861	6	Furniture	Furnishings	70.00	80.00
277	OFF-BI-10002706	9	Office Supplies	Binders	10.00	10.00
278	FUR-TA-10002533	4	Furniture	Tables	180.00	220.00
279	FUR-FU-10002671	6	Furniture	Furnishings	20.00	30.00
280	OFF-AR-10003651	7	Office Supplies	Art	10.00	10.00
281	OFF-BI-10001072	9	Office Supplies	Binders	50.00	50.00
282	OFF-AR-10002135	7	Office Supplies	Art	250.00	290.00
283	OFF-AR-10002804	7	Office Supplies	Art	0.00	0.00
284	FUR-FU-10001918	6	Furniture	Furnishings	20.00	20.00
285	FUR-CH-10004086	2	Furniture	Chairs	400.00	470.00
286	FUR-FU-10001756	6	Furniture	Furnishings	20.00	20.00
287	OFF-LA-10000634	3	Office Supplies	Labels	10.00	10.00
288	FUR-FU-10001588	6	Furniture	Furnishings	80.00	90.00
289	TEC-PH-10002398	8	Technology	Phones	160.00	180.00
290	OFF-PA-10001937	11	Office Supplies	Paper	20.00	20.00
291	OFF-AR-10003373	7	Office Supplies	Art	90.00	100.00
292	FUR-CH-10002602	2	Furniture	Chairs	120.00	140.00
293	TEC-MA-10002927	16	Technology	Machines	3670.00	3990.00
294	TEC-AC-10000892	12	Technology	Accessories	300.00	360.00
295	OFF-FA-10000624	14	Office Supplies	Fasteners	10.00	10.00
296	TEC-AC-10001908	12	Technology	Accessories	80.00	100.00
297	FUR-FU-10001967	6	Furniture	Furnishings	20.00	20.00
298	TEC-PH-10003645	8	Technology	Phones	270.00	290.00
299	OFF-ST-10000675	5	Office Supplies	Storage	40.00	50.00
300	FUR-CH-10003312	2	Furniture	Chairs	740.00	790.00
301	OFF-LA-10001074	3	Office Supplies	Labels	90.00	100.00
302	OFF-BI-10001524	9	Office Supplies	Binders	30.00	40.00
303	TEC-PH-10004614	8	Technology	Phones	70.00	80.00
304	OFF-BI-10001153	9	Office Supplies	Binders	20.00	20.00
305	OFF-BI-10001982	9	Office Supplies	Binders	0.00	0.00
306	OFF-BI-10001922	9	Office Supplies	Binders	0.00	0.00
307	TEC-CO-10001449	17	Technology	Copiers	770.00	960.00
308	OFF-BI-10004140	9	Office Supplies	Binders	10.00	10.00
309	OFF-BI-10003314	9	Office Supplies	Binders	10.00	10.00
310	FUR-TA-10004575	4	Furniture	Tables	570.00	700.00
311	OFF-FA-10000490	14	Office Supplies	Fasteners	0.00	0.00
312	OFF-AR-10000122	7	Office Supplies	Art	20.00	20.00
313	TEC-PH-10000702	8	Technology	Phones	60.00	70.00
314	OFF-AR-10001374	7	Office Supplies	Art	10.00	10.00
315	OFF-PA-10001970	11	Office Supplies	Paper	20.00	20.00
316	OFF-BI-10002160	9	Office Supplies	Binders	0.00	0.00
317	OFF-BI-10004995	9	Office Supplies	Binders	4140.00	4360.00
318	FUR-BO-10002268	1	Furniture	Bookcases	350.00	390.00
319	OFF-EN-10001137	13	Office Supplies	Envelopes	10.00	10.00
320	OFF-AR-10002399	7	Office Supplies	Art	20.00	20.00
321	OFF-PA-10002713	11	Office Supplies	Paper	30.00	30.00
322	OFF-AP-10001124	10	Office Supplies	Appliances	600.00	650.00
323	OFF-LA-10001158	3	Office Supplies	Labels	20.00	20.00
324	FUR-CH-10000785	2	Furniture	Chairs	460.00	490.00
325	OFF-AR-10003732	7	Office Supplies	Art	10.00	10.00
326	FUR-FU-10000023	6	Furniture	Furnishings	40.00	50.00
327	OFF-BI-10002412	9	Office Supplies	Binders	20.00	20.00
328	OFF-SU-10001225	15	Office Supplies	Supplies	10.00	10.00
329	OFF-ST-10002406	5	Office Supplies	Storage	90.00	100.00
330	OFF-PA-10002036	11	Office Supplies	Paper	30.00	30.00
331	OFF-ST-10002205	5	Office Supplies	Storage	40.00	50.00
332	TEC-AC-10003911	12	Technology	Accessories	870.00	1020.00
333	OFF-AR-10000658	7	Office Supplies	Art	10.00	10.00
334	TEC-AC-10002076	12	Technology	Accessories	410.00	480.00
335	OFF-PA-10003039	11	Office Supplies	Paper	80.00	100.00
336	FUR-TA-10004915	4	Furniture	Tables	1300.00	1490.00
337	OFF-AP-10000696	10	Office Supplies	Appliances	10.00	10.00
338	OFF-ST-10003327	5	Office Supplies	Storage	20.00	20.00
339	OFF-BI-10000309	9	Office Supplies	Binders	10.00	10.00
340	OFF-PA-10004734	11	Office Supplies	Paper	40.00	50.00
341	OFF-BI-10002225	9	Office Supplies	Binders	50.00	50.00
342	TEC-AC-10004708	12	Technology	Accessories	40.00	40.00
343	FUR-TA-10000617	4	Furniture	Tables	330.00	380.00
344	TEC-AC-10002335	12	Technology	Accessories	70.00	80.00
345	TEC-MA-10001681	16	Technology	Machines	400.00	480.00
346	FUR-FU-10001935	6	Furniture	Furnishings	0.00	0.00
347	OFF-AR-10004757	7	Office Supplies	Art	0.00	0.00
348	OFF-BI-10000050	9	Office Supplies	Binders	20.00	20.00
349	TEC-PH-10003012	8	Technology	Phones	230.00	250.00
350	TEC-CO-10002313	17	Technology	Copiers	1600.00	1800.00
351	OFF-BI-10003982	9	Office Supplies	Binders	10.00	10.00
352	OFF-BI-10004492	9	Office Supplies	Binders	60.00	80.00
353	OFF-ST-10000798	5	Office Supplies	Storage	40.00	50.00
354	OFF-PA-10002552	11	Office Supplies	Paper	10.00	10.00
355	OFF-SU-10002573	15	Office Supplies	Supplies	60.00	70.00
356	OFF-ST-10001580	5	Office Supplies	Storage	40.00	40.00
357	OFF-ST-10000934	5	Office Supplies	Storage	110.00	130.00
358	TEC-AC-10000158	12	Technology	Accessories	60.00	60.00
359	OFF-PA-10001947	11	Office Supplies	Paper	10.00	10.00
360	OFF-AR-10003478	7	Office Supplies	Art	30.00	40.00
361	OFF-AP-10004249	10	Office Supplies	Appliances	40.00	40.00
362	TEC-CO-10004115	17	Technology	Copiers	1130.00	1200.00
363	OFF-PA-10003724	11	Office Supplies	Paper	30.00	30.00
364	FUR-TA-10002041	4	Furniture	Tables	800.00	1000.00
365	OFF-PA-10002893	11	Office Supplies	Paper	10.00	10.00
366	OFF-LA-10003766	3	Office Supplies	Labels	30.00	30.00
367	FUR-BO-10001972	1	Furniture	Bookcases	1260.00	1340.00
368	FUR-CH-10003956	2	Furniture	Chairs	100.00	110.00
369	OFF-PA-10000157	11	Office Supplies	Paper	120.00	140.00
370	OFF-AR-10004344	7	Office Supplies	Art	90.00	100.00
371	FUR-CH-10004886	2	Furniture	Chairs	320.00	380.00
372	OFF-PA-10003845	11	Office Supplies	Paper	10.00	10.00
373	OFF-AR-10001573	7	Office Supplies	Art	10.00	10.00
374	OFF-EN-10000483	13	Office Supplies	Envelopes	20.00	20.00
375	TEC-AC-10004114	12	Technology	Accessories	160.00	200.00
376	FUR-FU-10004712	6	Furniture	Furnishings	60.00	60.00
377	OFF-ST-10000918	5	Office Supplies	Storage	30.00	30.00
378	FUR-CH-10000015	2	Furniture	Chairs	800.00	870.00
379	FUR-FU-10003347	6	Furniture	Furnishings	30.00	30.00
380	OFF-BI-10001543	9	Office Supplies	Binders	280.00	290.00
381	TEC-MA-10000029	16	Technology	Machines	60.00	70.00
382	OFF-AR-10000369	7	Office Supplies	Art	10.00	10.00
383	OFF-BI-10004584	9	Office Supplies	Binders	160.00	190.00
384	OFF-ST-10000617	5	Office Supplies	Storage	0.00	0.00
385	OFF-ST-10003306	5	Office Supplies	Storage	580.00	710.00
386	OFF-BI-10000773	9	Office Supplies	Binders	0.00	0.00
387	TEC-AC-10002600	12	Technology	Accessories	210.00	250.00
388	TEC-MA-10002937	16	Technology	Machines	930.00	1010.00
389	OFF-PA-10002230	11	Office Supplies	Paper	30.00	30.00
390	FUR-CH-10003396	2	Furniture	Chairs	190.00	210.00
391	FUR-FU-10000246	6	Furniture	Furnishings	10.00	10.00
392	OFF-ST-10000060	5	Office Supplies	Storage	150.00	190.00
393	OFF-ST-10003058	5	Office Supplies	Storage	60.00	70.00
394	OFF-PA-10002222	11	Office Supplies	Paper	80.00	90.00
395	FUR-CH-10002372	2	Furniture	Chairs	210.00	240.00
396	OFF-LA-10001317	3	Office Supplies	Labels	20.00	20.00
397	FUR-FU-10000206	6	Furniture	Furnishings	0.00	0.00
398	OFF-AR-10000588	7	Office Supplies	Art	50.00	60.00
399	OFF-ST-10001469	5	Office Supplies	Storage	130.00	160.00
400	OFF-AR-10001953	7	Office Supplies	Art	210.00	260.00
401	OFF-AR-10003156	7	Office Supplies	Art	30.00	30.00
402	OFF-AR-10004974	7	Office Supplies	Art	10.00	10.00
403	TEC-PH-10002365	8	Technology	Phones	40.00	40.00
404	OFF-ST-10000142	5	Office Supplies	Storage	570.00	670.00
405	TEC-AC-10001772	12	Technology	Accessories	50.00	60.00
406	FUR-CH-10000225	2	Furniture	Chairs	120.00	130.00
407	FUR-CH-10002331	2	Furniture	Chairs	670.00	750.00
408	OFF-EN-10001415	13	Office Supplies	Envelopes	10.00	10.00
409	OFF-AP-10002472	10	Office Supplies	Appliances	80.00	100.00
410	TEC-AC-10004571	12	Technology	Accessories	760.00	900.00
411	OFF-BI-10001098	9	Office Supplies	Binders	50.00	50.00
412	FUR-TA-10001889	4	Furniture	Tables	1080.00	1270.00
413	OFF-BI-10000315	9	Office Supplies	Binders	30.00	30.00
414	OFF-SU-10003505	15	Office Supplies	Supplies	180.00	190.00
415	OFF-AP-10002578	10	Office Supplies	Appliances	80.00	80.00
416	FUR-BO-10002824	1	Furniture	Bookcases	200.00	210.00
417	OFF-BI-10002194	9	Office Supplies	Binders	0.00	0.00
418	OFF-PA-10004071	11	Office Supplies	Paper	50.00	60.00
419	OFF-ST-10002743	5	Office Supplies	Storage	290.00	340.00
420	FUR-BO-10001601	1	Furniture	Bookcases	200.00	220.00
421	TEC-PH-10002680	8	Technology	Phones	610.00	700.00
422	OFF-ST-10001321	5	Office Supplies	Storage	80.00	90.00
423	OFF-PA-10001509	11	Office Supplies	Paper	60.00	60.00
424	OFF-PA-10003465	11	Office Supplies	Paper	90.00	90.00
425	TEC-PH-10000149	8	Technology	Phones	90.00	100.00
426	OFF-AR-10003045	7	Office Supplies	Art	10.00	10.00
427	OFF-ST-10000689	5	Office Supplies	Storage	600.00	700.00
428	TEC-AC-10001445	12	Technology	Accessories	10.00	10.00
429	TEC-AC-10002567	12	Technology	Accessories	140.00	160.00
430	OFF-LA-10003923	3	Office Supplies	Labels	30.00	30.00
431	FUR-BO-10001337	1	Furniture	Bookcases	480.00	510.00
432	TEC-PH-10001924	8	Technology	Phones	250.00	280.00
433	TEC-PH-10001363	8	Technology	Phones	2300.00	2740.00
434	TEC-PH-10000376	8	Technology	Phones	10.00	10.00
435	TEC-AC-10000303	12	Technology	Accessories	50.00	60.00
436	OFF-ST-10001809	5	Office Supplies	Storage	410.00	450.00
437	OFF-EN-10003845	13	Office Supplies	Envelopes	10.00	10.00
438	TEC-AC-10000991	12	Technology	Accessories	80.00	90.00
439	FUR-TA-10001857	4	Furniture	Tables	180.00	190.00
440	OFF-EN-10001434	13	Office Supplies	Envelopes	100.00	110.00
441	OFF-BI-10002498	9	Office Supplies	Binders	110.00	120.00
442	FUR-FU-10004864	6	Furniture	Furnishings	230.00	260.00
443	FUR-FU-10000073	6	Furniture	Furnishings	60.00	70.00
444	OFF-BI-10001670	9	Office Supplies	Binders	20.00	20.00
445	OFF-BI-10001658	9	Office Supplies	Binders	10.00	10.00
446	FUR-CH-10001215	2	Furniture	Chairs	650.00	800.00
447	OFF-BI-10000831	9	Office Supplies	Binders	0.00	0.00
448	OFF-PA-10000357	11	Office Supplies	Paper	30.00	30.00
449	OFF-AR-10001662	7	Office Supplies	Art	0.00	0.00
450	OFF-AR-10003856	7	Office Supplies	Art	10.00	10.00
451	OFF-BI-10003527	9	Office Supplies	Binders	5210.00	6350.00
452	FUR-FU-10001290	6	Furniture	Furnishings	110.00	130.00
453	TEC-AC-10002399	12	Technology	Accessories	40.00	40.00
454	OFF-AR-10003811	7	Office Supplies	Art	10.00	10.00
455	OFF-AR-10001246	7	Office Supplies	Art	10.00	10.00
456	TEC-CO-10003236	17	Technology	Copiers	2430.00	3000.00
457	OFF-ST-10004507	5	Office Supplies	Storage	40.00	50.00
458	OFF-PA-10001667	11	Office Supplies	Paper	10.00	10.00
459	OFF-ST-10004459	5	Office Supplies	Storage	1020.00	1130.00
460	OFF-ST-10000736	5	Office Supplies	Storage	120.00	130.00
461	OFF-BI-10000285	9	Office Supplies	Binders	10.00	10.00
462	TEC-PH-10003555	8	Technology	Phones	50.00	60.00
463	OFF-FA-10002815	14	Office Supplies	Fasteners	20.00	20.00
464	FUR-CH-10003379	2	Furniture	Chairs	540.00	680.00
465	OFF-ST-10004963	5	Office Supplies	Storage	40.00	40.00
466	OFF-SU-10002881	15	Office Supplies	Supplies	550.00	670.00
467	OFF-EN-10001335	13	Office Supplies	Envelopes	50.00	50.00
468	FUR-CH-10000595	2	Furniture	Chairs	150.00	190.00
469	FUR-FU-10000448	6	Furniture	Furnishings	40.00	50.00
470	TEC-PH-10000984	8	Technology	Phones	820.00	980.00
471	OFF-ST-10001325	5	Office Supplies	Storage	20.00	20.00
472	OFF-BI-10002429	9	Office Supplies	Binders	30.00	40.00
473	OFF-BI-10004528	9	Office Supplies	Binders	10.00	10.00
474	OFF-AP-10001271	10	Office Supplies	Appliances	130.00	150.00
475	FUR-CH-10002647	2	Furniture	Chairs	230.00	280.00
476	TEC-AC-10001432	12	Technology	Accessories	410.00	470.00
477	TEC-PH-10002262	8	Technology	Phones	300.00	380.00
478	TEC-AC-10001465	12	Technology	Accessories	50.00	60.00
479	TEC-PH-10002597	8	Technology	Phones	100.00	100.00
480	FUR-FU-10000723	6	Furniture	Furnishings	60.00	70.00
481	OFF-BI-10000404	9	Office Supplies	Binders	30.00	40.00
482	OFF-PA-10002986	11	Office Supplies	Paper	10.00	10.00
483	OFF-SU-10001935	15	Office Supplies	Supplies	10.00	10.00
484	FUR-CH-10002024	2	Furniture	Chairs	930.00	1120.00
485	FUR-FU-10003039	6	Furniture	Furnishings	20.00	30.00
486	OFF-FA-10004248	14	Office Supplies	Fasteners	10.00	10.00
487	OFF-ST-10001780	5	Office Supplies	Storage	1200.00	1300.00
488	OFF-AR-10003560	7	Office Supplies	Art	20.00	20.00
489	OFF-LA-10001297	3	Office Supplies	Labels	20.00	20.00
490	FUR-TA-10004256	4	Furniture	Tables	1260.00	1340.00
491	OFF-PA-10003441	11	Office Supplies	Paper	30.00	30.00
492	OFF-BI-10000069	9	Office Supplies	Binders	70.00	80.00
493	OFF-AP-10003914	10	Office Supplies	Appliances	10.00	10.00
494	FUR-FU-10004020	6	Furniture	Furnishings	10.00	10.00
495	OFF-FA-10003467	14	Office Supplies	Fasteners	0.00	0.00
496	TEC-PH-10002496	8	Technology	Phones	330.00	370.00
497	OFF-PA-10004530	11	Office Supplies	Paper	70.00	90.00
498	OFF-BI-10001107	9	Office Supplies	Binders	70.00	80.00
499	OFF-PA-10004451	11	Office Supplies	Paper	20.00	20.00
500	FUR-CH-10004997	2	Furniture	Chairs	370.00	450.00
501	TEC-PH-10000347	8	Technology	Phones	10.00	10.00
502	OFF-AR-10003394	7	Office Supplies	Art	10.00	10.00
503	OFF-PA-10001450	11	Office Supplies	Paper	20.00	20.00
504	OFF-SU-10001574	15	Office Supplies	Supplies	10.00	10.00
505	FUR-FU-10001475	6	Furniture	Furnishings	10.00	10.00
506	OFF-SU-10004498	15	Office Supplies	Supplies	50.00	50.00
507	TEC-PH-10000586	8	Technology	Phones	90.00	110.00
508	OFF-BI-10002764	9	Office Supplies	Binders	10.00	10.00
509	OFF-LA-10003930	3	Office Supplies	Labels	270.00	290.00
510	TEC-PH-10003800	8	Technology	Phones	80.00	80.00
511	OFF-PA-10002005	11	Office Supplies	Paper	20.00	20.00
512	OFF-PA-10004101	11	Office Supplies	Paper	10.00	10.00
513	OFF-AR-10004078	7	Office Supplies	Art	10.00	10.00
514	OFF-AP-10004708	10	Office Supplies	Appliances	70.00	80.00
515	FUR-FU-10001979	6	Furniture	Furnishings	310.00	330.00
516	OFF-SU-10004115	15	Office Supplies	Supplies	10.00	10.00
517	TEC-PH-10001425	8	Technology	Phones	120.00	140.00
518	TEC-PH-10003963	8	Technology	Phones	390.00	490.00
519	OFF-ST-10001490	5	Office Supplies	Storage	120.00	140.00
520	OFF-PA-10002120	11	Office Supplies	Paper	120.00	130.00
521	OFF-BI-10000848	9	Office Supplies	Binders	0.00	0.00
522	TEC-PH-10003092	8	Technology	Phones	50.00	60.00
523	OFF-LA-10004345	3	Office Supplies	Labels	20.00	20.00
524	OFF-PA-10001204	11	Office Supplies	Paper	10.00	10.00
525	TEC-PH-10004667	8	Technology	Phones	690.00	730.00
526	OFF-BI-10002949	9	Office Supplies	Binders	0.00	0.00
527	FUR-FU-10003849	6	Furniture	Furnishings	30.00	40.00
528	FUR-FU-10000010	6	Furniture	Furnishings	10.00	10.00
529	OFF-BI-10002824	9	Office Supplies	Binders	100.00	110.00
530	TEC-PH-10002538	8	Technology	Phones	30.00	40.00
531	OFF-BI-10002103	9	Office Supplies	Binders	10.00	10.00
532	FUR-CH-10004853	2	Furniture	Chairs	270.00	300.00
533	OFF-AP-10000179	10	Office Supplies	Appliances	490.00	560.00
534	OFF-ST-10001272	5	Office Supplies	Storage	440.00	520.00
535	FUR-FU-10000221	6	Furniture	Furnishings	30.00	40.00
536	OFF-AP-10001563	10	Office Supplies	Appliances	80.00	100.00
537	OFF-BI-10000605	9	Office Supplies	Binders	20.00	20.00
538	OFF-ST-10001963	5	Office Supplies	Storage	200.00	240.00
539	TEC-AC-10001267	12	Technology	Accessories	110.00	120.00
540	TEC-PH-10002103	8	Technology	Phones	260.00	300.00
541	TEC-AC-10002857	12	Technology	Accessories	20.00	20.00
542	FUR-CH-10001482	2	Furniture	Chairs	320.00	390.00
543	OFF-BI-10001989	9	Office Supplies	Binders	20.00	20.00
544	OFF-AP-10003287	10	Office Supplies	Appliances	110.00	120.00
545	OFF-BI-10004728	9	Office Supplies	Binders	20.00	20.00
546	FUR-FU-10000732	6	Furniture	Furnishings	20.00	20.00
547	OFF-ST-10000585	5	Office Supplies	Storage	300.00	330.00
548	OFF-LA-10002787	3	Office Supplies	Labels	20.00	30.00
549	OFF-PA-10001934	11	Office Supplies	Paper	10.00	10.00
550	OFF-AP-10002457	10	Office Supplies	Appliances	190.00	210.00
551	OFF-FA-10003112	14	Office Supplies	Fasteners	20.00	30.00
552	OFF-AP-10002350	10	Office Supplies	Appliances	30.00	30.00
553	TEC-AC-10001142	12	Technology	Accessories	290.00	320.00
554	TEC-AC-10001101	12	Technology	Accessories	80.00	100.00
555	OFF-AP-10002439	10	Office Supplies	Appliances	90.00	110.00
556	OFF-BI-10002827	9	Office Supplies	Binders	0.00	0.00
557	OFF-EN-10002230	13	Office Supplies	Envelopes	110.00	130.00
558	OFF-ST-10001511	5	Office Supplies	Storage	600.00	720.00
559	OFF-SU-10004231	15	Office Supplies	Supplies	20.00	20.00
560	TEC-PH-10004042	8	Technology	Phones	320.00	380.00
561	FUR-FU-10003096	6	Furniture	Furnishings	20.00	30.00
562	FUR-FU-10002759	6	Furniture	Furnishings	20.00	20.00
563	FUR-TA-10000688	4	Furniture	Tables	100.00	110.00
564	OFF-AR-10001954	7	Office Supplies	Art	20.00	20.00
565	OFF-AP-10004532	10	Office Supplies	Appliances	50.00	60.00
566	OFF-PA-10002137	11	Office Supplies	Paper	40.00	40.00
567	OFF-AP-10000804	10	Office Supplies	Appliances	0.00	0.00
568	TEC-AC-10003614	12	Technology	Accessories	20.00	30.00
569	FUR-FU-10003553	6	Furniture	Furnishings	70.00	80.00
570	OFF-BI-10004632	9	Office Supplies	Binders	160.00	180.00
571	OFF-BI-10003305	9	Office Supplies	Binders	10.00	10.00
572	OFF-ST-10002583	5	Office Supplies	Storage	50.00	60.00
573	TEC-MA-10004125	16	Technology	Machines	7280.00	8000.00
574	OFF-LA-10001934	3	Office Supplies	Labels	10.00	10.00
575	FUR-BO-10004015	1	Furniture	Bookcases	160.00	190.00
576	FUR-FU-10004071	6	Furniture	Furnishings	90.00	100.00
577	OFF-ST-10002444	5	Office Supplies	Storage	40.00	40.00
578	TEC-AC-10002253	12	Technology	Accessories	140.00	170.00
579	OFF-PA-10000743	11	Office Supplies	Paper	30.00	30.00
580	OFF-LA-10002312	3	Office Supplies	Labels	40.00	50.00
581	OFF-LA-10003510	3	Office Supplies	Labels	80.00	100.00
582	OFF-AR-10001118	7	Office Supplies	Art	0.00	0.00
583	OFF-BI-10001575	9	Office Supplies	Binders	20.00	20.00
584	FUR-FU-10003394	6	Furniture	Furnishings	190.00	210.00
585	FUR-TA-10002774	4	Furniture	Tables	340.00	370.00
586	OFF-PA-10001800	11	Office Supplies	Paper	10.00	10.00
587	OFF-AP-10001469	10	Office Supplies	Appliances	140.00	170.00
588	FUR-BO-10003272	1	Furniture	Bookcases	740.00	880.00
589	OFF-EN-10001219	13	Office Supplies	Envelopes	20.00	20.00
590	OFF-AP-10001154	10	Office Supplies	Appliances	240.00	280.00
591	TEC-AC-10001606	12	Technology	Accessories	260.00	300.00
592	OFF-BI-10003355	9	Office Supplies	Binders	20.00	20.00
593	FUR-FU-10002253	6	Furniture	Furnishings	90.00	100.00
594	OFF-PA-10004092	11	Office Supplies	Paper	140.00	150.00
595	FUR-TA-10000198	4	Furniture	Tables	1370.00	1650.00
596	OFF-ST-10000036	5	Office Supplies	Storage	260.00	300.00
597	FUR-FU-10000222	6	Furniture	Furnishings	120.00	130.00
598	OFF-SU-10004664	15	Office Supplies	Supplies	40.00	50.00
599	OFF-EN-10001141	13	Office Supplies	Envelopes	20.00	20.00
600	TEC-PH-10002170	8	Technology	Phones	50.00	60.00
601	OFF-PA-10001954	11	Office Supplies	Paper	160.00	180.00
602	FUR-TA-10002228	4	Furniture	Tables	350.00	400.00
603	OFF-ST-10004634	5	Office Supplies	Storage	30.00	30.00
604	TEC-AC-10003610	12	Technology	Accessories	170.00	180.00
605	FUR-BO-10001619	1	Furniture	Bookcases	80.00	80.00
606	OFF-BI-10000138	9	Office Supplies	Binders	20.00	20.00
607	TEC-AC-10001383	12	Technology	Accessories	50.00	50.00
608	OFF-LA-10003223	3	Office Supplies	Labels	10.00	10.00
609	OFF-BI-10004094	9	Office Supplies	Binders	0.00	0.00
610	OFF-PA-10004971	11	Office Supplies	Paper	0.00	0.00
611	OFF-SU-10004261	15	Office Supplies	Supplies	50.00	60.00
612	TEC-PH-10000004	8	Technology	Phones	10.00	10.00
613	OFF-BI-10003638	9	Office Supplies	Binders	50.00	60.00
614	FUR-FU-10003577	6	Furniture	Furnishings	130.00	160.00
615	OFF-BI-10000546	9	Office Supplies	Binders	0.00	0.00
616	TEC-CO-10002095	17	Technology	Copiers	1020.00	1200.00
617	FUR-TA-10001095	4	Furniture	Tables	350.00	380.00
618	OFF-LA-10004484	3	Office Supplies	Labels	10.00	10.00
619	OFF-EN-10001532	13	Office Supplies	Envelopes	50.00	50.00
620	TEC-AC-10003174	12	Technology	Accessories	530.00	650.00
621	OFF-BI-10004187	9	Office Supplies	Binders	10.00	10.00
622	OFF-ST-10000025	5	Office Supplies	Storage	540.00	570.00
623	FUR-FU-10004306	6	Furniture	Furnishings	280.00	310.00
624	FUR-CH-10003746	2	Furniture	Chairs	570.00	640.00
625	OFF-BI-10001036	9	Office Supplies	Binders	20.00	20.00
626	OFF-BI-10000301	9	Office Supplies	Binders	30.00	30.00
627	OFF-AR-10004648	7	Office Supplies	Art	40.00	40.00
628	FUR-FU-10002597	6	Furniture	Furnishings	30.00	30.00
629	OFF-AR-10003405	7	Office Supplies	Art	30.00	30.00
630	FUR-CH-10002335	2	Furniture	Chairs	440.00	540.00
631	OFF-PA-10003657	11	Office Supplies	Paper	0.00	0.00
632	FUR-BO-10004409	1	Furniture	Bookcases	40.00	40.00
633	TEC-AC-10000057	12	Technology	Accessories	50.00	50.00
634	OFF-EN-10000056	13	Office Supplies	Envelopes	160.00	190.00
635	OFF-BI-10000014	9	Office Supplies	Binders	20.00	20.00
636	FUR-CH-10004675	2	Furniture	Chairs	290.00	350.00
637	OFF-BI-10001132	9	Office Supplies	Binders	30.00	40.00
638	FUR-CH-10003199	2	Furniture	Chairs	280.00	330.00
639	TEC-PH-10001530	8	Technology	Phones	1170.00	1360.00
640	OFF-LA-10001569	3	Office Supplies	Labels	10.00	10.00
641	OFF-PA-10000176	11	Office Supplies	Paper	110.00	130.00
642	OFF-LA-10002271	3	Office Supplies	Labels	20.00	20.00
643	FUR-FU-10004090	6	Furniture	Furnishings	20.00	20.00
644	OFF-AP-10000576	10	Office Supplies	Appliances	320.00	360.00
645	OFF-PA-10003953	11	Office Supplies	Paper	10.00	10.00
646	FUR-FU-10000794	6	Furniture	Furnishings	20.00	20.00
647	OFF-AR-10001897	7	Office Supplies	Art	40.00	40.00
648	TEC-PH-10001795	8	Technology	Phones	1700.00	1980.00
649	TEC-AC-10004901	12	Technology	Accessories	130.00	150.00
650	OFF-AR-10003190	7	Office Supplies	Art	10.00	10.00
651	OFF-AP-10000240	10	Office Supplies	Appliances	190.00	210.00
652	TEC-AC-10001838	12	Technology	Accessories	1270.00	1400.00
653	OFF-PA-10003651	11	Office Supplies	Paper	10.00	10.00
654	OFF-BI-10003094	9	Office Supplies	Binders	0.00	0.00
655	FUR-CH-10001394	2	Furniture	Chairs	1030.00	1230.00
656	OFF-BI-10004230	9	Office Supplies	Binders	30.00	30.00
657	OFF-PA-10003395	11	Office Supplies	Paper	290.00	340.00
658	TEC-AC-10002402	12	Technology	Accessories	210.00	240.00
659	TEC-AC-10003441	12	Technology	Accessories	60.00	70.00
660	OFF-FA-10002280	14	Office Supplies	Fasteners	40.00	40.00
661	OFF-SU-10000381	15	Office Supplies	Supplies	30.00	40.00
662	OFF-EN-10004459	13	Office Supplies	Envelopes	20.00	20.00
663	FUR-CH-10000665	2	Furniture	Chairs	250.00	300.00
664	OFF-AP-10003884	10	Office Supplies	Appliances	150.00	180.00
665	TEC-PH-10001557	8	Technology	Phones	180.00	190.00
666	TEC-PH-10002085	8	Technology	Phones	60.00	70.00
667	OFF-AR-10002956	7	Office Supplies	Art	30.00	40.00
668	OFF-AP-10003266	10	Office Supplies	Appliances	20.00	20.00
669	TEC-MA-10004002	16	Technology	Machines	220.00	270.00
670	OFF-BI-10001071	9	Office Supplies	Binders	40.00	50.00
671	OFF-PA-10001560	11	Office Supplies	Paper	10.00	10.00
672	OFF-AR-10002578	7	Office Supplies	Art	10.00	10.00
673	FUR-BO-10001519	1	Furniture	Bookcases	170.00	190.00
674	OFF-BI-10001294	9	Office Supplies	Binders	30.00	40.00
675	OFF-BI-10001636	9	Office Supplies	Binders	30.00	30.00
676	OFF-SU-10002503	15	Office Supplies	Supplies	10.00	10.00
677	OFF-LA-10004093	3	Office Supplies	Labels	10.00	10.00
678	FUR-FU-10003878	6	Furniture	Furnishings	40.00	50.00
679	TEC-AC-10000710	12	Technology	Accessories	110.00	120.00
680	OFF-AR-10002335	7	Office Supplies	Art	10.00	10.00
681	OFF-PA-10001870	11	Office Supplies	Paper	30.00	40.00
682	OFF-PA-10001019	11	Office Supplies	Paper	30.00	40.00
683	OFF-SU-10002537	15	Office Supplies	Supplies	90.00	100.00
684	OFF-ST-10003221	5	Office Supplies	Storage	20.00	20.00
685	OFF-AR-10003752	7	Office Supplies	Art	20.00	20.00
686	TEC-AC-10001714	12	Technology	Accessories	170.00	190.00
687	OFF-AR-10003958	7	Office Supplies	Art	10.00	10.00
688	TEC-PH-10002923	8	Technology	Phones	50.00	60.00
689	OFF-LA-10004272	3	Office Supplies	Labels	0.00	0.00
690	FUR-FU-10000965	6	Furniture	Furnishings	40.00	50.00
691	OFF-LA-10004853	3	Office Supplies	Labels	20.00	20.00
692	OFF-BI-10003719	9	Office Supplies	Binders	30.00	40.00
693	OFF-BI-10000545	9	Office Supplies	Binders	910.00	1140.00
694	OFF-PA-10003591	11	Office Supplies	Paper	30.00	30.00
695	OFF-PA-10001790	11	Office Supplies	Paper	160.00	190.00
696	TEC-AC-10002049	12	Technology	Accessories	330.00	370.00
697	OFF-BI-10003712	9	Office Supplies	Binders	10.00	10.00
698	OFF-BI-10003984	9	Office Supplies	Binders	60.00	70.00
699	FUR-FU-10001424	6	Furniture	Furnishings	20.00	20.00
700	OFF-BI-10002071	9	Office Supplies	Binders	10.00	10.00
701	OFF-ST-10002486	5	Office Supplies	Storage	70.00	80.00
702	TEC-AC-10000927	12	Technology	Accessories	130.00	150.00
703	OFF-PA-10001622	11	Office Supplies	Paper	0.00	0.00
704	OFF-AR-10003158	7	Office Supplies	Art	20.00	20.00
705	TEC-PH-10002660	8	Technology	Phones	510.00	540.00
706	OFF-BI-10003364	9	Office Supplies	Binders	60.00	70.00
707	OFF-EN-10001099	13	Office Supplies	Envelopes	20.00	20.00
708	OFF-PA-10002250	11	Office Supplies	Paper	50.00	50.00
709	OFF-BI-10004716	9	Office Supplies	Binders	10.00	10.00
710	OFF-LA-10001045	3	Office Supplies	Labels	10.00	10.00
711	OFF-BI-10001510	9	Office Supplies	Binders	20.00	20.00
712	OFF-PA-10002947	11	Office Supplies	Paper	20.00	20.00
713	OFF-PA-10000019	11	Office Supplies	Paper	10.00	10.00
714	FUR-BO-10003441	1	Furniture	Bookcases	280.00	320.00
715	TEC-PH-10004774	8	Technology	Phones	70.00	90.00
716	OFF-BI-10003684	9	Office Supplies	Binders	40.00	50.00
717	TEC-PH-10001494	8	Technology	Phones	1010.00	1200.00
718	TEC-AC-10004666	12	Technology	Accessories	1830.00	1930.00
719	OFF-ST-10003816	5	Office Supplies	Storage	320.00	350.00
720	FUR-TA-10001520	4	Furniture	Tables	90.00	100.00
721	OFF-ST-10001558	5	Office Supplies	Storage	10.00	10.00
722	TEC-AC-10002473	12	Technology	Accessories	80.00	90.00
723	TEC-PH-10004531	8	Technology	Phones	20.00	20.00
724	OFF-AP-10004487	10	Office Supplies	Appliances	340.00	410.00
725	OFF-PA-10003543	11	Office Supplies	Paper	20.00	20.00
726	TEC-AC-10004353	12	Technology	Accessories	210.00	250.00
727	OFF-AR-10001468	7	Office Supplies	Art	90.00	90.00
728	OFF-PA-10002195	11	Office Supplies	Paper	10.00	10.00
729	OFF-PA-10001745	11	Office Supplies	Paper	40.00	50.00
730	OFF-BI-10004826	9	Office Supplies	Binders	20.00	30.00
731	OFF-PA-10000289	11	Office Supplies	Paper	10.00	10.00
732	OFF-AP-10003040	10	Office Supplies	Appliances	120.00	130.00
733	OFF-PA-10000350	11	Office Supplies	Paper	20.00	20.00
734	OFF-BI-10001759	9	Office Supplies	Binders	10.00	10.00
735	OFF-ST-10001496	5	Office Supplies	Storage	500.00	540.00
736	OFF-BI-10002931	9	Office Supplies	Binders	150.00	170.00
737	FUR-TA-10002356	4	Furniture	Tables	320.00	390.00
738	FUR-FU-10003601	6	Furniture	Furnishings	420.00	520.00
739	FUR-TA-10004154	4	Furniture	Tables	1950.00	2070.00
740	OFF-PA-10000788	11	Office Supplies	Paper	20.00	20.00
741	FUR-FU-10001940	6	Furniture	Furnishings	30.00	30.00
742	OFF-BI-10004465	9	Office Supplies	Binders	0.00	0.00
743	OFF-PA-10002333	11	Office Supplies	Paper	20.00	20.00
744	FUR-FU-10004188	6	Furniture	Furnishings	190.00	200.00
745	OFF-BI-10000145	9	Office Supplies	Binders	10.00	10.00
746	OFF-LA-10001613	3	Office Supplies	Labels	0.00	0.00
747	OFF-LA-10004055	3	Office Supplies	Labels	10.00	10.00
748	OFF-PA-10004621	11	Office Supplies	Paper	10.00	10.00
749	OFF-PA-10001281	11	Office Supplies	Paper	180.00	190.00
750	OFF-ST-10001097	5	Office Supplies	Storage	420.00	500.00
751	FUR-FU-10001095	6	Furniture	Furnishings	110.00	130.00
752	OFF-BI-10002012	9	Office Supplies	Binders	0.00	0.00
753	OFF-PA-10004156	11	Office Supplies	Paper	30.00	30.00
754	OFF-AR-10000034	7	Office Supplies	Art	0.00	0.00
755	TEC-PH-10000560	8	Technology	Phones	460.00	560.00
756	OFF-EN-10000461	13	Office Supplies	Envelopes	20.00	30.00
757	TEC-MA-10003066	16	Technology	Machines	320.00	340.00
758	OFF-BI-10004022	9	Office Supplies	Binders	0.00	0.00
759	OFF-AR-10001988	7	Office Supplies	Art	20.00	20.00
760	OFF-PA-10003625	11	Office Supplies	Paper	120.00	150.00
761	OFF-BI-10003925	9	Office Supplies	Binders	2200.00	2720.00
762	OFF-EN-10003862	13	Office Supplies	Envelopes	10.00	10.00
763	OFF-ST-10004258	5	Office Supplies	Storage	30.00	40.00
764	FUR-FU-10002885	6	Furniture	Furnishings	20.00	20.00
765	TEC-AC-10003033	12	Technology	Accessories	2010.00	2310.00
766	OFF-ST-10000046	5	Office Supplies	Storage	450.00	480.00
767	OFF-BI-10002049	9	Office Supplies	Binders	0.00	0.00
768	FUR-FU-10001602	6	Furniture	Furnishings	140.00	150.00
769	OFF-ST-10003722	5	Office Supplies	Storage	10.00	10.00
770	TEC-AC-10003198	12	Technology	Accessories	90.00	100.00
771	FUR-FU-10002191	6	Furniture	Furnishings	10.00	10.00
772	TEC-PH-10004188	8	Technology	Phones	110.00	120.00
773	OFF-ST-10001526	5	Office Supplies	Storage	490.00	600.00
774	OFF-AR-10001166	7	Office Supplies	Art	20.00	20.00
775	FUR-CH-10000309	2	Furniture	Chairs	1080.00	1270.00
776	TEC-MA-10004212	16	Technology	Machines	1240.00	1380.00
777	OFF-EN-10003072	13	Office Supplies	Envelopes	10.00	10.00
778	OFF-BI-10000320	9	Office Supplies	Binders	10.00	10.00
779	OFF-PA-10001166	11	Office Supplies	Paper	20.00	20.00
780	OFF-PA-10003656	11	Office Supplies	Paper	50.00	60.00
781	TEC-PH-10000148	8	Technology	Phones	20.00	20.00
782	TEC-PH-10003885	8	Technology	Phones	160.00	200.00
783	OFF-LA-10001175	3	Office Supplies	Labels	10.00	10.00
784	OFF-PA-10000955	11	Office Supplies	Paper	20.00	20.00
785	FUR-FU-10003975	6	Furniture	Furnishings	80.00	90.00
786	OFF-BI-10003707	9	Office Supplies	Binders	30.00	40.00
787	OFF-AR-10000203	7	Office Supplies	Art	20.00	20.00
788	OFF-AR-10004790	7	Office Supplies	Art	30.00	30.00
789	TEC-AC-10004761	12	Technology	Accessories	20.00	30.00
790	FUR-BO-10001811	1	Furniture	Bookcases	680.00	720.00
791	OFF-AR-10001130	7	Office Supplies	Art	10.00	10.00
792	OFF-AP-10000055	10	Office Supplies	Appliances	50.00	60.00
793	FUR-CH-10002304	2	Furniture	Chairs	230.00	250.00
794	FUR-FU-10000293	6	Furniture	Furnishings	140.00	170.00
795	OFF-PA-10001307	11	Office Supplies	Paper	10.00	10.00
796	FUR-FU-10004460	6	Furniture	Furnishings	250.00	280.00
797	OFF-AR-10000716	7	Office Supplies	Art	10.00	10.00
798	FUR-FU-10004622	6	Furniture	Furnishings	100.00	110.00
799	OFF-BI-10003529	9	Office Supplies	Binders	10.00	10.00
800	OFF-BI-10001097	9	Office Supplies	Binders	20.00	20.00
801	OFF-BI-10001597	9	Office Supplies	Binders	60.00	70.00
802	OFF-FA-10001754	14	Office Supplies	Fasteners	0.00	0.00
803	OFF-FA-10004838	14	Office Supplies	Fasteners	10.00	10.00
804	TEC-PH-10002115	8	Technology	Phones	110.00	120.00
805	OFF-FA-10003059	14	Office Supplies	Fasteners	0.00	0.00
806	OFF-BI-10004330	9	Office Supplies	Binders	50.00	60.00
807	OFF-BI-10003669	9	Office Supplies	Binders	10.00	10.00
808	OFF-BI-10003727	9	Office Supplies	Binders	10.00	10.00
809	TEC-AC-10003447	12	Technology	Accessories	30.00	30.00
810	OFF-AR-10000255	7	Office Supplies	Art	30.00	40.00
811	OFF-AP-10002191	10	Office Supplies	Appliances	100.00	120.00
812	OFF-PA-10000349	11	Office Supplies	Paper	20.00	20.00
813	FUR-CH-10002880	2	Furniture	Chairs	1000.00	1110.00
814	OFF-PA-10003127	11	Office Supplies	Paper	30.00	30.00
815	TEC-MA-10003979	16	Technology	Machines	4360.00	4900.00
816	OFF-PA-10000029	11	Office Supplies	Paper	10.00	10.00
817	OFF-LA-10000452	3	Office Supplies	Labels	0.00	0.00
818	TEC-PH-10001819	8	Technology	Phones	60.00	70.00
819	OFF-AR-10002952	7	Office Supplies	Art	100.00	120.00
820	TEC-PH-10000576	8	Technology	Phones	180.00	220.00
821	OFF-PA-10000605	11	Office Supplies	Paper	20.00	30.00
822	OFF-ST-10004340	5	Office Supplies	Storage	320.00	350.00
823	OFF-BI-10004001	9	Office Supplies	Binders	40.00	40.00
824	FUR-TA-10004147	4	Furniture	Tables	360.00	450.00
825	OFF-AR-10001545	7	Office Supplies	Art	10.00	10.00
826	TEC-AC-10001013	12	Technology	Accessories	30.00	30.00
827	OFF-AR-10002255	7	Office Supplies	Art	10.00	10.00
828	OFF-PA-10001892	11	Office Supplies	Paper	20.00	20.00
829	OFF-BI-10003676	9	Office Supplies	Binders	10.00	10.00
830	OFF-FA-10003495	14	Office Supplies	Fasteners	60.00	60.00
831	OFF-EN-10003798	13	Office Supplies	Envelopes	30.00	40.00
832	TEC-PH-10003589	8	Technology	Phones	60.00	70.00
833	OFF-PA-10004735	11	Office Supplies	Paper	10.00	10.00
834	FUR-BO-10002206	1	Furniture	Bookcases	100.00	120.00
835	OFF-PA-10000141	11	Office Supplies	Paper	0.00	0.00
836	TEC-PH-10001061	8	Technology	Phones	600.00	700.00
837	OFF-AR-10002375	7	Office Supplies	Art	20.00	20.00
838	OFF-EN-10001539	13	Office Supplies	Envelopes	20.00	20.00
839	FUR-TA-10004086	4	Furniture	Tables	320.00	340.00
840	OFF-PA-10000100	11	Office Supplies	Paper	40.00	40.00
841	OFF-LA-10000973	3	Office Supplies	Labels	10.00	10.00
842	OFF-ST-10001476	5	Office Supplies	Storage	70.00	90.00
843	OFF-EN-10002831	13	Office Supplies	Envelopes	240.00	290.00
844	OFF-PA-10001763	11	Office Supplies	Paper	20.00	20.00
845	OFF-BI-10002072	9	Office Supplies	Binders	20.00	20.00
846	OFF-FA-10001561	14	Office Supplies	Fasteners	10.00	10.00
847	TEC-MA-10004241	16	Technology	Machines	640.00	690.00
848	OFF-AP-10003849	10	Office Supplies	Appliances	590.00	640.00
849	OFF-FA-10000735	14	Office Supplies	Fasteners	10.00	10.00
850	OFF-BI-10003350	9	Office Supplies	Binders	10.00	10.00
851	TEC-PH-10000307	8	Technology	Phones	10.00	10.00
852	TEC-CO-10004202	17	Technology	Copiers	560.00	600.00
853	FUR-FU-10001852	6	Furniture	Furnishings	10.00	10.00
854	OFF-AR-10003759	7	Office Supplies	Art	0.00	0.00
855	OFF-ST-10004337	5	Office Supplies	Storage	110.00	120.00
856	FUR-TA-10001932	4	Furniture	Tables	2060.00	2240.00
857	FUR-CH-10002126	2	Furniture	Chairs	180.00	200.00
858	TEC-PH-10004700	8	Technology	Phones	10.00	10.00
859	OFF-BI-10003429	9	Office Supplies	Binders	30.00	30.00
860	FUR-FU-10004952	6	Furniture	Furnishings	90.00	110.00
861	OFF-PA-10003172	11	Office Supplies	Paper	20.00	20.00
862	OFF-ST-10002352	5	Office Supplies	Storage	30.00	30.00
863	OFF-PA-10002259	11	Office Supplies	Paper	20.00	20.00
864	OFF-BI-10002976	9	Office Supplies	Binders	20.00	20.00
865	OFF-BI-10003694	9	Office Supplies	Binders	40.00	50.00
866	OFF-LA-10004425	3	Office Supplies	Labels	10.00	10.00
867	FUR-CH-10001270	2	Furniture	Chairs	160.00	170.00
868	TEC-PH-10004539	8	Technology	Phones	1240.00	1320.00
869	OFF-AR-10001919	7	Office Supplies	Art	0.00	0.00
870	TEC-PH-10003655	8	Technology	Phones	10.00	10.00
871	OFF-BI-10004656	9	Office Supplies	Binders	10.00	10.00
872	OFF-ST-10002344	5	Office Supplies	Storage	390.00	490.00
873	TEC-PH-10004447	8	Technology	Phones	800.00	890.00
874	FUR-CH-10003973	2	Furniture	Chairs	750.00	890.00
875	OFF-PA-10000682	11	Office Supplies	Paper	20.00	20.00
876	FUR-FU-10002268	6	Furniture	Furnishings	20.00	20.00
877	TEC-AC-10001990	12	Technology	Accessories	380.00	430.00
878	FUR-CH-10004540	2	Furniture	Chairs	90.00	100.00
879	OFF-ST-10002292	5	Office Supplies	Storage	550.00	590.00
880	OFF-AR-10004999	7	Office Supplies	Art	30.00	40.00
881	OFF-BI-10001031	9	Office Supplies	Binders	10.00	10.00
882	OFF-BI-10002432	9	Office Supplies	Binders	0.00	0.00
883	FUR-FU-10001867	6	Furniture	Furnishings	20.00	20.00
884	TEC-PH-10002200	8	Technology	Phones	1760.00	1930.00
885	TEC-PH-10000439	8	Technology	Phones	250.00	260.00
886	OFF-PA-10001685	11	Office Supplies	Paper	30.00	40.00
887	OFF-ST-10001418	5	Office Supplies	Storage	160.00	180.00
888	OFF-ST-10000676	5	Office Supplies	Storage	180.00	190.00
889	OFF-AR-10001022	7	Office Supplies	Art	10.00	10.00
890	OFF-EN-10003055	13	Office Supplies	Envelopes	70.00	80.00
891	TEC-CO-10001046	17	Technology	Copiers	780.00	840.00
892	FUR-FU-10000076	6	Furniture	Furnishings	40.00	50.00
893	FUR-FU-10003268	6	Furniture	Furnishings	50.00	60.00
894	FUR-FU-10003691	6	Furniture	Furnishings	10.00	10.00
895	OFF-AR-10003903	7	Office Supplies	Art	30.00	40.00
896	TEC-PH-10003442	8	Technology	Phones	20.00	20.00
897	OFF-BI-10004519	9	Office Supplies	Binders	380.00	400.00
898	OFF-EN-10004955	13	Office Supplies	Envelopes	50.00	50.00
899	FUR-TA-10004619	4	Furniture	Tables	690.00	760.00
900	FUR-BO-10004467	1	Furniture	Bookcases	200.00	250.00
901	OFF-AR-10002280	7	Office Supplies	Art	40.00	40.00
902	FUR-CH-10001708	2	Furniture	Chairs	1070.00	1140.00
903	OFF-AR-10000462	7	Office Supplies	Art	0.00	0.00
904	TEC-PH-10004165	8	Technology	Phones	970.00	1100.00
905	FUR-FU-10003724	6	Furniture	Furnishings	10.00	10.00
906	FUR-FU-10003535	6	Furniture	Furnishings	30.00	40.00
907	OFF-ST-10003716	5	Office Supplies	Storage	490.00	540.00
908	TEC-PH-10004586	8	Technology	Phones	710.00	860.00
909	OFF-BI-10004236	9	Office Supplies	Binders	20.00	20.00
910	OFF-AR-10000422	7	Office Supplies	Art	10.00	10.00
911	OFF-PA-10002870	11	Office Supplies	Paper	10.00	10.00
912	OFF-ST-10000563	5	Office Supplies	Storage	80.00	100.00
913	OFF-BI-10002854	9	Office Supplies	Binders	40.00	40.00
914	FUR-CH-10001973	2	Furniture	Chairs	320.00	390.00
915	TEC-AC-10000580	12	Technology	Accessories	50.00	60.00
916	OFF-AR-10004022	7	Office Supplies	Art	80.00	90.00
917	TEC-AC-10004209	12	Technology	Accessories	20.00	30.00
918	TEC-AC-10000023	12	Technology	Accessories	70.00	80.00
919	TEC-PH-10003505	8	Technology	Phones	250.00	280.00
920	OFF-LA-10000121	3	Office Supplies	Labels	20.00	20.00
921	OFF-BI-10002026	9	Office Supplies	Binders	20.00	20.00
922	OFF-PA-10000994	11	Office Supplies	Paper	240.00	250.00
923	OFF-BI-10002813	9	Office Supplies	Binders	0.00	0.00
924	OFF-AR-10004817	7	Office Supplies	Art	20.00	20.00
925	OFF-AR-10001860	7	Office Supplies	Art	20.00	20.00
926	OFF-BI-10004970	9	Office Supplies	Binders	10.00	10.00
927	OFF-PA-10002968	11	Office Supplies	Paper	100.00	110.00
928	FUR-BO-10003433	1	Furniture	Bookcases	50.00	60.00
929	FUR-FU-10002554	6	Furniture	Furnishings	20.00	20.00
930	TEC-PH-10003437	8	Technology	Phones	390.00	420.00
931	OFF-AP-10003971	10	Office Supplies	Appliances	20.00	20.00
932	FUR-CH-10003846	2	Furniture	Chairs	140.00	160.00
933	OFF-LA-10001404	3	Office Supplies	Labels	0.00	0.00
934	OFF-LA-10001474	3	Office Supplies	Labels	100.00	120.00
935	OFF-PA-10003072	11	Office Supplies	Paper	30.00	40.00
936	FUR-FU-10004960	6	Furniture	Furnishings	140.00	180.00
937	TEC-AC-10003116	12	Technology	Accessories	10.00	10.00
938	OFF-AP-10004859	10	Office Supplies	Appliances	70.00	70.00
939	OFF-PA-10002659	11	Office Supplies	Paper	10.00	10.00
940	OFF-BI-10004139	9	Office Supplies	Binders	20.00	20.00
941	OFF-AR-10002818	7	Office Supplies	Art	80.00	90.00
942	OFF-AP-10001303	10	Office Supplies	Appliances	10.00	10.00
943	OFF-ST-10002574	5	Office Supplies	Storage	500.00	550.00
944	FUR-FU-10004018	6	Furniture	Furnishings	30.00	30.00
945	TEC-PH-10002549	8	Technology	Phones	630.00	680.00
946	OFF-PA-10004911	11	Office Supplies	Paper	70.00	80.00
947	TEC-MA-10002178	16	Technology	Machines	600.00	700.00
948	OFF-AR-10000411	7	Office Supplies	Art	40.00	50.00
949	OFF-LA-10000262	3	Office Supplies	Labels	10.00	10.00
950	OFF-PA-10000466	11	Office Supplies	Paper	50.00	50.00
951	OFF-AR-10003829	7	Office Supplies	Art	20.00	20.00
952	OFF-BI-10001758	9	Office Supplies	Binders	40.00	50.00
953	OFF-BI-10000136	9	Office Supplies	Binders	40.00	40.00
954	OFF-ST-10000649	5	Office Supplies	Storage	30.00	30.00
955	OFF-PA-10003641	11	Office Supplies	Paper	70.00	80.00
956	FUR-CH-10002961	2	Furniture	Chairs	140.00	150.00
957	OFF-PA-10004041	11	Office Supplies	Paper	20.00	20.00
958	TEC-PH-10001336	8	Technology	Phones	270.00	310.00
959	TEC-MA-10003183	16	Technology	Machines	90.00	100.00
960	TEC-AC-10001314	12	Technology	Accessories	190.00	240.00
961	TEC-AC-10004510	12	Technology	Accessories	50.00	50.00
962	OFF-BI-10000042	9	Office Supplies	Binders	20.00	20.00
963	FUR-TA-10003008	4	Furniture	Tables	850.00	910.00
964	OFF-AP-10003590	10	Office Supplies	Appliances	960.00	1090.00
965	OFF-PA-10000806	11	Office Supplies	Paper	400.00	450.00
966	OFF-AR-10000896	7	Office Supplies	Art	20.00	20.00
967	TEC-PH-10002310	8	Technology	Phones	360.00	400.00
968	OFF-ST-10002289	5	Office Supplies	Storage	140.00	160.00
969	OFF-PA-10001289	11	Office Supplies	Paper	310.00	350.00
970	OFF-FA-10000053	14	Office Supplies	Fasteners	10.00	10.00
971	OFF-EN-10003001	13	Office Supplies	Envelopes	160.00	170.00
972	FUR-TA-10002958	4	Furniture	Tables	550.00	650.00
973	FUR-TA-10001676	4	Furniture	Tables	60.00	70.00
974	OFF-BI-10000822	9	Office Supplies	Binders	20.00	20.00
975	OFF-PA-10004888	11	Office Supplies	Paper	10.00	10.00
976	FUR-TA-10002622	4	Furniture	Tables	200.00	210.00
977	OFF-PA-10000418	11	Office Supplies	Paper	350.00	420.00
978	FUR-TA-10001039	4	Furniture	Tables	130.00	150.00
979	OFF-AR-10002240	7	Office Supplies	Art	70.00	80.00
980	OFF-BI-10002867	9	Office Supplies	Binders	280.00	330.00
981	FUR-FU-10003976	6	Furniture	Furnishings	30.00	40.00
982	TEC-PH-10002922	8	Technology	Phones	860.00	950.00
983	OFF-PA-10000501	11	Office Supplies	Paper	70.00	90.00
984	OFF-AP-10004980	10	Office Supplies	Appliances	50.00	60.00
985	TEC-PH-10001750	8	Technology	Phones	240.00	260.00
986	OFF-BI-10003708	9	Office Supplies	Binders	30.00	30.00
987	OFF-BI-10001191	9	Office Supplies	Binders	140.00	150.00
988	OFF-PA-10003673	11	Office Supplies	Paper	20.00	30.00
989	OFF-PA-10001639	11	Office Supplies	Paper	30.00	30.00
990	TEC-AC-10004975	12	Technology	Accessories	230.00	260.00
991	OFF-BI-10004364	9	Office Supplies	Binders	30.00	30.00
992	OFF-PA-10001712	11	Office Supplies	Paper	40.00	40.00
993	FUR-CH-10004289	2	Furniture	Chairs	410.00	470.00
994	TEC-PH-10002564	8	Technology	Phones	50.00	50.00
995	OFF-BI-10004876	9	Office Supplies	Binders	0.00	0.00
996	TEC-PH-10004348	8	Technology	Phones	80.00	90.00
997	OFF-BI-10004352	9	Office Supplies	Binders	0.00	0.00
998	OFF-BI-10000666	9	Office Supplies	Binders	80.00	90.00
999	TEC-MA-10000010	16	Technology	Machines	2460.00	3040.00
1000	OFF-BI-10000977	9	Office Supplies	Binders	80.00	90.00
1001	FUR-TA-10002530	4	Furniture	Tables	370.00	450.00
1002	FUR-FU-10001473	6	Furniture	Furnishings	30.00	30.00
1003	OFF-BI-10001765	9	Office Supplies	Binders	50.00	60.00
1004	FUR-CH-10000847	2	Furniture	Chairs	730.00	870.00
1005	OFF-PA-10001293	11	Office Supplies	Paper	10.00	10.00
1006	OFF-AR-10000634	7	Office Supplies	Art	10.00	10.00
1007	FUR-FU-10004270	6	Furniture	Furnishings	10.00	10.00
1008	OFF-AR-10003770	7	Office Supplies	Art	20.00	20.00
1009	OFF-LA-10003121	3	Office Supplies	Labels	20.00	30.00
1010	OFF-PA-10002262	11	Office Supplies	Paper	30.00	30.00
1011	OFF-PA-10002464	11	Office Supplies	Paper	30.00	40.00
1012	OFF-ST-10002214	5	Office Supplies	Storage	20.00	30.00
1013	OFF-PA-10000130	11	Office Supplies	Paper	0.00	0.00
1014	TEC-AC-10000865	12	Technology	Accessories	160.00	180.00
1015	OFF-FA-10003021	14	Office Supplies	Fasteners	0.00	0.00
1016	TEC-PH-10003580	8	Technology	Phones	1150.00	1210.00
1017	TEC-AC-10001109	12	Technology	Accessories	80.00	90.00
1018	OFF-PA-10001838	11	Office Supplies	Paper	10.00	10.00
1019	OFF-ST-10004950	5	Office Supplies	Storage	20.00	20.00
1020	OFF-PA-10003823	11	Office Supplies	Paper	200.00	220.00
1021	TEC-PH-10001300	8	Technology	Phones	30.00	30.00
1022	FUR-TA-10003715	4	Furniture	Tables	920.00	1000.00
1023	TEC-MA-10004458	16	Technology	Machines	380.00	400.00
1024	OFF-BI-10004965	9	Office Supplies	Binders	30.00	30.00
1025	OFF-AR-10001419	7	Office Supplies	Art	20.00	20.00
1026	OFF-PA-10002586	11	Office Supplies	Paper	20.00	20.00
1027	OFF-AR-10002221	7	Office Supplies	Art	0.00	0.00
1028	FUR-FU-10002456	6	Furniture	Furnishings	10.00	10.00
1029	OFF-FA-10004968	14	Office Supplies	Fasteners	30.00	30.00
1030	OFF-PA-10001274	11	Office Supplies	Paper	10.00	10.00
1031	OFF-PA-10001125	11	Office Supplies	Paper	60.00	70.00
1032	OFF-ST-10000344	5	Office Supplies	Storage	10.00	10.00
1033	OFF-ST-10003324	5	Office Supplies	Storage	170.00	210.00
1034	OFF-ST-10000419	5	Office Supplies	Storage	40.00	40.00
1035	OFF-AP-10001626	10	Office Supplies	Appliances	10.00	10.00
1036	FUR-FU-10003981	6	Furniture	Furnishings	10.00	10.00
1037	OFF-ST-10001291	5	Office Supplies	Storage	20.00	30.00
1038	OFF-AP-10004868	10	Office Supplies	Appliances	10.00	10.00
1039	OFF-LA-10002195	3	Office Supplies	Labels	20.00	20.00
1040	OFF-AR-10001315	7	Office Supplies	Art	10.00	10.00
1041	OFF-EN-10003134	13	Office Supplies	Envelopes	10.00	10.00
1042	OFF-AR-10001955	7	Office Supplies	Art	70.00	80.00
1043	OFF-LA-10001641	3	Office Supplies	Labels	20.00	20.00
1044	OFF-ST-10001370	5	Office Supplies	Storage	290.00	350.00
1045	TEC-AC-10003038	12	Technology	Accessories	20.00	20.00
1046	OFF-BI-10000088	9	Office Supplies	Binders	10.00	10.00
1047	OFF-AR-10003504	7	Office Supplies	Art	10.00	10.00
1048	OFF-EN-10003160	13	Office Supplies	Envelopes	20.00	20.00
1049	TEC-AC-10003280	12	Technology	Accessories	30.00	30.00
1050	TEC-PH-10000169	8	Technology	Phones	30.00	40.00
1051	OFF-PA-10001526	11	Office Supplies	Paper	0.00	0.00
1052	OFF-AP-10004336	10	Office Supplies	Appliances	140.00	170.00
1053	OFF-PA-10001357	11	Office Supplies	Paper	130.00	140.00
1054	OFF-FA-10000992	14	Office Supplies	Fasteners	10.00	10.00
1055	OFF-AR-10001221	7	Office Supplies	Art	30.00	30.00
1056	TEC-PH-10004830	8	Technology	Phones	180.00	200.00
1057	OFF-PA-10004519	11	Office Supplies	Paper	10.00	10.00
1058	FUR-BO-10000362	1	Furniture	Bookcases	300.00	360.00
1059	OFF-PA-10000308	11	Office Supplies	Paper	20.00	20.00
1060	OFF-SU-10001165	15	Office Supplies	Supplies	10.00	10.00
1061	FUR-FU-10001488	6	Furniture	Furnishings	200.00	210.00
1062	OFF-AR-10003251	7	Office Supplies	Art	10.00	10.00
1063	OFF-AR-10001044	7	Office Supplies	Art	150.00	160.00
1064	OFF-AR-10000823	7	Office Supplies	Art	10.00	10.00
1065	OFF-AR-10004456	7	Office Supplies	Art	60.00	70.00
1066	OFF-BI-10000591	9	Office Supplies	Binders	10.00	10.00
1067	TEC-PH-10000441	8	Technology	Phones	160.00	200.00
1068	TEC-AC-10004855	12	Technology	Accessories	70.00	80.00
1069	OFF-AR-10001915	7	Office Supplies	Art	30.00	30.00
1070	OFF-ST-10000352	5	Office Supplies	Storage	60.00	60.00
1071	OFF-PA-10000575	11	Office Supplies	Paper	10.00	10.00
1072	FUR-FU-10002937	6	Furniture	Furnishings	190.00	200.00
1073	TEC-AC-10003063	12	Technology	Accessories	40.00	50.00
1074	FUR-FU-10004415	6	Furniture	Furnishings	20.00	20.00
1075	OFF-ST-10002011	5	Office Supplies	Storage	840.00	1010.00
1076	TEC-PH-10000038	8	Technology	Phones	400.00	440.00
1077	OFF-PA-10002689	11	Office Supplies	Paper	20.00	20.00
1078	TEC-CO-10001766	17	Technology	Copiers	2650.00	3150.00
1079	OFF-PA-10004359	11	Office Supplies	Paper	180.00	210.00
1080	OFF-FA-10001135	14	Office Supplies	Fasteners	0.00	0.00
1081	OFF-BI-10004224	9	Office Supplies	Binders	110.00	120.00
1082	TEC-PH-10003357	8	Technology	Phones	50.00	50.00
1083	OFF-PA-10004475	11	Office Supplies	Paper	100.00	110.00
1084	OFF-PA-10003001	11	Office Supplies	Paper	10.00	10.00
1085	OFF-FA-10000611	14	Office Supplies	Fasteners	0.00	0.00
1086	OFF-BI-10001116	9	Office Supplies	Binders	10.00	10.00
1087	TEC-PH-10004922	8	Technology	Phones	140.00	160.00
1088	OFF-BI-10002353	9	Office Supplies	Binders	10.00	10.00
1089	OFF-FA-10002676	14	Office Supplies	Fasteners	0.00	0.00
1090	TEC-AC-10003023	12	Technology	Accessories	90.00	90.00
1091	OFF-PA-10000167	11	Office Supplies	Paper	60.00	70.00
1092	TEC-PH-10002185	8	Technology	Phones	20.00	20.00
1093	FUR-FU-10000758	6	Furniture	Furnishings	40.00	40.00
1094	TEC-MA-10004679	16	Technology	Machines	340.00	400.00
1095	OFF-AP-10002495	10	Office Supplies	Appliances	90.00	100.00
1096	OFF-BI-10002414	9	Office Supplies	Binders	10.00	10.00
1097	TEC-AC-10003133	12	Technology	Accessories	10.00	10.00
1098	TEC-AC-10002006	12	Technology	Accessories	50.00	60.00
1099	OFF-LA-10002381	3	Office Supplies	Labels	20.00	20.00
1100	OFF-FA-10001843	14	Office Supplies	Fasteners	10.00	10.00
1101	OFF-LA-10003077	3	Office Supplies	Labels	40.00	40.00
1102	OFF-PA-10003424	11	Office Supplies	Paper	10.00	10.00
1103	OFF-PA-10004405	11	Office Supplies	Paper	10.00	10.00
1104	FUR-BO-10003965	1	Furniture	Bookcases	250.00	310.00
1105	FUR-FU-10002088	6	Furniture	Furnishings	40.00	40.00
1106	TEC-AC-10000736	12	Technology	Accessories	240.00	260.00
1107	FUR-BO-10003966	1	Furniture	Bookcases	320.00	360.00
1108	OFF-AP-10000828	10	Office Supplies	Appliances	400.00	430.00
1109	OFF-AP-10002906	10	Office Supplies	Appliances	0.00	0.00
1110	OFF-AP-10003860	10	Office Supplies	Appliances	70.00	90.00
1111	FUR-TA-10001307	4	Furniture	Tables	1000.00	1050.00
1112	OFF-PA-10001457	11	Office Supplies	Paper	90.00	100.00
1113	OFF-AP-10002082	10	Office Supplies	Appliances	20.00	30.00
1114	TEC-AC-10003590	12	Technology	Accessories	120.00	130.00
1115	OFF-PA-10004355	11	Office Supplies	Paper	20.00	20.00
1116	OFF-PA-10004947	11	Office Supplies	Paper	10.00	10.00
1117	FUR-TA-10004607	4	Furniture	Tables	180.00	210.00
1118	OFF-PA-10003893	11	Office Supplies	Paper	10.00	10.00
1119	TEC-PH-10001817	8	Technology	Phones	1510.00	1720.00
1120	FUR-BO-10000330	1	Furniture	Bookcases	340.00	410.00
1121	OFF-BI-10001900	9	Office Supplies	Binders	30.00	30.00
1122	FUR-BO-10003159	1	Furniture	Bookcases	260.00	290.00
1123	FUR-FU-10001591	6	Furniture	Furnishings	100.00	110.00
1124	OFF-LA-10002034	3	Office Supplies	Labels	10.00	10.00
1125	OFF-BI-10001628	9	Office Supplies	Binders	20.00	20.00
1126	OFF-ST-10000877	5	Office Supplies	Storage	440.00	500.00
1127	OFF-AR-10004752	7	Office Supplies	Art	10.00	10.00
1128	OFF-PA-10000675	11	Office Supplies	Paper	300.00	370.00
1129	OFF-PA-10001609	11	Office Supplies	Paper	10.00	10.00
1130	TEC-PH-10001615	8	Technology	Phones	80.00	90.00
1131	TEC-AC-10004568	12	Technology	Accessories	130.00	140.00
1132	FUR-CH-10001854	2	Furniture	Chairs	2300.00	2810.00
1133	OFF-AR-10000475	7	Office Supplies	Art	40.00	50.00
1134	TEC-PH-10000455	8	Technology	Phones	280.00	350.00
1135	OFF-PA-10001994	11	Office Supplies	Paper	40.00	50.00
1136	TEC-AC-10002926	12	Technology	Accessories	70.00	80.00
1137	TEC-PH-10004897	8	Technology	Phones	60.00	70.00
1138	FUR-FU-10001196	6	Furniture	Furnishings	20.00	20.00
1139	OFF-PA-10000595	11	Office Supplies	Paper	40.00	50.00
1140	OFF-LA-10000443	3	Office Supplies	Labels	10.00	10.00
1141	OFF-LA-10001771	3	Office Supplies	Labels	10.00	10.00
1142	OFF-AP-10001394	10	Office Supplies	Appliances	80.00	80.00
1143	FUR-FU-10002553	6	Furniture	Furnishings	30.00	30.00
1144	OFF-AP-10004233	10	Office Supplies	Appliances	90.00	90.00
1145	FUR-CH-10004754	2	Furniture	Chairs	60.00	60.00
1146	OFF-PA-10000809	11	Office Supplies	Paper	10.00	10.00
1147	FUR-FU-10002878	6	Furniture	Furnishings	20.00	20.00
1148	TEC-PH-10002624	8	Technology	Phones	1060.00	1130.00
1149	TEC-PH-10002885	8	Technology	Phones	670.00	780.00
1150	TEC-PH-10000895	8	Technology	Phones	1150.00	1440.00
1151	TEC-MA-10000488	16	Technology	Machines	1300.00	1440.00
1152	OFF-PA-10003729	11	Office Supplies	Paper	30.00	40.00
1153	OFF-AP-10001005	10	Office Supplies	Appliances	60.00	60.00
1154	FUR-CH-10000988	2	Furniture	Chairs	120.00	140.00
1155	FUR-FU-10001986	6	Furniture	Furnishings	40.00	40.00
1156	FUR-FU-10004973	6	Furniture	Furnishings	30.00	40.00
1157	OFF-ST-10000464	5	Office Supplies	Storage	30.00	30.00
1158	OFF-PA-10000528	11	Office Supplies	Paper	20.00	30.00
1159	OFF-PA-10003129	11	Office Supplies	Paper	80.00	100.00
1160	OFF-AR-10003631	7	Office Supplies	Art	10.00	10.00
1161	OFF-BI-10002133	9	Office Supplies	Binders	30.00	30.00
1162	TEC-PH-10004959	8	Technology	Phones	90.00	100.00
1163	FUR-BO-10001918	1	Furniture	Bookcases	230.00	260.00
1164	FUR-FU-10001617	6	Furniture	Furnishings	20.00	20.00
1165	TEC-PH-10002824	8	Technology	Phones	340.00	370.00
1166	OFF-PA-10003309	11	Office Supplies	Paper	20.00	30.00
1167	OFF-ST-10002554	5	Office Supplies	Storage	70.00	80.00
1168	OFF-AR-10002067	7	Office Supplies	Art	90.00	100.00
1169	FUR-TA-10004175	4	Furniture	Tables	230.00	270.00
1170	FUR-TA-10004767	4	Furniture	Tables	60.00	70.00
1171	OFF-EN-10002621	13	Office Supplies	Envelopes	30.00	30.00
1172	OFF-LA-10003714	3	Office Supplies	Labels	10.00	10.00
1173	FUR-FU-10001889	6	Furniture	Furnishings	20.00	30.00
1174	OFF-AR-10003723	7	Office Supplies	Art	0.00	0.00
1175	OFF-PA-10000241	11	Office Supplies	Paper	20.00	20.00
1176	OFF-AR-10001446	7	Office Supplies	Art	30.00	30.00
1177	OFF-BI-10001359	9	Office Supplies	Binders	1520.00	1790.00
1178	OFF-EN-10001749	13	Office Supplies	Envelopes	30.00	30.00
1179	OFF-BI-10004390	9	Office Supplies	Binders	430.00	510.00
1180	TEC-PH-10004924	8	Technology	Phones	10.00	10.00
1181	FUR-CH-10000155	2	Furniture	Chairs	430.00	480.00
1182	OFF-BI-10001757	9	Office Supplies	Binders	0.00	0.00
1183	FUR-FU-10004093	6	Furniture	Furnishings	120.00	140.00
1184	FUR-FU-10001037	6	Furniture	Furnishings	20.00	20.00
1185	OFF-PA-10001878	11	Office Supplies	Paper	240.00	270.00
1186	TEC-MA-10003674	16	Technology	Machines	520.00	600.00
1187	OFF-LA-10003190	3	Office Supplies	Labels	0.00	0.00
1188	TEC-PH-10001809	8	Technology	Phones	280.00	300.00
1189	OFF-BI-10003091	9	Office Supplies	Binders	800.00	900.00
1190	FUR-CH-10003981	2	Furniture	Chairs	400.00	460.00
1191	OFF-ST-10002562	5	Office Supplies	Storage	20.00	20.00
1192	TEC-PH-10004345	8	Technology	Phones	720.00	860.00
1193	TEC-PH-10001198	8	Technology	Phones	160.00	180.00
1194	OFF-PA-10001972	11	Office Supplies	Paper	10.00	10.00
1195	TEC-PH-10002483	8	Technology	Phones	240.00	270.00
1196	FUR-BO-10000468	1	Furniture	Bookcases	140.00	150.00
1197	TEC-AC-10001284	12	Technology	Accessories	140.00	170.00
1198	OFF-BI-10002082	9	Office Supplies	Binders	20.00	20.00
1199	OFF-ST-10001505	5	Office Supplies	Storage	20.00	30.00
1200	OFF-AR-10004582	7	Office Supplies	Art	0.00	0.00
1201	TEC-AC-10002842	12	Technology	Accessories	210.00	240.00
1202	OFF-AP-10004785	10	Office Supplies	Appliances	30.00	30.00
1203	TEC-AC-10002217	12	Technology	Accessories	90.00	110.00
1204	OFF-BI-10002954	9	Office Supplies	Binders	10.00	10.00
1205	OFF-AP-10003281	10	Office Supplies	Appliances	20.00	20.00
1206	OFF-SU-10000898	15	Office Supplies	Supplies	60.00	70.00
1207	OFF-BI-10001249	9	Office Supplies	Binders	10.00	10.00
1208	TEC-AC-10002718	12	Technology	Accessories	40.00	40.00
1209	TEC-PH-10002352	8	Technology	Phones	1310.00	1390.00
1210	FUR-CH-10003774	2	Furniture	Chairs	470.00	550.00
1211	OFF-AR-10000127	7	Office Supplies	Art	10.00	10.00
1212	TEC-PH-10003811	8	Technology	Phones	430.00	480.00
1213	OFF-BI-10002393	9	Office Supplies	Binders	20.00	20.00
1214	FUR-TA-10002855	4	Furniture	Tables	870.00	1020.00
1215	OFF-EN-10000781	13	Office Supplies	Envelopes	30.00	30.00
1216	OFF-PA-10002160	11	Office Supplies	Paper	20.00	20.00
1217	OFF-AR-10002257	7	Office Supplies	Art	10.00	10.00
1218	OFF-FA-10004395	14	Office Supplies	Fasteners	10.00	10.00
1219	OFF-AP-10002534	10	Office Supplies	Appliances	260.00	290.00
1220	FUR-BO-10003034	1	Furniture	Bookcases	150.00	180.00
1221	OFF-ST-10000943	5	Office Supplies	Storage	50.00	50.00
1222	OFF-PA-10000533	11	Office Supplies	Paper	10.00	10.00
1223	OFF-ST-10001172	5	Office Supplies	Storage	90.00	100.00
1224	OFF-PA-10001661	11	Office Supplies	Paper	10.00	10.00
1225	OFF-BI-10004817	9	Office Supplies	Binders	50.00	60.00
1226	FUR-CH-10003833	2	Furniture	Chairs	280.00	340.00
1227	FUR-FU-10003142	6	Furniture	Furnishings	30.00	30.00
1228	TEC-AC-10001114	12	Technology	Accessories	170.00	200.00
1229	OFF-FA-10002975	14	Office Supplies	Fasteners	10.00	10.00
1230	OFF-ST-10003996	5	Office Supplies	Storage	70.00	80.00
1231	OFF-BI-10002571	9	Office Supplies	Binders	20.00	20.00
1232	OFF-PA-10000477	11	Office Supplies	Paper	50.00	60.00
1233	OFF-BI-10004209	9	Office Supplies	Binders	20.00	20.00
1234	TEC-AC-10002800	12	Technology	Accessories	190.00	200.00
1235	FUR-TA-10003954	4	Furniture	Tables	580.00	710.00
1236	TEC-AC-10003289	12	Technology	Accessories	50.00	60.00
1237	TEC-PH-10002468	8	Technology	Phones	640.00	760.00
1238	OFF-PA-10001295	11	Office Supplies	Paper	100.00	110.00
1239	OFF-LA-10000248	3	Office Supplies	Labels	20.00	20.00
1240	OFF-FA-10004076	14	Office Supplies	Fasteners	0.00	0.00
1241	OFF-LA-10004008	3	Office Supplies	Labels	10.00	10.00
1242	OFF-AR-10001177	7	Office Supplies	Art	10.00	10.00
1243	OFF-BI-10001718	9	Office Supplies	Binders	470.00	510.00
1244	OFF-AR-10004602	7	Office Supplies	Art	80.00	90.00
1245	OFF-ST-10000078	5	Office Supplies	Storage	520.00	640.00
1246	OFF-AR-10004272	7	Office Supplies	Art	10.00	10.00
1247	TEC-PH-10001578	8	Technology	Phones	1090.00	1300.00
1248	OFF-ST-10003638	5	Office Supplies	Storage	50.00	50.00
1249	FUR-BO-10002213	1	Furniture	Bookcases	370.00	430.00
1250	OFF-EN-10003040	13	Office Supplies	Envelopes	80.00	100.00
1251	TEC-PH-10000923	8	Technology	Phones	50.00	60.00
1252	FUR-FU-10003623	6	Furniture	Furnishings	50.00	60.00
1253	OFF-AP-10000124	10	Office Supplies	Appliances	20.00	30.00
1254	OFF-AR-10004511	7	Office Supplies	Art	30.00	40.00
1255	OFF-PA-10003883	11	Office Supplies	Paper	20.00	20.00
1256	TEC-PH-10002807	8	Technology	Phones	80.00	90.00
1257	FUR-FU-10002364	6	Furniture	Furnishings	10.00	10.00
1258	OFF-SU-10001664	15	Office Supplies	Supplies	20.00	20.00
1259	FUR-TA-10003238	4	Furniture	Tables	920.00	990.00
1260	TEC-PH-10001536	8	Technology	Phones	70.00	80.00
1261	OFF-AR-10004956	7	Office Supplies	Art	20.00	20.00
1262	OFF-AR-10003696	7	Office Supplies	Art	30.00	30.00
1263	OFF-PA-10000551	11	Office Supplies	Paper	10.00	10.00
1264	OFF-BI-10004506	9	Office Supplies	Binders	20.00	20.00
1265	OFF-PA-10000740	11	Office Supplies	Paper	50.00	50.00
1266	FUR-CH-10002084	2	Furniture	Chairs	400.00	440.00
1267	OFF-AP-10000692	10	Office Supplies	Appliances	50.00	60.00
1268	OFF-AP-10000252	10	Office Supplies	Appliances	30.00	40.00
1269	FUR-FU-10004748	6	Furniture	Furnishings	150.00	190.00
1270	OFF-AR-10000538	7	Office Supplies	Art	60.00	70.00
1271	TEC-PH-10001079	8	Technology	Phones	680.00	830.00
1272	OFF-AP-10003842	10	Office Supplies	Appliances	160.00	170.00
1273	FUR-CH-10000553	2	Furniture	Chairs	90.00	110.00
1274	OFF-AR-10003469	7	Office Supplies	Art	0.00	0.00
1275	OFF-PA-10003790	11	Office Supplies	Paper	50.00	50.00
1276	FUR-BO-10002202	1	Furniture	Bookcases	60.00	70.00
1277	OFF-AP-10002765	10	Office Supplies	Appliances	40.00	50.00
1278	OFF-ST-10003692	5	Office Supplies	Storage	190.00	230.00
1279	TEC-PH-10001051	8	Technology	Phones	280.00	320.00
1280	OFF-AR-10000817	7	Office Supplies	Art	20.00	20.00
1281	OFF-SU-10000952	15	Office Supplies	Supplies	40.00	40.00
1282	FUR-FU-10004597	6	Furniture	Furnishings	30.00	40.00
1283	OFF-BI-10002982	9	Office Supplies	Binders	30.00	40.00
1284	OFF-PA-10004285	11	Office Supplies	Paper	10.00	10.00
1285	OFF-AP-10001391	10	Office Supplies	Appliances	460.00	540.00
1286	TEC-PH-10001944	8	Technology	Phones	410.00	440.00
1287	OFF-PA-10001776	11	Office Supplies	Paper	20.00	20.00
1288	TEC-AC-10004145	12	Technology	Accessories	450.00	500.00
1289	OFF-PA-10003919	11	Office Supplies	Paper	10.00	10.00
1290	OFF-PA-10002001	11	Office Supplies	Paper	10.00	10.00
1291	OFF-PA-10002787	11	Office Supplies	Paper	10.00	10.00
1292	OFF-ST-10003123	5	Office Supplies	Storage	170.00	200.00
1293	FUR-FU-10000308	6	Furniture	Furnishings	410.00	440.00
1294	TEC-CO-10003763	17	Technology	Copiers	1060.00	1120.00
1295	FUR-TA-10001866	4	Furniture	Tables	110.00	140.00
1296	OFF-AP-10002222	10	Office Supplies	Appliances	50.00	60.00
1297	OFF-PA-10003971	11	Office Supplies	Paper	10.00	10.00
1298	OFF-AP-10004036	10	Office Supplies	Appliances	40.00	40.00
1299	OFF-AP-10002287	10	Office Supplies	Appliances	20.00	20.00
1300	FUR-TA-10001950	4	Furniture	Tables	770.00	890.00
1301	TEC-PH-10001527	8	Technology	Phones	40.00	40.00
1302	TEC-AC-10003095	12	Technology	Accessories	350.00	390.00
1303	TEC-AC-10000358	12	Technology	Accessories	240.00	270.00
1304	OFF-EN-10004147	13	Office Supplies	Envelopes	10.00	10.00
1305	FUR-FU-10001468	6	Furniture	Furnishings	510.00	550.00
1306	OFF-PA-10000380	11	Office Supplies	Paper	30.00	40.00
1307	OFF-AP-10000026	10	Office Supplies	Appliances	390.00	430.00
1308	OFF-PA-10003936	11	Office Supplies	Paper	20.00	30.00
1309	FUR-FU-10002501	6	Furniture	Furnishings	60.00	60.00
1310	OFF-AP-10001205	10	Office Supplies	Appliances	390.00	490.00
1311	OFF-BI-10004141	9	Office Supplies	Binders	0.00	0.00
1312	OFF-BI-10000632	9	Office Supplies	Binders	60.00	70.00
1313	TEC-AC-10004864	12	Technology	Accessories	40.00	40.00
1314	TEC-MA-10000597	16	Technology	Machines	190.00	240.00
1315	OFF-PA-10002960	11	Office Supplies	Paper	30.00	30.00
1316	OFF-PA-10000919	11	Office Supplies	Paper	140.00	160.00
1317	OFF-BI-10001553	9	Office Supplies	Binders	10.00	10.00
1318	OFF-AP-10004540	10	Office Supplies	Appliances	150.00	160.00
1319	FUR-CH-10001714	2	Furniture	Chairs	100.00	120.00
1320	FUR-FU-10002298	6	Furniture	Furnishings	470.00	530.00
1321	OFF-AR-10000315	7	Office Supplies	Art	0.00	0.00
1322	OFF-FA-10000936	14	Office Supplies	Fasteners	0.00	0.00
1323	OFF-SU-10004768	15	Office Supplies	Supplies	10.00	10.00
1324	OFF-PA-10002581	11	Office Supplies	Paper	40.00	50.00
1325	OFF-AP-10002403	10	Office Supplies	Appliances	150.00	180.00
1326	OFF-AR-10003087	7	Office Supplies	Art	20.00	20.00
1327	TEC-PH-10000141	8	Technology	Phones	170.00	210.00
1328	TEC-CO-10000971	17	Technology	Copiers	410.00	480.00
1329	OFF-FA-10001229	14	Office Supplies	Fasteners	10.00	10.00
1330	OFF-BI-10002437	9	Office Supplies	Binders	20.00	20.00
1331	OFF-PA-10004255	11	Office Supplies	Paper	10.00	10.00
1332	OFF-PA-10001184	11	Office Supplies	Paper	40.00	40.00
1333	TEC-AC-10002637	12	Technology	Accessories	1390.00	1620.00
1334	FUR-BO-10000780	1	Furniture	Bookcases	810.00	960.00
1335	TEC-PH-10003072	8	Technology	Phones	300.00	360.00
1336	TEC-MA-10000112	16	Technology	Machines	1970.00	2400.00
1337	TEC-AC-10004171	12	Technology	Accessories	100.00	100.00
1338	FUR-TA-10002645	4	Furniture	Tables	220.00	270.00
1339	OFF-BI-10003784	9	Office Supplies	Binders	0.00	0.00
1340	OFF-BI-10001617	9	Office Supplies	Binders	10.00	10.00
1341	FUR-CH-10002439	2	Furniture	Chairs	340.00	370.00
1342	OFF-AP-10003057	10	Office Supplies	Appliances	770.00	830.00
1343	FUR-TA-10000849	4	Furniture	Tables	130.00	150.00
1344	OFF-EN-10002973	13	Office Supplies	Envelopes	30.00	30.00
1345	OFF-BI-10003963	9	Office Supplies	Binders	30.00	30.00
1346	OFF-LA-10000081	3	Office Supplies	Labels	20.00	20.00
1347	OFF-PA-10000726	11	Office Supplies	Paper	10.00	10.00
1348	OFF-PA-10004983	11	Office Supplies	Paper	30.00	30.00
1349	FUR-FU-10002107	6	Furniture	Furnishings	10.00	10.00
1350	FUR-CH-10001190	2	Furniture	Chairs	200.00	220.00
1351	TEC-AC-10000682	12	Technology	Accessories	70.00	80.00
1352	OFF-LA-10004545	3	Office Supplies	Labels	70.00	90.00
1353	OFF-SU-10002557	15	Office Supplies	Supplies	10.00	10.00
1354	TEC-PH-10000912	8	Technology	Phones	40.00	40.00
1355	OFF-ST-10001837	5	Office Supplies	Storage	80.00	90.00
1356	OFF-AR-10001473	7	Office Supplies	Art	10.00	10.00
1357	TEC-PH-10001835	8	Technology	Phones	550.00	630.00
1358	OFF-PA-10002245	11	Office Supplies	Paper	20.00	20.00
1359	OFF-EN-10004483	13	Office Supplies	Envelopes	30.00	40.00
1360	OFF-SU-10000151	15	Office Supplies	Supplies	7370.00	8190.00
1361	OFF-AP-10001293	10	Office Supplies	Appliances	30.00	30.00
1362	TEC-PH-10000675	8	Technology	Phones	190.00	200.00
1363	OFF-ST-10003470	5	Office Supplies	Storage	1000.00	1120.00
1364	OFF-LA-10004559	3	Office Supplies	Labels	20.00	20.00
1365	OFF-AP-10002651	10	Office Supplies	Appliances	730.00	870.00
1366	TEC-AC-10002550	12	Technology	Accessories	20.00	30.00
1367	OFF-BI-10000829	9	Office Supplies	Binders	20.00	20.00
1368	TEC-PH-10002555	8	Technology	Phones	150.00	160.00
1369	FUR-BO-10003450	1	Furniture	Bookcases	160.00	170.00
1370	FUR-FU-10004665	6	Furniture	Furnishings	750.00	820.00
1371	TEC-PH-10000369	8	Technology	Phones	670.00	710.00
1372	TEC-AC-10001590	12	Technology	Accessories	40.00	50.00
1373	FUR-FU-10004909	6	Furniture	Furnishings	40.00	50.00
1374	FUR-BO-10004357	1	Furniture	Bookcases	1340.00	1410.00
1375	TEC-AC-10000387	12	Technology	Accessories	20.00	20.00
1376	OFF-BI-10001308	9	Office Supplies	Binders	30.00	30.00
1377	OFF-AP-10002734	10	Office Supplies	Appliances	570.00	680.00
1378	FUR-FU-10004587	6	Furniture	Furnishings	50.00	60.00
1379	TEC-PH-10004833	8	Technology	Phones	140.00	160.00
1380	FUR-FU-10001847	6	Furniture	Furnishings	10.00	10.00
1381	FUR-FU-10002045	6	Furniture	Furnishings	20.00	20.00
1382	FUR-FU-10004671	6	Furniture	Furnishings	10.00	10.00
1383	FUR-TA-10003569	4	Furniture	Tables	500.00	600.00
1384	OFF-PA-10001752	11	Office Supplies	Paper	10.00	10.00
1385	TEC-MA-10003356	16	Technology	Machines	1240.00	1350.00
1386	OFF-AR-10003727	7	Office Supplies	Art	20.00	20.00
1387	TEC-AC-10001635	12	Technology	Accessories	20.00	20.00
1388	OFF-LA-10003663	3	Office Supplies	Labels	10.00	10.00
1389	TEC-CO-10004722	17	Technology	Copiers	10300.00	11200.00
1390	TEC-MA-10002210	16	Technology	Machines	550.00	650.00
1391	OFF-BI-10003196	9	Office Supplies	Binders	10.00	10.00
1392	FUR-CH-10002017	2	Furniture	Chairs	30.00	40.00
1393	FUR-FU-10003829	6	Furniture	Furnishings	0.00	0.00
1394	OFF-PA-10000697	11	Office Supplies	Paper	20.00	20.00
1395	OFF-AR-10004691	7	Office Supplies	Art	60.00	60.00
1396	OFF-BI-10000948	9	Office Supplies	Binders	40.00	40.00
1397	OFF-PA-10000223	11	Office Supplies	Paper	10.00	10.00
1398	OFF-PA-10000062	11	Office Supplies	Paper	140.00	160.00
1399	FUR-BO-10003404	1	Furniture	Bookcases	1080.00	1290.00
1400	OFF-BI-10004233	9	Office Supplies	Binders	30.00	30.00
1401	TEC-PH-10002834	8	Technology	Phones	1580.00	1980.00
1402	FUR-CH-10003761	2	Furniture	Chairs	730.00	790.00
1403	OFF-PA-10004665	11	Office Supplies	Paper	20.00	30.00
1404	OFF-BI-10001196	9	Office Supplies	Binders	70.00	90.00
1405	TEC-MA-10002981	16	Technology	Machines	310.00	350.00
1406	TEC-PH-10003601	8	Technology	Phones	130.00	160.00
1407	OFF-BI-10002003	9	Office Supplies	Binders	0.00	0.00
1408	OFF-PA-10003016	11	Office Supplies	Paper	20.00	20.00
1409	OFF-PA-10002246	11	Office Supplies	Paper	20.00	20.00
1410	TEC-PH-10002890	8	Technology	Phones	100.00	110.00
1411	TEC-MA-10003626	16	Technology	Machines	760.00	820.00
1412	TEC-MA-10002412	16	Technology	Machines	18110.00	22640.00
1413	OFF-AR-10003183	7	Office Supplies	Art	10.00	10.00
1414	OFF-PA-10002319	11	Office Supplies	Paper	110.00	120.00
1415	OFF-PA-10001246	11	Office Supplies	Paper	20.00	20.00
1416	OFF-PA-10001815	11	Office Supplies	Paper	160.00	190.00
1417	FUR-FU-10001876	6	Furniture	Furnishings	200.00	230.00
1418	TEC-PH-10000673	8	Technology	Phones	120.00	130.00
1419	TEC-PH-10002075	8	Technology	Phones	320.00	380.00
1420	TEC-PH-10003691	8	Technology	Phones	360.00	380.00
1421	OFF-SU-10000157	15	Office Supplies	Supplies	400.00	480.00
1422	TEC-AC-10004227	12	Technology	Accessories	20.00	30.00
1423	TEC-AC-10004127	12	Technology	Accessories	30.00	30.00
1424	FUR-CH-10002758	2	Furniture	Chairs	510.00	590.00
1425	OFF-ST-10000532	5	Office Supplies	Storage	390.00	420.00
1426	TEC-AC-10003709	12	Technology	Accessories	0.00	0.00
1427	OFF-BI-10003166	9	Office Supplies	Binders	10.00	10.00
1428	OFF-ST-10004835	5	Office Supplies	Storage	10.00	10.00
1429	OFF-AP-10000159	10	Office Supplies	Appliances	30.00	30.00
1430	OFF-AP-10001242	10	Office Supplies	Appliances	20.00	30.00
1431	TEC-AC-10003433	12	Technology	Accessories	0.00	0.00
1432	TEC-PH-10003187	8	Technology	Phones	20.00	20.00
1433	OFF-FA-10002763	14	Office Supplies	Fasteners	10.00	10.00
1434	OFF-PA-10004239	11	Office Supplies	Paper	30.00	30.00
1435	OFF-PA-10004782	11	Office Supplies	Paper	10.00	10.00
1436	FUR-FU-10001185	6	Furniture	Furnishings	150.00	190.00
1437	OFF-PA-10003270	11	Office Supplies	Paper	30.00	30.00
1438	OFF-PA-10002421	11	Office Supplies	Paper	100.00	110.00
1439	OFF-PA-10002923	11	Office Supplies	Paper	70.00	80.00
1440	OFF-ST-10001128	5	Office Supplies	Storage	410.00	440.00
1441	OFF-PA-10000520	11	Office Supplies	Paper	20.00	20.00
1442	FUR-FU-10003832	6	Furniture	Furnishings	60.00	60.00
1443	FUR-FU-10000409	6	Furniture	Furnishings	10.00	10.00
1444	TEC-PH-10004389	8	Technology	Phones	310.00	380.00
1445	OFF-SU-10000946	15	Office Supplies	Supplies	20.00	30.00
1446	FUR-FU-10001546	6	Furniture	Furnishings	20.00	20.00
1447	OFF-PA-10000791	11	Office Supplies	Paper	20.00	20.00
1448	OFF-PA-10003739	11	Office Supplies	Paper	10.00	10.00
1449	FUR-FU-10000771	6	Furniture	Furnishings	60.00	70.00
1450	OFF-ST-10002615	5	Office Supplies	Storage	290.00	310.00
1451	OFF-PA-10000327	11	Office Supplies	Paper	10.00	10.00
1452	OFF-EN-10003286	13	Office Supplies	Envelopes	30.00	40.00
1453	OFF-AR-10003772	7	Office Supplies	Art	30.00	40.00
1454	OFF-AR-10003338	7	Office Supplies	Art	10.00	10.00
1455	FUR-FU-10002116	6	Furniture	Furnishings	60.00	70.00
1456	FUR-CH-10000422	2	Furniture	Chairs	80.00	90.00
1457	FUR-FU-10002685	6	Furniture	Furnishings	20.00	20.00
1458	FUR-FU-10004963	6	Furniture	Furnishings	20.00	30.00
1459	OFF-BI-10000174	9	Office Supplies	Binders	50.00	60.00
1460	FUR-CH-10004875	2	Furniture	Chairs	100.00	110.00
1461	FUR-FU-10000305	6	Furniture	Furnishings	90.00	110.00
1462	TEC-PH-10001459	8	Technology	Phones	590.00	670.00
1463	FUR-FU-10002445	6	Furniture	Furnishings	20.00	20.00
1464	OFF-PA-10000213	11	Office Supplies	Paper	20.00	20.00
1465	FUR-CH-10001797	2	Furniture	Chairs	160.00	190.00
1466	OFF-PA-10003848	11	Office Supplies	Paper	20.00	20.00
1467	FUR-FU-10000755	6	Furniture	Furnishings	20.00	20.00
1468	FUR-FU-10000550	6	Furniture	Furnishings	0.00	0.00
1469	TEC-MA-10004521	16	Technology	Machines	200.00	210.00
1470	OFF-BI-10003655	9	Office Supplies	Binders	20.00	20.00
1471	OFF-AP-10003779	10	Office Supplies	Appliances	190.00	210.00
1472	OFF-FA-10002701	14	Office Supplies	Fasteners	10.00	10.00
1473	OFF-BI-10002799	9	Office Supplies	Binders	10.00	10.00
1474	OFF-AR-10003582	7	Office Supplies	Art	50.00	60.00
1475	FUR-FU-10004666	6	Furniture	Furnishings	30.00	30.00
1476	OFF-EN-10002312	13	Office Supplies	Envelopes	20.00	20.00
1477	FUR-CH-10002320	2	Furniture	Chairs	1850.00	2050.00
1478	OFF-AR-10001216	7	Office Supplies	Art	10.00	10.00
1479	FUR-FU-10003247	6	Furniture	Furnishings	30.00	40.00
1480	FUR-TA-10003837	4	Furniture	Tables	20.00	20.00
1481	TEC-PH-10002350	8	Technology	Phones	70.00	80.00
1482	TEC-AC-10000397	12	Technology	Accessories	100.00	100.00
1483	TEC-AC-10004001	12	Technology	Accessories	180.00	210.00
1484	OFF-PA-10001534	11	Office Supplies	Paper	40.00	50.00
1485	FUR-FU-10002379	6	Furniture	Furnishings	100.00	120.00
1486	TEC-PH-10000526	8	Technology	Phones	590.00	670.00
1487	OFF-PA-10001977	11	Office Supplies	Paper	140.00	170.00
1488	FUR-BO-10003660	1	Furniture	Bookcases	210.00	220.00
1489	OFF-BI-10001267	9	Office Supplies	Binders	10.00	10.00
1490	OFF-PA-10002741	11	Office Supplies	Paper	30.00	30.00
1491	OFF-PA-10001471	11	Office Supplies	Paper	20.00	20.00
1492	TEC-MA-10001972	16	Technology	Machines	690.00	840.00
1493	FUR-FU-10003464	6	Furniture	Furnishings	40.00	50.00
1494	OFF-PA-10004438	11	Office Supplies	Paper	50.00	50.00
1495	FUR-FU-10004586	6	Furniture	Furnishings	10.00	10.00
1496	TEC-PH-10004908	8	Technology	Phones	60.00	70.00
1497	FUR-CH-10004495	2	Furniture	Chairs	770.00	960.00
1498	TEC-MA-10000418	16	Technology	Machines	1690.00	1800.00
1499	OFF-BI-10004600	9	Office Supplies	Binders	640.00	740.00
1500	OFF-BI-10004040	9	Office Supplies	Binders	10.00	10.00
1501	OFF-AR-10001615	7	Office Supplies	Art	50.00	60.00
1502	TEC-PH-10001299	8	Technology	Phones	210.00	240.00
1503	OFF-AR-10004260	7	Office Supplies	Art	160.00	180.00
1504	OFF-EN-10004773	13	Office Supplies	Envelopes	70.00	70.00
1505	OFF-BI-10001787	9	Office Supplies	Binders	20.00	20.00
1506	OFF-ST-10002957	5	Office Supplies	Storage	10.00	10.00
1507	OFF-FA-10001883	14	Office Supplies	Fasteners	20.00	20.00
1508	TEC-PH-10001644	8	Technology	Phones	100.00	100.00
1509	OFF-LA-10000407	3	Office Supplies	Labels	40.00	40.00
1510	TEC-AC-10000420	12	Technology	Accessories	330.00	350.00
1511	OFF-EN-10004846	13	Office Supplies	Envelopes	10.00	10.00
1512	OFF-SU-10003567	15	Office Supplies	Supplies	20.00	20.00
1513	OFF-ST-10002301	5	Office Supplies	Storage	30.00	30.00
1514	TEC-PH-10003095	8	Technology	Phones	100.00	120.00
1515	TEC-PH-10004912	8	Technology	Phones	190.00	220.00
1516	OFF-AR-10000799	7	Office Supplies	Art	20.00	20.00
1517	OFF-PA-10004609	11	Office Supplies	Paper	20.00	20.00
1518	TEC-PH-10003171	8	Technology	Phones	40.00	40.00
1519	OFF-AP-10000595	10	Office Supplies	Appliances	10.00	10.00
1520	TEC-AC-10003399	12	Technology	Accessories	40.00	40.00
1521	TEC-MA-10002428	16	Technology	Machines	1620.00	1700.00
1522	TEC-PH-10001128	8	Technology	Phones	500.00	540.00
1523	OFF-PA-10001033	11	Office Supplies	Paper	240.00	260.00
1524	TEC-AC-10000474	12	Technology	Accessories	210.00	230.00
1525	FUR-FU-10002963	6	Furniture	Furnishings	0.00	0.00
1526	FUR-FU-10000193	6	Furniture	Furnishings	110.00	130.00
1527	OFF-BI-10000962	9	Office Supplies	Binders	100.00	120.00
1528	OFF-AP-10002867	10	Office Supplies	Appliances	180.00	200.00
1529	FUR-BO-10002916	1	Furniture	Bookcases	380.00	440.00
1530	FUR-TA-10004152	4	Furniture	Tables	60.00	70.00
1531	FUR-FU-10000672	6	Furniture	Furnishings	40.00	40.00
1532	FUR-BO-10002598	1	Furniture	Bookcases	110.00	140.00
1533	OFF-PA-10004610	11	Office Supplies	Paper	10.00	10.00
1534	FUR-FU-10000320	6	Furniture	Furnishings	20.00	20.00
1535	FUR-CH-10003535	2	Furniture	Chairs	350.00	380.00
1536	FUR-FU-10003919	6	Furniture	Furnishings	70.00	70.00
1537	OFF-PA-10000174	11	Office Supplies	Paper	30.00	30.00
1538	FUR-FU-10002703	6	Furniture	Furnishings	110.00	130.00
1539	TEC-PH-10002415	8	Technology	Phones	410.00	470.00
1540	OFF-AR-10000657	7	Office Supplies	Art	10.00	10.00
1541	OFF-PA-10004996	11	Office Supplies	Paper	20.00	20.00
1542	OFF-PA-10003363	11	Office Supplies	Paper	40.00	50.00
1543	TEC-AC-10002305	12	Technology	Accessories	60.00	70.00
1544	TEC-AC-10000990	12	Technology	Accessories	590.00	660.00
1545	FUR-BO-10001608	1	Furniture	Bookcases	180.00	190.00
1546	FUR-BO-10000112	1	Furniture	Bookcases	760.00	830.00
1547	TEC-PH-10004120	8	Technology	Phones	590.00	660.00
1548	OFF-BI-10003476	9	Office Supplies	Binders	50.00	50.00
1549	TEC-MA-10002859	16	Technology	Machines	260.00	290.00
1550	OFF-AP-10001947	10	Office Supplies	Appliances	20.00	30.00
1551	OFF-LA-10001982	3	Office Supplies	Labels	30.00	30.00
1552	TEC-PH-10003484	8	Technology	Phones	500.00	600.00
1553	OFF-PA-10000007	11	Office Supplies	Paper	10.00	10.00
1554	OFF-PA-10000552	11	Office Supplies	Paper	10.00	10.00
1555	OFF-AR-10004062	7	Office Supplies	Art	90.00	100.00
1556	OFF-ST-10000321	5	Office Supplies	Storage	10.00	10.00
1557	TEC-AC-10002134	12	Technology	Accessories	50.00	60.00
1558	TEC-PH-10004071	8	Technology	Phones	50.00	60.00
1559	OFF-PA-10004039	11	Office Supplies	Paper	80.00	90.00
1560	OFF-AR-10001725	7	Office Supplies	Art	50.00	50.00
1561	OFF-AR-10004269	7	Office Supplies	Art	0.00	0.00
1562	OFF-BI-10003007	9	Office Supplies	Binders	150.00	160.00
1563	OFF-SU-10002522	15	Office Supplies	Supplies	20.00	20.00
1564	TEC-AC-10004859	12	Technology	Accessories	80.00	100.00
1565	TEC-AC-10002558	12	Technology	Accessories	10.00	10.00
1566	FUR-FU-10001731	6	Furniture	Furnishings	10.00	10.00
1567	OFF-SU-10004782	15	Office Supplies	Supplies	30.00	30.00
1568	OFF-SU-10000432	15	Office Supplies	Supplies	10.00	10.00
1569	OFF-LA-10004409	3	Office Supplies	Labels	10.00	10.00
1570	OFF-ST-10001031	5	Office Supplies	Storage	30.00	40.00
1571	OFF-LA-10000476	3	Office Supplies	Labels	10.00	10.00
1572	OFF-AR-10002987	7	Office Supplies	Art	60.00	80.00
1573	TEC-CO-10001571	17	Technology	Copiers	420.00	440.00
1574	FUR-FU-10003026	6	Furniture	Furnishings	20.00	20.00
1575	OFF-ST-10001034	5	Office Supplies	Storage	70.00	80.00
1576	TEC-AC-10000521	12	Technology	Accessories	10.00	10.00
1577	OFF-SU-10003002	15	Office Supplies	Supplies	10.00	10.00
1578	TEC-PH-10000730	8	Technology	Phones	450.00	500.00
1579	FUR-CH-10004983	2	Furniture	Chairs	500.00	560.00
1580	OFF-FA-10001332	14	Office Supplies	Fasteners	10.00	10.00
1581	TEC-AC-10001874	12	Technology	Accessories	300.00	340.00
1582	OFF-BI-10000494	9	Office Supplies	Binders	0.00	0.00
1583	FUR-TA-10003469	4	Furniture	Tables	270.00	330.00
1584	OFF-AR-10003179	7	Office Supplies	Art	40.00	40.00
1585	FUR-CH-10003606	2	Furniture	Chairs	90.00	100.00
1586	FUR-CH-10003298	2	Furniture	Chairs	450.00	520.00
1587	OFF-LA-10003537	3	Office Supplies	Labels	20.00	30.00
1588	OFF-PA-10000069	11	Office Supplies	Paper	20.00	20.00
1589	OFF-PA-10004733	11	Office Supplies	Paper	20.00	20.00
1590	TEC-AC-10004814	12	Technology	Accessories	140.00	170.00
1591	OFF-SU-10002301	15	Office Supplies	Supplies	10.00	10.00
1592	OFF-BI-10004318	9	Office Supplies	Binders	560.00	690.00
1593	FUR-FU-10004164	6	Furniture	Furnishings	0.00	0.00
1594	TEC-AC-10001539	12	Technology	Accessories	400.00	450.00
1595	TEC-PH-10002789	8	Technology	Phones	110.00	120.00
1596	OFF-BI-10004828	9	Office Supplies	Binders	30.00	40.00
1597	OFF-AR-10001770	7	Office Supplies	Art	10.00	10.00
1598	FUR-FU-10004904	6	Furniture	Furnishings	120.00	150.00
1599	FUR-FU-10002396	6	Furniture	Furnishings	40.00	40.00
1600	TEC-AC-10002331	12	Technology	Accessories	40.00	50.00
1601	TEC-AC-10001090	12	Technology	Accessories	40.00	50.00
1602	FUR-BO-10004218	1	Furniture	Bookcases	280.00	350.00
1603	TEC-PH-10001619	8	Technology	Phones	420.00	470.00
1604	OFF-PA-10000246	11	Office Supplies	Paper	20.00	20.00
1605	OFF-PA-10001461	11	Office Supplies	Paper	30.00	30.00
1606	OFF-AR-10004165	7	Office Supplies	Art	10.00	10.00
1607	OFF-EN-10001028	13	Office Supplies	Envelopes	20.00	30.00
1608	TEC-PH-10003535	8	Technology	Phones	130.00	160.00
1609	FUR-FU-10001085	6	Furniture	Furnishings	40.00	40.00
1610	OFF-AR-10003481	7	Office Supplies	Art	10.00	10.00
1611	OFF-PA-10002606	11	Office Supplies	Paper	30.00	40.00
1612	FUR-FU-10003731	6	Furniture	Furnishings	30.00	40.00
1613	OFF-AP-10001962	10	Office Supplies	Appliances	30.00	40.00
1614	FUR-FU-10003798	6	Furniture	Furnishings	70.00	80.00
1615	OFF-AR-10002704	7	Office Supplies	Art	10.00	10.00
1616	TEC-AC-10002942	12	Technology	Accessories	290.00	350.00
1617	TEC-MA-10001016	16	Technology	Machines	240.00	290.00
1618	TEC-AC-10001553	12	Technology	Accessories	90.00	100.00
1619	FUR-FU-10001215	6	Furniture	Furnishings	380.00	470.00
1620	OFF-PA-10002499	11	Office Supplies	Paper	90.00	100.00
1621	TEC-PH-10003215	8	Technology	Phones	100.00	100.00
1622	OFF-LA-10002945	3	Office Supplies	Labels	60.00	60.00
1623	OFF-AR-10002766	7	Office Supplies	Art	20.00	20.00
1624	TEC-PH-10004434	8	Technology	Phones	900.00	980.00
1625	FUR-BO-10000711	1	Furniture	Bookcases	590.00	640.00
1626	OFF-BI-10001120	9	Office Supplies	Binders	8410.00	9450.00
1627	OFF-AP-10004655	10	Office Supplies	Appliances	0.00	0.00
1628	FUR-BO-10004360	1	Furniture	Bookcases	130.00	160.00
1629	TEC-AC-10000199	12	Technology	Accessories	20.00	20.00
1630	TEC-MA-10001127	16	Technology	Machines	2310.00	2620.00
1631	OFF-AR-10001227	7	Office Supplies	Art	10.00	10.00
1632	FUR-CH-10000229	2	Furniture	Chairs	400.00	430.00
1633	FUR-BO-10002853	1	Furniture	Bookcases	70.00	80.00
1634	OFF-PA-10004022	11	Office Supplies	Paper	10.00	10.00
1635	OFF-PA-10004248	11	Office Supplies	Paper	20.00	20.00
1636	OFF-PA-10001363	11	Office Supplies	Paper	20.00	20.00
1637	OFF-BI-10003876	9	Office Supplies	Binders	120.00	130.00
1638	OFF-EN-10004007	13	Office Supplies	Envelopes	50.00	60.00
1639	FUR-BO-10003894	1	Furniture	Bookcases	390.00	480.00
1640	TEC-MA-10001570	16	Technology	Machines	370.00	390.00
1641	FUR-FU-10003930	6	Furniture	Furnishings	80.00	90.00
1642	OFF-PA-10000232	11	Office Supplies	Paper	20.00	20.00
1643	OFF-AR-10001972	7	Office Supplies	Art	10.00	10.00
1644	OFF-AR-10004587	7	Office Supplies	Art	20.00	20.00
1645	OFF-AP-10001366	10	Office Supplies	Appliances	40.00	40.00
1646	OFF-BI-10000216	9	Office Supplies	Binders	10.00	10.00
1647	TEC-MA-10001047	16	Technology	Machines	7640.00	9100.00
1648	OFF-LA-10003720	3	Office Supplies	Labels	0.00	0.00
1649	TEC-MA-10003246	16	Technology	Machines	390.00	450.00
1650	FUR-FU-10000175	6	Furniture	Furnishings	70.00	80.00
1651	OFF-PA-10000556	11	Office Supplies	Paper	20.00	20.00
1652	TEC-AC-10003237	12	Technology	Accessories	50.00	50.00
1653	OFF-EN-10003068	13	Office Supplies	Envelopes	10.00	10.00
1654	FUR-FU-10004053	6	Furniture	Furnishings	60.00	60.00
1655	OFF-PA-10000565	11	Office Supplies	Paper	90.00	110.00
1656	OFF-LA-10000414	3	Office Supplies	Labels	40.00	50.00
1657	OFF-AP-10002998	10	Office Supplies	Appliances	90.00	100.00
1658	FUR-BO-10004690	1	Furniture	Bookcases	360.00	380.00
1659	OFF-AR-10002445	7	Office Supplies	Art	10.00	10.00
1660	FUR-BO-10003546	1	Furniture	Bookcases	280.00	300.00
1661	FUR-TA-10003392	4	Furniture	Tables	740.00	840.00
1662	OFF-AR-10003217	7	Office Supplies	Art	30.00	30.00
1663	OFF-ST-10001932	5	Office Supplies	Storage	870.00	970.00
1664	OFF-AR-10001761	7	Office Supplies	Art	30.00	30.00
1665	OFF-EN-10003567	13	Office Supplies	Envelopes	40.00	40.00
1666	OFF-PA-10003022	11	Office Supplies	Paper	10.00	10.00
1667	FUR-TA-10004442	4	Furniture	Tables	280.00	340.00
1668	OFF-ST-10000129	5	Office Supplies	Storage	290.00	330.00
1669	OFF-PA-10004948	11	Office Supplies	Paper	20.00	20.00
1670	OFF-PA-10001725	11	Office Supplies	Paper	100.00	120.00
1671	TEC-PH-10000213	8	Technology	Phones	160.00	170.00
1672	OFF-PA-10000807	11	Office Supplies	Paper	20.00	20.00
1673	OFF-ST-10003805	5	Office Supplies	Storage	1190.00	1350.00
1674	OFF-PA-10004353	11	Office Supplies	Paper	90.00	100.00
1675	OFF-EN-10004206	13	Office Supplies	Envelopes	280.00	330.00
1676	OFF-LA-10003388	3	Office Supplies	Labels	10.00	10.00
1677	TEC-PH-10000193	8	Technology	Phones	90.00	110.00
1678	FUR-FU-10002111	6	Furniture	Furnishings	40.00	40.00
1679	OFF-ST-10000885	5	Office Supplies	Storage	30.00	30.00
1680	OFF-PA-10002709	11	Office Supplies	Paper	70.00	70.00
1681	FUR-FU-10003424	6	Furniture	Furnishings	30.00	30.00
1682	OFF-BI-10003718	9	Office Supplies	Binders	500.00	590.00
1683	FUR-FU-10002508	6	Furniture	Furnishings	30.00	30.00
1684	OFF-AP-10004052	10	Office Supplies	Appliances	10.00	10.00
1685	OFF-PA-10003134	11	Office Supplies	Paper	140.00	150.00
1686	FUR-FU-10000719	6	Furniture	Furnishings	20.00	20.00
1687	FUR-BO-10003893	1	Furniture	Bookcases	470.00	590.00
1688	TEC-CO-10001943	17	Technology	Copiers	1410.00	1600.00
1689	FUR-CH-10000749	2	Furniture	Chairs	510.00	580.00
1690	OFF-PA-10003228	11	Office Supplies	Paper	410.00	440.00
1691	TEC-AC-10001542	12	Technology	Accessories	30.00	30.00
1692	TEC-AC-10004877	12	Technology	Accessories	70.00	80.00
1693	TEC-PH-10001305	8	Technology	Phones	390.00	440.00
1694	OFF-PA-10000483	11	Office Supplies	Paper	60.00	60.00
1695	TEC-AC-10000487	12	Technology	Accessories	20.00	20.00
1696	TEC-AC-10002018	12	Technology	Accessories	20.00	20.00
1697	OFF-PA-10004381	11	Office Supplies	Paper	110.00	120.00
1698	OFF-EN-10001453	13	Office Supplies	Envelopes	150.00	180.00
1699	OFF-SU-10001212	15	Office Supplies	Supplies	10.00	10.00
1700	OFF-BI-10000201	9	Office Supplies	Binders	0.00	0.00
1701	TEC-AC-10004396	12	Technology	Accessories	50.00	60.00
1702	OFF-AR-10002467	7	Office Supplies	Art	0.00	0.00
1703	FUR-FU-10002813	6	Furniture	Furnishings	50.00	50.00
1704	TEC-MA-10000752	16	Technology	Machines	30.00	30.00
1705	FUR-FU-10004845	6	Furniture	Furnishings	390.00	460.00
1706	OFF-FA-10000840	14	Office Supplies	Fasteners	0.00	0.00
1707	OFF-AR-10001231	7	Office Supplies	Art	0.00	0.00
1708	TEC-PH-10004875	8	Technology	Phones	10.00	10.00
1709	FUR-CH-10001802	2	Furniture	Chairs	220.00	250.00
1710	TEC-PH-10003356	8	Technology	Phones	20.00	20.00
1711	OFF-AP-10002670	10	Office Supplies	Appliances	60.00	70.00
1712	OFF-FA-10003485	14	Office Supplies	Fasteners	20.00	20.00
1713	OFF-AP-10000390	10	Office Supplies	Appliances	40.00	50.00
1714	OFF-PA-10002764	11	Office Supplies	Paper	50.00	60.00
1715	OFF-PA-10000143	11	Office Supplies	Paper	10.00	10.00
1716	TEC-MA-10000045	16	Technology	Machines	1930.00	2320.00
1717	OFF-ST-10000136	5	Office Supplies	Storage	200.00	220.00
1718	TEC-PH-10004522	8	Technology	Phones	190.00	210.00
1719	TEC-PH-10002584	8	Technology	Phones	1250.00	1500.00
1720	FUR-CH-10004626	2	Furniture	Chairs	280.00	300.00
1721	TEC-PH-10000562	8	Technology	Phones	390.00	470.00
1722	FUR-FU-10001025	6	Furniture	Furnishings	20.00	20.00
1723	OFF-LA-10004178	3	Office Supplies	Labels	0.00	0.00
1724	OFF-PA-10003797	11	Office Supplies	Paper	20.00	20.00
1725	OFF-EN-10003448	13	Office Supplies	Envelopes	20.00	20.00
1726	OFF-AP-10000938	10	Office Supplies	Appliances	640.00	710.00
1727	OFF-SU-10004737	15	Office Supplies	Supplies	10.00	10.00
1728	FUR-TA-10001691	4	Furniture	Tables	130.00	140.00
1729	TEC-MA-10003173	16	Technology	Machines	40.00	50.00
1730	OFF-LA-10000305	3	Office Supplies	Labels	50.00	50.00
1731	TEC-PH-10002583	8	Technology	Phones	30.00	40.00
1732	OFF-AR-10003876	7	Office Supplies	Art	10.00	10.00
1733	OFF-PA-10003063	11	Office Supplies	Paper	10.00	10.00
1734	OFF-PA-10003302	11	Office Supplies	Paper	80.00	90.00
1735	TEC-MA-10000423	16	Technology	Machines	100.00	110.00
1736	TEC-AC-10004992	12	Technology	Accessories	80.00	100.00
1737	OFF-BI-10004099	9	Office Supplies	Binders	20.00	20.00
1738	OFF-PA-10001215	11	Office Supplies	Paper	30.00	30.00
1739	TEC-AC-10003870	12	Technology	Accessories	1450.00	1650.00
1740	OFF-AP-10000275	10	Office Supplies	Appliances	1390.00	1640.00
1741	FUR-FU-10003192	6	Furniture	Furnishings	170.00	210.00
1742	OFF-PA-10000859	11	Office Supplies	Paper	10.00	10.00
1743	OFF-AR-10000614	7	Office Supplies	Art	10.00	10.00
1744	OFF-FA-10000089	14	Office Supplies	Fasteners	20.00	20.00
1745	FUR-TA-10001771	4	Furniture	Tables	1320.00	1480.00
1746	FUR-CH-10002044	2	Furniture	Chairs	360.00	420.00
1747	FUR-TA-10001086	4	Furniture	Tables	430.00	460.00
1748	OFF-PA-10000048	11	Office Supplies	Paper	10.00	10.00
1749	TEC-MA-10002109	16	Technology	Machines	170.00	210.00
1750	OFF-PA-10003036	11	Office Supplies	Paper	20.00	20.00
1751	TEC-PH-10001870	8	Technology	Phones	40.00	40.00
1752	OFF-ST-10002182	5	Office Supplies	Storage	60.00	80.00
1753	TEC-PH-10001468	8	Technology	Phones	450.00	550.00
1754	OFF-AR-10004010	7	Office Supplies	Art	60.00	60.00
1755	OFF-ST-10003572	5	Office Supplies	Storage	10.00	10.00
1756	OFF-ST-10003994	5	Office Supplies	Storage	110.00	120.00
1757	FUR-CH-10001545	2	Furniture	Chairs	260.00	270.00
1758	FUR-FU-10004245	6	Furniture	Furnishings	60.00	60.00
1759	OFF-EN-10002592	13	Office Supplies	Envelopes	50.00	60.00
1760	OFF-AR-10000914	7	Office Supplies	Art	20.00	20.00
1761	OFF-LA-10003498	3	Office Supplies	Labels	40.00	40.00
1762	TEC-MA-10003329	16	Technology	Machines	70.00	70.00
1763	FUR-FU-10000747	6	Furniture	Furnishings	80.00	90.00
1764	TEC-PH-10004100	8	Technology	Phones	50.00	60.00
1765	OFF-ST-10000636	5	Office Supplies	Storage	80.00	80.00
1766	TEC-PH-10003174	8	Technology	Phones	340.00	420.00
1767	OFF-PA-10001497	11	Office Supplies	Paper	100.00	110.00
1768	OFF-PA-10001952	11	Office Supplies	Paper	40.00	50.00
1769	OFF-SU-10004661	15	Office Supplies	Supplies	20.00	30.00
1770	OFF-PA-10001826	11	Office Supplies	Paper	20.00	20.00
1771	TEC-MA-10001031	16	Technology	Machines	460.00	510.00
1772	TEC-MA-10003176	16	Technology	Machines	290.00	340.00
1773	TEC-AC-10002647	12	Technology	Accessories	180.00	210.00
1774	TEC-PH-10002114	8	Technology	Phones	2170.00	2280.00
1775	OFF-PA-10001593	11	Office Supplies	Paper	10.00	10.00
1776	TEC-AC-10004803	12	Technology	Accessories	160.00	170.00
1777	OFF-PA-10001801	11	Office Supplies	Paper	20.00	20.00
1778	TEC-PH-10000127	8	Technology	Phones	60.00	80.00
1779	OFF-AP-10001564	10	Office Supplies	Appliances	390.00	470.00
1780	TEC-AC-10004595	12	Technology	Accessories	400.00	430.00
1781	FUR-FU-10002874	6	Furniture	Furnishings	50.00	60.00
1782	FUR-FU-10003489	6	Furniture	Furnishings	30.00	30.00
1783	TEC-MA-10002073	16	Technology	Machines	880.00	1040.00
1784	TEC-PH-10004006	8	Technology	Phones	40.00	40.00
1785	OFF-BI-10000279	9	Office Supplies	Binders	20.00	20.00
1786	OFF-PA-10000300	11	Office Supplies	Paper	50.00	50.00
1787	OFF-BI-10004308	9	Office Supplies	Binders	10.00	10.00
1788	TEC-PH-10004080	8	Technology	Phones	100.00	120.00
1789	OFF-PA-10001260	11	Office Supplies	Paper	50.00	60.00
1790	OFF-ST-10004946	5	Office Supplies	Storage	190.00	220.00
1791	OFF-PA-10002109	11	Office Supplies	Paper	0.00	0.00
1792	TEC-MA-10004255	16	Technology	Machines	270.00	320.00
1793	FUR-FU-10003095	6	Furniture	Furnishings	90.00	100.00
1794	FUR-FU-10000820	6	Furniture	Furnishings	60.00	70.00
1795	TEC-MA-10002930	16	Technology	Machines	70.00	80.00
1796	OFF-PA-10003205	11	Office Supplies	Paper	20.00	20.00
1797	OFF-LA-10002368	3	Office Supplies	Labels	10.00	10.00
1798	TEC-MA-10003230	16	Technology	Machines	1180.00	1360.00
1799	OFF-PA-10000295	11	Office Supplies	Paper	30.00	40.00
1800	OFF-SU-10004884	15	Office Supplies	Supplies	40.00	40.00
1801	FUR-FU-10002240	6	Furniture	Furnishings	10.00	10.00
1802	FUR-FU-10001057	6	Furniture	Furnishings	110.00	130.00
1803	FUR-CH-10002073	2	Furniture	Chairs	910.00	1060.00
1804	OFF-AP-10003278	10	Office Supplies	Appliances	10.00	10.00
1805	TEC-PH-10002070	8	Technology	Phones	10.00	10.00
1806	FUR-FU-10000277	6	Furniture	Furnishings	70.00	80.00
1807	TEC-AC-10004420	12	Technology	Accessories	410.00	480.00
1808	TEC-PH-10004094	8	Technology	Phones	580.00	620.00
1809	TEC-MA-10002790	16	Technology	Machines	460.00	480.00
1810	OFF-AP-10001634	10	Office Supplies	Appliances	0.00	0.00
1811	OFF-PA-10001837	11	Office Supplies	Paper	20.00	20.00
1812	OFF-AR-10003896	7	Office Supplies	Art	20.00	20.00
1813	OFF-BI-10002897	9	Office Supplies	Binders	10.00	10.00
1814	OFF-PA-10001243	11	Office Supplies	Paper	10.00	10.00
1815	FUR-FU-10003806	6	Furniture	Furnishings	650.00	760.00
1816	TEC-MA-10000904	16	Technology	Machines	270.00	340.00
1817	OFF-LA-10002473	3	Office Supplies	Labels	10.00	10.00
1818	FUR-FU-10003374	6	Furniture	Furnishings	290.00	320.00
1819	TEC-MA-10001856	16	Technology	Machines	590.00	650.00
1820	OFF-ST-10003641	5	Office Supplies	Storage	110.00	130.00
1821	OFF-AR-10004707	7	Office Supplies	Art	0.00	0.00
1822	TEC-MA-10004086	16	Technology	Machines	30.00	30.00
1823	TEC-MA-10001695	16	Technology	Machines	620.00	700.00
1824	FUR-FU-10002506	6	Furniture	Furnishings	30.00	40.00
1825	TEC-AC-10004518	12	Technology	Accessories	130.00	160.00
1826	OFF-AP-10000027	10	Office Supplies	Appliances	30.00	40.00
1827	OFF-PA-10002558	11	Office Supplies	Paper	230.00	270.00
1828	TEC-AC-10000926	12	Technology	Accessories	50.00	60.00
1829	OFF-PA-10001846	11	Office Supplies	Paper	20.00	20.00
1830	TEC-MA-10003673	16	Technology	Machines	3130.00	3400.00
1831	FUR-BO-10001567	1	Furniture	Bookcases	80.00	90.00
1832	FUR-FU-10001379	6	Furniture	Furnishings	20.00	30.00
1833	TEC-MA-10000984	16	Technology	Machines	3190.00	3360.00
1834	OFF-AR-10000937	7	Office Supplies	Art	170.00	180.00
1835	FUR-FU-10002030	6	Furniture	Furnishings	40.00	40.00
1836	OFF-FA-10000254	14	Office Supplies	Fasteners	20.00	20.00
1837	OFF-AP-10004136	10	Office Supplies	Appliances	110.00	120.00
1838	TEC-AC-10002370	12	Technology	Accessories	10.00	10.00
1839	OFF-AR-10003986	7	Office Supplies	Art	10.00	10.00
1840	OFF-SU-10004290	15	Office Supplies	Supplies	30.00	30.00
1841	TEC-MA-10004552	16	Technology	Machines	830.00	1040.00
1842	OFF-PA-10000312	11	Office Supplies	Paper	70.00	90.00
1843	OFF-PA-10001001	11	Office Supplies	Paper	80.00	90.00
1844	OFF-PA-10001583	11	Office Supplies	Paper	30.00	40.00
1845	TEC-MA-10002694	16	Technology	Machines	90.00	100.00
1846	TEC-MA-10004626	16	Technology	Machines	400.00	480.00
1847	TEC-PH-10004241	8	Technology	Phones	1320.00	1440.00
1848	OFF-SU-10003936	15	Office Supplies	Supplies	10.00	10.00
1849	TEC-MA-10003337	16	Technology	Machines	150.00	180.00
1850	OFF-PA-10000210	11	Office Supplies	Paper	90.00	100.00
1851	OFF-AR-10003477	7	Office Supplies	Art	10.00	10.00
1852	FUR-CH-10002317	2	Furniture	Chairs	180.00	210.00
1853	OFF-LA-10004677	3	Office Supplies	Labels	20.00	20.00
1854	FUR-CH-10002780	2	Furniture	Chairs	150.00	160.00
1855	OFF-EN-10001535	13	Office Supplies	Envelopes	10.00	10.00
1856	TEC-MA-10003493	16	Technology	Machines	70.00	90.00
1857	TEC-AC-10002380	12	Technology	Accessories	20.00	30.00
1858	TEC-PH-10002817	8	Technology	Phones	280.00	320.00
1859	TEC-MA-10003589	16	Technology	Machines	200.00	220.00
1860	OFF-AP-10003099	10	Office Supplies	Appliances	160.00	200.00
1861	TEC-PH-10002645	8	Technology	Phones	1280.00	1500.00
1862	OFF-ST-10001627	5	Office Supplies	Storage	30.00	40.00
\.


--
-- TOC entry 3393 (class 0 OID 27325)
-- Dependencies: 237
-- Data for Name: dim_shipping; Type: TABLE DATA; Schema: dwh; Owner: postgres
--

COPY dwh.dim_shipping (sk_shipping, shipping_id, ship_mode) FROM stdin;
1	1	Second Class
2	2	Standard Class
3	3	Unknown
4	4	Unknown
5	5	First Class
6	6	\N
7	7	Same Day
\.


--
-- TOC entry 3395 (class 0 OID 27332)
-- Dependencies: 239
-- Data for Name: fact_sales; Type: TABLE DATA; Schema: dwh; Owner: postgres
--

COPY dwh.fact_sales (trx_id, order_id, sk_customer, sk_product, sk_shipping, order_date, quantity, discount_percent, product_costprice, product_listprice, sales_amount, profit_amount) FROM stdin;
9995	1	1	1	1	2023-03-01	2	2.00	240.00	260.00	509.60	39.20
9996	2	1	2	1	2023-08-15	3	3.00	600.00	730.00	2124.30	378.30
9997	3	2	3	1	2023-01-10	2	5.00	10.00	10.00	19.00	0.00
9998	4	3	4	2	2022-06-18	5	2.00	780.00	960.00	4704.00	882.00
9999	5	3	5	2	2022-07-13	2	5.00	20.00	20.00	38.00	0.00
10000	6	4	6	3	2022-03-13	7	3.00	50.00	50.00	339.50	0.00
10001	7	4	7	2	2022-12-28	4	3.00	10.00	10.00	38.80	0.00
10002	8	4	8	2	2022-01-25	6	5.00	860.00	910.00	5187.00	285.00
10003	9	4	9	3	2023-03-23	3	2.00	20.00	20.00	58.80	0.00
10004	10	4	10	2	2023-05-16	5	3.00	90.00	110.00	533.50	97.00
10005	11	4	11	3	2023-03-31	9	3.00	1470.00	1710.00	14928.30	2095.20
10006	12	4	12	3	2023-12-25	4	3.00	750.00	910.00	3530.80	620.80
10007	13	5	13	2	2022-02-11	3	3.00	20.00	20.00	58.20	0.00
10008	14	6	14	2	2023-07-18	3	2.00	360.00	410.00	1205.40	147.00
10009	15	7	15	4	2023-11-09	5	5.00	60.00	70.00	332.50	47.50
10010	16	7	16	2	2022-06-18	3	5.00	0.00	0.00	0.00	0.00
10011	17	8	17	2	2022-02-04	6	3.00	610.00	670.00	3899.40	349.20
10012	18	9	18	1	2023-08-04	2	4.00	60.00	60.00	115.20	0.00
10013	19	10	19	1	2022-01-23	2	4.00	10.00	10.00	19.20	0.00
10014	20	10	20	1	2022-01-11	3	3.00	170.00	210.00	611.10	116.40
10015	21	10	21	1	2022-10-05	4	2.00	20.00	20.00	78.40	0.00
10016	22	11	22	2	2023-07-16	7	4.00	20.00	20.00	134.40	0.00
10017	23	11	23	2	2023-05-06	7	3.00	50.00	60.00	407.40	67.90
10018	24	12	24	1	2023-05-21	2	4.00	60.00	70.00	134.40	19.20
10019	25	13	4	2	2023-02-24	3	5.00	900.00	1040.00	2964.00	399.00
10020	26	14	25	1	2022-06-20	2	5.00	10.00	10.00	19.00	0.00
10021	27	14	26	1	2022-02-08	3	3.00	80.00	90.00	261.90	29.10
10022	28	12	27	2	2023-12-11	7	3.00	2740.00	3080.00	20913.20	2308.60
10023	29	12	28	2	2022-08-21	2	5.00	10.00	10.00	19.00	0.00
10024	30	12	29	2	2022-08-14	3	4.00	100.00	120.00	345.60	57.60
10025	31	12	30	2	2022-11-20	2	5.00	0.00	0.00	0.00	0.00
10026	32	12	31	2	2023-01-19	6	4.00	70.00	90.00	518.40	115.20
10027	33	12	32	2	2023-01-30	6	5.00	10.00	10.00	57.00	0.00
10028	34	12	33	2	2022-06-03	2	4.00	20.00	20.00	38.40	0.00
10029	35	15	34	1	2022-09-28	3	3.00	30.00	30.00	87.30	0.00
10030	36	16	35	5	2022-10-30	7	5.00	1020.00	1100.00	7315.00	532.00
10031	37	16	36	5	2023-07-27	5	4.00	180.00	190.00	912.00	48.00
10032	38	17	37	2	2023-03-07	9	2.00	90.00	110.00	970.20	176.40
10033	39	17	38	2	2023-08-18	3	2.00	460.00	530.00	1558.20	205.80
10034	40	17	39	2	2022-01-20	3	2.00	200.00	210.00	617.40	29.40
10035	41	17	40	2	2023-06-29	4	5.00	350.00	370.00	1406.00	76.00
10036	42	18	41	2	2022-06-28	4	3.00	140.00	150.00	582.00	38.80
10037	43	19	42	2	2023-02-09	2	5.00	70.00	80.00	152.00	19.00
10038	44	20	43	2	2023-09-18	2	4.00	90.00	100.00	192.00	19.20
10039	45	21	44	5	2022-11-11	2	2.00	40.00	50.00	98.00	19.60
10040	46	21	45	5	2022-05-27	2	5.00	20.00	20.00	38.00	0.00
10041	47	22	46	1	2023-02-03	4	4.00	180.00	210.00	806.40	115.20
10042	48	23	47	2	2022-02-16	3	5.00	50.00	50.00	142.50	0.00
10043	49	23	48	2	2022-05-06	2	4.00	20.00	20.00	38.40	0.00
10044	50	24	49	2	2023-06-18	6	4.00	30.00	40.00	230.40	57.60
10045	51	24	50	2	2022-01-11	6	4.00	70.00	80.00	460.80	57.60
10046	52	24	51	2	2023-09-09	2	4.00	10.00	10.00	19.20	0.00
10047	53	24	52	2	2022-01-31	1	5.00	70.00	90.00	85.50	19.00
10048	54	25	53	2	2023-07-30	7	3.00	20.00	20.00	135.80	0.00
10049	55	25	54	2	2023-10-17	5	4.00	850.00	1030.00	4944.00	864.00
10050	56	26	55	5	2023-07-06	6	5.00	200.00	210.00	1197.00	57.00
10051	57	26	56	5	2023-09-15	5	5.00	30.00	30.00	142.50	0.00
10052	58	26	57	5	2022-08-09	5	2.00	290.00	320.00	1568.00	147.00
10053	59	26	58	5	2022-04-05	2	4.00	10.00	10.00	19.20	0.00
10054	60	26	47	5	2023-06-24	2	5.00	20.00	30.00	57.00	19.00
10055	61	26	59	5	2022-03-10	4	2.00	40.00	50.00	196.00	39.20
10056	62	26	60	5	2023-04-08	1	5.00	0.00	0.00	0.00	0.00
10057	63	27	61	2	2023-10-16	2	3.00	10.00	10.00	19.40	0.00
10058	64	27	62	2	2023-08-02	6	2.00	20.00	30.00	176.40	58.80
10059	65	27	63	2	2022-11-05	3	5.00	130.00	150.00	427.50	57.00
10060	66	27	64	2	2022-05-06	4	2.00	70.00	80.00	313.60	39.20
10061	67	28	65	2	2022-03-26	5	5.00	180.00	210.00	997.50	142.50
10062	68	29	66	2	2022-04-10	8	3.00	940.00	1110.00	8613.60	1319.20
10063	69	29	67	2	2022-08-12	4	3.00	160.00	170.00	659.60	38.80
10064	70	30	68	5	2022-02-25	2	2.00	70.00	80.00	156.80	19.60
10065	71	31	69	2	2022-11-29	1	3.00	0.00	0.00	0.00	0.00
10066	72	32	70	1	2022-12-18	3	3.00	20.00	20.00	58.20	0.00
10067	73	33	71	2	2023-03-07	8	2.00	790.00	830.00	6507.20	313.60
10068	74	33	72	2	2023-07-12	2	3.00	90.00	100.00	194.00	19.40
10069	75	33	73	2	2022-10-21	1	2.00	60.00	70.00	68.60	9.80
10070	76	34	74	5	2023-04-17	3	4.00	0.00	0.00	0.00	0.00
10071	77	34	75	5	2023-05-20	3	4.00	10.00	10.00	28.80	0.00
10072	78	34	76	5	2023-05-13	3	2.00	20.00	30.00	88.20	29.40
10073	79	35	77	1	2022-10-20	5	2.00	20.00	20.00	98.00	0.00
10074	80	36	78	5	2023-10-22	1	3.00	190.00	210.00	203.70	19.40
10075	81	36	79	5	2022-07-20	3	2.00	20.00	20.00	58.80	0.00
10076	82	37	80	2	2022-11-16	5	5.00	10.00	10.00	47.50	0.00
10077	83	37	81	2	2022-11-10	1	4.00	20.00	20.00	19.20	0.00
10078	84	38	82	2	2022-03-15	7	3.00	180.00	200.00	1358.00	135.80
10079	85	39	83	5	2023-10-03	3	2.00	210.00	230.00	676.20	58.80
10080	86	40	84	1	2022-03-20	2	5.00	260.00	300.00	570.00	76.00
10081	87	41	85	2	2023-12-04	1	5.00	20.00	20.00	19.00	0.00
10082	88	41	86	2	2023-11-24	2	5.00	10.00	10.00	19.00	0.00
10083	89	15	87	1	2023-12-30	7	5.00	140.00	160.00	1064.00	133.00
10084	90	2	88	2	2022-05-23	3	2.00	20.00	20.00	58.80	0.00
10085	91	2	41	2	2023-04-06	2	2.00	60.00	70.00	137.20	19.60
10086	92	2	89	2	2022-03-23	1	2.00	10.00	10.00	9.80	0.00
10087	93	42	90	1	2023-04-07	2	2.00	10.00	10.00	19.60	0.00
10088	94	42	91	1	2022-05-13	3	5.00	50.00	50.00	142.50	0.00
10089	95	42	92	1	2022-04-23	2	3.00	20.00	30.00	58.20	19.40
10090	96	43	93	2	2023-12-17	1	2.00	10.00	10.00	9.80	0.00
10091	97	44	94	1	2022-04-28	7	5.00	80.00	100.00	665.00	133.00
10092	98	37	95	5	2023-06-14	3	4.00	40.00	50.00	144.00	28.80
10093	99	45	96	2	2023-02-05	6	3.00	70.00	80.00	465.60	58.20
10094	100	28	97	2	2023-12-30	7	3.00	60.00	60.00	407.40	0.00
10095	101	28	98	2	2022-02-24	3	5.00	80.00	100.00	285.00	57.00
10096	102	28	99	2	2022-07-25	3	3.00	0.00	0.00	0.00	0.00
10097	103	41	100	1	2022-01-14	4	4.00	20.00	20.00	76.80	0.00
10098	104	46	101	2	2022-12-22	6	3.00	220.00	240.00	1396.80	116.40
10099	105	46	102	2	2022-06-09	3	5.00	90.00	100.00	285.00	28.50
10100	106	46	103	2	2023-10-28	3	5.00	30.00	40.00	114.00	28.50
10101	107	47	104	2	2022-10-18	8	5.00	60.00	70.00	532.00	76.00
10102	108	47	105	2	2022-11-23	1	3.00	30.00	30.00	29.10	0.00
10103	109	47	106	2	2023-10-12	1	3.00	0.00	0.00	0.00	0.00
10104	110	48	107	2	2023-03-17	5	2.00	290.00	340.00	1666.00	245.00
10105	111	49	108	2	2023-09-05	2	2.00	30.00	40.00	78.40	19.60
10106	112	50	109	2	2022-01-28	2	3.00	70.00	80.00	155.20	19.40
10107	113	50	110	2	2022-12-26	6	3.00	30.00	30.00	174.60	0.00
10108	114	51	111	1	2023-06-06	14	2.00	40.00	40.00	548.80	0.00
10109	115	51	112	1	2023-11-08	2	4.00	0.00	0.00	0.00	0.00
10110	116	51	113	1	2022-11-15	3	4.00	20.00	20.00	57.60	0.00
10111	117	51	114	1	2022-06-30	6	5.00	120.00	130.00	741.00	57.00
10112	118	6	115	2	2023-10-27	3	4.00	720.00	790.00	2275.20	201.60
10113	119	52	116	6	2023-07-19	1	5.00	140.00	160.00	152.00	19.00
10114	120	53	117	5	2023-03-30	3	3.00	50.00	50.00	145.50	0.00
10115	121	53	9	5	2022-03-03	4	2.00	20.00	30.00	117.60	39.20
10116	122	53	118	5	2022-10-20	6	2.00	190.00	230.00	1352.40	235.20
10117	123	53	119	5	2023-01-23	9	4.00	110.00	120.00	1036.80	86.40
10118	124	53	120	5	2023-01-21	7	2.00	60.00	70.00	480.20	68.60
10119	125	17	121	1	2023-07-18	3	3.00	550.00	600.00	1746.00	145.50
10120	126	54	122	2	2023-07-15	6	4.00	540.00	620.00	3571.20	460.80
10121	127	55	123	2	2022-07-14	2	4.00	0.00	0.00	0.00	0.00
10122	128	55	124	2	2023-03-30	7	4.00	200.00	240.00	1612.80	268.80
10123	129	56	65	1	2023-09-18	2	2.00	70.00	80.00	156.80	19.60
10124	130	56	125	1	2022-01-03	3	4.00	220.00	240.00	691.20	57.60
10125	131	57	126	5	2022-07-17	5	3.00	50.00	60.00	291.00	48.50
10126	132	57	127	5	2022-03-30	2	4.00	80.00	80.00	153.60	0.00
10127	133	57	128	5	2022-05-01	9	5.00	20.00	20.00	171.00	0.00
10128	134	58	129	2	2023-04-29	3	4.00	20.00	20.00	57.60	0.00
10129	135	58	130	2	2022-10-28	1	5.00	30.00	40.00	38.00	9.50
10130	136	58	131	2	2022-03-05	4	5.00	10.00	10.00	38.00	0.00
10131	137	58	132	2	2022-03-28	2	5.00	0.00	0.00	0.00	0.00
10132	138	58	133	2	2023-10-16	3	2.00	70.00	80.00	235.20	29.40
10133	139	58	134	2	2022-05-15	6	5.00	60.00	70.00	399.00	57.00
10134	140	58	51	2	2023-06-06	14	2.00	40.00	40.00	548.80	0.00
10135	141	59	29	1	2022-06-10	2	2.00	60.00	80.00	156.80	39.20
10136	142	60	135	2	2022-07-22	3	3.00	10.00	10.00	29.10	0.00
10137	143	60	136	2	2023-12-27	3	2.00	10.00	10.00	29.40	0.00
10138	144	60	137	2	2023-11-29	3	5.00	130.00	140.00	399.00	28.50
10139	145	61	138	2	2022-03-19	3	2.00	780.00	840.00	2469.60	176.40
10140	146	62	83	2	2023-06-04	7	3.00	600.00	670.00	4549.30	475.30
10141	147	63	139	2	2023-05-31	4	4.00	80.00	90.00	345.60	38.40
10142	148	64	140	2	2022-06-12	11	4.00	350.00	380.00	4012.80	316.80
10143	149	64	141	2	2022-05-18	3	5.00	140.00	150.00	427.50	28.50
10144	150	64	2	2	2022-01-23	8	3.00	1580.00	1950.00	15132.00	2871.20
10145	151	64	142	2	2023-08-21	5	4.00	150.00	170.00	816.00	96.00
10146	152	65	143	5	2023-08-31	5	5.00	140.00	160.00	760.00	95.00
10147	153	65	144	5	2022-10-25	2	2.00	160.00	200.00	392.00	78.40
10148	154	66	145	5	2022-10-07	7	4.00	50.00	60.00	403.20	67.20
10149	155	66	146	5	2023-03-25	4	4.00	100.00	110.00	422.40	38.40
10150	156	66	147	5	2023-03-27	6	4.00	60.00	80.00	460.80	115.20
10151	157	67	148	2	2022-05-03	3	3.00	10.00	10.00	29.10	0.00
10152	158	68	121	1	2022-05-18	2	2.00	380.00	460.00	901.60	156.80
10153	159	69	149	2	2022-04-25	2	3.00	10.00	10.00	19.40	0.00
10154	160	69	150	2	2022-06-30	7	5.00	870.00	940.00	6251.00	465.50
10155	161	70	151	5	2022-01-10	1	4.00	10.00	10.00	9.60	0.00
10156	162	71	152	1	2023-11-27	2	5.00	40.00	50.00	95.00	19.00
10157	163	72	153	2	2022-02-16	5	4.00	30.00	30.00	144.00	0.00
10158	164	68	154	2	2022-08-14	2	3.00	20.00	30.00	58.20	19.40
10159	165	73	155	2	2023-10-14	3	5.00	10.00	10.00	28.50	0.00
10160	166	73	156	2	2022-10-16	8	4.00	6850.00	8160.00	62668.80	10060.80
10161	167	73	157	2	2022-11-20	3	4.00	250.00	280.00	806.40	86.40
10162	168	73	158	2	2023-11-04	9	4.00	1620.00	1740.00	15033.60	1036.80
10163	169	73	159	2	2023-06-16	6	4.00	30.00	30.00	172.80	0.00
10164	170	73	160	2	2022-10-20	5	2.00	150.00	180.00	882.00	147.00
10165	171	73	161	2	2022-07-12	3	5.00	120.00	140.00	399.00	57.00
10166	172	27	162	2	2022-01-28	3	2.00	20.00	20.00	58.80	0.00
10167	173	27	163	2	2023-10-10	2	4.00	100.00	110.00	211.20	19.20
10168	174	27	164	2	2022-10-05	7	2.00	290.00	340.00	2332.40	343.00
10169	175	74	165	2	2023-01-02	2	4.00	50.00	50.00	96.00	0.00
10170	176	74	166	2	2023-04-07	4	5.00	20.00	20.00	76.00	0.00
10171	177	75	167	1	2022-04-21	4	2.00	90.00	100.00	392.00	39.20
10172	178	76	168	1	2023-10-28	7	5.00	370.00	400.00	2660.00	199.50
10173	179	76	169	1	2022-04-18	5	3.00	20.00	20.00	97.00	0.00
10174	180	44	170	2	2022-03-08	1	5.00	0.00	0.00	0.00	0.00
10175	181	77	171	1	2023-06-08	2	5.00	20.00	20.00	38.00	0.00
10176	182	77	172	1	2022-06-25	7	3.00	380.00	410.00	2783.90	203.70
10177	183	78	173	1	2022-01-10	4	5.00	470.00	500.00	1900.00	114.00
10178	184	78	174	1	2023-10-17	5	2.00	140.00	150.00	735.00	49.00
10179	185	78	175	1	2023-02-23	2	5.00	30.00	30.00	57.00	0.00
10180	186	79	176	2	2022-10-19	2	2.00	10.00	10.00	19.60	0.00
10181	187	80	177	2	2022-08-22	8	3.00	160.00	180.00	1396.80	155.20
10182	188	81	178	2	2023-10-11	3	4.00	40.00	40.00	115.20	0.00
10183	189	81	145	2	2022-12-06	3	3.00	20.00	20.00	58.20	0.00
10184	190	82	179	5	2023-12-09	4	3.00	820.00	900.00	3492.00	310.40
10185	191	82	180	5	2022-07-12	6	4.00	60.00	70.00	403.20	57.60
10186	192	82	181	5	2022-06-23	8	5.00	50.00	50.00	380.00	0.00
10187	193	82	38	5	2023-11-04	3	2.00	520.00	630.00	1852.20	323.40
10188	194	82	182	5	2022-11-11	5	3.00	20.00	20.00	97.00	0.00
10189	195	83	30	2	2023-01-07	7	2.00	10.00	10.00	68.60	0.00
10190	196	84	183	2	2022-10-26	2	5.00	10.00	10.00	19.00	0.00
10191	197	84	184	2	2023-11-03	3	2.00	10.00	10.00	29.40	0.00
10192	198	85	185	2	2023-03-05	3	5.00	40.00	50.00	142.50	28.50
10193	199	86	186	2	2022-12-21	2	5.00	0.00	0.00	0.00	0.00
10194	200	86	187	2	2022-06-16	3	2.00	20.00	20.00	58.80	0.00
10195	201	87	188	2	2022-12-11	3	5.00	20.00	20.00	57.00	0.00
10196	202	88	189	5	2022-07-13	2	3.00	200.00	220.00	426.80	38.80
10197	203	88	190	5	2022-12-31	1	5.00	0.00	0.00	0.00	0.00
10198	204	89	191	1	2022-03-12	2	2.00	60.00	70.00	137.20	19.60
10199	205	90	192	2	2023-10-14	7	3.00	40.00	40.00	271.60	0.00
10200	206	91	193	2	2023-07-10	4	3.00	370.00	440.00	1707.20	271.60
10201	207	92	194	2	2023-12-01	4	4.00	70.00	80.00	307.20	38.40
10202	208	92	195	2	2023-08-08	2	3.00	120.00	130.00	252.20	19.40
10203	209	92	123	2	2022-08-19	4	3.00	20.00	20.00	77.60	0.00
10204	210	92	196	2	2023-12-30	9	2.00	50.00	50.00	441.00	0.00
10205	211	92	197	2	2022-07-17	1	5.00	80.00	90.00	85.50	9.50
10206	212	93	198	1	2023-10-07	2	4.00	20.00	20.00	38.40	0.00
10207	213	94	199	2	2023-04-22	2	4.00	20.00	20.00	38.40	0.00
10208	214	94	200	2	2023-04-22	5	5.00	390.00	450.00	2137.50	285.00
10209	215	94	105	2	2023-11-20	3	3.00	50.00	60.00	174.60	29.10
10210	216	94	201	2	2023-03-31	9	4.00	1040.00	1190.00	10281.60	1296.00
10211	217	94	202	2	2022-08-29	2	5.00	80.00	90.00	171.00	19.00
10212	218	4	178	2	2022-05-06	6	3.00	80.00	90.00	523.80	58.20
10213	219	4	203	2	2023-08-10	3	4.00	250.00	300.00	864.00	144.00
10214	220	95	204	5	2023-04-24	2	2.00	10.00	10.00	19.60	0.00
10215	221	95	205	5	2022-03-24	6	4.00	20.00	20.00	115.20	0.00
10216	222	95	92	5	2023-03-26	4	3.00	20.00	20.00	77.60	0.00
10217	223	95	206	5	2022-04-18	4	3.00	60.00	70.00	271.60	38.80
10218	224	95	207	5	2023-03-17	4	4.00	410.00	480.00	1843.20	268.80
10219	225	95	208	5	2023-11-19	2	4.00	30.00	30.00	57.60	0.00
10220	226	96	209	2	2023-11-18	1	2.00	0.00	0.00	0.00	0.00
10221	227	96	210	2	2023-04-22	5	2.00	510.00	620.00	3038.00	539.00
10222	228	96	211	2	2022-04-22	1	3.00	20.00	20.00	19.40	0.00
10223	229	97	212	2	2022-02-17	2	2.00	130.00	160.00	313.60	58.80
10224	230	97	213	2	2023-10-02	8	2.00	360.00	390.00	3057.60	235.20
10225	231	98	214	2	2023-07-21	7	5.00	20.00	20.00	133.00	0.00
10226	232	99	215	2	2023-01-18	2	4.00	210.00	230.00	441.60	38.40
10227	233	99	216	2	2023-10-19	3	4.00	510.00	620.00	1785.60	316.80
10228	234	99	214	2	2023-09-13	2	2.00	10.00	10.00	19.60	0.00
10229	235	99	217	2	2023-11-10	3	5.00	250.00	260.00	741.00	28.50
10230	236	99	218	2	2023-11-26	3	4.00	500.00	620.00	1785.60	345.60
10231	237	100	219	2	2022-01-02	2	4.00	10.00	10.00	19.20	0.00
10232	238	101	220	1	2022-01-19	5	4.00	30.00	30.00	144.00	0.00
10233	239	101	221	1	2023-12-13	5	2.00	340.00	420.00	2058.00	392.00
10234	240	101	222	1	2023-01-20	3	2.00	10.00	10.00	29.40	0.00
10235	241	101	223	1	2023-04-25	2	3.00	30.00	30.00	58.20	0.00
10236	242	101	224	1	2023-05-27	5	3.00	150.00	180.00	873.00	145.50
10237	243	101	225	1	2022-11-08	3	4.00	0.00	0.00	0.00	0.00
10238	244	101	183	1	2022-01-08	2	3.00	10.00	10.00	19.40	0.00
10239	245	102	121	1	2022-04-20	7	2.00	1620.00	2000.00	13720.00	2606.80
10240	246	102	226	1	2022-11-09	2	4.00	150.00	170.00	326.40	38.40
10241	247	102	227	1	2023-04-29	6	5.00	40.00	50.00	285.00	57.00
10242	248	102	228	1	2023-04-28	5	5.00	1380.00	1500.00	7125.00	570.00
10243	249	102	181	1	2022-09-26	4	3.00	20.00	30.00	116.40	38.80
10244	250	10	229	1	2023-08-18	2	5.00	300.00	320.00	608.00	38.00
10245	251	103	230	2	2023-09-19	1	3.00	10.00	10.00	9.70	0.00
10246	252	103	218	2	2022-05-28	13	4.00	3050.00	3350.00	41808.00	3744.00
10247	253	104	231	5	2022-04-03	6	5.00	70.00	80.00	456.00	57.00
10248	254	104	232	5	2022-04-18	4	4.00	330.00	360.00	1382.40	115.20
10249	255	74	225	2	2022-12-25	9	2.00	10.00	10.00	88.20	0.00
10250	256	74	233	2	2022-11-26	2	2.00	70.00	80.00	156.80	19.60
10251	257	74	147	2	2022-04-25	5	2.00	40.00	50.00	245.00	49.00
10252	258	74	234	2	2023-04-08	6	4.00	590.00	650.00	3744.00	345.60
10253	259	31	235	1	2022-02-10	3	5.00	20.00	20.00	57.00	0.00
10254	260	31	236	1	2022-10-20	3	4.00	180.00	220.00	633.60	115.20
10255	261	31	237	1	2022-06-11	5	5.00	20.00	20.00	95.00	0.00
10256	262	105	238	2	2023-08-29	2	2.00	0.00	0.00	0.00	0.00
10257	263	106	156	1	2022-12-26	3	3.00	2690.00	3060.00	8904.60	1076.70
10258	264	106	239	1	2022-06-14	7	3.00	2170.00	2520.00	17110.80	2376.50
10259	265	101	240	2	2023-06-20	4	3.00	300.00	330.00	1280.40	116.40
10260	266	107	241	2	2022-11-17	2	4.00	70.00	80.00	153.60	19.20
10261	267	108	242	2	2023-10-25	3	5.00	10.00	10.00	28.50	0.00
10262	268	109	243	2	2022-05-19	6	2.00	10.00	10.00	58.80	0.00
10263	269	110	244	2	2022-08-10	1	3.00	30.00	40.00	38.80	9.70
10264	270	110	245	2	2023-12-17	3	3.00	50.00	60.00	174.60	29.10
10265	271	111	246	1	2022-01-24	4	2.00	590.00	730.00	2861.60	548.80
10266	272	10	247	5	2022-09-16	7	5.00	200.00	210.00	1396.50	66.50
10267	273	10	248	5	2022-11-29	3	4.00	10.00	10.00	28.80	0.00
10268	274	10	249	5	2022-10-31	3	4.00	10.00	10.00	28.80	0.00
10269	275	112	250	5	2023-02-05	2	3.00	10.00	10.00	19.40	0.00
10270	276	112	251	5	2023-04-04	1	2.00	10.00	10.00	9.80	0.00
10271	277	59	252	2	2023-10-20	2	4.00	10.00	10.00	19.20	0.00
10272	278	59	253	2	2022-05-21	4	2.00	20.00	20.00	78.40	0.00
10273	279	59	254	2	2022-03-10	6	2.00	50.00	60.00	352.80	58.80
10274	280	59	255	2	2022-05-17	3	5.00	20.00	20.00	57.00	0.00
10275	281	35	256	1	2022-10-06	5	3.00	0.00	0.00	0.00	0.00
10276	282	35	257	1	2023-05-06	7	3.00	1050.00	1110.00	7536.90	407.40
10277	283	27	258	2	2023-10-05	5	5.00	950.00	1040.00	4940.00	427.50
10278	284	113	259	2	2022-07-28	5	5.00	130.00	140.00	665.00	47.50
10279	285	113	260	2	2022-12-11	5	5.00	210.00	240.00	1140.00	142.50
10280	286	113	261	2	2022-08-01	6	5.00	30.00	30.00	171.00	0.00
10281	287	114	262	1	2022-01-20	7	3.00	230.00	250.00	1697.50	135.80
10282	288	114	167	1	2023-06-05	2	2.00	150.00	190.00	372.40	78.40
10283	289	114	263	1	2023-04-01	5	5.00	810.00	960.00	4560.00	712.50
10284	290	115	264	1	2022-01-23	7	5.00	20.00	20.00	133.00	0.00
10285	291	115	265	1	2023-10-12	8	3.00	20.00	20.00	155.20	0.00
10286	292	115	266	1	2023-06-22	2	2.00	220.00	260.00	509.60	78.40
10287	293	115	267	1	2023-07-12	3	4.00	80.00	90.00	259.20	28.80
10288	294	116	268	5	2023-06-20	8	5.00	280.00	300.00	2280.00	152.00
10289	295	116	269	5	2023-05-30	3	2.00	190.00	230.00	676.20	117.60
10290	296	116	270	5	2023-08-05	3	2.00	180.00	220.00	646.80	117.60
10291	297	116	271	5	2023-11-17	5	5.00	70.00	80.00	380.00	47.50
10292	298	116	272	5	2023-08-04	3	3.00	30.00	30.00	87.30	0.00
10293	299	117	273	2	2022-09-25	5	2.00	20.00	30.00	147.00	49.00
10294	300	117	274	2	2022-09-24	8	2.00	930.00	1080.00	8467.20	1176.00
10295	301	117	275	2	2022-03-12	3	5.00	50.00	60.00	171.00	28.50
10296	302	117	276	2	2022-10-31	4	4.00	70.00	80.00	307.20	38.40
10297	303	117	277	2	2022-06-29	1	4.00	10.00	10.00	9.60	0.00
10298	304	118	278	2	2023-09-12	3	4.00	180.00	220.00	633.60	115.20
10299	305	25	279	1	2022-01-08	2	2.00	20.00	30.00	58.80	19.60
10300	306	119	280	2	2023-09-01	3	4.00	10.00	10.00	28.80	0.00
10301	307	120	281	2	2023-10-12	3	5.00	50.00	50.00	142.50	0.00
10302	308	120	282	2	2023-08-15	6	4.00	250.00	290.00	1670.40	230.40
10303	309	121	283	5	2022-05-05	1	3.00	0.00	0.00	0.00	0.00
10304	310	122	284	1	2023-08-06	4	5.00	20.00	20.00	76.00	0.00
10305	311	122	285	1	2022-09-08	2	4.00	400.00	470.00	902.40	134.40
10306	312	122	286	1	2022-05-30	1	4.00	20.00	20.00	19.20	0.00
10307	313	122	287	1	2023-01-13	3	3.00	10.00	10.00	29.10	0.00
10308	314	123	288	2	2023-09-15	3	2.00	80.00	90.00	264.60	29.40
10309	315	124	289	2	2022-05-12	2	5.00	160.00	180.00	342.00	38.00
10310	316	124	290	2	2022-03-10	3	5.00	20.00	20.00	57.00	0.00
10311	317	125	291	5	2023-06-16	4	2.00	90.00	100.00	392.00	39.20
10312	318	126	292	2	2022-03-13	1	2.00	120.00	140.00	137.20	19.60
10313	319	126	293	2	2022-01-28	2	2.00	3670.00	3990.00	7820.40	627.20
10314	320	126	41	2	2023-12-09	6	3.00	230.00	280.00	1629.60	291.00
10315	321	126	294	2	2023-07-12	4	3.00	300.00	360.00	1396.80	232.80
10316	322	126	124	2	2022-05-28	1	2.00	40.00	40.00	39.20	0.00
10317	323	127	295	2	2023-01-02	2	5.00	10.00	10.00	19.00	0.00
10318	324	128	271	2	2022-07-14	6	5.00	220.00	250.00	1425.00	171.00
10319	325	128	296	2	2023-12-09	1	3.00	80.00	100.00	97.00	19.40
10320	326	129	297	1	2022-12-07	1	4.00	20.00	20.00	19.20	0.00
10321	327	130	298	5	2023-06-11	3	3.00	270.00	290.00	843.90	58.20
10322	328	130	299	5	2023-10-01	2	5.00	40.00	50.00	95.00	19.00
10323	329	130	300	5	2023-04-07	4	3.00	740.00	790.00	3065.20	194.00
10324	330	130	301	5	2023-10-03	10	2.00	90.00	100.00	980.00	98.00
10325	331	130	302	5	2022-03-30	6	3.00	30.00	40.00	232.80	58.20
10326	332	71	303	1	2022-04-11	2	3.00	70.00	80.00	155.20	19.40
10327	333	71	304	1	2022-03-21	2	2.00	20.00	20.00	39.20	0.00
10328	334	71	305	1	2022-05-04	3	3.00	0.00	0.00	0.00	0.00
10329	335	70	306	1	2023-07-08	1	3.00	0.00	0.00	0.00	0.00
10330	336	70	307	1	2022-08-30	2	2.00	770.00	960.00	1881.60	372.40
10331	337	70	308	1	2022-09-07	4	2.00	10.00	10.00	39.20	0.00
10332	338	60	309	2	2023-06-07	2	5.00	10.00	10.00	19.00	0.00
10333	339	60	310	2	2023-08-02	3	4.00	570.00	700.00	2016.00	374.40
10334	340	131	311	1	2022-07-09	4	2.00	0.00	0.00	0.00	0.00
10335	341	59	312	1	2023-11-10	4	2.00	20.00	20.00	78.40	0.00
10336	342	59	14	1	2022-01-12	10	4.00	450.00	510.00	4896.00	576.00
10337	343	59	128	1	2022-07-01	13	4.00	20.00	30.00	374.40	124.80
10338	344	59	313	1	2023-07-13	12	4.00	60.00	70.00	806.40	115.20
10339	345	132	18	2	2023-04-21	4	3.00	80.00	90.00	349.20	38.80
10340	346	37	126	2	2022-09-18	3	2.00	50.00	50.00	147.00	0.00
10341	347	133	184	2	2022-05-09	3	4.00	10.00	10.00	28.80	0.00
10342	348	133	34	2	2022-05-07	2	5.00	20.00	20.00	38.00	0.00
10343	349	133	314	2	2023-10-25	2	2.00	10.00	10.00	19.60	0.00
10344	350	44	235	5	2023-02-01	1	5.00	10.00	10.00	9.50	0.00
10345	351	44	315	5	2023-02-04	2	5.00	20.00	20.00	38.00	0.00
10346	352	44	316	5	2022-02-14	1	3.00	0.00	0.00	0.00	0.00
10347	353	44	315	5	2023-09-08	4	3.00	50.00	50.00	194.00	0.00
10348	354	44	317	5	2023-10-29	4	4.00	4140.00	4360.00	16742.40	844.80
10349	355	134	318	2	2022-02-20	6	5.00	350.00	390.00	2223.00	228.00
10350	356	134	319	2	2023-07-30	2	5.00	10.00	10.00	19.00	0.00
10351	357	134	320	2	2023-05-01	4	3.00	20.00	20.00	77.60	0.00
10352	358	134	321	2	2023-01-26	5	2.00	30.00	30.00	147.00	0.00
10353	359	98	188	2	2023-11-05	5	4.00	30.00	40.00	192.00	48.00
10354	360	135	322	5	2022-08-22	8	3.00	600.00	650.00	5044.00	388.00
10355	361	135	323	5	2022-12-07	2	4.00	20.00	20.00	38.40	0.00
10356	362	31	323	2	2022-10-31	2	2.00	20.00	20.00	39.20	0.00
10357	363	31	324	2	2023-01-25	3	4.00	460.00	490.00	1411.20	86.40
10358	364	31	325	2	2023-09-20	2	2.00	10.00	10.00	19.60	0.00
10359	365	31	326	2	2022-10-14	8	4.00	40.00	50.00	384.00	76.80
10360	366	10	46	2	2022-08-15	4	5.00	200.00	210.00	798.00	38.00
10361	367	136	327	7	2023-05-31	4	3.00	20.00	20.00	77.60	0.00
10362	368	136	328	7	2022-07-15	2	3.00	10.00	10.00	19.40	0.00
10363	369	136	329	7	2023-01-30	7	3.00	90.00	100.00	679.00	67.90
10364	370	136	38	7	2022-10-29	4	5.00	900.00	1040.00	3952.00	532.00
10365	371	137	330	2	2022-09-23	5	5.00	30.00	30.00	142.50	0.00
10366	372	137	331	2	2022-04-28	3	3.00	40.00	50.00	145.50	29.10
10367	373	138	305	2	2022-09-27	5	3.00	10.00	10.00	48.50	0.00
10368	374	138	332	2	2022-03-02	8	2.00	870.00	1020.00	7996.80	1176.00
10369	375	138	333	2	2022-11-17	1	2.00	10.00	10.00	9.80	0.00
10370	376	138	334	2	2023-05-16	10	4.00	410.00	480.00	4608.00	672.00
10371	377	139	335	5	2022-11-05	4	3.00	80.00	100.00	388.00	77.60
10372	378	140	336	2	2023-02-25	7	2.00	1300.00	1490.00	10221.40	1303.40
10373	379	141	337	2	2023-05-17	3	5.00	10.00	10.00	28.50	0.00
10374	380	141	338	2	2023-12-19	3	3.00	20.00	20.00	58.20	0.00
10375	381	141	339	2	2023-09-05	4	3.00	10.00	10.00	38.80	0.00
10376	382	142	340	5	2023-05-20	7	5.00	40.00	50.00	332.50	66.50
10377	383	142	341	5	2023-04-22	3	5.00	50.00	50.00	142.50	0.00
10378	384	119	342	1	2023-03-21	2	2.00	40.00	40.00	78.40	0.00
10379	385	143	343	2	2023-02-08	3	4.00	330.00	380.00	1094.40	144.00
10380	386	143	344	2	2023-01-27	3	3.00	70.00	80.00	232.80	29.10
10381	387	59	345	2	2023-10-07	4	2.00	400.00	480.00	1881.60	313.60
10382	388	59	346	2	2023-03-04	1	5.00	0.00	0.00	0.00	0.00
10383	389	144	347	5	2023-08-26	1	2.00	0.00	0.00	0.00	0.00
10384	390	31	348	2	2023-03-25	4	2.00	20.00	20.00	78.40	0.00
10385	391	31	85	2	2023-03-14	2	5.00	40.00	40.00	76.00	0.00
10386	392	145	349	1	2022-05-27	2	4.00	230.00	250.00	480.00	38.40
10387	393	145	350	1	2022-12-19	3	2.00	1600.00	1800.00	5292.00	588.00
10388	394	146	351	1	2022-11-03	3	2.00	10.00	10.00	29.40	0.00
10389	395	147	352	2	2022-06-26	3	3.00	60.00	80.00	232.80	58.20
10390	396	148	353	1	2022-08-23	2	3.00	40.00	50.00	97.00	19.40
10391	397	148	354	1	2023-09-23	2	2.00	10.00	10.00	19.60	0.00
10392	398	149	355	2	2022-02-02	4	5.00	60.00	70.00	266.00	38.00
10393	399	75	356	1	2023-11-29	3	3.00	40.00	40.00	116.40	0.00
10394	400	75	27	1	2022-03-13	4	5.00	1990.00	2400.00	9120.00	1558.00
10395	401	75	357	1	2022-10-22	4	5.00	110.00	130.00	494.00	76.00
10396	402	75	358	1	2023-02-11	2	3.00	60.00	60.00	116.40	0.00
10397	403	150	359	5	2023-03-06	2	2.00	10.00	10.00	19.60	0.00
10398	404	151	360	2	2023-12-04	6	4.00	30.00	40.00	230.40	57.60
10399	405	104	361	2	2023-02-12	3	3.00	40.00	40.00	116.40	0.00
10400	406	152	358	2	2023-04-02	5	4.00	140.00	180.00	864.00	192.00
10401	407	152	362	2	2022-08-09	3	5.00	1130.00	1200.00	3420.00	199.50
10402	408	152	363	2	2022-05-25	5	4.00	30.00	30.00	144.00	0.00
10403	409	152	364	2	2022-08-28	7	4.00	800.00	1000.00	6720.00	1344.00
10404	410	152	365	2	2022-11-25	1	3.00	10.00	10.00	9.70	0.00
10405	411	152	366	2	2023-12-19	9	4.00	30.00	30.00	259.20	0.00
10406	412	152	315	2	2023-01-13	1	5.00	60.00	60.00	57.00	0.00
10407	413	152	367	2	2022-05-11	13	4.00	1260.00	1340.00	16723.20	998.40
10408	414	152	368	2	2023-12-31	2	5.00	100.00	110.00	209.00	19.00
10409	415	153	369	2	2023-12-08	7	3.00	120.00	140.00	950.60	135.80
10410	416	153	269	2	2022-08-05	4	2.00	250.00	310.00	1215.20	235.20
10411	417	154	370	2	2023-07-10	8	5.00	90.00	100.00	760.00	76.00
10412	418	27	371	2	2022-08-20	5	4.00	320.00	380.00	1824.00	288.00
10413	419	155	372	2	2022-07-20	1	5.00	10.00	10.00	9.50	0.00
10414	420	156	373	2	2022-10-20	4	4.00	10.00	10.00	38.40	0.00
10415	421	156	374	2	2022-02-10	1	5.00	20.00	20.00	19.00	0.00
10416	422	157	375	5	2023-08-28	6	3.00	160.00	200.00	1164.00	232.80
10417	423	158	376	2	2023-12-18	4	3.00	60.00	60.00	232.80	0.00
10418	424	158	377	2	2022-10-17	3	5.00	30.00	30.00	85.50	0.00
10419	425	159	378	1	2023-04-01	4	4.00	800.00	870.00	3340.80	268.80
10420	426	160	379	1	2023-12-26	2	4.00	30.00	30.00	57.60	0.00
10421	427	160	380	1	2023-11-07	8	4.00	280.00	290.00	2227.20	76.80
10422	428	161	381	5	2023-06-03	1	3.00	60.00	70.00	67.90	9.70
10423	429	162	382	2	2022-02-18	6	5.00	10.00	10.00	57.00	0.00
10424	430	163	383	2	2023-03-19	2	4.00	160.00	190.00	364.80	57.60
10425	431	163	172	2	2023-03-10	7	3.00	330.00	410.00	2783.90	543.20
10426	432	163	172	2	2023-09-23	5	5.00	270.00	290.00	1377.50	95.00
10427	433	163	384	2	2022-04-15	2	3.00	0.00	0.00	0.00	0.00
10428	434	133	385	5	2023-08-17	5	4.00	580.00	710.00	3408.00	624.00
10429	435	164	386	2	2022-02-13	2	5.00	0.00	0.00	0.00	0.00
10430	436	164	387	2	2023-10-25	5	2.00	210.00	250.00	1225.00	196.00
10431	437	39	388	1	2023-02-10	3	4.00	930.00	1010.00	2908.80	230.40
10432	438	39	315	1	2022-02-23	7	4.00	270.00	310.00	2083.20	268.80
10433	439	165	389	2	2022-11-18	8	3.00	30.00	30.00	232.80	0.00
10434	440	25	390	1	2022-06-06	3	5.00	190.00	210.00	598.50	57.00
10435	441	166	391	1	2022-01-09	1	3.00	10.00	10.00	9.70	0.00
10436	442	166	392	1	2023-05-30	3	4.00	150.00	190.00	547.20	115.20
10437	443	166	393	1	2022-10-15	3	4.00	60.00	70.00	201.60	28.80
10438	444	166	394	1	2022-12-15	4	3.00	80.00	90.00	349.20	38.80
10439	445	166	395	1	2022-07-06	3	4.00	210.00	240.00	691.20	86.40
10440	446	166	396	1	2022-03-13	7	3.00	20.00	20.00	135.80	0.00
10441	447	167	397	1	2022-10-07	1	2.00	0.00	0.00	0.00	0.00
10442	448	168	398	1	2023-12-05	3	4.00	50.00	60.00	172.80	28.80
10443	449	168	399	1	2023-12-07	3	4.00	130.00	160.00	460.80	86.40
10444	450	168	400	1	2022-03-14	6	2.00	210.00	260.00	1528.80	294.00
10445	451	168	401	1	2023-07-21	3	4.00	30.00	30.00	86.40	0.00
10446	452	168	402	1	2022-04-04	3	4.00	10.00	10.00	28.80	0.00
10447	453	168	403	1	2023-03-16	4	3.00	40.00	40.00	155.20	0.00
10448	454	169	11	2	2022-12-05	2	4.00	220.00	280.00	537.60	115.20
10449	455	169	404	2	2023-12-23	2	2.00	570.00	670.00	1313.20	196.00
10450	456	170	405	2	2022-11-08	4	5.00	50.00	60.00	228.00	38.00
10451	457	171	406	2	2023-03-26	2	2.00	120.00	130.00	254.80	19.60
10452	458	172	407	2	2023-12-22	3	5.00	670.00	750.00	2137.50	228.00
10453	459	172	408	2	2023-09-24	2	2.00	10.00	10.00	19.60	0.00
10454	460	68	409	2	2022-11-30	4	3.00	80.00	100.00	388.00	77.60
10455	461	68	410	2	2023-02-04	9	5.00	760.00	900.00	7695.00	1197.00
10456	462	68	411	2	2022-10-01	3	2.00	50.00	50.00	147.00	0.00
10457	463	173	326	2	2022-05-11	5	3.00	20.00	20.00	97.00	0.00
10458	464	173	412	2	2023-03-05	6	4.00	1080.00	1270.00	7315.20	1094.40
10459	465	173	413	2	2023-02-09	5	4.00	30.00	30.00	144.00	0.00
10460	466	173	414	2	2023-04-23	2	5.00	180.00	190.00	361.00	19.00
10461	467	173	415	2	2023-10-14	2	3.00	80.00	80.00	155.20	0.00
10462	468	174	270	2	2022-04-24	7	3.00	200.00	250.00	1697.50	339.50
10463	469	175	416	2	2023-04-20	2	5.00	200.00	210.00	399.00	19.00
10464	470	101	417	1	2022-12-04	3	3.00	0.00	0.00	0.00	0.00
10465	471	176	418	2	2022-11-20	1	3.00	50.00	60.00	58.20	9.70
10466	472	152	419	1	2022-01-25	3	2.00	290.00	340.00	999.60	147.00
10467	473	152	420	1	2023-10-27	2	5.00	200.00	220.00	418.00	38.00
10468	474	152	421	1	2022-12-27	4	2.00	610.00	700.00	2744.00	352.80
10469	475	152	422	1	2023-12-12	6	3.00	80.00	90.00	523.80	58.20
10470	476	152	423	1	2022-07-16	7	3.00	60.00	60.00	407.40	0.00
10471	477	152	424	1	2022-06-30	5	4.00	90.00	90.00	432.00	0.00
10472	478	177	425	2	2023-08-06	6	4.00	90.00	100.00	576.00	57.60
10473	479	26	279	2	2022-02-01	3	4.00	30.00	40.00	115.20	28.80
10474	480	25	426	2	2023-07-03	5	4.00	10.00	10.00	48.00	0.00
10475	481	25	427	2	2023-08-07	5	5.00	600.00	700.00	3325.00	475.00
10476	482	178	428	2	2022-12-16	3	2.00	10.00	10.00	29.40	0.00
10477	483	104	80	2	2023-02-03	2	4.00	10.00	10.00	19.20	0.00
10478	484	104	429	2	2023-10-10	2	4.00	140.00	160.00	307.20	38.40
10479	485	179	430	5	2023-10-15	2	5.00	30.00	30.00	57.00	0.00
10480	486	179	431	5	2023-12-14	5	4.00	480.00	510.00	2448.00	144.00
10481	487	179	432	5	2023-03-09	5	5.00	250.00	280.00	1330.00	142.50
10482	488	101	433	5	2023-04-28	6	4.00	2300.00	2740.00	15782.40	2534.40
10483	489	180	434	1	2022-12-22	1	5.00	10.00	10.00	9.50	0.00
10484	490	180	435	1	2023-06-06	2	5.00	50.00	60.00	114.00	19.00
10485	491	180	400	1	2022-02-08	2	4.00	70.00	70.00	134.40	0.00
10486	492	181	436	2	2023-01-08	5	4.00	410.00	450.00	2160.00	192.00
10487	493	181	437	2	2023-01-03	3	5.00	10.00	10.00	28.50	0.00
10488	494	68	438	2	2023-06-26	2	4.00	80.00	90.00	172.80	19.20
10489	495	33	439	1	2022-12-09	3	5.00	180.00	190.00	541.50	28.50
10490	496	182	440	2	2022-10-13	2	3.00	100.00	110.00	213.40	19.40
10491	497	183	441	2	2022-05-21	8	2.00	110.00	120.00	940.80	78.40
10492	498	183	442	2	2022-08-28	4	2.00	230.00	260.00	1019.20	117.60
10493	499	183	292	2	2022-04-10	2	5.00	200.00	240.00	456.00	76.00
10494	500	183	443	2	2023-08-28	9	5.00	60.00	70.00	598.50	85.50
10495	501	184	444	2	2022-12-25	2	4.00	20.00	20.00	38.40	0.00
10496	502	184	445	2	2023-04-29	2	5.00	10.00	10.00	19.00	0.00
10497	503	184	446	2	2023-11-06	2	3.00	650.00	800.00	1552.00	291.00
10498	504	184	447	2	2023-10-28	3	4.00	0.00	0.00	0.00	0.00
10499	505	184	448	2	2022-08-03	1	4.00	30.00	30.00	28.80	0.00
10500	506	25	123	1	2023-01-27	5	3.00	20.00	20.00	97.00	0.00
10501	507	185	449	2	2022-07-28	1	3.00	0.00	0.00	0.00	0.00
10502	508	185	450	2	2023-03-04	3	2.00	10.00	10.00	29.40	0.00
10503	509	185	231	2	2022-10-10	3	4.00	50.00	50.00	144.00	0.00
10504	510	185	451	2	2023-12-10	5	3.00	5210.00	6350.00	30797.50	5529.00
10505	511	186	452	5	2023-01-30	3	2.00	110.00	130.00	382.20	58.80
10506	512	186	453	5	2022-12-28	2	2.00	40.00	40.00	78.40	0.00
10507	513	76	80	5	2022-10-28	3	4.00	10.00	10.00	28.80	0.00
10508	514	14	454	2	2023-09-28	3	3.00	10.00	10.00	29.10	0.00
10509	515	14	455	2	2023-07-19	2	3.00	10.00	10.00	19.40	0.00
10510	516	187	456	2	2022-01-04	5	5.00	2430.00	3000.00	14250.00	2707.50
10511	517	187	457	2	2022-08-25	3	4.00	40.00	50.00	144.00	28.80
10512	518	187	458	2	2022-09-03	2	3.00	10.00	10.00	19.40	0.00
10513	519	187	459	2	2022-11-10	3	5.00	1020.00	1130.00	3220.50	313.50
10514	520	188	44	2	2022-04-11	1	4.00	20.00	20.00	19.20	0.00
10515	521	188	460	2	2023-03-24	2	4.00	120.00	130.00	249.60	19.20
10516	522	188	461	2	2022-05-24	9	3.00	10.00	10.00	87.30	0.00
10517	523	189	439	5	2023-12-17	2	2.00	180.00	210.00	411.60	58.80
10518	524	4	462	5	2022-11-01	3	5.00	50.00	60.00	171.00	28.50
10519	525	4	218	5	2023-11-19	2	4.00	60.00	70.00	134.40	19.20
10520	526	190	463	2	2022-07-18	5	4.00	20.00	20.00	96.00	0.00
10521	527	191	464	2	2023-01-06	3	2.00	540.00	680.00	1999.20	411.60
10522	528	191	286	2	2023-11-22	3	2.00	50.00	50.00	147.00	0.00
10523	529	71	465	2	2022-11-11	3	5.00	40.00	40.00	114.00	0.00
10524	530	71	466	2	2022-01-29	1	2.00	550.00	670.00	656.60	117.60
10525	531	71	467	2	2023-01-02	6	3.00	50.00	50.00	291.00	0.00
10526	532	2	468	1	2022-12-05	1	3.00	150.00	190.00	184.30	38.80
10527	533	4	469	2	2023-05-14	3	2.00	40.00	50.00	147.00	29.40
10528	534	192	470	1	2022-02-28	5	3.00	820.00	980.00	4753.00	776.00
10529	535	192	249	1	2023-06-05	5	2.00	20.00	20.00	98.00	0.00
10530	536	193	471	2	2022-08-27	2	5.00	20.00	20.00	38.00	0.00
10531	537	194	472	1	2022-10-26	7	5.00	30.00	40.00	266.00	66.50
10532	538	44	473	2	2022-08-23	4	4.00	10.00	10.00	38.40	0.00
10533	539	1	474	2	2023-05-21	3	4.00	130.00	150.00	432.00	57.60
10534	540	1	475	2	2023-10-23	4	4.00	230.00	280.00	1075.20	192.00
10535	541	195	476	5	2023-04-04	6	4.00	410.00	470.00	2707.20	345.60
10536	542	196	477	5	2022-11-28	8	4.00	300.00	380.00	2918.40	614.40
10537	543	197	436	2	2023-04-08	9	2.00	600.00	650.00	5733.00	441.00
10538	544	198	478	2	2023-12-15	2	4.00	50.00	60.00	115.20	19.20
10539	545	198	479	2	2023-06-30	1	5.00	100.00	100.00	95.00	0.00
10540	546	198	480	2	2023-11-13	4	3.00	60.00	70.00	271.60	38.80
10541	547	82	481	5	2022-08-26	6	4.00	30.00	40.00	230.40	57.60
10542	548	82	482	5	2022-09-22	2	5.00	10.00	10.00	19.00	0.00
10543	549	199	55	1	2022-09-21	9	4.00	210.00	250.00	2160.00	345.60
10544	550	199	93	1	2022-06-05	3	5.00	10.00	10.00	28.50	0.00
10545	551	199	483	1	2023-01-09	5	5.00	10.00	10.00	47.50	0.00
10546	552	152	484	1	2023-09-21	2	3.00	930.00	1120.00	2172.80	368.60
10547	553	164	485	5	2022-06-02	1	3.00	20.00	30.00	29.10	9.70
10548	554	35	486	2	2022-09-01	3	4.00	10.00	10.00	28.80	0.00
10549	555	200	487	1	2023-03-09	2	2.00	1200.00	1300.00	2548.00	196.00
10550	556	201	488	1	2023-07-01	4	5.00	20.00	20.00	76.00	0.00
10551	557	70	489	2	2022-11-17	2	2.00	20.00	20.00	39.20	0.00
10552	558	70	490	2	2023-11-25	4	4.00	1260.00	1340.00	5145.60	307.20
10553	559	70	491	2	2023-11-29	5	3.00	30.00	30.00	145.50	0.00
10554	560	152	379	1	2022-11-27	3	5.00	40.00	40.00	114.00	0.00
10555	561	152	492	1	2022-06-21	7	4.00	70.00	80.00	537.60	67.20
10556	562	202	493	1	2023-03-17	5	4.00	10.00	10.00	48.00	0.00
10557	563	202	494	1	2022-10-04	3	2.00	10.00	10.00	29.40	0.00
10558	564	203	495	5	2022-06-14	2	5.00	0.00	0.00	0.00	0.00
10559	565	203	287	5	2022-01-26	1	5.00	0.00	0.00	0.00	0.00
10560	566	204	496	5	2022-10-06	3	4.00	330.00	370.00	1065.60	115.20
10561	567	153	497	2	2022-04-25	8	5.00	70.00	90.00	684.00	152.00
10562	568	153	498	2	2022-01-01	7	4.00	70.00	80.00	537.60	67.20
10563	569	153	499	2	2023-06-10	3	2.00	20.00	20.00	58.80	0.00
10564	570	153	500	2	2022-11-25	3	4.00	370.00	450.00	1296.00	230.40
10565	571	104	489	2	2022-03-01	7	3.00	60.00	70.00	475.30	67.90
10566	572	104	204	2	2023-07-29	4	3.00	10.00	10.00	38.80	0.00
10567	573	104	306	2	2022-10-25	7	2.00	30.00	30.00	205.80	0.00
10568	574	104	501	2	2023-07-04	3	3.00	10.00	10.00	29.10	0.00
10569	575	205	502	2	2022-10-02	3	5.00	10.00	10.00	28.50	0.00
10570	576	206	497	1	2023-07-14	14	4.00	150.00	160.00	2150.40	134.40
10571	577	206	503	1	2023-04-22	4	4.00	20.00	20.00	76.80	0.00
10572	578	206	504	1	2023-11-11	2	5.00	10.00	10.00	19.00	0.00
10573	579	101	124	2	2022-12-08	2	3.00	70.00	70.00	135.80	0.00
10574	580	101	505	2	2023-06-12	1	5.00	10.00	10.00	9.50	0.00
10575	581	27	506	2	2023-11-02	4	3.00	50.00	50.00	194.00	0.00
10576	582	88	35	2	2022-08-17	3	5.00	440.00	470.00	1339.50	85.50
10577	583	88	507	2	2022-08-23	2	4.00	90.00	110.00	211.20	38.40
10578	584	88	96	2	2023-07-10	3	5.00	30.00	30.00	85.50	0.00
10579	585	88	508	2	2023-07-22	7	2.00	10.00	10.00	68.60	0.00
10580	586	88	144	2	2023-11-16	4	2.00	360.00	410.00	1607.20	196.00
10581	587	207	368	2	2022-07-16	1	4.00	60.00	70.00	67.20	9.60
10582	588	207	509	2	2022-07-21	3	4.00	270.00	290.00	835.20	57.60
10583	589	208	510	2	2023-03-03	2	3.00	80.00	80.00	155.20	0.00
10584	590	208	511	2	2023-04-28	4	2.00	20.00	20.00	78.40	0.00
10585	591	208	441	2	2023-07-04	3	2.00	20.00	20.00	58.80	0.00
10586	592	208	512	2	2022-01-23	2	5.00	10.00	10.00	19.00	0.00
10587	593	209	513	2	2023-05-13	2	3.00	10.00	10.00	19.40	0.00
10588	594	209	198	2	2023-12-05	3	3.00	20.00	30.00	87.30	29.10
10589	595	178	514	2	2023-06-07	2	3.00	70.00	80.00	155.20	19.40
10590	596	178	362	2	2023-03-26	3	5.00	1100.00	1200.00	3420.00	285.00
10591	597	178	289	2	2022-06-12	5	5.00	390.00	450.00	2137.50	285.00
10592	598	178	515	2	2022-03-23	8	2.00	310.00	330.00	2587.20	156.80
10593	599	71	516	5	2022-01-08	2	2.00	10.00	10.00	19.60	0.00
10594	600	210	517	2	2023-04-03	3	2.00	120.00	140.00	411.60	58.80
10595	601	210	518	2	2023-02-19	4	4.00	390.00	490.00	1881.60	384.00
10596	602	210	504	2	2023-03-10	2	4.00	10.00	10.00	19.20	0.00
10597	603	202	519	2	2022-06-08	1	3.00	120.00	140.00	135.80	19.40
10598	604	202	286	2	2023-07-19	3	5.00	40.00	50.00	142.50	28.50
10599	605	202	386	2	2022-03-29	3	5.00	10.00	10.00	28.50	0.00
10600	606	202	380	2	2023-05-25	4	5.00	40.00	40.00	152.00	0.00
10601	607	202	520	2	2023-11-15	3	2.00	120.00	130.00	382.20	29.40
10602	608	71	521	2	2022-07-04	2	5.00	0.00	0.00	0.00	0.00
10603	609	71	455	2	2022-03-11	9	3.00	20.00	20.00	174.60	0.00
10604	610	71	522	2	2023-02-07	2	5.00	50.00	60.00	114.00	19.00
10605	611	211	349	5	2023-02-08	3	3.00	340.00	370.00	1076.70	87.30
10606	612	211	523	5	2022-09-28	4	3.00	20.00	20.00	77.60	0.00
10607	613	125	524	1	2022-04-22	2	5.00	10.00	10.00	19.00	0.00
10608	614	125	525	1	2023-06-29	9	5.00	690.00	730.00	6241.50	342.00
10609	615	212	223	1	2022-10-11	10	3.00	100.00	120.00	1164.00	194.00
10610	616	212	526	1	2022-06-24	2	2.00	0.00	0.00	0.00	0.00
10611	617	213	527	1	2022-01-30	2	4.00	30.00	40.00	76.80	19.20
10612	618	213	528	1	2023-03-20	2	4.00	10.00	10.00	19.20	0.00
10613	619	213	529	1	2023-11-18	9	3.00	100.00	110.00	960.30	87.30
10614	620	213	530	1	2023-09-23	1	4.00	30.00	40.00	38.40	9.60
10615	621	213	139	1	2022-06-04	3	2.00	80.00	90.00	264.60	29.40
10616	622	101	531	2	2023-01-01	5	3.00	10.00	10.00	48.50	0.00
10617	623	214	532	2	2022-07-06	2	3.00	270.00	300.00	582.00	58.20
10618	624	214	533	2	2023-07-24	5	4.00	490.00	560.00	2688.00	336.00
10619	625	214	534	2	2022-12-12	4	2.00	440.00	520.00	2038.40	313.60
10620	626	214	31	2	2022-08-27	9	3.00	150.00	160.00	1396.80	87.30
10621	627	44	535	2	2022-02-17	7	4.00	30.00	40.00	268.80	67.20
10622	628	68	536	2	2023-01-04	2	3.00	80.00	100.00	194.00	38.80
10623	629	37	537	2	2023-04-02	5	5.00	20.00	20.00	95.00	0.00
10624	630	37	250	2	2022-04-21	3	4.00	10.00	10.00	28.80	0.00
10625	631	46	538	1	2023-11-17	3	2.00	200.00	240.00	705.60	117.60
10626	632	46	539	1	2022-10-24	5	4.00	110.00	120.00	576.00	48.00
10627	633	46	540	1	2022-12-18	4	5.00	260.00	300.00	1140.00	152.00
10628	634	150	541	1	2022-08-18	3	2.00	20.00	20.00	58.80	0.00
10629	635	150	509	1	2022-02-17	3	5.00	190.00	240.00	684.00	142.50
10630	636	215	542	1	2023-01-21	3	2.00	320.00	390.00	1146.60	205.80
10631	637	46	543	2	2023-02-19	3	5.00	20.00	20.00	57.00	0.00
10632	638	46	544	2	2022-07-08	3	2.00	110.00	120.00	352.80	29.40
10633	639	216	221	2	2023-05-25	5	2.00	1000.00	1050.00	5145.00	245.00
10634	640	216	545	2	2022-01-18	4	3.00	20.00	20.00	77.60	0.00
10635	641	217	546	2	2023-02-14	3	4.00	20.00	20.00	57.60	0.00
10636	642	218	547	1	2022-12-15	2	5.00	300.00	330.00	627.00	57.00
10637	643	218	548	1	2022-01-19	7	4.00	20.00	30.00	201.60	67.20
10638	644	219	218	2	2022-07-31	4	4.00	110.00	130.00	499.20	76.80
10639	645	220	549	2	2022-03-03	1	5.00	10.00	10.00	9.50	0.00
10640	646	221	550	2	2022-08-16	2	3.00	190.00	210.00	407.40	38.80
10641	647	222	551	2	2022-02-03	5	3.00	20.00	30.00	145.50	48.50
10642	648	222	552	2	2022-11-14	2	4.00	30.00	30.00	57.60	0.00
10643	649	223	346	1	2022-07-26	4	5.00	10.00	10.00	38.00	0.00
10644	650	223	173	1	2023-08-29	3	4.00	270.00	300.00	864.00	86.40
10645	651	223	553	1	2022-06-20	4	3.00	290.00	320.00	1241.60	116.40
10646	652	126	68	2	2023-04-28	10	4.00	350.00	380.00	3648.00	288.00
10647	653	49	63	2	2022-06-10	2	4.00	90.00	100.00	192.00	19.20
10648	654	49	554	2	2023-02-20	8	5.00	80.00	100.00	760.00	152.00
10649	655	51	555	2	2022-07-04	2	2.00	90.00	110.00	215.60	39.20
10650	656	51	556	2	2022-01-06	2	5.00	0.00	0.00	0.00	0.00
10651	657	51	557	2	2023-09-24	2	3.00	110.00	130.00	252.20	38.80
10652	658	224	446	7	2022-05-31	2	2.00	560.00	700.00	1372.00	274.40
10653	659	224	69	7	2022-07-01	2	5.00	0.00	0.00	0.00	0.00
10654	660	225	519	2	2023-07-04	7	2.00	890.00	1000.00	6860.00	754.60
10655	661	225	558	2	2023-09-05	14	2.00	600.00	720.00	9878.40	1646.40
10656	662	225	115	2	2023-02-15	5	4.00	850.00	920.00	4416.00	336.00
10657	663	225	110	2	2022-08-31	3	4.00	0.00	0.00	0.00	0.00
10658	664	213	197	2	2022-03-15	5	5.00	400.00	460.00	2185.00	285.00
10659	665	226	111	7	2023-11-08	3	2.00	10.00	10.00	29.40	0.00
10660	666	227	559	1	2023-01-16	3	5.00	20.00	20.00	57.00	0.00
10661	667	227	259	1	2023-07-24	3	3.00	80.00	90.00	261.90	29.10
10662	668	227	560	1	2022-12-26	3	5.00	320.00	380.00	1083.00	171.00
10663	669	228	561	5	2023-01-15	5	5.00	20.00	30.00	142.50	47.50
10664	670	229	562	2	2022-06-05	3	2.00	20.00	20.00	58.80	0.00
10665	671	229	563	2	2023-11-04	1	5.00	100.00	110.00	104.50	9.50
10666	672	229	127	2	2022-08-08	8	5.00	30.00	40.00	304.00	76.00
10667	673	230	564	2	2023-02-18	5	5.00	20.00	20.00	95.00	0.00
10668	674	167	565	5	2023-10-05	3	3.00	50.00	60.00	174.60	29.10
10669	675	167	566	5	2023-04-20	5	4.00	40.00	40.00	192.00	0.00
10670	676	167	218	5	2023-11-08	3	2.00	90.00	100.00	294.00	29.40
10671	677	231	567	2	2022-01-05	3	4.00	0.00	0.00	0.00	0.00
10672	678	231	568	2	2023-11-16	3	5.00	20.00	30.00	85.50	28.50
10673	679	231	569	2	2023-04-25	3	3.00	70.00	80.00	232.80	29.10
10674	680	231	570	2	2023-09-05	3	2.00	160.00	180.00	529.20	58.80
10675	681	104	571	2	2022-03-27	3	4.00	10.00	10.00	28.80	0.00
10676	682	104	572	2	2023-05-17	2	5.00	50.00	60.00	114.00	19.00
10677	683	104	457	2	2022-09-23	4	3.00	60.00	70.00	271.60	38.80
10678	684	232	573	7	2023-02-05	4	2.00	7280.00	8000.00	31360.00	2822.40
10679	685	232	550	7	2022-02-08	2	3.00	150.00	170.00	329.80	38.80
10680	686	159	332	5	2023-12-03	3	5.00	390.00	480.00	1368.00	256.50
10681	687	159	574	5	2023-07-15	2	2.00	10.00	10.00	19.60	0.00
10682	688	159	89	5	2022-01-07	3	3.00	20.00	20.00	58.20	0.00
10683	689	134	575	2	2022-12-27	2	3.00	160.00	190.00	368.60	58.20
10684	690	233	576	1	2022-02-25	1	5.00	90.00	100.00	95.00	9.50
10685	691	233	12	1	2022-04-02	1	2.00	240.00	280.00	274.40	39.20
10686	692	233	577	1	2023-07-19	3	2.00	40.00	40.00	117.60	0.00
10687	693	234	578	2	2022-07-14	1	5.00	140.00	170.00	161.50	28.50
10688	694	234	579	2	2022-09-29	5	3.00	30.00	30.00	145.50	0.00
10689	695	235	291	5	2022-02-18	8	4.00	170.00	200.00	1536.00	230.40
10690	696	235	580	5	2023-08-22	4	4.00	40.00	50.00	192.00	38.40
10691	697	235	82	5	2023-12-01	7	4.00	180.00	200.00	1344.00	134.40
10692	698	235	581	5	2022-03-24	4	3.00	80.00	100.00	388.00	77.60
10693	699	235	582	5	2023-01-14	1	2.00	0.00	0.00	0.00	0.00
10694	700	235	583	5	2023-05-13	2	3.00	20.00	20.00	38.80	0.00
10695	701	235	305	5	2022-09-15	3	5.00	0.00	0.00	0.00	0.00
10696	702	236	192	2	2023-01-18	3	3.00	20.00	20.00	58.20	0.00
10697	703	237	584	1	2022-04-27	3	4.00	190.00	210.00	604.80	57.60
10698	704	206	585	2	2023-08-29	3	2.00	340.00	370.00	1087.80	88.20
10699	705	238	586	2	2022-05-18	2	2.00	10.00	10.00	19.60	0.00
10700	706	238	587	2	2023-10-14	5	3.00	140.00	170.00	824.50	145.50
10701	707	238	453	2	2023-02-19	1	3.00	20.00	20.00	19.40	0.00
10702	708	134	247	5	2022-12-10	4	4.00	100.00	120.00	460.80	76.80
10703	709	134	588	5	2023-04-17	5	5.00	740.00	880.00	4180.00	665.00
10704	710	134	348	5	2022-11-04	8	3.00	40.00	50.00	388.00	77.60
10705	711	82	418	5	2022-11-30	1	4.00	50.00	60.00	57.60	9.60
10706	712	239	589	2	2022-06-06	4	4.00	20.00	20.00	76.80	0.00
10707	713	240	590	2	2023-08-20	6	2.00	240.00	280.00	1646.40	235.20
10708	714	240	349	2	2023-01-14	2	4.00	290.00	310.00	595.20	38.40
10709	715	240	591	2	2022-04-21	3	5.00	260.00	300.00	855.00	114.00
10710	716	153	592	1	2022-06-07	5	3.00	20.00	20.00	97.00	0.00
10711	717	23	528	5	2022-05-25	2	5.00	10.00	10.00	19.00	0.00
10712	718	76	593	2	2023-02-01	3	3.00	90.00	100.00	291.00	29.10
10713	719	241	445	2	2022-10-25	3	2.00	60.00	60.00	176.40	0.00
10714	720	241	391	2	2022-07-24	6	4.00	60.00	70.00	403.20	57.60
10715	721	179	594	2	2022-05-25	3	5.00	140.00	150.00	427.50	28.50
10716	722	242	595	2	2023-08-09	3	2.00	1370.00	1650.00	4851.00	823.20
10717	723	242	596	2	2023-09-09	3	5.00	260.00	300.00	855.00	114.00
10718	724	243	597	2	2022-10-06	5	4.00	120.00	130.00	624.00	48.00
10719	725	244	598	2	2023-07-20	7	2.00	40.00	50.00	343.00	68.60
10720	726	132	599	2	2022-09-04	2	3.00	20.00	20.00	38.80	0.00
10721	727	132	600	2	2022-03-29	1	5.00	50.00	60.00	57.00	9.50
10722	728	245	601	5	2022-10-07	8	3.00	160.00	180.00	1396.80	155.20
10723	729	245	602	5	2022-07-06	2	3.00	350.00	400.00	776.00	97.00
10724	730	245	603	5	2022-12-27	3	4.00	30.00	30.00	86.40	0.00
10725	731	245	229	5	2022-02-06	3	3.00	490.00	540.00	1571.40	145.50
10726	732	245	396	5	2023-12-13	2	2.00	10.00	10.00	19.60	0.00
10727	733	246	460	2	2022-09-08	3	2.00	210.00	240.00	705.60	88.20
10728	734	246	604	2	2022-11-13	3	5.00	170.00	180.00	513.00	28.50
10729	735	246	351	2	2023-02-21	6	3.00	80.00	100.00	582.00	116.40
10730	736	246	45	2	2022-08-13	4	5.00	30.00	30.00	114.00	0.00
10731	737	246	605	2	2023-06-25	1	3.00	80.00	80.00	77.60	0.00
10732	738	246	606	2	2023-05-18	5	2.00	20.00	20.00	98.00	0.00
10733	739	152	607	2	2023-01-27	2	2.00	50.00	50.00	98.00	0.00
10734	740	247	608	2	2022-11-21	3	3.00	10.00	10.00	29.10	0.00
10735	741	247	419	2	2022-06-24	3	2.00	250.00	270.00	793.80	58.80
10736	742	247	609	2	2022-09-21	2	5.00	0.00	0.00	0.00	0.00
10737	743	89	506	2	2022-04-16	5	5.00	50.00	50.00	237.50	0.00
10738	744	89	250	2	2022-04-26	1	4.00	0.00	0.00	0.00	0.00
10739	745	89	610	2	2023-12-08	1	3.00	0.00	0.00	0.00	0.00
10740	746	89	611	2	2022-08-23	4	4.00	50.00	60.00	230.40	38.40
10741	747	248	224	7	2022-01-16	10	3.00	480.00	570.00	5529.00	873.00
10742	748	248	436	7	2022-11-14	4	4.00	340.00	360.00	1382.40	76.80
10743	749	249	612	1	2023-02-11	1	4.00	10.00	10.00	9.60	0.00
10744	750	250	613	2	2022-11-17	3	3.00	50.00	60.00	174.60	29.10
10745	751	250	614	2	2022-11-27	11	3.00	130.00	160.00	1707.20	320.10
10746	752	250	360	2	2022-08-05	7	4.00	60.00	60.00	403.20	0.00
10747	753	250	615	2	2023-07-25	1	2.00	0.00	0.00	0.00	0.00
10748	754	111	616	5	2023-10-14	3	3.00	1020.00	1200.00	3492.00	523.80
10749	755	234	562	2	2023-05-13	4	4.00	70.00	80.00	307.20	38.40
10750	756	251	617	2	2023-05-02	4	2.00	350.00	380.00	1489.60	117.60
10751	757	252	577	2	2022-02-18	2	5.00	20.00	20.00	38.00	0.00
10752	758	252	539	2	2023-06-24	4	4.00	100.00	120.00	460.80	76.80
10753	759	253	521	2	2022-06-15	3	2.00	10.00	10.00	29.40	0.00
10754	760	254	127	2	2022-10-28	4	4.00	20.00	20.00	76.80	0.00
10755	761	27	491	2	2023-07-20	9	5.00	60.00	60.00	513.00	0.00
10756	762	255	618	2	2023-10-04	3	5.00	10.00	10.00	28.50	0.00
10757	763	51	161	2	2023-11-01	3	3.00	90.00	110.00	320.10	58.20
10758	764	256	153	1	2023-09-27	2	2.00	10.00	10.00	19.60	0.00
10759	765	256	619	1	2023-08-11	3	5.00	50.00	50.00	142.50	0.00
10760	766	256	620	1	2023-05-05	6	5.00	530.00	650.00	3705.00	684.00
10761	767	256	621	1	2023-05-06	3	3.00	10.00	10.00	29.10	0.00
10762	768	256	622	1	2022-08-10	6	3.00	540.00	570.00	3317.40	174.60
10763	769	124	623	2	2023-09-24	2	4.00	280.00	310.00	595.20	57.60
10764	770	121	624	2	2022-08-26	2	2.00	570.00	640.00	1254.40	137.20
10765	771	257	625	2	2022-01-24	2	4.00	20.00	20.00	38.40	0.00
10766	772	257	303	2	2022-08-13	3	2.00	170.00	210.00	617.40	117.60
10767	773	257	626	2	2022-03-13	5	5.00	30.00	30.00	142.50	0.00
10768	774	257	9	2	2023-03-09	1	3.00	10.00	10.00	9.70	0.00
10769	775	257	627	2	2023-03-30	2	4.00	40.00	40.00	76.80	0.00
10770	776	257	628	2	2022-12-19	7	2.00	30.00	30.00	205.80	0.00
10771	777	144	629	2	2022-02-14	7	4.00	30.00	30.00	201.60	0.00
10772	778	258	630	5	2022-07-06	3	2.00	440.00	540.00	1587.60	294.00
10773	779	258	369	5	2022-05-21	3	5.00	50.00	60.00	171.00	28.50
10774	780	258	359	5	2023-03-05	4	4.00	20.00	20.00	76.80	0.00
10775	781	258	631	5	2023-07-05	1	5.00	0.00	0.00	0.00	0.00
10776	782	51	411	1	2023-02-27	5	5.00	20.00	30.00	142.50	47.50
10777	783	51	47	1	2022-02-03	2	4.00	20.00	20.00	38.40	0.00
10778	784	51	632	1	2022-04-28	1	5.00	40.00	40.00	38.00	0.00
10779	785	51	633	1	2023-11-09	2	3.00	50.00	50.00	97.00	0.00
10780	786	259	634	2	2022-04-05	3	4.00	160.00	190.00	547.20	86.40
10781	787	260	635	1	2023-04-01	2	2.00	20.00	20.00	39.20	0.00
10782	788	260	636	2	2023-06-07	2	3.00	290.00	350.00	679.00	116.40
10783	789	261	380	2	2023-02-12	4	4.00	110.00	140.00	537.60	115.20
10784	790	261	422	2	2022-07-25	1	3.00	20.00	20.00	19.40	0.00
10785	791	261	637	2	2023-04-07	8	4.00	30.00	40.00	307.20	76.80
10786	792	261	638	2	2022-04-09	3	2.00	280.00	330.00	970.20	147.00
10787	793	262	639	7	2022-05-14	5	5.00	1170.00	1360.00	6460.00	902.50
10788	794	152	640	2	2023-11-27	2	2.00	10.00	10.00	19.60	0.00
10789	795	152	363	2	2023-03-11	4	4.00	20.00	20.00	76.80	0.00
10790	796	41	615	2	2023-06-18	7	4.00	20.00	20.00	134.40	0.00
10791	797	263	641	5	2023-02-15	7	2.00	110.00	130.00	891.80	137.20
10792	798	263	13	5	2023-04-14	2	4.00	10.00	10.00	19.20	0.00
10793	799	263	642	5	2022-11-06	7	2.00	20.00	20.00	137.20	0.00
10794	800	264	475	2	2023-11-26	5	3.00	260.00	280.00	1358.00	97.00
10795	801	248	643	5	2023-05-24	1	5.00	20.00	20.00	19.00	0.00
10796	802	248	234	5	2023-12-25	2	4.00	210.00	220.00	422.40	19.20
10797	803	25	644	1	2023-09-23	9	4.00	320.00	360.00	3110.40	345.60
10798	804	265	645	2	2022-10-11	2	3.00	10.00	10.00	19.40	0.00
10799	805	37	646	5	2022-02-23	2	5.00	20.00	20.00	38.00	0.00
10800	806	88	647	2	2022-10-17	3	4.00	40.00	40.00	115.20	0.00
10801	807	88	648	2	2023-04-07	4	4.00	1700.00	1980.00	7603.20	1075.20
10802	808	266	379	5	2023-05-26	2	5.00	30.00	30.00	57.00	0.00
10803	809	266	649	5	2023-07-01	3	4.00	130.00	150.00	432.00	57.60
10804	810	267	650	5	2023-01-27	4	4.00	10.00	10.00	38.40	0.00
10805	811	267	258	5	2022-04-30	5	5.00	1090.00	1300.00	6175.00	997.50
10806	812	267	651	5	2022-04-04	4	5.00	190.00	210.00	798.00	76.00
10807	813	267	554	5	2023-07-28	2	5.00	20.00	30.00	57.00	19.00
10808	814	268	646	7	2023-12-22	2	2.00	20.00	20.00	39.20	0.00
10809	815	268	652	7	2023-10-13	7	5.00	1270.00	1400.00	9310.00	864.50
10810	816	269	181	5	2022-09-12	8	4.00	50.00	50.00	384.00	0.00
10811	817	12	653	2	2022-04-15	1	5.00	10.00	10.00	9.50	0.00
10812	818	12	89	2	2023-02-23	8	3.00	30.00	40.00	310.40	77.60
10813	819	12	654	2	2022-06-29	3	2.00	0.00	0.00	0.00	0.00
10814	820	12	655	2	2023-11-09	5	5.00	1030.00	1230.00	5842.50	950.00
10815	821	12	656	2	2022-11-18	3	2.00	30.00	30.00	88.20	0.00
10816	822	12	657	2	2023-07-06	4	4.00	290.00	340.00	1305.60	192.00
10817	823	270	658	2	2022-10-13	3	2.00	210.00	240.00	705.60	88.20
10818	824	270	608	2	2023-08-31	2	3.00	10.00	10.00	19.40	0.00
10819	825	152	659	2	2022-04-08	4	4.00	60.00	70.00	268.80	38.40
10820	826	152	202	2	2023-11-23	3	4.00	160.00	170.00	489.60	28.80
10821	827	271	660	2	2023-06-21	7	2.00	40.00	40.00	274.40	0.00
10822	828	271	661	2	2023-10-24	4	4.00	30.00	40.00	153.60	38.40
10823	829	271	662	2	2023-12-23	2	3.00	20.00	20.00	38.80	0.00
10824	830	272	663	1	2022-04-23	2	4.00	250.00	300.00	576.00	96.00
10825	831	272	664	1	2022-12-12	3	4.00	150.00	180.00	518.40	86.40
10826	832	272	665	1	2023-05-30	2	4.00	180.00	190.00	364.80	19.20
10827	833	272	666	1	2023-03-21	1	5.00	60.00	70.00	66.50	9.50
10828	834	273	667	2	2022-11-18	2	2.00	30.00	40.00	78.40	19.60
10829	835	273	668	2	2023-07-30	2	4.00	20.00	20.00	38.40	0.00
10830	836	273	669	2	2022-08-01	1	3.00	220.00	270.00	261.90	48.50
10831	837	231	670	1	2023-04-25	4	2.00	40.00	50.00	196.00	39.20
10832	838	274	671	2	2023-10-29	2	2.00	10.00	10.00	19.60	0.00
10833	839	275	403	2	2022-11-08	3	4.00	20.00	20.00	57.60	0.00
10834	840	49	627	2	2023-03-10	3	3.00	50.00	60.00	174.60	29.10
10835	841	49	672	2	2023-06-29	4	5.00	10.00	10.00	38.00	0.00
10836	842	49	673	2	2022-12-26	4	2.00	170.00	190.00	744.80	78.40
10837	843	2	674	5	2023-12-22	4	5.00	30.00	40.00	152.00	38.00
10838	844	2	675	5	2023-05-01	4	2.00	30.00	30.00	117.60	0.00
10839	845	2	676	5	2022-03-07	2	5.00	10.00	10.00	19.00	0.00
10840	846	2	677	5	2023-06-20	2	5.00	10.00	10.00	19.00	0.00
10841	847	226	180	2	2022-02-10	7	3.00	70.00	80.00	543.20	67.90
10842	848	226	269	2	2023-12-21	3	3.00	230.00	290.00	843.90	174.60
10843	849	276	678	2	2023-06-21	4	2.00	40.00	50.00	196.00	39.20
10844	850	277	679	2	2023-04-22	7	3.00	110.00	120.00	814.80	67.90
10845	851	278	680	1	2022-04-30	2	2.00	10.00	10.00	19.60	0.00
10846	852	278	681	1	2022-02-10	6	5.00	30.00	40.00	228.00	57.00
10847	853	159	291	2	2022-03-28	6	2.00	160.00	190.00	1117.20	176.40
10848	854	134	643	2	2023-12-11	2	4.00	30.00	40.00	76.80	19.20
10849	855	134	460	2	2023-01-20	3	2.00	190.00	240.00	705.60	147.00
10850	856	134	682	2	2023-08-27	2	5.00	30.00	40.00	76.00	19.00
10851	857	134	683	2	2022-07-05	10	2.00	90.00	100.00	980.00	98.00
10852	858	134	684	2	2023-03-22	2	4.00	20.00	20.00	38.40	0.00
10853	859	279	230	2	2022-08-27	1	4.00	10.00	10.00	9.60	0.00
10854	860	279	295	2	2023-06-05	2	3.00	10.00	10.00	19.40	0.00
10855	861	37	328	2	2022-07-02	2	4.00	10.00	10.00	19.20	0.00
10856	862	37	685	2	2022-04-06	2	4.00	20.00	20.00	38.40	0.00
10857	863	251	686	1	2023-07-26	6	2.00	170.00	190.00	1117.20	117.60
10858	864	251	687	1	2022-11-02	2	4.00	10.00	10.00	19.20	0.00
10859	865	251	688	1	2022-01-30	2	2.00	50.00	60.00	117.60	19.60
10860	866	280	689	2	2022-04-01	1	4.00	0.00	0.00	0.00	0.00
10861	867	280	690	2	2023-09-06	1	4.00	40.00	50.00	48.00	9.60
10862	868	59	691	5	2022-12-28	4	5.00	20.00	20.00	76.00	0.00
10863	869	281	692	2	2023-04-27	6	2.00	30.00	40.00	235.20	58.80
10864	870	282	693	5	2023-05-12	5	2.00	910.00	1140.00	5586.00	1127.00
10865	871	282	496	5	2022-02-28	3	5.00	260.00	280.00	798.00	57.00
10866	872	283	694	5	2022-07-11	3	3.00	30.00	30.00	87.30	0.00
10867	873	31	253	2	2022-06-01	2	2.00	10.00	10.00	19.60	0.00
10868	874	31	413	2	2022-03-21	7	5.00	100.00	110.00	731.50	66.50
10869	875	47	695	2	2022-02-07	5	4.00	160.00	190.00	912.00	144.00
10870	876	284	217	2	2023-04-04	3	2.00	280.00	320.00	940.80	117.60
10871	877	284	247	2	2023-03-23	1	3.00	30.00	30.00	29.10	0.00
10872	878	284	696	2	2023-06-13	3	4.00	330.00	370.00	1065.60	115.20
10873	879	285	697	2	2022-12-18	4	2.00	10.00	10.00	39.20	0.00
10874	880	126	698	1	2022-06-30	3	3.00	60.00	70.00	203.70	29.10
10875	881	126	158	1	2022-11-30	5	2.00	1170.00	1240.00	6076.00	343.00
10876	882	30	422	2	2023-07-11	2	2.00	30.00	30.00	58.80	0.00
10877	883	10	582	7	2022-05-10	4	4.00	10.00	10.00	38.40	0.00
10878	884	286	546	5	2022-06-03	5	2.00	20.00	30.00	147.00	49.00
10879	885	181	699	2	2022-11-18	2	5.00	20.00	20.00	38.00	0.00
10880	886	156	700	1	2022-07-18	3	4.00	10.00	10.00	28.80	0.00
10881	887	287	701	2	2023-02-07	12	5.00	70.00	80.00	912.00	114.00
10882	888	288	62	2	2022-07-16	7	5.00	30.00	40.00	266.00	66.50
10883	889	60	372	2	2023-10-12	6	2.00	30.00	30.00	176.40	0.00
10884	890	289	702	2	2022-01-11	5	3.00	130.00	150.00	727.50	97.00
10885	891	289	411	2	2022-02-10	3	4.00	40.00	50.00	144.00	28.80
10886	892	286	703	5	2022-05-03	1	4.00	0.00	0.00	0.00	0.00
10887	893	286	704	5	2023-04-07	4	2.00	20.00	20.00	78.40	0.00
10888	894	286	705	5	2023-02-07	8	2.00	510.00	540.00	4233.60	235.20
10889	895	60	331	5	2022-12-05	7	3.00	130.00	160.00	1086.40	203.70
10890	896	60	706	5	2022-05-13	3	2.00	60.00	70.00	205.80	29.40
10891	897	141	707	1	2023-11-20	2	3.00	20.00	20.00	38.80	0.00
10892	898	166	430	2	2022-10-17	7	2.00	90.00	100.00	686.00	68.60
10893	899	290	708	1	2023-02-06	8	3.00	50.00	50.00	388.00	0.00
10894	900	291	709	5	2022-10-20	2	3.00	10.00	10.00	19.40	0.00
10895	901	292	710	5	2023-05-20	5	5.00	10.00	10.00	47.50	0.00
10896	902	292	711	5	2023-09-09	4	3.00	20.00	20.00	77.60	0.00
10897	903	194	150	5	2022-06-28	3	2.00	260.00	320.00	940.80	176.40
10898	904	4	712	2	2023-12-01	3	2.00	20.00	20.00	58.80	0.00
10899	905	4	572	2	2022-05-25	2	2.00	50.00	60.00	117.60	19.60
10900	906	4	713	2	2022-04-23	2	2.00	10.00	10.00	19.60	0.00
10901	907	31	714	2	2023-11-26	4	4.00	280.00	320.00	1228.80	153.60
10902	908	31	715	2	2022-07-25	7	4.00	70.00	90.00	604.80	134.40
10903	909	31	716	2	2023-07-06	3	3.00	40.00	50.00	145.50	29.10
10904	910	149	717	2	2023-03-30	4	3.00	1010.00	1200.00	4656.00	737.20
10905	911	149	718	2	2023-12-31	7	4.00	1830.00	1930.00	12969.60	672.00
10906	912	149	719	2	2022-06-08	2	3.00	320.00	350.00	679.00	58.20
10907	913	293	346	2	2023-06-21	6	5.00	20.00	20.00	114.00	0.00
10908	914	269	268	5	2023-05-09	1	5.00	40.00	50.00	47.50	9.50
10909	915	269	405	5	2023-05-29	9	4.00	130.00	140.00	1209.60	86.40
10910	916	162	720	2	2023-03-03	2	4.00	90.00	100.00	192.00	19.20
10911	917	162	464	2	2023-05-17	4	5.00	680.00	800.00	3040.00	456.00
10912	918	162	277	2	2022-12-18	3	2.00	10.00	10.00	29.40	0.00
10913	919	93	634	2	2022-06-28	3	4.00	130.00	150.00	432.00	57.60
10914	920	93	721	2	2022-03-13	1	5.00	10.00	10.00	9.50	0.00
10915	921	294	577	2	2022-12-18	2	4.00	20.00	20.00	38.40	0.00
10916	922	31	722	2	2022-12-07	3	5.00	80.00	90.00	256.50	28.50
10917	923	31	723	2	2022-03-17	1	2.00	20.00	20.00	19.60	0.00
10918	924	31	724	2	2023-03-13	5	4.00	340.00	410.00	1968.00	336.00
10919	925	213	116	2	2022-08-04	2	3.00	720.00	840.00	1629.60	232.80
10920	926	130	725	5	2022-05-23	3	3.00	20.00	20.00	58.20	0.00
10921	927	130	726	5	2023-01-23	5	3.00	210.00	250.00	1212.50	194.00
10922	928	295	333	2	2022-05-23	4	3.00	40.00	50.00	194.00	38.80
10923	929	295	337	2	2022-02-22	2	5.00	20.00	30.00	57.00	19.00
10924	930	296	488	5	2022-02-23	3	3.00	10.00	10.00	29.10	0.00
10925	931	296	727	5	2022-08-08	3	2.00	90.00	90.00	264.60	0.00
10926	932	296	610	5	2022-06-27	3	2.00	10.00	10.00	29.40	0.00
10927	933	12	728	2	2022-09-04	3	4.00	10.00	10.00	28.80	0.00
10928	934	285	729	2	2023-09-09	8	4.00	40.00	50.00	384.00	76.80
10929	935	285	730	2	2022-07-18	6	3.00	20.00	30.00	174.60	58.20
10930	936	285	681	2	2022-05-12	3	3.00	20.00	20.00	58.20	0.00
10931	937	285	138	2	2023-12-13	2	3.00	410.00	450.00	873.00	77.60
10932	938	297	332	5	2022-10-11	1	3.00	140.00	160.00	155.20	19.40
10933	939	298	731	2	2023-05-31	2	4.00	10.00	10.00	19.20	0.00
10934	940	298	732	2	2022-12-18	4	3.00	120.00	130.00	504.40	38.80
10935	941	111	733	5	2023-07-11	2	3.00	20.00	20.00	38.80	0.00
10936	942	299	734	2	2023-02-15	2	4.00	10.00	10.00	19.20	0.00
10937	943	299	4	2	2023-04-06	4	5.00	900.00	1110.00	4218.00	798.00
10938	944	203	512	2	2023-12-25	5	4.00	30.00	30.00	144.00	0.00
10939	945	203	735	2	2023-07-14	3	5.00	500.00	540.00	1539.00	114.00
10940	946	203	736	2	2022-03-03	5	4.00	150.00	170.00	816.00	96.00
10941	947	193	737	5	2023-04-20	3	3.00	320.00	390.00	1134.90	203.70
10942	948	285	738	2	2022-06-09	7	5.00	420.00	520.00	3458.00	665.00
10943	949	285	221	2	2022-06-15	6	2.00	810.00	1010.00	5938.80	1176.00
10944	950	285	739	2	2022-07-09	12	5.00	1950.00	2070.00	23598.00	1368.00
10945	951	285	740	2	2022-03-19	3	3.00	20.00	20.00	58.20	0.00
10946	952	285	219	2	2022-05-14	6	2.00	20.00	30.00	176.40	58.80
10947	953	130	741	2	2023-04-23	4	3.00	30.00	30.00	116.40	0.00
10948	954	300	208	2	2022-08-03	2	2.00	30.00	30.00	58.80	0.00
10949	955	300	267	2	2023-11-15	2	5.00	70.00	80.00	152.00	19.00
10950	956	159	55	2	2022-02-07	5	4.00	160.00	170.00	816.00	48.00
10951	957	55	688	1	2022-08-20	1	4.00	30.00	30.00	28.80	0.00
10952	958	55	742	1	2022-06-29	2	5.00	0.00	0.00	0.00	0.00
10953	959	55	743	1	2022-10-23	3	2.00	20.00	20.00	58.80	0.00
10954	960	301	744	7	2022-05-15	2	4.00	190.00	200.00	384.00	19.20
10955	961	111	229	2	2023-09-04	2	2.00	260.00	320.00	627.20	117.60
10956	962	302	745	2	2023-10-23	2	2.00	10.00	10.00	19.60	0.00
10957	963	111	467	5	2023-08-16	2	5.00	20.00	20.00	38.00	0.00
10958	964	303	746	1	2022-09-13	2	5.00	0.00	0.00	0.00	0.00
10959	965	304	747	5	2022-04-30	2	3.00	10.00	10.00	19.40	0.00
10960	966	304	370	5	2022-05-06	3	5.00	40.00	40.00	114.00	0.00
10961	967	304	748	5	2023-07-11	2	3.00	10.00	10.00	19.40	0.00
10962	968	304	749	5	2023-07-05	4	4.00	180.00	190.00	729.60	38.40
10963	969	304	746	5	2023-03-19	3	5.00	10.00	10.00	28.50	0.00
10964	970	304	750	5	2022-10-25	3	5.00	420.00	500.00	1425.00	228.00
10965	971	71	751	1	2023-12-15	6	4.00	110.00	130.00	748.80	115.20
10966	972	71	303	1	2022-05-29	3	4.00	110.00	120.00	345.60	28.80
10967	973	71	583	1	2022-06-15	2	4.00	20.00	20.00	38.40	0.00
10968	974	71	301	1	2023-05-17	3	5.00	20.00	30.00	85.50	28.50
10969	975	304	462	1	2022-06-26	7	4.00	150.00	160.00	1075.20	67.20
10970	976	304	352	1	2023-11-01	3	5.00	70.00	80.00	228.00	28.50
10971	977	113	752	2	2023-02-03	2	4.00	0.00	0.00	0.00	0.00
10972	978	242	156	5	2023-04-16	2	3.00	2850.00	3060.00	5936.40	407.40
10973	979	201	521	5	2023-11-15	2	2.00	0.00	0.00	0.00	0.00
10974	980	305	753	5	2023-07-27	3	2.00	30.00	30.00	88.20	0.00
10975	981	134	638	2	2022-04-25	6	5.00	570.00	600.00	3420.00	171.00
10976	982	157	754	1	2023-03-31	1	3.00	0.00	0.00	0.00	0.00
10977	983	157	755	1	2023-02-01	2	5.00	460.00	560.00	1064.00	190.00
10978	984	157	663	1	2022-10-16	5	2.00	550.00	600.00	2940.00	245.00
10979	985	306	640	2	2023-03-27	2	2.00	10.00	10.00	19.60	0.00
10980	986	306	756	2	2022-04-03	4	5.00	20.00	30.00	114.00	38.00
10981	987	306	757	2	2023-12-25	3	4.00	320.00	340.00	979.20	57.60
10982	988	188	758	7	2023-10-28	2	3.00	0.00	0.00	0.00	0.00
10983	989	290	576	2	2023-11-14	5	4.00	490.00	520.00	2496.00	144.00
10984	990	290	759	2	2023-02-19	3	5.00	20.00	20.00	57.00	0.00
10985	991	307	285	1	2023-08-14	5	5.00	1060.00	1170.00	5557.50	522.50
10986	992	104	625	5	2023-07-16	2	2.00	10.00	10.00	19.60	0.00
10987	993	308	264	5	2022-06-24	3	5.00	10.00	10.00	28.50	0.00
10988	994	308	760	5	2022-06-29	5	2.00	120.00	150.00	735.00	147.00
10989	995	309	761	2	2023-03-24	7	2.00	2200.00	2720.00	18659.20	3567.20
10990	996	309	639	2	2022-02-10	3	2.00	520.00	620.00	1822.80	294.00
10991	997	1	762	2	2023-03-25	1	4.00	10.00	10.00	9.60	0.00
10992	998	1	763	2	2023-02-17	3	3.00	30.00	40.00	116.40	29.10
10993	999	1	764	2	2023-11-25	5	2.00	20.00	20.00	98.00	0.00
10994	1000	1	284	2	2023-09-05	7	3.00	30.00	30.00	203.70	0.00
10995	1001	310	667	2	2022-08-29	2	5.00	40.00	40.00	76.00	0.00
10996	1002	104	765	7	2023-09-02	7	4.00	2010.00	2310.00	15523.20	2016.00
10997	1003	104	258	7	2022-10-08	7	4.00	960.00	1090.00	7324.80	873.60
10998	1004	104	748	7	2023-12-23	3	2.00	20.00	20.00	58.80	0.00
10999	1005	311	766	2	2022-08-03	3	2.00	450.00	480.00	1411.20	88.20
11000	1006	312	695	2	2023-08-03	3	4.00	110.00	120.00	345.60	28.80
11001	1007	313	112	5	2022-10-17	3	4.00	10.00	10.00	28.80	0.00
11002	1008	313	767	5	2023-07-17	3	4.00	0.00	0.00	0.00	0.00
11003	1009	314	423	2	2022-11-11	5	3.00	40.00	40.00	194.00	0.00
11004	1010	194	161	5	2023-03-14	2	2.00	80.00	100.00	196.00	39.20
11005	1011	103	768	5	2022-01-30	4	5.00	140.00	150.00	570.00	38.00
11006	1012	315	29	1	2023-12-21	3	3.00	140.00	160.00	465.60	58.20
11007	1013	315	769	1	2022-04-14	1	4.00	10.00	10.00	9.60	0.00
11008	1014	6	210	1	2022-06-22	13	3.00	1410.00	1620.00	20428.20	2648.10
11009	1015	6	770	1	2023-06-21	1	2.00	90.00	100.00	98.00	9.80
11010	1016	316	261	1	2023-03-07	5	5.00	30.00	30.00	142.50	0.00
11011	1017	213	771	2	2022-08-23	2	3.00	10.00	10.00	19.40	0.00
11012	1018	213	690	2	2023-08-26	3	2.00	130.00	160.00	470.40	88.20
11013	1019	213	772	2	2023-08-11	5	2.00	110.00	120.00	588.00	49.00
11014	1020	213	773	2	2023-07-14	5	5.00	490.00	600.00	2850.00	522.50
11015	1021	317	774	2	2023-03-20	3	3.00	20.00	20.00	58.20	0.00
11016	1022	317	775	2	2023-12-29	3	3.00	1080.00	1270.00	3695.70	552.90
11017	1023	317	776	2	2023-11-26	8	2.00	1240.00	1380.00	10819.20	1097.60
11018	1024	71	777	2	2023-03-09	2	4.00	10.00	10.00	19.20	0.00
11019	1025	179	778	5	2023-06-03	2	3.00	10.00	10.00	19.40	0.00
11020	1026	318	779	1	2023-09-16	3	2.00	20.00	20.00	58.80	0.00
11021	1027	318	780	1	2022-04-02	3	5.00	50.00	60.00	171.00	28.50
11022	1028	318	781	1	2022-08-05	2	2.00	20.00	20.00	39.20	0.00
11023	1029	123	259	2	2022-03-26	5	5.00	160.00	180.00	855.00	95.00
11024	1030	123	782	2	2023-06-26	3	2.00	160.00	200.00	588.00	117.60
11025	1031	123	464	2	2023-08-08	3	4.00	790.00	850.00	2448.00	172.80
11026	1032	123	94	2	2022-08-06	9	2.00	110.00	120.00	1058.40	88.20
11027	1033	123	783	2	2023-03-27	5	2.00	10.00	10.00	49.00	0.00
11028	1034	144	784	5	2023-05-02	3	4.00	20.00	20.00	57.60	0.00
11029	1035	144	237	5	2022-06-05	2	4.00	0.00	0.00	0.00	0.00
11030	1036	144	28	5	2022-10-10	3	4.00	10.00	10.00	28.80	0.00
11031	1037	319	785	2	2023-10-21	2	3.00	80.00	90.00	174.60	19.40
11032	1038	27	786	5	2023-01-24	3	4.00	30.00	40.00	115.20	28.80
11033	1039	320	787	5	2023-03-06	7	5.00	20.00	20.00	133.00	0.00
11034	1040	320	788	5	2022-04-19	3	4.00	30.00	30.00	86.40	0.00
11035	1041	321	617	2	2023-07-23	4	3.00	620.00	700.00	2716.00	310.40
11036	1042	134	789	1	2022-09-27	2	2.00	20.00	30.00	58.80	19.60
11037	1043	134	790	1	2023-06-27	3	4.00	680.00	720.00	2073.60	115.20
11038	1044	322	791	5	2022-12-11	5	3.00	10.00	10.00	48.50	0.00
11039	1045	322	792	5	2023-08-21	9	5.00	50.00	60.00	513.00	85.50
11040	1046	323	793	2	2022-05-03	14	4.00	230.00	250.00	3360.00	268.80
11041	1047	324	639	2	2022-09-24	5	5.00	1120.00	1360.00	6460.00	1140.00
11042	1048	324	102	2	2023-03-17	3	3.00	90.00	100.00	291.00	29.10
11043	1049	10	40	1	2023-03-23	12	3.00	930.00	1110.00	12920.40	2095.20
11044	1050	10	591	1	2023-07-08	1	2.00	90.00	100.00	98.00	9.80
11045	1051	325	794	5	2023-01-18	2	3.00	140.00	170.00	329.80	58.20
11046	1052	325	795	5	2022-09-26	2	4.00	10.00	10.00	19.20	0.00
11047	1053	325	796	5	2023-08-10	9	5.00	250.00	280.00	2394.00	256.50
11048	1054	44	797	2	2022-09-01	2	5.00	10.00	10.00	19.00	0.00
11049	1055	44	798	2	2023-06-16	2	4.00	100.00	110.00	211.20	19.20
11050	1056	44	142	2	2023-11-29	3	3.00	80.00	80.00	232.80	0.00
11051	1057	44	799	2	2022-12-21	4	4.00	10.00	10.00	38.40	0.00
11052	1058	326	800	2	2023-10-13	4	3.00	20.00	20.00	77.60	0.00
11053	1059	326	801	2	2022-05-22	2	2.00	60.00	70.00	137.20	19.60
11054	1060	282	802	2	2022-07-09	3	3.00	0.00	0.00	0.00	0.00
11055	1061	141	390	2	2022-04-11	2	2.00	100.00	110.00	215.60	19.60
11056	1062	327	552	2	2022-04-06	3	5.00	50.00	50.00	142.50	0.00
11057	1063	327	803	2	2022-05-29	7	4.00	10.00	10.00	67.20	0.00
11058	1064	327	347	2	2023-01-13	3	3.00	10.00	10.00	29.10	0.00
11059	1065	327	804	2	2022-12-26	3	3.00	110.00	120.00	349.20	29.10
11060	1066	327	805	2	2022-05-04	1	4.00	0.00	0.00	0.00	0.00
11061	1067	327	806	2	2023-06-04	5	4.00	50.00	60.00	288.00	48.00
11062	1068	37	65	5	2023-02-04	4	2.00	170.00	190.00	744.80	78.40
11063	1069	328	483	1	2023-09-07	1	2.00	0.00	0.00	0.00	0.00
11064	1070	282	302	2	2022-10-01	4	5.00	30.00	30.00	114.00	0.00
11065	1071	329	325	2	2022-01-30	7	3.00	20.00	20.00	135.80	0.00
11066	1072	330	315	2	2023-07-05	3	2.00	30.00	30.00	88.20	0.00
11067	1073	134	807	2	2022-08-27	2	3.00	10.00	10.00	19.40	0.00
11068	1074	193	808	2	2022-10-11	5	3.00	10.00	10.00	48.50	0.00
11069	1075	193	256	2	2022-05-04	7	3.00	0.00	0.00	0.00	0.00
11070	1076	193	809	2	2023-12-23	2	4.00	30.00	30.00	57.60	0.00
11071	1077	221	810	5	2023-04-28	7	4.00	30.00	40.00	268.80	67.20
11072	1078	203	811	1	2023-09-08	2	5.00	100.00	120.00	228.00	38.00
11073	1079	203	471	1	2023-06-29	3	2.00	30.00	30.00	88.20	0.00
11074	1080	203	481	1	2022-04-29	1	4.00	10.00	10.00	9.60	0.00
11075	1081	96	812	2	2022-08-10	4	5.00	20.00	20.00	76.00	0.00
11076	1082	96	813	2	2023-08-21	9	3.00	1000.00	1110.00	9690.30	960.30
11077	1083	331	617	2	2022-10-01	8	4.00	760.00	840.00	6451.20	614.40
11078	1084	331	814	2	2023-12-16	1	4.00	30.00	30.00	28.80	0.00
11079	1085	331	246	2	2023-12-09	2	3.00	320.00	360.00	698.40	77.60
11080	1086	331	815	2	2022-06-28	7	5.00	4360.00	4900.00	32585.00	3591.00
11081	1087	332	816	7	2022-02-15	1	5.00	10.00	10.00	9.50	0.00
11082	1088	333	174	1	2022-01-04	3	2.00	60.00	70.00	205.80	29.40
11083	1089	333	817	1	2023-12-30	1	2.00	0.00	0.00	0.00	0.00
11084	1090	334	297	2	2022-05-23	2	3.00	30.00	30.00	58.20	0.00
11085	1091	334	818	2	2022-07-13	2	2.00	60.00	70.00	137.20	19.60
11086	1092	287	819	2	2022-04-12	9	5.00	100.00	120.00	1026.00	171.00
11087	1093	287	820	2	2022-09-28	2	3.00	180.00	220.00	426.80	77.60
11088	1094	335	821	2	2023-10-25	5	4.00	20.00	30.00	144.00	48.00
11089	1095	335	160	2	2022-10-08	2	5.00	320.00	360.00	684.00	76.00
11090	1096	336	822	2	2022-10-06	7	2.00	320.00	350.00	2401.00	205.80
11091	1097	336	823	2	2023-04-09	7	3.00	40.00	40.00	271.60	0.00
11092	1098	19	824	5	2022-01-30	5	5.00	360.00	450.00	2137.50	427.50
11093	1099	337	825	5	2023-09-15	4	3.00	10.00	10.00	38.80	0.00
11094	1100	337	397	5	2022-10-18	3	3.00	10.00	10.00	29.10	0.00
11095	1101	337	826	5	2022-01-24	1	3.00	30.00	30.00	29.10	0.00
11096	1102	337	827	5	2022-04-17	3	3.00	10.00	10.00	29.10	0.00
11097	1103	188	308	2	2023-10-18	3	5.00	0.00	0.00	0.00	0.00
11098	1104	188	767	2	2023-09-08	3	4.00	0.00	0.00	0.00	0.00
11099	1105	338	828	2	2023-12-30	3	2.00	20.00	20.00	58.80	0.00
11100	1106	188	194	2	2023-11-19	6	2.00	80.00	100.00	588.00	117.60
11101	1107	188	397	2	2023-02-23	2	4.00	0.00	0.00	0.00	0.00
11102	1108	188	829	2	2023-09-03	5	2.00	10.00	10.00	49.00	0.00
11103	1109	188	830	2	2023-10-19	12	4.00	60.00	60.00	691.20	0.00
11104	1110	188	831	2	2023-01-02	3	2.00	30.00	40.00	117.60	29.40
11105	1111	188	832	2	2022-01-12	5	2.00	60.00	70.00	343.00	49.00
11106	1112	188	833	2	2022-07-18	2	5.00	10.00	10.00	19.00	0.00
11107	1113	188	99	2	2022-12-21	2	5.00	0.00	0.00	0.00	0.00
11108	1114	339	706	1	2023-07-10	2	3.00	40.00	50.00	97.00	19.40
11109	1115	339	834	1	2022-11-18	1	2.00	100.00	120.00	117.60	19.60
11110	1116	339	604	1	2022-08-28	2	5.00	110.00	120.00	228.00	19.00
11111	1117	111	366	1	2023-02-05	2	4.00	10.00	10.00	19.20	0.00
11112	1118	340	315	2	2022-06-16	5	5.00	230.00	280.00	1330.00	237.50
11113	1119	340	696	2	2023-07-26	5	3.00	530.00	620.00	3007.00	436.50
11114	1120	340	835	2	2023-02-03	2	4.00	0.00	0.00	0.00	0.00
11115	1121	340	662	2	2023-08-14	2	5.00	20.00	20.00	38.00	0.00
11116	1122	341	836	2	2022-07-03	7	4.00	600.00	700.00	4704.00	672.00
11117	1123	341	837	2	2022-02-08	7	3.00	20.00	20.00	135.80	0.00
11118	1124	341	77	2	2023-07-27	4	2.00	30.00	40.00	156.80	39.20
11119	1125	341	454	2	2023-08-09	3	5.00	10.00	10.00	28.50	0.00
11120	1126	341	838	2	2022-10-04	3	4.00	20.00	20.00	57.60	0.00
11121	1127	341	407	2	2022-01-29	3	5.00	900.00	1070.00	3049.50	484.50
11122	1128	342	401	2	2023-07-11	1	5.00	10.00	10.00	9.50	0.00
11123	1129	342	619	2	2022-08-05	6	3.00	80.00	100.00	582.00	116.40
11124	1130	30	839	2	2023-12-23	4	5.00	320.00	340.00	1292.00	76.00
11125	1131	30	840	2	2022-09-06	1	3.00	40.00	40.00	38.80	0.00
11126	1132	30	119	2	2022-02-11	5	5.00	60.00	60.00	285.00	0.00
11127	1133	343	261	5	2022-03-10	3	5.00	20.00	20.00	57.00	0.00
11128	1134	344	42	2	2022-07-12	4	2.00	110.00	120.00	470.40	39.20
11129	1135	344	841	2	2022-12-31	3	4.00	10.00	10.00	28.80	0.00
11130	1136	345	842	7	2023-11-22	3	4.00	70.00	90.00	259.20	57.60
11131	1137	346	843	1	2023-12-21	8	2.00	240.00	290.00	2273.60	392.00
11132	1138	346	552	1	2023-10-23	2	2.00	40.00	40.00	78.40	0.00
11133	1139	346	844	1	2023-12-02	2	4.00	20.00	20.00	38.40	0.00
11134	1140	346	502	1	2022-02-03	7	2.00	20.00	20.00	137.20	0.00
11135	1141	346	845	1	2022-10-04	2	3.00	20.00	20.00	38.80	0.00
11136	1142	70	744	2	2022-08-24	2	3.00	160.00	200.00	388.00	77.60
11137	1143	70	846	2	2022-11-01	4	3.00	10.00	10.00	38.80	0.00
11138	1144	70	273	2	2022-10-01	1	4.00	10.00	10.00	9.60	0.00
11139	1145	70	847	2	2022-05-28	2	3.00	640.00	690.00	1338.60	97.00
11140	1146	70	822	2	2022-10-07	1	2.00	50.00	60.00	58.80	9.80
11141	1147	347	848	7	2023-08-16	2	4.00	590.00	640.00	1228.80	96.00
11142	1148	347	849	7	2023-06-02	2	5.00	10.00	10.00	19.00	0.00
11143	1149	347	850	7	2022-11-24	2	5.00	10.00	10.00	19.00	0.00
11144	1150	347	851	7	2022-11-10	1	5.00	10.00	10.00	9.50	0.00
11145	1151	347	852	7	2023-01-28	2	5.00	560.00	600.00	1140.00	76.00
11146	1152	348	853	2	2023-06-02	6	5.00	10.00	10.00	57.00	0.00
11147	1153	349	854	2	2023-12-08	2	2.00	0.00	0.00	0.00	0.00
11148	1154	349	698	2	2022-12-24	7	5.00	140.00	160.00	1064.00	133.00
11149	1155	350	855	5	2022-11-12	2	4.00	110.00	120.00	230.40	19.20
11150	1156	350	856	5	2022-02-03	7	4.00	2060.00	2240.00	15052.80	1209.60
11151	1157	350	351	5	2022-09-25	3	5.00	50.00	60.00	171.00	28.50
11152	1158	350	343	5	2022-11-24	2	4.00	430.00	460.00	883.20	57.60
11153	1159	351	857	1	2023-08-23	1	4.00	180.00	200.00	192.00	19.20
11154	1160	42	644	2	2022-02-01	3	4.00	290.00	360.00	1036.80	201.60
11155	1161	42	69	2	2022-05-29	2	3.00	10.00	10.00	19.40	0.00
11156	1162	352	31	1	2023-06-12	3	2.00	40.00	50.00	147.00	29.40
11157	1163	82	858	2	2022-03-01	1	3.00	10.00	10.00	9.70	0.00
11158	1164	82	271	2	2022-12-23	3	4.00	110.00	130.00	374.40	57.60
11159	1165	82	859	2	2022-11-02	5	2.00	30.00	30.00	147.00	0.00
11160	1166	32	674	2	2022-11-08	4	5.00	40.00	50.00	190.00	38.00
11161	1167	68	101	7	2023-04-14	9	2.00	380.00	450.00	3969.00	617.40
11162	1168	134	860	1	2022-06-26	2	2.00	90.00	110.00	215.60	39.20
11163	1169	134	73	1	2023-04-26	3	5.00	230.00	270.00	769.50	114.00
11164	1170	134	861	1	2022-07-19	3	5.00	20.00	20.00	57.00	0.00
11165	1171	134	862	1	2022-01-13	4	2.00	30.00	30.00	117.60	0.00
11166	1172	353	863	2	2022-05-09	2	3.00	20.00	20.00	38.80	0.00
11167	1173	204	864	2	2022-04-05	5	4.00	20.00	20.00	96.00	0.00
11168	1174	54	626	2	2022-12-05	4	4.00	10.00	10.00	38.40	0.00
11169	1175	49	865	5	2023-06-03	6	3.00	40.00	50.00	291.00	58.20
11170	1176	284	661	2	2023-04-17	3	4.00	30.00	30.00	86.40	0.00
11171	1177	56	866	1	2022-04-18	4	3.00	10.00	10.00	38.80	0.00
11172	1178	354	867	2	2023-11-22	2	2.00	160.00	170.00	333.20	19.60
11173	1179	354	161	2	2022-05-22	3	4.00	150.00	180.00	518.40	86.40
11174	1180	355	620	1	2023-11-08	3	4.00	240.00	260.00	748.80	57.60
11175	1181	356	868	2	2022-12-26	7	4.00	1240.00	1320.00	8870.40	537.60
11176	1182	356	869	2	2023-05-10	2	4.00	0.00	0.00	0.00	0.00
11177	1183	312	114	5	2023-12-10	1	3.00	20.00	20.00	19.40	0.00
11178	1184	312	870	5	2022-09-09	5	3.00	10.00	10.00	48.50	0.00
11179	1185	237	871	2	2023-06-02	7	5.00	10.00	10.00	66.50	0.00
11180	1186	237	872	2	2022-06-04	6	2.00	390.00	490.00	2881.20	588.00
11181	1187	237	586	2	2022-10-17	4	4.00	20.00	30.00	115.20	38.40
11182	1188	237	596	2	2023-03-17	2	3.00	180.00	200.00	388.00	38.80
11183	1189	316	565	1	2022-06-20	4	5.00	70.00	80.00	304.00	38.00
11184	1190	316	873	1	2022-06-03	8	4.00	800.00	890.00	6835.20	691.20
11185	1191	316	874	1	2022-09-08	3	5.00	750.00	890.00	2536.50	399.00
11186	1192	316	315	1	2022-06-09	4	2.00	200.00	220.00	862.40	78.40
11187	1193	316	875	1	2023-02-14	4	5.00	20.00	20.00	76.00	0.00
11188	1194	357	290	7	2023-07-14	3	3.00	20.00	20.00	58.20	0.00
11189	1195	357	876	7	2022-08-27	4	2.00	20.00	20.00	78.40	0.00
11190	1196	357	422	7	2022-08-10	2	3.00	20.00	20.00	38.80	0.00
11191	1197	357	584	7	2022-08-23	1	4.00	50.00	60.00	57.60	9.60
11192	1198	188	877	2	2023-02-15	9	4.00	380.00	430.00	3715.20	432.00
11193	1199	188	878	2	2023-07-23	4	3.00	90.00	100.00	388.00	38.80
11194	1200	188	317	2	2022-09-24	4	3.00	920.00	1090.00	4229.20	659.60
11195	1201	358	630	2	2023-04-10	3	3.00	480.00	540.00	1571.40	174.60
11196	1202	358	256	2	2022-03-06	3	2.00	0.00	0.00	0.00	0.00
11197	1203	358	407	2	2022-01-01	3	3.00	770.00	850.00	2473.50	232.80
11198	1204	358	879	2	2022-02-10	2	4.00	550.00	590.00	1132.80	76.80
11199	1205	358	427	2	2022-06-07	3	3.00	290.00	340.00	989.40	145.50
11200	1206	47	705	5	2022-01-05	5	4.00	250.00	270.00	1296.00	96.00
11201	1207	253	603	1	2023-09-04	1	4.00	10.00	10.00	9.60	0.00
11202	1208	253	316	1	2022-12-12	3	3.00	10.00	10.00	29.10	0.00
11203	1209	253	132	1	2023-06-27	7	3.00	10.00	10.00	67.90	0.00
11204	1210	253	880	1	2022-06-28	7	4.00	30.00	40.00	268.80	67.20
11205	1211	253	881	1	2022-01-16	2	2.00	10.00	10.00	19.60	0.00
11206	1212	253	200	1	2022-08-02	4	3.00	490.00	580.00	2250.40	349.20
11207	1213	325	212	2	2022-02-24	2	4.00	130.00	140.00	268.80	19.20
11208	1214	325	882	2	2022-06-24	2	5.00	0.00	0.00	0.00	0.00
11209	1215	325	492	2	2022-08-27	1	5.00	0.00	0.00	0.00	0.00
11210	1216	325	242	2	2022-03-27	1	5.00	0.00	0.00	0.00	0.00
11211	1217	325	241	2	2023-12-28	3	3.00	100.00	100.00	291.00	0.00
11212	1218	325	883	2	2023-10-31	2	4.00	20.00	20.00	38.40	0.00
11213	1219	325	620	2	2022-10-17	3	5.00	250.00	260.00	741.00	28.50
11214	1220	325	884	2	2023-07-07	7	2.00	1760.00	1930.00	13239.80	1166.20
11215	1221	316	18	2	2023-05-22	9	3.00	220.00	250.00	2182.50	261.90
11216	1222	316	885	2	2022-09-20	8	2.00	250.00	260.00	2038.40	78.40
11217	1223	104	768	5	2023-06-09	3	3.00	100.00	110.00	320.10	29.10
11218	1224	104	476	5	2023-01-19	1	2.00	60.00	80.00	78.40	19.60
11219	1225	104	871	5	2023-05-11	1	3.00	0.00	0.00	0.00	0.00
11220	1226	104	886	5	2023-03-06	4	5.00	30.00	40.00	152.00	38.00
11221	1227	104	887	5	2023-11-21	3	4.00	160.00	180.00	518.40	57.60
11222	1228	104	888	5	2023-09-06	2	5.00	180.00	190.00	361.00	19.00
11223	1229	70	589	2	2022-06-12	2	2.00	20.00	20.00	39.20	0.00
11224	1230	70	699	2	2023-04-30	1	4.00	10.00	10.00	9.60	0.00
11225	1231	70	889	2	2022-07-23	2	5.00	10.00	10.00	19.00	0.00
11226	1232	359	382	1	2022-03-05	2	3.00	0.00	0.00	0.00	0.00
11227	1233	359	890	1	2023-08-16	2	2.00	70.00	80.00	156.80	19.60
11228	1234	110	891	5	2023-08-20	2	5.00	780.00	840.00	1596.00	114.00
11229	1235	360	892	7	2023-08-24	3	3.00	40.00	50.00	145.50	29.10
11230	1236	360	692	7	2022-04-13	5	4.00	30.00	40.00	192.00	48.00
11231	1237	360	893	7	2022-07-08	2	5.00	50.00	60.00	114.00	19.00
11232	1238	360	569	7	2023-11-19	3	4.00	160.00	170.00	489.60	28.80
11233	1239	203	894	2	2022-07-25	1	3.00	10.00	10.00	9.70	0.00
11234	1240	203	895	2	2022-05-22	1	3.00	30.00	40.00	38.80	9.70
11235	1241	203	272	2	2022-04-26	2	4.00	20.00	20.00	38.40	0.00
11236	1242	126	896	2	2023-03-16	4	5.00	20.00	20.00	76.00	0.00
11237	1243	31	897	2	2023-01-27	3	3.00	380.00	400.00	1164.00	58.20
11238	1244	31	53	2	2022-10-24	4	2.00	10.00	10.00	39.20	0.00
11239	1245	361	898	2	2023-12-01	9	4.00	50.00	50.00	432.00	0.00
11240	1246	362	899	1	2022-09-02	6	5.00	690.00	760.00	4332.00	399.00
11241	1247	362	216	1	2023-09-30	12	3.00	3430.00	3610.00	42020.40	2095.20
11242	1248	362	900	1	2022-08-03	3	2.00	200.00	250.00	735.00	147.00
11243	1249	31	901	2	2023-11-05	6	2.00	40.00	40.00	235.20	0.00
11244	1250	31	902	2	2022-10-10	9	2.00	1070.00	1140.00	10054.80	617.40
11245	1251	31	165	2	2022-11-23	13	3.00	1600.00	1700.00	21437.00	1261.00
11246	1252	31	903	2	2023-08-15	2	4.00	0.00	0.00	0.00	0.00
11247	1253	363	904	2	2022-08-22	4	5.00	970.00	1100.00	4180.00	494.00
11248	1254	235	687	2	2022-02-24	2	4.00	10.00	10.00	19.20	0.00
11249	1255	235	425	2	2022-10-14	3	5.00	40.00	40.00	114.00	0.00
11250	1256	235	905	2	2023-11-18	1	5.00	10.00	10.00	9.50	0.00
11251	1257	235	906	2	2022-01-29	2	2.00	30.00	40.00	78.40	19.60
11252	1258	336	583	1	2023-12-20	3	5.00	30.00	30.00	85.50	0.00
11253	1259	336	907	1	2023-02-25	3	5.00	490.00	540.00	1539.00	142.50
11254	1260	336	241	1	2022-04-10	8	2.00	220.00	260.00	2038.40	313.60
11255	1261	164	908	2	2023-02-09	3	5.00	710.00	860.00	2451.00	427.50
11256	1262	364	909	2	2023-05-23	4	2.00	20.00	20.00	78.40	0.00
11257	1263	365	25	1	2023-11-14	3	5.00	20.00	20.00	57.00	0.00
11258	1264	366	140	5	2023-05-05	2	3.00	70.00	70.00	135.80	0.00
11259	1265	366	905	5	2022-09-20	5	3.00	40.00	40.00	194.00	0.00
11260	1266	37	910	2	2023-07-21	3	5.00	10.00	10.00	28.50	0.00
11261	1267	156	385	2	2022-09-05	1	5.00	130.00	140.00	133.00	9.50
11262	1268	156	65	2	2022-11-01	6	3.00	240.00	290.00	1687.80	291.00
11263	1269	367	391	2	2023-04-23	3	5.00	30.00	30.00	85.50	0.00
11264	1270	368	911	2	2023-04-10	2	5.00	10.00	10.00	19.00	0.00
11265	1271	74	912	2	2022-03-09	4	5.00	80.00	100.00	380.00	76.00
11266	1272	74	724	2	2023-10-12	3	2.00	40.00	50.00	147.00	29.40
11267	1273	74	913	2	2023-07-22	8	4.00	40.00	40.00	307.20	0.00
11268	1274	198	748	7	2022-01-24	2	2.00	10.00	10.00	19.60	0.00
11269	1275	198	914	7	2022-01-21	5	4.00	320.00	390.00	1872.00	336.00
11270	1276	198	100	7	2022-02-13	3	2.00	10.00	10.00	29.40	0.00
11271	1277	198	915	7	2022-02-14	1	2.00	50.00	60.00	58.80	9.80
11272	1278	35	916	2	2023-12-30	3	3.00	80.00	90.00	261.90	29.10
11273	1279	369	917	5	2022-06-24	3	5.00	20.00	30.00	85.50	28.50
11274	1280	369	918	5	2022-03-15	4	5.00	70.00	80.00	304.00	38.00
11275	1281	370	919	5	2023-03-27	3	5.00	250.00	280.00	798.00	85.50
11276	1282	164	920	5	2022-08-04	3	3.00	20.00	20.00	58.20	0.00
11277	1283	164	921	5	2022-05-11	1	3.00	20.00	20.00	19.40	0.00
11278	1284	164	922	5	2023-10-07	3	5.00	240.00	250.00	712.50	28.50
11279	1285	132	923	2	2023-07-16	7	4.00	0.00	0.00	0.00	0.00
11280	1286	371	384	2	2022-07-24	5	2.00	10.00	10.00	49.00	0.00
11281	1287	82	924	2	2023-09-30	3	3.00	20.00	20.00	58.20	0.00
11282	1288	253	64	2	2022-08-30	2	5.00	40.00	40.00	76.00	0.00
11283	1289	253	537	2	2023-11-09	4	4.00	10.00	10.00	38.40	0.00
11284	1290	253	925	2	2022-05-08	3	4.00	20.00	20.00	57.60	0.00
11285	1291	337	926	5	2022-07-23	4	5.00	10.00	10.00	38.00	0.00
11286	1292	337	861	5	2022-11-15	5	2.00	30.00	30.00	147.00	0.00
11287	1293	287	134	2	2022-05-14	3	4.00	20.00	30.00	86.40	28.80
11288	1294	287	927	2	2022-01-29	5	4.00	100.00	110.00	528.00	48.00
11289	1295	287	86	2	2022-08-26	1	3.00	0.00	0.00	0.00	0.00
11290	1296	372	724	2	2022-06-09	13	5.00	770.00	850.00	10497.50	988.00
11291	1297	373	531	2	2023-03-31	2	4.00	10.00	10.00	19.20	0.00
11292	1298	373	570	2	2022-03-22	2	4.00	20.00	20.00	38.40	0.00
11293	1299	45	462	1	2022-07-08	5	3.00	90.00	110.00	533.50	97.00
11294	1300	10	147	5	2022-01-31	2	4.00	30.00	30.00	57.60	0.00
11295	1301	30	36	1	2022-06-07	6	4.00	500.00	570.00	3283.20	403.20
11296	1302	30	36	1	2022-12-15	3	4.00	260.00	290.00	835.20	86.40
11297	1303	374	928	1	2022-05-22	2	2.00	50.00	60.00	117.60	19.60
11298	1304	375	929	2	2022-02-04	1	5.00	20.00	20.00	19.00	0.00
11299	1305	375	665	2	2022-07-17	3	3.00	270.00	290.00	843.90	58.20
11300	1306	75	930	1	2022-08-30	7	5.00	390.00	420.00	2793.00	199.50
11301	1307	62	482	5	2023-03-14	7	4.00	40.00	50.00	336.00	67.20
11302	1308	62	778	5	2023-10-23	3	5.00	20.00	20.00	57.00	0.00
11303	1309	62	931	5	2023-10-02	2	3.00	20.00	20.00	38.80	0.00
11304	1310	62	399	5	2023-12-19	3	3.00	130.00	160.00	465.60	87.30
11305	1311	62	932	5	2022-09-16	2	2.00	140.00	160.00	313.60	39.20
11306	1312	190	933	2	2023-07-12	1	2.00	0.00	0.00	0.00	0.00
11307	1313	190	934	2	2023-09-30	4	5.00	100.00	120.00	456.00	76.00
11308	1314	51	638	2	2023-03-02	2	2.00	150.00	160.00	313.60	19.60
11309	1315	376	935	2	2023-04-21	6	4.00	30.00	40.00	230.40	57.60
11310	1316	376	936	2	2023-07-22	8	4.00	140.00	180.00	1382.40	307.20
11311	1317	376	414	2	2022-04-16	5	4.00	510.00	580.00	2784.00	336.00
11312	1318	210	937	2	2023-12-23	1	2.00	10.00	10.00	9.80	0.00
11313	1319	377	908	2	2022-10-17	2	4.00	490.00	580.00	1113.60	172.80
11314	1320	377	615	2	2023-11-13	6	2.00	10.00	10.00	58.80	0.00
11315	1321	144	700	2	2022-08-13	3	2.00	10.00	10.00	29.40	0.00
11316	1322	144	519	2	2022-02-24	2	2.00	240.00	290.00	568.40	98.00
11317	1323	378	938	2	2023-08-11	5	2.00	70.00	70.00	343.00	0.00
11318	1324	201	939	5	2023-11-24	4	3.00	10.00	10.00	38.80	0.00
11319	1325	158	422	2	2023-11-03	3	5.00	40.00	50.00	142.50	28.50
11320	1326	194	940	5	2023-04-23	6	5.00	20.00	20.00	114.00	0.00
11321	1327	285	883	2	2023-09-24	6	4.00	40.00	50.00	288.00	57.60
11322	1328	379	753	5	2022-02-16	1	4.00	10.00	10.00	9.60	0.00
11323	1329	258	941	1	2022-11-05	4	5.00	80.00	90.00	342.00	38.00
11324	1330	10	894	2	2023-04-13	3	5.00	40.00	40.00	114.00	0.00
11325	1331	380	501	2	2023-01-27	1	3.00	0.00	0.00	0.00	0.00
11326	1332	380	457	2	2023-07-19	2	4.00	30.00	30.00	57.60	0.00
11327	1333	89	752	2	2023-08-18	3	5.00	0.00	0.00	0.00	0.00
11328	1334	89	942	2	2023-03-29	2	4.00	10.00	10.00	19.20	0.00
11329	1335	381	716	2	2023-04-27	8	2.00	110.00	140.00	1097.60	235.20
11330	1336	382	943	2	2023-10-03	4	3.00	500.00	550.00	2134.00	194.00
11331	1337	204	905	2	2023-02-26	3	3.00	30.00	30.00	87.30	0.00
11332	1338	383	944	1	2023-01-12	2	5.00	30.00	30.00	57.00	0.00
11333	1339	383	945	1	2022-10-24	3	4.00	630.00	680.00	1958.40	144.00
11334	1340	383	946	1	2023-07-09	8	5.00	70.00	80.00	608.00	76.00
11335	1341	384	947	5	2023-06-30	2	5.00	600.00	700.00	1330.00	190.00
11336	1342	384	865	5	2022-11-09	5	5.00	20.00	20.00	95.00	0.00
11337	1343	384	28	5	2023-01-11	6	5.00	30.00	30.00	171.00	0.00
11338	1344	385	948	2	2022-01-16	3	3.00	40.00	50.00	145.50	29.10
11339	1345	385	949	2	2022-11-23	5	5.00	10.00	10.00	47.50	0.00
11340	1346	271	590	2	2023-11-21	2	4.00	80.00	90.00	172.80	19.20
11341	1347	271	950	2	2022-10-27	7	3.00	50.00	50.00	339.50	0.00
11342	1348	271	951	2	2023-10-24	6	4.00	20.00	20.00	115.20	0.00
11343	1349	271	952	2	2022-12-18	10	4.00	40.00	50.00	480.00	96.00
11344	1350	271	953	2	2023-06-05	6	5.00	40.00	40.00	228.00	0.00
11345	1351	249	813	1	2023-12-13	3	5.00	230.00	260.00	741.00	85.50
11346	1352	386	954	5	2023-10-31	2	4.00	30.00	30.00	57.60	0.00
11347	1353	142	522	2	2023-08-10	5	2.00	160.00	180.00	882.00	98.00
11348	1354	142	708	2	2022-12-15	3	3.00	20.00	20.00	58.20	0.00
11349	1355	142	216	2	2022-04-03	1	2.00	270.00	300.00	294.00	29.40
11350	1356	75	197	7	2023-05-18	3	5.00	180.00	220.00	627.00	114.00
11351	1357	75	912	7	2022-07-30	11	3.00	230.00	280.00	2987.60	533.50
11352	1358	226	955	5	2022-04-19	3	2.00	70.00	80.00	235.20	29.40
11353	1359	198	528	5	2023-07-20	1	4.00	0.00	0.00	0.00	0.00
11354	1360	14	956	1	2022-08-12	2	5.00	140.00	150.00	285.00	19.00
11355	1361	86	667	2	2022-12-28	7	2.00	110.00	120.00	823.20	68.60
11356	1362	86	957	2	2023-02-20	4	2.00	20.00	20.00	78.40	0.00
11357	1363	86	958	2	2023-08-18	4	5.00	270.00	310.00	1178.00	152.00
11358	1364	196	625	5	2022-09-17	14	3.00	40.00	40.00	543.20	0.00
11359	1365	196	959	5	2023-09-15	2	5.00	90.00	100.00	190.00	19.00
11360	1366	196	960	5	2023-01-20	6	5.00	190.00	240.00	1368.00	285.00
11361	1367	196	203	5	2022-04-20	2	4.00	180.00	200.00	384.00	38.40
11362	1368	196	300	5	2023-05-07	4	3.00	770.00	900.00	3492.00	504.40
11363	1369	387	288	5	2022-06-23	5	4.00	140.00	150.00	720.00	48.00
11364	1370	388	179	2	2023-04-08	7	3.00	560.00	590.00	4006.10	203.70
11365	1371	388	629	2	2023-12-20	3	5.00	10.00	10.00	28.50	0.00
11366	1372	335	961	2	2023-07-25	3	5.00	50.00	50.00	142.50	0.00
11367	1373	389	580	1	2023-10-30	2	5.00	30.00	30.00	57.00	0.00
11368	1374	389	962	1	2022-12-02	4	5.00	20.00	20.00	76.00	0.00
11369	1375	390	963	2	2023-07-25	5	2.00	850.00	910.00	4459.00	294.00
11370	1376	391	964	1	2022-12-20	3	5.00	960.00	1090.00	3106.50	370.50
11371	1377	391	965	1	2022-08-22	8	5.00	400.00	450.00	3420.00	380.00
11372	1378	391	966	1	2023-06-30	5	3.00	20.00	20.00	97.00	0.00
11373	1379	391	967	1	2022-10-26	5	2.00	360.00	400.00	1960.00	196.00
11374	1380	391	968	1	2023-09-27	5	5.00	140.00	160.00	760.00	95.00
11375	1381	391	92	1	2023-03-19	1	5.00	10.00	10.00	9.50	0.00
11376	1382	224	584	2	2022-11-28	3	5.00	70.00	80.00	228.00	28.50
11377	1383	392	872	7	2022-06-11	1	3.00	60.00	80.00	77.60	19.40
11378	1384	392	969	7	2023-07-26	9	2.00	310.00	350.00	3087.00	352.80
11379	1385	392	970	7	2023-11-30	5	5.00	10.00	10.00	47.50	0.00
11380	1386	392	268	7	2022-01-16	3	5.00	20.00	20.00	57.00	0.00
11381	1387	392	575	7	2023-01-20	2	4.00	230.00	240.00	460.80	19.20
11382	1388	392	971	7	2022-07-24	2	4.00	160.00	170.00	326.40	19.20
11383	1389	392	140	7	2023-01-13	3	5.00	90.00	100.00	285.00	28.50
11384	1390	392	298	7	2023-01-26	3	5.00	420.00	480.00	1368.00	171.00
11385	1391	392	448	7	2022-07-13	3	5.00	110.00	120.00	342.00	28.50
11386	1392	392	233	7	2022-11-20	3	5.00	130.00	150.00	427.50	57.00
11387	1393	392	63	7	2023-01-27	7	4.00	280.00	340.00	2284.80	403.20
11388	1394	232	182	5	2022-05-05	3	3.00	10.00	10.00	29.10	0.00
11389	1395	393	972	2	2023-06-02	5	4.00	550.00	650.00	3120.00	480.00
11390	1396	393	973	2	2022-03-05	3	3.00	60.00	70.00	203.70	29.10
11391	1397	134	974	5	2023-11-29	4	5.00	20.00	20.00	76.00	0.00
11392	1398	134	610	5	2023-08-05	2	3.00	10.00	10.00	19.40	0.00
11393	1399	134	177	5	2022-10-10	4	4.00	90.00	90.00	345.60	0.00
11394	1400	134	975	5	2022-03-29	1	2.00	10.00	10.00	9.80	0.00
11395	1401	394	48	2	2022-09-11	2	2.00	20.00	20.00	39.20	0.00
11396	1402	394	557	2	2023-03-28	3	3.00	200.00	250.00	727.50	145.50
11397	1403	115	976	2	2022-11-12	2	5.00	200.00	210.00	399.00	19.00
11398	1404	115	977	2	2023-09-24	5	5.00	350.00	420.00	1995.00	332.50
11399	1405	282	506	5	2022-07-05	1	2.00	10.00	10.00	9.80	0.00
11400	1406	282	978	5	2023-09-25	3	4.00	130.00	150.00	432.00	57.60
11401	1407	282	172	5	2023-09-15	2	4.00	100.00	120.00	230.40	38.40
11402	1408	104	979	2	2023-08-05	2	4.00	70.00	80.00	153.60	19.20
11403	1409	104	297	2	2023-04-09	2	2.00	30.00	40.00	78.40	19.60
11404	1410	55	737	2	2023-01-28	3	2.00	320.00	390.00	1146.60	205.80
11405	1411	395	430	2	2022-06-27	2	2.00	20.00	20.00	39.20	0.00
11406	1412	49	630	2	2023-08-25	2	2.00	380.00	410.00	803.60	58.80
11407	1413	49	480	2	2023-08-04	4	5.00	140.00	170.00	646.00	114.00
11408	1414	104	980	2	2023-10-10	7	4.00	280.00	330.00	2217.60	336.00
11409	1415	396	915	1	2023-07-02	3	2.00	230.00	240.00	705.60	29.40
11410	1416	396	981	1	2022-04-16	3	4.00	30.00	40.00	115.20	28.80
11411	1417	34	982	5	2022-10-05	7	5.00	860.00	950.00	6317.50	598.50
11412	1418	34	726	5	2023-03-25	3	3.00	120.00	150.00	436.50	87.30
11413	1419	34	51	5	2023-09-05	4	5.00	0.00	0.00	0.00	0.00
11414	1420	397	983	2	2022-06-15	4	3.00	70.00	90.00	349.20	77.60
11415	1421	397	262	2	2023-06-14	2	2.00	60.00	70.00	137.20	19.60
11416	1422	397	984	2	2022-09-21	2	2.00	50.00	60.00	117.60	19.60
11417	1423	397	698	2	2023-08-22	9	2.00	70.00	80.00	705.60	88.20
11418	1424	397	353	2	2022-12-22	6	4.00	110.00	120.00	691.20	57.60
11419	1425	397	985	2	2023-10-21	5	3.00	240.00	260.00	1261.00	97.00
11420	1426	397	419	2	2022-07-22	4	4.00	330.00	360.00	1382.40	115.20
11421	1427	278	526	1	2023-05-22	2	3.00	10.00	10.00	19.40	0.00
11422	1428	278	112	1	2023-05-06	5	4.00	10.00	10.00	48.00	0.00
11423	1429	278	986	1	2022-10-01	5	3.00	30.00	30.00	145.50	0.00
11424	1430	278	581	1	2023-02-10	14	2.00	370.00	430.00	5899.60	823.20
11425	1431	51	522	2	2022-05-09	8	5.00	190.00	220.00	1672.00	228.00
11426	1432	368	987	1	2022-08-13	6	3.00	140.00	150.00	873.00	58.20
11427	1433	368	516	1	2022-06-16	1	2.00	10.00	10.00	9.80	0.00
11428	1434	368	71	1	2022-01-15	14	3.00	1550.00	1820.00	24715.60	3666.60
11429	1435	203	988	2	2022-12-13	5	3.00	20.00	30.00	145.50	48.50
11430	1436	398	989	2	2023-11-25	6	5.00	30.00	30.00	171.00	0.00
11431	1437	398	951	2	2022-05-16	2	3.00	10.00	10.00	19.40	0.00
11432	1438	399	990	7	2022-03-08	3	5.00	230.00	260.00	741.00	85.50
11433	1439	399	484	7	2022-10-25	5	5.00	2330.00	2450.00	11637.50	570.00
11434	1440	371	991	1	2023-08-17	5	3.00	30.00	30.00	145.50	0.00
11435	1441	371	992	1	2022-02-04	4	4.00	40.00	40.00	153.60	0.00
11436	1442	152	711	1	2023-01-14	2	5.00	30.00	40.00	76.00	19.00
11437	1443	155	321	5	2022-06-10	2	5.00	10.00	10.00	19.00	0.00
11438	1444	400	124	2	2023-09-10	4	4.00	130.00	140.00	537.60	38.40
11439	1445	118	904	2	2023-10-19	9	2.00	1580.00	1980.00	17463.60	3528.00
11440	1446	229	233	5	2023-11-09	4	2.00	150.00	160.00	627.20	39.20
11441	1447	229	993	5	2022-08-22	7	2.00	410.00	470.00	3224.20	411.60
11442	1448	229	994	5	2023-04-05	2	2.00	50.00	50.00	98.00	0.00
11443	1449	325	995	5	2022-12-28	3	4.00	0.00	0.00	0.00	0.00
11444	1450	177	996	2	2022-05-23	3	4.00	80.00	90.00	259.20	28.80
11445	1451	55	997	5	2023-06-28	1	2.00	0.00	0.00	0.00	0.00
11446	1452	401	886	5	2022-01-16	7	5.00	60.00	70.00	465.50	66.50
11447	1453	401	998	5	2023-12-23	3	3.00	80.00	90.00	261.90	29.10
11448	1454	401	997	5	2022-08-31	5	5.00	30.00	30.00	142.50	0.00
11449	1455	401	999	5	2022-11-11	8	3.00	2460.00	3040.00	23590.40	4500.80
11450	1456	402	1000	2	2023-02-09	3	4.00	80.00	90.00	259.20	28.80
11451	1457	402	1001	2	2022-05-23	3	2.00	370.00	450.00	1323.00	235.20
11452	1458	403	327	2	2022-03-14	9	5.00	40.00	50.00	427.50	85.50
11453	1459	404	640	2	2022-01-16	4	2.00	20.00	20.00	78.40	0.00
11454	1460	382	1002	7	2023-06-19	2	2.00	30.00	30.00	58.80	0.00
11455	1461	6	1003	2	2023-08-13	2	2.00	50.00	60.00	117.60	19.60
11456	1462	405	617	2	2023-12-01	2	2.00	220.00	240.00	470.40	39.20
11457	1463	105	410	5	2023-04-19	2	4.00	150.00	160.00	307.20	19.20
11458	1464	105	857	5	2022-01-07	6	3.00	950.00	1020.00	5936.40	407.40
11459	1465	253	802	5	2022-01-30	2	4.00	0.00	0.00	0.00	0.00
11460	1466	406	768	2	2023-05-30	4	3.00	110.00	120.00	465.60	38.80
11461	1467	406	98	2	2023-03-06	3	5.00	80.00	100.00	285.00	57.00
11462	1468	307	658	7	2022-09-15	4	4.00	230.00	260.00	998.40	115.20
11463	1469	189	1004	2	2023-04-05	3	4.00	730.00	870.00	2505.60	403.20
11464	1470	189	351	2	2022-08-02	2	2.00	30.00	40.00	78.40	19.60
11465	1471	189	1005	2	2023-03-15	2	3.00	10.00	10.00	19.40	0.00
11466	1472	86	1006	1	2022-08-27	2	5.00	10.00	10.00	19.00	0.00
11467	1473	351	689	2	2022-03-23	3	2.00	10.00	10.00	29.40	0.00
11468	1474	75	1007	7	2023-10-25	4	5.00	10.00	10.00	38.00	0.00
11469	1475	407	1008	2	2022-03-25	6	2.00	20.00	20.00	117.60	0.00
11470	1476	407	778	2	2022-09-30	3	4.00	20.00	20.00	57.60	0.00
11471	1477	126	1009	2	2023-07-08	7	2.00	20.00	30.00	205.80	68.60
11472	1478	408	661	2	2022-06-03	7	5.00	50.00	50.00	332.50	0.00
11473	1479	409	434	5	2022-02-05	4	4.00	30.00	30.00	115.20	0.00
11474	1480	37	1010	2	2022-03-23	4	2.00	30.00	30.00	117.60	0.00
11475	1481	37	1011	2	2022-01-12	7	5.00	30.00	40.00	266.00	66.50
11476	1482	37	1012	2	2023-08-13	3	5.00	20.00	30.00	85.50	28.50
11477	1483	410	488	1	2023-04-25	2	2.00	10.00	10.00	19.60	0.00
11478	1484	410	1013	1	2023-08-19	1	5.00	0.00	0.00	0.00	0.00
11479	1485	411	1014	2	2023-02-27	3	5.00	160.00	180.00	513.00	57.00
11480	1486	134	1015	2	2023-07-22	2	2.00	0.00	0.00	0.00	0.00
11481	1487	329	1016	2	2023-12-03	7	3.00	1150.00	1210.00	8215.90	407.40
11482	1488	329	1017	2	2022-11-13	3	5.00	80.00	90.00	256.50	28.50
11483	1489	329	379	2	2023-06-26	3	5.00	40.00	40.00	114.00	0.00
11484	1490	130	817	2	2023-07-14	2	5.00	10.00	10.00	19.00	0.00
11485	1491	25	37	1	2023-07-01	4	3.00	50.00	60.00	232.80	38.80
11486	1492	49	1018	2	2023-05-12	1	2.00	10.00	10.00	9.80	0.00
11487	1493	49	324	2	2022-12-11	6	2.00	870.00	980.00	5762.40	646.80
11488	1494	223	764	2	2022-07-17	2	3.00	10.00	10.00	19.40	0.00
11489	1495	375	819	1	2022-08-20	3	2.00	30.00	40.00	117.60	29.40
11490	1496	412	854	2	2022-10-07	7	3.00	10.00	10.00	67.90	0.00
11491	1497	412	1019	2	2022-04-08	1	5.00	20.00	20.00	19.00	0.00
11492	1498	412	170	2	2023-06-13	5	4.00	10.00	10.00	48.00	0.00
11493	1499	337	110	5	2022-06-28	5	5.00	20.00	20.00	95.00	0.00
11494	1500	132	187	2	2023-10-29	3	2.00	20.00	20.00	58.80	0.00
11495	1501	132	1020	2	2022-06-24	9	2.00	200.00	220.00	1940.40	176.40
11496	1502	132	907	2	2023-04-07	3	5.00	500.00	540.00	1539.00	114.00
11497	1503	179	1021	2	2022-05-28	2	3.00	30.00	30.00	58.20	0.00
11498	1504	179	528	2	2023-11-03	2	5.00	10.00	10.00	19.00	0.00
11499	1505	56	60	2	2023-03-10	4	4.00	10.00	10.00	38.40	0.00
11500	1506	56	1022	2	2022-10-02	6	3.00	920.00	1000.00	5820.00	465.60
11501	1507	104	986	2	2023-06-09	3	2.00	20.00	20.00	58.80	0.00
11502	1508	375	1023	2	2022-12-14	4	4.00	380.00	400.00	1536.00	76.80
11503	1509	413	1024	7	2023-03-18	3	3.00	30.00	30.00	87.30	0.00
11504	1510	234	1007	5	2023-10-17	2	2.00	10.00	10.00	19.60	0.00
11505	1511	414	282	2	2023-02-16	8	4.00	310.00	390.00	2995.20	614.40
11506	1512	414	182	2	2023-11-05	9	2.00	30.00	40.00	352.80	88.20
11507	1513	89	226	2	2022-01-30	3	2.00	190.00	200.00	588.00	29.40
11508	1514	89	411	2	2022-07-25	5	2.00	20.00	20.00	98.00	0.00
11509	1515	89	675	2	2022-03-11	4	4.00	10.00	10.00	38.40	0.00
11510	1516	210	956	2	2022-04-01	1	3.00	50.00	60.00	58.20	9.70
11511	1517	415	490	1	2022-10-16	4	5.00	1470.00	1670.00	6346.00	760.00
11512	1518	203	271	1	2022-04-25	2	4.00	70.00	80.00	153.60	19.20
11513	1519	203	556	1	2023-05-30	3	2.00	10.00	10.00	29.40	0.00
11514	1520	111	734	1	2022-07-14	7	5.00	20.00	20.00	133.00	0.00
11515	1521	28	1025	2	2022-01-29	5	2.00	20.00	20.00	98.00	0.00
11516	1522	138	593	2	2023-08-23	6	2.00	170.00	210.00	1234.80	235.20
11517	1523	138	1026	2	2023-09-28	5	5.00	20.00	20.00	95.00	0.00
11518	1524	138	335	2	2022-04-08	8	3.00	180.00	200.00	1552.00	155.20
11519	1525	138	233	2	2022-10-17	6	2.00	210.00	250.00	1470.00	235.20
11520	1526	138	31	2	2023-04-05	6	2.00	80.00	90.00	529.20	58.80
11521	1527	416	1027	2	2022-06-02	2	2.00	0.00	0.00	0.00	0.00
11522	1528	416	1028	2	2022-07-13	2	3.00	10.00	10.00	19.40	0.00
11523	1529	417	1029	1	2022-06-02	7	4.00	30.00	30.00	201.60	0.00
11524	1530	417	1030	1	2022-03-20	2	2.00	10.00	10.00	19.60	0.00
11525	1531	418	1031	2	2023-04-19	3	3.00	60.00	70.00	203.70	29.10
11526	1532	419	1032	2	2022-11-25	1	4.00	10.00	10.00	9.60	0.00
11527	1533	419	204	2	2023-06-01	3	2.00	10.00	10.00	29.40	0.00
11528	1534	49	1033	2	2023-11-12	6	4.00	170.00	210.00	1209.60	230.40
11529	1535	420	575	2	2022-06-24	2	2.00	170.00	200.00	392.00	58.80
11530	1536	421	1034	2	2023-06-21	3	3.00	40.00	40.00	116.40	0.00
11531	1537	421	1035	2	2023-04-26	3	5.00	10.00	10.00	28.50	0.00
11532	1538	422	885	1	2022-05-05	1	3.00	30.00	40.00	38.80	9.70
11533	1539	422	360	1	2023-12-03	2	3.00	20.00	20.00	38.80	0.00
11534	1540	422	38	1	2022-06-24	3	4.00	690.00	780.00	2246.40	259.20
11535	1541	422	1003	1	2023-01-13	7	2.00	200.00	240.00	1646.40	274.40
11536	1542	51	1036	1	2022-11-16	5	4.00	10.00	10.00	48.00	0.00
11537	1543	51	846	1	2022-04-06	6	5.00	10.00	10.00	57.00	0.00
11538	1544	423	656	2	2023-10-07	3	5.00	70.00	80.00	228.00	28.50
11539	1545	423	733	2	2022-07-13	4	3.00	30.00	30.00	116.40	0.00
11540	1546	424	179	1	2022-04-29	7	2.00	1350.00	1570.00	10770.20	1509.20
11541	1547	162	922	2	2022-09-08	4	2.00	310.00	340.00	1332.80	117.60
11542	1548	162	980	2	2023-05-14	2	4.00	20.00	20.00	38.40	0.00
11543	1549	162	1037	2	2022-06-05	2	3.00	20.00	30.00	58.20	19.40
11544	1550	383	891	5	2023-01-24	1	2.00	470.00	560.00	548.80	88.20
11545	1551	15	1038	1	2023-07-07	6	4.00	10.00	10.00	57.60	0.00
11546	1552	178	965	2	2022-08-26	2	4.00	90.00	110.00	211.20	38.40
11547	1553	425	1039	5	2022-01-23	7	3.00	20.00	20.00	135.80	0.00
11548	1554	207	692	2	2022-03-12	5	4.00	110.00	120.00	576.00	48.00
11549	1555	426	1040	2	2022-05-26	3	3.00	10.00	10.00	29.10	0.00
11550	1556	365	44	2	2022-02-27	4	4.00	80.00	90.00	345.60	38.40
11551	1557	12	1041	2	2022-02-08	1	5.00	10.00	10.00	9.50	0.00
11552	1558	12	1042	2	2022-06-14	5	2.00	70.00	80.00	392.00	49.00
11553	1559	6	978	1	2023-04-24	2	2.00	140.00	170.00	333.20	58.80
11554	1560	237	697	2	2022-06-02	9	5.00	40.00	40.00	342.00	0.00
11555	1561	427	1043	2	2022-11-15	6	3.00	20.00	20.00	116.40	0.00
11556	1562	246	325	5	2023-02-26	1	2.00	0.00	0.00	0.00	0.00
11557	1563	383	4	7	2023-02-01	5	2.00	860.00	1040.00	5096.00	882.00
11558	1564	71	205	7	2022-10-19	3	5.00	10.00	10.00	28.50	0.00
11559	1565	40	1044	7	2023-05-08	5	5.00	290.00	350.00	1662.50	285.00
11560	1566	67	868	2	2023-07-20	3	2.00	400.00	450.00	1323.00	147.00
11561	1567	428	1045	5	2022-07-27	3	3.00	20.00	20.00	58.20	0.00
11562	1568	428	1046	5	2023-08-05	4	5.00	10.00	10.00	38.00	0.00
11563	1569	27	448	7	2023-11-10	3	3.00	110.00	120.00	349.20	29.10
11564	1570	255	1047	2	2022-12-06	3	3.00	10.00	10.00	29.10	0.00
11565	1571	27	84	5	2022-10-19	5	2.00	490.00	600.00	2940.00	539.00
11566	1572	27	1048	5	2022-01-23	3	2.00	20.00	20.00	58.80	0.00
11567	1573	27	1049	5	2023-07-24	1	2.00	30.00	30.00	29.40	0.00
11568	1574	27	468	5	2023-08-02	2	3.00	320.00	380.00	737.20	116.40
11569	1575	429	1050	5	2022-11-01	3	3.00	30.00	40.00	116.40	29.10
11570	1576	429	636	5	2023-05-30	5	4.00	650.00	760.00	3648.00	528.00
11571	1577	224	329	2	2023-04-29	2	2.00	20.00	20.00	39.20	0.00
11572	1578	430	1051	2	2022-06-16	1	2.00	0.00	0.00	0.00	0.00
11573	1579	383	1052	5	2023-06-20	3	3.00	140.00	170.00	494.70	87.30
11574	1580	104	349	5	2023-09-13	2	2.00	260.00	310.00	607.60	98.00
11575	1581	104	224	5	2022-01-12	9	4.00	340.00	380.00	3283.20	345.60
11576	1582	104	194	5	2023-04-30	2	2.00	40.00	40.00	78.40	0.00
11577	1583	104	693	5	2023-11-28	2	4.00	1100.00	1220.00	2342.40	230.40
11578	1584	104	117	5	2022-03-26	3	3.00	50.00	50.00	145.50	0.00
11579	1585	104	51	5	2022-10-02	2	3.00	10.00	10.00	19.40	0.00
11580	1586	104	470	5	2022-03-08	5	3.00	850.00	980.00	4753.00	630.50
11581	1587	104	1053	5	2022-03-26	3	5.00	130.00	140.00	399.00	28.50
11582	1588	104	1054	5	2022-10-30	3	2.00	10.00	10.00	29.40	0.00
11583	1589	104	387	5	2023-08-27	4	3.00	230.00	250.00	970.00	77.60
11584	1590	309	449	2	2022-11-13	4	4.00	10.00	10.00	38.40	0.00
11585	1591	431	1055	2	2022-05-20	7	3.00	30.00	30.00	203.70	0.00
11586	1592	431	132	2	2023-04-04	5	3.00	10.00	10.00	48.50	0.00
11587	1593	315	1056	1	2023-09-05	4	3.00	180.00	200.00	776.00	77.60
11588	1594	4	1057	7	2023-07-09	3	3.00	10.00	10.00	29.10	0.00
11589	1595	432	1058	5	2022-01-17	3	3.00	300.00	360.00	1047.60	174.60
11590	1596	51	878	2	2023-10-17	2	5.00	40.00	50.00	95.00	19.00
11591	1597	213	452	5	2023-08-20	13	5.00	460.00	550.00	6792.50	1111.50
11592	1598	433	1059	1	2023-07-31	4	2.00	20.00	20.00	78.40	0.00
11593	1599	433	1060	1	2022-10-14	1	5.00	10.00	10.00	9.50	0.00
11594	1600	433	291	1	2022-04-25	4	2.00	80.00	100.00	392.00	78.40
11595	1601	433	297	1	2022-08-12	2	4.00	20.00	20.00	38.40	0.00
11596	1602	434	1061	1	2022-02-03	2	2.00	200.00	210.00	411.60	19.60
11597	1603	435	1062	2	2022-07-03	3	2.00	10.00	10.00	29.40	0.00
11598	1604	436	1063	2	2023-12-17	6	3.00	150.00	160.00	931.20	58.20
11599	1605	14	858	1	2023-07-01	5	5.00	40.00	40.00	190.00	0.00
11600	1606	14	1064	1	2023-03-07	3	3.00	10.00	10.00	29.10	0.00
11601	1607	14	1065	1	2023-03-29	5	4.00	60.00	70.00	336.00	48.00
11602	1608	14	348	1	2022-12-06	1	5.00	10.00	10.00	9.50	0.00
11603	1609	14	127	1	2023-12-10	4	2.00	20.00	20.00	78.40	0.00
11604	1610	14	1066	1	2023-02-14	3	4.00	10.00	10.00	28.80	0.00
11605	1611	177	1058	2	2023-04-12	2	5.00	240.00	290.00	551.00	95.00
11606	1612	177	1067	2	2022-01-25	2	2.00	160.00	200.00	392.00	78.40
11607	1613	177	67	2	2023-09-30	2	4.00	70.00	80.00	153.60	19.20
11608	1614	333	385	2	2022-04-22	7	4.00	950.00	1000.00	6720.00	336.00
11609	1615	282	1068	2	2023-02-09	3	5.00	70.00	80.00	228.00	28.50
11610	1616	437	548	2	2023-04-08	1	2.00	0.00	0.00	0.00	0.00
11611	1617	437	255	2	2023-01-12	4	5.00	40.00	40.00	152.00	0.00
11612	1618	437	1069	2	2023-03-02	3	4.00	30.00	30.00	86.40	0.00
11613	1619	304	1070	1	2022-06-29	2	5.00	60.00	60.00	114.00	0.00
11614	1620	304	1071	1	2022-08-02	1	5.00	10.00	10.00	9.50	0.00
11615	1621	438	1072	2	2022-04-04	2	3.00	190.00	200.00	388.00	19.40
11616	1622	438	509	2	2022-06-26	8	5.00	730.00	790.00	6004.00	456.00
11617	1623	438	498	2	2022-08-26	2	2.00	20.00	20.00	39.20	0.00
11618	1624	438	1073	2	2023-04-27	2	5.00	40.00	50.00	95.00	19.00
11619	1625	14	982	2	2022-10-12	5	3.00	560.00	680.00	3298.00	582.00
11620	1626	14	696	2	2023-11-02	3	4.00	1120.00	1270.00	3657.60	432.00
11621	1627	304	550	2	2022-12-01	5	5.00	460.00	520.00	2470.00	285.00
11622	1628	439	867	2	2022-07-11	6	5.00	430.00	520.00	2964.00	513.00
11623	1629	228	1074	1	2022-01-31	5	3.00	20.00	20.00	97.00	0.00
11624	1630	228	711	1	2023-07-23	6	5.00	40.00	40.00	228.00	0.00
11625	1631	228	1075	7	2023-12-17	3	3.00	840.00	1010.00	2939.10	494.70
11626	1632	228	482	7	2023-01-17	2	3.00	10.00	10.00	19.40	0.00
11627	1633	228	499	7	2022-11-09	2	2.00	10.00	10.00	19.60	0.00
11628	1634	228	954	7	2023-08-06	2	4.00	20.00	30.00	57.60	19.20
11629	1635	228	478	7	2023-12-03	2	3.00	50.00	60.00	116.40	19.40
11630	1636	440	779	2	2022-08-01	3	2.00	20.00	20.00	58.80	0.00
11631	1637	440	750	2	2023-12-23	5	4.00	610.00	670.00	3216.00	288.00
11632	1638	440	1076	2	2023-03-06	4	5.00	400.00	440.00	1672.00	152.00
11633	1639	317	1077	2	2023-04-06	3	3.00	20.00	20.00	58.20	0.00
11634	1640	317	545	2	2022-01-31	2	4.00	10.00	10.00	19.20	0.00
11635	1641	317	70	2	2023-11-20	2	4.00	10.00	10.00	19.20	0.00
11636	1642	317	94	2	2023-02-12	3	2.00	40.00	40.00	117.60	0.00
11637	1643	441	551	2	2023-10-11	2	4.00	10.00	10.00	19.20	0.00
11638	1644	411	404	5	2022-10-06	3	2.00	1160.00	1250.00	3675.00	264.60
11639	1645	411	1078	5	2022-05-27	7	3.00	2650.00	3150.00	21388.50	3395.00
11640	1646	411	1079	5	2022-07-08	2	3.00	180.00	210.00	407.40	58.20
11641	1647	243	177	5	2023-04-29	2	4.00	30.00	40.00	76.80	19.20
11642	1648	243	1080	5	2022-11-19	2	3.00	0.00	0.00	0.00	0.00
11643	1649	130	1081	1	2023-02-21	6	5.00	110.00	120.00	684.00	57.00
11644	1650	130	1082	1	2023-07-11	1	5.00	50.00	50.00	47.50	0.00
11645	1651	111	1083	7	2022-10-04	2	5.00	100.00	110.00	209.00	19.00
11646	1652	111	1084	7	2022-05-13	2	5.00	10.00	10.00	19.00	0.00
11647	1653	203	87	5	2022-07-11	6	4.00	140.00	170.00	979.20	172.80
11648	1654	203	218	5	2023-12-07	4	5.00	110.00	130.00	494.00	76.00
11649	1655	203	1085	5	2023-07-11	2	4.00	0.00	0.00	0.00	0.00
11650	1656	203	1086	5	2022-04-03	2	5.00	10.00	10.00	19.00	0.00
11651	1657	203	912	5	2022-07-08	3	5.00	80.00	100.00	285.00	57.00
11652	1658	363	528	5	2022-08-06	7	4.00	30.00	30.00	201.60	0.00
11653	1659	70	1087	2	2022-05-26	3	5.00	140.00	160.00	456.00	57.00
11654	1660	68	806	2	2023-10-08	3	4.00	80.00	90.00	259.20	28.80
11655	1661	68	845	2	2022-04-21	2	5.00	10.00	10.00	19.00	0.00
11656	1662	125	945	2	2022-06-14	5	5.00	650.00	680.00	3230.00	142.50
11657	1663	125	1088	2	2022-11-19	3	5.00	10.00	10.00	28.50	0.00
11658	1664	442	471	1	2022-07-03	5	4.00	30.00	40.00	192.00	48.00
11659	1665	442	696	1	2022-08-13	3	5.00	250.00	300.00	855.00	142.50
11660	1666	442	1089	1	2022-01-02	3	5.00	0.00	0.00	0.00	0.00
11661	1667	442	1090	1	2023-12-28	2	3.00	90.00	90.00	174.60	0.00
11662	1668	442	1091	1	2023-10-08	3	5.00	60.00	70.00	199.50	28.50
11663	1669	442	629	1	2023-09-08	3	4.00	10.00	10.00	28.80	0.00
11664	1670	383	412	2	2022-08-15	4	2.00	920.00	1020.00	3998.40	392.00
11665	1671	141	1092	2	2023-09-26	3	5.00	20.00	20.00	57.00	0.00
11666	1672	443	826	5	2022-05-25	2	3.00	50.00	60.00	116.40	19.40
11667	1673	444	67	2	2023-07-06	4	3.00	140.00	170.00	659.60	116.40
11668	1674	445	509	5	2022-08-28	2	4.00	160.00	200.00	384.00	76.80
11669	1675	34	906	2	2023-03-18	2	3.00	20.00	20.00	38.80	0.00
11670	1676	34	1046	2	2022-04-30	3	3.00	10.00	10.00	29.10	0.00
11671	1677	152	55	2	2023-04-14	3	3.00	90.00	100.00	291.00	29.10
11672	1678	152	100	2	2023-05-16	3	4.00	20.00	20.00	57.60	0.00
11673	1679	325	872	2	2022-01-19	1	3.00	60.00	60.00	58.20	0.00
11674	1680	325	832	2	2022-02-18	3	4.00	30.00	30.00	86.40	0.00
11675	1681	325	1093	2	2023-11-22	2	2.00	40.00	40.00	78.40	0.00
11676	1682	325	1094	2	2022-07-15	4	4.00	340.00	400.00	1536.00	230.40
11677	1683	204	641	1	2023-07-08	1	4.00	20.00	20.00	19.20	0.00
11678	1684	111	628	2	2023-06-01	3	3.00	10.00	10.00	29.10	0.00
11679	1685	125	1095	5	2023-01-23	2	5.00	90.00	100.00	190.00	19.00
11680	1686	125	923	5	2023-11-13	2	2.00	0.00	0.00	0.00	0.00
11681	1687	125	1096	5	2022-05-27	2	4.00	10.00	10.00	19.20	0.00
11682	1688	12	740	5	2022-02-14	2	3.00	10.00	10.00	19.40	0.00
11683	1689	12	623	5	2022-07-26	2	4.00	270.00	310.00	595.20	76.80
11684	1690	130	11	2	2022-02-17	6	4.00	760.00	850.00	4896.00	518.40
11685	1691	446	1071	2	2023-06-21	5	3.00	20.00	30.00	145.50	48.50
11686	1692	446	74	2	2023-12-07	5	3.00	10.00	10.00	48.50	0.00
11687	1693	51	494	2	2022-06-30	5	3.00	20.00	20.00	97.00	0.00
11688	1694	447	1097	1	2022-04-03	2	2.00	10.00	10.00	19.60	0.00
11689	1695	448	1098	1	2023-06-08	4	5.00	50.00	60.00	228.00	38.00
11690	1696	448	309	1	2023-10-14	3	5.00	10.00	10.00	28.50	0.00
11691	1697	448	67	1	2023-02-08	2	2.00	90.00	100.00	196.00	19.60
11692	1698	204	651	2	2022-02-02	2	4.00	100.00	110.00	211.20	19.20
11693	1699	204	1099	2	2022-10-26	7	2.00	20.00	20.00	137.20	0.00
11694	1700	68	839	1	2022-08-27	6	3.00	450.00	520.00	3026.40	407.40
11695	1701	134	778	1	2023-10-13	2	4.00	10.00	10.00	19.20	0.00
11696	1702	134	468	1	2023-02-16	9	3.00	1560.00	1930.00	16848.90	3230.10
11697	1703	134	812	1	2023-09-06	2	2.00	10.00	10.00	19.60	0.00
11698	1704	449	1100	2	2023-04-15	5	3.00	10.00	10.00	48.50	0.00
11699	1705	406	829	7	2023-04-27	3	5.00	10.00	10.00	28.50	0.00
11700	1706	210	613	2	2022-01-26	2	2.00	10.00	10.00	19.60	0.00
11701	1707	37	1101	2	2022-06-29	6	3.00	40.00	40.00	232.80	0.00
11702	1708	37	919	2	2023-02-05	2	5.00	140.00	150.00	285.00	19.00
11703	1709	37	1102	2	2023-11-08	2	3.00	10.00	10.00	19.40	0.00
11704	1710	37	52	2	2023-02-08	1	5.00	70.00	70.00	66.50	0.00
11705	1711	37	182	2	2023-06-17	5	3.00	20.00	20.00	97.00	0.00
11706	1712	37	167	2	2022-09-06	14	2.00	1410.00	1700.00	23324.00	3978.80
11707	1713	35	1103	2	2023-08-19	6	4.00	10.00	10.00	57.60	0.00
11708	1714	101	189	1	2023-05-24	7	4.00	680.00	770.00	5174.40	604.80
11709	1715	152	1104	2	2022-02-23	2	3.00	250.00	310.00	601.40	116.40
11710	1716	383	309	2	2023-01-19	2	3.00	10.00	10.00	19.40	0.00
11711	1717	383	536	2	2023-04-23	5	4.00	200.00	240.00	1152.00	192.00
11712	1718	383	73	2	2023-05-16	5	3.00	420.00	450.00	2182.50	145.50
11713	1719	383	1105	2	2023-06-03	4	4.00	40.00	40.00	153.60	0.00
11714	1720	383	528	2	2022-10-04	8	2.00	30.00	40.00	313.60	78.40
11715	1721	383	529	2	2022-01-03	4	4.00	50.00	50.00	192.00	0.00
11716	1722	118	836	2	2023-01-17	2	4.00	150.00	160.00	307.20	19.20
11717	1723	118	1106	2	2022-12-15	4	5.00	240.00	260.00	988.00	76.00
11718	1724	118	1107	2	2023-05-08	3	2.00	320.00	360.00	1058.40	117.60
11719	1725	130	1108	5	2023-08-14	3	2.00	400.00	430.00	1264.20	88.20
11720	1726	130	1109	5	2022-11-20	2	3.00	0.00	0.00	0.00	0.00
11721	1727	130	1110	5	2023-05-08	4	3.00	70.00	90.00	349.20	77.60
11722	1728	450	1111	1	2023-10-21	5	4.00	1000.00	1050.00	5040.00	240.00
11723	1729	30	1073	7	2023-02-23	4	3.00	80.00	100.00	388.00	77.60
11724	1730	30	710	7	2023-02-26	3	4.00	10.00	10.00	28.80	0.00
11725	1731	451	1112	2	2023-03-12	8	2.00	90.00	100.00	784.00	78.40
11726	1732	451	129	2	2023-02-19	2	4.00	10.00	10.00	19.20	0.00
11727	1733	452	427	2	2022-05-15	3	5.00	320.00	340.00	969.00	57.00
11728	1734	452	282	2	2023-01-02	4	5.00	140.00	150.00	570.00	38.00
11729	1735	312	1113	1	2023-05-02	2	2.00	20.00	30.00	58.80	19.60
11730	1736	312	896	1	2023-08-02	5	4.00	20.00	20.00	96.00	0.00
11731	1737	312	7	1	2023-10-11	3	4.00	0.00	0.00	0.00	0.00
11732	1738	60	471	2	2022-02-01	3	5.00	30.00	30.00	85.50	0.00
11733	1739	60	1045	2	2022-12-22	2	5.00	20.00	20.00	38.00	0.00
11734	1740	60	1114	2	2022-08-15	5	3.00	120.00	130.00	630.50	48.50
11735	1741	449	949	2	2022-02-02	8	3.00	20.00	20.00	155.20	0.00
11736	1742	12	1115	2	2022-07-14	4	5.00	20.00	20.00	76.00	0.00
11737	1743	12	1074	2	2023-03-15	2	2.00	10.00	10.00	19.60	0.00
11738	1744	12	701	2	2023-12-04	2	2.00	10.00	10.00	19.60	0.00
11739	1745	12	553	2	2023-10-04	7	5.00	370.00	440.00	2926.00	465.50
11740	1746	181	159	5	2023-12-30	2	3.00	10.00	10.00	19.40	0.00
11741	1747	312	606	1	2022-12-26	8	5.00	10.00	10.00	76.00	0.00
11742	1748	312	1116	1	2022-01-12	3	5.00	10.00	10.00	28.50	0.00
11743	1749	15	725	2	2023-02-24	2	5.00	10.00	10.00	19.00	0.00
11744	1750	15	1027	2	2023-09-06	3	4.00	10.00	10.00	28.80	0.00
11745	1751	453	1117	2	2022-10-08	2	4.00	180.00	210.00	403.20	57.60
11746	1752	454	284	5	2023-05-11	2	2.00	10.00	10.00	19.60	0.00
11747	1753	60	822	5	2022-02-17	9	4.00	500.00	560.00	4838.40	518.40
11748	1754	60	1083	5	2022-05-20	2	3.00	100.00	110.00	213.40	19.40
11749	1755	60	1118	5	2022-12-15	2	2.00	10.00	10.00	19.60	0.00
11750	1756	7	840	1	2022-05-30	11	3.00	300.00	360.00	3841.20	640.20
11751	1757	7	1119	1	2022-12-19	6	3.00	1510.00	1720.00	10010.40	1222.20
11752	1758	15	1003	5	2022-08-28	6	4.00	30.00	40.00	230.40	57.60
11753	1759	141	826	2	2022-01-22	2	3.00	40.00	50.00	97.00	19.40
11754	1760	130	360	2	2022-09-28	3	5.00	20.00	20.00	57.00	0.00
11755	1761	287	1120	2	2022-06-08	4	2.00	340.00	410.00	1607.20	274.40
11756	1762	287	1121	2	2022-12-10	6	2.00	30.00	30.00	176.40	0.00
11757	1763	287	1122	2	2023-02-05	3	5.00	260.00	290.00	826.50	85.50
11758	1764	455	355	2	2022-07-17	2	5.00	40.00	40.00	76.00	0.00
11759	1765	455	618	2	2023-02-25	1	3.00	0.00	0.00	0.00	0.00
11760	1766	455	1123	2	2022-03-18	9	4.00	100.00	110.00	950.40	86.40
11761	1767	455	1124	2	2023-12-05	2	2.00	10.00	10.00	19.60	0.00
11762	1768	456	49	2	2023-10-25	4	5.00	10.00	10.00	38.00	0.00
11763	1769	456	142	2	2022-10-19	5	2.00	40.00	50.00	245.00	49.00
11764	1770	227	483	2	2022-04-20	4	4.00	10.00	10.00	38.40	0.00
11765	1771	227	45	2	2022-07-26	7	2.00	10.00	10.00	68.60	0.00
11766	1772	74	855	1	2022-11-18	2	5.00	80.00	100.00	190.00	38.00
11767	1773	74	198	1	2023-08-11	6	2.00	50.00	60.00	352.80	58.80
11768	1774	457	1125	2	2023-11-17	2	5.00	20.00	20.00	38.00	0.00
11769	1775	457	1126	2	2022-10-02	9	2.00	440.00	500.00	4410.00	529.20
11770	1776	457	1127	2	2023-04-20	2	4.00	10.00	10.00	19.20	0.00
11771	1777	457	817	2	2022-08-15	1	4.00	0.00	0.00	0.00	0.00
11772	1778	27	1128	2	2022-01-25	9	5.00	300.00	370.00	3163.50	598.50
11773	1779	27	426	2	2023-02-05	5	3.00	10.00	10.00	48.50	0.00
11774	1780	383	809	2	2022-04-01	3	4.00	50.00	60.00	172.80	28.80
11775	1781	383	226	2	2023-10-11	1	3.00	70.00	80.00	77.60	9.70
11776	1782	140	1129	2	2023-06-30	2	5.00	10.00	10.00	19.00	0.00
11777	1783	140	801	2	2022-10-22	3	3.00	100.00	120.00	349.20	58.20
11778	1784	269	1083	2	2022-11-16	4	3.00	210.00	220.00	853.60	38.80
11779	1785	269	961	2	2023-01-31	6	5.00	80.00	100.00	570.00	114.00
11780	1786	269	864	2	2023-08-12	8	3.00	30.00	30.00	232.80	0.00
11781	1787	269	1130	2	2022-07-25	3	4.00	80.00	90.00	259.20	28.80
11782	1788	458	818	2	2022-11-27	3	2.00	120.00	130.00	382.20	29.40
11783	1789	458	755	2	2023-02-17	2	4.00	570.00	700.00	1344.00	249.60
11784	1790	458	1131	2	2023-04-20	5	3.00	130.00	140.00	679.00	48.50
11785	1791	383	594	2	2022-10-06	1	3.00	50.00	50.00	48.50	0.00
11786	1792	8	1132	5	2023-02-14	8	5.00	2300.00	2810.00	21356.00	3876.00
11787	1793	8	1133	5	2023-11-19	4	3.00	40.00	50.00	194.00	38.80
11788	1794	34	118	2	2022-09-02	2	5.00	60.00	60.00	114.00	0.00
11789	1795	459	916	2	2023-06-17	3	3.00	100.00	110.00	320.10	29.10
11790	1796	126	862	5	2022-09-30	8	2.00	50.00	60.00	470.40	78.40
11791	1797	126	1134	5	2022-10-20	3	2.00	280.00	350.00	1029.00	205.80
11792	1798	126	9	5	2022-04-01	6	2.00	40.00	40.00	235.20	0.00
11793	1799	308	485	2	2022-06-22	5	2.00	200.00	220.00	1078.00	98.00
11794	1800	452	204	1	2023-04-19	4	4.00	10.00	10.00	38.40	0.00
11795	1801	452	1135	1	2022-03-13	3	5.00	40.00	50.00	142.50	28.50
11796	1802	460	1007	2	2023-10-07	1	4.00	0.00	0.00	0.00	0.00
11797	1803	71	441	1	2022-10-15	1	3.00	10.00	10.00	9.70	0.00
11798	1804	71	466	1	2023-10-23	7	2.00	4150.00	4660.00	31967.60	3498.60
11799	1805	71	1136	1	2022-11-19	2	4.00	70.00	80.00	153.60	19.20
11800	1806	19	884	5	2023-08-03	7	5.00	2400.00	2580.00	17157.00	1197.00
11801	1807	19	511	5	2022-06-01	7	3.00	40.00	50.00	339.50	67.90
11802	1808	19	478	5	2022-01-07	7	3.00	230.00	250.00	1697.50	135.80
11803	1809	461	1137	5	2022-09-01	7	3.00	60.00	70.00	475.30	67.90
11804	1810	322	1138	2	2023-03-16	7	3.00	20.00	20.00	135.80	0.00
11805	1811	322	1139	2	2023-12-29	3	2.00	40.00	50.00	147.00	29.40
11806	1812	462	122	1	2022-03-12	7	5.00	1200.00	1440.00	9576.00	1596.00
11807	1813	76	276	2	2022-05-06	5	4.00	70.00	80.00	384.00	48.00
11808	1814	76	397	2	2023-11-05	2	2.00	0.00	0.00	0.00	0.00
11809	1815	156	224	2	2022-07-25	3	2.00	150.00	170.00	499.80	58.80
11810	1816	203	1140	7	2022-04-11	2	3.00	10.00	10.00	19.40	0.00
11811	1817	203	183	7	2022-08-24	2	5.00	10.00	10.00	19.00	0.00
11812	1818	234	1141	1	2023-02-15	2	4.00	10.00	10.00	19.20	0.00
11813	1819	118	1142	2	2022-02-24	2	3.00	80.00	80.00	155.20	0.00
11814	1820	118	1143	2	2022-07-24	2	3.00	30.00	30.00	58.20	0.00
11815	1821	74	1144	2	2023-12-08	6	2.00	90.00	90.00	529.20	0.00
11816	1822	74	53	2	2022-11-05	4	2.00	10.00	10.00	39.20	0.00
11817	1823	74	1145	2	2022-10-30	3	4.00	60.00	60.00	172.80	0.00
11818	1824	74	1146	2	2022-12-22	1	2.00	10.00	10.00	9.80	0.00
11819	1825	463	865	2	2022-03-27	10	3.00	20.00	30.00	291.00	97.00
11820	1826	463	346	2	2023-09-02	4	3.00	10.00	10.00	38.80	0.00
11821	1827	463	1147	2	2023-11-20	1	5.00	20.00	20.00	19.00	0.00
11822	1828	464	1148	1	2023-09-01	3	3.00	1060.00	1130.00	3288.30	203.70
11823	1829	369	713	1	2023-09-01	6	4.00	30.00	40.00	230.40	57.60
11824	1830	228	1149	2	2023-11-24	2	4.00	670.00	780.00	1497.60	211.20
11825	1831	465	1150	7	2023-05-27	8	5.00	1150.00	1440.00	10944.00	2204.00
11826	1832	465	737	7	2023-06-11	1	4.00	220.00	260.00	249.60	38.40
11827	1833	334	867	2	2022-02-10	3	2.00	200.00	210.00	617.40	29.40
11828	1834	466	1151	2	2023-03-29	3	3.00	1300.00	1440.00	4190.40	407.40
11829	1835	466	1152	2	2022-09-17	7	3.00	30.00	40.00	271.60	67.90
11830	1836	467	19	5	2023-07-13	5	3.00	20.00	20.00	97.00	0.00
11831	1837	468	160	1	2022-05-09	7	4.00	1000.00	1250.00	8400.00	1680.00
11832	1838	98	3	2	2023-05-10	3	3.00	20.00	20.00	58.20	0.00
11833	1839	98	94	2	2023-03-19	4	5.00	30.00	40.00	152.00	38.00
11834	1840	98	1153	2	2022-04-09	1	4.00	60.00	60.00	57.60	0.00
11835	1841	98	127	2	2023-01-17	2	5.00	70.00	80.00	152.00	19.00
11836	1842	469	1154	2	2022-06-14	1	3.00	120.00	140.00	135.80	19.40
11837	1843	162	301	1	2022-03-03	4	2.00	40.00	40.00	156.80	0.00
11838	1844	162	1155	1	2022-03-19	2	2.00	40.00	40.00	78.40	0.00
11839	1845	68	26	2	2023-05-15	3	5.00	80.00	90.00	256.50	28.50
11840	1846	470	129	1	2023-08-29	6	2.00	30.00	40.00	235.20	58.80
11841	1847	470	1156	1	2023-01-06	2	2.00	30.00	40.00	78.40	19.60
11842	1848	351	292	7	2022-12-26	3	3.00	330.00	360.00	1047.60	87.30
11843	1849	351	308	7	2023-08-16	2	3.00	10.00	10.00	19.40	0.00
11844	1850	471	1157	1	2022-11-11	1	5.00	30.00	30.00	28.50	0.00
11845	1851	471	578	1	2023-02-02	5	2.00	690.00	830.00	4067.00	686.00
11846	1852	471	1158	1	2023-11-25	5	4.00	20.00	30.00	144.00	48.00
11847	1853	471	374	1	2022-07-26	7	2.00	90.00	110.00	754.60	137.20
11848	1854	471	1159	1	2022-02-10	2	2.00	80.00	100.00	196.00	39.20
11849	1855	471	87	1	2023-03-23	5	5.00	120.00	140.00	665.00	95.00
11850	1856	376	1160	2	2022-02-23	3	4.00	10.00	10.00	28.80	0.00
11851	1857	34	912	1	2022-02-10	5	4.00	120.00	130.00	624.00	48.00
11852	1858	34	1161	1	2023-03-19	4	2.00	30.00	30.00	117.60	0.00
11853	1859	472	15	5	2022-05-22	2	5.00	130.00	140.00	266.00	19.00
11854	1860	472	1162	5	2022-07-21	1	4.00	90.00	100.00	96.00	9.60
11855	1861	31	1163	5	2023-08-10	2	5.00	230.00	260.00	494.00	57.00
11856	1862	31	174	5	2023-07-11	4	4.00	100.00	120.00	460.80	76.80
11857	1863	73	178	7	2022-09-11	4	2.00	50.00	50.00	196.00	0.00
11858	1864	400	310	2	2022-02-10	5	4.00	650.00	730.00	3504.00	384.00
11859	1865	400	1164	2	2022-07-11	3	4.00	20.00	20.00	57.60	0.00
11860	1866	473	1165	7	2023-06-17	3	2.00	340.00	370.00	1087.80	88.20
11861	1867	474	796	5	2023-07-21	5	4.00	170.00	200.00	960.00	144.00
11862	1868	282	1166	2	2022-08-02	6	2.00	20.00	30.00	176.40	58.80
11863	1869	282	1167	2	2023-10-07	2	3.00	70.00	80.00	155.20	19.40
11864	1870	6	713	1	2023-12-14	1	2.00	10.00	10.00	9.80	0.00
11865	1871	60	1168	2	2023-06-13	5	4.00	90.00	100.00	480.00	48.00
11866	1872	60	446	2	2022-10-12	2	3.00	660.00	800.00	1552.00	271.60
11867	1873	60	1169	2	2023-02-02	1	5.00	230.00	270.00	256.50	38.00
11868	1874	475	1170	2	2023-11-24	1	5.00	60.00	70.00	66.50	9.50
11869	1875	115	886	2	2022-11-20	2	5.00	20.00	20.00	38.00	0.00
11870	1876	365	588	2	2023-10-26	1	4.00	150.00	180.00	172.80	28.80
11871	1877	73	470	2	2023-05-25	3	3.00	450.00	470.00	1367.70	58.20
11872	1878	14	813	2	2023-05-16	4	2.00	330.00	390.00	1528.80	235.20
11873	1879	14	203	2	2023-08-15	3	5.00	280.00	300.00	855.00	57.00
11874	1880	251	987	2	2022-06-12	9	2.00	60.00	70.00	617.40	88.20
11875	1881	383	1171	7	2022-03-04	3	5.00	30.00	30.00	85.50	0.00
11876	1882	383	65	7	2023-05-27	7	4.00	320.00	380.00	2553.60	403.20
11877	1883	383	427	7	2022-04-03	4	3.00	530.00	560.00	2172.80	116.40
11878	1884	282	969	2	2023-07-15	7	4.00	200.00	220.00	1478.40	134.40
11879	1885	476	1172	1	2023-05-26	2	4.00	10.00	10.00	19.20	0.00
11880	1886	37	1173	1	2023-06-09	3	2.00	20.00	30.00	88.20	29.40
11881	1887	477	463	5	2023-10-26	2	5.00	10.00	10.00	19.00	0.00
11882	1888	477	897	5	2023-02-09	8	5.00	320.00	400.00	3040.00	608.00
11883	1889	478	514	5	2023-02-11	4	4.00	110.00	120.00	460.80	38.40
11884	1890	478	343	5	2022-04-17	3	3.00	370.00	410.00	1193.10	116.40
11885	1891	479	524	2	2023-12-11	2	3.00	10.00	10.00	19.40	0.00
11886	1892	479	1174	2	2023-10-29	1	4.00	0.00	0.00	0.00	0.00
11887	1893	480	1171	1	2023-12-21	1	3.00	10.00	10.00	9.70	0.00
11888	1894	481	1175	2	2023-12-11	1	3.00	20.00	20.00	19.40	0.00
11889	1895	482	1176	5	2022-02-23	3	5.00	30.00	30.00	85.50	0.00
11890	1896	483	570	2	2022-04-19	2	2.00	410.00	490.00	960.40	156.80
11891	1897	42	1177	5	2023-07-15	2	4.00	1520.00	1790.00	3436.80	518.40
11892	1898	484	1178	1	2023-01-27	2	5.00	30.00	30.00	57.00	0.00
11893	1899	484	1179	1	2022-06-13	4	4.00	430.00	510.00	1958.40	307.20
11894	1900	484	439	1	2023-01-19	3	3.00	140.00	170.00	494.70	87.30
11895	1901	485	912	1	2022-12-29	6	3.00	180.00	190.00	1105.80	58.20
11896	1902	486	1180	5	2022-05-17	2	3.00	10.00	10.00	19.40	0.00
11897	1903	487	645	5	2022-03-27	1	5.00	10.00	10.00	9.50	0.00
11898	1904	487	1181	5	2022-02-12	2	3.00	430.00	480.00	931.20	97.00
11899	1905	487	937	5	2022-03-28	2	4.00	20.00	30.00	57.60	19.20
11900	1906	488	419	5	2023-06-25	8	3.00	770.00	910.00	7061.60	1086.40
11901	1907	489	1182	2	2023-01-11	2	2.00	0.00	0.00	0.00	0.00
11902	1908	489	492	2	2022-08-26	6	3.00	30.00	30.00	174.60	0.00
11903	1909	177	1183	5	2022-01-08	4	2.00	120.00	140.00	548.80	78.40
11904	1910	245	1184	2	2023-05-19	2	3.00	20.00	20.00	38.80	0.00
11905	1911	177	218	2	2022-11-08	3	4.00	80.00	100.00	288.00	57.60
11906	1912	34	1185	1	2022-08-07	7	3.00	240.00	270.00	1833.30	203.70
11907	1913	34	1186	1	2023-02-04	3	2.00	520.00	600.00	1764.00	235.20
11908	1914	340	247	5	2023-05-19	5	3.00	130.00	150.00	727.50	97.00
11909	1915	490	1187	2	2022-01-29	2	2.00	0.00	0.00	0.00	0.00
11910	1916	490	901	2	2022-05-14	3	3.00	20.00	20.00	58.20	0.00
11911	1917	490	640	2	2022-05-24	3	3.00	10.00	10.00	29.10	0.00
11912	1918	491	373	2	2022-08-15	5	2.00	10.00	10.00	49.00	0.00
11913	1919	286	1188	1	2023-01-23	2	3.00	280.00	300.00	582.00	38.80
11914	1920	424	1189	5	2022-12-17	5	3.00	800.00	900.00	4365.00	485.00
11915	1921	424	1190	5	2023-12-29	2	2.00	400.00	460.00	901.60	117.60
11916	1922	492	1191	2	2022-09-29	2	2.00	20.00	20.00	39.20	0.00
11917	1923	493	1192	1	2023-02-06	9	5.00	720.00	860.00	7353.00	1197.00
11918	1924	493	398	1	2023-06-01	3	3.00	40.00	50.00	145.50	29.10
11919	1925	178	335	1	2022-04-15	3	2.00	70.00	90.00	264.60	58.80
11920	1926	111	296	2	2022-05-25	2	5.00	170.00	200.00	380.00	57.00
11921	1927	70	1193	2	2022-01-02	3	2.00	160.00	180.00	529.20	58.80
11922	1928	88	418	5	2023-08-14	2	4.00	80.00	90.00	172.80	19.20
11923	1929	67	1194	1	2023-06-04	1	3.00	10.00	10.00	9.70	0.00
11924	1930	67	244	1	2022-02-19	1	5.00	40.00	50.00	47.50	9.50
11925	1931	67	904	1	2022-09-07	3	5.00	590.00	660.00	1881.00	199.50
11926	1932	313	1195	1	2023-06-28	1	2.00	240.00	270.00	264.60	29.40
11927	1933	439	1196	1	2022-05-15	3	3.00	140.00	150.00	436.50	29.10
11928	1934	439	51	1	2022-04-12	5	2.00	20.00	20.00	98.00	0.00
11929	1935	142	1159	2	2022-02-07	5	3.00	210.00	240.00	1164.00	145.50
11930	1936	142	1197	2	2022-10-04	8	2.00	140.00	170.00	1332.80	235.20
11931	1937	427	876	1	2023-03-28	3	4.00	10.00	10.00	28.80	0.00
11932	1938	494	1198	2	2022-04-08	2	3.00	20.00	20.00	38.80	0.00
11933	1939	494	1199	2	2022-06-04	7	5.00	20.00	30.00	199.50	66.50
11934	1940	494	25	2	2023-11-13	4	3.00	10.00	10.00	38.80	0.00
11935	1941	494	158	2	2022-01-03	3	5.00	580.00	660.00	1881.00	228.00
11936	1942	139	199	5	2023-03-04	4	4.00	40.00	50.00	192.00	38.40
11937	1943	139	457	5	2022-03-01	2	3.00	30.00	30.00	58.20	0.00
11938	1944	139	752	5	2022-05-20	9	2.00	0.00	0.00	0.00	0.00
11939	1945	495	1017	2	2023-11-22	4	4.00	90.00	100.00	384.00	38.40
11940	1946	495	1146	2	2022-10-23	2	2.00	10.00	10.00	19.60	0.00
11941	1947	253	333	2	2022-11-18	2	4.00	20.00	20.00	38.40	0.00
11942	1948	253	1138	2	2023-08-20	2	4.00	10.00	10.00	19.20	0.00
11943	1949	253	412	2	2022-11-20	1	3.00	230.00	250.00	242.50	19.40
11944	1950	253	96	2	2023-04-03	1	5.00	10.00	10.00	9.50	0.00
11945	1951	253	926	2	2022-10-04	8	3.00	20.00	30.00	232.80	77.60
11946	1952	253	782	2	2022-04-29	3	4.00	160.00	200.00	576.00	115.20
11947	1953	253	1043	2	2022-03-21	6	2.00	20.00	20.00	117.60	0.00
11948	1954	253	464	2	2023-05-11	5	3.00	1190.00	1280.00	6208.00	436.50
11949	1955	253	1200	2	2023-05-24	3	3.00	0.00	0.00	0.00	0.00
11950	1956	253	1201	2	2023-03-02	2	2.00	210.00	240.00	470.40	58.80
11951	1957	253	202	2	2023-02-08	3	4.00	140.00	170.00	489.60	86.40
11952	1958	253	1118	2	2023-05-02	4	2.00	20.00	20.00	78.40	0.00
11953	1959	496	807	1	2023-01-05	3	2.00	20.00	20.00	58.80	0.00
11954	1960	496	1202	1	2023-01-21	3	2.00	30.00	30.00	88.20	0.00
11955	1961	496	1090	1	2022-12-23	5	5.00	270.00	300.00	1425.00	142.50
11956	1962	496	1203	1	2022-10-19	6	4.00	90.00	110.00	633.60	115.20
11957	1963	496	1204	1	2023-04-05	3	2.00	10.00	10.00	29.40	0.00
11958	1964	496	1026	1	2023-09-05	5	2.00	20.00	20.00	98.00	0.00
11959	1965	496	622	1	2022-06-10	3	2.00	250.00	290.00	852.60	117.60
11960	1966	496	1205	1	2022-07-22	2	4.00	20.00	20.00	38.40	0.00
11961	1967	497	540	2	2022-04-04	3	5.00	240.00	280.00	798.00	114.00
11962	1968	497	1206	2	2022-10-18	5	5.00	60.00	70.00	332.50	47.50
11963	1969	497	163	2	2023-01-11	3	5.00	140.00	170.00	484.50	85.50
11964	1970	498	172	2	2022-06-02	4	4.00	230.00	290.00	1113.60	230.40
11965	1971	39	1127	2	2022-12-20	3	5.00	10.00	10.00	28.50	0.00
11966	1972	39	172	2	2023-06-25	7	3.00	380.00	410.00	2783.90	203.70
11967	1973	101	1207	2	2023-04-30	4	4.00	10.00	10.00	38.40	0.00
11968	1974	101	805	2	2022-02-05	2	4.00	0.00	0.00	0.00	0.00
11969	1975	101	1208	2	2023-06-21	3	2.00	40.00	40.00	117.60	0.00
11970	1976	499	197	1	2023-07-05	3	2.00	260.00	280.00	823.20	58.80
11971	1977	499	1209	1	2022-09-27	5	5.00	1310.00	1390.00	6602.50	380.00
11972	1978	499	1210	1	2023-06-05	6	2.00	470.00	550.00	3234.00	470.40
11973	1979	208	1211	2	2022-01-05	2	2.00	10.00	10.00	19.60	0.00
11974	1980	406	285	7	2022-07-18	4	4.00	800.00	930.00	3571.20	499.20
11975	1981	406	231	7	2023-09-28	4	5.00	40.00	40.00	152.00	0.00
11976	1982	135	621	1	2022-01-17	2	2.00	0.00	0.00	0.00	0.00
11977	1983	500	1212	2	2022-03-27	4	3.00	430.00	480.00	1862.40	194.00
11978	1984	501	651	1	2023-05-22	6	4.00	280.00	320.00	1843.20	230.40
11979	1985	501	741	1	2022-07-01	3	2.00	20.00	20.00	58.80	0.00
11980	1986	501	1071	1	2022-06-16	4	2.00	30.00	30.00	117.60	0.00
11981	1987	51	307	5	2023-10-20	4	5.00	1200.00	1440.00	5472.00	912.00
11982	1988	496	1213	2	2022-04-14	3	3.00	20.00	20.00	58.20	0.00
11983	1989	496	1214	2	2023-02-09	7	5.00	870.00	1020.00	6783.00	997.50
11984	1990	496	1215	2	2022-01-29	3	4.00	30.00	30.00	86.40	0.00
11985	1991	496	1216	2	2022-04-17	3	5.00	20.00	20.00	57.00	0.00
11986	1992	71	926	2	2023-07-16	4	4.00	0.00	0.00	0.00	0.00
11987	1993	502	430	2	2022-11-04	6	2.00	60.00	70.00	411.60	58.80
11988	1994	502	1217	2	2023-11-05	2	3.00	10.00	10.00	19.40	0.00
11989	1995	502	1218	2	2022-11-22	3	4.00	10.00	10.00	28.80	0.00
11990	1996	75	1219	1	2023-01-25	5	3.00	260.00	290.00	1406.50	145.50
11991	1997	75	494	1	2022-08-03	4	3.00	10.00	10.00	38.80	0.00
11992	1998	503	548	5	2023-05-27	4	5.00	20.00	20.00	76.00	0.00
11993	1999	503	298	5	2022-09-06	1	2.00	140.00	160.00	156.80	19.60
11994	2000	503	1130	5	2023-04-17	5	3.00	110.00	140.00	679.00	145.50
11995	2001	62	98	2	2023-12-20	5	2.00	170.00	200.00	980.00	147.00
11996	2002	62	1055	2	2022-10-29	7	3.00	30.00	40.00	271.60	67.90
11997	2003	226	912	1	2022-07-16	3	3.00	100.00	100.00	291.00	0.00
11998	2004	226	65	1	2022-09-11	5	5.00	290.00	300.00	1425.00	47.50
11999	2005	504	93	2	2023-07-02	3	4.00	10.00	10.00	28.80	0.00
12000	2006	505	754	2	2022-03-08	7	5.00	30.00	30.00	199.50	0.00
12001	2007	505	235	2	2023-11-05	7	5.00	40.00	50.00	332.50	66.50
12002	2008	118	1220	5	2023-10-16	2	4.00	150.00	180.00	345.60	57.60
12003	2009	506	1040	2	2023-12-19	3	5.00	0.00	0.00	0.00	0.00
12004	2010	506	78	2	2023-03-10	2	2.00	270.00	330.00	646.80	117.60
12005	2011	506	566	2	2022-07-10	4	2.00	20.00	20.00	78.40	0.00
12006	2012	188	591	7	2022-06-16	2	4.00	150.00	160.00	307.20	19.20
12007	2013	188	1221	7	2023-03-12	3	3.00	50.00	50.00	145.50	0.00
12008	2014	507	1132	2	2022-08-10	1	3.00	290.00	350.00	339.50	58.20
12009	2015	507	1222	2	2023-09-25	2	4.00	10.00	10.00	19.20	0.00
12010	2016	507	907	2	2023-09-06	4	4.00	820.00	900.00	3456.00	307.20
12011	2017	508	1046	2	2023-01-17	2	4.00	20.00	20.00	38.40	0.00
12012	2018	508	3	2	2022-05-05	2	3.00	10.00	10.00	19.40	0.00
12013	2019	508	1060	2	2023-02-04	4	2.00	20.00	30.00	117.60	39.20
12014	2020	508	187	2	2023-04-17	6	4.00	30.00	40.00	230.40	57.60
12015	2021	509	519	5	2023-07-04	9	2.00	1430.00	1610.00	14200.20	1587.60
12016	2022	509	127	5	2023-06-26	3	5.00	20.00	20.00	57.00	0.00
12017	2023	509	730	5	2023-11-01	3	2.00	50.00	50.00	147.00	0.00
12018	2024	509	636	5	2022-12-23	4	5.00	700.00	870.00	3306.00	646.00
12019	2025	362	980	1	2022-07-22	5	3.00	200.00	240.00	1164.00	194.00
12020	2026	6	632	5	2023-12-11	2	2.00	110.00	140.00	274.40	58.80
12021	2027	510	341	1	2022-02-28	2	2.00	30.00	30.00	58.80	0.00
12022	2028	510	543	1	2023-02-01	4	3.00	60.00	70.00	271.60	38.80
12023	2029	511	186	2	2023-02-20	3	4.00	10.00	10.00	28.80	0.00
12024	2030	511	1223	2	2023-05-12	5	3.00	90.00	100.00	485.00	48.50
12025	2031	511	786	2	2023-04-09	4	3.00	60.00	60.00	232.80	0.00
12026	2032	511	1030	2	2023-10-05	3	2.00	10.00	10.00	29.40	0.00
12027	2033	275	708	2	2022-07-19	2	4.00	10.00	10.00	19.20	0.00
12028	2034	275	1133	2	2023-11-24	1	5.00	10.00	10.00	9.50	0.00
12029	2035	41	864	2	2022-06-14	2	3.00	10.00	10.00	19.40	0.00
12030	2036	41	52	2	2023-01-27	3	5.00	250.00	270.00	769.50	57.00
12031	2037	512	365	2	2022-06-12	3	3.00	20.00	30.00	87.30	29.10
12032	2038	512	1101	2	2022-12-12	2	3.00	10.00	10.00	19.40	0.00
12033	2039	513	1224	2	2022-12-01	3	3.00	10.00	10.00	29.10	0.00
12034	2040	513	871	2	2023-12-26	7	3.00	0.00	0.00	0.00	0.00
12035	2041	513	786	2	2023-11-02	2	4.00	10.00	10.00	19.20	0.00
12036	2042	513	1156	2	2023-08-04	5	5.00	70.00	80.00	380.00	47.50
12037	2043	248	1225	2	2023-09-13	6	2.00	50.00	60.00	352.80	58.80
12038	2044	514	925	2	2023-06-25	7	3.00	40.00	40.00	271.60	0.00
12039	2045	515	989	2	2023-02-12	3	4.00	20.00	20.00	57.60	0.00
12040	2046	516	724	2	2023-10-19	2	4.00	130.00	160.00	307.20	57.60
12041	2047	516	257	2	2023-12-12	3	4.00	500.00	600.00	1728.00	288.00
12042	2048	516	418	2	2023-06-10	1	4.00	50.00	60.00	57.60	9.60
12043	2049	71	29	5	2022-02-12	7	2.00	230.00	290.00	1989.40	411.60
12044	2050	71	758	5	2023-02-07	3	2.00	0.00	0.00	0.00	0.00
12045	2051	71	807	5	2023-05-13	4	4.00	10.00	10.00	38.40	0.00
12046	2052	71	1226	5	2022-12-31	8	4.00	280.00	340.00	2611.20	460.80
12047	2053	71	325	5	2023-12-12	5	3.00	10.00	10.00	48.50	0.00
12048	2054	71	1227	5	2022-01-30	6	5.00	30.00	30.00	171.00	0.00
12049	2055	517	1138	2	2022-03-19	3	4.00	20.00	20.00	57.60	0.00
12050	2056	166	1228	5	2022-03-03	5	4.00	170.00	200.00	960.00	144.00
12051	2057	166	630	5	2023-09-03	7	3.00	1510.00	1590.00	10796.10	543.20
12052	2058	166	107	5	2023-04-12	1	4.00	60.00	80.00	76.80	19.20
12053	2059	166	122	5	2023-12-22	2	4.00	370.00	410.00	787.20	76.80
12054	2060	19	1229	2	2022-05-06	3	3.00	10.00	10.00	29.10	0.00
12055	2061	19	1230	2	2022-05-02	5	5.00	70.00	80.00	380.00	47.50
12056	2062	19	1231	2	2022-01-22	2	2.00	20.00	20.00	39.20	0.00
12057	2063	19	1232	2	2023-01-17	13	5.00	50.00	60.00	741.00	123.50
12058	2064	19	1233	2	2023-11-22	3	5.00	20.00	20.00	57.00	0.00
12059	2065	19	538	2	2022-03-31	4	3.00	360.00	410.00	1590.80	194.00
12060	2066	19	1226	2	2022-01-02	3	2.00	130.00	150.00	441.00	58.80
12061	2067	19	1131	2	2022-05-04	9	3.00	210.00	250.00	2182.50	349.20
12062	2068	19	1025	2	2022-09-01	3	3.00	10.00	10.00	29.10	0.00
12063	2069	518	1234	2	2023-06-11	4	4.00	190.00	200.00	768.00	38.40
12064	2070	518	1235	2	2023-09-09	3	3.00	580.00	710.00	2066.10	378.30
12065	2071	325	626	1	2022-07-02	1	2.00	0.00	0.00	0.00	0.00
12066	2072	519	368	2	2023-02-12	5	4.00	240.00	280.00	1344.00	192.00
12067	2073	153	1204	2	2023-04-04	2	5.00	10.00	10.00	19.00	0.00
12068	2074	520	1236	1	2022-04-25	3	2.00	50.00	60.00	176.40	29.40
12069	2075	520	1237	1	2023-10-02	7	2.00	640.00	760.00	5213.60	823.20
12070	2076	37	276	2	2023-09-15	3	3.00	50.00	60.00	174.60	29.10
12071	2077	521	227	5	2023-01-04	5	4.00	40.00	40.00	192.00	0.00
12072	2078	521	96	5	2023-07-18	7	3.00	80.00	90.00	611.10	67.90
12073	2079	521	275	5	2023-04-07	5	4.00	70.00	90.00	432.00	96.00
12074	2080	55	1238	2	2023-01-19	7	4.00	100.00	110.00	739.20	67.20
12075	2081	55	600	2	2023-10-25	2	2.00	100.00	110.00	215.60	19.60
12076	2082	55	764	2	2022-08-05	2	3.00	10.00	10.00	19.40	0.00
12077	2083	204	911	2	2022-03-17	6	4.00	40.00	40.00	230.40	0.00
12078	2084	522	430	2	2023-02-22	2	2.00	20.00	20.00	39.20	0.00
12079	2085	31	581	2	2023-09-12	4	4.00	110.00	120.00	460.80	38.40
12080	2086	31	1239	2	2023-12-28	5	4.00	20.00	20.00	96.00	0.00
12081	2087	31	392	2	2022-07-09	5	5.00	270.00	320.00	1520.00	237.50
12082	2088	31	1159	2	2023-11-16	3	4.00	140.00	150.00	432.00	28.80
12083	2089	31	1240	2	2022-04-27	2	4.00	0.00	0.00	0.00	0.00
12084	2090	523	1241	2	2023-02-12	2	2.00	10.00	10.00	19.60	0.00
12085	2091	53	609	2	2022-10-31	3	4.00	30.00	30.00	86.40	0.00
12086	2092	53	1117	2	2023-09-21	3	2.00	250.00	310.00	911.40	176.40
12087	2093	524	993	2	2022-06-09	5	3.00	430.00	480.00	2328.00	242.50
12088	2094	525	506	1	2022-06-27	1	3.00	10.00	10.00	9.70	0.00
12089	2095	201	1242	2	2023-08-08	5	3.00	10.00	10.00	48.50	0.00
12090	2096	526	1243	2	2023-10-25	8	5.00	470.00	510.00	3876.00	304.00
12091	2097	526	1244	2	2022-11-28	4	4.00	80.00	90.00	345.60	38.40
12092	2098	526	450	2	2022-04-26	3	2.00	10.00	10.00	29.40	0.00
12093	2099	113	954	2	2023-04-02	3	3.00	40.00	40.00	116.40	0.00
12094	2100	113	1136	2	2023-08-30	7	3.00	240.00	280.00	1901.20	271.60
12095	2101	88	1245	2	2022-03-03	3	2.00	520.00	640.00	1881.60	352.80
12096	2102	88	1063	2	2022-11-21	4	3.00	80.00	80.00	310.40	0.00
12097	2103	527	395	7	2022-09-04	4	3.00	220.00	260.00	1008.80	155.20
12098	2104	253	448	1	2023-10-23	4	5.00	180.00	220.00	836.00	152.00
12099	2105	253	198	1	2023-12-26	2	3.00	30.00	30.00	58.20	0.00
12100	2106	360	975	2	2022-07-01	3	2.00	20.00	20.00	58.80	0.00
12101	2107	528	237	7	2022-11-30	1	3.00	0.00	0.00	0.00	0.00
12102	2108	529	369	7	2022-03-02	1	4.00	20.00	20.00	19.20	0.00
12103	2109	529	897	7	2022-12-09	3	3.00	340.00	400.00	1164.00	174.60
12104	2110	529	1246	7	2022-05-08	3	2.00	10.00	10.00	29.40	0.00
12105	2111	529	204	7	2023-07-25	5	2.00	20.00	20.00	98.00	0.00
12106	2112	529	39	7	2022-09-09	4	2.00	300.00	320.00	1254.40	78.40
12107	2113	529	559	7	2022-11-13	3	4.00	20.00	30.00	86.40	28.80
12108	2114	529	1247	7	2022-11-14	4	3.00	1090.00	1300.00	5044.00	814.80
12109	2115	529	1248	7	2023-06-19	2	4.00	50.00	50.00	96.00	0.00
12110	2116	529	1249	7	2023-10-03	1	2.00	370.00	430.00	421.40	58.80
12111	2117	181	1111	1	2022-09-18	1	3.00	180.00	210.00	203.70	29.10
12112	2118	530	394	2	2023-11-24	7	4.00	140.00	160.00	1075.20	134.40
12113	2119	153	219	5	2023-06-12	1	5.00	10.00	10.00	9.50	0.00
12114	2120	153	1189	5	2023-04-06	5	3.00	860.00	900.00	4365.00	194.00
12115	2121	531	745	2	2023-09-20	3	4.00	0.00	0.00	0.00	0.00
12116	2122	532	52	5	2022-02-04	3	5.00	190.00	220.00	627.00	85.50
12117	2123	533	367	1	2023-12-16	2	3.00	190.00	240.00	465.60	97.00
12118	2124	533	86	1	2022-09-29	9	2.00	30.00	30.00	264.60	0.00
12119	2125	282	1250	2	2023-08-08	5	3.00	80.00	100.00	485.00	97.00
12120	2126	282	1251	2	2022-08-09	7	3.00	50.00	60.00	407.40	67.90
12121	2127	130	358	2	2023-02-04	3	3.00	80.00	90.00	261.90	29.10
12122	2128	344	1252	2	2023-11-13	3	3.00	50.00	60.00	174.60	29.10
12123	2129	344	1005	2	2022-10-06	4	4.00	20.00	20.00	76.80	0.00
12124	2130	534	1253	1	2023-06-03	4	2.00	20.00	30.00	117.60	39.20
12125	2131	534	1254	1	2023-02-16	9	3.00	30.00	40.00	349.20	87.30
12126	2132	534	892	1	2022-03-24	7	5.00	120.00	140.00	931.00	133.00
12127	2133	383	1255	2	2023-10-04	3	3.00	20.00	20.00	58.20	0.00
12128	2134	71	14	2	2022-02-02	3	2.00	120.00	150.00	441.00	88.20
12129	2135	71	970	2	2023-01-13	7	5.00	10.00	10.00	66.50	0.00
12130	2136	71	1256	2	2023-11-09	4	3.00	80.00	90.00	349.20	38.80
12131	2137	535	1257	2	2023-03-05	5	4.00	10.00	10.00	48.00	0.00
12132	2138	535	1204	2	2022-06-29	4	4.00	0.00	0.00	0.00	0.00
12133	2139	31	594	7	2023-08-11	3	5.00	140.00	150.00	427.50	28.50
12134	2140	536	351	2	2023-07-29	9	3.00	120.00	150.00	1309.50	261.90
12135	2141	536	1258	2	2023-11-06	2	2.00	20.00	20.00	39.20	0.00
12136	2142	536	1259	2	2022-08-26	3	3.00	920.00	990.00	2880.90	203.70
12137	2143	59	70	2	2022-04-15	6	5.00	30.00	30.00	171.00	0.00
12138	2144	59	126	2	2023-01-14	2	3.00	20.00	20.00	38.80	0.00
12139	2145	59	128	2	2022-08-02	7	3.00	20.00	20.00	135.80	0.00
12140	2146	537	229	2	2022-01-07	3	4.00	390.00	420.00	1209.60	86.40
12141	2147	537	133	2	2023-07-09	4	3.00	40.00	40.00	155.20	0.00
12142	2148	537	46	2	2022-03-18	6	3.00	210.00	250.00	1455.00	232.80
12143	2149	171	785	2	2022-04-02	1	4.00	40.00	40.00	38.40	0.00
12144	2150	134	1260	2	2022-05-31	5	4.00	70.00	80.00	384.00	48.00
12145	2151	538	914	2	2023-03-23	3	3.00	210.00	230.00	669.30	58.20
12146	2152	539	405	1	2022-10-11	7	3.00	100.00	110.00	746.90	67.90
12147	2153	540	1026	2	2023-03-09	3	5.00	10.00	10.00	28.50	0.00
12148	2154	253	609	2	2023-03-01	2	2.00	10.00	10.00	19.60	0.00
12149	2155	541	1156	2	2022-05-02	3	5.00	20.00	20.00	57.00	0.00
12150	2156	4	295	1	2022-05-20	6	5.00	20.00	20.00	114.00	0.00
12151	2157	42	750	5	2023-01-20	3	4.00	460.00	500.00	1440.00	115.20
12152	2158	42	399	5	2022-07-13	3	3.00	150.00	160.00	465.60	29.10
12153	2159	542	1261	2	2022-10-12	4	2.00	20.00	20.00	78.40	0.00
12154	2160	101	909	2	2022-03-30	3	2.00	10.00	10.00	29.40	0.00
12155	2161	144	1072	7	2022-11-11	1	4.00	70.00	80.00	76.80	9.60
12156	2162	543	1262	2	2023-08-20	1	5.00	30.00	30.00	28.50	0.00
12157	2163	544	1079	2	2022-10-14	3	3.00	290.00	310.00	902.10	58.20
12158	2164	209	658	2	2023-01-03	3	5.00	170.00	190.00	541.50	57.00
12159	2165	209	1263	2	2022-04-01	2	2.00	10.00	10.00	19.60	0.00
12160	2166	209	584	2	2023-07-23	5	2.00	130.00	140.00	686.00	49.00
12161	2167	209	1168	2	2022-12-05	1	4.00	20.00	20.00	19.20	0.00
12162	2168	209	308	2	2023-11-12	7	5.00	10.00	10.00	66.50	0.00
12163	2169	545	513	1	2023-08-22	3	5.00	10.00	10.00	28.50	0.00
12164	2170	545	702	1	2023-10-03	3	3.00	60.00	70.00	203.70	29.10
12165	2171	545	161	1	2022-07-30	3	2.00	100.00	110.00	323.40	29.40
12166	2172	546	636	2	2023-09-17	2	4.00	290.00	310.00	595.20	38.40
12167	2173	37	1264	5	2022-06-17	3	3.00	20.00	20.00	58.20	0.00
12168	2174	355	1088	2	2022-10-01	3	4.00	10.00	10.00	28.80	0.00
12169	2175	34	1221	1	2022-04-15	4	3.00	50.00	60.00	232.80	38.80
12170	2176	547	1265	2	2022-07-28	2	2.00	50.00	50.00	98.00	0.00
12171	2177	547	1084	2	2023-08-24	9	2.00	50.00	60.00	529.20	88.20
12172	2178	547	1125	2	2023-02-04	5	5.00	40.00	40.00	190.00	0.00
12173	2179	547	423	2	2023-06-11	8	5.00	70.00	70.00	532.00	0.00
12174	2180	31	339	2	2022-05-03	7	2.00	80.00	90.00	617.40	68.60
12175	2181	31	430	2	2022-06-20	3	5.00	40.00	40.00	114.00	0.00
12176	2182	31	1266	2	2022-06-11	4	5.00	400.00	440.00	1672.00	152.00
12177	2183	31	1151	2	2023-02-28	5	4.00	3480.00	4000.00	19200.00	2496.00
12178	2184	31	98	2	2023-11-22	5	5.00	180.00	200.00	950.00	95.00
12179	2185	31	741	2	2022-11-19	8	5.00	50.00	60.00	456.00	76.00
12180	2186	278	142	1	2022-06-17	2	4.00	40.00	50.00	96.00	19.20
12181	2187	548	175	7	2022-04-29	2	3.00	30.00	30.00	58.20	0.00
12182	2188	167	1041	2	2022-01-03	6	2.00	60.00	70.00	411.60	58.80
12183	2189	167	72	2	2022-06-26	2	3.00	100.00	120.00	232.80	38.80
12184	2190	167	298	2	2023-04-12	9	3.00	1310.00	1450.00	12658.50	1222.20
12185	2191	14	1267	2	2022-01-30	3	5.00	50.00	60.00	171.00	28.50
12186	2192	203	1243	2	2022-04-24	3	3.00	120.00	150.00	436.50	87.30
12187	2193	203	1113	2	2022-08-29	3	4.00	70.00	70.00	201.60	0.00
12188	2194	203	1031	2	2022-02-20	4	4.00	100.00	120.00	460.80	76.80
12189	2195	203	1268	2	2023-07-29	3	3.00	30.00	40.00	116.40	29.10
12190	2196	203	1045	2	2023-06-10	5	3.00	40.00	40.00	194.00	0.00
12191	2197	549	135	2	2022-04-13	2	4.00	0.00	0.00	0.00	0.00
12192	2198	192	564	2	2023-03-17	3	5.00	10.00	10.00	28.50	0.00
12193	2199	210	90	2	2022-12-15	3	3.00	20.00	20.00	58.20	0.00
12194	2200	210	1222	2	2023-02-23	1	2.00	10.00	10.00	9.80	0.00
12195	2201	550	346	2	2023-02-18	6	4.00	20.00	20.00	115.20	0.00
12196	2202	550	203	2	2022-11-19	7	2.00	810.00	880.00	6036.80	480.20
12197	2203	551	316	2	2022-05-12	2	5.00	10.00	10.00	19.00	0.00
12198	2204	551	1269	2	2023-05-13	3	5.00	150.00	190.00	541.50	114.00
12199	2205	552	1002	2	2023-08-13	1	3.00	20.00	20.00	19.40	0.00
12200	2206	553	1270	1	2023-03-31	3	4.00	60.00	70.00	201.60	28.80
12201	2207	224	411	2	2022-11-02	7	2.00	20.00	30.00	205.80	68.60
12202	2208	224	180	2	2022-06-30	4	4.00	40.00	40.00	153.60	0.00
12203	2209	44	106	2	2023-11-13	4	5.00	20.00	20.00	76.00	0.00
12204	2210	79	1271	1	2023-03-09	7	4.00	680.00	830.00	5577.60	1008.00
12205	2211	79	237	1	2022-03-23	10	5.00	40.00	40.00	380.00	0.00
12206	2212	554	1272	5	2022-12-26	6	5.00	160.00	170.00	969.00	57.00
12207	2213	134	906	2	2023-03-23	1	5.00	20.00	30.00	28.50	9.50
12208	2214	308	752	5	2022-05-18	1	2.00	0.00	0.00	0.00	0.00
12209	2215	308	306	5	2023-05-26	13	4.00	50.00	60.00	748.80	124.80
12210	2216	308	644	5	2022-06-12	2	3.00	200.00	240.00	465.60	77.60
12211	2217	308	1273	5	2023-03-04	4	2.00	90.00	110.00	431.20	78.40
12212	2218	251	1274	2	2023-08-25	2	3.00	0.00	0.00	0.00	0.00
12213	2219	111	745	2	2022-02-22	4	5.00	10.00	10.00	38.00	0.00
12214	2220	111	356	2	2022-11-29	1	4.00	10.00	10.00	9.60	0.00
12215	2221	111	1119	2	2023-09-04	4	3.00	1090.00	1150.00	4462.00	232.80
12216	2222	555	1247	7	2022-10-23	2	5.00	450.00	490.00	931.00	76.00
12217	2223	555	513	7	2022-12-21	8	3.00	30.00	40.00	310.40	77.60
12218	2224	555	212	7	2022-11-30	1	4.00	60.00	70.00	67.20	9.60
12219	2225	325	1275	2	2022-05-13	3	3.00	50.00	50.00	145.50	0.00
12220	2226	556	1276	1	2022-02-02	1	2.00	60.00	70.00	68.60	9.80
12221	2227	466	805	2	2022-08-27	2	3.00	0.00	0.00	0.00	0.00
12222	2228	466	496	2	2023-05-23	1	2.00	110.00	120.00	117.60	9.80
12223	2229	104	1259	2	2022-04-03	1	3.00	310.00	330.00	320.10	19.40
12224	2230	37	1179	2	2022-01-25	2	3.00	540.00	670.00	1299.80	252.20
12225	2231	37	1277	2	2023-05-28	2	4.00	40.00	50.00	96.00	19.20
12226	2232	366	794	2	2022-07-25	5	3.00	470.00	530.00	2570.50	291.00
12227	2233	101	1278	2	2023-07-05	5	3.00	190.00	230.00	1115.50	194.00
12228	2234	113	1279	1	2022-12-16	4	5.00	280.00	320.00	1216.00	152.00
12229	2235	557	826	2	2023-07-11	7	3.00	200.00	210.00	1425.90	67.90
12230	2236	446	622	1	2023-02-20	2	3.00	160.00	190.00	368.60	58.20
12231	2237	446	1280	1	2022-04-11	8	4.00	20.00	20.00	153.60	0.00
12232	2238	558	1281	2	2022-02-14	5	2.00	40.00	40.00	196.00	0.00
12233	2239	28	1282	2	2022-01-13	2	4.00	30.00	40.00	76.80	19.20
12234	2240	14	451	1	2022-12-22	1	3.00	820.00	1020.00	989.40	194.00
12235	2241	14	1283	1	2022-07-12	7	2.00	30.00	40.00	274.40	68.60
12236	2242	71	904	2	2022-02-01	3	5.00	470.00	490.00	1396.50	57.00
12237	2243	559	87	2	2023-01-04	2	2.00	50.00	60.00	117.60	19.60
12238	2244	559	450	2	2023-06-28	2	3.00	10.00	10.00	19.40	0.00
12239	2245	559	486	2	2022-06-28	2	2.00	10.00	10.00	19.60	0.00
12240	2246	559	23	2	2023-05-29	1	2.00	10.00	10.00	9.80	0.00
12241	2247	559	904	2	2022-10-28	3	2.00	570.00	660.00	1940.40	264.60
12242	2248	27	1284	1	2022-07-25	2	4.00	10.00	10.00	19.20	0.00
12243	2249	27	1125	1	2022-10-16	5	3.00	30.00	40.00	194.00	48.50
12244	2250	27	615	1	2022-03-29	5	3.00	10.00	10.00	48.50	0.00
12245	2251	27	1285	1	2022-11-11	6	3.00	460.00	540.00	3142.80	465.60
12246	2252	27	1232	1	2023-09-26	3	5.00	20.00	20.00	57.00	0.00
12247	2253	560	137	1	2023-08-19	3	4.00	110.00	140.00	403.20	86.40
12248	2254	111	337	5	2022-08-19	3	5.00	40.00	40.00	114.00	0.00
12249	2255	111	1113	5	2022-01-08	2	4.00	40.00	40.00	76.80	0.00
12250	2256	561	1286	2	2022-02-19	3	2.00	410.00	440.00	1293.60	88.20
12251	2257	561	860	2	2023-01-02	2	2.00	100.00	110.00	215.60	19.60
12252	2258	37	378	5	2023-05-09	7	4.00	980.00	1210.00	8131.20	1545.60
12253	2259	37	1287	5	2023-01-26	2	5.00	20.00	20.00	38.00	0.00
12254	2260	423	660	1	2022-05-07	1	4.00	10.00	10.00	9.60	0.00
12255	2261	423	696	1	2023-08-02	3	5.00	330.00	370.00	1054.50	114.00
12256	2262	134	578	7	2023-09-15	1	4.00	140.00	170.00	163.20	28.80
12257	2263	121	575	5	2023-07-22	3	3.00	320.00	360.00	1047.60	116.40
12258	2264	185	1288	1	2023-05-16	2	5.00	450.00	500.00	950.00	95.00
12259	2265	185	219	1	2022-11-02	1	4.00	10.00	10.00	9.60	0.00
12260	2266	185	926	1	2022-03-23	2	3.00	10.00	10.00	19.40	0.00
12261	2267	562	1289	7	2022-05-14	2	4.00	10.00	10.00	19.20	0.00
12262	2268	68	1290	7	2023-07-25	2	3.00	10.00	10.00	19.40	0.00
12263	2269	263	1291	2	2022-10-30	1	5.00	10.00	10.00	9.50	0.00
12264	2270	263	45	2	2022-11-02	1	4.00	10.00	10.00	9.60	0.00
12265	2271	563	370	2	2022-07-07	5	4.00	40.00	50.00	240.00	48.00
12266	2272	203	1292	2	2022-02-12	6	4.00	170.00	200.00	1152.00	172.80
12267	2273	37	1293	2	2023-01-29	7	2.00	410.00	440.00	3018.40	205.80
12268	2274	37	1294	2	2022-09-19	2	3.00	1060.00	1120.00	2172.80	116.40
12269	2275	2	1295	1	2023-08-30	1	2.00	110.00	140.00	137.20	29.40
12270	2276	2	24	1	2023-12-22	3	2.00	110.00	120.00	352.80	29.40
12271	2277	564	855	2	2022-07-14	5	5.00	260.00	310.00	1472.50	237.50
12272	2278	564	978	2	2023-02-19	1	4.00	80.00	90.00	86.40	9.60
12273	2279	564	202	2	2023-01-23	4	3.00	180.00	220.00	853.60	155.20
12274	2280	68	1226	5	2023-06-16	2	3.00	90.00	100.00	194.00	19.40
12275	2281	68	993	5	2023-02-14	8	5.00	550.00	610.00	4636.00	456.00
12276	2282	68	900	5	2023-12-13	2	5.00	180.00	200.00	380.00	38.00
12277	2283	565	321	5	2022-04-13	7	3.00	40.00	50.00	339.50	67.90
12278	2284	566	180	2	2023-06-01	2	3.00	20.00	20.00	38.80	0.00
12279	2285	566	1296	2	2023-10-30	7	2.00	50.00	60.00	411.60	68.60
12280	2286	129	1297	5	2023-10-25	3	2.00	10.00	10.00	29.40	0.00
12281	2287	567	1298	2	2022-07-28	2	2.00	40.00	40.00	78.40	0.00
12282	2288	327	1299	1	2022-04-06	5	4.00	20.00	20.00	96.00	0.00
12283	2289	4	837	5	2023-06-20	5	5.00	20.00	20.00	95.00	0.00
12284	2290	411	1300	5	2022-05-12	2	5.00	770.00	890.00	1691.00	228.00
12285	2291	135	665	2	2023-07-30	3	5.00	230.00	290.00	826.50	171.00
12286	2292	135	1072	2	2023-11-18	6	5.00	500.00	600.00	3420.00	570.00
12287	2293	135	779	2	2023-04-28	2	2.00	10.00	10.00	19.60	0.00
12288	2294	253	501	2	2023-01-31	1	2.00	0.00	0.00	0.00	0.00
12289	2295	565	72	2	2023-07-21	3	4.00	160.00	180.00	518.40	57.60
12290	2296	383	939	2	2022-12-20	4	5.00	10.00	10.00	38.00	0.00
12291	2297	383	690	2	2023-05-28	5	4.00	210.00	260.00	1248.00	240.00
12292	2298	383	1301	2	2022-07-31	1	4.00	40.00	40.00	38.40	0.00
12293	2299	383	652	2	2022-07-15	7	4.00	1250.00	1400.00	9408.00	1008.00
12294	2300	383	479	2	2023-05-13	4	4.00	470.00	500.00	1920.00	115.20
12295	2301	568	16	2	2022-07-13	3	2.00	10.00	10.00	29.40	0.00
12296	2302	568	615	2	2023-11-28	4	4.00	10.00	10.00	38.40	0.00
12297	2303	135	553	2	2023-04-23	4	4.00	300.00	320.00	1228.80	76.80
12298	2304	569	324	1	2022-07-08	4	2.00	580.00	720.00	2822.40	548.80
12299	2305	569	259	1	2023-10-06	3	4.00	100.00	110.00	316.80	28.80
12300	2306	74	714	5	2023-10-02	2	4.00	120.00	140.00	268.80	38.40
12301	2307	34	753	5	2022-10-18	3	4.00	30.00	30.00	86.40	0.00
12302	2308	31	476	2	2023-09-24	5	3.00	350.00	390.00	1891.50	194.00
12303	2309	513	655	5	2023-11-22	1	4.00	260.00	280.00	268.80	19.20
12304	2310	513	81	5	2022-12-06	4	2.00	60.00	70.00	274.40	39.20
12305	2311	513	667	5	2023-07-16	5	5.00	80.00	90.00	427.50	47.50
12306	2312	513	1042	5	2022-01-10	1	5.00	20.00	20.00	19.00	0.00
12307	2313	513	436	5	2022-02-04	3	3.00	190.00	220.00	640.20	87.30
12308	2314	570	677	2	2022-03-09	2	3.00	10.00	10.00	19.40	0.00
12309	2315	570	78	2	2022-06-21	2	2.00	400.00	420.00	823.20	39.20
12310	2316	570	481	2	2023-10-28	5	4.00	30.00	40.00	192.00	48.00
12311	2317	570	1226	2	2022-12-24	3	2.00	170.00	180.00	529.20	29.40
12312	2318	570	845	2	2022-03-14	7	3.00	50.00	60.00	407.40	67.90
12313	2319	570	1302	2	2023-01-30	3	3.00	350.00	390.00	1134.90	116.40
12314	2320	261	536	5	2023-04-11	4	5.00	180.00	190.00	722.00	38.00
12315	2321	411	1303	2	2023-06-28	7	5.00	240.00	270.00	1795.50	199.50
12316	2322	571	352	1	2023-07-27	3	3.00	80.00	90.00	261.90	29.10
12317	2323	571	281	1	2022-06-26	4	2.00	60.00	60.00	235.20	0.00
12318	2324	571	786	1	2023-11-01	5	2.00	60.00	80.00	392.00	98.00
12319	2325	571	1000	1	2022-11-18	12	3.00	300.00	360.00	4190.40	698.40
12320	2326	49	1198	1	2023-11-01	3	5.00	70.00	80.00	228.00	28.50
12321	2327	49	267	1	2023-06-23	1	2.00	50.00	50.00	49.00	0.00
12322	2328	49	13	1	2023-10-17	2	4.00	10.00	10.00	19.20	0.00
12323	2329	572	1304	5	2022-07-19	3	2.00	10.00	10.00	29.40	0.00
12324	2330	59	1305	2	2023-05-11	4	3.00	510.00	550.00	2134.00	155.20
12325	2331	351	194	1	2022-03-20	2	5.00	40.00	40.00	76.00	0.00
12326	2332	351	1306	1	2023-02-19	5	3.00	30.00	40.00	194.00	48.50
12327	2333	573	418	2	2022-07-27	5	4.00	260.00	280.00	1344.00	96.00
12328	2334	573	610	2	2023-11-07	1	4.00	10.00	10.00	9.60	0.00
12329	2335	574	337	2	2023-08-14	6	2.00	60.00	70.00	411.60	58.80
12330	2336	79	136	7	2022-02-10	3	5.00	10.00	10.00	28.50	0.00
12331	2337	79	1307	7	2023-05-07	7	3.00	390.00	430.00	2919.70	271.60
12332	2338	31	1308	7	2023-09-16	4	5.00	20.00	30.00	114.00	38.00
12333	2339	31	497	7	2022-01-06	4	2.00	40.00	50.00	196.00	39.20
12334	2340	51	88	2	2022-03-15	2	5.00	10.00	10.00	19.00	0.00
12335	2341	575	880	2	2022-12-07	7	4.00	30.00	40.00	268.80	67.20
12336	2342	576	1309	5	2022-07-27	5	2.00	60.00	60.00	294.00	0.00
12337	2343	576	1303	5	2023-08-26	3	3.00	100.00	110.00	320.10	29.10
12338	2344	118	233	1	2023-09-30	3	4.00	110.00	120.00	345.60	28.80
12339	2345	577	1310	2	2023-06-11	9	4.00	390.00	490.00	4233.60	864.00
12340	2346	73	162	2	2023-01-21	5	2.00	60.00	70.00	343.00	49.00
12341	2347	73	1311	2	2022-12-27	2	2.00	0.00	0.00	0.00	0.00
12342	2348	73	899	2	2022-09-09	5	5.00	520.00	560.00	2660.00	190.00
12343	2349	376	621	7	2022-09-14	6	4.00	10.00	10.00	57.60	0.00
12344	2350	376	1312	7	2023-04-02	2	5.00	60.00	70.00	133.00	19.00
12345	2351	376	363	7	2023-12-16	2	5.00	10.00	10.00	19.00	0.00
12346	2352	376	1277	7	2022-06-09	3	3.00	70.00	80.00	232.80	29.10
12347	2353	376	60	7	2022-03-16	6	2.00	10.00	10.00	58.80	0.00
12348	2354	60	38	5	2022-11-23	7	3.00	1350.00	1550.00	10524.50	1358.00
12349	2355	60	142	5	2022-02-27	5	4.00	120.00	140.00	672.00	96.00
12350	2356	60	1313	5	2023-10-06	1	3.00	40.00	40.00	38.80	0.00
12351	2357	60	1314	5	2022-04-14	3	5.00	190.00	240.00	684.00	142.50
12352	2358	25	216	2	2023-03-28	7	3.00	1440.00	1580.00	10728.20	950.60
12353	2359	25	1300	2	2023-10-08	4	4.00	900.00	1070.00	4108.80	652.80
12354	2360	25	1169	2	2022-01-23	3	5.00	500.00	610.00	1738.50	313.50
12355	2361	25	1315	2	2022-06-19	7	2.00	30.00	30.00	205.80	0.00
12356	2362	25	1316	2	2023-09-02	4	3.00	140.00	160.00	620.80	77.60
12357	2363	51	1317	2	2022-12-24	5	3.00	10.00	10.00	48.50	0.00
12358	2364	578	442	2	2023-02-14	2	5.00	110.00	130.00	247.00	38.00
12359	2365	578	1318	2	2022-09-26	2	4.00	150.00	160.00	307.20	19.20
12360	2366	578	1024	2	2022-12-18	4	2.00	40.00	50.00	196.00	39.20
12361	2367	579	1319	1	2023-03-23	1	5.00	100.00	120.00	114.00	19.00
12362	2368	580	1011	5	2022-03-26	4	4.00	20.00	20.00	76.80	0.00
12363	2369	581	1320	2	2022-10-29	6	4.00	470.00	530.00	3052.80	345.60
12364	2370	581	1321	2	2023-05-07	2	5.00	0.00	0.00	0.00	0.00
12365	2371	148	726	1	2023-12-20	4	2.00	200.00	250.00	980.00	196.00
12366	2372	393	1156	1	2022-10-05	8	3.00	50.00	60.00	465.60	77.60
12367	2373	393	1322	1	2022-02-26	1	4.00	0.00	0.00	0.00	0.00
12368	2374	393	1129	1	2023-02-07	9	5.00	20.00	20.00	171.00	0.00
12369	2375	393	324	1	2023-02-22	2	2.00	220.00	250.00	490.00	58.80
12370	2376	582	970	2	2023-11-24	3	3.00	10.00	10.00	29.10	0.00
12371	2377	51	1243	1	2023-08-02	4	3.00	60.00	80.00	310.40	77.60
12372	2378	51	1323	1	2023-11-30	2	3.00	10.00	10.00	19.40	0.00
12373	2379	583	1255	2	2023-07-30	5	2.00	30.00	30.00	147.00	0.00
12374	2380	380	486	2	2022-12-02	2	5.00	10.00	10.00	19.00	0.00
12375	2381	380	1324	2	2022-09-21	2	3.00	40.00	50.00	97.00	19.40
12376	2382	380	29	2	2023-02-21	7	2.00	40.00	50.00	343.00	68.60
12377	2383	362	1325	5	2022-10-27	4	2.00	150.00	180.00	705.60	117.60
12378	2384	362	1326	5	2022-04-06	9	2.00	20.00	20.00	176.40	0.00
12379	2385	362	921	5	2023-04-26	4	4.00	180.00	190.00	729.60	38.40
12380	2386	362	1327	5	2022-05-25	4	3.00	170.00	210.00	814.80	155.20
12381	2387	362	1328	5	2023-09-07	2	3.00	410.00	480.00	931.20	135.80
12382	2388	287	1329	5	2023-08-28	2	5.00	10.00	10.00	19.00	0.00
12383	2389	287	1330	5	2023-12-18	2	4.00	20.00	20.00	38.40	0.00
12384	2390	31	1331	2	2023-05-26	1	5.00	10.00	10.00	9.50	0.00
12385	2391	31	1332	2	2023-03-22	7	4.00	40.00	40.00	268.80	0.00
12386	2392	31	1333	2	2023-04-09	9	4.00	1390.00	1620.00	13996.80	1987.20
12387	2393	31	1147	2	2022-10-31	4	2.00	100.00	110.00	431.20	39.20
12388	2394	584	398	2	2022-07-09	2	4.00	30.00	40.00	76.80	19.20
12389	2395	49	1203	2	2023-11-24	2	4.00	40.00	40.00	76.80	0.00
12390	2396	49	539	2	2023-04-23	2	5.00	50.00	60.00	114.00	19.00
12391	2397	49	957	2	2023-10-19	5	2.00	30.00	40.00	196.00	49.00
12392	2398	10	746	1	2022-04-09	2	2.00	10.00	10.00	19.60	0.00
12393	2399	10	22	1	2022-06-26	6	3.00	20.00	20.00	116.40	0.00
12394	2400	585	436	2	2022-04-28	7	3.00	580.00	630.00	4277.70	339.50
12395	2401	585	1012	2	2022-05-11	5	4.00	50.00	60.00	288.00	48.00
12396	2402	496	954	1	2022-10-12	6	5.00	70.00	90.00	513.00	114.00
12397	2403	496	153	1	2023-06-07	5	3.00	20.00	30.00	145.50	48.50
12398	2404	586	1334	2	2023-03-08	7	5.00	810.00	960.00	6384.00	997.50
12399	2405	70	696	2	2022-11-16	9	4.00	900.00	1120.00	9676.80	1900.80
12400	2406	70	462	2	2023-09-06	7	3.00	120.00	130.00	882.70	67.90
12401	2407	70	313	2	2022-05-04	10	2.00	60.00	80.00	784.00	196.00
12402	2408	37	1160	2	2023-10-15	5	3.00	20.00	20.00	97.00	0.00
12403	2409	37	1335	2	2023-04-23	3	3.00	300.00	360.00	1047.60	174.60
12404	2410	337	1093	5	2022-12-20	8	4.00	190.00	210.00	1612.80	153.60
12405	2411	285	1054	2	2023-08-25	2	2.00	10.00	10.00	19.60	0.00
12406	2412	2	621	1	2023-07-16	5	4.00	10.00	10.00	48.00	0.00
12407	2413	70	359	2	2023-01-09	2	2.00	10.00	10.00	19.60	0.00
12408	2414	70	737	2	2022-03-24	3	2.00	540.00	630.00	1852.20	264.60
12409	2415	363	1319	2	2022-04-02	5	5.00	650.00	750.00	3562.50	475.00
12410	2416	587	416	2	2022-04-26	2	3.00	240.00	300.00	582.00	116.40
12411	2417	588	1201	2	2023-02-08	5	2.00	510.00	600.00	2940.00	441.00
12412	2418	588	1198	2	2022-07-06	3	2.00	70.00	80.00	235.20	29.40
12413	2419	589	1336	2	2023-05-03	10	4.00	1970.00	2400.00	23040.00	4128.00
12414	2420	590	968	2	2022-03-12	2	3.00	60.00	60.00	116.40	0.00
12415	2421	590	1337	2	2023-01-20	1	5.00	100.00	100.00	95.00	0.00
12416	2422	591	83	2	2023-10-24	3	5.00	220.00	230.00	655.50	28.50
12417	2423	591	671	2	2023-07-15	2	4.00	10.00	10.00	19.20	0.00
12418	2424	478	722	2	2023-03-18	7	4.00	130.00	160.00	1075.20	201.60
12419	2425	478	1312	2	2023-02-02	1	3.00	10.00	10.00	9.70	0.00
12420	2426	478	1338	2	2022-02-07	2	3.00	220.00	270.00	523.80	97.00
12421	2427	478	1229	2	2023-09-01	13	3.00	30.00	40.00	504.40	126.10
12422	2428	493	1339	2	2022-06-21	4	4.00	0.00	0.00	0.00	0.00
12423	2429	493	1340	2	2022-03-07	4	2.00	10.00	10.00	39.20	0.00
12424	2430	493	1074	2	2023-11-25	7	3.00	10.00	10.00	67.90	0.00
12425	2431	258	3	2	2022-08-16	8	3.00	50.00	60.00	465.60	77.60
12426	2432	237	346	2	2023-04-28	2	5.00	10.00	10.00	19.00	0.00
12427	2433	31	1341	2	2023-06-25	7	5.00	340.00	370.00	2460.50	199.50
12428	2434	35	1260	2	2022-08-12	4	4.00	40.00	50.00	192.00	38.40
12429	2435	280	619	5	2023-12-24	2	3.00	20.00	30.00	58.20	19.40
12430	2436	280	1342	5	2023-06-12	3	2.00	770.00	830.00	2440.20	176.40
12431	2437	525	72	2	2023-05-11	9	2.00	470.00	550.00	4851.00	705.60
12432	2438	157	1343	1	2022-06-12	2	3.00	130.00	150.00	291.00	38.80
12433	2439	157	863	1	2022-06-26	4	2.00	30.00	40.00	156.80	39.20
12434	2440	202	628	2	2022-07-11	2	2.00	10.00	10.00	19.60	0.00
12435	2441	592	303	2	2023-03-17	5	2.00	290.00	350.00	1715.00	294.00
12436	2442	592	210	2	2022-12-14	2	5.00	140.00	170.00	323.00	57.00
12437	2443	592	191	2	2022-05-17	4	4.00	580.00	660.00	2534.40	307.20
12438	2444	592	453	2	2022-03-14	5	2.00	80.00	100.00	490.00	98.00
12439	2445	592	1344	2	2023-09-17	6	5.00	30.00	30.00	171.00	0.00
12440	2446	592	958	2	2023-11-30	2	3.00	210.00	260.00	504.40	97.00
12441	2447	27	756	2	2022-10-18	2	5.00	20.00	20.00	38.00	0.00
12442	2448	130	1154	2	2023-01-07	5	5.00	420.00	490.00	2327.50	332.50
12443	2449	593	436	1	2022-10-02	3	3.00	260.00	270.00	785.70	29.10
12444	2450	594	1345	2	2022-01-29	5	2.00	30.00	30.00	147.00	0.00
12445	2451	383	1346	1	2022-11-12	5	5.00	20.00	20.00	95.00	0.00
12446	2452	383	425	1	2023-12-23	6	3.00	100.00	120.00	698.40	116.40
12447	2453	383	537	1	2022-05-08	3	2.00	10.00	10.00	29.40	0.00
12448	2454	383	453	1	2023-09-19	3	2.00	50.00	60.00	176.40	29.40
12449	2455	383	1045	1	2022-11-12	8	3.00	60.00	70.00	543.20	77.60
12450	2456	383	1032	1	2022-04-13	8	5.00	90.00	110.00	836.00	152.00
12451	2457	383	677	1	2022-09-19	1	3.00	10.00	10.00	9.70	0.00
12452	2458	383	33	1	2023-07-30	6	4.00	50.00	60.00	345.60	57.60
12453	2459	383	171	1	2022-04-08	3	2.00	40.00	50.00	147.00	29.40
12454	2460	595	415	2	2023-12-01	2	5.00	90.00	100.00	190.00	19.00
12455	2461	68	844	1	2023-04-12	3	4.00	30.00	30.00	86.40	0.00
12456	2462	68	801	1	2023-06-20	3	2.00	80.00	100.00	294.00	58.80
12457	2463	31	302	2	2023-10-12	5	5.00	70.00	80.00	380.00	47.50
12458	2464	31	1317	2	2022-06-22	2	2.00	10.00	10.00	19.60	0.00
12459	2465	31	820	2	2023-11-13	1	5.00	120.00	140.00	133.00	19.00
12460	2466	31	396	2	2022-04-14	1	3.00	0.00	0.00	0.00	0.00
12461	2467	596	1347	2	2022-03-06	1	3.00	10.00	10.00	9.70	0.00
12462	2468	596	385	2	2023-04-25	4	2.00	520.00	570.00	2234.40	196.00
12463	2469	596	1348	2	2023-09-04	5	5.00	30.00	30.00	142.50	0.00
12464	2470	596	1037	2	2022-06-28	1	4.00	20.00	20.00	19.20	0.00
12465	2471	597	1349	2	2023-10-22	8	3.00	10.00	10.00	77.60	0.00
12466	2472	597	1249	2	2022-01-01	4	3.00	410.00	450.00	1746.00	155.20
12467	2473	597	1267	2	2022-02-04	4	3.00	60.00	60.00	232.80	0.00
12468	2474	4	1350	5	2022-04-06	2	5.00	200.00	220.00	418.00	38.00
12469	2475	4	1351	5	2023-11-21	5	2.00	70.00	80.00	392.00	49.00
12470	2476	4	1352	5	2023-05-03	7	4.00	70.00	90.00	604.80	134.40
12471	2477	4	1342	5	2023-06-27	4	2.00	960.00	1100.00	4312.00	548.80
12472	2478	2	595	1	2023-10-13	3	2.00	1110.00	1320.00	3880.80	617.40
12473	2479	383	7	2	2022-01-17	3	5.00	10.00	10.00	28.50	0.00
12474	2480	89	1353	2	2023-01-29	1	5.00	10.00	10.00	9.50	0.00
12475	2481	89	83	2	2023-09-09	2	3.00	130.00	150.00	291.00	38.80
12476	2482	203	750	2	2023-09-02	6	2.00	900.00	1000.00	5880.00	588.00
12477	2483	67	1354	2	2022-10-01	4	3.00	40.00	40.00	155.20	0.00
12478	2484	67	343	2	2022-08-13	5	5.00	930.00	1140.00	5415.00	997.50
12479	2485	67	445	2	2022-08-31	5	4.00	90.00	100.00	480.00	48.00
12480	2486	67	450	2	2023-11-14	2	3.00	10.00	10.00	19.40	0.00
12481	2487	417	1355	1	2022-02-16	2	2.00	80.00	90.00	176.40	19.60
12482	2488	417	1356	1	2022-03-09	3	2.00	10.00	10.00	29.40	0.00
12483	2489	417	1284	1	2023-10-15	3	3.00	20.00	20.00	58.20	0.00
12484	2490	104	1357	1	2023-01-28	4	4.00	550.00	630.00	2419.20	307.20
12485	2491	104	1358	1	2023-03-22	4	3.00	20.00	20.00	77.60	0.00
12486	2492	14	1112	1	2022-01-29	6	5.00	70.00	90.00	513.00	114.00
12487	2493	598	1149	2	2023-04-23	7	4.00	3730.00	4550.00	30576.00	5510.40
12488	2494	141	839	1	2023-11-22	5	3.00	250.00	300.00	1455.00	242.50
12489	2495	141	1150	1	2023-03-12	5	2.00	580.00	720.00	3528.00	686.00
12490	2496	599	406	2	2023-11-07	8	4.00	540.00	650.00	4992.00	844.80
12491	2497	449	81	2	2023-04-25	3	3.00	50.00	60.00	174.60	29.10
12492	2498	449	634	2	2022-04-28	2	2.00	110.00	120.00	235.20	19.60
12493	2499	142	1225	2	2023-12-14	1	5.00	10.00	10.00	9.50	0.00
12494	2500	484	1359	5	2022-11-05	3	3.00	30.00	40.00	116.40	29.10
12495	2501	441	828	5	2023-10-28	2	5.00	10.00	10.00	19.00	0.00
12496	2502	441	615	5	2022-08-28	4	4.00	0.00	0.00	0.00	0.00
12497	2503	441	674	5	2022-09-06	4	5.00	10.00	10.00	38.00	0.00
12498	2504	152	1239	2	2023-10-12	2	2.00	10.00	10.00	19.60	0.00
12499	2505	37	231	1	2022-10-24	4	2.00	40.00	50.00	196.00	39.20
12500	2506	37	1360	1	2023-04-19	5	5.00	7370.00	8190.00	38902.50	3895.00
12501	2507	37	222	1	2023-11-26	8	3.00	70.00	80.00	620.80	77.60
12502	2508	35	1361	7	2023-02-05	4	4.00	30.00	30.00	115.20	0.00
12503	2509	156	1362	2	2023-05-20	3	5.00	190.00	200.00	570.00	28.50
12504	2510	156	915	2	2023-12-24	6	4.00	390.00	480.00	2764.80	518.40
12505	2511	600	1363	2	2022-05-05	4	4.00	1000.00	1120.00	4300.80	460.80
12506	2512	601	937	5	2022-08-20	6	4.00	90.00	110.00	633.60	115.20
12507	2513	99	472	2	2022-07-08	5	4.00	50.00	50.00	240.00	0.00
12508	2514	74	1049	2	2022-08-11	4	3.00	90.00	100.00	388.00	38.80
12509	2515	74	878	2	2023-11-15	2	4.00	40.00	50.00	96.00	19.20
12510	2516	602	547	2	2022-12-03	2	3.00	210.00	260.00	504.40	97.00
12511	2517	141	971	2	2023-08-31	9	2.00	500.00	600.00	5292.00	882.00
12512	2518	603	785	2	2022-12-12	3	2.00	110.00	130.00	382.20	58.80
12513	2519	600	1364	2	2022-11-20	7	3.00	20.00	20.00	135.80	0.00
12514	2520	600	608	2	2023-04-19	6	2.00	20.00	30.00	176.40	58.80
12515	2521	600	1365	2	2023-10-12	3	5.00	730.00	870.00	2479.50	399.00
12516	2522	600	90	2	2022-07-10	2	4.00	10.00	10.00	19.20	0.00
12517	2523	600	896	2	2022-03-11	1	2.00	10.00	10.00	9.80	0.00
12518	2524	600	1000	2	2022-01-22	4	2.00	110.00	120.00	470.40	39.20
12519	2525	188	513	2	2022-05-01	9	5.00	40.00	40.00	342.00	0.00
12520	2526	188	1366	2	2022-08-12	2	3.00	20.00	30.00	58.20	19.40
12521	2527	188	1024	2	2022-02-20	3	5.00	10.00	10.00	28.50	0.00
12522	2528	188	1233	2	2022-08-07	6	4.00	10.00	10.00	57.60	0.00
12523	2529	188	1051	2	2023-08-29	2	4.00	10.00	10.00	19.20	0.00
12524	2530	604	740	2	2023-07-08	2	2.00	10.00	10.00	19.60	0.00
12525	2531	605	1139	2	2022-07-30	5	2.00	100.00	110.00	539.00	49.00
12526	2532	605	1367	2	2022-06-10	4	4.00	20.00	20.00	76.80	0.00
12527	2533	605	1089	2	2023-10-28	7	3.00	10.00	10.00	67.90	0.00
12528	2534	605	107	2	2022-01-31	4	4.00	320.00	340.00	1305.60	76.80
12529	2535	86	459	1	2023-04-11	6	3.00	1580.00	1800.00	10476.00	1280.40
12530	2536	606	104	5	2022-04-23	4	5.00	50.00	50.00	190.00	0.00
12531	2537	228	71	1	2023-08-23	2	5.00	160.00	180.00	342.00	38.00
12532	2538	228	1150	1	2023-02-26	4	4.00	350.00	430.00	1651.20	307.20
12533	2539	228	1368	1	2022-10-23	1	3.00	150.00	160.00	155.20	9.70
12534	2540	60	300	7	2023-11-30	6	3.00	1280.00	1350.00	7857.00	407.40
12535	2541	60	285	7	2022-01-19	3	2.00	590.00	700.00	2058.00	323.40
12536	2542	607	562	2	2022-12-08	7	4.00	90.00	110.00	739.20	134.40
12537	2543	325	811	1	2022-02-13	3	2.00	130.00	140.00	411.60	29.40
12538	2544	608	1369	2	2023-06-21	3	3.00	160.00	170.00	494.70	29.10
12539	2545	608	1239	2	2023-09-15	4	3.00	10.00	10.00	38.80	0.00
12540	2546	308	233	2	2023-06-27	4	4.00	180.00	210.00	806.40	115.20
12541	2547	308	431	2	2023-09-10	1	4.00	80.00	100.00	96.00	19.20
12542	2548	55	827	2	2023-11-16	1	5.00	0.00	0.00	0.00	0.00
12543	2549	55	1148	2	2023-01-07	5	3.00	1520.00	1880.00	9118.00	1746.00
12544	2550	55	1185	2	2023-04-10	8	3.00	260.00	310.00	2405.60	388.00
12545	2551	55	817	2	2023-03-07	2	2.00	10.00	10.00	19.60	0.00
12546	2552	1	1370	2	2023-07-31	6	2.00	750.00	820.00	4821.60	411.60
12547	2553	1	1046	2	2022-04-30	2	4.00	20.00	20.00	38.40	0.00
12548	2554	609	816	2	2022-08-14	4	2.00	30.00	30.00	117.60	0.00
12549	2555	610	1371	2	2022-10-13	7	4.00	670.00	710.00	4771.20	268.80
12550	2556	134	1372	2	2023-12-14	2	4.00	40.00	50.00	96.00	19.20
12551	2557	165	1373	2	2022-08-19	8	5.00	40.00	50.00	380.00	76.00
12552	2558	357	1299	2	2023-06-04	2	5.00	10.00	10.00	19.00	0.00
12553	2559	13	1374	2	2022-11-30	7	4.00	1340.00	1410.00	9475.20	470.40
12554	2560	13	366	2	2022-06-17	5	4.00	20.00	20.00	96.00	0.00
12555	2561	13	766	2	2022-02-06	2	5.00	290.00	320.00	608.00	57.00
12556	2562	611	1187	2	2023-03-25	4	2.00	10.00	10.00	39.20	0.00
12557	2563	611	1291	2	2023-06-19	2	4.00	10.00	10.00	19.20	0.00
12558	2564	253	1375	1	2022-12-21	1	5.00	20.00	20.00	19.00	0.00
12559	2565	253	1037	1	2022-04-27	2	3.00	20.00	30.00	58.20	19.40
12560	2566	612	937	5	2022-03-21	4	5.00	60.00	70.00	266.00	38.00
12561	2567	613	1376	1	2022-02-08	5	2.00	30.00	30.00	147.00	0.00
12562	2568	613	1235	1	2023-01-21	9	5.00	2540.00	2670.00	22828.50	1111.50
12563	2569	213	43	2	2022-12-03	8	4.00	390.00	480.00	3686.40	691.20
12564	2570	473	820	7	2023-07-19	2	4.00	150.00	160.00	307.20	19.20
12565	2571	473	155	7	2023-01-09	4	4.00	10.00	10.00	38.40	0.00
12566	2572	614	854	2	2022-07-16	2	3.00	0.00	0.00	0.00	0.00
12567	2573	433	1288	1	2023-11-02	7	5.00	1270.00	1400.00	9310.00	864.50
12568	2574	615	794	2	2022-12-20	5	4.00	460.00	530.00	2544.00	336.00
12569	2575	135	898	2	2022-02-01	3	3.00	20.00	20.00	58.20	0.00
12570	2576	135	670	2	2022-01-20	5	2.00	290.00	320.00	1568.00	147.00
12571	2577	135	153	2	2022-09-12	2	4.00	10.00	10.00	19.20	0.00
12572	2578	135	1377	2	2022-03-20	3	5.00	570.00	680.00	1938.00	313.50
12573	2579	616	1378	2	2023-11-14	3	3.00	50.00	60.00	174.60	29.10
12574	2580	616	855	2	2023-05-27	8	3.00	400.00	490.00	3802.40	698.40
12575	2581	616	935	2	2022-04-09	3	5.00	20.00	20.00	57.00	0.00
12576	2582	616	1306	2	2023-07-20	2	3.00	20.00	20.00	38.80	0.00
12577	2583	616	1379	2	2022-08-14	13	3.00	140.00	160.00	2017.60	252.20
12578	2584	616	1380	2	2023-03-27	3	4.00	10.00	10.00	28.80	0.00
12579	2585	616	540	2	2022-01-28	2	2.00	170.00	190.00	372.40	39.20
12580	2586	617	319	2	2023-09-25	2	4.00	10.00	10.00	19.20	0.00
12581	2587	104	842	2	2023-07-01	7	5.00	210.00	250.00	1662.50	266.00
12582	2588	104	1381	2	2022-01-11	1	5.00	20.00	20.00	19.00	0.00
12583	2589	56	1199	2	2022-07-23	1	5.00	10.00	10.00	9.50	0.00
12584	2590	56	240	2	2023-07-02	3	4.00	200.00	250.00	720.00	144.00
12585	2591	618	1382	2	2022-11-03	2	4.00	10.00	10.00	19.20	0.00
12586	2592	618	1383	2	2022-09-25	3	4.00	500.00	600.00	1728.00	288.00
12587	2593	619	1256	1	2023-02-06	2	3.00	80.00	80.00	155.20	0.00
12588	2594	619	801	1	2022-12-21	8	2.00	270.00	330.00	2587.20	470.40
12589	2595	305	232	2	2023-06-04	2	3.00	160.00	180.00	349.20	38.80
12590	2596	305	570	2	2023-11-03	3	2.00	840.00	910.00	2675.40	205.80
12591	2597	305	967	2	2022-09-23	3	3.00	500.00	590.00	1716.90	261.90
12592	2598	305	1245	2	2022-04-10	2	3.00	460.00	530.00	1028.20	135.80
12593	2599	305	1384	2	2022-10-10	3	3.00	10.00	10.00	29.10	0.00
12594	2600	104	1307	2	2022-02-04	2	4.00	100.00	120.00	230.40	38.40
12595	2601	104	355	2	2022-08-27	7	3.00	100.00	120.00	814.80	135.80
12596	2602	134	812	7	2022-08-17	3	4.00	10.00	10.00	28.80	0.00
12597	2603	134	1385	7	2023-09-14	3	5.00	1240.00	1350.00	3847.50	313.50
12598	2604	134	1058	7	2023-12-13	1	3.00	110.00	140.00	135.80	29.10
12599	2605	134	678	7	2022-06-07	4	4.00	50.00	60.00	230.40	38.40
12600	2606	251	1066	2	2022-04-15	1	2.00	0.00	0.00	0.00	0.00
12601	2607	423	1386	2	2023-08-05	1	2.00	20.00	20.00	19.60	0.00
12602	2608	493	1387	2	2022-12-26	3	5.00	20.00	20.00	57.00	0.00
12603	2609	493	396	2	2023-11-06	1	4.00	0.00	0.00	0.00	0.00
12604	2610	493	4	2	2023-12-11	5	2.00	1160.00	1220.00	5978.00	294.00
12605	2611	493	1239	2	2022-07-02	2	3.00	10.00	10.00	19.40	0.00
12606	2612	493	784	2	2022-12-17	3	2.00	20.00	20.00	58.80	0.00
12607	2613	493	535	2	2023-10-16	3	3.00	10.00	10.00	29.10	0.00
12608	2614	156	793	2	2023-12-13	2	4.00	40.00	40.00	76.80	0.00
12609	2615	19	371	2	2023-05-21	3	2.00	210.00	230.00	676.20	58.80
12610	2616	19	32	2	2022-03-02	6	4.00	20.00	20.00	115.20	0.00
12611	2617	152	1388	2	2022-04-04	2	3.00	10.00	10.00	19.40	0.00
12612	2618	152	674	2	2022-05-14	13	5.00	100.00	120.00	1482.00	247.00
12613	2619	620	382	2	2023-10-01	3	5.00	0.00	0.00	0.00	0.00
12614	2620	620	1021	2	2022-11-05	4	4.00	60.00	70.00	268.80	38.40
12615	2621	620	254	2	2022-11-25	3	2.00	30.00	40.00	117.60	29.40
12616	2622	620	933	2	2023-12-28	5	4.00	20.00	20.00	96.00	0.00
12617	2623	621	1194	1	2023-02-28	4	2.00	30.00	30.00	117.60	0.00
12618	2624	126	1389	5	2023-04-11	4	2.00	10300.00	11200.00	43904.00	3528.00
12619	2625	126	717	5	2022-12-17	8	5.00	2160.00	2400.00	18240.00	1824.00
12620	2626	126	119	5	2023-09-16	5	5.00	60.00	60.00	285.00	0.00
12621	2627	126	510	5	2022-01-15	1	3.00	50.00	50.00	48.50	0.00
12622	2628	291	453	5	2023-05-11	4	3.00	60.00	60.00	232.80	0.00
12623	2629	291	1390	5	2023-06-29	7	5.00	550.00	650.00	4322.50	665.00
12624	2630	291	1391	5	2023-12-15	10	3.00	10.00	10.00	97.00	0.00
12625	2631	498	1232	2	2023-06-15	3	3.00	10.00	10.00	29.10	0.00
12626	2632	6	892	2	2022-01-04	2	2.00	40.00	40.00	78.40	0.00
12627	2633	6	1392	2	2022-03-22	2	4.00	30.00	40.00	76.80	19.20
12628	2634	6	158	2	2022-04-16	1	5.00	180.00	220.00	209.00	38.00
12629	2635	451	1393	1	2023-03-09	2	3.00	0.00	0.00	0.00	0.00
12630	2636	451	545	1	2022-05-03	5	4.00	10.00	10.00	48.00	0.00
12631	2637	156	766	2	2022-02-24	2	5.00	300.00	320.00	608.00	38.00
12632	2638	134	1394	2	2023-04-27	4	3.00	20.00	20.00	77.60	0.00
12633	2639	134	521	2	2023-05-08	3	5.00	10.00	10.00	28.50	0.00
12634	2640	134	1395	2	2022-07-16	3	3.00	60.00	60.00	174.60	0.00
12635	2641	134	468	2	2023-05-26	4	3.00	760.00	860.00	3336.80	388.00
12636	2642	622	702	2	2023-09-02	1	4.00	30.00	30.00	28.80	0.00
12637	2643	623	969	5	2022-09-21	6	5.00	160.00	190.00	1083.00	171.00
12638	2644	464	522	1	2022-05-02	1	2.00	40.00	40.00	39.20	0.00
12639	2645	464	397	1	2022-10-15	8	3.00	20.00	20.00	155.20	0.00
12640	2646	498	1007	1	2022-01-27	3	3.00	50.00	60.00	174.60	29.10
12641	2647	498	1396	1	2022-04-09	3	5.00	40.00	40.00	114.00	0.00
12642	2648	498	1397	1	2022-12-07	2	3.00	10.00	10.00	19.40	0.00
12643	2649	498	1370	1	2022-02-08	6	4.00	690.00	820.00	4723.20	748.80
12644	2650	498	140	1	2022-10-27	3	3.00	90.00	100.00	291.00	29.10
12645	2651	128	900	2	2022-07-23	5	5.00	350.00	420.00	1995.00	332.50
12646	2652	624	1367	1	2023-04-13	3	4.00	10.00	10.00	28.80	0.00
12647	2653	624	697	1	2023-06-09	3	4.00	10.00	10.00	28.80	0.00
12648	2654	624	1398	1	2023-01-02	3	4.00	140.00	160.00	460.80	57.60
12649	2655	624	1399	1	2022-10-30	3	4.00	1080.00	1290.00	3715.20	604.80
12650	2656	624	1400	1	2022-06-01	2	5.00	30.00	30.00	57.00	0.00
12651	2657	624	534	1	2023-11-08	2	2.00	220.00	260.00	509.60	78.40
12652	2658	624	783	1	2022-12-13	5	2.00	10.00	10.00	49.00	0.00
12653	2659	152	136	2	2022-08-21	3	5.00	10.00	10.00	28.50	0.00
12654	2660	29	158	2	2022-07-10	4	5.00	720.00	880.00	3344.00	608.00
12655	2661	49	1401	2	2023-08-25	11	2.00	1580.00	1980.00	21344.40	4312.00
12656	2662	49	890	2	2023-09-15	2	4.00	70.00	80.00	153.60	19.20
12657	2663	625	237	5	2023-02-18	2	5.00	10.00	10.00	19.00	0.00
12658	2664	33	640	5	2023-03-31	1	5.00	0.00	0.00	0.00	0.00
12659	2665	33	122	5	2022-10-01	3	4.00	300.00	370.00	1065.60	201.60
12660	2666	33	1204	5	2023-04-04	2	5.00	0.00	0.00	0.00	0.00
12661	2667	399	218	7	2023-06-22	3	3.00	60.00	80.00	232.80	58.20
12662	2668	399	259	7	2023-09-30	1	2.00	30.00	30.00	29.40	0.00
12663	2669	179	24	2	2023-05-23	1	3.00	30.00	40.00	38.80	9.70
12664	2670	179	1277	2	2022-06-14	4	2.00	100.00	110.00	431.20	39.20
12665	2671	626	163	1	2022-11-09	3	2.00	140.00	170.00	499.80	88.20
12666	2672	626	1402	1	2022-11-25	6	4.00	730.00	790.00	4550.40	345.60
12667	2673	626	1403	1	2022-02-15	2	2.00	20.00	30.00	58.80	19.60
12668	2674	626	1245	1	2023-01-06	5	5.00	1100.00	1330.00	6317.50	1092.50
12669	2675	178	448	7	2022-10-16	3	5.00	140.00	170.00	484.50	85.50
12670	2676	262	910	2	2023-06-23	5	3.00	10.00	10.00	48.50	0.00
12671	2677	262	1310	2	2022-03-24	1	4.00	30.00	40.00	38.40	9.60
12672	2678	372	1086	7	2023-11-30	7	5.00	10.00	10.00	66.50	0.00
12673	2679	372	736	7	2022-12-20	2	2.00	30.00	30.00	58.80	0.00
12674	2680	149	615	2	2022-11-23	5	2.00	10.00	10.00	49.00	0.00
12675	2681	149	696	2	2023-02-15	5	4.00	520.00	620.00	2976.00	480.00
12676	2682	149	1404	2	2023-03-18	4	2.00	70.00	90.00	352.80	78.40
12677	2683	149	1405	2	2022-04-08	3	5.00	310.00	350.00	997.50	114.00
12678	2684	149	1406	2	2022-07-17	1	5.00	130.00	160.00	152.00	28.50
12679	2685	27	1312	2	2022-09-26	9	2.00	250.00	310.00	2734.20	529.20
12680	2686	408	890	2	2023-01-19	3	3.00	90.00	100.00	291.00	29.10
12681	2687	408	881	2	2023-11-03	2	3.00	0.00	0.00	0.00	0.00
12682	2688	627	1407	5	2022-01-17	5	5.00	0.00	0.00	0.00	0.00
12683	2689	376	1408	5	2022-02-09	5	5.00	20.00	20.00	95.00	0.00
12684	2690	194	1200	5	2022-10-21	4	4.00	10.00	10.00	38.40	0.00
12685	2691	71	991	2	2022-03-24	3	2.00	10.00	10.00	29.40	0.00
12686	2692	628	1409	2	2022-04-12	3	2.00	20.00	20.00	58.80	0.00
12687	2693	628	1410	2	2023-07-30	3	5.00	100.00	110.00	313.50	28.50
12688	2694	411	505	2	2022-11-11	5	4.00	90.00	110.00	528.00	96.00
12689	2695	629	1007	2	2022-11-15	1	5.00	20.00	20.00	19.00	0.00
12690	2696	630	424	5	2022-12-24	2	5.00	30.00	30.00	57.00	0.00
12691	2697	307	1411	2	2022-08-26	4	4.00	760.00	820.00	3148.80	230.40
12692	2698	307	1412	2	2023-10-13	6	4.00	18110.00	22640.00	130406.40	26092.80
12693	2699	307	129	2	2023-09-05	4	2.00	20.00	20.00	78.40	0.00
12694	2700	307	1413	2	2022-04-28	3	4.00	10.00	10.00	28.80	0.00
12695	2701	307	1007	2	2022-01-06	2	3.00	30.00	30.00	58.20	0.00
12696	2702	307	551	2	2022-04-22	3	3.00	20.00	20.00	58.20	0.00
12697	2703	307	1155	2	2022-09-07	3	3.00	100.00	120.00	349.20	58.20
12698	2704	521	1414	2	2023-12-16	3	2.00	110.00	120.00	352.80	29.40
12699	2705	31	177	1	2022-09-13	6	4.00	120.00	130.00	748.80	57.60
12700	2706	631	1060	2	2023-09-14	2	5.00	20.00	20.00	38.00	0.00
12701	2707	631	1415	2	2022-05-19	3	2.00	20.00	20.00	58.80	0.00
12702	2708	631	1416	2	2023-02-07	4	5.00	160.00	190.00	722.00	114.00
12703	2709	14	1417	2	2023-01-09	7	2.00	200.00	230.00	1577.80	205.80
12704	2710	14	1151	2	2023-04-30	3	3.00	1650.00	1920.00	5587.20	785.70
12705	2711	164	411	2	2023-04-08	2	5.00	10.00	10.00	19.00	0.00
12706	2712	514	614	5	2022-08-27	4	5.00	50.00	50.00	190.00	0.00
12707	2713	26	159	1	2022-11-28	9	2.00	50.00	60.00	529.20	88.20
12708	2714	201	723	2	2022-08-04	3	5.00	260.00	300.00	855.00	114.00
12709	2715	67	1062	2	2023-11-13	5	5.00	10.00	10.00	47.50	0.00
12710	2716	25	1418	2	2023-03-20	2	5.00	120.00	130.00	247.00	19.00
12711	2717	402	358	2	2022-07-31	2	2.00	70.00	70.00	137.20	0.00
12712	2718	104	1419	2	2022-05-24	3	4.00	320.00	380.00	1094.40	172.80
12713	2719	183	822	2	2022-09-20	2	4.00	100.00	120.00	230.40	38.40
12714	2720	141	562	1	2023-10-20	3	4.00	20.00	20.00	57.60	0.00
12715	2721	238	204	1	2022-02-04	3	3.00	10.00	10.00	29.10	0.00
12716	2722	238	938	1	2023-07-04	5	3.00	50.00	60.00	291.00	48.50
12717	2723	294	721	1	2022-12-13	5	2.00	70.00	80.00	392.00	49.00
12718	2724	389	265	2	2023-10-21	5	2.00	10.00	10.00	49.00	0.00
12719	2725	389	980	2	2023-01-07	2	3.00	90.00	100.00	194.00	19.40
12720	2726	210	1212	2	2023-08-01	5	5.00	310.00	360.00	1710.00	237.50
12721	2727	210	1343	2	2022-07-08	4	2.00	300.00	350.00	1372.00	196.00
12722	2728	296	521	5	2023-08-18	1	2.00	0.00	0.00	0.00	0.00
12723	2729	296	1335	5	2023-02-16	7	3.00	600.00	630.00	4277.70	203.70
12724	2730	203	148	2	2023-10-31	3	3.00	10.00	10.00	29.10	0.00
12725	2731	203	652	2	2022-04-17	4	5.00	680.00	800.00	3040.00	456.00
12726	2732	203	217	2	2023-01-08	1	4.00	100.00	110.00	105.60	9.60
12727	2733	595	688	2	2023-11-04	2	3.00	70.00	70.00	135.80	0.00
12728	2734	595	797	2	2023-05-06	1	5.00	10.00	10.00	9.50	0.00
12729	2735	632	34	1	2022-09-04	4	3.00	40.00	50.00	194.00	38.80
12730	2736	436	1420	2	2023-04-24	3	5.00	360.00	380.00	1083.00	57.00
12731	2737	436	671	2	2023-02-04	7	3.00	40.00	40.00	271.60	0.00
12732	2738	436	900	2	2022-07-23	3	3.00	270.00	300.00	873.00	87.30
12733	2739	436	818	2	2022-11-12	2	3.00	80.00	90.00	174.60	19.40
12734	2740	633	1421	5	2022-09-23	4	3.00	400.00	480.00	1862.40	310.40
12735	2741	633	1422	5	2022-10-31	2	2.00	20.00	30.00	58.80	19.60
12736	2742	76	1041	1	2022-07-30	5	5.00	50.00	50.00	237.50	0.00
12737	2743	103	1382	2	2023-01-10	2	4.00	40.00	40.00	76.80	0.00
12738	2744	60	593	1	2023-08-31	6	5.00	220.00	260.00	1482.00	228.00
12739	2745	60	67	1	2022-04-23	3	5.00	110.00	130.00	370.50	57.00
12740	2746	312	410	1	2022-09-12	1	3.00	60.00	80.00	77.60	19.40
12741	2747	491	602	2	2023-05-30	3	3.00	590.00	700.00	2037.00	320.10
12742	2748	634	1423	2	2023-02-27	4	5.00	30.00	30.00	114.00	0.00
12743	2749	610	1317	2	2022-02-16	3	3.00	10.00	10.00	29.10	0.00
12744	2750	68	1424	2	2022-06-22	3	5.00	510.00	590.00	1681.50	228.00
12745	2751	635	1425	1	2023-08-16	11	4.00	390.00	420.00	4435.20	316.80
12746	2752	204	1154	2	2022-05-24	2	2.00	180.00	230.00	450.80	98.00
12747	2753	37	1062	2	2022-12-14	2	3.00	10.00	10.00	19.40	0.00
12748	2754	37	620	2	2022-10-31	3	2.00	290.00	320.00	940.80	88.20
12749	2755	37	967	2	2022-11-13	5	2.00	740.00	780.00	3822.00	196.00
12750	2756	37	1365	2	2023-12-13	5	3.00	1330.00	1450.00	7032.50	582.00
12751	2757	37	1332	2	2022-10-30	2	2.00	10.00	10.00	19.60	0.00
12752	2758	134	658	1	2023-03-15	3	5.00	200.00	240.00	684.00	114.00
12753	2759	402	1007	2	2023-05-22	4	2.00	70.00	80.00	313.60	39.20
12754	2760	402	773	2	2022-06-16	4	5.00	430.00	480.00	1824.00	190.00
12755	2761	636	365	5	2023-06-02	5	4.00	40.00	50.00	240.00	48.00
12756	2762	258	1426	5	2022-04-08	1	3.00	0.00	0.00	0.00	0.00
12757	2763	258	987	5	2023-05-16	5	2.00	90.00	100.00	490.00	49.00
12758	2764	243	1427	2	2023-05-14	3	3.00	10.00	10.00	29.10	0.00
12759	2765	243	351	2	2022-08-06	5	4.00	20.00	30.00	144.00	48.00
12760	2766	243	1428	2	2022-04-27	2	2.00	10.00	10.00	19.60	0.00
12761	2767	71	1429	5	2022-12-12	1	5.00	30.00	30.00	28.50	0.00
12762	2768	71	228	5	2022-02-28	8	5.00	1590.00	1920.00	14592.00	2508.00
12763	2769	89	1430	2	2023-07-18	2	4.00	20.00	30.00	57.60	19.20
12764	2770	89	1045	2	2022-06-11	7	2.00	40.00	50.00	343.00	68.60
12765	2771	89	1236	2	2023-11-16	3	4.00	40.00	50.00	144.00	28.80
12766	2772	637	377	2	2022-09-20	5	5.00	50.00	50.00	237.50	0.00
12767	2773	3	741	5	2022-09-15	3	3.00	20.00	20.00	58.20	0.00
12768	2774	638	92	2	2023-08-04	3	2.00	40.00	50.00	147.00	29.40
12769	2775	318	499	2	2023-05-13	2	2.00	10.00	10.00	19.60	0.00
12770	2776	103	233	2	2022-10-19	3	3.00	140.00	150.00	436.50	29.10
12771	2777	116	931	2	2022-09-06	7	5.00	60.00	60.00	399.00	0.00
12772	2778	639	1122	1	2023-01-22	2	3.00	160.00	200.00	388.00	77.60
12773	2779	640	346	2	2022-08-10	8	3.00	20.00	20.00	155.20	0.00
12774	2780	640	1431	2	2023-08-25	3	4.00	0.00	0.00	0.00	0.00
12775	2781	134	199	5	2023-05-13	4	5.00	50.00	60.00	228.00	38.00
12776	2782	271	209	2	2022-11-17	10	4.00	20.00	20.00	192.00	0.00
12777	2783	641	958	2	2022-02-26	2	2.00	220.00	260.00	509.60	78.40
12778	2784	325	1432	2	2022-10-26	2	3.00	20.00	20.00	38.80	0.00
12779	2785	642	1137	2	2022-10-29	4	4.00	20.00	20.00	76.80	0.00
12780	2786	316	500	5	2022-05-08	4	4.00	530.00	600.00	2304.00	268.80
12781	2787	316	1433	5	2022-04-02	2	5.00	10.00	10.00	19.00	0.00
12782	2788	643	288	2	2022-12-16	5	4.00	60.00	60.00	288.00	0.00
12783	2789	643	135	2	2022-06-17	7	4.00	20.00	20.00	134.40	0.00
12784	2790	643	562	2	2023-04-30	5	3.00	30.00	40.00	194.00	48.50
12785	2791	644	96	5	2023-09-07	2	4.00	30.00	30.00	57.60	0.00
12786	2792	644	1205	5	2022-06-04	3	4.00	40.00	40.00	115.20	0.00
12787	2793	644	816	5	2022-06-27	1	5.00	10.00	10.00	9.50	0.00
12788	2794	645	665	2	2023-09-24	14	5.00	950.00	1080.00	14364.00	1729.00
12789	2795	645	820	2	2022-12-29	4	2.00	390.00	440.00	1724.80	196.00
12790	2796	645	508	2	2023-11-03	7	2.00	20.00	20.00	137.20	0.00
12791	2797	645	431	2	2022-05-23	3	3.00	290.00	310.00	902.10	58.20
12792	2798	550	1217	2	2022-05-18	4	2.00	10.00	10.00	39.20	0.00
12793	2799	550	682	2	2023-08-22	2	4.00	40.00	40.00	76.80	0.00
12794	2800	550	706	2	2022-03-20	5	2.00	130.00	150.00	735.00	98.00
12795	2801	563	470	5	2022-12-07	5	5.00	620.00	780.00	3705.00	760.00
12796	2802	208	33	5	2022-06-23	1	4.00	10.00	10.00	9.60	0.00
12797	2803	632	94	2	2023-12-13	3	4.00	30.00	40.00	115.20	28.80
12798	2804	37	1118	2	2023-06-21	3	2.00	10.00	10.00	29.40	0.00
12799	2805	37	1434	2	2023-06-04	6	5.00	30.00	30.00	171.00	0.00
12800	2806	429	1273	2	2022-05-07	2	4.00	40.00	50.00	96.00	19.20
12801	2807	68	1218	1	2022-01-13	2	2.00	10.00	10.00	19.60	0.00
12802	2808	68	1435	1	2022-08-23	2	3.00	10.00	10.00	19.40	0.00
12803	2809	68	1249	1	2023-01-22	5	4.00	600.00	700.00	3360.00	480.00
12804	2810	68	1132	1	2022-03-14	2	5.00	480.00	560.00	1064.00	152.00
12805	2811	577	369	1	2023-11-21	9	4.00	160.00	180.00	1555.20	172.80
12806	2812	577	1436	1	2022-05-20	6	4.00	150.00	190.00	1094.40	230.40
12807	2813	577	720	1	2023-10-11	3	4.00	180.00	210.00	604.80	86.40
12808	2814	577	1288	1	2023-12-02	4	2.00	910.00	1000.00	3920.00	352.80
12809	2815	577	563	1	2022-04-01	3	3.00	550.00	650.00	1891.50	291.00
12810	2816	576	711	2	2022-01-24	5	2.00	100.00	110.00	539.00	49.00
12811	2817	576	164	2	2023-01-07	1	4.00	60.00	60.00	57.60	0.00
12812	2818	576	1293	2	2023-02-13	2	5.00	100.00	120.00	228.00	38.00
12813	2819	576	246	2	2022-04-18	6	4.00	880.00	1090.00	6278.40	1209.60
12814	2820	339	1339	5	2022-04-26	5	2.00	10.00	10.00	49.00	0.00
12815	2821	339	210	5	2022-04-26	3	3.00	290.00	300.00	873.00	29.10
12816	2822	646	203	2	2023-02-03	3	2.00	270.00	300.00	882.00	88.20
12817	2823	225	312	5	2023-03-09	2	2.00	10.00	10.00	19.60	0.00
12818	2824	225	1070	5	2023-10-14	2	3.00	40.00	50.00	97.00	19.40
12819	2825	17	1437	2	2022-09-12	8	3.00	30.00	30.00	232.80	0.00
12820	2826	17	588	2	2022-03-12	2	4.00	240.00	300.00	576.00	115.20
12821	2827	17	1283	2	2022-11-06	2	3.00	0.00	0.00	0.00	0.00
12822	2828	17	30	2	2022-11-10	2	5.00	0.00	0.00	0.00	0.00
12823	2829	630	1438	5	2023-07-29	6	3.00	100.00	110.00	640.20	58.20
12824	2830	630	5	5	2023-11-20	5	4.00	50.00	60.00	288.00	48.00
12825	2831	630	1439	5	2022-01-28	2	5.00	70.00	80.00	152.00	19.00
12826	2832	113	1440	2	2022-04-29	5	2.00	410.00	440.00	2156.00	147.00
12827	2833	113	1418	2	2022-08-17	3	3.00	150.00	160.00	465.60	29.10
12828	2834	633	148	1	2023-03-17	7	5.00	20.00	20.00	133.00	0.00
12829	2835	633	176	1	2023-01-14	2	3.00	10.00	10.00	19.40	0.00
12830	2836	234	931	2	2023-09-29	1	2.00	10.00	10.00	9.80	0.00
12831	2837	234	1441	2	2023-02-15	3	5.00	20.00	20.00	57.00	0.00
12832	2838	234	1000	2	2023-02-20	5	2.00	110.00	120.00	588.00	49.00
12833	2839	610	947	5	2023-02-03	2	3.00	560.00	700.00	1358.00	271.60
12834	2840	253	773	1	2022-04-27	1	3.00	100.00	120.00	116.40	19.40
12835	2841	647	464	2	2022-08-08	4	3.00	980.00	1140.00	4423.20	620.80
12836	2842	597	840	1	2023-08-05	7	5.00	180.00	230.00	1529.50	332.50
12837	2843	648	436	2	2023-04-22	2	3.00	120.00	140.00	271.60	38.80
12838	2844	12	1375	2	2022-11-19	3	2.00	40.00	40.00	117.60	0.00
12839	2845	649	532	2	2023-09-30	8	3.00	710.00	850.00	6596.00	1086.40
12840	2846	422	208	5	2022-06-30	3	5.00	50.00	50.00	142.50	0.00
12841	2847	229	451	2	2022-06-24	3	3.00	680.00	760.00	2211.60	232.80
12842	2848	468	1442	2	2022-03-04	6	5.00	60.00	60.00	342.00	0.00
12843	2849	468	1177	2	2022-12-14	3	3.00	2390.00	2690.00	7827.90	873.00
12844	2850	650	864	2	2022-07-02	6	2.00	10.00	10.00	58.80	0.00
12845	2851	86	460	5	2023-08-17	1	4.00	50.00	60.00	57.60	9.60
12846	2852	221	729	2	2023-01-26	4	5.00	30.00	30.00	114.00	0.00
12847	2853	245	1443	1	2022-06-27	1	5.00	10.00	10.00	9.50	0.00
12848	2854	245	535	1	2022-12-23	4	3.00	20.00	20.00	77.60	0.00
12849	2855	140	1032	7	2022-07-14	3	2.00	40.00	40.00	117.60	0.00
12850	2856	651	1388	2	2023-12-08	7	4.00	20.00	20.00	134.40	0.00
12851	2857	326	446	5	2022-03-03	4	3.00	1490.00	1600.00	6208.00	426.80
12852	2858	597	1154	1	2023-07-11	2	3.00	180.00	230.00	446.20	97.00
12853	2859	185	659	2	2023-09-21	4	3.00	60.00	70.00	271.60	38.80
12854	2860	185	1444	2	2023-05-29	3	3.00	310.00	380.00	1105.80	203.70
12855	2861	185	200	2	2023-02-24	9	5.00	1340.00	1630.00	13936.50	2479.50
12856	2862	185	840	2	2022-08-16	7	3.00	240.00	290.00	1969.10	339.50
12857	2863	652	1397	2	2022-09-02	4	2.00	20.00	20.00	78.40	0.00
12858	2864	37	471	7	2023-10-03	3	5.00	30.00	30.00	85.50	0.00
12859	2865	37	361	7	2022-01-03	7	4.00	70.00	80.00	537.60	67.20
12860	2866	37	398	7	2023-05-27	3	4.00	50.00	60.00	172.80	28.80
12861	2867	37	1445	7	2022-02-10	4	2.00	20.00	30.00	117.60	39.20
12862	2868	296	328	1	2023-05-19	5	4.00	10.00	10.00	48.00	0.00
12863	2869	296	721	1	2023-05-31	3	5.00	40.00	40.00	114.00	0.00
12864	2870	653	1446	2	2023-04-29	2	5.00	20.00	20.00	38.00	0.00
12865	2871	196	1324	2	2023-10-05	3	5.00	60.00	70.00	199.50	28.50
12866	2872	196	542	2	2023-03-26	3	3.00	270.00	310.00	902.10	116.40
12867	2873	234	320	2	2022-09-15	1	3.00	0.00	0.00	0.00	0.00
12868	2874	287	538	2	2023-07-17	8	2.00	750.00	810.00	6350.40	470.40
12869	2875	134	132	5	2023-04-18	3	4.00	10.00	10.00	28.80	0.00
12870	2876	103	993	1	2022-02-16	2	2.00	120.00	150.00	294.00	58.80
12871	2877	103	324	1	2022-05-15	7	5.00	920.00	1010.00	6716.50	598.50
12872	2878	85	1250	2	2023-08-31	2	4.00	50.00	50.00	96.00	0.00
12873	2879	85	373	2	2022-12-15	2	5.00	0.00	0.00	0.00	0.00
12874	2880	85	107	2	2023-09-11	3	5.00	210.00	250.00	712.50	114.00
12875	2881	654	16	1	2023-06-28	6	2.00	30.00	30.00	176.40	0.00
12876	2882	654	661	1	2022-11-06	3	5.00	30.00	30.00	85.50	0.00
12877	2883	655	609	2	2022-07-12	5	5.00	10.00	10.00	47.50	0.00
12878	2884	152	853	1	2023-01-19	4	5.00	10.00	10.00	38.00	0.00
12879	2885	37	635	2	2023-06-24	2	4.00	20.00	20.00	38.40	0.00
12880	2886	419	390	2	2023-09-12	5	5.00	290.00	310.00	1472.50	95.00
12881	2887	204	454	5	2022-09-17	3	2.00	10.00	10.00	29.40	0.00
12882	2888	204	861	5	2023-02-01	2	2.00	10.00	10.00	19.60	0.00
12883	2889	204	731	5	2023-07-12	5	5.00	20.00	30.00	142.50	47.50
12884	2890	153	1447	2	2023-01-08	5	5.00	20.00	20.00	95.00	0.00
12885	2891	656	793	1	2022-08-26	2	2.00	40.00	50.00	98.00	19.60
12886	2892	656	953	1	2023-07-08	3	2.00	20.00	20.00	58.80	0.00
12887	2893	263	1448	2	2022-05-31	2	5.00	10.00	10.00	19.00	0.00
12888	2894	263	219	2	2023-03-31	5	4.00	30.00	30.00	144.00	0.00
12889	2895	263	1449	2	2022-02-14	11	5.00	60.00	70.00	731.50	104.50
12890	2896	263	180	2	2022-09-11	3	2.00	40.00	40.00	117.60	0.00
12891	2897	365	1069	2	2022-02-03	5	4.00	50.00	50.00	240.00	0.00
12892	2898	98	1328	2	2022-07-02	4	2.00	890.00	960.00	3763.20	274.40
12893	2899	75	285	2	2022-02-24	2	5.00	330.00	410.00	779.00	152.00
12894	2900	134	1328	2	2022-07-27	2	2.00	410.00	480.00	940.80	137.20
12895	2901	134	396	2	2022-12-22	4	4.00	10.00	10.00	38.40	0.00
12896	2902	402	780	2	2022-10-09	7	5.00	150.00	180.00	1197.00	199.50
12897	2903	101	1216	2	2022-10-05	5	4.00	20.00	20.00	96.00	0.00
12898	2904	657	1071	2	2022-10-15	7	5.00	30.00	40.00	266.00	66.50
12899	2905	657	1190	2	2022-03-25	3	5.00	470.00	540.00	1539.00	199.50
12900	2906	246	1450	2	2022-02-15	2	4.00	290.00	310.00	595.20	38.40
12901	2907	658	1451	2	2023-10-13	2	4.00	10.00	10.00	19.20	0.00
12902	2908	658	471	2	2023-07-11	5	2.00	40.00	50.00	245.00	49.00
12903	2909	658	1141	2	2023-05-06	3	3.00	10.00	10.00	29.10	0.00
12904	2910	6	1029	2	2022-07-26	3	5.00	10.00	10.00	28.50	0.00
12905	2911	659	644	2	2022-06-14	4	2.00	330.00	390.00	1528.80	235.20
12906	2912	660	1452	2	2023-01-17	5	2.00	30.00	40.00	196.00	49.00
12907	2913	660	1453	2	2022-07-23	4	5.00	30.00	40.00	152.00	38.00
12908	2914	660	92	2	2022-07-06	3	4.00	30.00	40.00	115.20	28.80
12909	2915	661	1410	1	2023-01-22	3	2.00	110.00	140.00	411.60	88.20
12910	2916	661	1376	1	2023-03-14	2	2.00	10.00	10.00	19.60	0.00
12911	2917	661	985	1	2023-12-01	4	5.00	230.00	260.00	988.00	114.00
12912	2918	89	1454	5	2022-12-20	1	3.00	10.00	10.00	9.70	0.00
12913	2919	59	1433	7	2022-03-22	5	2.00	20.00	20.00	98.00	0.00
12914	2920	59	1105	7	2022-11-23	2	3.00	10.00	10.00	19.40	0.00
12915	2921	59	981	7	2022-09-06	7	3.00	60.00	70.00	475.30	67.90
12916	2922	10	558	7	2022-04-12	2	4.00	120.00	130.00	249.60	19.20
12917	2923	662	626	1	2022-10-09	3	3.00	0.00	0.00	0.00	0.00
12918	2924	189	830	2	2022-07-24	1	4.00	10.00	10.00	9.60	0.00
12919	2925	663	942	5	2022-12-10	1	4.00	20.00	20.00	19.20	0.00
12920	2926	663	1455	5	2023-04-18	1	3.00	60.00	70.00	67.90	9.70
12921	2927	375	1449	1	2023-10-02	3	3.00	20.00	20.00	58.20	0.00
12922	2928	664	827	2	2022-04-14	3	5.00	10.00	10.00	28.50	0.00
12923	2929	665	317	2	2022-04-11	4	5.00	1340.00	1630.00	6194.00	1102.00
12924	2930	666	628	2	2022-10-22	4	5.00	20.00	20.00	76.00	0.00
12925	2931	10	926	7	2023-07-19	2	2.00	10.00	10.00	19.60	0.00
12926	2932	10	249	7	2023-07-03	2	3.00	10.00	10.00	19.40	0.00
12927	2933	10	324	7	2023-03-25	1	4.00	120.00	140.00	134.40	19.20
12928	2934	203	967	2	2023-02-10	1	4.00	140.00	160.00	153.60	19.20
12929	2935	203	1401	2	2023-03-22	3	5.00	370.00	430.00	1225.50	171.00
12930	2936	203	82	2	2023-10-11	1	3.00	30.00	40.00	38.80	9.70
12931	2937	203	675	2	2022-08-17	7	4.00	40.00	50.00	336.00	67.20
12932	2938	203	130	2	2023-04-19	7	3.00	220.00	250.00	1697.50	203.70
12933	2939	203	68	2	2023-03-27	5	4.00	160.00	190.00	912.00	144.00
12934	2940	203	445	2	2022-10-22	3	3.00	50.00	60.00	174.60	29.10
12935	2941	269	1456	2	2023-10-18	1	3.00	80.00	90.00	87.30	9.70
12936	2942	269	636	2	2023-10-10	7	5.00	1390.00	1530.00	10174.50	931.00
12937	2943	269	813	2	2022-07-28	3	5.00	350.00	370.00	1054.50	57.00
12938	2944	14	299	2	2022-09-05	9	3.00	290.00	310.00	2706.30	174.60
12939	2945	14	1457	2	2023-10-09	1	3.00	20.00	20.00	19.40	0.00
12940	2946	37	494	5	2022-02-23	7	2.00	40.00	40.00	274.40	0.00
12941	2947	423	1458	2	2022-11-06	3	4.00	20.00	30.00	86.40	28.80
12942	2948	423	1459	2	2022-01-13	14	3.00	50.00	60.00	814.80	135.80
12943	2949	423	756	2	2023-07-11	5	4.00	30.00	40.00	192.00	48.00
12944	2950	667	198	7	2022-07-22	4	3.00	40.00	40.00	155.20	0.00
12945	2951	667	1216	7	2022-05-16	5	4.00	20.00	20.00	96.00	0.00
12946	2952	667	1460	7	2023-04-01	2	3.00	100.00	110.00	213.40	19.40
12947	2953	667	1461	7	2023-09-06	2	5.00	90.00	110.00	209.00	38.00
12948	2954	667	501	7	2022-07-16	2	2.00	10.00	10.00	19.60	0.00
12949	2955	667	1462	7	2022-07-28	2	4.00	590.00	670.00	1286.40	153.60
12950	2956	49	885	2	2023-08-21	1	5.00	30.00	40.00	38.00	9.50
12951	2957	668	475	2	2023-09-08	3	4.00	180.00	190.00	547.20	28.80
12952	2958	197	9	2	2023-12-31	1	3.00	0.00	0.00	0.00	0.00
12953	2959	4	800	2	2023-03-25	4	3.00	20.00	20.00	77.60	0.00
12954	2960	4	272	2	2023-04-06	4	3.00	40.00	50.00	194.00	38.80
12955	2961	246	988	2	2023-07-21	3	3.00	20.00	20.00	58.20	0.00
12956	2962	246	1124	2	2022-12-07	8	3.00	40.00	40.00	310.40	0.00
12957	2963	669	24	1	2022-02-20	2	5.00	70.00	80.00	152.00	19.00
12958	2964	669	164	1	2023-05-17	2	2.00	80.00	100.00	196.00	39.20
12959	2965	669	526	1	2023-04-11	5	2.00	20.00	20.00	98.00	0.00
12960	2966	669	1463	1	2022-02-28	2	2.00	20.00	20.00	39.20	0.00
12961	2967	670	1002	2	2022-11-11	6	4.00	30.00	30.00	172.80	0.00
12962	2968	670	1191	2	2023-11-21	4	4.00	30.00	30.00	115.20	0.00
12963	2969	597	78	1	2023-04-23	3	2.00	410.00	500.00	1470.00	264.60
12964	2970	597	586	1	2022-02-05	6	2.00	30.00	30.00	176.40	0.00
12965	2971	597	556	1	2023-12-23	8	4.00	10.00	10.00	76.80	0.00
12966	2972	597	1382	1	2023-12-16	2	4.00	30.00	30.00	57.60	0.00
12967	2973	597	460	1	2022-05-28	4	5.00	240.00	260.00	988.00	76.00
12968	2974	498	871	2	2023-03-07	5	4.00	10.00	10.00	48.00	0.00
12969	2975	428	617	2	2022-01-23	2	2.00	210.00	240.00	470.40	58.80
12970	2976	428	1464	2	2022-06-19	4	4.00	20.00	20.00	76.80	0.00
12971	2977	125	1465	7	2022-12-15	7	2.00	160.00	190.00	1303.40	205.80
12972	2978	181	1012	1	2022-02-24	2	2.00	20.00	20.00	39.20	0.00
12973	2979	671	1456	1	2022-04-12	6	3.00	460.00	550.00	3201.00	523.80
12974	2980	71	1466	2	2023-02-15	4	4.00	20.00	20.00	76.80	0.00
12975	2981	71	1252	2	2022-06-13	2	5.00	40.00	40.00	76.00	0.00
12976	2982	68	1465	2	2023-05-01	4	4.00	100.00	120.00	460.80	76.80
12977	2983	68	654	2	2022-12-09	4	3.00	10.00	10.00	38.80	0.00
12978	2984	672	331	1	2023-09-07	3	3.00	50.00	50.00	145.50	0.00
12979	2985	672	1259	1	2022-01-28	1	4.00	230.00	280.00	268.80	48.00
12980	2986	402	1467	2	2023-07-31	4	2.00	20.00	20.00	78.40	0.00
12981	2987	402	365	2	2023-01-30	2	3.00	20.00	20.00	38.80	0.00
12982	2988	402	427	2	2022-05-25	9	5.00	1140.00	1270.00	10858.50	1111.50
12983	2989	376	1422	1	2022-04-05	1	2.00	10.00	10.00	9.80	0.00
12984	2990	376	1459	1	2022-06-08	4	2.00	20.00	20.00	78.40	0.00
12985	2991	376	436	1	2023-05-22	5	5.00	410.00	450.00	2137.50	190.00
12986	2992	376	79	1	2022-04-05	7	5.00	30.00	30.00	199.50	0.00
12987	2993	25	565	2	2023-08-15	3	5.00	50.00	60.00	171.00	28.50
12988	2994	166	1189	2	2022-05-25	4	5.00	840.00	900.00	3420.00	228.00
12989	2995	530	69	1	2022-06-20	4	2.00	50.00	60.00	235.20	39.20
12990	2996	55	5	2	2023-02-15	5	3.00	50.00	60.00	291.00	48.50
12991	2997	210	838	2	2022-11-29	4	5.00	20.00	20.00	76.00	0.00
12992	2998	210	1468	2	2022-10-08	1	3.00	0.00	0.00	0.00	0.00
12993	2999	210	247	2	2022-07-29	4	2.00	90.00	100.00	392.00	39.20
12994	3000	210	1469	2	2022-05-24	3	4.00	200.00	210.00	604.80	28.80
12995	3001	210	1110	2	2022-03-07	2	4.00	40.00	40.00	76.80	0.00
12996	3002	210	492	2	2023-04-29	2	3.00	10.00	10.00	19.40	0.00
12997	3003	673	1470	2	2022-04-01	5	5.00	20.00	20.00	95.00	0.00
12998	3004	674	1125	2	2022-08-30	4	2.00	30.00	30.00	117.60	0.00
12999	3005	304	1471	5	2023-01-09	1	3.00	190.00	210.00	203.70	19.40
13000	3006	675	998	2	2022-07-15	3	4.00	80.00	90.00	259.20	28.80
13001	3007	31	1108	5	2022-04-29	5	5.00	720.00	900.00	4275.00	855.00
13002	3008	676	277	2	2022-02-24	3	5.00	30.00	30.00	85.50	0.00
13003	3009	378	1269	5	2023-01-26	3	2.00	160.00	190.00	558.60	88.20
13004	3010	327	1307	2	2022-07-29	5	4.00	210.00	240.00	1152.00	144.00
13005	3011	677	386	2	2023-03-09	5	2.00	10.00	10.00	49.00	0.00
13006	3012	677	156	2	2022-01-16	5	5.00	2190.00	2550.00	12112.50	1710.00
13007	3013	677	380	2	2022-08-01	2	5.00	20.00	20.00	38.00	0.00
13008	3014	677	592	2	2023-10-23	6	3.00	10.00	10.00	58.20	0.00
13009	3015	677	511	2	2023-11-26	4	4.00	20.00	20.00	76.80	0.00
13010	3016	82	739	2	2023-07-09	2	4.00	290.00	340.00	652.80	96.00
13011	3017	678	419	2	2023-07-06	8	2.00	650.00	730.00	5723.20	627.20
13012	3018	678	1156	2	2023-09-04	3	5.00	20.00	20.00	57.00	0.00
13013	3019	678	1201	2	2022-10-02	7	5.00	590.00	670.00	4455.50	532.00
13014	3020	9	1472	2	2023-08-27	3	3.00	10.00	10.00	29.10	0.00
13015	3021	9	1031	2	2023-03-10	3	2.00	80.00	90.00	264.60	29.40
13016	3022	9	643	2	2022-02-23	3	5.00	60.00	70.00	199.50	28.50
13017	3023	9	711	2	2023-10-20	5	4.00	80.00	90.00	432.00	48.00
13018	3024	328	1276	2	2022-09-12	2	2.00	260.00	330.00	646.80	137.20
13019	3025	383	306	2	2023-06-13	11	5.00	40.00	50.00	522.50	104.50
13020	3026	383	458	2	2023-09-11	3	2.00	20.00	20.00	58.80	0.00
13021	3027	243	1061	2	2023-09-18	3	2.00	220.00	250.00	735.00	88.20
13022	3028	679	1473	7	2023-11-06	2	4.00	10.00	10.00	19.20	0.00
13023	3029	680	932	2	2022-05-30	5	3.00	400.00	500.00	2425.00	485.00
13024	3030	681	1420	2	2023-06-17	4	5.00	340.00	400.00	1520.00	228.00
13025	3031	554	1196	2	2022-09-11	4	5.00	150.00	190.00	722.00	152.00
13026	3032	554	1063	2	2023-01-12	1	5.00	30.00	30.00	28.50	0.00
13027	3033	682	1226	2	2023-01-03	4	4.00	190.00	200.00	768.00	38.40
13028	3034	282	1115	2	2022-12-04	4	3.00	20.00	20.00	77.60	0.00
13029	3035	601	1045	2	2023-10-20	6	2.00	40.00	50.00	294.00	58.80
13030	3036	601	1473	2	2023-08-10	7	5.00	40.00	40.00	266.00	0.00
13031	3037	601	1474	2	2022-03-18	2	3.00	50.00	60.00	116.40	19.40
13032	3038	601	499	2	2023-04-14	5	4.00	20.00	30.00	144.00	48.00
13033	3039	601	1475	2	2023-02-19	2	3.00	30.00	30.00	58.20	0.00
13034	3040	683	720	2	2023-01-12	3	4.00	160.00	170.00	489.60	28.80
13035	3041	684	1007	2	2022-09-28	5	3.00	20.00	20.00	97.00	0.00
13036	3042	685	861	7	2022-04-11	2	5.00	10.00	10.00	19.00	0.00
13037	3043	685	1476	7	2023-06-22	2	4.00	20.00	20.00	38.40	0.00
13038	3044	685	1477	7	2023-08-13	8	2.00	1850.00	2050.00	16072.00	1568.00
13039	3045	686	639	1	2023-12-20	5	3.00	900.00	1020.00	4947.00	582.00
13040	3046	687	1478	1	2023-01-24	5	3.00	10.00	10.00	48.50	0.00
13041	3047	687	814	1	2023-12-14	1	3.00	20.00	30.00	29.10	9.70
13042	3048	203	9	2	2022-04-07	7	4.00	30.00	40.00	268.80	67.20
13043	3049	402	122	5	2022-05-04	2	3.00	380.00	410.00	795.40	58.20
13044	3050	402	294	5	2022-08-03	4	3.00	320.00	360.00	1396.80	155.20
13045	3051	688	1479	2	2023-05-19	2	2.00	30.00	40.00	78.40	19.60
13046	3052	688	1052	2	2022-11-18	4	3.00	220.00	230.00	892.40	38.80
13047	3053	688	1238	2	2023-04-04	2	4.00	40.00	40.00	76.80	0.00
13048	3054	286	1368	1	2023-01-25	2	5.00	480.00	520.00	988.00	76.00
13049	3055	286	447	1	2023-09-18	2	3.00	10.00	10.00	19.40	0.00
13050	3056	74	891	2	2023-03-26	5	5.00	2630.00	2800.00	13300.00	807.50
13051	3057	111	1344	1	2023-01-21	2	2.00	10.00	10.00	19.60	0.00
13052	3058	111	1043	1	2022-12-02	10	5.00	30.00	30.00	285.00	0.00
13053	3059	111	678	1	2022-09-11	2	3.00	30.00	30.00	58.20	0.00
13054	3060	111	1480	1	2022-12-16	2	4.00	20.00	20.00	38.40	0.00
13055	3061	473	1234	2	2022-07-09	3	3.00	100.00	120.00	349.20	58.20
13056	3062	452	795	2	2022-02-22	8	3.00	30.00	30.00	232.80	0.00
13057	3063	417	1481	5	2023-10-01	3	3.00	70.00	80.00	232.80	29.10
13058	3064	417	1482	5	2022-01-03	3	2.00	100.00	100.00	294.00	0.00
13059	3065	689	76	1	2023-07-06	8	4.00	80.00	90.00	691.20	76.80
13060	3066	689	723	1	2022-10-13	8	3.00	120.00	140.00	1086.40	155.20
13061	3067	689	1483	1	2023-09-30	5	2.00	180.00	210.00	1029.00	147.00
13062	3068	689	1484	1	2023-01-12	7	4.00	40.00	50.00	336.00	67.20
13063	3069	689	1416	1	2022-04-15	6	4.00	250.00	290.00	1670.40	230.40
13064	3070	690	1471	7	2023-10-05	4	2.00	550.00	660.00	2587.20	431.20
13065	3071	417	1075	2	2022-02-14	7	3.00	2400.00	2930.00	19894.70	3598.70
13066	3072	417	1485	2	2022-01-09	3	5.00	100.00	120.00	342.00	57.00
13067	3073	417	685	2	2022-08-11	5	2.00	50.00	60.00	294.00	49.00
13068	3074	70	1278	5	2023-09-12	2	5.00	100.00	110.00	209.00	19.00
13069	3075	4	632	2	2022-12-18	2	2.00	100.00	120.00	235.20	39.20
13070	3076	691	385	2	2023-10-08	3	4.00	290.00	340.00	979.20	144.00
13071	3077	691	905	2	2023-12-16	5	5.00	20.00	20.00	95.00	0.00
13072	3078	691	484	2	2023-07-08	2	2.00	880.00	980.00	1920.80	196.00
13073	3079	449	182	2	2023-06-14	8	2.00	30.00	30.00	235.20	0.00
13074	3080	692	586	5	2022-07-07	2	5.00	10.00	10.00	19.00	0.00
13075	3081	692	832	5	2022-08-12	3	4.00	30.00	40.00	115.20	28.80
13076	3082	693	706	2	2022-01-17	2	4.00	50.00	60.00	115.20	19.20
13077	3083	693	1401	2	2023-09-24	3	3.00	460.00	540.00	1571.40	232.80
13078	3084	104	186	2	2023-09-18	1	3.00	0.00	0.00	0.00	0.00
13079	3085	35	383	2	2022-02-18	4	3.00	230.00	250.00	970.00	77.60
13080	3086	35	658	2	2023-11-02	2	4.00	110.00	130.00	249.60	38.40
13081	3087	35	1468	2	2022-12-25	2	5.00	0.00	0.00	0.00	0.00
13082	3088	35	792	2	2022-11-09	2	2.00	10.00	10.00	19.60	0.00
13083	3089	694	1123	1	2022-09-30	5	5.00	50.00	60.00	285.00	47.50
13084	3090	694	1486	1	2023-10-23	7	4.00	590.00	670.00	4502.40	537.60
13085	3091	436	670	2	2023-08-06	7	3.00	390.00	450.00	3055.50	407.40
13086	3092	436	665	2	2023-10-06	5	4.00	410.00	480.00	2304.00	336.00
13087	3093	436	1487	2	2023-01-28	3	4.00	140.00	170.00	489.60	86.40
13088	3094	695	559	7	2022-01-14	4	3.00	20.00	30.00	116.40	38.80
13089	3095	695	1146	7	2022-07-22	2	5.00	10.00	10.00	19.00	0.00
13090	3096	695	1015	7	2022-04-08	8	3.00	10.00	10.00	77.60	0.00
13091	3097	695	337	7	2022-05-13	2	5.00	10.00	10.00	19.00	0.00
13092	3098	275	323	2	2022-09-03	4	2.00	30.00	30.00	117.60	0.00
13093	3099	275	318	2	2023-06-06	4	4.00	200.00	220.00	844.80	76.80
13094	3100	104	1367	2	2022-12-06	3	3.00	10.00	10.00	29.10	0.00
13095	3101	104	714	2	2023-03-05	3	4.00	210.00	240.00	691.20	86.40
13096	3102	696	414	1	2023-03-07	6	5.00	660.00	700.00	3990.00	228.00
13097	3103	696	1488	1	2022-06-30	1	2.00	210.00	220.00	215.60	9.80
13098	3104	115	1489	2	2023-07-31	7	3.00	10.00	10.00	67.90	0.00
13099	3105	104	1490	2	2022-09-14	6	3.00	30.00	30.00	174.60	0.00
13100	3106	165	523	2	2022-03-11	4	3.00	20.00	20.00	77.60	0.00
13101	3107	224	822	2	2022-03-31	6	5.00	240.00	300.00	1710.00	342.00
13102	3108	496	1491	2	2023-05-21	3	2.00	20.00	20.00	58.80	0.00
13103	3109	496	872	2	2022-04-07	3	5.00	220.00	240.00	684.00	57.00
13104	3110	496	828	2	2023-01-07	1	2.00	10.00	10.00	9.80	0.00
13105	3111	496	549	2	2022-06-10	8	5.00	40.00	50.00	380.00	76.00
13106	3112	496	1245	2	2023-10-11	1	2.00	230.00	270.00	264.60	39.20
13107	3113	203	1492	2	2023-09-24	3	5.00	690.00	840.00	2394.00	427.50
13108	3114	203	114	2	2023-02-01	5	5.00	110.00	140.00	665.00	142.50
13109	3115	203	1216	2	2023-03-05	6	2.00	30.00	30.00	176.40	0.00
13110	3116	203	914	2	2023-02-01	6	4.00	450.00	530.00	3052.80	460.80
13111	3117	203	23	2	2023-12-31	5	5.00	30.00	40.00	190.00	47.50
13112	3118	203	169	2	2023-01-04	4	4.00	20.00	20.00	76.80	0.00
13113	3119	697	300	5	2022-06-19	5	4.00	990.00	1120.00	5376.00	624.00
13114	3120	697	496	5	2023-05-15	2	5.00	230.00	250.00	475.00	38.00
13115	3121	697	1493	5	2022-02-05	3	3.00	40.00	50.00	145.50	29.10
13116	3122	697	109	5	2023-07-07	2	2.00	50.00	60.00	117.60	19.60
13117	3123	697	271	5	2023-06-04	5	2.00	70.00	80.00	392.00	49.00
13118	3124	697	1376	5	2022-10-22	2	4.00	0.00	0.00	0.00	0.00
13119	3125	697	487	5	2023-12-30	2	2.00	840.00	1040.00	2038.40	392.00
13120	3126	697	719	5	2022-02-10	4	4.00	460.00	560.00	2150.40	384.00
13121	3127	71	884	2	2022-08-26	2	5.00	230.00	260.00	494.00	57.00
13122	3128	383	1494	2	2023-07-09	4	2.00	50.00	50.00	196.00	0.00
13123	3129	381	643	5	2022-07-06	2	4.00	30.00	40.00	76.80	19.20
13124	3130	381	292	5	2023-02-06	2	2.00	200.00	240.00	470.40	78.40
13125	3131	381	553	5	2023-07-21	5	3.00	340.00	400.00	1940.00	291.00
13126	3132	381	35	5	2022-04-15	4	5.00	560.00	630.00	2394.00	266.00
13127	3133	698	1495	5	2022-03-10	2	3.00	10.00	10.00	19.40	0.00
13128	3134	698	1086	5	2022-12-07	3	3.00	10.00	10.00	29.10	0.00
13129	3135	541	998	2	2022-01-30	5	2.00	30.00	30.00	147.00	0.00
13130	3136	541	572	2	2022-02-21	3	5.00	70.00	80.00	228.00	28.50
13131	3137	541	1496	2	2023-01-08	1	3.00	60.00	70.00	67.90	9.70
13132	3138	541	589	2	2023-10-17	2	4.00	10.00	10.00	19.20	0.00
13133	3139	541	1131	2	2022-08-07	2	3.00	40.00	40.00	77.60	0.00
13134	3140	541	286	2	2023-12-21	3	5.00	20.00	20.00	57.00	0.00
13135	3141	134	15	5	2022-10-16	3	5.00	190.00	210.00	598.50	57.00
13136	3142	162	116	7	2022-06-02	2	3.00	180.00	210.00	407.40	58.20
13137	3143	144	247	1	2022-06-06	5	3.00	100.00	120.00	582.00	97.00
13138	3144	144	148	1	2023-08-28	6	3.00	10.00	10.00	58.20	0.00
13139	3145	466	475	2	2022-07-07	7	4.00	320.00	350.00	2352.00	201.60
13140	3146	153	1497	1	2022-03-08	4	2.00	770.00	960.00	3763.20	744.80
13141	3147	153	688	1	2022-10-19	3	5.00	80.00	90.00	256.50	28.50
13142	3148	351	314	1	2022-05-16	5	4.00	30.00	30.00	144.00	0.00
13143	3149	82	491	5	2023-04-07	5	3.00	20.00	30.00	145.50	48.50
13144	3150	6	255	2	2023-08-19	3	5.00	20.00	30.00	85.50	28.50
13145	3151	76	696	5	2022-02-28	6	2.00	1730.00	2030.00	11936.40	1764.00
13146	3152	76	1498	5	2023-01-12	2	3.00	1690.00	1800.00	3492.00	213.40
13147	3153	76	1496	5	2022-03-28	2	4.00	90.00	100.00	192.00	19.20
13148	3154	76	268	5	2022-11-04	7	4.00	230.00	260.00	1747.20	201.60
13149	3155	699	1499	2	2022-07-28	2	2.00	640.00	740.00	1450.40	196.00
13150	3156	667	969	1	2022-11-16	3	4.00	80.00	90.00	259.20	28.80
13151	3157	253	11	2	2022-03-30	2	2.00	220.00	280.00	548.80	117.60
13152	3158	253	198	2	2022-10-17	2	3.00	30.00	30.00	58.20	0.00
13153	3159	312	1037	5	2023-06-23	5	4.00	70.00	70.00	336.00	0.00
13154	3160	312	960	5	2022-01-25	3	4.00	100.00	120.00	345.60	57.60
13155	3161	35	1500	1	2023-01-16	5	4.00	10.00	10.00	48.00	0.00
13156	3162	10	838	2	2023-01-21	2	2.00	20.00	20.00	39.20	0.00
13157	3163	10	1359	2	2022-02-26	5	4.00	70.00	80.00	384.00	48.00
13158	3164	10	1501	2	2022-04-24	3	2.00	50.00	60.00	176.40	29.40
13159	3165	10	1451	2	2023-03-12	9	2.00	40.00	40.00	352.80	0.00
13160	3166	10	1502	2	2022-12-25	2	3.00	210.00	240.00	465.60	58.20
13161	3167	10	1409	2	2022-12-27	3	5.00	20.00	20.00	57.00	0.00
13162	3168	347	279	5	2022-10-12	5	2.00	70.00	70.00	343.00	0.00
13163	3169	700	1226	2	2022-09-08	8	2.00	370.00	390.00	3057.60	156.80
13164	3170	700	458	2	2022-11-09	13	4.00	50.00	60.00	748.80	124.80
13165	3171	40	1407	1	2023-02-15	6	4.00	20.00	20.00	115.20	0.00
13166	3172	118	742	2	2022-06-05	2	3.00	0.00	0.00	0.00	0.00
13167	3173	118	663	2	2023-03-18	5	3.00	450.00	530.00	2570.50	388.00
13168	3174	118	1261	2	2022-07-15	3	3.00	10.00	10.00	29.10	0.00
13169	3175	166	1503	2	2023-12-15	7	5.00	160.00	180.00	1197.00	133.00
13170	3176	701	790	2	2023-05-25	2	4.00	160.00	180.00	345.60	38.40
13171	3177	701	1049	2	2022-09-23	2	4.00	40.00	50.00	96.00	19.20
13172	3178	104	946	7	2022-09-28	2	2.00	20.00	20.00	39.20	0.00
13173	3179	213	6	2	2023-03-09	3	4.00	20.00	20.00	57.60	0.00
13174	3180	213	139	2	2022-01-23	2	5.00	50.00	60.00	114.00	19.00
13175	3181	213	474	2	2023-02-19	5	5.00	220.00	250.00	1187.50	142.50
13176	3182	702	545	1	2023-03-01	2	2.00	10.00	10.00	19.60	0.00
13177	3183	702	718	1	2023-03-12	3	2.00	660.00	830.00	2440.20	499.80
13178	3184	702	246	1	2023-12-01	9	2.00	1500.00	1630.00	14376.60	1146.60
13179	3185	702	246	1	2022-05-08	3	2.00	500.00	540.00	1587.60	117.60
13180	3186	34	1312	5	2023-04-18	3	5.00	20.00	30.00	85.50	28.50
13181	3187	34	1504	5	2022-11-25	3	4.00	70.00	70.00	201.60	0.00
13182	3188	626	858	2	2023-01-15	7	5.00	60.00	70.00	465.50	66.50
13183	3189	703	1172	1	2022-07-16	1	4.00	0.00	0.00	0.00	0.00
13184	3190	703	1505	1	2023-12-23	4	5.00	20.00	20.00	76.00	0.00
13185	3191	28	1506	2	2023-11-23	3	4.00	10.00	10.00	28.80	0.00
13186	3192	49	804	2	2022-10-14	1	3.00	70.00	70.00	67.90	0.00
13187	3193	704	249	2	2023-01-22	7	5.00	10.00	10.00	66.50	0.00
13188	3194	75	526	5	2023-08-15	3	5.00	0.00	0.00	0.00	0.00
13189	3195	75	261	5	2023-11-15	6	3.00	30.00	30.00	174.60	0.00
13190	3196	526	1507	2	2022-11-04	3	3.00	20.00	20.00	58.20	0.00
13191	3197	253	313	2	2022-03-26	3	4.00	30.00	30.00	86.40	0.00
13192	3198	419	1391	7	2022-11-22	3	4.00	0.00	0.00	0.00	0.00
13193	3199	312	1508	2	2023-02-03	4	4.00	100.00	100.00	384.00	0.00
13194	3200	325	1413	2	2022-03-26	7	3.00	20.00	20.00	135.80	0.00
13195	3201	87	1293	1	2022-02-24	3	2.00	120.00	150.00	441.00	88.20
13196	3202	87	1051	1	2023-10-05	4	2.00	20.00	20.00	78.40	0.00
13197	3203	103	540	2	2023-11-02	8	2.00	510.00	600.00	4704.00	705.60
13198	3204	103	917	2	2022-08-24	1	4.00	10.00	10.00	9.60	0.00
13199	3205	103	64	2	2023-08-05	2	3.00	40.00	40.00	77.60	0.00
13200	3206	103	566	2	2023-07-05	8	2.00	50.00	60.00	470.40	78.40
13201	3207	103	883	2	2023-09-08	5	2.00	40.00	50.00	245.00	49.00
13202	3208	103	1509	2	2023-05-08	8	2.00	40.00	40.00	313.60	0.00
13203	3209	705	1510	2	2023-11-07	5	4.00	330.00	350.00	1680.00	96.00
13204	3210	705	67	2	2022-01-28	9	2.00	350.00	380.00	3351.60	264.60
13205	3211	706	408	2	2022-10-12	3	2.00	10.00	10.00	29.40	0.00
13206	3212	706	386	2	2022-11-03	7	3.00	10.00	10.00	67.90	0.00
13207	3213	517	552	2	2023-04-14	11	2.00	190.00	210.00	2263.80	215.60
13208	3214	325	869	2	2023-02-14	1	4.00	0.00	0.00	0.00	0.00
13209	3215	325	1113	2	2022-02-26	2	2.00	30.00	30.00	58.80	0.00
13210	3216	707	50	5	2023-01-09	6	3.00	70.00	80.00	465.60	58.20
13211	3217	454	1234	2	2023-01-18	3	4.00	120.00	150.00	432.00	86.40
13212	3218	25	761	2	2023-12-04	3	5.00	860.00	930.00	2650.50	199.50
13213	3219	25	884	2	2023-09-12	2	3.00	340.00	430.00	834.20	174.60
13214	3220	708	1238	2	2023-02-16	5	3.00	80.00	90.00	436.50	48.50
13215	3221	708	119	2	2022-07-20	4	5.00	40.00	50.00	190.00	38.00
13216	3222	708	294	2	2022-04-12	1	2.00	70.00	90.00	88.20	19.60
13217	3223	709	1018	5	2023-08-23	2	3.00	10.00	10.00	19.40	0.00
13218	3224	709	849	5	2023-02-10	2	3.00	0.00	0.00	0.00	0.00
13219	3225	709	257	5	2022-03-18	2	5.00	270.00	320.00	608.00	95.00
13220	3226	709	1511	5	2023-10-22	6	5.00	10.00	10.00	57.00	0.00
13221	3227	709	1512	5	2022-02-07	2	4.00	20.00	20.00	38.40	0.00
13222	3228	709	665	5	2022-10-01	3	3.00	220.00	230.00	669.30	29.10
13223	3229	709	1045	5	2022-12-15	1	3.00	10.00	10.00	9.70	0.00
13224	3230	134	459	2	2023-04-24	1	4.00	330.00	380.00	364.80	48.00
13225	3231	31	936	1	2023-07-14	5	2.00	100.00	110.00	539.00	49.00
13226	3232	141	1312	2	2023-07-17	3	2.00	30.00	30.00	88.20	0.00
13227	3233	141	498	2	2023-08-21	1	2.00	0.00	0.00	0.00	0.00
13228	3234	141	1513	2	2022-09-15	2	2.00	30.00	30.00	58.80	0.00
13229	3235	338	592	5	2023-10-26	1	5.00	0.00	0.00	0.00	0.00
13230	3236	79	258	7	2023-06-08	1	2.00	160.00	180.00	176.40	19.60
13231	3237	104	356	7	2022-10-27	3	3.00	40.00	40.00	116.40	0.00
13232	3238	104	413	7	2023-02-14	3	2.00	40.00	50.00	147.00	29.40
13233	3239	515	1210	2	2022-08-26	5	5.00	280.00	320.00	1520.00	190.00
13234	3240	515	1514	2	2022-05-09	7	5.00	100.00	120.00	798.00	133.00
13235	3241	515	326	2	2022-06-10	3	5.00	10.00	10.00	28.50	0.00
13236	3242	386	1012	5	2022-09-29	5	2.00	50.00	60.00	294.00	49.00
13237	3243	118	1473	1	2022-12-16	13	4.00	10.00	10.00	124.80	0.00
13238	3244	535	1515	2	2022-08-15	5	4.00	190.00	220.00	1056.00	144.00
13239	3245	535	292	2	2022-01-06	3	5.00	270.00	320.00	912.00	142.50
13240	3246	237	961	1	2022-10-13	3	2.00	40.00	50.00	147.00	29.40
13241	3247	237	392	1	2023-11-15	5	4.00	270.00	320.00	1536.00	240.00
13242	3248	237	1516	1	2023-12-20	3	3.00	20.00	20.00	58.20	0.00
13243	3249	551	1460	2	2023-11-10	2	4.00	100.00	110.00	211.20	19.20
13244	3250	551	666	2	2022-06-16	2	2.00	100.00	110.00	215.60	19.60
13245	3251	710	1054	2	2022-04-06	7	2.00	20.00	20.00	137.20	0.00
13246	3252	210	1002	5	2022-09-06	3	5.00	50.00	60.00	171.00	28.50
13247	3253	28	426	1	2023-04-07	3	4.00	10.00	10.00	28.80	0.00
13248	3254	28	1260	1	2023-12-07	2	2.00	30.00	30.00	58.80	0.00
13249	3255	203	234	2	2023-01-22	1	3.00	90.00	110.00	106.70	19.40
13250	3256	203	1233	2	2022-07-10	3	5.00	20.00	20.00	57.00	0.00
13251	3257	251	746	2	2023-04-21	2	3.00	0.00	0.00	0.00	0.00
13252	3258	90	973	1	2022-02-20	3	5.00	60.00	80.00	228.00	57.00
13253	3259	90	697	1	2022-11-23	2	2.00	0.00	0.00	0.00	0.00
13254	3260	711	461	2	2022-10-12	2	2.00	0.00	0.00	0.00	0.00
13255	3261	105	1517	5	2023-11-24	4	5.00	20.00	20.00	76.00	0.00
13256	3262	142	960	5	2023-12-01	2	4.00	80.00	100.00	192.00	38.40
13257	3263	142	657	5	2022-01-16	7	5.00	590.00	730.00	4854.50	931.00
13258	3264	142	1430	5	2022-01-08	3	2.00	190.00	240.00	705.60	147.00
13259	3265	563	1043	1	2023-03-15	4	4.00	10.00	10.00	38.40	0.00
13260	3266	210	719	2	2023-07-14	2	4.00	230.00	280.00	537.60	96.00
13261	3267	210	557	2	2023-11-10	3	4.00	190.00	200.00	576.00	28.80
13262	3268	712	705	2	2023-09-06	2	2.00	120.00	140.00	274.40	39.20
13263	3269	712	1518	2	2022-12-15	1	2.00	40.00	40.00	39.20	0.00
13264	3270	570	1426	2	2022-08-13	3	2.00	0.00	0.00	0.00	0.00
13265	3271	570	53	2	2022-01-23	3	5.00	10.00	10.00	28.50	0.00
13266	3272	713	1426	1	2022-01-05	8	2.00	10.00	10.00	78.40	0.00
13267	3273	14	24	2	2022-07-14	5	2.00	180.00	200.00	980.00	98.00
13268	3274	80	891	2	2023-11-13	6	4.00	2760.00	3360.00	19353.60	3456.00
13269	3275	714	830	2	2023-08-24	3	5.00	20.00	20.00	57.00	0.00
13270	3276	714	183	2	2023-12-30	6	3.00	30.00	30.00	174.60	0.00
13271	3277	715	347	1	2022-11-05	7	2.00	20.00	20.00	137.20	0.00
13272	3278	715	1130	1	2023-10-03	1	4.00	30.00	30.00	28.80	0.00
13273	3279	715	220	1	2023-11-06	2	5.00	10.00	10.00	19.00	0.00
13274	3280	715	1211	1	2023-11-07	7	3.00	20.00	20.00	135.80	0.00
13275	3281	715	466	1	2023-02-21	5	5.00	3790.00	4160.00	19760.00	1757.50
13276	3282	716	1017	2	2023-03-06	2	4.00	50.00	50.00	96.00	0.00
13277	3283	716	875	2	2022-03-25	1	5.00	0.00	0.00	0.00	0.00
13278	3284	49	535	2	2022-09-28	3	4.00	20.00	20.00	57.60	0.00
13279	3285	478	472	2	2023-07-21	7	3.00	50.00	60.00	407.40	67.90
13280	3286	465	837	2	2023-10-11	2	3.00	10.00	10.00	19.40	0.00
13281	3287	465	1519	2	2023-07-29	3	3.00	10.00	10.00	29.10	0.00
13282	3288	717	639	5	2022-05-28	3	2.00	440.00	490.00	1440.60	147.00
13283	3289	717	348	5	2023-12-24	5	2.00	30.00	30.00	147.00	0.00
13284	3290	717	101	5	2022-01-26	5	3.00	210.00	250.00	1212.50	194.00
13285	3291	717	1520	5	2022-05-01	1	3.00	40.00	40.00	38.80	0.00
13286	3292	718	513	2	2022-03-16	2	5.00	10.00	10.00	19.00	0.00
13287	3293	178	169	2	2023-05-01	3	5.00	10.00	10.00	28.50	0.00
13288	3294	178	853	2	2023-03-19	2	5.00	0.00	0.00	0.00	0.00
13289	3295	452	613	5	2022-01-05	8	2.00	30.00	30.00	235.20	0.00
13290	3296	82	1521	5	2023-02-08	11	3.00	1620.00	1700.00	18139.00	853.60
13291	3297	55	625	2	2023-03-27	7	5.00	20.00	20.00	133.00	0.00
13292	3298	55	514	2	2022-06-23	4	4.00	110.00	120.00	460.80	38.40
13293	3299	60	1151	7	2022-11-23	3	4.00	1540.00	1920.00	5529.60	1094.40
13294	3300	12	14	2	2023-08-11	1	3.00	40.00	50.00	48.50	9.70
13295	3301	12	83	2	2023-01-26	1	5.00	70.00	80.00	76.00	9.50
13296	3302	12	1522	2	2022-03-15	6	4.00	500.00	540.00	3110.40	230.40
13297	3303	12	1002	2	2023-12-06	3	3.00	50.00	60.00	174.60	29.10
13298	3304	12	871	2	2022-11-29	3	5.00	0.00	0.00	0.00	0.00
13299	3305	719	898	1	2023-02-02	3	2.00	10.00	10.00	29.40	0.00
13300	3306	719	1237	1	2023-03-12	2	4.00	210.00	220.00	422.40	19.20
13301	3307	719	820	1	2022-09-22	3	3.00	280.00	330.00	960.30	145.50
13302	3308	719	316	1	2022-01-31	3	4.00	0.00	0.00	0.00	0.00
13303	3309	719	247	1	2023-10-21	2	3.00	50.00	50.00	97.00	0.00
13304	3310	253	1086	2	2023-09-01	6	2.00	30.00	30.00	176.40	0.00
13305	3311	134	921	2	2023-02-01	5	3.00	220.00	230.00	1115.50	48.50
13306	3312	720	894	1	2022-02-21	7	4.00	80.00	90.00	604.80	67.20
13307	3313	103	292	2	2022-05-17	5	3.00	530.00	600.00	2910.00	339.50
13308	3314	103	1128	2	2023-09-27	2	2.00	70.00	80.00	156.80	19.60
13309	3315	245	292	2	2022-08-24	2	5.00	240.00	270.00	513.00	57.00
13310	3316	245	1121	2	2022-12-30	3	5.00	10.00	10.00	28.50	0.00
13311	3317	721	1305	1	2023-08-27	5	3.00	280.00	340.00	1649.00	291.00
13312	3318	529	627	2	2023-07-28	9	2.00	140.00	180.00	1587.60	352.80
13313	3319	529	1187	2	2022-07-05	3	3.00	10.00	10.00	29.10	0.00
13314	3320	97	1038	2	2023-01-22	7	2.00	40.00	40.00	274.40	0.00
13315	3321	97	158	2	2022-03-27	3	4.00	600.00	660.00	1900.80	172.80
13316	3322	97	1077	2	2022-03-07	5	5.00	30.00	30.00	142.50	0.00
13317	3323	44	10	2	2023-08-10	3	2.00	60.00	70.00	205.80	29.40
13318	3324	44	593	2	2022-02-02	3	2.00	110.00	130.00	382.20	58.80
13319	3325	141	1177	2	2023-04-04	5	5.00	790.00	900.00	4275.00	522.50
13320	3326	141	1489	2	2022-04-12	1	4.00	0.00	0.00	0.00	0.00
13321	3327	141	1474	2	2023-05-02	3	4.00	60.00	70.00	201.60	28.80
13322	3328	141	363	2	2023-09-17	5	3.00	20.00	20.00	97.00	0.00
13323	3329	141	1523	2	2023-12-11	8	4.00	240.00	260.00	1996.80	153.60
13324	3330	141	919	2	2022-01-19	2	2.00	130.00	150.00	294.00	39.20
13325	3331	141	1162	2	2022-12-20	3	3.00	210.00	240.00	698.40	87.30
13326	3332	229	1524	2	2023-11-24	3	3.00	210.00	230.00	669.30	58.20
13327	3333	229	1514	2	2022-04-16	3	4.00	40.00	50.00	144.00	28.80
13328	3334	229	1525	2	2023-06-28	1	3.00	0.00	0.00	0.00	0.00
13329	3335	454	787	5	2023-07-11	4	5.00	20.00	20.00	76.00	0.00
13330	3336	454	525	5	2023-06-26	4	4.00	370.00	430.00	1651.20	230.40
13331	3337	454	1526	5	2022-01-30	4	2.00	110.00	130.00	509.60	78.40
13332	3338	454	11	5	2022-12-03	3	4.00	490.00	570.00	1641.60	230.40
13333	3339	454	1527	5	2023-11-13	9	5.00	100.00	120.00	1026.00	171.00
13334	3340	454	1528	5	2023-06-13	3	2.00	180.00	200.00	588.00	58.80
13335	3341	454	323	5	2023-12-16	5	5.00	40.00	50.00	237.50	47.50
13336	3342	540	1128	1	2023-03-03	3	3.00	110.00	120.00	349.20	29.10
13337	3343	540	1111	1	2022-08-01	1	3.00	200.00	240.00	232.80	38.80
13338	3344	540	223	1	2023-01-02	3	5.00	50.00	60.00	171.00	28.50
13339	3345	540	188	1	2022-03-19	9	5.00	70.00	80.00	684.00	85.50
13340	3346	540	849	1	2023-07-31	4	3.00	10.00	10.00	38.80	0.00
13341	3347	540	1459	1	2023-08-06	5	2.00	20.00	30.00	147.00	49.00
13342	3348	722	401	2	2022-02-03	5	2.00	40.00	50.00	245.00	49.00
13343	3349	74	28	5	2022-10-06	5	5.00	20.00	20.00	95.00	0.00
13344	3350	203	697	2	2023-01-31	4	2.00	20.00	20.00	78.40	0.00
13345	3351	104	1049	2	2023-02-28	3	4.00	80.00	90.00	259.20	28.80
13346	3352	326	1529	2	2022-11-06	3	3.00	380.00	440.00	1280.40	174.60
13347	3353	326	67	2	2023-11-11	2	2.00	70.00	80.00	156.80	19.60
13348	3354	472	1150	2	2023-04-15	2	4.00	320.00	360.00	691.20	76.80
13349	3355	472	1530	2	2022-08-21	1	4.00	60.00	70.00	67.20	9.60
13350	3356	472	865	2	2023-07-28	2	3.00	20.00	20.00	38.80	0.00
13351	3357	472	316	2	2022-02-14	1	3.00	0.00	0.00	0.00	0.00
13352	3358	28	886	2	2022-05-30	9	2.00	70.00	70.00	617.40	0.00
13353	3359	101	386	2	2023-10-16	2	4.00	0.00	0.00	0.00	0.00
13354	3360	101	961	2	2023-12-02	2	5.00	30.00	30.00	57.00	0.00
13355	3361	126	230	1	2022-07-03	4	3.00	20.00	30.00	116.40	38.80
13356	3362	126	1531	1	2022-04-30	3	5.00	40.00	40.00	114.00	0.00
13357	3363	723	499	2	2023-04-13	3	4.00	20.00	20.00	57.60	0.00
13358	3364	723	93	2	2023-10-09	2	2.00	40.00	40.00	78.40	0.00
13359	3365	106	741	1	2022-10-18	3	3.00	10.00	10.00	29.10	0.00
13360	3366	218	1107	5	2023-04-18	2	4.00	230.00	290.00	556.80	115.20
13361	3367	211	935	2	2023-10-09	2	3.00	10.00	10.00	19.40	0.00
13362	3368	211	1358	2	2022-03-01	3	4.00	10.00	10.00	28.80	0.00
13363	3369	724	1532	2	2023-11-10	2	4.00	110.00	140.00	268.80	57.60
13364	3370	724	341	2	2022-01-03	4	3.00	60.00	70.00	271.60	38.80
13365	3371	725	218	7	2023-12-13	5	4.00	1070.00	1290.00	6192.00	1056.00
13366	3372	37	974	2	2022-02-27	6	4.00	20.00	30.00	172.80	57.60
13367	3373	37	1430	2	2023-08-26	2	4.00	130.00	160.00	307.20	57.60
13368	3374	660	1463	2	2023-10-26	3	5.00	20.00	30.00	85.50	28.50
13369	3375	660	395	2	2022-10-21	5	2.00	290.00	360.00	1764.00	343.00
13370	3376	660	434	2	2023-09-05	4	5.00	40.00	40.00	152.00	0.00
13371	3377	660	229	2	2022-06-29	2	5.00	290.00	360.00	684.00	133.00
13372	3378	726	1019	5	2022-12-05	9	2.00	90.00	110.00	970.20	176.40
13373	3379	15	1427	2	2023-08-08	6	3.00	10.00	10.00	58.20	0.00
13374	3380	15	1533	2	2023-10-17	3	5.00	10.00	10.00	28.50	0.00
13375	3381	210	1534	5	2022-02-28	9	3.00	20.00	20.00	174.60	0.00
13376	3382	273	136	5	2023-12-25	1	5.00	0.00	0.00	0.00	0.00
13377	3383	134	1304	1	2022-05-21	3	4.00	20.00	20.00	57.60	0.00
13378	3384	134	1535	1	2022-04-09	7	4.00	350.00	380.00	2553.60	201.60
13379	3385	134	908	1	2023-12-12	5	2.00	1530.00	1800.00	8820.00	1323.00
13380	3386	336	246	2	2023-05-30	4	3.00	520.00	580.00	2250.40	232.80
13381	3387	336	551	2	2023-06-05	3	4.00	20.00	20.00	57.60	0.00
13382	3388	336	873	2	2022-02-13	2	3.00	180.00	220.00	426.80	77.60
13383	3389	336	913	2	2023-10-06	6	2.00	40.00	50.00	294.00	58.80
13384	3390	336	978	2	2022-11-30	3	5.00	140.00	150.00	427.50	28.50
13385	3391	452	1434	1	2022-01-24	2	2.00	10.00	10.00	19.60	0.00
13386	3392	551	639	2	2023-06-21	4	5.00	900.00	1090.00	4142.00	722.00
13387	3393	551	1076	2	2023-07-05	2	3.00	200.00	220.00	426.80	38.80
13388	3394	727	1003	5	2023-04-20	1	5.00	10.00	10.00	9.50	0.00
13389	3395	130	1306	7	2022-08-24	6	4.00	40.00	40.00	230.40	0.00
13390	3396	728	1440	2	2022-11-20	4	2.00	390.00	440.00	1724.80	196.00
13391	3397	728	14	2	2023-01-21	1	5.00	150.00	170.00	161.50	19.00
13392	3398	728	491	2	2023-09-14	4	3.00	20.00	30.00	116.40	38.80
13393	3399	155	688	2	2022-11-29	1	5.00	30.00	40.00	38.00	9.50
13394	3400	155	1079	2	2022-01-24	6	2.00	560.00	630.00	3704.40	411.60
13395	3401	155	558	2	2022-06-05	3	2.00	180.00	190.00	558.60	29.40
13396	3402	155	7	2	2023-03-30	3	3.00	10.00	10.00	29.10	0.00
13397	3403	729	741	5	2023-04-17	7	5.00	20.00	20.00	133.00	0.00
13398	3404	141	1536	2	2023-05-28	4	2.00	70.00	70.00	274.40	0.00
13399	3405	27	42	7	2023-11-04	2	4.00	70.00	80.00	153.60	19.20
13400	3406	115	229	2	2022-10-25	2	4.00	230.00	280.00	537.60	96.00
13401	3407	115	229	2	2022-11-06	2	2.00	250.00	280.00	548.80	58.80
13402	3408	115	745	2	2022-02-25	8	3.00	10.00	10.00	77.60	0.00
13403	3409	115	771	2	2023-02-08	4	5.00	20.00	20.00	76.00	0.00
13404	3410	51	499	2	2023-09-28	2	3.00	10.00	10.00	19.40	0.00
13405	3411	60	1491	2	2022-08-03	9	4.00	60.00	70.00	604.80	86.40
13406	3412	60	14	2	2022-10-20	2	5.00	250.00	270.00	513.00	38.00
13407	3413	60	135	2	2022-02-08	4	2.00	10.00	10.00	39.20	0.00
13408	3414	60	1414	2	2023-05-09	2	4.00	80.00	80.00	153.60	0.00
13409	3415	60	1000	2	2022-04-28	2	2.00	50.00	50.00	98.00	0.00
13410	3416	8	1089	7	2022-10-31	1	3.00	0.00	0.00	0.00	0.00
13411	3417	8	926	7	2023-10-01	2	4.00	10.00	10.00	19.20	0.00
13412	3418	730	931	2	2023-04-05	5	3.00	40.00	40.00	194.00	0.00
13413	3419	730	504	2	2023-01-15	2	4.00	10.00	10.00	19.20	0.00
13414	3420	126	663	2	2022-11-13	2	3.00	250.00	270.00	523.80	38.80
13415	3421	27	165	2	2023-07-21	2	4.00	240.00	260.00	499.20	38.40
13416	3422	27	1275	2	2022-10-02	8	4.00	160.00	180.00	1382.40	153.60
13417	3423	27	1203	2	2023-01-02	7	4.00	110.00	130.00	873.60	134.40
13418	3424	27	21	2	2023-07-04	4	5.00	20.00	20.00	76.00	0.00
13419	3425	27	1492	2	2023-05-09	2	4.00	520.00	560.00	1075.20	76.80
13420	3426	731	32	2	2023-08-28	4	3.00	20.00	20.00	77.60	0.00
13421	3427	731	1154	2	2023-10-17	10	4.00	1130.00	1410.00	13536.00	2688.00
13422	3428	732	1537	1	2022-01-23	4	5.00	30.00	30.00	114.00	0.00
13423	3429	732	364	1	2023-05-07	2	4.00	180.00	220.00	422.40	76.80
13424	3430	732	1409	1	2023-12-04	6	2.00	30.00	30.00	176.40	0.00
13425	3431	733	338	5	2023-06-14	3	3.00	30.00	30.00	87.30	0.00
13426	3432	733	1538	5	2023-05-21	2	3.00	110.00	130.00	252.20	38.80
13427	3433	733	653	5	2022-07-08	9	5.00	50.00	60.00	513.00	85.50
13428	3434	734	1340	2	2023-02-11	3	2.00	20.00	20.00	58.80	0.00
13429	3435	734	745	2	2022-02-07	6	3.00	10.00	10.00	58.20	0.00
13430	3436	101	444	5	2023-03-19	2	4.00	20.00	20.00	38.40	0.00
13431	3437	101	527	5	2022-06-21	3	3.00	20.00	20.00	58.20	0.00
13432	3438	442	527	7	2023-08-07	2	4.00	20.00	20.00	38.40	0.00
13433	3439	442	364	7	2022-02-26	2	3.00	230.00	250.00	485.00	38.80
13434	3440	442	1012	7	2022-04-10	6	3.00	50.00	50.00	291.00	0.00
13435	3441	337	62	7	2022-11-13	1	3.00	0.00	0.00	0.00	0.00
13436	3442	104	566	1	2022-01-01	14	2.00	100.00	110.00	1509.20	137.20
13437	3443	213	408	2	2023-01-20	3	4.00	20.00	20.00	57.60	0.00
13438	3444	213	848	2	2022-03-07	7	4.00	2350.00	2500.00	16800.00	1008.00
13439	3445	59	46	2	2022-03-14	2	2.00	70.00	80.00	156.80	19.60
13440	3446	436	1199	2	2022-01-11	5	3.00	20.00	30.00	145.50	48.50
13441	3447	25	259	5	2023-02-21	2	3.00	60.00	70.00	135.80	19.40
13442	3448	735	869	2	2023-08-08	2	4.00	0.00	0.00	0.00	0.00
13443	3449	14	823	2	2023-04-16	2	5.00	20.00	30.00	57.00	19.00
13444	3450	258	1202	2	2022-04-17	5	3.00	50.00	60.00	291.00	48.50
13445	3451	258	329	2	2023-10-26	1	4.00	10.00	10.00	9.60	0.00
13446	3452	258	132	2	2022-10-02	2	3.00	0.00	0.00	0.00	0.00
13447	3453	464	1539	1	2022-08-26	2	4.00	410.00	470.00	902.40	115.20
13448	3454	736	909	1	2022-11-09	4	5.00	50.00	60.00	228.00	38.00
13449	3455	611	1540	2	2022-07-05	3	2.00	10.00	10.00	29.40	0.00
13450	3456	611	1541	2	2022-02-12	2	2.00	20.00	20.00	39.20	0.00
13451	3457	130	1017	5	2022-08-18	3	3.00	60.00	70.00	203.70	29.10
13452	3458	130	1442	5	2023-01-13	3	5.00	20.00	20.00	57.00	0.00
13453	3459	130	1213	5	2023-08-05	2	4.00	0.00	0.00	0.00	0.00
13454	3460	130	1177	5	2022-12-08	2	4.00	450.00	540.00	1036.80	172.80
13455	3461	130	247	5	2022-11-23	2	3.00	40.00	50.00	97.00	19.40
13456	3462	227	349	1	2023-03-15	4	3.00	400.00	490.00	1901.20	349.20
13457	3463	737	895	1	2023-12-07	7	5.00	240.00	290.00	1928.50	332.50
13458	3464	307	70	2	2022-11-01	1	4.00	10.00	10.00	9.60	0.00
13459	3465	164	877	1	2022-07-02	1	2.00	40.00	50.00	49.00	9.80
13460	3466	738	1272	2	2022-06-12	2	2.00	50.00	60.00	117.60	19.60
13461	3467	738	200	2	2023-09-20	2	5.00	340.00	360.00	684.00	38.00
13462	3468	738	335	2	2023-01-23	9	5.00	220.00	280.00	2394.00	513.00
13463	3469	159	1381	2	2022-11-01	6	3.00	110.00	130.00	756.60	116.40
13464	3470	312	682	2	2022-01-03	3	4.00	50.00	50.00	144.00	0.00
13465	3471	37	905	2	2022-05-30	2	3.00	20.00	20.00	38.80	0.00
13466	3472	57	988	2	2023-12-30	2	4.00	10.00	10.00	19.20	0.00
13467	3473	57	568	2	2022-04-08	2	4.00	20.00	20.00	38.40	0.00
13468	3474	739	324	2	2023-04-07	1	2.00	140.00	180.00	176.40	39.20
13469	3475	739	1136	2	2023-01-26	2	5.00	90.00	100.00	190.00	19.00
13470	3476	714	61	5	2023-09-24	5	4.00	30.00	30.00	144.00	0.00
13471	3477	714	1000	5	2023-03-16	5	4.00	140.00	150.00	720.00	48.00
13472	3478	740	1387	2	2023-10-11	9	4.00	70.00	90.00	777.60	172.80
13473	3479	111	19	2	2022-02-13	2	2.00	10.00	10.00	19.60	0.00
13474	3480	111	1542	2	2023-10-14	7	5.00	40.00	50.00	332.50	66.50
13475	3481	111	1235	2	2022-11-29	6	5.00	1350.00	1420.00	8094.00	399.00
13476	3482	741	1074	5	2022-08-26	2	2.00	10.00	10.00	19.60	0.00
13477	3483	280	1134	5	2022-09-28	5	4.00	540.00	580.00	2784.00	192.00
13478	3484	280	1028	5	2022-02-27	4	2.00	30.00	30.00	117.60	0.00
13479	3485	280	1383	5	2023-04-30	3	4.00	1000.00	1200.00	3456.00	576.00
13480	3486	417	923	2	2022-08-05	4	4.00	10.00	10.00	38.40	0.00
13481	3487	742	1410	7	2023-12-09	1	4.00	30.00	40.00	38.40	9.60
13482	3488	604	197	2	2023-10-05	2	5.00	120.00	150.00	285.00	57.00
13483	3489	743	285	2	2023-06-13	2	2.00	360.00	410.00	803.60	98.00
13484	3490	743	1210	2	2023-02-25	6	4.00	340.00	380.00	2188.80	230.40
13485	3491	743	457	2	2023-05-05	5	4.00	60.00	70.00	336.00	48.00
13486	3492	743	246	2	2022-06-05	3	2.00	410.00	440.00	1293.60	88.20
13487	3493	743	162	2	2023-10-24	2	2.00	10.00	10.00	19.60	0.00
13488	3494	744	1543	2	2022-07-03	4	5.00	60.00	70.00	266.00	38.00
13489	3495	744	1544	2	2022-09-23	5	2.00	590.00	660.00	3234.00	343.00
13490	3496	744	663	2	2023-06-22	4	5.00	530.00	600.00	2280.00	266.00
13491	3497	316	856	2	2022-08-22	2	5.00	430.00	510.00	969.00	152.00
13492	3498	316	724	2	2023-06-15	6	4.00	390.00	490.00	2822.40	576.00
13493	3499	316	316	2	2022-03-06	5	5.00	20.00	20.00	95.00	0.00
13494	3500	741	1510	2	2022-01-21	3	3.00	170.00	210.00	611.10	116.40
13495	3501	741	543	2	2023-10-03	3	4.00	60.00	60.00	172.80	0.00
13496	3502	741	131	2	2023-11-12	9	4.00	30.00	30.00	259.20	0.00
13497	3503	132	512	7	2022-09-23	2	3.00	10.00	10.00	19.40	0.00
13498	3504	132	686	7	2023-11-30	3	4.00	90.00	100.00	288.00	28.80
13499	3505	44	907	1	2022-02-12	4	4.00	800.00	900.00	3456.00	384.00
13500	3506	444	1371	2	2023-06-24	2	4.00	180.00	200.00	384.00	38.40
13501	3507	444	16	2	2022-08-04	4	5.00	0.00	0.00	0.00	0.00
13502	3508	444	1545	2	2023-04-26	4	3.00	180.00	190.00	737.20	38.80
13503	3509	444	779	2	2022-05-22	3	3.00	20.00	20.00	58.20	0.00
13504	3510	444	58	2	2023-08-13	2	5.00	10.00	10.00	19.00	0.00
13505	3511	444	1492	2	2022-03-24	2	3.00	390.00	420.00	814.80	58.20
13506	3512	444	73	2	2022-03-22	7	2.00	440.00	510.00	3498.60	480.20
13507	3513	199	1546	5	2023-04-11	9	3.00	760.00	830.00	7245.90	611.10
13508	3514	199	957	5	2023-11-16	3	3.00	20.00	20.00	58.20	0.00
13509	3515	199	131	5	2022-08-23	3	3.00	10.00	10.00	29.10	0.00
13510	3516	159	177	2	2022-09-30	3	2.00	60.00	70.00	205.80	29.40
13511	3517	597	1013	5	2022-04-15	9	4.00	30.00	30.00	259.20	0.00
13512	3518	597	1481	5	2023-02-04	2	2.00	30.00	40.00	78.40	19.60
13513	3519	597	160	5	2023-08-22	4	4.00	540.00	570.00	2188.80	115.20
13514	3520	224	1338	5	2022-08-07	7	4.00	650.00	800.00	5376.00	1008.00
13515	3521	745	386	2	2023-09-13	2	2.00	10.00	10.00	19.60	0.00
13516	3522	257	372	1	2022-11-23	7	5.00	40.00	40.00	266.00	0.00
13517	3523	257	234	1	2023-01-20	3	2.00	360.00	400.00	1176.00	117.60
13518	3524	248	175	2	2022-02-27	8	5.00	100.00	120.00	912.00	152.00
13519	3525	452	1547	2	2022-09-09	6	2.00	590.00	660.00	3880.80	411.60
13520	3526	526	652	1	2022-10-10	3	4.00	520.00	600.00	1728.00	230.40
13521	3527	526	781	1	2022-01-06	3	4.00	40.00	40.00	115.20	0.00
13522	3528	526	1548	1	2022-01-05	8	4.00	50.00	50.00	384.00	0.00
13523	3529	178	1379	2	2022-08-28	4	3.00	30.00	40.00	155.20	38.80
13524	3530	652	478	2	2023-01-02	3	5.00	80.00	90.00	256.50	28.50
13525	3531	746	19	2	2022-03-22	5	2.00	20.00	20.00	98.00	0.00
13526	3532	49	134	7	2023-03-22	5	4.00	50.00	50.00	240.00	0.00
13527	3533	14	1549	2	2022-11-16	4	4.00	260.00	290.00	1113.60	115.20
13528	3534	14	837	2	2023-02-14	4	3.00	10.00	10.00	38.80	0.00
13529	3535	14	1540	2	2022-04-24	5	5.00	10.00	10.00	47.50	0.00
13530	3536	14	196	2	2023-05-17	2	2.00	10.00	10.00	19.60	0.00
13531	3537	104	1034	1	2022-11-23	3	3.00	40.00	40.00	116.40	0.00
13532	3538	571	18	7	2023-10-22	3	5.00	70.00	80.00	228.00	28.50
13533	3539	571	1043	7	2022-11-24	3	5.00	10.00	10.00	28.50	0.00
13534	3540	571	1009	7	2023-05-29	5	2.00	20.00	20.00	98.00	0.00
13535	3541	571	1077	7	2023-10-12	7	3.00	40.00	50.00	339.50	67.90
13536	3542	51	1349	5	2022-06-24	3	5.00	10.00	10.00	28.50	0.00
13537	3543	51	475	5	2023-12-27	2	3.00	90.00	100.00	194.00	19.40
13538	3544	51	1217	5	2022-02-12	1	3.00	0.00	0.00	0.00	0.00
13539	3545	538	1057	1	2023-02-27	8	3.00	30.00	30.00	232.80	0.00
13540	3546	538	1550	1	2023-06-02	8	5.00	20.00	30.00	228.00	76.00
13541	3547	747	465	5	2022-01-27	7	2.00	100.00	110.00	754.60	68.60
13542	3548	747	355	5	2022-03-06	2	3.00	30.00	40.00	77.60	19.40
13543	3549	747	1273	5	2023-04-12	1	3.00	30.00	30.00	29.10	0.00
13544	3550	747	1551	5	2022-04-17	8	5.00	30.00	30.00	228.00	0.00
13545	3551	229	1238	1	2023-10-23	3	4.00	40.00	50.00	144.00	28.80
13546	3552	229	229	1	2023-11-10	6	4.00	680.00	840.00	4838.40	921.60
13547	3553	229	144	1	2023-01-23	8	2.00	750.00	810.00	6350.40	470.40
13548	3554	86	445	1	2023-03-06	1	4.00	10.00	10.00	9.60	0.00
13549	3555	234	547	1	2022-11-07	2	5.00	310.00	330.00	627.00	38.00
13550	3556	234	1552	1	2023-07-25	6	4.00	500.00	600.00	3456.00	576.00
13551	3557	204	833	2	2022-08-31	7	5.00	40.00	50.00	332.50	66.50
13552	3558	204	859	2	2023-08-08	2	2.00	10.00	10.00	19.60	0.00
13553	3559	37	1283	2	2022-05-14	4	3.00	20.00	20.00	77.60	0.00
13554	3560	37	990	2	2023-12-06	4	3.00	370.00	440.00	1707.20	271.60
13555	3561	87	680	1	2022-10-21	4	4.00	10.00	10.00	38.40	0.00
13556	3562	87	823	1	2022-11-24	5	2.00	30.00	30.00	147.00	0.00
13557	3563	87	25	1	2023-05-23	2	3.00	0.00	0.00	0.00	0.00
13558	3564	87	1553	1	2023-03-29	4	5.00	10.00	10.00	38.00	0.00
13559	3565	14	1554	5	2023-12-22	2	2.00	10.00	10.00	19.60	0.00
13560	3566	14	1080	5	2022-09-07	2	2.00	0.00	0.00	0.00	0.00
13561	3567	748	116	2	2022-09-05	3	3.00	1490.00	1580.00	4597.80	261.90
13562	3568	749	1442	1	2023-02-12	4	4.00	20.00	20.00	76.80	0.00
13563	3569	67	247	7	2022-03-19	2	4.00	60.00	60.00	115.20	0.00
13564	3570	67	207	7	2023-06-11	6	4.00	2280.00	2400.00	13824.00	691.20
13565	3571	67	696	7	2022-02-07	4	2.00	1470.00	1690.00	6624.80	862.40
13566	3572	67	313	7	2022-06-23	1	4.00	10.00	10.00	9.60	0.00
13567	3573	528	645	2	2022-04-28	1	2.00	10.00	10.00	9.80	0.00
13568	3574	365	242	2	2022-10-08	2	3.00	10.00	10.00	19.40	0.00
13569	3575	365	1555	2	2022-02-16	10	3.00	90.00	100.00	970.00	97.00
13570	3576	750	671	2	2023-07-25	3	3.00	10.00	10.00	29.10	0.00
13571	3577	751	571	2	2023-11-16	1	4.00	0.00	0.00	0.00	0.00
13572	3578	751	205	2	2022-05-03	1	3.00	0.00	0.00	0.00	0.00
13573	3579	159	1556	2	2022-09-27	1	3.00	10.00	10.00	9.70	0.00
13574	3580	159	1403	2	2022-07-19	5	4.00	70.00	70.00	336.00	0.00
13575	3581	159	336	2	2022-05-19	8	3.00	2020.00	2430.00	18856.80	3181.60
13576	3582	752	922	2	2022-05-07	1	2.00	90.00	100.00	98.00	9.80
13577	3583	753	131	2	2022-08-10	2	5.00	0.00	0.00	0.00	0.00
13578	3584	753	1383	2	2022-06-26	2	2.00	660.00	800.00	1568.00	274.40
13579	3585	753	993	2	2022-05-14	2	2.00	170.00	190.00	372.40	39.20
13580	3586	753	710	2	2023-08-26	1	3.00	0.00	0.00	0.00	0.00
13581	3587	60	80	2	2022-06-30	2	4.00	10.00	10.00	19.20	0.00
13582	3588	732	1149	2	2022-03-12	3	5.00	1090.00	1170.00	3334.50	228.00
13583	3589	439	466	5	2022-12-08	2	2.00	1450.00	1670.00	3273.20	431.20
13584	3590	747	615	2	2022-03-18	1	3.00	0.00	0.00	0.00	0.00
13585	3591	747	773	2	2022-09-27	12	4.00	1220.00	1440.00	16588.80	2534.40
13586	3592	35	504	1	2023-02-25	1	4.00	0.00	0.00	0.00	0.00
13587	3593	104	1450	1	2022-07-03	3	2.00	400.00	470.00	1381.80	205.80
13588	3594	690	445	2	2022-09-13	3	2.00	20.00	20.00	58.80	0.00
13589	3595	690	1191	2	2022-02-02	5	3.00	40.00	40.00	194.00	0.00
13590	3596	125	347	2	2022-10-07	1	5.00	0.00	0.00	0.00	0.00
13591	3597	12	740	1	2022-12-29	3	4.00	20.00	20.00	57.60	0.00
13592	3598	12	1557	1	2022-08-17	6	3.00	50.00	60.00	349.20	58.20
13593	3599	12	1028	1	2022-11-09	3	3.00	20.00	20.00	58.20	0.00
13594	3600	12	945	1	2022-11-07	1	3.00	130.00	140.00	135.80	9.70
13595	3601	88	877	2	2023-04-01	9	5.00	350.00	430.00	3676.50	684.00
13596	3602	130	566	2	2023-04-08	2	3.00	10.00	10.00	19.40	0.00
13597	3603	130	500	2	2023-07-10	5	4.00	560.00	660.00	3168.00	480.00
13598	3604	288	448	2	2023-12-25	5	4.00	240.00	280.00	1344.00	192.00
13599	3605	288	981	2	2023-02-19	2	4.00	30.00	30.00	57.60	0.00
13600	3606	288	936	2	2022-10-27	4	2.00	80.00	90.00	352.80	39.20
13601	3607	104	707	1	2022-09-27	3	4.00	30.00	30.00	86.40	0.00
13602	3608	134	921	1	2023-04-04	3	5.00	130.00	140.00	399.00	28.50
13603	3609	473	746	2	2023-03-04	3	2.00	10.00	10.00	29.40	0.00
13604	3610	473	1012	2	2023-11-21	3	4.00	30.00	30.00	86.40	0.00
13605	3611	473	1440	2	2023-10-09	2	2.00	150.00	180.00	352.80	58.80
13606	3612	211	1313	1	2023-06-02	2	4.00	60.00	60.00	115.20	0.00
13607	3613	344	1537	2	2023-07-22	2	5.00	20.00	20.00	38.00	0.00
13608	3614	344	44	2	2023-12-29	2	3.00	40.00	40.00	77.60	0.00
13609	3615	162	976	5	2023-05-27	6	2.00	580.00	720.00	4233.60	823.20
13610	3616	162	1069	5	2023-10-14	4	4.00	20.00	30.00	115.20	38.40
13611	3617	210	49	2	2023-05-04	5	5.00	10.00	10.00	47.50	0.00
13612	3618	27	570	2	2023-04-25	2	5.00	400.00	490.00	931.00	171.00
13613	3619	27	1092	2	2022-07-02	1	5.00	10.00	10.00	9.50	0.00
13614	3620	27	124	2	2022-07-05	5	4.00	190.00	220.00	1056.00	144.00
13615	3621	754	1386	2	2022-07-14	3	4.00	40.00	40.00	115.20	0.00
13616	3622	754	1558	2	2023-02-14	8	3.00	50.00	60.00	465.60	77.60
13617	3623	736	1147	2	2022-05-06	5	4.00	120.00	140.00	672.00	96.00
13618	3624	736	176	2	2022-07-22	2	4.00	10.00	10.00	19.20	0.00
13619	3625	427	475	1	2022-07-03	12	5.00	560.00	680.00	7752.00	1368.00
13620	3626	427	1040	1	2023-06-01	2	4.00	0.00	0.00	0.00	0.00
13621	3627	427	312	1	2022-11-12	1	3.00	10.00	10.00	9.70	0.00
13622	3628	427	478	1	2022-07-30	1	2.00	40.00	40.00	39.20	0.00
13623	3629	6	1499	2	2022-01-15	7	3.00	1730.00	2060.00	13987.40	2240.70
13624	3630	57	1113	2	2022-07-11	3	3.00	50.00	50.00	145.50	0.00
13625	3631	57	514	2	2023-08-29	7	3.00	170.00	210.00	1425.90	271.60
13626	3632	351	1157	1	2022-05-01	2	3.00	60.00	70.00	135.80	19.40
13627	3633	351	622	1	2022-04-12	8	4.00	680.00	760.00	5836.80	614.40
13628	3634	318	746	2	2022-05-20	4	2.00	10.00	10.00	39.20	0.00
13629	3635	318	434	2	2023-08-23	7	5.00	30.00	40.00	266.00	66.50
13630	3636	318	1559	2	2022-08-29	2	2.00	80.00	90.00	176.40	19.60
13631	3637	318	1287	2	2022-02-07	3	4.00	20.00	20.00	57.60	0.00
13632	3638	318	550	2	2022-06-22	4	5.00	310.00	330.00	1254.00	76.00
13633	3639	318	1093	2	2022-08-29	7	3.00	130.00	150.00	1018.50	135.80
13634	3640	318	875	2	2023-08-21	1	5.00	0.00	0.00	0.00	0.00
13635	3641	318	1366	2	2022-08-18	7	4.00	140.00	180.00	1209.60	268.80
13636	3642	318	1198	2	2023-06-26	7	3.00	60.00	70.00	475.30	67.90
13637	3643	204	570	1	2022-04-26	2	2.00	470.00	490.00	960.40	39.20
13638	3644	204	1560	1	2023-12-20	2	2.00	50.00	50.00	98.00	0.00
13639	3645	204	1561	1	2022-04-23	1	5.00	0.00	0.00	0.00	0.00
13640	3646	204	1562	1	2023-01-20	5	5.00	150.00	160.00	760.00	47.50
13641	3647	179	728	1	2022-09-03	1	2.00	10.00	10.00	9.80	0.00
13642	3648	179	1563	1	2022-02-05	4	3.00	20.00	20.00	77.60	0.00
13643	3649	33	697	2	2023-03-11	2	2.00	0.00	0.00	0.00	0.00
13644	3650	33	272	2	2023-01-23	6	2.00	50.00	60.00	352.80	58.80
13645	3651	641	1564	1	2022-05-17	6	3.00	80.00	100.00	582.00	116.40
13646	3652	641	925	1	2022-12-03	5	2.00	30.00	30.00	147.00	0.00
13647	3653	641	675	1	2022-07-01	4	3.00	30.00	30.00	116.40	0.00
13648	3654	641	812	1	2022-04-10	3	5.00	10.00	10.00	28.50	0.00
13649	3655	755	555	2	2022-06-21	9	5.00	530.00	640.00	5472.00	940.50
13650	3656	251	1044	2	2022-02-08	2	3.00	90.00	110.00	213.40	38.80
13651	3657	450	1565	2	2022-06-10	1	4.00	10.00	10.00	9.60	0.00
13652	3658	756	136	2	2023-04-16	3	5.00	10.00	10.00	28.50	0.00
13653	3659	756	77	2	2023-06-05	4	5.00	20.00	30.00	114.00	38.00
13654	3660	756	1566	2	2023-04-30	3	5.00	10.00	10.00	28.50	0.00
13655	3661	757	1567	2	2023-08-08	5	2.00	30.00	30.00	147.00	0.00
13656	3662	149	1552	1	2022-08-11	3	5.00	300.00	380.00	1083.00	228.00
13657	3663	758	1114	2	2023-09-24	10	5.00	210.00	260.00	2470.00	475.00
13658	3664	758	315	2	2023-05-12	2	4.00	20.00	20.00	38.40	0.00
13659	3665	208	640	2	2022-10-29	7	2.00	30.00	30.00	205.80	0.00
13660	3666	208	637	2	2022-05-26	4	5.00	10.00	10.00	38.00	0.00
13661	3667	208	1514	2	2022-01-11	3	2.00	50.00	50.00	147.00	0.00
13662	3668	208	1568	2	2022-12-04	5	2.00	10.00	10.00	49.00	0.00
13663	3669	208	1422	2	2023-10-31	10	4.00	100.00	100.00	960.00	0.00
13664	3670	208	1569	2	2022-02-27	5	3.00	10.00	10.00	48.50	0.00
13665	3671	208	56	2	2022-05-23	2	4.00	10.00	10.00	19.20	0.00
13666	3672	208	1570	2	2023-01-25	3	2.00	30.00	40.00	117.60	29.40
13667	3673	759	1476	2	2023-04-22	1	4.00	10.00	10.00	9.60	0.00
13668	3674	759	1081	2	2022-10-02	6	4.00	110.00	120.00	691.20	57.60
13669	3675	130	1210	2	2023-12-30	2	3.00	110.00	130.00	252.20	38.80
13670	3676	130	369	2	2023-05-26	3	2.00	50.00	50.00	147.00	0.00
13671	3677	248	643	2	2022-11-06	2	5.00	30.00	40.00	76.00	19.00
13672	3678	580	1433	2	2022-09-10	4	5.00	20.00	20.00	76.00	0.00
13673	3679	580	1521	2	2023-07-05	3	2.00	390.00	460.00	1352.40	205.80
13674	3680	580	270	2	2023-08-09	2	4.00	150.00	180.00	345.60	57.60
13675	3681	580	1571	2	2022-09-21	3	4.00	10.00	10.00	28.80	0.00
13676	3682	580	913	2	2022-09-26	3	2.00	70.00	80.00	235.20	29.40
13677	3683	580	1572	2	2022-10-03	4	2.00	60.00	80.00	313.60	78.40
13678	3684	580	823	2	2022-09-25	9	3.00	140.00	150.00	1309.50	87.30
13679	3685	580	25	2	2022-05-10	6	4.00	40.00	40.00	230.40	0.00
13680	3686	580	769	2	2022-07-06	7	5.00	90.00	100.00	665.00	66.50
13681	3687	338	347	2	2022-12-06	3	4.00	10.00	10.00	28.80	0.00
13682	3688	760	308	2	2022-09-20	2	2.00	0.00	0.00	0.00	0.00
13683	3689	193	219	1	2023-02-27	6	4.00	20.00	30.00	172.80	57.60
13684	3690	193	599	1	2023-09-20	5	3.00	30.00	40.00	194.00	48.50
13685	3691	358	1314	1	2022-09-13	2	3.00	50.00	60.00	116.40	19.40
13686	3692	358	1573	1	2023-03-30	1	2.00	420.00	440.00	431.20	19.60
13687	3693	358	723	1	2023-02-05	5	5.00	80.00	90.00	427.50	47.50
13688	3694	358	1574	1	2023-02-15	4	3.00	20.00	20.00	77.60	0.00
13689	3695	280	1198	2	2022-11-25	7	3.00	190.00	230.00	1561.70	271.60
13690	3696	280	1476	2	2022-05-26	6	4.00	60.00	70.00	403.20	57.60
13691	3697	280	337	2	2022-09-06	3	2.00	30.00	40.00	117.60	29.40
13692	3698	246	1461	1	2023-09-11	2	5.00	120.00	140.00	266.00	38.00
13693	3699	709	1575	2	2023-08-03	5	2.00	70.00	80.00	392.00	49.00
13694	3700	761	375	1	2022-11-16	4	2.00	130.00	160.00	627.20	117.60
13695	3701	263	768	2	2022-03-28	1	3.00	30.00	40.00	38.80	9.70
13696	3702	327	1463	1	2022-02-21	2	4.00	20.00	20.00	38.40	0.00
13697	3703	36	1561	2	2023-01-09	6	2.00	20.00	20.00	117.60	0.00
13698	3704	36	1207	2	2023-07-26	3	5.00	20.00	20.00	57.00	0.00
13699	3705	36	852	2	2023-11-09	3	2.00	820.00	900.00	2646.00	235.20
13700	3706	36	1542	2	2023-05-23	5	5.00	30.00	30.00	142.50	0.00
13701	3707	89	1069	2	2022-03-02	3	3.00	20.00	20.00	58.20	0.00
13702	3708	528	741	2	2022-12-30	2	2.00	10.00	10.00	19.60	0.00
13703	3709	528	1052	2	2022-05-04	3	5.00	30.00	30.00	85.50	0.00
13704	3710	528	1426	2	2023-05-16	7	3.00	10.00	10.00	67.90	0.00
13705	3711	156	215	5	2022-01-20	3	4.00	480.00	510.00	1468.80	86.40
13706	3712	156	1128	5	2023-12-24	5	2.00	170.00	200.00	980.00	147.00
13707	3713	6	1576	5	2022-01-02	1	4.00	10.00	10.00	9.60	0.00
13708	3714	6	798	5	2022-09-09	3	3.00	130.00	160.00	465.60	87.30
13709	3715	315	601	1	2022-05-29	2	2.00	40.00	50.00	98.00	19.60
13710	3716	315	292	1	2023-01-05	5	4.00	540.00	600.00	2880.00	288.00
13711	3717	413	1218	2	2023-10-06	5	3.00	20.00	20.00	97.00	0.00
13712	3718	375	1577	2	2023-09-23	2	3.00	10.00	10.00	19.40	0.00
13713	3719	375	1136	2	2023-04-12	5	5.00	200.00	250.00	1187.50	237.50
13714	3720	305	159	2	2023-01-26	5	3.00	20.00	30.00	145.50	48.50
13715	3721	526	284	2	2022-06-18	4	4.00	20.00	20.00	76.80	0.00
13716	3722	526	9	2	2023-04-01	2	3.00	20.00	20.00	38.80	0.00
13717	3723	35	312	2	2022-05-01	8	5.00	40.00	40.00	304.00	0.00
13718	3724	762	1499	2	2023-03-19	5	3.00	470.00	550.00	2667.50	388.00
13719	3725	194	426	5	2022-03-23	3	3.00	10.00	10.00	29.10	0.00
13720	3726	358	1268	2	2022-09-23	2	2.00	20.00	20.00	39.20	0.00
13721	3727	436	735	2	2022-10-26	2	4.00	320.00	360.00	691.20	76.80
13722	3728	436	312	2	2022-05-29	2	2.00	10.00	10.00	19.60	0.00
13723	3729	436	1509	2	2022-10-28	3	4.00	10.00	10.00	28.80	0.00
13724	3730	763	1019	2	2023-06-04	2	5.00	30.00	40.00	76.00	19.00
13725	3731	763	73	2	2022-05-12	7	5.00	570.00	640.00	4256.00	465.50
13726	3732	763	1578	2	2023-04-26	1	5.00	450.00	500.00	475.00	47.50
13727	3733	763	1150	2	2022-12-20	7	5.00	1180.00	1260.00	8379.00	532.00
13728	3734	763	1527	2	2022-04-23	4	5.00	60.00	70.00	266.00	38.00
13729	3735	383	146	1	2022-11-21	1	3.00	30.00	30.00	29.10	0.00
13730	3736	383	929	1	2022-01-23	3	3.00	60.00	70.00	203.70	29.10
13731	3737	436	1418	7	2022-05-27	2	2.00	120.00	130.00	254.80	19.60
13732	3738	436	1527	7	2023-07-11	2	2.00	30.00	30.00	58.80	0.00
13733	3739	32	48	2	2022-11-25	1	2.00	10.00	10.00	9.80	0.00
13734	3740	32	1017	2	2023-04-07	2	3.00	50.00	60.00	116.40	19.40
13735	3741	32	15	2	2022-05-05	1	3.00	50.00	60.00	58.20	9.70
13736	3742	383	319	2	2023-10-06	4	4.00	20.00	20.00	76.80	0.00
13737	3743	383	1284	2	2022-09-27	9	3.00	50.00	60.00	523.80	87.30
13738	3744	383	341	2	2022-05-17	3	2.00	40.00	50.00	147.00	29.40
13739	3745	764	1433	7	2022-06-04	3	2.00	10.00	10.00	29.40	0.00
13740	3746	375	393	1	2022-12-03	5	4.00	110.00	120.00	576.00	48.00
13741	3747	375	1266	1	2023-02-08	3	2.00	350.00	370.00	1087.80	58.80
13742	3748	112	1072	1	2023-12-17	2	2.00	160.00	200.00	392.00	78.40
13743	3749	112	1430	1	2022-09-07	4	5.00	290.00	320.00	1216.00	114.00
13744	3750	112	1573	1	2023-12-03	2	3.00	800.00	880.00	1707.20	155.20
13745	3751	112	676	1	2023-03-06	5	5.00	30.00	30.00	142.50	0.00
13746	3752	112	371	1	2023-02-14	3	4.00	190.00	230.00	662.40	115.20
13747	3753	112	969	1	2023-04-23	3	2.00	100.00	120.00	352.80	58.80
13748	3754	112	116	1	2023-03-18	2	3.00	700.00	840.00	1629.60	271.60
13749	3755	112	1044	1	2022-03-17	5	4.00	290.00	350.00	1680.00	288.00
13750	3756	765	828	5	2023-03-25	7	3.00	30.00	40.00	271.60	67.90
13751	3757	765	1579	5	2022-10-16	5	4.00	500.00	560.00	2688.00	288.00
13752	3758	76	1501	2	2022-10-15	7	5.00	90.00	110.00	731.50	133.00
13753	3759	19	242	2	2022-11-26	2	3.00	10.00	10.00	19.40	0.00
13754	3760	19	1567	2	2022-10-05	2	5.00	20.00	20.00	38.00	0.00
13755	3761	19	1123	2	2023-03-11	2	4.00	20.00	20.00	38.40	0.00
13756	3762	422	162	2	2023-12-01	5	3.00	80.00	90.00	436.50	48.50
13757	3763	766	431	1	2022-12-28	2	3.00	190.00	240.00	465.60	97.00
13758	3764	766	799	1	2023-07-07	3	2.00	10.00	10.00	29.40	0.00
13759	3765	118	99	2	2023-04-08	3	5.00	0.00	0.00	0.00	0.00
13760	3766	106	1170	2	2023-07-22	2	4.00	90.00	100.00	192.00	19.20
13761	3767	106	60	2	2022-10-30	1	4.00	0.00	0.00	0.00	0.00
13762	3768	522	174	1	2023-03-05	5	5.00	100.00	120.00	570.00	95.00
13763	3769	244	1154	1	2023-05-14	9	2.00	880.00	1010.00	8908.20	1146.60
13764	3770	244	311	1	2022-03-10	2	2.00	0.00	0.00	0.00	0.00
13765	3771	37	490	2	2023-01-02	6	2.00	1660.00	2000.00	11760.00	1999.20
13766	3772	59	233	2	2023-02-17	2	5.00	80.00	80.00	152.00	0.00
13767	3773	40	918	1	2022-06-24	3	5.00	50.00	60.00	171.00	28.50
13768	3774	150	1580	1	2022-07-11	3	2.00	10.00	10.00	29.40	0.00
13769	3775	150	266	1	2022-06-29	3	2.00	350.00	380.00	1117.20	88.20
13770	3776	150	816	1	2023-11-10	2	4.00	10.00	10.00	19.20	0.00
13771	3777	150	1581	1	2022-12-25	7	3.00	300.00	340.00	2308.60	271.60
13772	3778	767	1320	2	2022-01-01	6	2.00	620.00	670.00	3939.60	294.00
13773	3779	768	994	1	2023-12-18	3	3.00	60.00	70.00	203.70	29.10
13774	3780	134	424	2	2022-02-16	2	5.00	30.00	40.00	76.00	19.00
13775	3781	769	1076	2	2022-07-09	2	2.00	220.00	270.00	529.20	98.00
13776	3782	210	1335	1	2023-04-15	3	5.00	230.00	270.00	769.50	114.00
13777	3783	33	1102	1	2022-03-25	3	2.00	10.00	10.00	29.40	0.00
13778	3784	33	907	1	2022-06-19	4	3.00	670.00	720.00	2793.60	194.00
13779	3785	604	1114	2	2022-09-28	2	4.00	30.00	40.00	76.80	19.20
13780	3786	115	1582	2	2023-04-22	2	3.00	0.00	0.00	0.00	0.00
13781	3787	156	1450	2	2022-05-27	7	2.00	990.00	1090.00	7477.40	686.00
13782	3788	188	283	2	2023-05-14	1	4.00	0.00	0.00	0.00	0.00
13783	3789	188	1063	2	2022-11-30	3	5.00	50.00	60.00	171.00	28.50
13784	3790	413	196	2	2023-08-19	5	3.00	30.00	30.00	145.50	0.00
13785	3791	56	444	2	2022-01-01	6	4.00	150.00	180.00	1036.80	172.80
13786	3792	770	186	5	2022-05-16	3	4.00	0.00	0.00	0.00	0.00
13787	3793	770	1217	5	2022-08-08	6	3.00	20.00	20.00	116.40	0.00
13788	3794	104	1069	2	2022-07-18	3	5.00	30.00	30.00	85.50	0.00
13789	3795	103	1278	2	2023-08-02	1	5.00	60.00	60.00	57.00	0.00
13790	3796	103	1583	2	2023-12-26	3	4.00	270.00	330.00	950.40	172.80
13791	3797	103	1584	2	2023-01-15	4	4.00	40.00	40.00	153.60	0.00
13792	3798	484	657	5	2022-04-19	3	2.00	230.00	250.00	735.00	58.80
13793	3799	771	310	5	2023-05-31	3	4.00	420.00	520.00	1497.60	288.00
13794	3800	771	1195	5	2022-02-28	5	5.00	1130.00	1360.00	6460.00	1092.50
13795	3801	312	1585	2	2022-05-24	1	5.00	90.00	100.00	95.00	9.50
13796	3802	312	722	2	2023-07-16	1	2.00	20.00	20.00	19.60	0.00
13797	3803	312	1414	2	2022-04-28	3	5.00	80.00	90.00	256.50	28.50
13798	3804	312	1445	2	2022-05-09	2	3.00	10.00	10.00	19.40	0.00
13799	3805	312	467	2	2022-11-24	4	3.00	40.00	40.00	155.20	0.00
13800	3806	312	127	2	2022-12-02	1	4.00	40.00	40.00	38.40	0.00
13801	3807	756	455	2	2022-03-30	5	4.00	10.00	10.00	48.00	0.00
13802	3808	756	45	2	2023-09-13	2	5.00	10.00	10.00	19.00	0.00
13803	3809	756	1473	2	2022-05-26	3	5.00	0.00	0.00	0.00	0.00
13804	3810	756	1586	2	2022-01-20	5	3.00	450.00	520.00	2522.00	339.50
13805	3811	756	1067	2	2023-05-04	1	2.00	80.00	100.00	98.00	19.60
13806	3812	756	213	2	2023-07-30	3	5.00	140.00	150.00	427.50	28.50
13807	3813	363	1587	7	2023-03-29	2	5.00	20.00	30.00	57.00	19.00
13808	3814	230	618	2	2023-05-15	6	2.00	20.00	20.00	117.60	0.00
13809	3815	164	1165	7	2022-03-24	5	4.00	690.00	820.00	3936.00	624.00
13810	3816	164	113	7	2022-11-18	2	2.00	20.00	20.00	39.20	0.00
13811	3817	741	1383	2	2022-03-16	2	2.00	690.00	800.00	1568.00	215.60
13812	3818	741	1432	2	2023-01-31	3	3.00	50.00	60.00	174.60	29.10
13813	3819	741	532	2	2022-11-29	7	4.00	860.00	1060.00	7123.20	1344.00
13814	3820	104	881	2	2023-01-04	3	3.00	10.00	10.00	29.10	0.00
13815	3821	104	1220	2	2023-06-06	3	2.00	280.00	310.00	911.40	88.20
13816	3822	104	1588	2	2023-03-30	2	4.00	20.00	20.00	38.40	0.00
13817	3823	104	1470	2	2023-03-24	6	3.00	20.00	20.00	116.40	0.00
13818	3824	383	547	2	2022-07-25	6	3.00	810.00	990.00	5761.80	1047.60
13819	3825	383	1573	2	2022-05-21	2	3.00	840.00	880.00	1707.20	77.60
13820	3826	383	752	2	2023-11-21	9	4.00	10.00	10.00	86.40	0.00
13821	3827	211	231	2	2023-06-03	10	5.00	100.00	110.00	1045.00	95.00
13822	3828	189	285	2	2023-07-16	5	4.00	1310.00	1460.00	7008.00	720.00
13823	3829	189	1392	2	2023-07-26	1	4.00	30.00	30.00	28.80	0.00
13824	3830	189	468	2	2023-02-10	2	3.00	390.00	480.00	931.20	174.60
13825	3831	189	536	2	2023-07-01	2	5.00	70.00	90.00	171.00	38.00
13826	3832	23	217	2	2022-06-30	3	3.00	70.00	80.00	232.80	29.10
13827	3833	23	1231	2	2023-11-21	2	4.00	20.00	20.00	38.40	0.00
13828	3834	57	755	7	2023-05-17	5	5.00	900.00	1050.00	4987.50	712.50
13829	3835	57	1004	7	2022-04-30	3	5.00	500.00	610.00	1738.50	313.50
13830	3836	757	1085	2	2022-07-07	2	5.00	0.00	0.00	0.00	0.00
13831	3837	757	1589	2	2023-04-04	3	2.00	20.00	20.00	58.80	0.00
13832	3838	415	433	2	2023-11-20	2	2.00	860.00	910.00	1783.60	98.00
13833	3839	415	300	2	2023-08-09	3	4.00	630.00	670.00	1929.60	115.20
13834	3840	415	944	2	2023-01-27	9	3.00	120.00	130.00	1134.90	87.30
13835	3841	415	1590	2	2022-05-30	3	5.00	140.00	170.00	484.50	85.50
13836	3842	52	475	2	2023-08-12	3	2.00	160.00	170.00	499.80	29.40
13837	3843	19	308	5	2023-12-14	2	3.00	10.00	10.00	19.40	0.00
13838	3844	19	1591	5	2023-07-28	2	2.00	10.00	10.00	19.60	0.00
13839	3845	19	263	5	2023-02-28	2	4.00	460.00	480.00	921.60	38.40
13840	3846	19	431	5	2023-05-28	6	4.00	530.00	620.00	3571.20	518.40
13841	3847	19	87	5	2023-04-16	5	5.00	120.00	140.00	665.00	95.00
13842	3848	772	750	1	2022-02-28	3	5.00	470.00	500.00	1425.00	85.50
13843	3849	182	1592	5	2023-07-18	4	2.00	560.00	690.00	2704.80	509.60
13844	3850	182	61	5	2023-08-25	5	3.00	30.00	30.00	145.50	0.00
13845	3851	773	315	2	2023-12-08	7	3.00	80.00	90.00	611.10	67.90
13846	3852	758	102	7	2022-03-17	2	2.00	80.00	90.00	176.40	19.60
13847	3853	774	302	5	2023-10-14	8	4.00	30.00	30.00	230.40	0.00
13848	3854	337	1593	2	2022-10-27	1	2.00	0.00	0.00	0.00	0.00
13849	3855	337	1506	2	2023-12-05	5	3.00	30.00	30.00	145.50	0.00
13850	3856	73	991	1	2022-02-13	3	4.00	0.00	0.00	0.00	0.00
13851	3857	73	1165	1	2023-12-11	5	3.00	660.00	820.00	3977.00	776.00
13852	3858	73	1006	1	2022-08-24	3	2.00	10.00	10.00	29.40	0.00
13853	3859	775	1594	7	2022-12-03	7	2.00	400.00	450.00	3087.00	343.00
13854	3860	229	856	2	2022-07-07	3	2.00	410.00	480.00	1411.20	205.80
13855	3861	229	1595	2	2023-05-26	1	3.00	110.00	120.00	116.40	9.70
13856	3862	331	1596	2	2023-05-02	3	2.00	30.00	40.00	117.60	29.40
13857	3863	331	110	2	2023-05-05	3	3.00	10.00	10.00	29.10	0.00
13858	3864	103	1597	1	2022-10-21	4	4.00	10.00	10.00	38.40	0.00
13859	3865	776	1598	2	2023-04-11	5	2.00	120.00	150.00	735.00	147.00
13860	3866	37	1201	1	2023-01-19	2	5.00	190.00	240.00	456.00	95.00
13861	3867	755	1114	1	2023-02-20	6	5.00	150.00	160.00	912.00	57.00
13862	3868	287	679	1	2023-01-20	9	3.00	120.00	150.00	1309.50	261.90
13863	3869	287	1497	1	2023-06-27	1	3.00	210.00	240.00	232.80	29.10
13864	3870	287	878	1	2023-04-29	7	3.00	160.00	190.00	1290.10	203.70
13865	3871	287	610	1	2023-07-05	2	4.00	10.00	10.00	19.20	0.00
13866	3872	287	112	1	2022-02-06	4	4.00	10.00	10.00	38.40	0.00
13867	3873	287	1132	1	2023-04-01	3	2.00	700.00	840.00	2469.60	411.60
13868	3874	506	707	1	2023-03-03	3	2.00	20.00	20.00	58.80	0.00
13869	3875	506	801	1	2023-05-23	7	2.00	90.00	90.00	617.40	0.00
13870	3876	506	705	1	2022-09-01	2	5.00	100.00	110.00	209.00	19.00
13871	3877	506	1451	1	2023-01-16	3	2.00	10.00	10.00	29.40	0.00
13872	3878	202	987	2	2023-12-14	5	4.00	40.00	40.00	192.00	0.00
13873	3879	77	171	5	2022-05-27	4	2.00	50.00	50.00	196.00	0.00
13874	3880	77	1570	5	2022-11-08	4	4.00	40.00	50.00	192.00	38.40
13875	3881	777	1358	2	2022-09-22	2	2.00	10.00	10.00	19.60	0.00
13876	3882	777	233	2	2023-09-26	2	4.00	70.00	80.00	153.60	19.20
13877	3883	777	1598	2	2022-01-31	6	4.00	320.00	360.00	2073.60	230.40
13878	3884	777	1599	2	2023-12-18	4	2.00	40.00	40.00	156.80	0.00
13879	3885	778	7	2	2023-11-04	3	3.00	0.00	0.00	0.00	0.00
13880	3886	194	281	2	2022-10-14	4	4.00	10.00	10.00	38.40	0.00
13881	3887	779	1518	1	2022-10-25	3	2.00	110.00	130.00	382.20	58.80
13882	3888	340	1254	2	2023-12-12	2	3.00	10.00	10.00	19.40	0.00
13883	3889	340	517	2	2022-01-29	3	3.00	200.00	240.00	698.40	116.40
13884	3890	340	519	2	2022-07-23	2	3.00	300.00	360.00	698.40	116.40
13885	3891	2	765	2	2022-08-21	2	4.00	550.00	660.00	1267.20	211.20
13886	3892	2	655	2	2022-07-21	6	2.00	1510.00	1680.00	9878.40	999.60
13887	3893	2	1510	2	2023-01-17	8	4.00	480.00	560.00	4300.80	614.40
13888	3894	75	649	2	2023-11-07	7	2.00	230.00	280.00	1920.80	343.00
13889	3895	780	1231	2	2023-10-09	5	2.00	10.00	10.00	49.00	0.00
13890	3896	781	1600	2	2023-11-07	5	2.00	40.00	50.00	245.00	49.00
13891	3897	162	1085	2	2023-02-02	3	4.00	0.00	0.00	0.00	0.00
13892	3898	162	89	2	2022-10-04	3	4.00	20.00	20.00	57.60	0.00
13893	3899	782	1085	2	2022-04-25	2	5.00	0.00	0.00	0.00	0.00
13894	3900	296	429	5	2022-06-03	2	3.00	110.00	130.00	252.20	38.80
13895	3901	783	290	2	2022-11-18	2	5.00	10.00	10.00	19.00	0.00
13896	3902	282	1601	2	2022-11-29	2	3.00	40.00	50.00	97.00	19.40
13897	3903	179	1221	1	2022-05-04	14	4.00	250.00	270.00	3628.80	268.80
13898	3904	282	1298	2	2023-10-29	7	5.00	80.00	100.00	665.00	133.00
13899	3905	282	719	2	2022-02-18	4	3.00	470.00	560.00	2172.80	349.20
13900	3906	282	845	2	2023-08-08	4	5.00	10.00	10.00	38.00	0.00
13901	3907	282	1305	2	2023-07-26	4	5.00	490.00	550.00	2090.00	228.00
13902	3908	282	501	2	2023-02-02	5	4.00	10.00	10.00	48.00	0.00
13903	3909	282	105	2	2023-11-29	2	2.00	40.00	40.00	78.40	0.00
13904	3910	282	1184	2	2023-05-19	1	2.00	10.00	10.00	9.80	0.00
13905	3911	282	1602	2	2022-07-03	5	2.00	280.00	350.00	1715.00	343.00
13906	3912	784	1603	5	2022-03-08	3	3.00	420.00	470.00	1367.70	145.50
13907	3913	49	989	2	2022-09-08	3	4.00	20.00	20.00	57.60	0.00
13908	3914	49	876	2	2022-02-23	2	3.00	10.00	10.00	19.40	0.00
13909	3915	55	856	2	2022-06-30	5	3.00	750.00	800.00	3880.00	242.50
13910	3916	55	39	2	2022-02-14	2	5.00	140.00	160.00	304.00	38.00
13911	3917	55	1604	2	2023-05-04	2	2.00	20.00	20.00	39.20	0.00
13912	3918	55	850	2	2022-06-27	4	3.00	10.00	10.00	38.80	0.00
13913	3919	55	71	2	2022-12-16	3	4.00	270.00	310.00	892.80	115.20
13914	3920	503	422	2	2022-10-28	4	5.00	60.00	60.00	228.00	0.00
13915	3921	503	1400	2	2023-01-27	4	5.00	60.00	60.00	228.00	0.00
13916	3922	101	1502	1	2022-01-26	3	4.00	310.00	360.00	1036.80	144.00
13917	3923	118	219	2	2022-03-03	6	4.00	20.00	30.00	172.80	57.60
13918	3924	118	1605	2	2022-02-15	5	2.00	30.00	30.00	147.00	0.00
13919	3925	6	465	2	2022-08-15	2	5.00	30.00	30.00	57.00	0.00
13920	3926	6	1221	2	2023-08-26	3	4.00	50.00	60.00	172.80	28.80
13921	3927	6	1382	2	2022-12-29	2	2.00	30.00	40.00	78.40	19.60
13922	3928	6	142	2	2023-05-06	5	5.00	130.00	140.00	665.00	47.50
13923	3929	137	632	5	2023-07-03	5	2.00	190.00	240.00	1176.00	245.00
13924	3930	137	549	5	2022-07-18	1	2.00	10.00	10.00	9.80	0.00
13925	3931	137	1063	5	2022-10-17	7	4.00	130.00	150.00	1008.00	134.40
13926	3932	59	1606	2	2023-03-26	3	2.00	10.00	10.00	29.40	0.00
13927	3933	59	1017	2	2023-04-04	2	5.00	50.00	50.00	95.00	0.00
13928	3934	639	869	2	2022-05-28	5	3.00	10.00	10.00	48.50	0.00
13929	3935	639	199	2	2022-02-05	5	2.00	70.00	70.00	343.00	0.00
13930	3936	639	1552	2	2023-10-21	2	5.00	180.00	200.00	380.00	38.00
13931	3937	535	1607	2	2023-09-26	3	4.00	20.00	30.00	86.40	28.80
13932	3938	535	753	2	2022-10-24	3	3.00	30.00	30.00	87.30	0.00
13933	3939	535	902	2	2023-05-20	2	2.00	190.00	200.00	392.00	19.60
13934	3940	785	464	7	2023-07-24	5	4.00	1350.00	1420.00	6816.00	336.00
13935	3941	104	1028	2	2022-07-22	2	4.00	10.00	10.00	19.20	0.00
13936	3942	104	537	2	2022-02-17	1	4.00	0.00	0.00	0.00	0.00
13937	3943	33	779	1	2022-05-04	5	3.00	20.00	30.00	145.50	48.50
13938	3944	359	1421	2	2023-04-08	7	3.00	770.00	840.00	5703.60	475.30
13939	3945	234	610	1	2023-06-20	3	5.00	20.00	20.00	57.00	0.00
13940	3946	345	1487	2	2022-05-23	1	3.00	30.00	40.00	38.80	9.70
13941	3947	345	328	2	2022-11-08	1	3.00	0.00	0.00	0.00	0.00
13942	3948	306	182	2	2022-09-22	2	2.00	10.00	10.00	19.60	0.00
13943	3949	306	581	2	2022-04-18	2	2.00	50.00	50.00	98.00	0.00
13944	3950	306	315	2	2023-09-11	2	3.00	20.00	20.00	38.80	0.00
13945	3951	306	164	2	2023-01-11	6	2.00	240.00	260.00	1528.80	117.60
13946	3952	385	829	1	2022-01-20	2	2.00	20.00	20.00	39.20	0.00
13947	3953	358	1608	2	2022-01-22	2	4.00	130.00	160.00	307.20	57.60
13948	3954	540	70	2	2022-07-25	2	2.00	10.00	10.00	19.60	0.00
13949	3955	638	494	2	2022-12-02	1	2.00	10.00	10.00	9.80	0.00
13950	3956	638	1042	2	2023-12-24	4	3.00	70.00	80.00	310.40	38.80
13951	3957	10	1257	2	2022-06-09	3	2.00	20.00	20.00	58.80	0.00
13952	3958	611	1096	2	2022-11-17	3	2.00	10.00	10.00	29.40	0.00
13953	3959	611	325	2	2022-04-13	2	5.00	0.00	0.00	0.00	0.00
13954	3960	611	1609	2	2023-02-01	3	4.00	40.00	40.00	115.20	0.00
13955	3961	96	1207	2	2023-07-26	6	2.00	30.00	40.00	235.20	58.80
13956	3962	96	994	2	2023-03-04	5	4.00	120.00	150.00	720.00	144.00
13957	3963	179	1006	5	2022-02-10	3	5.00	10.00	10.00	28.50	0.00
13958	3964	179	944	5	2022-07-26	3	4.00	40.00	40.00	115.20	0.00
13959	3965	12	1610	2	2022-05-27	3	4.00	10.00	10.00	28.80	0.00
13960	3966	786	280	1	2022-01-15	3	3.00	10.00	10.00	29.10	0.00
13961	3967	104	667	2	2022-12-23	4	2.00	80.00	90.00	352.80	39.20
13962	3968	787	613	5	2022-06-28	7	3.00	30.00	40.00	271.60	67.90
13963	3969	162	176	2	2022-09-10	8	5.00	10.00	10.00	76.00	0.00
13964	3970	162	1611	2	2023-03-20	10	4.00	30.00	40.00	384.00	96.00
13965	3971	234	1358	2	2022-12-26	9	4.00	40.00	50.00	432.00	86.40
13966	3972	673	1501	1	2022-07-05	4	5.00	70.00	80.00	304.00	38.00
13967	3973	31	950	2	2022-09-28	2	2.00	10.00	10.00	19.60	0.00
13968	3974	31	986	2	2023-08-25	5	2.00	30.00	30.00	147.00	0.00
13969	3975	31	29	2	2023-10-17	8	4.00	350.00	410.00	3148.80	460.80
13970	3976	31	778	2	2023-04-02	7	3.00	30.00	40.00	271.60	67.90
13971	3977	261	1612	5	2022-06-26	4	5.00	30.00	40.00	152.00	38.00
13972	3978	67	128	2	2022-10-20	3	3.00	10.00	10.00	29.10	0.00
13973	3979	67	510	2	2023-02-13	2	3.00	70.00	80.00	155.20	19.40
13974	3980	25	973	2	2023-01-08	2	2.00	50.00	50.00	98.00	0.00
13975	3981	25	552	2	2023-12-22	3	2.00	50.00	60.00	176.40	29.40
13976	3982	246	561	2	2022-12-04	3	3.00	20.00	20.00	58.20	0.00
13977	3983	70	52	1	2023-05-21	4	3.00	240.00	290.00	1125.20	194.00
13978	3984	70	1294	1	2023-05-18	5	2.00	2350.00	2800.00	13720.00	2205.00
13979	3985	70	1439	1	2022-09-17	1	2.00	40.00	50.00	49.00	9.80
13980	3986	788	714	2	2022-03-13	3	4.00	210.00	260.00	748.80	144.00
13981	3987	220	487	2	2022-01-12	4	5.00	2120.00	2590.00	9842.00	1786.00
13982	3988	220	1613	2	2023-12-19	5	4.00	30.00	40.00	192.00	48.00
13983	3989	789	1614	2	2022-08-16	5	5.00	70.00	80.00	380.00	47.50
13984	3990	790	751	1	2022-05-11	2	3.00	50.00	50.00	97.00	0.00
13985	3991	552	1421	2	2023-07-02	3	2.00	270.00	290.00	852.60	58.80
13986	3992	273	751	2	2022-11-03	3	4.00	50.00	60.00	172.80	28.80
13987	3993	273	611	2	2023-08-04	3	3.00	40.00	40.00	116.40	0.00
13988	3994	273	916	2	2022-09-01	6	2.00	140.00	170.00	999.60	176.40
13989	3995	791	1529	2	2022-04-20	3	3.00	410.00	510.00	1484.10	291.00
13990	3996	791	1266	2	2022-07-01	7	4.00	730.00	860.00	5779.20	873.60
13991	3997	791	349	2	2023-10-03	5	2.00	660.00	770.00	3773.00	539.00
13992	3998	791	1615	2	2023-10-02	1	3.00	10.00	10.00	9.70	0.00
13993	3999	791	1293	2	2022-12-12	6	2.00	310.00	370.00	2175.60	352.80
13994	4000	792	267	1	2022-01-09	5	5.00	200.00	230.00	1092.50	142.50
13995	4001	246	1138	2	2022-08-26	11	5.00	50.00	60.00	627.00	104.50
13996	4002	246	1616	2	2023-08-13	5	4.00	290.00	350.00	1680.00	288.00
13997	4003	73	336	2	2023-06-03	3	5.00	520.00	640.00	1824.00	342.00
13998	4004	73	1617	2	2022-04-06	3	4.00	240.00	290.00	835.20	144.00
13999	4005	73	374	2	2022-12-20	3	4.00	30.00	40.00	115.20	28.80
14000	4006	340	1326	2	2022-05-21	1	3.00	0.00	0.00	0.00	0.00
14001	4007	340	1441	2	2023-07-05	4	3.00	30.00	30.00	116.40	0.00
14002	4008	340	1618	2	2023-08-14	6	2.00	90.00	100.00	588.00	58.80
14003	4009	367	1006	2	2022-09-12	2	2.00	10.00	10.00	19.60	0.00
14004	4010	234	1619	2	2022-09-18	11	5.00	380.00	470.00	4911.50	940.50
14005	4011	130	524	5	2023-07-15	2	3.00	10.00	10.00	19.40	0.00
14006	4012	130	577	5	2023-02-04	4	4.00	40.00	40.00	153.60	0.00
14007	4013	793	787	2	2022-07-31	4	3.00	20.00	20.00	77.60	0.00
14008	4014	185	1108	2	2022-01-27	3	3.00	480.00	540.00	1571.40	174.60
14009	4015	185	1187	2	2023-02-08	3	3.00	10.00	10.00	29.10	0.00
14010	4016	185	1414	2	2023-02-27	5	2.00	160.00	190.00	931.00	147.00
14011	4017	185	1118	2	2022-10-25	5	5.00	20.00	20.00	95.00	0.00
14012	4018	185	1620	2	2023-01-25	2	5.00	90.00	100.00	190.00	19.00
14013	4019	185	1131	2	2022-10-30	9	5.00	200.00	250.00	2137.50	427.50
14014	4020	185	23	2	2022-10-28	3	2.00	20.00	30.00	88.20	29.40
14015	4021	794	168	2	2022-02-04	3	4.00	140.00	170.00	489.60	86.40
14016	4022	794	41	2	2022-01-20	3	3.00	70.00	80.00	232.80	29.10
14017	4023	794	2	2	2022-05-01	5	4.00	770.00	850.00	4080.00	384.00
14018	4024	111	1220	5	2023-05-04	5	2.00	450.00	560.00	2744.00	539.00
14019	4025	111	1621	5	2022-01-22	4	5.00	100.00	100.00	380.00	0.00
14020	4026	795	1287	5	2023-05-12	4	5.00	30.00	30.00	114.00	0.00
14021	4027	795	1200	5	2022-11-24	7	2.00	10.00	10.00	68.60	0.00
14022	4028	795	665	5	2023-05-19	2	3.00	130.00	150.00	291.00	38.80
14023	4029	795	1233	5	2022-01-06	8	2.00	10.00	10.00	78.40	0.00
14024	4030	439	959	2	2022-06-05	3	2.00	400.00	480.00	1411.20	235.20
14025	4031	439	1341	2	2022-04-09	4	3.00	190.00	230.00	892.40	155.20
14026	4032	796	644	2	2023-03-18	6	5.00	220.00	240.00	1368.00	114.00
14027	4033	796	100	2	2022-02-14	5	5.00	20.00	30.00	142.50	47.50
14028	4034	796	1073	2	2023-05-28	4	4.00	90.00	100.00	384.00	38.40
14029	4035	797	351	7	2022-05-08	3	5.00	20.00	20.00	57.00	0.00
14030	4036	797	429	7	2023-10-20	6	5.00	330.00	380.00	2166.00	285.00
14031	4037	118	1019	2	2023-12-20	2	5.00	20.00	20.00	38.00	0.00
14032	4038	111	1468	2	2022-01-22	5	2.00	20.00	20.00	98.00	0.00
14033	4039	111	1158	2	2023-05-24	4	5.00	20.00	20.00	76.00	0.00
14034	4040	111	959	2	2022-04-06	6	3.00	630.00	770.00	4481.40	814.80
14035	4041	111	571	2	2023-07-29	3	5.00	10.00	10.00	28.50	0.00
14036	4042	111	517	2	2022-02-12	3	4.00	160.00	190.00	547.20	86.40
14037	4043	111	934	2	2023-01-28	9	4.00	230.00	270.00	2332.80	345.60
14038	4044	111	1531	2	2023-03-08	6	4.00	60.00	70.00	403.20	57.60
14039	4045	152	515	2	2023-11-16	5	3.00	170.00	200.00	970.00	145.50
14040	4046	165	786	2	2022-08-11	3	3.00	10.00	10.00	29.10	0.00
14041	4047	194	811	2	2023-11-14	2	5.00	20.00	20.00	38.00	0.00
14042	4048	49	983	5	2023-04-10	3	5.00	70.00	80.00	228.00	28.50
14043	4049	49	877	5	2023-07-05	10	3.00	560.00	600.00	5820.00	388.00
14044	4050	383	738	1	2022-08-02	3	4.00	260.00	280.00	806.40	57.60
14045	4051	383	269	1	2022-12-24	2	2.00	150.00	170.00	333.20	39.20
14046	4052	325	1274	2	2023-02-04	3	3.00	0.00	0.00	0.00	0.00
14047	4053	325	1169	2	2022-08-29	2	4.00	360.00	410.00	787.20	96.00
14048	4054	325	1622	2	2022-08-14	11	3.00	60.00	60.00	640.20	0.00
14049	4055	325	1222	2	2023-02-13	4	3.00	20.00	20.00	77.60	0.00
14050	4056	325	459	2	2023-07-25	6	4.00	1640.00	1800.00	10368.00	921.60
14051	4057	325	824	2	2023-03-14	1	2.00	60.00	70.00	68.60	9.80
14052	4058	101	766	2	2023-02-06	5	4.00	570.00	650.00	3120.00	384.00
14053	4059	454	715	2	2022-08-13	7	4.00	60.00	70.00	470.40	67.20
14054	4060	454	468	2	2022-09-04	3	3.00	460.00	570.00	1658.70	320.10
14055	4061	101	722	2	2022-01-21	3	3.00	60.00	70.00	203.70	29.10
14056	4062	153	1125	5	2022-03-28	3	2.00	30.00	30.00	88.20	0.00
14057	4063	130	1234	2	2023-03-27	1	5.00	40.00	40.00	38.00	0.00
14058	4064	5	1623	5	2023-06-30	9	2.00	20.00	20.00	176.40	0.00
14059	4065	5	1563	5	2023-02-05	1	3.00	0.00	0.00	0.00	0.00
14060	4066	98	1015	2	2022-07-05	5	5.00	10.00	10.00	47.50	0.00
14061	4067	98	1006	2	2022-04-02	3	5.00	10.00	10.00	28.50	0.00
14062	4068	98	1141	2	2023-10-25	12	3.00	40.00	50.00	582.00	116.40
14063	4069	98	1624	2	2022-12-05	9	4.00	900.00	980.00	8467.20	691.20
14064	4070	452	348	5	2022-04-12	9	3.00	10.00	10.00	87.30	0.00
14065	4071	452	1096	5	2023-10-02	4	5.00	10.00	10.00	38.00	0.00
14066	4072	452	1122	5	2022-09-03	2	3.00	140.00	160.00	310.40	38.80
14067	4073	728	616	1	2022-04-11	2	2.00	920.00	1000.00	1960.00	156.80
14068	4074	798	1547	5	2022-01-26	6	5.00	780.00	820.00	4674.00	228.00
14069	4075	799	569	2	2022-07-17	4	2.00	200.00	220.00	862.40	78.40
14070	4076	799	1061	2	2022-03-27	4	4.00	280.00	340.00	1305.60	230.40
14071	4077	644	654	1	2023-03-09	2	4.00	10.00	10.00	19.20	0.00
14072	4078	644	243	1	2023-04-13	4	3.00	10.00	10.00	38.80	0.00
14073	4079	644	969	1	2022-08-23	3	3.00	100.00	120.00	349.20	58.20
14074	4080	312	126	5	2023-10-10	3	2.00	50.00	50.00	147.00	0.00
14075	4081	800	1306	2	2023-05-27	9	5.00	50.00	60.00	513.00	85.50
14076	4082	800	1596	2	2023-01-11	1	2.00	10.00	10.00	9.80	0.00
14077	4083	77	570	2	2023-08-08	3	3.00	160.00	180.00	523.80	58.20
14078	4084	77	1451	2	2023-04-19	3	3.00	10.00	10.00	29.10	0.00
14079	4085	173	45	5	2022-01-06	3	3.00	10.00	10.00	29.10	0.00
14080	4086	745	8	1	2022-10-13	2	2.00	260.00	300.00	588.00	78.40
14081	4087	745	45	1	2023-01-18	3	3.00	20.00	20.00	58.20	0.00
14082	4088	745	186	1	2023-07-31	3	5.00	10.00	10.00	28.50	0.00
14083	4089	341	1625	2	2022-04-17	9	2.00	590.00	640.00	5644.80	441.00
14084	4090	49	489	2	2022-06-20	2	2.00	20.00	20.00	39.20	0.00
14085	4091	49	504	2	2023-07-23	3	4.00	10.00	10.00	28.80	0.00
14086	4092	49	571	2	2022-08-09	3	2.00	10.00	10.00	29.40	0.00
14087	4093	87	943	5	2022-12-05	2	4.00	200.00	220.00	422.40	38.40
14088	4094	272	201	2	2023-09-09	7	2.00	2770.00	3080.00	21128.80	2126.60
14089	4095	272	1236	2	2022-10-28	4	2.00	70.00	80.00	313.60	39.20
14090	4096	272	1603	2	2022-05-10	3	2.00	530.00	590.00	1734.60	176.40
14091	4097	42	975	2	2022-05-21	5	3.00	20.00	30.00	145.50	48.50
14092	4098	42	460	2	2023-02-22	5	4.00	350.00	400.00	1920.00	240.00
14093	4099	42	1626	2	2023-02-27	5	2.00	8410.00	9450.00	46305.00	5096.00
14094	4100	42	626	2	2023-12-05	2	2.00	10.00	10.00	19.60	0.00
14095	4101	141	1627	2	2023-04-18	1	3.00	0.00	0.00	0.00	0.00
14096	4102	141	1109	2	2022-02-05	1	2.00	0.00	0.00	0.00	0.00
14097	4103	141	1265	2	2022-01-12	8	4.00	130.00	150.00	1152.00	153.60
14098	4104	801	741	7	2023-02-03	2	3.00	20.00	20.00	38.80	0.00
14099	4105	287	885	2	2022-03-04	5	4.00	140.00	160.00	768.00	96.00
14100	4106	287	481	2	2023-05-07	2	3.00	10.00	10.00	19.40	0.00
14101	4107	188	829	2	2023-11-11	2	2.00	0.00	0.00	0.00	0.00
14102	4108	383	701	7	2022-10-25	2	5.00	10.00	10.00	19.00	0.00
14103	4109	383	1480	7	2022-10-17	3	3.00	20.00	30.00	87.30	29.10
14104	4110	96	688	2	2022-01-20	2	2.00	60.00	70.00	137.20	19.60
14105	4111	96	1628	2	2023-07-01	1	2.00	130.00	160.00	156.80	29.40
14106	4112	96	1216	2	2022-03-06	3	2.00	20.00	20.00	58.80	0.00
14107	4113	96	837	2	2023-04-24	1	3.00	0.00	0.00	0.00	0.00
14108	4114	515	1140	2	2022-06-15	3	5.00	10.00	10.00	28.50	0.00
14109	4115	515	985	2	2022-08-28	3	2.00	140.00	160.00	470.40	58.80
14110	4116	203	570	5	2023-06-19	5	4.00	1150.00	1220.00	5856.00	336.00
14111	4117	234	923	2	2022-02-19	2	3.00	0.00	0.00	0.00	0.00
14112	4118	234	511	2	2022-04-09	3	5.00	20.00	20.00	57.00	0.00
14113	4119	234	392	2	2022-12-18	7	2.00	370.00	450.00	3087.00	548.80
14114	4120	234	277	2	2023-10-13	8	3.00	80.00	90.00	698.40	77.60
14115	4121	210	1629	2	2022-01-22	4	3.00	20.00	20.00	77.60	0.00
14116	4122	6	911	7	2022-01-06	6	3.00	40.00	40.00	232.80	0.00
14117	4123	6	1352	7	2023-11-03	3	2.00	40.00	40.00	117.60	0.00
14118	4124	6	1527	7	2023-02-09	2	2.00	30.00	30.00	58.80	0.00
14119	4125	424	361	2	2022-01-06	3	2.00	40.00	40.00	117.60	0.00
14120	4126	164	768	1	2023-08-01	3	5.00	80.00	90.00	256.50	28.50
14121	4127	121	1584	5	2022-06-24	6	4.00	50.00	50.00	288.00	0.00
14122	4128	47	769	2	2023-07-12	6	2.00	60.00	70.00	411.60	58.80
14123	4129	47	1630	2	2022-06-07	3	3.00	2310.00	2620.00	7624.20	902.10
14124	4130	6	1550	2	2023-11-06	4	3.00	60.00	70.00	271.60	38.80
14125	4131	74	498	2	2023-09-05	5	4.00	10.00	10.00	48.00	0.00
14126	4132	802	812	2	2022-12-07	3	4.00	10.00	10.00	28.80	0.00
14127	4133	802	220	2	2022-12-11	3	2.00	20.00	20.00	58.80	0.00
14128	4134	680	660	2	2022-02-24	9	4.00	50.00	50.00	432.00	0.00
14129	4135	680	381	2	2023-12-21	3	3.00	190.00	210.00	611.10	58.20
14130	4136	316	913	2	2022-02-18	5	5.00	90.00	110.00	522.50	95.00
14131	4137	316	907	2	2022-08-08	7	3.00	1500.00	1580.00	10728.20	543.20
14132	4138	294	295	2	2023-05-08	7	4.00	30.00	30.00	201.60	0.00
14133	4139	803	69	5	2023-06-06	6	4.00	10.00	10.00	57.60	0.00
14134	4140	210	231	5	2023-11-30	3	3.00	30.00	40.00	116.40	29.10
14135	4141	210	1614	5	2023-05-28	5	2.00	80.00	80.00	392.00	0.00
14136	4142	804	166	2	2022-01-28	3	2.00	20.00	20.00	58.80	0.00
14137	4143	568	1207	2	2023-06-09	9	4.00	50.00	60.00	518.40	86.40
14138	4144	258	854	2	2022-12-08	7	2.00	10.00	10.00	68.60	0.00
14139	4145	258	1631	2	2022-01-03	3	5.00	10.00	10.00	28.50	0.00
14140	4146	258	84	2	2022-12-24	1	5.00	100.00	120.00	114.00	19.00
14141	4147	385	217	2	2023-11-15	3	2.00	280.00	320.00	940.80	117.60
14142	4148	132	1527	2	2023-05-29	3	5.00	10.00	10.00	28.50	0.00
14143	4149	132	457	2	2022-07-15	1	3.00	10.00	10.00	9.70	0.00
14144	4150	132	1616	2	2023-02-27	1	2.00	50.00	60.00	58.80	9.80
14145	4151	132	872	2	2023-08-24	4	3.00	240.00	260.00	1008.80	77.60
14146	4152	71	149	2	2023-08-10	5	3.00	30.00	30.00	145.50	0.00
14147	4153	71	935	2	2022-02-04	3	4.00	20.00	20.00	57.60	0.00
14148	4154	71	30	2	2023-12-11	3	2.00	0.00	0.00	0.00	0.00
14149	4155	52	133	2	2022-11-09	4	5.00	30.00	40.00	152.00	38.00
14150	4156	52	745	2	2022-06-24	3	4.00	0.00	0.00	0.00	0.00
14151	4157	12	1049	1	2022-03-30	2	3.00	40.00	50.00	97.00	19.40
14152	4158	12	498	1	2023-12-07	6	2.00	30.00	30.00	176.40	0.00
14153	4159	322	1222	2	2023-06-08	3	2.00	20.00	20.00	58.80	0.00
14154	4160	375	19	2	2022-03-21	3	3.00	10.00	10.00	29.10	0.00
14155	4161	134	1401	2	2022-12-19	3	5.00	480.00	540.00	1539.00	171.00
14156	4162	134	1012	2	2022-05-09	2	2.00	20.00	20.00	39.20	0.00
14157	4163	805	618	2	2022-05-26	4	3.00	20.00	20.00	77.60	0.00
14158	4164	805	1189	2	2022-08-20	3	5.00	570.00	670.00	1909.50	285.00
14159	4165	400	26	5	2022-12-19	7	3.00	140.00	170.00	1154.30	203.70
14160	4166	400	1248	5	2022-10-12	9	5.00	160.00	170.00	1453.50	85.50
14161	4167	536	1466	2	2022-12-14	3	3.00	20.00	20.00	58.20	0.00
14162	4168	62	862	5	2022-02-17	4	2.00	30.00	30.00	117.60	0.00
14163	4169	62	1632	5	2023-11-23	2	2.00	400.00	430.00	842.80	58.80
14164	4170	806	740	5	2022-11-09	6	5.00	30.00	30.00	171.00	0.00
14165	4171	806	927	5	2023-01-07	3	3.00	40.00	50.00	145.50	29.10
14166	4172	362	701	2	2023-03-20	7	3.00	50.00	50.00	339.50	0.00
14167	4173	40	21	7	2022-06-19	2	2.00	10.00	10.00	19.60	0.00
14168	4174	40	740	7	2022-10-24	2	5.00	10.00	10.00	19.00	0.00
14169	4175	40	706	7	2022-09-18	2	4.00	50.00	60.00	115.20	19.20
14170	4176	807	1474	5	2023-05-25	2	2.00	50.00	60.00	117.60	19.60
14171	4177	259	173	2	2023-01-31	5	3.00	540.00	630.00	3055.50	436.50
14172	4178	259	840	2	2023-05-26	3	4.00	100.00	120.00	345.60	57.60
14173	4179	70	1287	1	2023-10-17	5	3.00	40.00	50.00	242.50	48.50
14174	4180	427	74	2	2022-07-29	9	3.00	10.00	10.00	87.30	0.00
14175	4181	75	16	2	2022-12-25	5	4.00	0.00	0.00	0.00	0.00
14176	4182	82	1594	2	2022-06-21	4	3.00	260.00	320.00	1241.60	232.80
14177	4183	82	127	2	2023-06-08	3	3.00	20.00	20.00	58.20	0.00
14178	4184	82	157	2	2022-04-25	3	5.00	290.00	340.00	969.00	142.50
14179	4185	140	1633	5	2022-04-10	1	2.00	70.00	80.00	78.40	9.80
14180	4186	521	961	5	2023-10-27	6	5.00	90.00	100.00	570.00	57.00
14181	4187	808	697	2	2022-08-11	7	4.00	10.00	10.00	67.20	0.00
14182	4188	808	1231	2	2023-12-18	1	4.00	0.00	0.00	0.00	0.00
14183	4189	808	1428	2	2023-02-10	2	2.00	10.00	10.00	19.60	0.00
14184	4190	809	1634	1	2022-04-19	1	2.00	10.00	10.00	9.80	0.00
14185	4191	436	1389	2	2022-11-29	3	5.00	9240.00	10500.00	29925.00	3591.00
14186	4192	35	1635	7	2022-08-15	5	4.00	20.00	20.00	96.00	0.00
14187	4193	810	4	2	2022-05-20	2	5.00	630.00	700.00	1330.00	133.00
14188	4194	810	144	2	2022-04-13	3	2.00	270.00	300.00	882.00	88.20
14189	4195	287	1063	2	2023-08-03	2	2.00	50.00	50.00	98.00	0.00
14190	4196	4	628	2	2023-03-19	5	2.00	20.00	20.00	98.00	0.00
14191	4197	104	677	1	2023-06-12	3	4.00	20.00	20.00	57.60	0.00
14192	4198	71	533	2	2022-12-06	4	2.00	350.00	390.00	1528.80	156.80
14193	4199	71	281	2	2022-07-15	4	3.00	20.00	20.00	77.60	0.00
14194	4200	126	677	7	2022-01-29	1	2.00	10.00	10.00	9.80	0.00
14195	4201	126	616	7	2022-11-19	2	5.00	660.00	800.00	1520.00	266.00
14196	4202	126	321	7	2022-03-03	6	4.00	40.00	40.00	230.40	0.00
14197	4203	126	146	7	2022-06-29	7	3.00	170.00	180.00	1222.20	67.90
14198	4204	811	33	1	2023-02-09	5	4.00	40.00	50.00	240.00	48.00
14199	4205	811	728	1	2022-02-24	2	5.00	10.00	10.00	19.00	0.00
14200	4206	811	1257	1	2022-04-11	2	4.00	10.00	10.00	19.20	0.00
14201	4207	811	823	1	2023-03-22	2	3.00	30.00	30.00	58.20	0.00
14202	4208	811	326	1	2023-06-02	3	3.00	20.00	20.00	58.20	0.00
14203	4209	811	1477	1	2023-02-13	5	5.00	1470.00	1600.00	7600.00	617.50
14204	4210	811	1259	1	2022-10-12	1	4.00	360.00	390.00	374.40	28.80
14205	4211	118	113	2	2023-11-13	2	4.00	20.00	20.00	38.40	0.00
14206	4212	207	1408	1	2023-11-08	3	5.00	10.00	10.00	28.50	0.00
14207	4213	207	280	1	2023-03-08	2	2.00	10.00	10.00	19.60	0.00
14208	4214	207	1636	1	2022-01-02	2	2.00	20.00	20.00	39.20	0.00
14209	4215	599	1637	2	2023-10-05	3	5.00	120.00	130.00	370.50	28.50
14210	4216	812	1638	2	2022-09-12	4	3.00	50.00	60.00	232.80	38.80
14211	4217	351	642	2	2023-07-16	3	2.00	10.00	10.00	29.40	0.00
14212	4218	111	1639	5	2022-06-29	8	2.00	390.00	480.00	3763.20	705.60
14213	4219	111	1498	5	2023-07-30	2	2.00	4030.00	4800.00	9408.00	1509.20
14214	4220	6	275	1	2023-12-05	2	4.00	40.00	40.00	76.80	0.00
14215	4221	6	734	1	2022-01-08	6	2.00	20.00	20.00	117.60	0.00
14216	4222	6	1640	1	2022-08-28	5	5.00	370.00	390.00	1852.50	95.00
14217	4223	6	233	1	2023-05-20	2	4.00	90.00	100.00	192.00	19.20
14218	4224	6	673	1	2023-08-09	3	5.00	160.00	170.00	484.50	28.50
14219	4225	230	186	5	2023-05-06	2	3.00	0.00	0.00	0.00	0.00
14220	4226	74	1641	2	2022-03-17	3	2.00	80.00	90.00	264.60	29.40
14221	4227	50	272	2	2022-11-15	4	2.00	40.00	50.00	196.00	39.20
14222	4228	551	390	2	2022-08-09	1	5.00	50.00	60.00	57.00	9.50
14223	4229	813	1135	5	2023-06-22	1	3.00	20.00	20.00	19.40	0.00
14224	4230	93	738	2	2022-11-06	9	2.00	290.00	330.00	2910.60	352.80
14225	4231	93	859	2	2023-03-21	9	5.00	10.00	10.00	85.50	0.00
14226	4232	93	1642	2	2023-12-23	3	3.00	20.00	20.00	58.20	0.00
14227	4233	93	728	2	2022-09-16	6	3.00	20.00	30.00	174.60	58.20
14228	4234	93	352	2	2022-02-13	1	5.00	10.00	10.00	9.50	0.00
14229	4235	282	205	5	2023-03-25	3	4.00	10.00	10.00	28.80	0.00
14230	4236	282	866	5	2023-04-13	9	3.00	20.00	20.00	174.60	0.00
14231	4237	323	1396	2	2023-08-14	4	3.00	10.00	10.00	38.80	0.00
14232	4238	325	1643	1	2022-06-16	7	3.00	10.00	10.00	67.90	0.00
14233	4239	67	1644	5	2023-08-11	1	4.00	20.00	20.00	19.20	0.00
14234	4240	710	922	2	2023-09-30	2	2.00	200.00	210.00	411.60	19.60
14235	4241	56	1645	2	2023-12-02	4	5.00	40.00	40.00	152.00	0.00
14236	4242	56	675	2	2022-11-03	3	5.00	20.00	20.00	57.00	0.00
14237	4243	295	141	5	2022-02-24	3	2.00	130.00	150.00	441.00	58.80
14238	4244	295	1287	5	2023-03-11	3	3.00	30.00	30.00	87.30	0.00
14239	4245	2	177	2	2022-03-04	3	4.00	60.00	70.00	201.60	28.80
14240	4246	814	1200	2	2022-02-05	1	5.00	0.00	0.00	0.00	0.00
14241	4247	814	221	2	2023-02-06	5	5.00	1000.00	1050.00	4987.50	237.50
14242	4248	814	1007	2	2023-07-30	5	5.00	20.00	20.00	95.00	0.00
14243	4249	79	909	1	2023-02-09	6	5.00	80.00	90.00	513.00	57.00
14244	4250	79	500	1	2022-02-28	4	4.00	670.00	750.00	2880.00	307.20
14245	4251	213	1154	7	2023-12-12	7	3.00	840.00	890.00	6043.10	339.50
14246	4252	815	1137	7	2023-07-18	7	5.00	50.00	60.00	399.00	66.50
14247	4253	815	159	7	2022-07-05	2	4.00	10.00	10.00	19.20	0.00
14248	4254	815	1180	7	2023-11-06	2	3.00	10.00	10.00	19.40	0.00
14249	4255	816	814	5	2022-08-09	3	3.00	50.00	60.00	174.60	29.10
14250	4256	816	262	5	2023-10-31	4	2.00	80.00	100.00	392.00	78.40
14251	4257	816	699	5	2023-11-16	3	5.00	10.00	10.00	28.50	0.00
14252	4258	817	1527	2	2023-05-16	2	4.00	10.00	10.00	19.20	0.00
14253	4259	237	813	5	2023-10-16	2	2.00	170.00	200.00	392.00	58.80
14254	4260	49	245	1	2022-12-24	2	4.00	40.00	50.00	96.00	19.20
14255	4261	818	710	1	2022-03-10	5	4.00	10.00	10.00	48.00	0.00
14256	4262	819	1098	2	2023-10-12	4	2.00	50.00	60.00	235.20	39.20
14257	4263	375	1430	2	2023-08-08	1	4.00	70.00	80.00	76.80	9.60
14258	4264	130	1646	2	2023-04-14	3	4.00	10.00	10.00	28.80	0.00
14259	4265	75	585	2	2023-12-29	8	3.00	720.00	860.00	6673.60	1086.40
14260	4266	75	991	2	2023-06-28	3	3.00	0.00	0.00	0.00	0.00
14261	4267	75	1334	2	2023-07-05	7	4.00	830.00	960.00	6451.20	873.60
14262	4268	75	543	2	2022-02-02	3	2.00	10.00	10.00	29.40	0.00
14263	4269	75	1483	2	2023-12-13	5	4.00	150.00	170.00	816.00	96.00
14264	4270	68	563	1	2022-08-09	4	2.00	700.00	870.00	3410.40	666.40
14265	4271	820	1641	2	2023-01-28	11	3.00	570.00	690.00	7362.30	1280.40
14266	4272	457	690	1	2023-03-22	4	5.00	170.00	210.00	798.00	152.00
14267	4273	821	1558	7	2022-06-09	9	4.00	60.00	70.00	604.80	86.40
14268	4274	821	1063	7	2022-11-21	1	4.00	20.00	30.00	28.80	9.60
14269	4275	153	308	2	2023-08-17	1	3.00	0.00	0.00	0.00	0.00
14270	4276	93	167	2	2023-10-05	2	5.00	40.00	50.00	95.00	19.00
14271	4277	67	766	2	2023-08-18	2	3.00	270.00	320.00	620.80	97.00
14272	4278	708	1647	2	2023-01-03	7	3.00	7640.00	9100.00	61789.00	9913.40
14273	4279	708	1468	2	2022-01-01	2	3.00	10.00	10.00	19.40	0.00
14274	4280	708	882	2	2022-12-30	5	4.00	20.00	30.00	144.00	48.00
14275	4281	304	253	2	2023-10-13	2	2.00	10.00	10.00	19.60	0.00
14276	4282	304	1465	2	2022-04-05	2	3.00	70.00	70.00	135.80	0.00
14277	4283	446	1648	5	2022-11-30	1	4.00	0.00	0.00	0.00	0.00
14278	4284	446	1499	5	2022-11-12	3	5.00	960.00	1100.00	3135.00	399.00
14279	4285	822	1104	1	2022-02-24	2	4.00	240.00	250.00	480.00	19.20
14280	4286	822	3	1	2023-01-01	2	4.00	10.00	10.00	19.20	0.00
14281	4287	822	1573	1	2023-05-13	1	5.00	390.00	440.00	418.00	47.50
14282	4288	823	460	2	2022-01-15	1	3.00	50.00	60.00	58.20	9.70
14283	4289	515	1198	2	2023-10-18	5	3.00	30.00	30.00	145.50	0.00
14284	4290	515	708	2	2023-12-24	3	4.00	10.00	10.00	28.80	0.00
14285	4291	56	312	1	2022-01-20	2	3.00	10.00	10.00	19.40	0.00
14286	4292	56	210	1	2022-08-06	9	3.00	800.00	900.00	7857.00	873.00
14287	4293	56	1142	1	2023-05-18	1	3.00	170.00	190.00	184.30	19.40
14288	4294	12	174	2	2023-02-12	3	3.00	50.00	50.00	145.50	0.00
14289	4295	824	224	2	2023-02-17	5	4.00	170.00	180.00	864.00	48.00
14290	4296	825	1619	2	2022-09-24	3	5.00	110.00	130.00	370.50	57.00
14291	4297	376	1034	2	2022-07-19	4	3.00	50.00	50.00	194.00	0.00
14292	4298	610	1462	1	2022-09-22	13	5.00	3630.00	4370.00	53969.50	9139.00
14293	4299	610	1175	1	2023-10-11	2	3.00	40.00	50.00	97.00	19.40
14294	4300	610	732	1	2023-05-02	6	4.00	140.00	160.00	921.60	115.20
14295	4301	610	853	1	2023-04-02	2	4.00	0.00	0.00	0.00	0.00
14296	4302	610	835	1	2023-08-29	5	2.00	10.00	10.00	49.00	0.00
14297	4303	826	283	1	2023-08-02	1	3.00	0.00	0.00	0.00	0.00
14298	4304	827	762	7	2023-07-22	7	3.00	50.00	60.00	407.40	67.90
14299	4305	203	469	1	2023-04-14	4	4.00	60.00	60.00	230.40	0.00
14300	4306	203	1486	1	2022-05-08	5	3.00	320.00	380.00	1843.00	291.00
14301	4307	376	508	7	2022-06-01	3	5.00	10.00	10.00	28.50	0.00
14302	4308	376	302	7	2023-09-19	2	4.00	30.00	30.00	57.60	0.00
14303	4309	70	1271	2	2023-10-26	7	4.00	620.00	670.00	4502.40	336.00
14304	4310	70	364	2	2023-04-26	4	2.00	470.00	570.00	2234.40	392.00
14305	4311	70	625	2	2023-11-29	3	4.00	20.00	20.00	57.60	0.00
14306	4312	70	1397	2	2022-12-09	3	3.00	20.00	20.00	58.20	0.00
14307	4313	70	1649	2	2022-03-13	4	3.00	390.00	450.00	1746.00	232.80
14308	4314	536	1613	2	2023-09-17	2	5.00	20.00	20.00	38.00	0.00
14309	4315	70	1555	2	2023-01-10	2	3.00	20.00	20.00	38.80	0.00
14310	4316	70	806	2	2022-12-07	3	3.00	80.00	90.00	261.90	29.10
14311	4317	70	538	2	2023-04-03	3	3.00	260.00	300.00	873.00	116.40
14312	4318	152	557	2	2022-10-14	2	2.00	160.00	170.00	333.20	19.60
14313	4319	261	1650	2	2022-08-14	6	4.00	70.00	80.00	460.80	57.60
14314	4320	828	1137	1	2023-12-12	3	4.00	20.00	20.00	57.60	0.00
14315	4321	828	1292	1	2023-08-24	1	2.00	30.00	30.00	29.40	0.00
14316	4322	87	445	2	2023-05-28	2	5.00	10.00	10.00	19.00	0.00
14317	4323	87	1401	2	2022-04-23	3	3.00	290.00	320.00	931.20	87.30
14318	4324	87	316	2	2022-10-20	2	4.00	0.00	0.00	0.00	0.00
14319	4325	87	880	2	2023-07-16	3	3.00	10.00	10.00	29.10	0.00
14320	4326	87	1049	2	2023-11-19	3	2.00	60.00	70.00	205.80	29.40
14321	4327	829	1321	5	2022-03-12	3	2.00	10.00	10.00	29.40	0.00
14322	4328	829	1553	5	2022-06-10	5	5.00	20.00	20.00	95.00	0.00
14323	4329	383	1447	2	2023-11-04	9	5.00	30.00	40.00	342.00	85.50
14324	4330	629	1651	2	2022-05-04	3	4.00	20.00	20.00	57.60	0.00
14325	4331	629	567	2	2023-04-03	5	3.00	20.00	20.00	97.00	0.00
14326	4332	830	85	2	2022-06-06	1	3.00	20.00	20.00	19.40	0.00
14327	4333	830	1548	2	2023-06-24	5	2.00	20.00	20.00	98.00	0.00
14328	4334	831	1652	2	2023-09-08	6	3.00	50.00	50.00	291.00	0.00
14329	4335	831	831	2	2023-11-17	2	5.00	20.00	30.00	57.00	19.00
14330	4336	832	1653	2	2023-04-01	1	4.00	10.00	10.00	9.60	0.00
14331	4337	832	1105	2	2023-08-18	2	2.00	10.00	10.00	19.60	0.00
14332	4338	381	358	2	2022-08-07	3	4.00	90.00	110.00	316.80	57.60
14333	4339	381	68	2	2022-11-24	3	2.00	100.00	110.00	323.40	29.40
14334	4340	833	975	2	2023-07-29	1	4.00	10.00	10.00	9.60	0.00
14335	4341	834	360	7	2023-11-23	2	5.00	20.00	20.00	38.00	0.00
14336	4342	121	246	2	2022-06-07	3	4.00	500.00	540.00	1555.20	115.20
14337	4343	152	926	5	2022-12-18	6	4.00	20.00	20.00	115.20	0.00
14338	4344	152	1076	5	2022-12-11	6	2.00	580.00	660.00	3880.80	470.40
14339	4345	152	101	5	2022-03-17	2	4.00	90.00	100.00	192.00	19.20
14340	4346	152	1136	5	2022-03-23	4	4.00	160.00	200.00	768.00	153.60
14341	4347	289	655	2	2023-10-15	2	5.00	590.00	630.00	1197.00	76.00
14342	4348	289	1654	2	2022-04-15	3	3.00	60.00	60.00	174.60	0.00
14343	4349	193	656	1	2023-09-01	2	3.00	20.00	20.00	38.80	0.00
14344	4350	193	392	1	2023-10-31	8	2.00	380.00	420.00	3292.80	313.60
14345	4351	630	471	2	2023-12-23	2	5.00	20.00	20.00	38.00	0.00
14346	4352	630	659	2	2023-08-09	2	2.00	30.00	30.00	58.80	0.00
14347	4353	530	1621	1	2023-01-07	4	3.00	90.00	100.00	388.00	38.80
14348	4354	530	511	1	2022-07-10	2	2.00	10.00	10.00	19.60	0.00
14349	4355	786	742	1	2022-05-27	8	2.00	20.00	20.00	156.80	0.00
14350	4356	574	693	1	2022-02-28	7	4.00	1300.00	1600.00	10752.00	2016.00
14351	4357	574	685	1	2022-01-27	4	3.00	30.00	40.00	155.20	38.80
14352	4358	623	290	7	2023-11-25	2	4.00	10.00	10.00	19.20	0.00
14353	4359	623	623	7	2023-07-31	1	5.00	60.00	80.00	76.00	19.00
14354	4360	623	874	7	2023-07-12	2	4.00	440.00	520.00	998.40	153.60
14355	4361	148	1655	5	2022-01-31	2	3.00	90.00	110.00	213.40	38.80
14356	4362	439	120	1	2023-12-15	3	4.00	30.00	30.00	86.40	0.00
14357	4363	835	400	1	2023-10-05	3	3.00	100.00	130.00	378.30	87.30
14358	4364	835	314	1	2022-05-24	4	2.00	20.00	30.00	117.60	39.20
14359	4365	835	719	1	2023-10-14	4	5.00	580.00	700.00	2660.00	456.00
14360	4366	835	1100	1	2023-03-28	3	3.00	10.00	10.00	29.10	0.00
14361	4367	835	1540	1	2023-08-29	10	5.00	20.00	20.00	190.00	0.00
14362	4368	118	1322	1	2023-03-19	4	4.00	10.00	10.00	38.40	0.00
14363	4369	118	631	1	2023-02-17	6	3.00	20.00	20.00	116.40	0.00
14364	4370	836	543	2	2022-11-20	5	4.00	90.00	100.00	480.00	48.00
14365	4371	836	1572	2	2023-07-08	2	2.00	30.00	40.00	78.40	19.60
14366	4372	836	1656	2	2022-09-22	5	3.00	40.00	50.00	242.50	48.50
14367	4373	837	242	1	2022-09-09	2	4.00	10.00	10.00	19.20	0.00
14368	4374	837	1366	1	2022-10-09	5	3.00	130.00	160.00	776.00	145.50
14369	4375	838	1657	2	2023-08-11	6	2.00	90.00	100.00	588.00	58.80
14370	4376	839	72	2	2022-01-21	5	5.00	280.00	300.00	1425.00	95.00
14371	4377	839	1285	2	2023-09-30	3	5.00	220.00	270.00	769.50	142.50
14372	4378	839	874	2	2023-04-18	5	2.00	1280.00	1490.00	7301.00	1029.00
14373	4379	694	756	1	2022-08-12	2	5.00	20.00	20.00	38.00	0.00
14374	4380	694	843	1	2023-01-24	2	4.00	70.00	70.00	134.40	0.00
14375	4381	152	627	2	2022-06-05	3	3.00	50.00	60.00	174.60	29.10
14376	4382	152	439	2	2022-09-20	3	4.00	210.00	250.00	720.00	115.20
14377	4383	840	615	2	2022-02-18	5	3.00	0.00	0.00	0.00	0.00
14378	4384	840	1658	2	2022-12-11	4	2.00	360.00	380.00	1489.60	78.40
14379	4385	840	665	2	2022-02-03	2	2.00	140.00	150.00	294.00	19.60
14380	4386	840	38	2	2022-07-06	5	3.00	780.00	910.00	4413.50	630.50
14381	4387	60	1645	2	2023-09-08	4	2.00	40.00	40.00	156.80	0.00
14382	4388	60	1125	2	2023-02-05	3	2.00	30.00	30.00	88.20	0.00
14383	4389	134	653	5	2022-11-14	7	5.00	40.00	50.00	332.50	66.50
14384	4390	134	1122	5	2023-11-28	2	5.00	170.00	180.00	342.00	19.00
14385	4391	134	1462	5	2023-10-18	3	3.00	1080.00	1260.00	3666.60	523.80
14386	4392	134	1244	5	2023-11-28	3	3.00	60.00	70.00	203.70	29.10
14387	4393	227	400	2	2023-08-12	2	4.00	60.00	70.00	134.40	19.20
14388	4394	227	1251	2	2023-12-23	5	2.00	50.00	60.00	294.00	49.00
14389	4395	197	572	7	2023-06-10	1	4.00	30.00	30.00	28.80	0.00
14390	4396	197	1000	7	2023-06-09	3	5.00	30.00	30.00	85.50	0.00
14391	4397	841	945	2	2023-10-02	2	3.00	320.00	360.00	698.40	77.60
14392	4398	210	813	2	2023-07-28	2	3.00	150.00	170.00	329.80	38.80
14393	4399	210	485	2	2023-12-21	2	4.00	60.00	70.00	134.40	19.20
14394	4400	842	890	7	2023-03-27	5	2.00	180.00	200.00	980.00	98.00
14395	4401	842	228	7	2022-06-30	3	2.00	850.00	900.00	2646.00	147.00
14396	4402	842	623	7	2022-06-03	5	5.00	830.00	970.00	4607.50	665.00
14397	4403	388	1659	5	2022-04-29	2	5.00	10.00	10.00	19.00	0.00
14398	4404	31	1659	5	2023-07-28	3	2.00	20.00	20.00	58.80	0.00
14399	4405	12	175	2	2022-10-14	3	2.00	30.00	30.00	88.20	0.00
14400	4406	12	721	2	2023-08-19	3	3.00	30.00	40.00	116.40	29.10
14401	4407	305	703	2	2023-04-30	2	4.00	10.00	10.00	19.20	0.00
14402	4408	305	977	2	2023-08-03	3	2.00	280.00	310.00	911.40	88.20
14403	4409	305	186	2	2023-09-23	1	5.00	0.00	0.00	0.00	0.00
14404	4410	56	866	2	2022-07-17	2	2.00	10.00	10.00	19.60	0.00
14405	4411	56	647	2	2023-03-08	6	5.00	100.00	110.00	627.00	57.00
14406	4412	104	1255	5	2023-09-18	3	5.00	20.00	20.00	57.00	0.00
14407	4413	104	518	5	2023-11-03	3	3.00	500.00	620.00	1804.20	349.20
14408	4414	104	942	5	2023-06-13	3	5.00	50.00	60.00	171.00	28.50
14409	4415	158	761	2	2022-06-29	1	5.00	360.00	390.00	370.50	28.50
14410	4416	37	908	2	2023-06-14	2	2.00	490.00	580.00	1136.80	176.40
14411	4417	37	830	2	2022-01-29	5	2.00	20.00	30.00	147.00	49.00
14412	4418	638	980	1	2022-10-23	8	3.00	420.00	480.00	3724.80	465.60
14413	4419	84	125	2	2023-06-15	3	4.00	180.00	190.00	547.20	28.80
14414	4420	51	1204	2	2022-07-29	4	5.00	10.00	10.00	38.00	0.00
14415	4421	101	683	1	2022-03-11	5	4.00	40.00	40.00	192.00	0.00
14416	4422	843	314	2	2023-12-05	3	5.00	20.00	20.00	57.00	0.00
14417	4423	844	23	5	2022-03-01	2	5.00	20.00	20.00	38.00	0.00
14418	4424	844	1660	5	2023-07-22	3	4.00	280.00	300.00	864.00	57.60
14419	4425	844	1092	5	2023-06-02	5	4.00	30.00	30.00	144.00	0.00
14420	4426	844	413	5	2022-12-29	6	5.00	100.00	110.00	627.00	57.00
14421	4427	844	1481	5	2022-03-20	2	2.00	50.00	60.00	117.60	19.60
14422	4428	588	188	2	2022-07-30	3	3.00	20.00	30.00	87.30	29.10
14423	4429	498	1497	2	2023-10-21	6	2.00	1470.00	1810.00	10642.80	1999.20
14424	4430	845	1560	7	2022-10-13	3	4.00	60.00	70.00	201.60	28.80
14425	4431	1	660	1	2022-03-29	4	3.00	20.00	20.00	77.60	0.00
14426	4432	1	1597	1	2023-11-16	3	4.00	10.00	10.00	28.80	0.00
14427	4433	1	764	1	2023-06-13	5	4.00	20.00	20.00	96.00	0.00
14428	4434	1	1453	1	2023-01-22	1	3.00	10.00	10.00	9.70	0.00
14429	4435	1	1661	1	2023-11-18	3	4.00	740.00	840.00	2419.20	288.00
14430	4436	194	635	2	2023-11-28	1	2.00	0.00	0.00	0.00	0.00
14431	4437	194	1662	2	2022-04-19	7	2.00	30.00	30.00	205.80	0.00
14432	4438	194	1325	2	2022-01-02	3	5.00	20.00	30.00	85.50	28.50
14433	4439	846	1194	2	2022-11-28	2	4.00	10.00	10.00	19.20	0.00
14434	4440	846	957	2	2022-08-09	4	3.00	20.00	20.00	77.60	0.00
14435	4441	22	990	2	2022-11-24	1	2.00	100.00	110.00	107.80	9.80
14436	4442	22	1663	2	2023-12-26	5	3.00	870.00	970.00	4704.50	485.00
14437	4443	22	1664	2	2023-08-18	5	2.00	30.00	30.00	147.00	0.00
14438	4444	22	1010	2	2023-02-21	5	2.00	20.00	30.00	147.00	49.00
14439	4445	847	1359	2	2022-05-25	5	3.00	70.00	80.00	388.00	48.50
14440	4446	847	1437	2	2022-10-18	6	2.00	20.00	30.00	176.40	58.80
14441	4447	847	25	2	2022-06-10	4	2.00	20.00	30.00	117.60	39.20
14442	4448	847	299	2	2022-08-15	5	4.00	160.00	170.00	816.00	48.00
14443	4449	4	546	2	2023-05-18	2	4.00	10.00	10.00	19.20	0.00
14444	4450	4	1115	2	2023-09-13	1	5.00	10.00	10.00	9.50	0.00
14445	4451	4	634	2	2023-11-10	3	5.00	160.00	190.00	541.50	85.50
14446	4452	10	535	5	2022-12-07	5	3.00	30.00	30.00	145.50	0.00
14447	4453	10	1665	5	2022-01-15	2	2.00	40.00	40.00	78.40	0.00
14448	4454	10	790	5	2022-06-18	5	2.00	1080.00	1280.00	6272.00	980.00
14449	4455	10	701	5	2022-06-29	4	5.00	20.00	30.00	114.00	38.00
14450	4456	258	395	2	2022-01-04	2	4.00	110.00	130.00	249.60	38.40
14451	4457	258	123	2	2023-07-13	2	3.00	10.00	10.00	19.40	0.00
14452	4458	308	1185	2	2022-08-26	5	3.00	210.00	240.00	1164.00	145.50
14453	4459	88	466	2	2023-02-05	2	5.00	1180.00	1330.00	2527.00	285.00
14454	4460	730	515	5	2022-06-26	1	4.00	30.00	30.00	28.80	0.00
14455	4461	730	197	5	2023-12-23	2	4.00	140.00	150.00	288.00	19.20
14456	4462	730	152	5	2023-01-23	2	3.00	50.00	50.00	97.00	0.00
14457	4463	730	1243	5	2022-04-01	4	4.00	70.00	80.00	307.20	38.40
14458	4464	730	1666	5	2023-07-19	3	3.00	10.00	10.00	29.10	0.00
14459	4465	730	165	5	2022-05-04	2	2.00	180.00	210.00	411.60	58.80
14460	4466	810	926	2	2023-06-27	1	5.00	0.00	0.00	0.00	0.00
14461	4467	134	854	2	2023-01-17	9	5.00	20.00	20.00	171.00	0.00
14462	4468	134	971	2	2022-09-13	2	5.00	150.00	170.00	323.00	38.00
14463	4469	134	1334	2	2023-12-28	2	2.00	290.00	320.00	627.20	58.80
14464	4470	134	1194	2	2022-11-10	2	3.00	10.00	10.00	19.40	0.00
14465	4471	59	1535	2	2022-01-07	3	4.00	120.00	130.00	374.40	28.80
14466	4472	848	1210	7	2022-09-16	1	2.00	50.00	60.00	58.80	9.80
14467	4473	848	410	7	2022-07-15	3	3.00	210.00	240.00	698.40	87.30
14468	4474	848	1667	7	2023-08-12	2	3.00	280.00	340.00	659.60	116.40
14469	4475	848	1291	7	2023-12-25	3	2.00	20.00	20.00	58.80	0.00
14470	4476	848	1495	7	2022-01-06	4	2.00	20.00	20.00	78.40	0.00
14471	4477	848	1611	7	2022-09-27	2	4.00	10.00	10.00	19.20	0.00
14472	4478	849	1668	7	2022-09-25	3	5.00	290.00	330.00	940.50	114.00
14473	4479	849	210	7	2023-02-14	2	2.00	220.00	250.00	490.00	58.80
14474	4480	104	1669	2	2023-12-09	5	2.00	20.00	20.00	98.00	0.00
14475	4481	14	846	2	2022-12-10	7	2.00	20.00	20.00	137.20	0.00
14476	4482	14	1657	2	2022-05-10	2	4.00	40.00	40.00	76.80	0.00
14477	4483	14	110	2	2023-07-08	12	4.00	30.00	40.00	460.80	115.20
14478	4484	14	1670	2	2023-08-24	3	5.00	100.00	120.00	342.00	57.00
14479	4485	14	700	2	2022-11-06	2	2.00	10.00	10.00	19.60	0.00
14480	4486	14	1232	2	2022-10-08	3	2.00	20.00	20.00	58.80	0.00
14481	4487	14	1079	2	2022-08-14	3	3.00	260.00	310.00	902.10	145.50
14482	4488	522	1527	2	2023-08-10	5	3.00	20.00	20.00	97.00	0.00
14483	4489	522	1512	2	2023-12-01	9	4.00	70.00	70.00	604.80	0.00
14484	4490	522	986	2	2023-08-09	3	3.00	0.00	0.00	0.00	0.00
14485	4491	4	617	2	2022-11-24	3	4.00	370.00	420.00	1209.60	144.00
14486	4492	51	1573	1	2022-12-16	2	3.00	590.00	660.00	1280.40	135.80
14487	4493	51	535	1	2023-03-19	2	4.00	10.00	10.00	19.20	0.00
14488	4494	51	1194	1	2022-06-28	7	5.00	30.00	40.00	266.00	66.50
14489	4495	51	378	1	2022-01-31	6	5.00	750.00	910.00	5187.00	912.00
14490	4496	4	575	2	2023-04-20	9	4.00	800.00	920.00	7948.80	1036.80
14491	4497	4	330	2	2022-10-07	6	2.00	30.00	40.00	235.20	58.80
14492	4498	12	116	2	2022-04-01	4	2.00	560.00	630.00	2469.60	274.40
14493	4499	111	1166	2	2022-09-25	2	5.00	10.00	10.00	19.00	0.00
14494	4500	850	1291	2	2022-08-11	2	2.00	10.00	10.00	19.60	0.00
14495	4501	850	1459	2	2022-05-27	5	5.00	20.00	20.00	95.00	0.00
14496	4502	515	511	2	2023-09-21	5	2.00	30.00	30.00	147.00	0.00
14497	4503	515	463	2	2022-01-29	6	2.00	20.00	20.00	117.60	0.00
14498	4504	179	1671	2	2022-04-24	7	5.00	160.00	170.00	1130.50	66.50
14499	4505	179	1108	2	2022-08-15	2	4.00	320.00	360.00	691.20	76.80
14500	4506	179	342	2	2022-04-08	3	5.00	50.00	60.00	171.00	28.50
14501	4507	179	639	2	2023-02-28	3	5.00	710.00	820.00	2337.00	313.50
14502	4508	179	1513	2	2023-12-15	1	4.00	20.00	20.00	19.20	0.00
14503	4509	179	929	2	2023-05-01	1	4.00	20.00	20.00	19.20	0.00
14504	4510	234	720	2	2023-06-11	3	2.00	140.00	170.00	499.80	88.20
14505	4511	773	1609	2	2022-01-10	2	3.00	40.00	40.00	77.60	0.00
14506	4512	773	801	2	2023-01-06	2	4.00	70.00	80.00	153.60	19.20
14507	4513	55	472	5	2022-04-09	6	3.00	50.00	50.00	291.00	0.00
14508	4514	35	147	5	2023-04-10	1	4.00	10.00	10.00	9.60	0.00
14509	4515	851	1004	1	2023-01-25	1	3.00	270.00	290.00	281.30	19.40
14510	4516	852	1584	2	2023-10-13	4	3.00	30.00	40.00	155.20	38.80
14511	4517	203	1672	2	2022-10-24	5	4.00	20.00	20.00	96.00	0.00
14512	4518	203	531	2	2023-11-02	7	2.00	50.00	50.00	343.00	0.00
14513	4519	10	155	2	2023-08-12	4	4.00	20.00	20.00	76.80	0.00
14514	4520	251	1673	2	2023-03-14	8	3.00	1190.00	1350.00	10476.00	1241.60
14515	4521	813	1197	2	2023-08-29	3	3.00	50.00	60.00	174.60	29.10
14516	4522	813	535	2	2023-02-06	4	3.00	20.00	20.00	77.60	0.00
14517	4523	367	1329	1	2022-01-30	3	3.00	10.00	10.00	29.10	0.00
14518	4524	104	640	2	2023-10-30	7	3.00	30.00	30.00	203.70	0.00
14519	4525	104	944	2	2023-07-01	6	5.00	70.00	90.00	513.00	114.00
14520	4526	853	150	2	2022-08-12	2	2.00	250.00	270.00	529.20	39.20
14521	4527	853	1674	2	2022-07-17	5	3.00	90.00	100.00	485.00	48.50
14522	4528	853	29	2	2022-01-04	4	3.00	40.00	40.00	155.20	0.00
14523	4529	854	1313	1	2023-08-08	4	5.00	100.00	120.00	456.00	76.00
14524	4530	188	1213	2	2023-12-18	2	3.00	0.00	0.00	0.00	0.00
14525	4531	31	630	5	2022-12-05	2	4.00	360.00	410.00	787.20	96.00
14526	4532	31	147	5	2022-05-04	3	3.00	30.00	40.00	116.40	29.10
14527	4533	544	24	7	2022-01-21	3	4.00	100.00	120.00	345.60	57.60
14528	4534	544	589	7	2023-09-02	2	2.00	20.00	20.00	39.20	0.00
14529	4535	351	359	2	2023-03-15	2	4.00	10.00	10.00	19.20	0.00
14530	4536	246	1227	2	2023-02-01	3	4.00	20.00	20.00	57.60	0.00
14531	4537	246	380	2	2023-09-26	3	4.00	90.00	90.00	259.20	0.00
14532	4538	246	488	2	2022-11-12	3	2.00	20.00	20.00	58.80	0.00
14533	4539	246	347	2	2023-08-28	4	5.00	10.00	10.00	38.00	0.00
14534	4540	696	510	2	2023-02-07	2	4.00	100.00	110.00	211.20	19.20
14535	4541	696	1530	2	2023-08-20	7	5.00	430.00	490.00	3258.50	399.00
14536	4542	199	16	2	2022-11-22	7	3.00	10.00	10.00	67.90	0.00
14537	4543	500	1675	5	2022-02-02	2	2.00	280.00	330.00	646.80	98.00
14538	4544	101	213	1	2022-12-21	9	4.00	350.00	380.00	3283.20	259.20
14539	4545	101	919	1	2022-04-10	2	3.00	120.00	150.00	291.00	58.20
14540	4546	101	1486	1	2022-04-22	7	4.00	510.00	540.00	3628.80	201.60
14541	4547	101	309	1	2022-08-23	2	2.00	0.00	0.00	0.00	0.00
14542	4548	101	650	1	2023-05-07	3	2.00	10.00	10.00	29.40	0.00
14543	4549	101	276	1	2023-08-18	1	3.00	10.00	10.00	9.70	0.00
14544	4550	101	518	1	2022-07-21	4	5.00	560.00	660.00	2508.00	380.00
14545	4551	855	1676	5	2023-01-30	2	5.00	10.00	10.00	19.00	0.00
14546	4552	19	1214	2	2023-03-18	3	3.00	300.00	350.00	1018.50	145.50
14547	4553	37	371	2	2022-08-30	3	4.00	200.00	230.00	662.40	86.40
14548	4554	37	631	2	2023-06-09	3	3.00	10.00	10.00	29.10	0.00
14549	4555	856	93	1	2022-11-20	3	4.00	50.00	60.00	172.80	28.80
14550	4556	485	551	5	2023-06-01	4	5.00	20.00	30.00	114.00	38.00
14551	4557	485	701	5	2022-07-20	4	4.00	20.00	30.00	115.20	38.40
14552	4558	406	698	2	2022-11-17	1	4.00	10.00	10.00	9.60	0.00
14553	4559	857	1504	2	2023-01-18	2	4.00	40.00	50.00	96.00	19.20
14554	4560	73	65	5	2023-12-07	3	3.00	120.00	130.00	378.30	29.10
14555	4561	19	232	1	2022-05-18	3	5.00	260.00	270.00	769.50	28.50
14556	4562	19	1677	1	2023-01-05	3	4.00	90.00	110.00	316.80	57.60
14557	4563	19	1678	1	2023-11-08	5	5.00	40.00	40.00	190.00	0.00
14558	4564	858	1586	2	2023-12-06	4	5.00	390.00	420.00	1596.00	114.00
14559	4565	397	1019	2	2022-07-30	6	3.00	90.00	100.00	582.00	58.20
14560	4566	597	552	2	2022-08-26	3	2.00	40.00	50.00	147.00	29.40
14561	4567	597	1400	2	2022-03-28	6	2.00	30.00	30.00	176.40	0.00
14562	4568	597	828	2	2022-04-14	4	3.00	20.00	20.00	77.60	0.00
14563	4569	141	45	2	2023-12-22	6	2.00	10.00	10.00	58.80	0.00
14564	4570	594	217	1	2022-04-26	3	3.00	80.00	80.00	232.80	0.00
14565	4571	859	1659	1	2022-05-02	3	3.00	20.00	20.00	58.20	0.00
14566	4572	859	1243	1	2023-01-26	2	3.00	110.00	130.00	252.20	38.80
14567	4573	316	852	2	2022-12-11	2	5.00	420.00	480.00	912.00	114.00
14568	4574	149	540	2	2022-12-19	7	2.00	580.00	660.00	4527.60	548.80
14569	4575	149	905	2	2022-03-15	4	3.00	30.00	30.00	116.40	0.00
14570	4576	149	325	2	2022-12-03	5	3.00	10.00	10.00	48.50	0.00
14571	4577	149	1679	2	2023-12-13	2	3.00	30.00	30.00	58.20	0.00
14572	4578	860	1225	2	2022-02-17	1	3.00	10.00	10.00	9.70	0.00
14573	4579	861	444	2	2022-12-05	3	4.00	100.00	110.00	316.80	28.80
14574	4580	49	1680	2	2023-07-06	11	4.00	70.00	70.00	739.20	0.00
14575	4581	862	241	2	2023-02-23	6	5.00	220.00	240.00	1368.00	114.00
14576	4582	243	1681	5	2023-10-17	3	3.00	30.00	30.00	87.30	0.00
14577	4583	12	1648	5	2023-07-20	8	4.00	20.00	20.00	153.60	0.00
14578	4584	156	106	1	2023-10-07	2	4.00	10.00	10.00	19.20	0.00
14579	4585	863	467	1	2022-05-17	7	3.00	70.00	80.00	543.20	67.90
14580	4586	863	1274	1	2022-12-17	5	2.00	10.00	10.00	49.00	0.00
14581	4587	863	1682	1	2022-04-28	6	5.00	500.00	590.00	3363.00	513.00
14582	4588	863	803	1	2023-03-23	3	5.00	10.00	10.00	28.50	0.00
14583	4589	863	1683	1	2023-04-13	3	3.00	30.00	30.00	87.30	0.00
14584	4590	863	558	1	2022-05-28	7	5.00	380.00	450.00	2992.50	465.50
14585	4591	351	1281	2	2022-09-13	2	2.00	20.00	20.00	39.20	0.00
14586	4592	351	8	2	2022-06-17	2	4.00	270.00	300.00	576.00	57.60
14587	4593	351	1535	2	2023-08-03	3	3.00	130.00	150.00	436.50	58.20
14588	4594	351	1684	2	2022-09-30	2	2.00	10.00	10.00	19.60	0.00
14589	4595	351	216	2	2023-11-02	3	5.00	790.00	900.00	2565.00	313.50
14590	4596	351	647	2	2022-12-10	3	5.00	40.00	50.00	142.50	28.50
14591	4597	470	754	1	2022-05-16	8	2.00	20.00	30.00	235.20	78.40
14592	4598	577	516	2	2022-02-07	3	5.00	20.00	20.00	57.00	0.00
14593	4599	577	1550	2	2022-06-03	5	2.00	80.00	90.00	441.00	49.00
14594	4600	814	532	2	2023-01-23	1	3.00	130.00	150.00	145.50	19.40
14595	4601	814	374	2	2022-10-08	9	5.00	130.00	140.00	1197.00	85.50
14596	4602	814	1580	2	2022-01-12	4	2.00	10.00	10.00	39.20	0.00
14597	4603	864	1275	1	2023-09-02	1	5.00	20.00	20.00	19.00	0.00
14598	4604	864	1685	1	2023-02-23	4	3.00	140.00	150.00	582.00	38.80
14599	4605	864	662	1	2023-11-20	2	2.00	10.00	10.00	19.60	0.00
14600	4606	864	247	1	2023-07-11	7	4.00	160.00	170.00	1142.40	67.20
14601	4607	181	41	2	2022-09-25	1	3.00	40.00	50.00	48.50	9.70
14602	4608	181	519	2	2023-06-06	3	2.00	440.00	540.00	1587.60	294.00
14603	4609	181	537	2	2023-12-11	2	5.00	10.00	10.00	19.00	0.00
14604	4610	181	1331	2	2023-10-31	7	3.00	40.00	50.00	339.50	67.90
14605	4611	301	326	2	2023-10-03	8	5.00	50.00	50.00	380.00	0.00
14606	4612	720	461	1	2022-10-28	4	5.00	30.00	30.00	114.00	0.00
14607	4613	164	398	2	2023-12-15	3	2.00	40.00	50.00	147.00	29.40
14608	4614	164	708	2	2023-11-19	5	2.00	20.00	20.00	98.00	0.00
14609	4615	355	550	2	2022-04-10	3	5.00	50.00	60.00	171.00	28.50
14610	4616	355	1433	2	2022-04-23	9	3.00	20.00	30.00	261.90	87.30
14611	4617	515	202	1	2023-12-17	3	2.00	110.00	130.00	382.20	58.80
14612	4618	865	1539	2	2023-10-26	2	4.00	510.00	590.00	1132.80	153.60
14613	4619	865	324	2	2022-10-15	3	5.00	490.00	540.00	1539.00	142.50
14614	4620	381	307	5	2023-10-14	6	2.00	2560.00	2880.00	16934.40	1881.60
14615	4621	381	444	5	2023-08-01	3	5.00	80.00	90.00	256.50	28.50
14616	4622	866	178	1	2022-07-04	5	3.00	70.00	80.00	388.00	48.50
14617	4623	97	328	2	2022-04-16	3	4.00	10.00	10.00	28.80	0.00
14618	4624	97	448	2	2022-10-18	4	4.00	170.00	180.00	691.20	38.40
14619	4625	97	766	2	2022-02-08	2	2.00	210.00	260.00	509.60	98.00
14620	4626	97	326	2	2023-05-20	3	5.00	10.00	10.00	28.50	0.00
14621	4627	213	171	2	2023-10-17	5	5.00	70.00	80.00	380.00	47.50
14622	4628	213	254	2	2022-08-26	2	3.00	20.00	20.00	38.80	0.00
14623	4629	213	1474	2	2023-04-28	5	3.00	130.00	140.00	679.00	48.50
14624	4630	213	763	2	2023-03-09	3	5.00	40.00	40.00	114.00	0.00
14625	4631	867	1686	7	2022-02-02	2	3.00	20.00	20.00	38.80	0.00
14626	4632	37	489	1	2023-02-09	5	2.00	40.00	50.00	245.00	49.00
14627	4633	37	480	1	2023-07-14	3	4.00	100.00	120.00	345.60	57.60
14628	4634	60	1687	2	2022-10-27	6	5.00	470.00	590.00	3363.00	684.00
14629	4635	60	460	2	2022-03-10	1	5.00	60.00	80.00	76.00	19.00
14630	4636	60	460	2	2022-06-05	3	2.00	210.00	240.00	705.60	88.20
14631	4637	70	291	5	2023-10-25	4	2.00	100.00	120.00	470.40	78.40
14632	4638	70	106	5	2022-06-20	3	4.00	10.00	10.00	28.80	0.00
14633	4639	70	1560	5	2023-08-07	2	5.00	40.00	50.00	95.00	19.00
14634	4640	596	1688	2	2022-05-30	8	2.00	1410.00	1600.00	12544.00	1489.60
14635	4641	596	1476	2	2022-12-10	1	2.00	10.00	10.00	9.80	0.00
14636	4642	701	447	1	2022-02-04	4	5.00	0.00	0.00	0.00	0.00
14637	4643	701	1689	1	2022-02-09	4	5.00	510.00	580.00	2204.00	266.00
14638	4644	203	1407	2	2022-01-05	2	3.00	10.00	10.00	19.40	0.00
14639	4645	203	1492	2	2022-10-21	2	5.00	500.00	560.00	1064.00	114.00
14640	4646	304	406	2	2023-05-03	2	3.00	140.00	150.00	291.00	19.40
14641	4647	868	703	2	2022-05-23	3	5.00	10.00	10.00	28.50	0.00
14642	4648	44	1579	2	2023-12-06	3	3.00	340.00	430.00	1251.30	261.90
14643	4649	237	1690	2	2023-10-26	9	3.00	410.00	440.00	3841.20	261.90
14644	4650	237	506	2	2023-12-08	5	2.00	50.00	60.00	294.00	49.00
14645	4651	258	1185	2	2022-12-05	5	3.00	190.00	240.00	1164.00	242.50
14646	4652	258	1439	2	2023-08-05	4	3.00	160.00	200.00	776.00	155.20
14647	4653	869	1018	2	2022-10-06	2	3.00	10.00	10.00	19.40	0.00
14648	4654	869	1292	2	2023-01-29	5	3.00	140.00	170.00	824.50	145.50
14649	4655	152	1580	1	2023-05-27	1	4.00	0.00	0.00	0.00	0.00
14650	4656	870	87	2	2023-12-15	2	3.00	40.00	50.00	97.00	19.40
14651	4657	12	727	2	2022-08-06	2	2.00	50.00	60.00	117.60	19.60
14652	4658	12	668	2	2023-07-15	2	4.00	20.00	20.00	38.40	0.00
14653	4659	12	389	2	2023-09-07	2	3.00	10.00	10.00	19.40	0.00
14654	4660	12	190	2	2022-01-30	7	3.00	20.00	20.00	135.80	0.00
14655	4661	12	1691	2	2022-05-19	3	5.00	30.00	30.00	85.50	0.00
14656	4662	12	229	2	2022-01-19	6	3.00	720.00	840.00	4888.80	698.40
14657	4663	12	912	2	2022-10-28	3	3.00	70.00	80.00	232.80	29.10
14658	4664	164	548	2	2022-08-28	1	5.00	0.00	0.00	0.00	0.00
14659	4665	143	758	2	2022-03-18	9	2.00	10.00	10.00	88.20	0.00
14660	4666	143	323	2	2022-03-28	2	5.00	20.00	20.00	38.00	0.00
14661	4667	411	892	2	2022-09-15	4	4.00	70.00	80.00	307.20	38.40
14662	4668	411	344	2	2023-12-03	2	3.00	70.00	70.00	135.80	0.00
14663	4669	275	556	2	2022-08-04	10	2.00	10.00	10.00	98.00	0.00
14664	4670	275	420	2	2022-08-06	7	4.00	500.00	620.00	4166.40	806.40
14665	4671	275	1663	2	2023-09-02	5	3.00	700.00	770.00	3734.50	339.50
14666	4672	638	1153	2	2023-08-06	4	2.00	240.00	280.00	1097.60	156.80
14667	4673	638	560	2	2023-01-30	4	2.00	580.00	640.00	2508.80	235.20
14668	4674	638	1271	2	2023-11-17	1	3.00	110.00	120.00	116.40	9.70
14669	4675	638	270	2	2023-10-24	3	2.00	220.00	270.00	793.80	147.00
14670	4676	210	1442	1	2023-12-30	2	5.00	20.00	20.00	38.00	0.00
14671	4677	871	1340	2	2022-04-11	4	2.00	30.00	30.00	117.60	0.00
14672	4678	871	460	2	2023-10-22	1	3.00	70.00	80.00	77.60	9.70
14673	4679	871	1692	2	2022-08-24	12	2.00	70.00	80.00	940.80	117.60
14674	4680	871	684	2	2023-01-27	2	4.00	20.00	20.00	38.40	0.00
14675	4681	871	1562	2	2023-03-17	2	4.00	50.00	60.00	115.20	19.20
14676	4682	168	1322	1	2022-11-09	9	3.00	30.00	30.00	261.90	0.00
14677	4683	716	1212	7	2023-04-06	9	4.00	810.00	860.00	7430.40	432.00
14678	4684	86	1530	2	2023-04-13	4	3.00	230.00	240.00	931.20	38.80
14679	4685	86	1633	2	2023-07-06	4	2.00	140.00	160.00	627.20	78.40
14680	4686	86	700	2	2022-08-20	2	4.00	0.00	0.00	0.00	0.00
14681	4687	86	970	2	2023-10-13	7	3.00	10.00	10.00	67.90	0.00
14682	4688	517	1693	2	2023-03-10	9	3.00	390.00	440.00	3841.20	436.50
14683	4689	552	32	2	2023-07-10	5	4.00	10.00	10.00	48.00	0.00
14684	4690	138	1417	5	2022-07-23	2	2.00	50.00	50.00	98.00	0.00
14685	4691	138	247	5	2023-09-07	3	3.00	60.00	70.00	203.70	29.10
14686	4692	138	212	5	2023-07-24	3	2.00	210.00	240.00	705.60	88.20
14687	4693	138	448	5	2023-02-12	5	3.00	180.00	220.00	1067.00	194.00
14688	4694	138	1437	5	2023-11-29	2	4.00	10.00	10.00	19.20	0.00
14689	4695	638	778	7	2023-01-11	4	4.00	30.00	30.00	115.20	0.00
14690	4696	638	932	7	2022-03-27	3	5.00	260.00	300.00	855.00	114.00
14691	4697	638	1460	7	2022-03-17	2	4.00	130.00	140.00	268.80	19.20
14692	4698	638	164	7	2023-04-03	9	4.00	520.00	550.00	4752.00	259.20
14693	4699	638	1455	7	2023-11-22	3	5.00	200.00	210.00	598.50	28.50
14694	4700	662	1610	2	2023-11-29	2	5.00	10.00	10.00	19.00	0.00
14695	4701	662	244	2	2023-08-25	2	2.00	60.00	70.00	137.20	19.60
14696	4702	662	631	2	2023-11-19	2	3.00	10.00	10.00	19.40	0.00
14697	4703	662	297	2	2023-12-17	1	4.00	10.00	10.00	9.60	0.00
14698	4704	515	1113	2	2022-04-03	2	5.00	10.00	10.00	19.00	0.00
14699	4705	872	661	5	2022-03-16	7	5.00	60.00	70.00	465.50	66.50
14700	4706	872	149	5	2023-08-04	2	3.00	10.00	10.00	19.40	0.00
14701	4707	872	785	5	2022-05-05	4	2.00	140.00	170.00	666.40	117.60
14702	4708	14	1189	5	2022-01-03	5	5.00	840.00	900.00	4275.00	285.00
14703	4709	14	124	5	2022-09-27	3	3.00	120.00	130.00	378.30	29.10
14704	4710	14	810	5	2023-06-08	2	5.00	10.00	10.00	19.00	0.00
14705	4711	14	1197	5	2022-02-10	3	3.00	60.00	60.00	174.60	0.00
14706	4712	210	799	7	2022-03-18	1	4.00	0.00	0.00	0.00	0.00
14707	4713	648	816	2	2023-09-19	7	5.00	30.00	40.00	266.00	66.50
14708	4714	648	1455	2	2023-10-10	2	2.00	50.00	60.00	117.60	19.60
14709	4715	113	884	5	2023-10-04	2	3.00	280.00	340.00	659.60	116.40
14710	4716	157	1067	2	2023-01-22	2	4.00	190.00	200.00	384.00	19.20
14711	4717	246	972	1	2022-01-28	2	4.00	440.00	520.00	998.40	153.60
14712	4718	521	449	2	2023-06-07	3	2.00	10.00	10.00	29.40	0.00
14713	4719	142	512	5	2022-01-08	7	5.00	40.00	50.00	332.50	66.50
14714	4720	56	274	1	2023-12-24	7	2.00	890.00	950.00	6517.00	411.60
14715	4721	56	1694	1	2023-12-12	2	2.00	60.00	60.00	117.60	0.00
14716	4722	623	364	1	2022-12-13	3	5.00	220.00	270.00	769.50	142.50
14717	4723	551	774	2	2023-04-15	1	3.00	10.00	10.00	9.70	0.00
14718	4724	873	523	7	2022-03-17	3	5.00	10.00	10.00	28.50	0.00
14719	4725	874	92	2	2023-01-28	2	3.00	10.00	10.00	19.40	0.00
14720	4726	874	138	2	2022-06-08	3	5.00	540.00	670.00	1909.50	370.50
14721	4727	44	1363	1	2022-09-13	4	4.00	1050.00	1120.00	4300.80	268.80
14722	4728	44	1122	1	2023-04-18	3	3.00	220.00	280.00	814.80	174.60
14723	4729	152	716	2	2023-02-11	7	3.00	100.00	120.00	814.80	135.80
14724	4730	442	1695	1	2023-06-07	3	3.00	20.00	20.00	58.20	0.00
14725	4731	287	130	1	2023-04-19	6	2.00	180.00	210.00	1234.80	176.40
14726	4732	287	1129	1	2022-01-17	3	5.00	10.00	10.00	28.50	0.00
14727	4733	287	937	1	2023-01-23	3	2.00	40.00	50.00	147.00	29.40
14728	4734	287	1495	1	2023-02-24	3	2.00	20.00	20.00	58.80	0.00
14729	4735	49	2	2	2022-11-26	3	3.00	570.00	660.00	1920.60	261.90
14730	4736	875	926	2	2023-06-12	2	3.00	10.00	10.00	19.40	0.00
14731	4737	875	529	2	2023-03-05	2	5.00	20.00	30.00	57.00	19.00
14732	4738	875	152	2	2023-12-05	2	5.00	60.00	70.00	133.00	19.00
14733	4739	206	581	2	2023-09-23	2	3.00	50.00	60.00	116.40	19.40
14734	4740	206	973	2	2022-03-28	1	4.00	30.00	40.00	38.40	9.60
14735	4741	68	691	2	2022-11-23	2	3.00	10.00	10.00	19.40	0.00
14736	4742	68	1321	2	2023-06-02	3	5.00	10.00	10.00	28.50	0.00
14737	4743	68	661	2	2023-12-05	3	2.00	30.00	30.00	88.20	0.00
14738	4744	41	1433	7	2022-03-20	2	4.00	10.00	10.00	19.20	0.00
14739	4745	41	1126	7	2023-12-28	4	5.00	190.00	220.00	836.00	114.00
14740	4746	41	670	7	2022-01-11	2	4.00	110.00	130.00	249.60	38.40
14741	4747	41	800	7	2022-05-26	3	4.00	20.00	20.00	57.60	0.00
14742	4748	111	1567	7	2023-02-19	3	3.00	30.00	30.00	87.30	0.00
14743	4749	111	1531	7	2023-07-23	3	5.00	30.00	40.00	114.00	28.50
14744	4750	237	482	5	2022-01-04	5	4.00	30.00	30.00	144.00	0.00
14745	4751	876	1492	5	2023-06-19	3	5.00	720.00	840.00	2394.00	342.00
14746	4752	833	1050	2	2022-08-25	3	3.00	30.00	40.00	116.40	29.10
14747	4753	410	542	2	2023-02-14	2	5.00	190.00	210.00	399.00	38.00
14748	4754	132	1696	2	2023-02-09	4	4.00	20.00	20.00	76.80	0.00
14749	4755	143	626	2	2022-12-22	2	2.00	0.00	0.00	0.00	0.00
14750	4756	143	1697	2	2022-12-11	3	5.00	110.00	120.00	342.00	28.50
14751	4757	130	1311	2	2022-04-15	2	2.00	0.00	0.00	0.00	0.00
14752	4758	877	583	2	2022-02-02	7	3.00	40.00	40.00	271.60	0.00
14753	4759	31	470	2	2023-09-27	4	2.00	620.00	780.00	3057.60	627.20
14754	4760	31	998	2	2023-08-31	2	2.00	40.00	50.00	98.00	19.60
14755	4761	31	697	2	2023-05-02	2	4.00	10.00	10.00	19.20	0.00
14756	4762	51	1648	2	2022-10-22	2	3.00	10.00	10.00	19.40	0.00
14757	4763	51	1258	2	2022-12-16	2	5.00	10.00	10.00	19.00	0.00
14758	4764	878	1698	2	2023-06-05	3	2.00	150.00	180.00	529.20	88.20
14759	4765	152	925	5	2022-02-09	4	5.00	20.00	30.00	114.00	38.00
14760	4766	44	1063	2	2023-12-09	1	3.00	30.00	30.00	29.10	0.00
14761	4767	162	722	5	2022-03-07	5	3.00	100.00	110.00	533.50	48.50
14762	4768	162	1188	5	2023-12-15	3	5.00	310.00	360.00	1026.00	142.50
14763	4769	312	1589	7	2022-09-22	4	5.00	30.00	30.00	114.00	0.00
14764	4770	427	592	1	2023-02-18	3	2.00	10.00	10.00	29.40	0.00
14765	4771	427	1699	1	2023-12-07	3	4.00	10.00	10.00	28.80	0.00
14766	4772	879	40	1	2022-11-03	8	3.00	650.00	740.00	5742.40	698.40
14767	4773	101	1373	2	2023-07-14	1	3.00	10.00	10.00	9.70	0.00
14768	4774	101	746	2	2023-01-16	5	5.00	10.00	10.00	47.50	0.00
14769	4775	101	873	2	2022-04-05	2	4.00	180.00	220.00	422.40	76.80
14770	4776	880	810	2	2023-02-20	4	5.00	20.00	20.00	76.00	0.00
14771	4777	536	866	1	2023-05-03	3	2.00	10.00	10.00	29.40	0.00
14772	4778	536	1258	1	2023-10-18	3	3.00	20.00	30.00	87.30	29.10
14773	4779	436	337	2	2023-11-10	7	3.00	80.00	100.00	679.00	135.80
14774	4780	359	475	5	2022-05-11	1	5.00	50.00	60.00	57.00	9.50
14775	4781	35	1424	2	2023-02-25	4	3.00	580.00	680.00	2638.40	388.00
14776	4782	35	1700	2	2023-04-09	3	2.00	0.00	0.00	0.00	0.00
14777	4783	35	516	2	2023-06-24	7	5.00	40.00	40.00	266.00	0.00
14778	4784	804	965	2	2023-09-01	5	3.00	240.00	280.00	1358.00	194.00
14779	4785	388	1356	2	2023-09-24	5	3.00	10.00	10.00	48.50	0.00
14780	4786	388	1369	2	2022-12-05	4	3.00	70.00	70.00	271.60	0.00
14781	4787	388	825	2	2023-04-08	3	3.00	0.00	0.00	0.00	0.00
14782	4788	388	1701	2	2023-03-15	4	2.00	50.00	60.00	235.20	39.20
14783	4789	388	1028	2	2022-01-26	9	4.00	40.00	50.00	432.00	86.40
14784	4790	388	1002	2	2023-09-12	5	4.00	40.00	50.00	240.00	48.00
14785	4791	388	1343	2	2022-07-04	5	5.00	330.00	360.00	1710.00	142.50
14786	4792	388	779	2	2022-01-16	3	3.00	80.00	90.00	261.90	29.10
14787	4793	388	97	2	2023-11-03	3	5.00	20.00	30.00	85.50	28.50
14788	4794	383	911	2	2022-04-04	4	3.00	20.00	20.00	77.60	0.00
14789	4795	2	1619	2	2023-12-02	1	5.00	40.00	40.00	38.00	0.00
14790	4796	881	621	2	2022-09-06	3	2.00	10.00	10.00	29.40	0.00
14791	4797	251	1243	2	2022-04-30	3	2.00	50.00	60.00	176.40	29.40
14792	4798	251	1348	2	2023-04-04	6	3.00	20.00	30.00	174.60	58.20
14793	4799	251	1599	2	2022-04-11	3	4.00	30.00	30.00	86.40	0.00
14794	4800	251	48	2	2023-11-10	5	3.00	40.00	40.00	194.00	0.00
14795	4801	251	1702	2	2022-02-17	2	3.00	0.00	0.00	0.00	0.00
14796	4802	251	154	2	2022-07-11	2	3.00	10.00	10.00	19.40	0.00
14797	4803	251	79	2	2023-10-21	8	3.00	10.00	10.00	77.60	0.00
14798	4804	12	782	1	2023-11-25	1	4.00	40.00	40.00	38.40	0.00
14799	4805	12	1309	1	2023-12-21	9	3.00	70.00	90.00	785.70	174.60
14800	4806	204	641	1	2022-03-26	2	4.00	40.00	40.00	76.80	0.00
14801	4807	204	1451	1	2022-02-25	10	4.00	30.00	40.00	384.00	96.00
14802	4808	204	603	1	2023-09-05	3	5.00	30.00	30.00	85.50	0.00
14803	4809	325	1250	2	2023-10-29	3	4.00	50.00	60.00	172.80	28.80
14804	4810	882	1690	5	2023-09-17	4	4.00	180.00	200.00	768.00	76.80
14805	4811	882	1192	5	2022-06-09	2	2.00	200.00	240.00	470.40	78.40
14806	4812	71	324	1	2022-04-25	3	3.00	360.00	380.00	1105.80	58.20
14807	4813	71	362	1	2022-06-27	4	2.00	1080.00	1200.00	4704.00	470.40
14808	4814	71	1703	1	2023-05-04	3	5.00	50.00	50.00	142.50	0.00
14809	4815	27	151	5	2023-03-01	3	3.00	20.00	20.00	58.20	0.00
14810	4816	71	230	2	2022-01-30	3	2.00	20.00	20.00	58.80	0.00
14811	4817	71	1657	2	2022-10-02	2	3.00	20.00	30.00	58.20	19.40
14812	4818	71	544	2	2023-05-06	2	2.00	70.00	80.00	156.80	19.60
14813	4819	71	1044	2	2023-08-23	4	5.00	200.00	230.00	874.00	114.00
14814	4820	883	1500	2	2023-12-29	2	3.00	10.00	10.00	19.40	0.00
14815	4821	73	1365	2	2023-03-09	8	3.00	380.00	460.00	3569.60	620.80
14816	4822	73	658	2	2022-06-06	6	3.00	340.00	380.00	2211.60	232.80
14817	4823	884	445	7	2023-11-23	6	3.00	30.00	40.00	232.80	58.20
14818	4824	51	1704	2	2022-07-11	7	5.00	30.00	30.00	199.50	0.00
14819	4825	51	164	2	2023-08-16	3	5.00	120.00	130.00	370.50	28.50
14820	4826	51	1417	2	2022-01-05	3	3.00	70.00	80.00	232.80	29.10
14821	4827	2	237	5	2023-05-02	4	2.00	10.00	10.00	39.20	0.00
14822	4828	155	1157	2	2023-02-06	2	3.00	70.00	70.00	135.80	0.00
14823	4829	155	869	2	2022-08-26	3	2.00	10.00	10.00	29.40	0.00
14824	4830	134	1213	2	2022-07-11	3	4.00	10.00	10.00	28.80	0.00
14825	4831	885	1361	2	2023-07-11	6	3.00	210.00	250.00	1455.00	232.80
14826	4832	885	763	2	2023-04-02	3	4.00	40.00	40.00	115.20	0.00
14827	4833	885	1012	2	2022-05-27	2	2.00	20.00	20.00	39.20	0.00
14828	4834	885	926	2	2022-10-02	3	5.00	10.00	10.00	28.50	0.00
14829	4835	258	1231	2	2022-07-19	5	2.00	30.00	40.00	196.00	49.00
14830	4836	258	1324	2	2023-05-01	2	3.00	50.00	60.00	116.40	19.40
14831	4837	258	800	2	2022-12-28	4	5.00	20.00	20.00	76.00	0.00
14832	4838	95	859	5	2022-10-18	2	2.00	0.00	0.00	0.00	0.00
14833	4839	95	875	5	2022-04-10	6	2.00	30.00	30.00	176.40	0.00
14834	4840	95	195	5	2022-08-30	4	5.00	140.00	160.00	608.00	76.00
14835	4841	694	94	2	2023-04-15	2	2.00	30.00	30.00	58.80	0.00
14836	4842	602	1489	2	2023-02-27	3	2.00	10.00	10.00	29.40	0.00
14837	4843	33	887	2	2023-09-23	5	5.00	200.00	240.00	1140.00	190.00
14838	4844	356	1029	5	2023-01-03	4	5.00	10.00	10.00	38.00	0.00
14839	4845	177	308	5	2022-05-08	2	4.00	10.00	10.00	19.20	0.00
14840	4846	181	237	1	2022-03-09	3	5.00	10.00	10.00	28.50	0.00
14841	4847	886	804	1	2023-01-22	5	4.00	220.00	260.00	1248.00	192.00
14842	4848	886	360	1	2022-10-18	11	3.00	70.00	70.00	746.90	0.00
14843	4849	886	1133	1	2023-11-30	1	5.00	10.00	10.00	9.50	0.00
14844	4850	887	426	2	2023-10-10	2	3.00	10.00	10.00	19.40	0.00
14845	4851	887	2	2	2023-01-01	5	2.00	860.00	980.00	4802.00	588.00
14846	4852	887	109	2	2023-01-03	8	2.00	270.00	300.00	2352.00	235.20
14847	4853	887	460	2	2023-09-03	6	4.00	470.00	490.00	2822.40	115.20
14848	4854	454	1007	1	2022-06-14	3	4.00	10.00	10.00	28.80	0.00
14849	4855	454	384	1	2023-07-08	3	5.00	10.00	10.00	28.50	0.00
14850	4856	454	51	1	2022-11-10	3	2.00	10.00	10.00	29.40	0.00
14851	4857	27	706	2	2023-03-10	3	4.00	60.00	70.00	201.60	28.80
14852	4858	27	276	2	2022-04-03	4	3.00	60.00	80.00	310.40	77.60
14853	4859	27	1705	2	2022-05-26	9	4.00	390.00	460.00	3974.40	604.80
14854	4860	888	1064	2	2022-03-13	7	4.00	10.00	10.00	67.20	0.00
14855	4861	889	1177	2	2023-02-09	2	5.00	1490.00	1790.00	3401.00	570.00
14856	4862	662	1357	1	2023-07-15	6	2.00	670.00	760.00	4468.80	529.20
14857	4863	213	987	2	2023-09-20	1	5.00	20.00	20.00	19.00	0.00
14858	4864	213	351	2	2023-12-28	3	3.00	40.00	50.00	145.50	29.10
14859	4865	104	517	2	2022-09-04	3	2.00	190.00	240.00	705.60	147.00
14860	4866	6	446	2	2022-09-28	6	4.00	2260.00	2400.00	13824.00	806.40
14861	4867	6	1243	2	2022-07-07	11	3.00	500.00	560.00	5975.20	640.20
14862	4868	6	157	2	2022-11-12	3	5.00	310.00	340.00	969.00	85.50
14863	4869	6	746	2	2023-12-23	3	4.00	10.00	10.00	28.80	0.00
14864	4870	281	930	2	2022-09-27	2	5.00	80.00	90.00	171.00	19.00
14865	4871	281	1128	2	2023-06-09	7	5.00	220.00	230.00	1529.50	66.50
14866	4872	141	1706	2	2023-01-17	2	3.00	0.00	0.00	0.00	0.00
14867	4873	141	1550	2	2022-12-06	5	5.00	20.00	20.00	95.00	0.00
14868	4874	141	1513	2	2022-06-06	3	4.00	50.00	50.00	144.00	0.00
14869	4875	141	306	2	2022-02-19	1	4.00	0.00	0.00	0.00	0.00
14870	4876	57	539	2	2022-02-05	5	3.00	110.00	120.00	582.00	48.50
14871	4877	890	1425	2	2022-12-10	2	2.00	60.00	60.00	117.60	0.00
14872	4878	890	680	2	2023-06-23	3	5.00	10.00	10.00	28.50	0.00
14873	4879	891	1700	5	2022-09-23	3	4.00	0.00	0.00	0.00	0.00
14874	4880	571	1511	1	2022-04-20	2	2.00	10.00	10.00	19.60	0.00
14875	4881	571	2	1	2022-06-24	4	5.00	850.00	980.00	3724.00	494.00
14876	4882	571	1288	1	2022-10-28	9	5.00	1870.00	2250.00	19237.50	3249.00
14877	4883	571	356	1	2022-08-16	4	2.00	50.00	60.00	235.20	39.20
14878	4884	646	1637	2	2022-09-25	5	4.00	140.00	170.00	816.00	144.00
14879	4885	646	1643	2	2022-08-02	2	2.00	0.00	0.00	0.00	0.00
14880	4886	96	1139	2	2023-03-26	5	5.00	100.00	110.00	522.50	47.50
14881	4887	892	213	1	2022-02-23	3	4.00	160.00	180.00	518.40	57.60
14882	4888	892	659	1	2023-03-13	6	4.00	90.00	100.00	576.00	57.60
14883	4889	892	459	1	2023-01-31	3	4.00	990.00	1130.00	3254.40	403.20
14884	4890	892	1673	1	2023-03-17	6	2.00	1070.00	1260.00	7408.80	1117.20
14885	4891	237	455	2	2022-05-11	3	5.00	10.00	10.00	28.50	0.00
14886	4892	237	1238	2	2023-03-15	2	4.00	40.00	40.00	76.80	0.00
14887	4893	237	1707	2	2023-03-11	2	5.00	0.00	0.00	0.00	0.00
14888	4894	237	419	2	2023-03-05	2	2.00	210.00	230.00	450.80	39.20
14889	4895	237	137	2	2023-11-06	1	5.00	50.00	50.00	47.50	0.00
14890	4896	237	1504	2	2022-12-14	2	3.00	50.00	60.00	116.40	19.40
14891	4897	237	1363	2	2023-05-31	4	4.00	930.00	1120.00	4300.80	729.60
14892	4898	398	1402	5	2023-03-04	2	2.00	150.00	180.00	352.80	58.80
14893	4899	398	389	5	2023-07-27	2	4.00	10.00	10.00	19.20	0.00
14894	4900	682	1046	2	2022-11-01	8	5.00	20.00	30.00	228.00	76.00
14895	4901	200	773	2	2023-07-27	4	2.00	410.00	480.00	1881.60	274.40
14896	4902	200	1353	2	2022-09-22	1	3.00	10.00	10.00	9.70	0.00
14897	4903	134	807	2	2023-02-15	6	2.00	20.00	30.00	176.40	58.80
14898	4904	134	581	2	2023-10-02	3	3.00	80.00	90.00	261.90	29.10
14899	4905	165	624	1	2023-05-29	3	3.00	570.00	670.00	1949.70	291.00
14900	4906	893	1548	1	2023-12-07	4	4.00	20.00	20.00	76.80	0.00
14901	4907	893	399	1	2023-08-11	5	2.00	240.00	270.00	1323.00	147.00
14902	4908	478	1182	1	2023-01-22	8	4.00	10.00	10.00	76.80	0.00
14903	4909	478	1708	1	2023-01-04	2	3.00	10.00	10.00	19.40	0.00
14904	4910	506	589	2	2023-09-22	3	3.00	20.00	20.00	58.20	0.00
14905	4911	506	713	2	2023-10-18	7	3.00	40.00	40.00	271.60	0.00
14906	4912	506	432	2	2023-02-09	2	4.00	90.00	110.00	211.20	38.40
14907	4913	506	1407	2	2023-07-25	5	5.00	10.00	10.00	47.50	0.00
14908	4914	506	808	2	2022-05-27	2	3.00	0.00	0.00	0.00	0.00
14909	4915	203	31	1	2023-09-15	2	4.00	40.00	40.00	76.80	0.00
14910	4916	203	800	1	2023-09-25	3	4.00	10.00	10.00	28.80	0.00
14911	4917	894	370	1	2022-09-25	7	3.00	60.00	70.00	475.30	67.90
14912	4918	894	1709	1	2023-04-20	3	5.00	220.00	250.00	712.50	85.50
14913	4919	895	267	2	2022-08-23	3	4.00	160.00	170.00	489.60	28.80
14914	4920	895	1134	2	2022-09-18	2	3.00	190.00	230.00	446.20	77.60
14915	4921	194	1213	2	2023-12-29	2	2.00	0.00	0.00	0.00	0.00
14916	4922	896	1697	1	2022-12-21	2	3.00	100.00	100.00	194.00	0.00
14917	4923	896	805	1	2022-01-07	2	3.00	0.00	0.00	0.00	0.00
14918	4924	896	922	1	2023-06-10	6	3.00	540.00	630.00	3666.60	523.80
14919	4925	896	1410	1	2022-10-14	2	2.00	70.00	90.00	176.40	39.20
14920	4926	158	1454	5	2023-08-24	2	5.00	10.00	10.00	19.00	0.00
14921	4927	118	963	2	2022-01-09	1	5.00	70.00	90.00	85.50	19.00
14922	4928	897	1194	2	2022-02-21	3	5.00	20.00	20.00	57.00	0.00
14923	4929	897	1181	2	2023-03-16	3	5.00	810.00	900.00	2565.00	256.50
14924	4930	31	333	5	2022-02-09	5	3.00	50.00	60.00	291.00	48.50
14925	4931	31	812	5	2022-03-08	3	4.00	10.00	10.00	28.80	0.00
14926	4932	237	1176	2	2023-11-23	2	4.00	20.00	20.00	38.40	0.00
14927	4933	46	1359	2	2022-09-09	1	4.00	10.00	10.00	9.60	0.00
14928	4934	46	752	2	2022-04-15	2	4.00	0.00	0.00	0.00	0.00
14929	4935	46	1015	2	2022-05-27	3	5.00	0.00	0.00	0.00	0.00
14930	4936	898	1710	2	2022-06-24	3	2.00	20.00	20.00	58.80	0.00
14931	4937	899	545	2	2023-08-29	7	2.00	20.00	30.00	205.80	68.60
14932	4938	10	1245	2	2023-09-10	5	2.00	1220.00	1330.00	6517.00	539.00
14933	4939	10	1220	2	2022-11-23	3	2.00	310.00	330.00	970.20	58.80
14934	4940	10	182	2	2023-06-19	5	5.00	20.00	20.00	95.00	0.00
14935	4941	53	902	2	2023-02-08	9	2.00	1160.00	1270.00	11201.40	970.20
14936	4942	53	1532	2	2022-04-21	4	2.00	220.00	280.00	1097.60	235.20
14937	4943	53	889	2	2023-03-29	2	2.00	10.00	10.00	19.60	0.00
14938	4944	573	459	2	2022-12-28	1	2.00	320.00	380.00	372.40	58.80
14939	4945	900	1697	5	2023-05-28	2	5.00	90.00	100.00	190.00	19.00
14940	4946	900	348	5	2022-06-14	2	5.00	10.00	10.00	19.00	0.00
14941	4947	900	53	5	2022-11-24	2	3.00	0.00	0.00	0.00	0.00
14942	4948	68	149	2	2022-04-03	4	2.00	30.00	30.00	117.60	0.00
14943	4949	70	543	2	2023-03-09	7	5.00	100.00	120.00	798.00	133.00
14944	4950	70	546	2	2023-11-29	3	4.00	20.00	20.00	57.60	0.00
14945	4951	31	155	1	2023-06-25	3	3.00	10.00	10.00	29.10	0.00
14946	4952	353	89	2	2022-11-20	2	2.00	10.00	10.00	19.60	0.00
14947	4953	142	1711	1	2023-08-20	1	4.00	60.00	70.00	67.20	9.60
14948	4954	253	1301	2	2022-04-18	2	3.00	80.00	90.00	174.60	19.40
14949	4955	443	680	1	2022-06-10	7	2.00	20.00	20.00	137.20	0.00
14950	4956	443	955	1	2022-05-01	3	5.00	70.00	80.00	228.00	28.50
14951	4957	443	1457	1	2022-01-31	2	4.00	30.00	40.00	76.80	19.20
14952	4958	433	1376	2	2022-03-29	2	2.00	0.00	0.00	0.00	0.00
14953	4959	433	1712	2	2022-08-16	9	2.00	20.00	20.00	176.40	0.00
14954	4960	329	1082	2	2023-03-09	1	3.00	50.00	60.00	58.20	9.70
14955	4961	329	1528	2	2023-08-07	1	2.00	60.00	70.00	68.60	9.80
14956	4962	6	213	5	2022-08-08	1	3.00	40.00	50.00	48.50	9.70
14957	4963	6	251	5	2023-06-06	3	5.00	20.00	20.00	57.00	0.00
14958	4964	6	872	5	2023-08-27	3	4.00	210.00	240.00	691.20	86.40
14959	4965	3	626	1	2023-04-14	4	5.00	10.00	10.00	38.00	0.00
14960	4966	789	1286	1	2023-01-01	4	2.00	430.00	470.00	1842.40	156.80
14961	4967	509	1301	1	2022-09-24	3	2.00	110.00	130.00	382.20	58.80
14962	4968	509	795	1	2022-08-30	2	4.00	10.00	10.00	19.20	0.00
14963	4969	509	410	1	2023-11-19	2	5.00	190.00	200.00	380.00	19.00
14964	4970	509	914	1	2022-09-25	1	3.00	100.00	110.00	106.70	9.70
14965	4971	251	71	5	2023-02-23	2	4.00	170.00	210.00	403.20	76.80
14966	4972	251	1438	5	2023-12-22	2	5.00	40.00	40.00	76.00	0.00
14967	4973	251	643	5	2022-11-01	2	3.00	30.00	40.00	77.60	19.40
14968	4974	251	418	5	2022-01-15	2	3.00	70.00	90.00	174.60	38.80
14969	4975	901	1409	2	2023-09-06	2	2.00	10.00	10.00	19.60	0.00
14970	4976	251	770	1	2023-06-17	9	2.00	630.00	720.00	6350.40	793.80
14971	4977	104	881	5	2023-06-11	5	3.00	20.00	20.00	97.00	0.00
14972	4978	104	808	5	2022-07-07	2	5.00	10.00	10.00	19.00	0.00
14973	4979	104	958	5	2022-09-01	6	4.00	700.00	770.00	4435.20	403.20
14974	4980	322	1258	1	2023-06-19	3	4.00	20.00	20.00	57.60	0.00
14975	4981	322	931	1	2023-07-06	2	3.00	0.00	0.00	0.00	0.00
14976	4982	322	1629	1	2023-10-02	4	3.00	20.00	20.00	77.60	0.00
14977	4983	479	710	2	2022-07-03	2	4.00	10.00	10.00	19.20	0.00
14978	4984	287	87	1	2023-07-02	3	4.00	70.00	80.00	230.40	28.80
14979	4985	902	805	2	2023-08-26	5	3.00	10.00	10.00	48.50	0.00
14980	4986	31	783	7	2022-03-26	5	4.00	10.00	10.00	48.00	0.00
14981	4987	787	491	2	2023-09-02	3	5.00	20.00	20.00	57.00	0.00
14982	4988	787	158	2	2022-12-07	6	3.00	1080.00	1330.00	7740.60	1455.00
14983	4989	787	1500	2	2022-04-25	2	5.00	0.00	0.00	0.00	0.00
14984	4990	258	758	2	2023-03-13	3	2.00	10.00	10.00	29.40	0.00
14985	4991	258	884	2	2022-05-11	4	4.00	590.00	690.00	2649.60	384.00
14986	4992	199	1626	2	2022-08-09	5	5.00	1630.00	1890.00	8977.50	1235.00
14987	4993	903	756	2	2023-11-27	8	3.00	60.00	60.00	465.60	0.00
14988	4994	903	1241	2	2023-04-09	8	3.00	20.00	20.00	155.20	0.00
14989	4995	903	535	2	2022-10-30	5	3.00	20.00	20.00	97.00	0.00
14990	4996	304	1527	2	2022-02-14	4	3.00	40.00	50.00	194.00	38.80
14991	4997	904	1713	2	2023-01-05	1	3.00	40.00	50.00	48.50	9.70
14992	4998	904	635	2	2022-10-01	4	4.00	10.00	10.00	38.40	0.00
14993	4999	179	1547	2	2023-05-27	1	3.00	100.00	110.00	106.70	9.70
14994	5000	179	1714	2	2022-01-10	5	3.00	50.00	60.00	291.00	48.50
14995	5001	56	1106	2	2023-01-02	1	2.00	70.00	80.00	78.40	9.80
14996	5002	905	1206	7	2023-05-02	5	3.00	60.00	70.00	339.50	48.50
14997	5003	905	137	7	2023-09-22	4	4.00	150.00	190.00	729.60	153.60
14998	5004	4	1715	2	2023-01-10	2	3.00	10.00	10.00	19.40	0.00
14999	5005	159	1366	1	2022-03-10	3	2.00	50.00	50.00	147.00	0.00
15000	5006	813	385	1	2023-10-29	5	5.00	610.00	710.00	3372.50	475.00
15001	5007	82	1716	2	2022-02-28	2	5.00	1930.00	2320.00	4408.00	741.00
15002	5008	82	1199	2	2023-12-11	3	4.00	20.00	20.00	57.60	0.00
15003	5009	325	133	2	2023-05-23	1	3.00	10.00	10.00	9.70	0.00
15004	5010	325	421	2	2023-04-17	6	5.00	750.00	790.00	4503.00	228.00
15005	5011	325	521	2	2022-02-07	3	4.00	0.00	0.00	0.00	0.00
15006	5012	762	900	5	2022-10-21	7	5.00	190.00	210.00	1396.50	133.00
15007	5013	906	444	2	2022-06-23	3	4.00	30.00	30.00	86.40	0.00
15008	5014	906	1717	2	2022-10-25	7	3.00	200.00	220.00	1493.80	135.80
15009	5015	906	1718	2	2023-07-03	6	3.00	190.00	210.00	1222.20	116.40
15010	5016	296	192	2	2022-08-21	7	2.00	30.00	40.00	274.40	68.60
15011	5017	296	1719	2	2022-04-16	4	5.00	1250.00	1500.00	5700.00	950.00
15012	5018	204	225	5	2023-07-18	3	2.00	10.00	10.00	29.40	0.00
15013	5019	204	218	5	2023-09-04	3	2.00	640.00	770.00	2263.80	382.20
15014	5020	204	683	5	2022-04-20	2	5.00	20.00	20.00	38.00	0.00
15015	5021	213	414	1	2022-01-12	3	3.00	330.00	350.00	1018.50	58.20
15016	5022	103	478	2	2022-06-07	2	4.00	60.00	70.00	134.40	19.20
15017	5023	103	218	2	2023-03-17	3	2.00	690.00	770.00	2263.80	235.20
15018	5024	103	1612	2	2022-03-01	4	2.00	30.00	40.00	156.80	39.20
15019	5025	500	1596	2	2022-08-22	2	3.00	30.00	30.00	58.20	0.00
15020	5026	500	349	2	2023-12-06	3	3.00	390.00	460.00	1338.60	203.70
15021	5027	500	15	2	2023-04-06	2	2.00	120.00	140.00	274.40	39.20
15022	5028	500	1720	2	2023-08-19	3	2.00	280.00	300.00	882.00	58.80
15023	5029	194	591	1	2023-06-07	3	2.00	210.00	240.00	705.60	88.20
15024	5030	10	1478	2	2022-05-17	3	4.00	10.00	10.00	28.80	0.00
15025	5031	10	1258	2	2023-01-02	1	4.00	10.00	10.00	9.60	0.00
15026	5032	10	441	2	2023-03-31	8	3.00	110.00	120.00	931.20	77.60
15027	5033	907	57	2	2023-01-17	3	4.00	180.00	210.00	604.80	86.40
15028	5034	907	1277	2	2023-06-14	1	2.00	30.00	30.00	29.40	0.00
15029	5035	577	1658	1	2023-07-27	5	5.00	610.00	690.00	3277.50	380.00
15030	5036	411	563	2	2023-01-27	3	3.00	530.00	650.00	1891.50	349.20
15031	5037	411	659	2	2023-01-10	2	4.00	30.00	30.00	57.60	0.00
15032	5038	908	604	1	2023-08-20	5	3.00	220.00	240.00	1164.00	97.00
15033	5039	866	720	5	2023-10-12	4	4.00	190.00	200.00	768.00	38.40
15034	5040	866	1119	5	2022-09-23	2	2.00	680.00	720.00	1411.20	78.40
15035	5041	866	352	5	2023-10-11	7	5.00	200.00	220.00	1463.00	133.00
15036	5042	234	1438	1	2022-11-03	3	3.00	60.00	70.00	203.70	29.10
15037	5043	234	792	1	2022-10-04	4	5.00	120.00	130.00	494.00	38.00
15038	5044	234	690	1	2022-09-22	9	4.00	410.00	470.00	4060.80	518.40
15039	5045	234	1636	1	2023-11-22	5	2.00	50.00	60.00	294.00	49.00
15040	5046	234	735	1	2022-03-21	4	3.00	680.00	720.00	2793.60	155.20
15041	5047	234	871	1	2022-04-03	3	2.00	10.00	10.00	29.40	0.00
15042	5048	234	1631	1	2023-07-27	5	2.00	10.00	10.00	49.00	0.00
15043	5049	101	700	2	2023-06-30	7	5.00	10.00	10.00	66.50	0.00
15044	5050	101	649	2	2022-02-02	2	2.00	80.00	80.00	156.80	0.00
15045	5051	909	1287	2	2022-09-01	2	3.00	20.00	20.00	38.80	0.00
15046	5052	59	374	2	2022-03-28	2	3.00	20.00	20.00	38.80	0.00
15047	5053	185	1159	7	2022-05-21	4	4.00	180.00	200.00	768.00	76.80
15048	5054	442	770	1	2023-10-14	5	2.00	360.00	400.00	1960.00	196.00
15049	5055	442	455	1	2023-01-03	3	3.00	10.00	10.00	29.10	0.00
15050	5056	442	588	1	2023-06-22	9	3.00	1170.00	1350.00	11785.50	1571.40
15051	5057	910	1611	5	2023-12-27	5	5.00	30.00	30.00	142.50	0.00
15052	5058	910	701	5	2023-10-20	6	3.00	40.00	40.00	232.80	0.00
15053	5059	12	806	2	2022-08-06	9	2.00	80.00	100.00	882.00	176.40
15054	5060	911	755	1	2023-10-28	2	2.00	600.00	700.00	1372.00	196.00
15055	5061	911	392	1	2023-11-03	9	4.00	530.00	580.00	5011.20	432.00
15056	5062	42	716	2	2022-03-29	2	3.00	40.00	40.00	77.60	0.00
15057	5063	42	1067	2	2022-10-07	3	2.00	310.00	380.00	1117.20	205.80
15058	5064	42	480	2	2022-01-09	3	5.00	100.00	120.00	342.00	57.00
15059	5065	53	35	5	2023-01-17	2	3.00	350.00	390.00	756.60	77.60
15060	5066	320	266	2	2022-01-06	3	3.00	350.00	380.00	1105.80	87.30
15061	5067	320	412	2	2022-10-13	7	2.00	1510.00	1780.00	12210.80	1852.20
15062	5068	329	1047	2	2022-03-24	5	5.00	20.00	20.00	95.00	0.00
15063	5069	912	1573	2	2022-09-13	1	3.00	500.00	550.00	533.50	48.50
15064	5070	912	1095	2	2022-06-08	3	5.00	150.00	170.00	484.50	57.00
15065	5071	912	119	2	2022-07-20	3	3.00	40.00	40.00	116.40	0.00
15066	5072	912	1105	2	2023-08-19	6	3.00	50.00	50.00	291.00	0.00
15067	5073	912	1522	2	2023-05-28	2	3.00	270.00	300.00	582.00	58.20
15068	5074	10	954	7	2022-10-21	4	3.00	50.00	60.00	232.80	38.80
15069	5075	14	531	1	2022-07-18	2	2.00	10.00	10.00	19.60	0.00
15070	5076	35	215	1	2022-11-10	5	2.00	610.00	740.00	3626.00	637.00
15071	5077	35	603	1	2023-05-31	5	5.00	30.00	40.00	190.00	47.50
15072	5078	35	1667	1	2023-01-30	2	5.00	380.00	400.00	760.00	38.00
15073	5079	577	526	2	2022-07-13	3	5.00	20.00	20.00	57.00	0.00
15074	5080	37	1249	2	2022-05-17	3	2.00	300.00	360.00	1058.40	176.40
15075	5081	37	471	2	2022-01-14	1	5.00	10.00	10.00	9.50	0.00
15076	5082	906	491	7	2023-03-28	4	5.00	20.00	20.00	76.00	0.00
15077	5083	913	917	2	2023-07-24	4	2.00	30.00	40.00	156.80	39.20
15078	5084	913	983	2	2023-12-05	3	5.00	50.00	60.00	171.00	28.50
15079	5085	626	780	1	2022-08-23	4	3.00	100.00	110.00	426.80	38.80
15080	5086	541	498	2	2023-05-02	2	5.00	10.00	10.00	19.00	0.00
15081	5087	86	1721	2	2023-12-01	7	4.00	390.00	470.00	3158.40	537.60
15082	5088	86	554	2	2022-04-30	1	4.00	10.00	10.00	9.60	0.00
15083	5089	86	799	2	2023-07-03	3	2.00	0.00	0.00	0.00	0.00
15084	5090	914	1384	5	2023-04-07	2	2.00	10.00	10.00	19.60	0.00
15085	5091	914	599	5	2023-03-24	1	5.00	10.00	10.00	9.50	0.00
15086	5092	915	243	2	2023-04-06	3	3.00	0.00	0.00	0.00	0.00
15087	5093	916	457	2	2022-11-10	3	2.00	50.00	50.00	147.00	0.00
15088	5094	101	1298	2	2022-06-16	4	2.00	10.00	10.00	39.20	0.00
15089	5095	101	839	2	2023-07-19	5	5.00	170.00	210.00	997.50	190.00
15090	5096	101	851	2	2022-12-15	4	4.00	30.00	40.00	153.60	38.40
15091	5097	101	1105	2	2023-11-25	3	3.00	10.00	10.00	29.10	0.00
15092	5098	101	1024	2	2022-03-08	2	2.00	0.00	0.00	0.00	0.00
15093	5099	101	211	2	2022-03-26	2	3.00	30.00	40.00	77.60	19.40
15094	5100	751	417	2	2023-09-05	3	4.00	20.00	20.00	57.60	0.00
15095	5101	442	325	7	2023-10-19	2	3.00	0.00	0.00	0.00	0.00
15096	5102	442	728	7	2022-09-10	1	5.00	10.00	10.00	9.50	0.00
15097	5103	442	13	7	2022-05-03	3	3.00	20.00	20.00	58.20	0.00
15098	5104	12	145	1	2022-07-12	6	5.00	40.00	40.00	228.00	0.00
15099	5105	12	61	1	2023-12-11	3	2.00	20.00	20.00	58.80	0.00
15100	5106	917	1341	2	2023-05-14	4	4.00	170.00	190.00	729.60	76.80
15101	5107	135	1351	2	2023-01-15	4	2.00	70.00	70.00	274.40	0.00
15102	5108	823	513	5	2022-02-11	9	5.00	30.00	40.00	342.00	85.50
15103	5109	823	208	5	2023-09-13	5	4.00	70.00	70.00	336.00	0.00
15104	5110	325	467	2	2023-02-24	6	4.00	50.00	50.00	288.00	0.00
15105	5111	325	42	2	2023-12-23	6	2.00	170.00	190.00	1117.20	117.60
15106	5112	325	1408	2	2023-08-31	4	2.00	10.00	10.00	39.20	0.00
15107	5113	101	1722	7	2023-05-19	9	5.00	20.00	20.00	171.00	0.00
15108	5114	89	1308	1	2022-04-10	3	4.00	20.00	20.00	57.60	0.00
15109	5115	72	308	2	2022-07-11	3	5.00	10.00	10.00	28.50	0.00
15110	5116	71	1723	2	2023-02-25	1	2.00	0.00	0.00	0.00	0.00
15111	5117	31	1033	2	2023-09-04	1	3.00	30.00	40.00	38.80	9.70
15112	5118	245	272	2	2023-04-18	3	5.00	20.00	30.00	85.50	28.50
15113	5119	245	1549	2	2023-10-09	7	4.00	570.00	630.00	4233.60	403.20
15114	5120	245	1046	2	2022-02-10	9	4.00	80.00	80.00	691.20	0.00
15115	5121	918	244	2	2023-06-16	5	5.00	210.00	230.00	1092.50	95.00
15116	5122	918	1136	2	2023-08-17	2	3.00	90.00	100.00	194.00	19.40
15117	5123	918	1724	2	2023-11-04	3	3.00	20.00	20.00	58.20	0.00
15118	5124	918	728	2	2022-04-02	2	4.00	10.00	10.00	19.20	0.00
15119	5125	31	978	7	2023-07-14	9	5.00	370.00	460.00	3933.00	769.50
15120	5126	31	707	7	2022-09-24	7	5.00	60.00	70.00	465.50	66.50
15121	5127	31	815	7	2023-02-14	4	4.00	2300.00	2800.00	10752.00	1920.00
15122	5128	31	228	7	2023-07-18	2	3.00	500.00	600.00	1164.00	194.00
15123	5129	31	1260	7	2022-04-23	1	3.00	20.00	20.00	19.40	0.00
15124	5130	31	1486	7	2023-11-22	3	4.00	260.00	290.00	835.20	86.40
15125	5131	31	1464	7	2023-08-26	9	5.00	30.00	40.00	342.00	85.50
15126	5132	200	1309	2	2022-12-07	8	3.00	90.00	100.00	776.00	77.60
15127	5133	917	818	2	2022-04-19	3	2.00	90.00	110.00	323.40	58.80
15128	5134	44	1613	2	2022-12-14	7	4.00	50.00	60.00	403.20	67.20
15129	5135	44	706	2	2023-08-16	4	4.00	80.00	90.00	345.60	38.40
15130	5136	551	264	2	2022-10-28	5	4.00	20.00	20.00	96.00	0.00
15131	5137	287	882	2	2023-06-10	2	5.00	10.00	10.00	19.00	0.00
15132	5138	919	561	2	2023-03-12	4	2.00	30.00	30.00	117.60	0.00
15133	5139	812	838	2	2023-09-30	3	2.00	20.00	20.00	58.80	0.00
15134	5140	812	1541	2	2022-10-13	5	5.00	40.00	50.00	237.50	47.50
15135	5141	10	260	2	2023-05-12	2	3.00	110.00	120.00	232.80	19.40
15136	5142	31	2	2	2022-04-15	6	5.00	1250.00	1320.00	7524.00	399.00
15137	5143	31	1445	2	2023-11-24	8	2.00	50.00	60.00	470.40	78.40
15138	5144	31	308	2	2022-04-18	1	5.00	0.00	0.00	0.00	0.00
15139	5145	70	485	2	2022-05-07	2	2.00	90.00	90.00	176.40	0.00
15140	5146	70	1157	2	2023-10-21	4	3.00	110.00	140.00	543.20	116.40
15141	5147	70	1268	2	2022-02-15	4	5.00	40.00	50.00	190.00	38.00
15142	5148	920	1566	2	2022-10-04	4	5.00	10.00	10.00	38.00	0.00
15143	5149	920	655	2	2023-12-10	3	5.00	730.00	840.00	2394.00	313.50
15144	5150	365	1247	7	2023-11-12	3	2.00	970.00	1210.00	3557.40	705.60
15145	5151	142	299	1	2022-01-22	2	5.00	60.00	70.00	133.00	19.00
15146	5152	921	862	5	2023-05-10	5	4.00	30.00	40.00	192.00	48.00
15147	5153	383	473	2	2022-08-24	1	4.00	0.00	0.00	0.00	0.00
15148	5154	383	209	2	2023-11-22	3	4.00	10.00	10.00	28.80	0.00
15149	5155	922	21	5	2022-08-29	4	5.00	30.00	30.00	114.00	0.00
15150	5156	922	1461	5	2022-07-26	3	2.00	190.00	210.00	617.40	58.80
15151	5157	229	1719	1	2023-09-29	2	3.00	940.00	1000.00	1940.00	116.40
15152	5158	229	1632	1	2023-12-04	3	4.00	510.00	570.00	1641.60	172.80
15153	5159	229	91	1	2023-02-24	2	2.00	10.00	10.00	19.60	0.00
15154	5160	923	195	1	2022-10-10	2	5.00	90.00	110.00	209.00	38.00
15155	5161	923	1301	1	2022-06-09	2	5.00	60.00	70.00	133.00	19.00
15156	5162	237	1529	2	2022-04-25	8	3.00	1290.00	1370.00	10631.20	620.80
15157	5163	924	84	1	2023-05-11	2	2.00	270.00	300.00	588.00	58.80
15158	5164	62	57	2	2023-11-19	3	2.00	150.00	170.00	499.80	58.80
15159	5165	568	131	2	2023-11-18	2	2.00	0.00	0.00	0.00	0.00
15160	5166	568	1013	2	2023-12-21	3	4.00	10.00	10.00	28.80	0.00
15161	5167	568	219	2	2022-01-14	3	3.00	20.00	20.00	58.20	0.00
15162	5168	568	500	2	2022-09-17	3	3.00	500.00	560.00	1629.60	174.60
15163	5169	568	1019	2	2023-07-06	3	3.00	50.00	60.00	174.60	29.10
15164	5170	568	519	2	2022-10-19	3	4.00	500.00	540.00	1555.20	115.20
15165	5171	242	484	1	2022-02-18	5	2.00	3010.00	3500.00	17150.00	2401.00
15166	5172	242	695	1	2023-09-21	3	2.00	110.00	140.00	411.60	88.20
15167	5173	242	922	1	2022-02-12	3	4.00	280.00	310.00	892.80	86.40
15168	5174	925	320	5	2022-02-03	1	5.00	0.00	0.00	0.00	0.00
15169	5175	926	1473	2	2023-03-17	2	4.00	0.00	0.00	0.00	0.00
15170	5176	926	1628	2	2022-06-14	3	5.00	300.00	330.00	940.50	85.50
15171	5177	10	1198	5	2022-07-02	2	5.00	50.00	50.00	95.00	0.00
15172	5178	25	256	2	2022-03-14	3	2.00	0.00	0.00	0.00	0.00
15173	5179	2	1156	2	2023-05-09	2	3.00	40.00	40.00	77.60	0.00
15174	5180	2	298	2	2022-10-02	2	4.00	210.00	260.00	499.20	96.00
15175	5181	2	984	2	2023-11-23	2	2.00	70.00	80.00	156.80	19.60
15176	5182	916	1724	5	2023-07-03	7	5.00	40.00	50.00	332.50	66.50
15177	5183	916	786	5	2023-11-02	3	2.00	50.00	50.00	147.00	0.00
15178	5184	375	1679	5	2023-08-17	3	5.00	30.00	40.00	114.00	28.50
15179	5185	375	556	5	2022-08-09	7	5.00	40.00	40.00	266.00	0.00
15180	5186	164	459	2	2023-01-22	6	2.00	1690.00	1800.00	10584.00	646.80
15181	5187	243	1595	2	2023-08-02	8	5.00	640.00	750.00	5700.00	836.00
15182	5188	167	960	2	2023-11-28	4	5.00	170.00	200.00	760.00	114.00
15183	5189	167	378	2	2023-03-09	7	2.00	1280.00	1520.00	10427.20	1646.40
15184	5190	727	1068	2	2023-12-16	6	2.00	140.00	170.00	999.60	176.40
15185	5191	727	1474	2	2022-01-18	2	3.00	50.00	50.00	97.00	0.00
15186	5192	37	1725	2	2023-06-16	2	4.00	20.00	20.00	38.40	0.00
15187	5193	259	125	1	2022-11-22	5	5.00	380.00	400.00	1900.00	95.00
15188	5194	259	1636	1	2023-10-31	7	2.00	80.00	90.00	617.40	68.60
15189	5195	259	347	1	2022-04-29	4	2.00	10.00	10.00	39.20	0.00
15190	5196	259	339	1	2023-11-21	3	4.00	50.00	50.00	144.00	0.00
15191	5197	438	440	2	2023-08-05	3	5.00	150.00	160.00	456.00	28.50
15192	5198	438	48	2	2023-12-13	5	5.00	30.00	40.00	190.00	47.50
15193	5199	300	1360	2	2023-10-09	3	5.00	3420.00	3930.00	11200.50	1453.50
15194	5200	300	1580	2	2023-07-08	1	3.00	0.00	0.00	0.00	0.00
15195	5201	300	1150	2	2023-02-02	3	2.00	370.00	430.00	1264.20	176.40
15196	5202	300	541	2	2023-11-06	7	5.00	30.00	40.00	266.00	66.50
15197	5203	454	944	2	2023-01-23	7	4.00	100.00	100.00	672.00	0.00
15198	5204	454	1248	2	2022-09-05	3	4.00	60.00	70.00	201.60	28.80
15199	5205	168	183	2	2022-07-22	2	3.00	10.00	10.00	19.40	0.00
15200	5206	168	46	2	2023-05-19	2	3.00	100.00	110.00	213.40	19.40
15201	5207	168	311	2	2023-07-26	1	4.00	0.00	0.00	0.00	0.00
15202	5208	168	255	2	2022-03-31	2	4.00	20.00	20.00	38.40	0.00
15203	5209	168	1011	2	2022-07-21	5	3.00	30.00	30.00	145.50	0.00
15204	5210	168	114	2	2022-10-29	1	2.00	30.00	30.00	29.40	0.00
15205	5211	417	1450	2	2022-04-13	3	3.00	440.00	470.00	1367.70	87.30
15206	5212	104	763	1	2022-10-07	3	2.00	40.00	40.00	117.60	0.00
15207	5213	529	457	7	2022-02-03	3	5.00	50.00	50.00	142.50	0.00
15208	5214	529	949	7	2022-06-12	3	2.00	10.00	10.00	29.40	0.00
15209	5215	529	1659	7	2023-07-30	5	2.00	30.00	40.00	196.00	49.00
15210	5216	529	458	7	2023-03-24	5	2.00	20.00	30.00	147.00	49.00
15211	5217	927	756	2	2022-10-05	2	3.00	20.00	20.00	38.80	0.00
15212	5218	19	146	1	2023-07-13	3	3.00	70.00	80.00	232.80	29.10
15213	5219	213	60	2	2022-11-18	5	3.00	10.00	10.00	48.50	0.00
15214	5220	638	1460	7	2023-06-30	7	2.00	430.00	500.00	3430.00	480.20
15215	5221	928	1625	2	2023-07-31	3	3.00	200.00	210.00	611.10	29.10
15216	5222	625	1726	1	2023-03-28	7	3.00	640.00	710.00	4820.90	475.30
15217	5223	625	462	1	2023-05-14	5	5.00	100.00	110.00	522.50	47.50
15218	5224	625	1489	1	2022-07-15	7	5.00	40.00	40.00	266.00	0.00
15219	5225	234	418	1	2023-04-12	3	3.00	140.00	170.00	494.70	87.30
15220	5226	383	1317	2	2022-03-29	5	3.00	30.00	40.00	194.00	48.50
15221	5227	383	1562	2	2022-03-22	6	5.00	160.00	190.00	1083.00	171.00
15222	5228	383	588	2	2023-05-27	2	3.00	330.00	350.00	679.00	38.80
15223	5229	427	1523	2	2022-12-20	2	2.00	60.00	80.00	156.80	39.20
15224	5230	362	1317	1	2022-10-03	2	2.00	10.00	10.00	19.60	0.00
15225	5231	362	617	1	2022-04-03	5	4.00	570.00	700.00	3360.00	624.00
15226	5232	362	1436	1	2023-10-07	1	4.00	30.00	30.00	28.80	0.00
15227	5233	362	186	1	2023-05-04	7	5.00	30.00	30.00	199.50	0.00
15228	5234	929	1720	2	2023-06-09	6	3.00	530.00	610.00	3550.20	465.60
15229	5235	152	115	5	2023-06-22	1	5.00	200.00	210.00	199.50	9.50
15230	5236	488	1550	5	2023-02-08	3	4.00	40.00	50.00	144.00	28.80
15231	5237	842	860	2	2022-02-09	3	4.00	130.00	160.00	460.80	86.40
15232	5238	842	431	2	2023-03-09	3	2.00	310.00	360.00	1058.40	147.00
15233	5239	842	247	2	2022-02-25	2	5.00	50.00	60.00	114.00	19.00
15234	5240	308	17	2	2022-12-11	3	2.00	270.00	330.00	970.20	176.40
15235	5241	308	445	2	2022-12-05	2	3.00	40.00	40.00	77.60	0.00
15236	5242	411	1727	1	2023-12-14	2	5.00	10.00	10.00	19.00	0.00
15237	5243	495	556	2	2022-10-01	3	2.00	0.00	0.00	0.00	0.00
15238	5244	374	865	5	2023-02-11	1	3.00	10.00	10.00	9.70	0.00
15239	5245	376	1728	1	2022-02-15	2	4.00	130.00	140.00	268.80	19.20
15240	5246	376	193	1	2022-03-15	3	5.00	300.00	330.00	940.50	85.50
15241	5247	376	461	1	2023-03-14	2	4.00	10.00	10.00	19.20	0.00
15242	5248	930	96	2	2023-08-28	8	2.00	20.00	20.00	156.80	0.00
15243	5249	203	175	1	2022-08-26	3	3.00	30.00	40.00	116.40	29.10
15244	5250	125	1329	2	2023-04-21	4	4.00	10.00	10.00	38.40	0.00
15245	5251	375	960	2	2023-10-30	5	2.00	220.00	250.00	1225.00	147.00
15246	5252	375	1494	2	2023-11-25	4	2.00	40.00	50.00	196.00	39.20
15247	5253	931	1307	5	2022-03-17	3	5.00	150.00	180.00	513.00	85.50
15248	5254	909	1081	1	2022-10-08	2	2.00	90.00	110.00	215.60	39.20
15249	5255	932	475	1	2023-08-28	2	2.00	90.00	100.00	196.00	19.60
15250	5256	932	1479	1	2022-07-10	2	3.00	30.00	30.00	58.20	0.00
15251	5257	500	1437	2	2023-11-02	2	5.00	10.00	10.00	19.00	0.00
15252	5258	676	833	2	2022-03-08	6	3.00	30.00	40.00	232.80	58.20
15253	5259	4	729	5	2022-01-10	5	4.00	30.00	40.00	192.00	48.00
15254	5260	285	641	2	2022-05-25	3	3.00	50.00	50.00	145.50	0.00
15255	5261	522	1362	5	2022-07-30	3	3.00	170.00	200.00	582.00	87.30
15256	5262	522	348	5	2022-05-01	2	5.00	0.00	0.00	0.00	0.00
15257	5263	522	739	5	2022-03-24	1	4.00	170.00	200.00	192.00	28.80
15258	5264	522	1208	5	2023-07-14	4	2.00	40.00	50.00	196.00	39.20
15259	5265	522	1584	5	2022-03-15	3	2.00	20.00	20.00	58.80	0.00
15260	5266	237	1018	5	2023-09-23	2	3.00	10.00	10.00	19.40	0.00
15261	5267	237	1559	5	2023-09-30	3	3.00	150.00	170.00	494.70	58.20
15262	5268	237	1035	5	2022-07-17	1	5.00	0.00	0.00	0.00	0.00
15263	5269	761	1729	2	2022-07-13	4	3.00	40.00	50.00	194.00	38.80
15264	5270	152	75	7	2022-01-18	4	5.00	30.00	30.00	114.00	0.00
15265	5271	152	724	7	2023-11-24	5	4.00	360.00	410.00	1968.00	240.00
15266	5272	177	6	7	2022-10-11	4	3.00	30.00	30.00	116.40	0.00
15267	5273	177	720	7	2022-03-20	7	3.00	370.00	400.00	2716.00	203.70
15268	5274	933	745	5	2023-06-09	4	2.00	0.00	0.00	0.00	0.00
15269	5275	934	468	1	2023-09-12	3	4.00	670.00	720.00	2073.60	144.00
15270	5276	935	241	2	2022-11-03	4	2.00	150.00	160.00	627.20	39.20
15271	5277	935	1045	2	2023-11-02	5	5.00	30.00	40.00	190.00	47.50
15272	5278	936	168	2	2023-10-22	6	4.00	310.00	340.00	1958.40	172.80
15273	5279	931	955	2	2022-04-06	4	3.00	90.00	110.00	426.80	77.60
15274	5280	363	1557	2	2023-02-13	1	3.00	10.00	10.00	9.70	0.00
15275	5281	641	1355	2	2023-11-04	2	3.00	80.00	90.00	174.60	19.40
15276	5282	937	51	2	2023-05-02	2	4.00	10.00	10.00	19.20	0.00
15277	5283	937	315	2	2022-06-23	3	3.00	40.00	40.00	116.40	0.00
15278	5284	153	1506	2	2023-08-27	3	5.00	20.00	20.00	57.00	0.00
15279	5285	153	580	2	2023-11-26	3	3.00	40.00	40.00	116.40	0.00
15280	5286	157	112	5	2022-02-02	9	2.00	20.00	20.00	176.40	0.00
15281	5287	157	123	5	2023-05-25	8	5.00	10.00	10.00	76.00	0.00
15282	5288	157	900	5	2022-05-29	3	2.00	80.00	90.00	264.60	29.40
15283	5289	337	1128	2	2022-12-05	4	3.00	150.00	160.00	620.80	38.80
15284	5290	75	863	2	2023-07-23	2	4.00	20.00	20.00	38.40	0.00
15285	5291	75	158	2	2022-12-22	5	5.00	830.00	970.00	4607.50	665.00
15286	5292	75	68	2	2022-09-01	6	2.00	170.00	180.00	1058.40	58.80
15287	5293	150	1428	5	2022-09-05	1	3.00	0.00	0.00	0.00	0.00
15288	5294	938	839	2	2023-05-13	1	4.00	40.00	50.00	48.00	9.60
15289	5295	939	1730	2	2023-01-10	8	2.00	50.00	50.00	392.00	0.00
15290	5296	188	965	2	2023-07-27	2	3.00	70.00	90.00	174.60	38.80
15291	5297	331	944	2	2023-09-02	1	4.00	10.00	10.00	9.60	0.00
15292	5298	331	705	2	2022-05-10	8	2.00	460.00	540.00	4233.60	627.20
15293	5299	326	30	5	2023-11-25	2	3.00	0.00	0.00	0.00	0.00
15294	5300	326	166	5	2022-07-02	3	3.00	20.00	20.00	58.20	0.00
15295	5301	280	1338	2	2022-03-30	10	2.00	2030.00	2280.00	22344.00	2450.00
15296	5302	280	765	2	2023-07-26	6	2.00	1620.00	1980.00	11642.40	2116.80
15297	5303	280	489	2	2023-09-02	6	5.00	50.00	60.00	342.00	57.00
15298	5304	172	1392	2	2023-06-29	2	3.00	30.00	40.00	77.60	19.40
15299	5305	940	1446	5	2023-12-24	2	2.00	10.00	10.00	19.60	0.00
15300	5306	698	94	2	2023-10-16	5	3.00	60.00	70.00	339.50	48.50
15301	5307	698	596	2	2023-02-16	3	3.00	270.00	300.00	873.00	87.30
15302	5308	698	1731	2	2022-03-18	2	2.00	30.00	40.00	78.40	19.60
15303	5309	141	1210	5	2023-02-09	3	4.00	160.00	190.00	547.20	86.40
15304	5310	141	1732	5	2022-03-13	5	3.00	10.00	10.00	48.50	0.00
15305	5311	141	451	5	2023-06-16	6	4.00	1420.00	1530.00	8812.80	633.60
15306	5312	941	1364	2	2023-09-23	4	4.00	10.00	10.00	38.40	0.00
15307	5313	941	355	2	2023-08-15	2	5.00	30.00	30.00	57.00	0.00
15308	5314	111	597	2	2022-02-10	2	2.00	50.00	60.00	117.60	19.60
15309	5315	111	589	2	2023-03-31	4	4.00	20.00	30.00	115.20	38.40
15310	5316	456	793	2	2022-11-29	9	3.00	170.00	190.00	1658.70	174.60
15311	5317	942	1257	5	2023-11-19	2	5.00	10.00	10.00	19.00	0.00
15312	5318	942	442	5	2023-05-06	1	3.00	10.00	10.00	9.70	0.00
15313	5319	942	861	5	2022-03-23	4	4.00	20.00	20.00	76.80	0.00
15314	5320	942	1000	5	2022-06-04	3	2.00	30.00	30.00	88.20	0.00
15315	5321	942	595	5	2023-09-01	7	3.00	2030.00	2310.00	15684.90	1901.20
15316	5322	942	698	5	2023-07-11	4	2.00	20.00	30.00	117.60	39.20
15317	5323	942	894	5	2022-04-20	2	5.00	20.00	20.00	38.00	0.00
15318	5324	943	227	1	2022-08-09	2	3.00	20.00	20.00	38.80	0.00
15319	5325	788	1174	2	2023-06-06	5	4.00	20.00	20.00	96.00	0.00
15320	5326	788	1007	2	2023-07-18	6	5.00	30.00	30.00	171.00	0.00
15321	5327	158	1413	2	2022-03-09	2	3.00	10.00	10.00	19.40	0.00
15322	5328	14	511	1	2023-08-08	3	3.00	20.00	20.00	58.20	0.00
15323	5329	75	425	2	2022-03-01	2	3.00	30.00	30.00	58.20	0.00
15324	5330	134	302	1	2023-09-21	2	2.00	30.00	30.00	58.80	0.00
15325	5331	383	1269	2	2023-08-21	1	2.00	50.00	60.00	58.80	9.80
15326	5332	383	59	2	2023-06-04	5	2.00	60.00	60.00	294.00	0.00
15327	5333	383	676	2	2023-01-06	4	5.00	20.00	20.00	76.00	0.00
15328	5334	436	1566	2	2023-03-09	4	5.00	10.00	10.00	38.00	0.00
15329	5335	436	1216	2	2023-03-22	3	4.00	20.00	20.00	57.60	0.00
15330	5336	436	939	2	2023-05-03	1	2.00	0.00	0.00	0.00	0.00
15331	5337	153	675	2	2023-01-23	4	4.00	30.00	30.00	115.20	0.00
15332	5338	607	1398	2	2022-12-19	7	4.00	290.00	310.00	2083.20	134.40
15333	5339	245	1167	1	2023-10-12	5	5.00	210.00	240.00	1140.00	142.50
15334	5340	245	30	1	2022-06-19	6	5.00	10.00	10.00	57.00	0.00
15335	5341	245	1696	1	2023-03-23	2	3.00	10.00	10.00	19.40	0.00
15336	5342	245	1333	1	2023-12-31	5	4.00	770.00	900.00	4320.00	624.00
15337	5343	93	30	2	2022-07-04	1	2.00	0.00	0.00	0.00	0.00
15338	5344	93	1087	2	2023-03-16	5	2.00	260.00	270.00	1323.00	49.00
15339	5345	181	1366	1	2023-08-25	1	2.00	30.00	30.00	29.40	0.00
15340	5346	70	246	1	2023-08-26	4	2.00	610.00	730.00	2861.60	470.40
15341	5347	70	110	1	2023-06-25	3	4.00	10.00	10.00	28.80	0.00
15342	5348	70	881	1	2022-12-09	2	4.00	10.00	10.00	19.20	0.00
15343	5349	944	829	2	2023-07-12	3	5.00	30.00	30.00	85.50	0.00
15344	5350	944	227	2	2022-07-08	5	2.00	40.00	40.00	196.00	0.00
15345	5351	945	682	2	2022-11-24	9	3.00	120.00	140.00	1222.20	174.60
15346	5352	211	1403	2	2022-08-09	4	5.00	30.00	40.00	152.00	38.00
15347	5353	211	54	2	2023-12-16	2	4.00	300.00	330.00	633.60	57.60
15348	5354	265	635	5	2023-09-22	8	2.00	70.00	90.00	705.60	156.80
15349	5355	351	1341	2	2022-11-25	6	4.00	230.00	280.00	1612.80	288.00
15350	5356	351	1733	2	2022-06-07	2	5.00	10.00	10.00	19.00	0.00
15351	5357	10	1283	2	2022-11-10	5	5.00	30.00	30.00	142.50	0.00
15352	5358	37	961	2	2022-10-01	1	2.00	20.00	20.00	19.60	0.00
15353	5359	37	1556	2	2022-03-09	2	4.00	20.00	20.00	38.40	0.00
15354	5360	37	1244	2	2023-11-21	2	2.00	50.00	50.00	98.00	0.00
15355	5361	451	928	2	2022-01-22	8	2.00	170.00	200.00	1568.00	235.20
15356	5362	211	735	5	2023-09-24	5	5.00	620.00	720.00	3420.00	475.00
15357	5363	804	1531	2	2023-07-13	6	5.00	60.00	70.00	399.00	57.00
15358	5364	804	1361	2	2022-11-22	2	5.00	80.00	80.00	152.00	0.00
15359	5365	487	1267	1	2023-10-18	4	5.00	50.00	60.00	228.00	38.00
15360	5366	188	868	2	2023-01-23	1	4.00	130.00	150.00	144.00	19.20
15361	5367	6	688	2	2023-11-14	3	5.00	80.00	90.00	256.50	28.50
15362	5368	6	265	2	2023-03-15	4	4.00	10.00	10.00	38.40	0.00
15363	5369	6	231	2	2023-08-05	1	5.00	20.00	20.00	19.00	0.00
15364	5370	169	1734	5	2023-03-11	3	4.00	80.00	90.00	259.20	28.80
15365	5371	946	1370	2	2023-08-18	2	2.00	240.00	270.00	529.20	58.80
15366	5372	946	744	2	2022-03-16	3	4.00	260.00	310.00	892.80	144.00
15367	5373	34	90	2	2023-01-14	3	3.00	20.00	20.00	58.20	0.00
15368	5374	34	224	2	2023-08-17	7	2.00	290.00	350.00	2401.00	411.60
15369	5375	34	779	2	2022-01-13	2	2.00	10.00	10.00	19.60	0.00
15370	5376	237	961	2	2022-01-22	6	5.00	90.00	100.00	570.00	57.00
15371	5377	237	1555	2	2023-03-23	3	3.00	30.00	30.00	87.30	0.00
15372	5378	325	634	5	2023-02-23	7	2.00	310.00	350.00	2401.00	274.40
15373	5379	325	399	5	2022-01-21	4	4.00	160.00	170.00	652.80	38.40
15374	5380	70	1263	2	2022-09-08	3	4.00	20.00	20.00	57.60	0.00
15375	5381	70	1735	2	2023-04-28	6	4.00	100.00	110.00	633.60	57.60
15376	5382	165	681	1	2023-08-06	5	4.00	30.00	30.00	144.00	0.00
15377	5383	165	1100	1	2022-06-18	8	5.00	20.00	20.00	152.00	0.00
15378	5384	165	330	1	2023-09-06	2	3.00	10.00	10.00	19.40	0.00
15379	5385	130	257	2	2022-03-01	3	3.00	330.00	360.00	1047.60	87.30
15380	5386	130	1418	2	2022-11-11	14	5.00	470.00	550.00	7315.00	1064.00
15381	5387	947	1367	2	2022-06-16	9	2.00	30.00	40.00	352.80	88.20
15382	5388	156	432	1	2022-03-11	3	3.00	140.00	170.00	494.70	87.30
15383	5389	156	1313	1	2022-12-18	3	5.00	90.00	110.00	313.50	57.00
15384	5390	156	523	1	2023-07-02	2	4.00	10.00	10.00	19.20	0.00
15385	5391	153	1046	1	2023-02-15	3	2.00	20.00	30.00	88.20	29.40
15386	5392	866	548	2	2023-06-15	6	4.00	20.00	20.00	115.20	0.00
15387	5393	866	640	2	2022-11-14	2	3.00	10.00	10.00	19.40	0.00
15388	5394	866	472	2	2022-12-02	7	4.00	190.00	210.00	1411.20	134.40
15389	5395	866	1058	2	2023-02-03	6	3.00	940.00	1030.00	5994.60	523.80
15390	5396	624	1408	1	2023-03-19	7	5.00	20.00	20.00	133.00	0.00
15391	5397	111	1309	7	2023-04-15	5	2.00	50.00	60.00	294.00	49.00
15392	5398	351	190	2	2023-02-21	12	4.00	40.00	40.00	460.80	0.00
15393	5399	948	508	2	2023-01-16	3	5.00	0.00	0.00	0.00	0.00
15394	5400	27	1	2	2023-08-23	5	5.00	500.00	560.00	2660.00	285.00
15395	5401	6	358	5	2022-02-14	2	5.00	60.00	70.00	133.00	19.00
15396	5402	6	435	5	2022-02-01	2	4.00	70.00	80.00	153.60	19.20
15397	5403	25	9	2	2022-05-01	4	5.00	20.00	20.00	76.00	0.00
15398	5404	25	606	2	2023-07-19	1	4.00	0.00	0.00	0.00	0.00
15399	5405	70	289	2	2023-12-16	5	2.00	410.00	450.00	2205.00	196.00
15400	5406	70	1520	2	2022-07-11	1	3.00	30.00	40.00	38.80	9.70
15401	5407	70	1054	2	2023-04-01	3	5.00	10.00	10.00	28.50	0.00
15402	5408	142	1666	2	2022-04-25	4	2.00	70.00	90.00	352.80	78.40
15403	5409	142	913	2	2022-08-01	1	3.00	20.00	20.00	19.40	0.00
15404	5410	142	444	2	2023-12-11	3	4.00	80.00	90.00	259.20	28.80
15405	5411	142	1355	2	2022-12-02	1	4.00	30.00	40.00	38.40	9.60
15406	5412	949	752	2	2023-06-15	7	3.00	10.00	10.00	67.90	0.00
15407	5413	949	1736	2	2023-11-05	3	2.00	80.00	100.00	294.00	58.80
15408	5414	804	1518	5	2023-10-11	5	5.00	200.00	220.00	1045.00	95.00
15409	5415	194	1713	2	2023-01-07	6	5.00	60.00	70.00	399.00	57.00
15410	5416	194	975	2	2022-01-20	4	5.00	20.00	20.00	76.00	0.00
15411	5417	194	772	2	2022-08-30	2	2.00	30.00	40.00	78.40	19.60
15412	5418	644	1737	1	2023-08-12	2	5.00	20.00	20.00	38.00	0.00
15413	5419	188	748	5	2023-02-12	7	4.00	30.00	40.00	268.80	67.20
15414	5420	188	540	5	2023-07-31	2	2.00	140.00	150.00	294.00	19.60
15415	5421	71	1595	1	2022-01-01	3	4.00	260.00	280.00	806.40	57.60
15416	5422	71	1236	1	2023-09-03	2	3.00	30.00	30.00	58.20	0.00
15417	5423	70	606	2	2022-02-11	3	4.00	10.00	10.00	28.80	0.00
15418	5424	155	1738	1	2022-05-02	5	4.00	30.00	30.00	144.00	0.00
15419	5425	872	825	2	2022-12-11	2	2.00	0.00	0.00	0.00	0.00
15420	5426	70	1739	5	2022-12-23	5	3.00	1450.00	1650.00	8002.50	970.00
15421	5427	70	1609	5	2023-04-14	6	3.00	90.00	110.00	640.20	116.40
15422	5428	316	1602	7	2023-04-21	5	2.00	560.00	600.00	2940.00	196.00
15423	5429	337	171	5	2022-06-29	3	4.00	50.00	50.00	144.00	0.00
15424	5430	653	297	5	2023-08-22	2	3.00	30.00	30.00	58.20	0.00
15425	5431	826	1726	2	2023-11-07	2	2.00	130.00	160.00	313.60	58.80
15426	5432	826	728	2	2023-12-24	1	3.00	0.00	0.00	0.00	0.00
15427	5433	826	1473	2	2023-01-24	4	5.00	10.00	10.00	38.00	0.00
15428	5434	950	22	2	2022-07-14	4	4.00	10.00	10.00	38.40	0.00
15429	5435	329	1740	2	2022-04-17	5	4.00	1390.00	1640.00	7872.00	1200.00
15430	5436	329	294	2	2022-05-05	3	5.00	260.00	270.00	769.50	28.50
15431	5437	650	1123	5	2022-07-30	2	4.00	20.00	20.00	38.40	0.00
15432	5438	650	1505	5	2023-07-03	5	4.00	10.00	10.00	48.00	0.00
15433	5439	650	1741	5	2022-01-27	3	2.00	170.00	210.00	617.40	117.60
15434	5440	134	1499	2	2023-04-27	2	3.00	470.00	590.00	1144.60	232.80
15435	5441	951	680	1	2023-07-10	1	2.00	0.00	0.00	0.00	0.00
15436	5442	406	1742	2	2023-06-13	2	5.00	10.00	10.00	19.00	0.00
15437	5443	134	770	2	2022-01-05	1	3.00	90.00	100.00	97.00	9.70
15438	5444	134	1121	2	2022-04-22	13	2.00	50.00	60.00	764.40	127.40
15439	5445	134	1743	2	2022-08-18	3	3.00	10.00	10.00	29.10	0.00
15440	5446	17	1250	2	2023-08-30	1	2.00	20.00	20.00	19.60	0.00
15441	5447	49	896	2	2023-11-30	6	4.00	30.00	30.00	172.80	0.00
15442	5448	49	1234	2	2023-02-13	5	4.00	220.00	250.00	1200.00	144.00
15443	5449	459	1421	2	2023-07-24	3	4.00	340.00	360.00	1036.80	57.60
15444	5450	459	1691	2	2022-06-11	5	4.00	50.00	60.00	288.00	48.00
15445	5451	459	897	2	2022-03-06	2	2.00	310.00	330.00	646.80	39.20
15446	5452	459	1493	2	2022-03-21	2	2.00	30.00	40.00	78.40	19.60
15447	5453	952	611	2	2023-10-22	5	5.00	80.00	90.00	427.50	47.50
15448	5454	953	1589	2	2022-04-10	6	4.00	40.00	40.00	230.40	0.00
15449	5455	125	471	2	2022-04-08	1	5.00	10.00	10.00	9.50	0.00
15450	5456	125	19	2	2022-06-24	2	5.00	10.00	10.00	19.00	0.00
15451	5457	267	1744	2	2023-08-01	5	2.00	20.00	20.00	98.00	0.00
15452	5458	267	1183	2	2022-09-18	2	3.00	60.00	70.00	135.80	19.40
15453	5459	37	758	1	2023-02-26	6	4.00	10.00	10.00	57.60	0.00
15454	5460	37	1745	1	2023-03-11	8	5.00	1320.00	1480.00	11248.00	1216.00
15455	5461	786	1513	2	2022-12-10	1	3.00	20.00	20.00	19.40	0.00
15456	5462	4	51	2	2022-01-16	3	4.00	10.00	10.00	28.80	0.00
15457	5463	313	829	5	2023-03-17	10	3.00	30.00	30.00	291.00	0.00
15458	5464	313	162	5	2022-01-26	4	3.00	60.00	60.00	232.80	0.00
15459	5465	313	114	5	2022-05-28	5	3.00	90.00	110.00	533.50	97.00
15460	5466	313	367	5	2023-03-12	5	2.00	170.00	180.00	882.00	49.00
15461	5467	141	950	1	2022-04-17	3	4.00	20.00	20.00	57.60	0.00
15462	5468	10	24	2	2022-08-11	3	4.00	110.00	120.00	345.60	28.80
15463	5469	560	2	5	2022-03-27	3	2.00	510.00	590.00	1734.60	235.20
15464	5470	560	975	5	2023-05-01	3	3.00	20.00	20.00	58.20	0.00
15465	5471	84	1272	2	2022-05-07	5	3.00	110.00	120.00	582.00	48.50
15466	5472	954	1534	2	2023-12-31	5	5.00	10.00	10.00	47.50	0.00
15467	5473	954	1167	2	2023-03-20	2	2.00	70.00	80.00	156.80	19.60
15468	5474	954	1196	2	2023-10-21	7	2.00	80.00	100.00	686.00	137.20
15469	5475	11	459	7	2022-04-03	2	5.00	630.00	750.00	1425.00	228.00
15470	5476	955	580	5	2022-11-14	3	3.00	30.00	40.00	116.40	29.10
15471	5477	955	1037	5	2022-05-05	5	5.00	70.00	80.00	380.00	47.50
15472	5478	955	1666	5	2022-12-14	3	4.00	20.00	20.00	57.60	0.00
15473	5479	436	1161	2	2023-08-23	3	4.00	120.00	130.00	374.40	28.80
15474	5480	563	800	2	2022-06-11	1	4.00	0.00	0.00	0.00	0.00
15475	5481	248	958	2	2022-01-22	1	3.00	90.00	100.00	97.00	9.70
15476	5482	248	1543	2	2022-11-10	2	5.00	30.00	40.00	76.00	19.00
15477	5483	248	604	2	2023-08-21	4	2.00	190.00	240.00	940.80	196.00
15478	5484	248	1513	2	2022-01-06	2	5.00	30.00	40.00	76.00	19.00
15479	5485	324	1746	2	2022-12-25	4	4.00	360.00	420.00	1612.80	230.40
15480	5486	484	707	2	2022-03-23	3	5.00	20.00	20.00	57.00	0.00
15481	5487	453	308	2	2022-12-01	4	4.00	0.00	0.00	0.00	0.00
15482	5488	251	1137	1	2022-04-28	3	5.00	20.00	20.00	57.00	0.00
15483	5489	251	949	1	2023-01-30	3	4.00	10.00	10.00	28.80	0.00
15484	5490	251	1296	1	2022-08-08	3	5.00	20.00	20.00	57.00	0.00
15485	5491	251	1210	1	2023-06-25	3	5.00	210.00	220.00	627.00	28.50
15486	5492	35	76	5	2023-02-24	2	4.00	20.00	20.00	38.40	0.00
15487	5493	337	328	7	2022-12-14	2	5.00	10.00	10.00	19.00	0.00
15488	5494	337	255	7	2022-05-20	4	5.00	30.00	40.00	152.00	38.00
15489	5495	337	1120	7	2022-12-02	4	2.00	330.00	410.00	1607.20	313.60
15490	5496	59	1207	2	2022-05-16	4	4.00	10.00	10.00	38.40	0.00
15491	5497	555	241	2	2022-02-27	2	5.00	50.00	60.00	114.00	19.00
15492	5498	104	1242	1	2023-12-16	2	2.00	10.00	10.00	19.60	0.00
15493	5499	104	287	1	2023-10-29	3	5.00	10.00	10.00	28.50	0.00
15494	5500	104	342	1	2022-08-17	2	3.00	40.00	40.00	77.60	0.00
15495	5501	104	1266	1	2023-12-12	6	3.00	630.00	660.00	3841.20	174.60
15496	5502	104	1057	1	2022-02-23	2	3.00	10.00	10.00	19.40	0.00
15497	5503	59	1380	2	2022-09-26	1	3.00	0.00	0.00	0.00	0.00
15498	5504	59	1613	2	2023-05-26	3	3.00	20.00	20.00	58.20	0.00
15499	5505	59	437	2	2022-06-15	3	3.00	10.00	10.00	29.10	0.00
15500	5506	59	1119	2	2023-01-09	4	3.00	800.00	860.00	3336.80	232.80
15501	5507	234	1091	7	2022-06-25	2	5.00	50.00	60.00	114.00	19.00
15502	5508	582	1344	2	2023-05-28	4	3.00	20.00	20.00	77.60	0.00
15503	5509	37	288	2	2023-03-12	5	4.00	130.00	150.00	720.00	96.00
15504	5510	194	130	2	2023-05-03	2	3.00	50.00	60.00	116.40	19.40
15505	5511	194	1092	2	2022-10-16	2	3.00	10.00	10.00	19.40	0.00
15506	5512	481	1537	2	2022-01-15	4	5.00	30.00	30.00	114.00	0.00
15507	5513	481	1588	2	2023-01-18	3	3.00	20.00	20.00	58.20	0.00
15508	5514	31	648	5	2023-07-27	3	5.00	200.00	240.00	684.00	114.00
15509	5515	31	1318	5	2023-05-02	2	2.00	150.00	160.00	313.60	19.60
15510	5516	31	1301	5	2022-08-23	3	5.00	110.00	130.00	370.50	57.00
15511	5517	956	1739	1	2022-06-21	4	4.00	1080.00	1320.00	5068.80	921.60
15512	5518	325	878	2	2022-09-01	10	2.00	190.00	240.00	2352.00	490.00
15513	5519	325	1183	2	2022-07-11	2	2.00	50.00	50.00	98.00	0.00
15514	5520	325	797	2	2022-09-20	3	4.00	10.00	10.00	28.80	0.00
15515	5521	325	1680	2	2022-11-04	5	2.00	20.00	20.00	98.00	0.00
15516	5522	325	915	2	2022-03-19	4	4.00	210.00	260.00	998.40	192.00
15517	5523	957	1367	5	2023-05-08	6	2.00	20.00	20.00	117.60	0.00
15518	5524	957	938	5	2023-02-14	4	2.00	50.00	60.00	235.20	39.20
15519	5525	685	1071	5	2023-01-25	12	3.00	70.00	80.00	931.20	116.40
15520	5526	177	283	2	2023-03-09	2	3.00	10.00	10.00	19.40	0.00
15521	5527	958	1089	2	2022-07-23	1	2.00	0.00	0.00	0.00	0.00
15522	5528	44	424	5	2023-06-23	2	4.00	40.00	40.00	76.80	0.00
15523	5529	251	223	2	2023-01-23	5	4.00	70.00	80.00	384.00	48.00
15524	5530	959	1697	2	2023-06-30	3	3.00	110.00	120.00	349.20	29.10
15525	5531	266	648	2	2023-05-18	4	3.00	2210.00	2480.00	9622.40	1047.60
15526	5532	550	1017	5	2022-02-27	6	3.00	160.00	180.00	1047.60	116.40
15527	5533	550	1045	5	2023-07-25	3	5.00	30.00	30.00	85.50	0.00
15528	5534	550	620	5	2022-02-22	3	3.00	260.00	320.00	931.20	174.60
15529	5535	550	369	5	2023-10-26	3	5.00	60.00	60.00	171.00	0.00
15530	5536	550	95	5	2022-04-26	3	2.00	50.00	60.00	176.40	29.40
15531	5537	550	1066	5	2022-05-08	3	5.00	10.00	10.00	28.50	0.00
15532	5538	550	1484	5	2023-07-13	2	4.00	10.00	10.00	19.20	0.00
15533	5539	960	700	2	2023-01-17	3	4.00	20.00	20.00	57.60	0.00
15534	5540	194	71	2	2023-07-21	2	2.00	150.00	180.00	352.80	58.80
15535	5541	194	123	2	2022-06-25	2	5.00	0.00	0.00	0.00	0.00
15536	5542	194	661	2	2022-12-04	3	2.00	20.00	20.00	58.80	0.00
15537	5543	196	1747	2	2022-09-03	6	5.00	430.00	460.00	2622.00	171.00
15538	5544	196	1459	2	2023-11-07	6	5.00	10.00	10.00	57.00	0.00
15539	5545	196	531	2	2022-03-10	2	4.00	10.00	10.00	19.20	0.00
15540	5546	284	147	2	2022-10-11	5	5.00	60.00	70.00	332.50	47.50
15541	5547	961	1599	5	2022-01-27	2	4.00	30.00	30.00	57.60	0.00
15542	5548	961	1256	5	2022-11-07	4	3.00	110.00	130.00	504.40	77.60
15543	5549	10	938	5	2023-08-22	3	3.00	40.00	40.00	116.40	0.00
15544	5550	10	809	5	2023-01-06	7	5.00	120.00	140.00	931.00	133.00
15545	5551	106	1413	2	2022-09-09	1	5.00	0.00	0.00	0.00	0.00
15546	5552	106	1568	2	2023-05-23	6	4.00	20.00	20.00	115.20	0.00
15547	5553	106	218	2	2023-05-22	3	2.00	70.00	80.00	235.20	29.40
15548	5554	106	261	2	2023-12-02	7	5.00	30.00	40.00	266.00	66.50
15549	5555	106	900	2	2023-09-27	1	4.00	60.00	70.00	67.20	9.60
15550	5556	499	1525	1	2023-11-13	2	4.00	10.00	10.00	19.20	0.00
15551	5557	962	1393	2	2023-09-08	2	5.00	10.00	10.00	19.00	0.00
15552	5558	962	1474	2	2023-06-22	2	5.00	60.00	60.00	114.00	0.00
15553	5559	415	1748	2	2022-08-12	1	3.00	10.00	10.00	9.70	0.00
15554	5560	415	1245	2	2023-02-17	5	3.00	1090.00	1330.00	6450.50	1164.00
15555	5561	415	691	2	2023-02-10	3	2.00	10.00	10.00	29.40	0.00
15556	5562	255	304	1	2023-08-28	1	2.00	20.00	30.00	29.40	9.80
15557	5563	255	307	1	2022-12-12	5	4.00	2460.00	3000.00	14400.00	2592.00
15558	5564	255	28	1	2023-11-23	4	4.00	60.00	60.00	230.40	0.00
15559	5565	28	1516	7	2023-03-24	4	4.00	20.00	20.00	76.80	0.00
15560	5566	28	1749	7	2022-05-17	2	3.00	170.00	210.00	407.40	77.60
15561	5567	28	1454	7	2022-02-06	5	2.00	30.00	30.00	147.00	0.00
15562	5568	28	1585	7	2023-05-16	1	5.00	80.00	90.00	85.50	9.50
15563	5569	28	307	7	2023-11-01	2	5.00	830.00	960.00	1824.00	247.00
15564	5570	28	549	7	2022-12-17	3	2.00	20.00	20.00	58.80	0.00
15565	5571	28	1301	7	2023-10-17	1	2.00	30.00	30.00	29.40	0.00
15566	5572	57	1523	2	2023-09-06	3	3.00	90.00	100.00	291.00	29.10
15567	5573	57	692	2	2022-10-24	4	4.00	30.00	30.00	115.20	0.00
15568	5574	57	1750	2	2022-02-08	3	4.00	20.00	20.00	57.60	0.00
15569	5575	57	1751	2	2022-12-29	1	4.00	40.00	40.00	38.40	0.00
15570	5576	57	1188	2	2023-10-31	2	2.00	170.00	180.00	352.80	19.60
15571	5577	62	442	2	2022-04-26	6	3.00	320.00	380.00	2211.60	349.20
15572	5578	62	552	2	2022-04-16	3	3.00	50.00	60.00	174.60	29.10
15573	5579	27	951	1	2022-05-11	2	2.00	10.00	10.00	19.60	0.00
15574	5580	27	1226	1	2022-07-08	5	4.00	220.00	240.00	1152.00	96.00
15575	5581	27	1715	1	2023-07-22	9	5.00	50.00	50.00	427.50	0.00
15576	5582	335	892	2	2022-11-04	1	3.00	20.00	20.00	19.40	0.00
15577	5583	126	903	2	2023-02-16	5	2.00	10.00	10.00	49.00	0.00
15578	5584	103	1393	1	2022-05-06	2	3.00	10.00	10.00	19.40	0.00
15579	5585	304	1752	2	2023-02-05	4	3.00	60.00	80.00	310.40	77.60
15580	5586	304	1753	2	2022-10-14	3	5.00	450.00	550.00	1567.50	285.00
15581	5587	304	436	2	2023-10-13	3	5.00	220.00	270.00	769.50	142.50
15582	5588	260	846	5	2022-01-06	5	2.00	10.00	10.00	49.00	0.00
15583	5589	187	734	2	2023-03-05	2	3.00	10.00	10.00	19.40	0.00
15584	5590	152	76	1	2023-04-21	3	2.00	20.00	30.00	88.20	29.40
15585	5591	152	719	1	2022-01-13	2	3.00	300.00	350.00	679.00	97.00
15586	5592	708	813	1	2023-03-14	2	5.00	220.00	250.00	475.00	57.00
15587	5593	708	93	1	2022-03-05	1	2.00	20.00	20.00	19.60	0.00
15588	5594	228	698	2	2023-10-12	7	3.00	50.00	60.00	407.40	67.90
15589	5595	158	470	7	2023-08-23	2	3.00	320.00	390.00	756.60	135.80
15590	5596	158	1286	7	2023-07-24	3	3.00	390.00	440.00	1280.40	145.50
15591	5597	283	142	2	2023-04-24	2	4.00	70.00	70.00	134.40	0.00
15592	5598	521	1060	2	2023-08-14	3	2.00	30.00	30.00	88.20	0.00
15593	5599	521	1743	2	2022-04-04	3	4.00	10.00	10.00	28.80	0.00
15594	5600	51	1754	7	2023-04-02	2	4.00	60.00	60.00	115.20	0.00
15595	5601	51	136	7	2022-04-28	5	5.00	10.00	10.00	47.50	0.00
15596	5602	51	1090	7	2022-11-03	3	2.00	130.00	140.00	411.60	29.40
15597	5603	34	1755	1	2022-04-04	1	2.00	10.00	10.00	9.80	0.00
15598	5604	34	1674	1	2022-07-18	5	4.00	70.00	80.00	384.00	48.00
15599	5605	213	1682	2	2022-09-12	6	2.00	510.00	590.00	3469.20	470.40
15600	5606	771	1446	2	2022-03-25	2	2.00	20.00	20.00	39.20	0.00
15601	5607	771	813	2	2023-06-29	1	5.00	90.00	100.00	95.00	9.50
15602	5608	104	148	2	2023-12-22	5	5.00	10.00	10.00	47.50	0.00
15603	5609	10	1035	2	2023-07-24	2	4.00	10.00	10.00	19.20	0.00
15604	5610	601	765	2	2022-07-29	2	4.00	620.00	660.00	1267.20	76.80
15605	5611	144	177	5	2023-02-17	3	5.00	40.00	50.00	142.50	28.50
15606	5612	153	696	2	2022-05-11	2	5.00	720.00	840.00	1596.00	228.00
15607	5613	153	578	2	2022-04-30	9	4.00	1400.00	1500.00	12960.00	864.00
15608	5614	383	1756	2	2022-09-01	2	5.00	110.00	120.00	228.00	19.00
15609	5615	49	320	2	2023-06-28	5	2.00	20.00	20.00	98.00	0.00
15610	5616	49	78	2	2022-03-16	5	2.00	900.00	1040.00	5096.00	686.00
15611	5617	49	564	2	2022-02-09	6	4.00	20.00	30.00	172.80	57.60
15612	5618	903	1123	2	2022-04-10	2	5.00	20.00	20.00	38.00	0.00
15613	5619	287	17	5	2022-06-28	4	4.00	400.00	440.00	1689.60	153.60
15614	5620	963	296	2	2022-09-05	5	3.00	430.00	500.00	2425.00	339.50
15615	5621	963	1280	2	2023-12-21	1	2.00	0.00	0.00	0.00	0.00
15616	5622	963	39	2	2022-12-10	2	5.00	180.00	200.00	380.00	38.00
15617	5623	963	1467	2	2023-03-08	11	3.00	60.00	70.00	746.90	106.70
15618	5624	376	1073	1	2023-03-08	4	4.00	90.00	100.00	384.00	38.40
15619	5625	376	1333	1	2022-12-18	2	2.00	310.00	360.00	705.60	98.00
15620	5626	246	51	1	2023-02-25	2	3.00	10.00	10.00	19.40	0.00
15621	5627	246	972	1	2023-08-10	9	2.00	2120.00	2350.00	20727.00	2028.60
15622	5628	563	265	2	2023-02-14	6	4.00	10.00	10.00	57.60	0.00
15623	5629	563	1757	2	2023-09-05	3	3.00	260.00	270.00	785.70	29.10
15624	5630	282	1001	1	2023-08-01	9	3.00	700.00	820.00	7158.60	1047.60
15625	5631	680	476	2	2022-11-26	3	5.00	200.00	230.00	655.50	85.50
15626	5632	680	1022	2	2022-06-09	6	3.00	1020.00	1260.00	7333.20	1396.80
15627	5633	680	45	2	2023-10-27	2	5.00	20.00	20.00	38.00	0.00
15628	5634	44	621	1	2023-05-09	7	4.00	10.00	10.00	67.20	0.00
15629	5635	964	998	5	2023-03-29	5	3.00	130.00	150.00	727.50	97.00
15630	5636	965	341	2	2022-09-06	5	5.00	70.00	80.00	380.00	47.50
15631	5637	965	1524	2	2022-05-08	3	3.00	230.00	280.00	814.80	145.50
15632	5638	214	1758	2	2022-12-25	3	5.00	60.00	60.00	171.00	0.00
15633	5639	178	158	2	2023-12-23	6	5.00	1180.00	1330.00	7581.00	855.00
15634	5640	178	468	2	2022-05-02	3	4.00	540.00	570.00	1641.60	86.40
15635	5641	826	1733	2	2022-11-28	9	2.00	30.00	30.00	264.60	0.00
15636	5642	966	22	5	2023-11-02	4	5.00	10.00	10.00	38.00	0.00
15637	5643	402	248	1	2022-05-19	4	2.00	10.00	10.00	39.20	0.00
15638	5644	468	1304	1	2023-08-10	3	4.00	20.00	20.00	57.60	0.00
15639	5645	67	531	5	2022-02-17	5	5.00	20.00	30.00	142.50	47.50
15640	5646	889	944	2	2023-09-29	5	5.00	60.00	70.00	332.50	47.50
15641	5647	715	1002	2	2023-08-25	14	2.00	170.00	190.00	2606.80	274.40
15642	5648	967	586	2	2023-05-22	3	5.00	20.00	20.00	57.00	0.00
15643	5649	968	1517	1	2023-03-21	5	3.00	30.00	30.00	145.50	0.00
15644	5650	968	1759	1	2023-03-25	5	5.00	50.00	60.00	285.00	47.50
15645	5651	968	1506	1	2023-07-29	2	5.00	10.00	10.00	19.00	0.00
15646	5652	968	179	1	2022-01-18	5	2.00	1070.00	1190.00	5831.00	588.00
15647	5653	253	1523	2	2023-06-23	1	3.00	40.00	40.00	38.80	0.00
15648	5654	127	135	2	2023-05-01	1	5.00	0.00	0.00	0.00	0.00
15649	5655	969	444	5	2023-06-22	4	5.00	40.00	50.00	190.00	38.00
15650	5656	969	513	5	2023-02-09	4	5.00	20.00	20.00	76.00	0.00
15651	5657	969	1750	5	2023-07-31	2	4.00	10.00	10.00	19.20	0.00
15652	5658	969	438	5	2022-09-07	3	2.00	90.00	110.00	323.40	58.80
15653	5659	969	1001	5	2023-04-13	5	3.00	310.00	380.00	1843.00	339.50
15654	5660	969	1509	5	2023-09-28	4	4.00	20.00	20.00	76.80	0.00
15655	5661	969	1379	5	2022-02-11	3	5.00	30.00	30.00	85.50	0.00
15656	5662	730	279	2	2022-05-30	2	3.00	20.00	20.00	38.80	0.00
15657	5663	730	1044	2	2022-05-23	9	4.00	460.00	510.00	4406.40	432.00
15658	5664	473	1760	7	2022-12-26	2	4.00	20.00	20.00	38.40	0.00
15659	5665	473	1086	7	2022-02-25	7	4.00	10.00	10.00	67.20	0.00
15660	5666	473	226	7	2023-10-07	1	2.00	60.00	70.00	68.60	9.80
15661	5667	473	822	7	2022-10-20	2	2.00	80.00	100.00	196.00	39.20
15662	5668	6	677	2	2022-06-03	2	2.00	10.00	10.00	19.60	0.00
15663	5669	6	545	2	2023-11-04	14	3.00	50.00	50.00	679.00	0.00
15664	5670	6	1302	2	2022-05-23	3	4.00	330.00	390.00	1123.20	172.80
15665	5671	970	1741	1	2023-10-16	4	2.00	310.00	360.00	1411.20	196.00
15666	5672	970	1718	1	2022-08-10	3	2.00	120.00	140.00	411.60	58.80
15667	5673	227	1653	2	2022-06-06	2	4.00	20.00	20.00	38.40	0.00
15668	5674	227	524	2	2023-03-09	2	4.00	10.00	10.00	19.20	0.00
15669	5675	203	645	2	2022-04-15	2	5.00	10.00	10.00	19.00	0.00
15670	5676	411	180	2	2023-12-15	6	5.00	50.00	60.00	342.00	57.00
15671	5677	411	1692	2	2022-11-05	4	4.00	30.00	30.00	115.20	0.00
15672	5678	101	1526	2	2022-04-27	3	4.00	40.00	40.00	115.20	0.00
15673	5679	971	849	2	2023-03-21	7	2.00	20.00	20.00	137.20	0.00
15674	5680	971	520	2	2023-09-02	2	4.00	90.00	110.00	211.20	38.40
15675	5681	972	1207	2	2022-10-21	1	3.00	10.00	10.00	9.70	0.00
15676	5682	972	56	2	2023-02-10	1	5.00	10.00	10.00	9.50	0.00
15677	5683	873	1635	2	2022-04-30	3	4.00	20.00	20.00	57.60	0.00
15678	5684	873	1522	2	2022-06-09	7	3.00	1000.00	1050.00	7129.50	339.50
15679	5685	873	1272	2	2022-07-11	5	4.00	140.00	150.00	720.00	48.00
15680	5686	203	103	7	2023-02-15	3	3.00	100.00	100.00	291.00	0.00
15681	5687	973	111	7	2022-06-22	5	4.00	10.00	10.00	48.00	0.00
15682	5688	973	1252	7	2023-06-04	6	3.00	110.00	130.00	756.60	116.40
15683	5689	973	1215	7	2022-08-17	7	3.00	50.00	50.00	339.50	0.00
15684	5690	355	1746	2	2023-11-25	3	5.00	240.00	280.00	798.00	114.00
15685	5691	457	1280	2	2022-01-15	9	4.00	30.00	30.00	259.20	0.00
15686	5692	457	423	2	2022-10-13	5	3.00	40.00	40.00	194.00	0.00
15687	5693	457	525	2	2022-04-14	1	4.00	120.00	130.00	124.80	9.60
15688	5694	457	1715	2	2022-01-22	5	4.00	30.00	30.00	144.00	0.00
15689	5695	457	324	2	2022-09-03	3	2.00	500.00	540.00	1587.60	117.60
15690	5696	10	973	1	2022-03-13	2	3.00	60.00	70.00	135.80	19.40
15691	5697	39	339	2	2022-08-28	9	4.00	30.00	30.00	259.20	0.00
15692	5698	39	1081	2	2022-08-22	1	5.00	10.00	10.00	9.50	0.00
15693	5699	209	580	7	2022-03-09	1	3.00	10.00	10.00	9.70	0.00
15694	5700	10	1666	2	2023-08-04	6	5.00	30.00	40.00	228.00	57.00
15695	5701	906	619	5	2023-01-22	3	5.00	30.00	40.00	114.00	28.50
15696	5702	906	1068	5	2023-04-04	5	5.00	120.00	140.00	665.00	95.00
15697	5703	555	951	2	2022-01-18	1	3.00	0.00	0.00	0.00	0.00
15698	5704	555	1338	2	2022-08-13	1	4.00	120.00	140.00	134.40	19.20
15699	5705	555	765	2	2023-04-27	1	2.00	210.00	260.00	254.80	49.00
15700	5706	79	1563	2	2022-10-23	3	4.00	10.00	10.00	28.80	0.00
15701	5707	253	1596	1	2022-04-20	3	4.00	40.00	40.00	115.20	0.00
15702	5708	104	751	2	2022-04-26	3	4.00	60.00	80.00	230.40	57.60
15703	5709	104	1421	2	2023-11-28	3	5.00	290.00	360.00	1026.00	199.50
15704	5710	104	475	2	2022-03-16	2	2.00	110.00	130.00	254.80	39.20
15705	5711	104	362	2	2023-06-22	7	4.00	2270.00	2800.00	18816.00	3561.60
15706	5712	104	1542	2	2022-01-02	3	4.00	20.00	20.00	57.60	0.00
15707	5713	194	522	7	2023-01-23	1	5.00	30.00	40.00	38.00	9.50
15708	5714	82	870	2	2022-11-03	3	3.00	10.00	10.00	29.10	0.00
15709	5715	261	842	2	2023-02-23	5	2.00	150.00	180.00	882.00	147.00
15710	5716	974	696	1	2023-07-29	5	5.00	560.00	620.00	2945.00	285.00
15711	5717	974	120	1	2023-06-24	3	4.00	30.00	30.00	86.40	0.00
15712	5718	974	1452	1	2023-06-20	7	2.00	60.00	60.00	411.60	0.00
15713	5719	974	931	1	2022-03-10	3	2.00	20.00	30.00	88.20	29.40
15714	5720	573	1570	1	2022-07-10	5	5.00	70.00	80.00	380.00	47.50
15715	5721	487	53	5	2023-07-27	5	2.00	10.00	10.00	49.00	0.00
15716	5722	487	1303	5	2023-03-07	3	3.00	80.00	90.00	261.90	29.10
15717	5723	487	1234	5	2023-01-05	4	3.00	130.00	160.00	620.80	116.40
15718	5724	142	833	2	2022-05-24	2	5.00	10.00	10.00	19.00	0.00
15719	5725	199	943	2	2022-01-25	3	2.00	310.00	330.00	970.20	58.80
15720	5726	213	1337	5	2023-08-19	9	5.00	830.00	900.00	7695.00	598.50
15721	5727	515	982	2	2022-07-04	7	5.00	770.00	950.00	6317.50	1197.00
15722	5728	8	1090	2	2023-12-20	3	2.00	160.00	180.00	529.20	58.80
15723	5729	8	964	2	2022-02-12	3	2.00	920.00	1090.00	3204.60	499.80
15724	5730	8	581	2	2022-10-07	2	2.00	50.00	60.00	117.60	19.60
15725	5731	8	1122	2	2022-08-26	4	2.00	420.00	460.00	1803.20	156.80
15726	5732	8	321	2	2022-02-15	4	4.00	30.00	30.00	115.20	0.00
15727	5733	975	1532	5	2022-11-24	9	2.00	590.00	640.00	5644.80	441.00
15728	5734	975	683	5	2023-08-01	3	4.00	20.00	30.00	86.40	28.80
15729	5735	975	981	5	2023-04-10	2	2.00	20.00	30.00	58.80	19.60
15730	5736	104	1459	2	2022-08-21	3	3.00	10.00	10.00	29.10	0.00
15731	5737	14	365	2	2022-12-25	2	3.00	20.00	20.00	38.80	0.00
15732	5738	14	77	2	2023-06-24	2	3.00	20.00	20.00	38.80	0.00
15733	5739	10	1400	2	2022-01-02	3	5.00	30.00	40.00	114.00	28.50
15734	5740	373	1642	5	2022-10-09	2	4.00	10.00	10.00	19.20	0.00
15735	5741	373	751	5	2022-10-19	1	4.00	30.00	30.00	28.80	0.00
15736	5742	373	1094	5	2023-06-30	2	4.00	490.00	530.00	1017.60	76.80
15737	5743	373	653	5	2022-08-20	4	4.00	30.00	30.00	115.20	0.00
15738	5744	373	579	5	2022-04-15	3	2.00	20.00	20.00	58.80	0.00
15739	5745	373	419	5	2023-04-01	7	4.00	710.00	800.00	5376.00	604.80
15740	5746	373	1393	5	2022-05-29	7	4.00	20.00	20.00	134.40	0.00
15741	5747	976	496	2	2023-09-08	2	5.00	230.00	250.00	475.00	38.00
15742	5748	976	722	2	2022-01-04	3	3.00	60.00	70.00	203.70	29.10
15743	5749	976	1692	2	2022-06-20	3	3.00	20.00	20.00	58.20	0.00
15744	5750	365	1251	2	2022-02-03	5	4.00	60.00	70.00	336.00	48.00
15745	5751	977	11	2	2022-12-17	3	3.00	320.00	360.00	1047.60	116.40
15746	5752	103	1761	2	2023-06-22	3	2.00	40.00	40.00	117.60	0.00
15747	5753	103	618	2	2023-07-22	5	4.00	20.00	20.00	96.00	0.00
15748	5754	207	378	2	2023-03-12	4	2.00	740.00	870.00	3410.40	509.60
15749	5755	30	325	1	2022-04-20	2	3.00	10.00	10.00	19.40	0.00
15750	5756	198	1684	2	2023-04-23	4	4.00	0.00	0.00	0.00	0.00
15751	5757	198	616	2	2023-07-09	5	3.00	1740.00	2000.00	9700.00	1261.00
15752	5758	716	1007	2	2023-06-27	3	2.00	40.00	50.00	147.00	29.40
15753	5759	629	1735	5	2023-01-13	3	4.00	30.00	30.00	86.40	0.00
15754	5760	80	773	7	2023-05-05	4	3.00	450.00	480.00	1862.40	116.40
15755	5761	80	417	7	2023-07-22	1	2.00	10.00	10.00	9.80	0.00
15756	5762	978	1108	5	2022-04-27	3	2.00	480.00	540.00	1587.60	176.40
15757	5763	978	1002	5	2023-11-25	4	4.00	50.00	50.00	192.00	0.00
15758	5764	536	1579	5	2023-11-26	10	4.00	1200.00	1450.00	13920.00	2400.00
15759	5765	6	1756	1	2023-12-16	6	4.00	300.00	350.00	2016.00	288.00
15760	5766	979	873	2	2023-04-04	3	4.00	310.00	330.00	950.40	57.60
15761	5767	453	1352	2	2023-07-16	6	5.00	50.00	60.00	342.00	57.00
15762	5768	165	937	1	2023-10-30	6	3.00	80.00	90.00	523.80	58.20
15763	5769	980	1043	2	2022-09-07	1	2.00	0.00	0.00	0.00	0.00
15764	5770	980	127	2	2023-09-13	4	5.00	20.00	20.00	76.00	0.00
15765	5771	376	528	2	2022-04-29	3	2.00	10.00	10.00	29.40	0.00
15766	5772	376	1365	2	2023-02-15	4	4.00	950.00	1160.00	4454.40	806.40
15767	5773	773	350	2	2022-03-27	1	4.00	550.00	600.00	576.00	48.00
15768	5774	926	356	2	2023-07-16	2	3.00	20.00	20.00	38.80	0.00
15769	5775	234	1757	2	2022-04-20	7	2.00	580.00	640.00	4390.40	411.60
15770	5776	234	730	2	2022-02-26	1	2.00	10.00	10.00	9.80	0.00
15771	5777	168	626	2	2023-11-06	3	5.00	20.00	20.00	57.00	0.00
15772	5778	10	922	2	2022-04-13	1	3.00	90.00	100.00	97.00	9.70
15773	5779	204	401	2	2023-01-04	3	2.00	20.00	30.00	88.20	29.40
15774	5780	204	1154	2	2022-12-22	1	4.00	100.00	110.00	105.60	9.60
15775	5781	14	1762	2	2022-05-25	3	3.00	70.00	70.00	203.70	0.00
15776	5782	981	148	1	2023-09-04	1	4.00	0.00	0.00	0.00	0.00
15777	5783	981	777	1	2023-10-08	4	3.00	20.00	20.00	77.60	0.00
15778	5784	981	1347	1	2023-10-20	4	4.00	30.00	40.00	153.60	38.40
15779	5785	672	367	2	2023-02-18	6	3.00	200.00	220.00	1280.40	116.40
15780	5786	672	598	2	2022-07-18	6	2.00	40.00	40.00	235.20	0.00
15781	5787	672	829	2	2022-11-11	7	4.00	20.00	20.00	134.40	0.00
15782	5788	672	1386	2	2022-02-12	7	2.00	80.00	100.00	686.00	137.20
15783	5789	251	1393	1	2023-02-05	5	2.00	10.00	10.00	49.00	0.00
15784	5790	251	697	1	2022-04-06	3	4.00	0.00	0.00	0.00	0.00
15785	5791	639	660	5	2023-02-15	7	2.00	40.00	40.00	274.40	0.00
15786	5792	639	956	5	2023-02-01	1	4.00	70.00	70.00	67.20	0.00
15787	5793	639	415	5	2023-07-15	2	2.00	90.00	100.00	196.00	19.60
15788	5794	639	29	5	2022-09-10	1	3.00	40.00	50.00	48.50	9.70
15789	5795	639	706	5	2022-04-06	2	3.00	50.00	50.00	97.00	0.00
15790	5796	383	1450	1	2022-08-18	9	4.00	1300.00	1400.00	12096.00	864.00
15791	5797	383	139	1	2022-04-25	4	2.00	110.00	120.00	470.40	39.20
15792	5798	383	920	1	2022-06-12	3	5.00	20.00	20.00	57.00	0.00
15793	5799	383	969	1	2023-01-03	2	4.00	80.00	80.00	153.60	0.00
15794	5800	101	1497	1	2023-03-04	2	5.00	340.00	420.00	798.00	152.00
15795	5801	429	1150	5	2023-10-07	4	2.00	520.00	580.00	2273.60	235.20
15796	5802	429	1554	5	2022-12-21	2	3.00	10.00	10.00	19.40	0.00
15797	5803	982	434	5	2022-01-22	2	5.00	20.00	20.00	38.00	0.00
15798	5804	318	1047	2	2023-02-02	3	5.00	10.00	10.00	28.50	0.00
15799	5805	93	1221	2	2023-09-03	4	2.00	50.00	60.00	235.20	39.20
15800	5806	93	714	2	2023-03-18	3	2.00	180.00	210.00	617.40	88.20
15801	5807	549	728	1	2022-06-27	3	4.00	10.00	10.00	28.80	0.00
15802	5808	549	1310	1	2023-02-19	2	3.00	80.00	90.00	174.60	19.40
15803	5809	549	1572	1	2023-07-04	2	3.00	20.00	30.00	58.20	19.40
15804	5810	983	480	2	2023-04-22	4	5.00	110.00	130.00	494.00	76.00
15805	5811	326	814	2	2022-02-11	4	4.00	90.00	110.00	422.40	76.80
15806	5812	326	1763	2	2022-07-24	2	2.00	80.00	90.00	176.40	19.60
15807	5813	326	648	2	2022-11-06	3	3.00	1270.00	1490.00	4335.90	640.20
15808	5814	126	1724	5	2022-01-31	3	2.00	20.00	20.00	58.80	0.00
15809	5815	202	1208	5	2023-07-26	1	3.00	10.00	10.00	9.70	0.00
15810	5816	984	600	7	2022-07-12	4	3.00	230.00	280.00	1086.40	194.00
15811	5817	984	62	7	2022-01-02	3	3.00	10.00	10.00	29.10	0.00
15812	5818	984	881	7	2022-05-21	4	3.00	20.00	20.00	77.60	0.00
15813	5819	984	323	7	2022-11-24	9	2.00	80.00	90.00	793.80	88.20
15814	5820	984	746	7	2022-03-09	4	5.00	10.00	10.00	38.00	0.00
15815	5821	60	1421	2	2022-08-11	2	3.00	200.00	240.00	465.60	77.60
15816	5822	60	1038	2	2022-10-09	1	2.00	10.00	10.00	9.80	0.00
15817	5823	60	720	2	2023-05-05	5	2.00	270.00	290.00	1421.00	98.00
15818	5824	60	1121	2	2022-10-11	4	2.00	20.00	20.00	78.40	0.00
15819	5825	51	931	7	2022-01-05	3	3.00	20.00	30.00	87.30	29.10
15820	5826	82	977	1	2022-04-18	4	5.00	340.00	420.00	1596.00	304.00
15821	5827	82	1720	1	2023-01-22	1	5.00	70.00	90.00	85.50	19.00
15822	5828	82	212	1	2022-01-31	2	3.00	150.00	180.00	349.20	58.20
15823	5829	82	1062	1	2023-11-03	2	4.00	10.00	10.00	19.20	0.00
15824	5830	517	310	2	2022-01-30	2	2.00	530.00	580.00	1136.80	98.00
15825	5831	517	1145	2	2022-09-02	1	2.00	20.00	30.00	29.40	9.80
15826	5832	287	1302	2	2022-01-29	4	5.00	470.00	520.00	1976.00	190.00
15827	5833	5	949	2	2023-12-05	3	5.00	10.00	10.00	28.50	0.00
15828	5834	5	956	2	2023-12-12	5	5.00	330.00	360.00	1710.00	142.50
15829	5835	484	1637	2	2023-01-13	5	4.00	50.00	60.00	288.00	48.00
15830	5836	484	1161	2	2023-02-16	3	4.00	30.00	40.00	115.20	28.80
15831	5837	484	1701	2	2022-09-27	5	4.00	60.00	70.00	336.00	48.00
15832	5838	234	1764	2	2023-12-27	4	3.00	50.00	60.00	232.80	38.80
15833	5839	68	1765	2	2023-08-30	5	2.00	80.00	80.00	392.00	0.00
15834	5840	374	1194	1	2023-03-05	5	2.00	30.00	30.00	147.00	0.00
15835	5841	374	929	1	2022-02-05	2	2.00	40.00	50.00	98.00	19.60
15836	5842	287	1766	2	2023-03-08	4	2.00	340.00	420.00	1646.40	313.60
15837	5843	287	887	2	2022-07-05	5	5.00	280.00	300.00	1425.00	95.00
15838	5844	287	1703	2	2023-11-08	4	5.00	70.00	80.00	304.00	38.00
15839	5845	287	1668	2	2023-05-02	7	5.00	650.00	780.00	5187.00	864.50
15840	5846	287	989	2	2022-08-23	5	3.00	30.00	30.00	145.50	0.00
15841	5847	287	902	2	2022-08-15	2	5.00	210.00	230.00	437.00	38.00
15842	5848	287	1123	2	2023-11-25	3	4.00	40.00	40.00	115.20	0.00
15843	5849	985	848	2	2022-05-20	2	2.00	600.00	720.00	1411.20	235.20
15844	5850	985	1245	2	2023-07-26	3	5.00	680.00	800.00	2280.00	342.00
15845	5851	985	1573	2	2022-05-01	1	5.00	470.00	550.00	522.50	76.00
15846	5852	985	445	2	2023-12-06	3	3.00	60.00	70.00	203.70	29.10
15847	5853	985	222	2	2023-07-12	3	4.00	30.00	30.00	86.40	0.00
15848	5854	986	309	2	2023-08-17	2	5.00	10.00	10.00	19.00	0.00
15849	5855	93	1199	2	2023-03-20	7	4.00	30.00	30.00	201.60	0.00
15850	5856	93	1512	2	2022-07-13	3	3.00	20.00	20.00	58.20	0.00
15851	5857	93	1283	2	2022-03-08	1	5.00	0.00	0.00	0.00	0.00
15852	5858	93	1257	2	2023-11-01	5	4.00	10.00	10.00	48.00	0.00
15853	5859	171	1602	1	2022-09-21	2	4.00	210.00	240.00	460.80	57.60
15854	5860	987	1001	2	2022-09-20	2	5.00	260.00	300.00	570.00	76.00
15855	5861	285	1051	1	2023-09-10	2	5.00	10.00	10.00	19.00	0.00
15856	5862	550	1767	1	2023-04-30	2	5.00	100.00	110.00	209.00	19.00
15857	5863	550	1308	1	2022-10-01	3	2.00	20.00	20.00	58.80	0.00
15858	5864	550	797	1	2023-05-11	2	3.00	10.00	10.00	19.40	0.00
15859	5865	988	1277	1	2022-12-16	3	3.00	60.00	80.00	232.80	58.20
15860	5866	988	1606	1	2022-01-10	2	4.00	0.00	0.00	0.00	0.00
15861	5867	988	630	1	2022-11-19	5	4.00	1010.00	1130.00	5424.00	576.00
15862	5868	125	513	2	2022-04-27	1	3.00	0.00	0.00	0.00	0.00
15863	5869	125	921	2	2022-08-19	6	2.00	80.00	100.00	588.00	117.60
15864	5870	989	446	2	2023-04-04	4	4.00	1380.00	1600.00	6144.00	844.80
15865	5871	200	1745	7	2022-02-01	7	5.00	1190.00	1290.00	8578.50	665.00
15866	5872	779	102	2	2022-09-23	3	3.00	120.00	130.00	378.30	29.10
15867	5873	402	43	2	2022-11-02	1	2.00	50.00	60.00	58.80	9.80
15868	5874	990	1088	7	2022-12-06	7	3.00	90.00	110.00	746.90	135.80
15869	5875	990	1311	7	2022-08-02	3	2.00	10.00	10.00	29.40	0.00
15870	5876	243	564	5	2023-04-21	3	3.00	10.00	10.00	29.10	0.00
15871	5877	991	670	2	2023-10-03	7	4.00	400.00	450.00	3024.00	336.00
15872	5878	991	1666	2	2022-11-15	3	3.00	20.00	20.00	58.20	0.00
15873	5879	991	1361	2	2023-10-06	6	2.00	240.00	250.00	1470.00	58.80
15874	5880	383	1416	2	2023-06-15	4	5.00	170.00	190.00	722.00	76.00
15875	5881	248	446	2	2022-01-16	2	5.00	700.00	800.00	1520.00	190.00
15876	5882	248	840	2	2023-12-21	9	4.00	340.00	370.00	3196.80	259.20
15877	5883	248	813	2	2022-10-31	9	4.00	830.00	890.00	7689.60	518.40
15878	5884	142	376	1	2022-08-15	2	4.00	20.00	30.00	57.60	19.20
15879	5885	142	1360	1	2022-07-12	3	2.00	4320.00	4910.00	14435.40	1734.60
15880	5886	152	953	7	2023-05-26	3	2.00	10.00	10.00	29.40	0.00
15881	5887	152	604	7	2023-08-12	3	3.00	160.00	180.00	523.80	58.20
15882	5888	992	1355	5	2022-06-06	1	5.00	30.00	40.00	38.00	9.50
15883	5889	993	1768	2	2022-09-29	2	4.00	40.00	50.00	96.00	19.20
15884	5890	521	1096	5	2023-04-01	2	4.00	30.00	30.00	57.60	0.00
15885	5891	101	695	2	2022-10-24	1	3.00	30.00	40.00	38.80	9.70
15886	5892	101	147	2	2022-03-03	2	5.00	20.00	20.00	38.00	0.00
15887	5893	101	152	2	2023-07-12	3	2.00	70.00	80.00	235.20	29.40
15888	5894	185	995	2	2023-12-15	1	3.00	0.00	0.00	0.00	0.00
15889	5895	2	1292	2	2023-12-23	3	3.00	90.00	100.00	291.00	29.10
15890	5896	381	1761	2	2022-08-24	3	2.00	40.00	40.00	117.60	0.00
15891	5897	381	1116	2	2023-09-25	5	3.00	20.00	20.00	97.00	0.00
15892	5898	517	91	2	2023-03-28	4	4.00	70.00	70.00	268.80	0.00
15893	5899	517	1418	2	2023-01-11	4	3.00	230.00	260.00	1008.80	116.40
15894	5900	111	1171	2	2022-11-20	1	4.00	10.00	10.00	9.60	0.00
15895	5901	337	473	2	2022-11-09	9	5.00	20.00	20.00	171.00	0.00
15896	5902	603	1173	2	2022-06-05	3	4.00	30.00	30.00	86.40	0.00
15897	5903	337	369	7	2022-06-21	3	4.00	60.00	60.00	172.80	0.00
15898	5904	337	1714	7	2022-11-27	4	4.00	40.00	50.00	192.00	38.40
15899	5905	337	1715	7	2022-06-14	5	4.00	30.00	30.00	144.00	0.00
15900	5906	337	1656	7	2023-09-28	4	3.00	30.00	40.00	155.20	38.80
15901	5907	337	659	7	2023-05-13	1	4.00	20.00	20.00	19.20	0.00
15902	5908	66	1088	2	2022-06-17	2	3.00	20.00	20.00	38.80	0.00
15903	5909	66	942	2	2022-01-08	3	3.00	50.00	60.00	174.60	29.10
15904	5910	66	1574	2	2023-09-12	3	4.00	10.00	10.00	28.80	0.00
15905	5911	66	1312	2	2022-11-24	3	2.00	80.00	100.00	294.00	58.80
15906	5912	246	178	2	2022-09-24	3	3.00	40.00	50.00	145.50	29.10
15907	5913	994	1769	1	2022-03-11	3	5.00	20.00	30.00	85.50	28.50
15908	5914	134	384	2	2023-11-21	5	2.00	10.00	10.00	49.00	0.00
15909	5915	134	50	2	2023-08-07	7	4.00	70.00	90.00	604.80	134.40
15910	5916	134	914	2	2022-06-08	2	2.00	180.00	200.00	392.00	39.20
15911	5917	134	393	2	2022-09-07	4	2.00	80.00	90.00	352.80	39.20
15912	5918	134	27	2	2022-03-03	6	5.00	3810.00	4230.00	24111.00	2394.00
15913	5919	134	1249	2	2022-02-02	5	4.00	1720.00	2000.00	9600.00	1344.00
15914	5920	134	600	2	2022-12-16	3	4.00	200.00	210.00	604.80	28.80
15915	5921	134	765	2	2022-05-02	2	5.00	550.00	660.00	1254.00	209.00
15916	5922	134	418	2	2023-09-21	2	3.00	100.00	110.00	213.40	19.40
15917	5923	134	1050	2	2022-08-18	4	2.00	60.00	70.00	274.40	39.20
15918	5924	213	972	1	2023-11-24	2	5.00	250.00	310.00	589.00	114.00
15919	5925	30	1242	1	2023-03-14	7	4.00	20.00	20.00	134.40	0.00
15920	5926	995	990	2	2023-07-07	10	4.00	1010.00	1100.00	10560.00	864.00
15921	5927	36	1747	2	2022-11-14	8	5.00	1100.00	1220.00	9272.00	912.00
15922	5928	935	3	2	2023-05-03	1	2.00	10.00	10.00	9.80	0.00
15923	5929	935	1349	2	2022-09-12	4	4.00	10.00	10.00	38.40	0.00
15924	5930	210	673	5	2022-12-29	3	4.00	90.00	90.00	259.20	0.00
15925	5931	210	261	5	2022-05-01	3	3.00	20.00	20.00	58.20	0.00
15926	5932	210	433	5	2022-10-01	2	2.00	630.00	680.00	1332.80	98.00
15927	5933	210	1428	5	2023-03-25	3	4.00	10.00	10.00	28.80	0.00
15928	5934	210	1696	5	2022-04-21	3	2.00	20.00	20.00	58.80	0.00
15929	5935	210	765	5	2022-09-11	2	2.00	490.00	530.00	1038.80	78.40
15930	5936	551	535	7	2023-09-24	5	4.00	30.00	30.00	144.00	0.00
15931	5937	551	1193	7	2023-07-25	3	3.00	160.00	180.00	523.80	58.20
15932	5938	551	994	7	2022-12-10	3	3.00	60.00	70.00	203.70	29.10
15933	5939	444	1212	2	2023-03-09	1	2.00	90.00	100.00	98.00	9.80
15934	5940	444	1723	2	2022-07-18	4	2.00	10.00	10.00	39.20	0.00
15935	5941	14	478	1	2022-01-10	12	2.00	370.00	440.00	5174.40	823.20
15936	5942	14	135	1	2023-11-18	2	2.00	10.00	10.00	19.60	0.00
15937	5943	4	195	2	2023-09-08	4	4.00	190.00	210.00	806.40	76.80
15938	5944	2	1449	2	2023-02-18	1	4.00	10.00	10.00	9.60	0.00
15939	5945	2	453	2	2022-10-16	5	5.00	80.00	100.00	475.00	95.00
15940	5946	2	1348	2	2022-08-23	4	3.00	20.00	30.00	116.40	38.80
15941	5947	2	763	2	2022-12-04	4	3.00	50.00	50.00	194.00	0.00
15942	5948	996	1500	1	2023-12-30	5	3.00	30.00	30.00	145.50	0.00
15943	5949	997	762	7	2022-10-24	4	3.00	30.00	40.00	155.20	38.80
15944	5950	997	410	7	2023-11-02	3	3.00	280.00	300.00	873.00	58.20
15945	5951	997	165	7	2023-02-11	2	4.00	240.00	260.00	499.20	38.40
15946	5952	997	921	7	2022-02-13	6	2.00	210.00	230.00	1352.40	117.60
15947	5953	17	1770	2	2023-05-02	4	4.00	20.00	20.00	76.80	0.00
15948	5954	253	1707	5	2022-08-08	5	5.00	10.00	10.00	47.50	0.00
15949	5955	492	1443	1	2022-10-21	2	5.00	20.00	20.00	38.00	0.00
15950	5956	492	38	1	2023-07-31	4	2.00	430.00	520.00	2038.40	352.80
15951	5957	142	274	1	2022-04-27	5	3.00	550.00	680.00	3298.00	630.50
15952	5958	142	1272	1	2022-07-05	5	4.00	130.00	150.00	720.00	96.00
15953	5959	142	662	1	2022-06-03	4	3.00	30.00	30.00	116.40	0.00
15954	5960	142	624	1	2022-04-10	3	3.00	720.00	770.00	2240.70	145.50
15955	5961	156	1227	1	2022-05-19	4	3.00	20.00	20.00	77.60	0.00
15956	5962	56	517	1	2022-06-01	9	3.00	480.00	580.00	5063.40	873.00
15957	5963	56	1035	1	2023-07-29	2	2.00	10.00	10.00	19.60	0.00
15958	5964	56	760	1	2022-07-25	4	2.00	100.00	120.00	470.40	78.40
15959	5965	142	1323	2	2022-03-11	3	2.00	20.00	20.00	58.80	0.00
15960	5966	142	118	2	2023-11-01	6	2.00	210.00	230.00	1352.40	117.60
15961	5967	142	1518	2	2022-05-25	3	5.00	100.00	110.00	313.50	28.50
15962	5968	44	1523	5	2023-08-23	2	5.00	70.00	80.00	152.00	19.00
15963	5969	287	977	5	2023-08-01	1	4.00	90.00	100.00	96.00	9.60
15964	5970	287	305	5	2022-11-08	2	5.00	10.00	10.00	19.00	0.00
15965	5971	287	389	5	2023-07-16	4	2.00	20.00	20.00	78.40	0.00
15966	5972	287	614	5	2023-10-03	3	4.00	40.00	40.00	115.20	0.00
15967	5973	104	790	2	2023-01-03	1	5.00	210.00	240.00	228.00	28.50
15968	5974	304	1471	2	2023-03-03	2	4.00	360.00	410.00	787.20	96.00
15969	5975	47	888	2	2023-02-14	5	3.00	310.00	390.00	1891.50	388.00
15970	5976	714	735	2	2023-02-22	2	3.00	330.00	360.00	698.40	58.20
15971	5977	714	988	2	2023-09-17	2	2.00	10.00	10.00	19.60	0.00
15972	5978	193	303	5	2023-12-13	10	4.00	490.00	550.00	5280.00	576.00
15973	5979	852	978	2	2022-06-27	5	4.00	340.00	430.00	2064.00	432.00
15974	5980	852	28	2	2023-05-12	2	3.00	20.00	30.00	58.20	19.40
15975	5981	852	168	2	2022-08-23	2	5.00	140.00	160.00	304.00	38.00
15976	5982	852	338	2	2022-07-10	2	3.00	20.00	20.00	38.80	0.00
15977	5983	134	1642	2	2022-02-27	2	5.00	10.00	10.00	19.00	0.00
15978	5984	130	631	1	2023-12-26	6	4.00	20.00	20.00	115.20	0.00
15979	5985	998	1436	2	2022-02-27	6	5.00	160.00	190.00	1083.00	171.00
15980	5986	998	1562	2	2022-11-25	2	3.00	70.00	80.00	155.20	19.40
15981	5987	998	211	2	2023-09-15	4	2.00	80.00	90.00	352.80	39.20
15982	5988	998	1523	2	2022-11-09	6	2.00	210.00	250.00	1470.00	235.20
15983	5989	998	481	2	2023-11-14	1	2.00	10.00	10.00	9.80	0.00
15984	5990	998	1660	2	2023-10-24	5	5.00	460.00	500.00	2375.00	190.00
15985	5991	14	1179	2	2022-04-01	7	5.00	1980.00	2360.00	15694.00	2527.00
15986	5992	14	195	2	2023-06-26	7	3.00	310.00	370.00	2512.30	407.40
15987	5993	14	390	2	2022-03-01	3	2.00	170.00	180.00	529.20	29.40
15988	5994	57	721	7	2022-03-07	5	4.00	50.00	60.00	288.00	48.00
15989	5995	57	1567	7	2023-06-24	2	2.00	10.00	10.00	19.60	0.00
15990	5996	57	1586	7	2023-11-09	5	4.00	400.00	460.00	2208.00	288.00
15991	5997	57	644	7	2023-10-29	4	5.00	350.00	390.00	1482.00	152.00
15992	5998	57	963	7	2022-06-26	3	4.00	260.00	330.00	950.40	201.60
15993	5999	999	902	2	2023-11-12	3	3.00	280.00	340.00	989.40	174.60
15994	6000	999	713	2	2023-11-30	4	5.00	20.00	30.00	114.00	38.00
15995	6001	999	394	2	2022-09-20	4	2.00	90.00	90.00	352.80	0.00
15996	6002	762	1143	2	2022-09-02	3	2.00	90.00	90.00	264.60	0.00
15997	6003	762	531	2	2023-10-08	2	2.00	10.00	10.00	19.60	0.00
15998	6004	324	103	2	2022-06-01	1	3.00	10.00	10.00	9.70	0.00
15999	6005	27	628	2	2022-08-10	4	5.00	20.00	20.00	76.00	0.00
16000	6006	26	1535	2	2022-03-03	2	3.00	100.00	110.00	213.40	19.40
16001	6007	403	1301	2	2023-01-12	3	5.00	110.00	130.00	370.50	57.00
16002	6008	585	102	5	2022-04-30	3	2.00	110.00	130.00	382.20	58.80
16003	6009	14	1139	2	2023-09-03	3	5.00	60.00	70.00	199.50	28.50
16004	6010	14	353	2	2023-03-21	3	3.00	60.00	70.00	203.70	29.10
16005	6011	14	669	2	2023-04-08	6	2.00	2240.00	2550.00	14994.00	1822.80
16006	6012	14	232	2	2022-06-29	3	4.00	230.00	270.00	777.60	115.20
16007	6013	14	1192	2	2023-03-29	3	3.00	260.00	290.00	843.90	87.30
16008	6014	329	1103	5	2023-03-21	5	5.00	10.00	10.00	47.50	0.00
16009	6015	329	1149	5	2022-04-25	8	3.00	3790.00	4160.00	32281.60	2871.20
16010	6016	19	1763	2	2023-10-23	2	4.00	80.00	90.00	172.80	19.20
16011	6017	19	284	2	2022-08-31	7	4.00	30.00	30.00	201.60	0.00
16012	6018	19	1166	2	2023-05-24	3	4.00	20.00	20.00	57.60	0.00
16013	6019	19	1487	2	2022-01-16	1	3.00	50.00	60.00	58.20	9.70
16014	6020	51	10	1	2023-03-24	5	2.00	80.00	90.00	441.00	49.00
16015	6021	1000	1296	7	2023-04-25	2	4.00	20.00	20.00	38.40	0.00
16016	6022	1000	358	7	2023-04-03	2	5.00	60.00	70.00	133.00	19.00
16017	6023	1001	112	2	2023-06-07	3	2.00	10.00	10.00	29.40	0.00
16018	6024	696	1068	5	2023-12-23	2	3.00	60.00	70.00	135.80	19.40
16019	6025	630	1726	1	2022-02-24	8	4.00	590.00	650.00	4992.00	460.80
16020	6026	630	728	1	2022-03-29	2	4.00	10.00	10.00	19.20	0.00
16021	6027	411	1472	2	2023-07-24	5	2.00	10.00	10.00	49.00	0.00
16022	6028	411	832	2	2023-05-15	5	2.00	60.00	70.00	343.00	49.00
16023	6029	312	685	5	2023-09-13	2	5.00	20.00	20.00	38.00	0.00
16024	6030	14	951	5	2023-09-17	3	5.00	10.00	10.00	28.50	0.00
16025	6031	324	1181	7	2022-12-31	1	2.00	200.00	240.00	235.20	39.20
16026	6032	1002	1227	2	2023-06-26	4	5.00	20.00	20.00	76.00	0.00
16027	6033	383	134	5	2022-03-16	5	5.00	40.00	50.00	237.50	47.50
16028	6034	316	1525	2	2023-09-22	3	3.00	20.00	20.00	58.20	0.00
16029	6035	433	415	2	2023-07-03	2	5.00	20.00	20.00	38.00	0.00
16030	6036	433	761	2	2022-03-01	4	2.00	270.00	310.00	1215.20	156.80
16031	6037	911	379	2	2022-09-14	3	5.00	30.00	40.00	114.00	28.50
16032	6038	911	413	2	2023-07-03	6	4.00	100.00	110.00	633.60	57.60
16033	6039	911	572	2	2023-07-12	4	2.00	120.00	130.00	509.60	39.20
16034	6040	911	1274	2	2022-04-19	3	5.00	10.00	10.00	28.50	0.00
16035	6041	177	1119	2	2022-10-28	3	2.00	730.00	860.00	2528.40	382.20
16036	6042	177	1771	2	2022-04-17	3	2.00	460.00	510.00	1499.40	147.00
16037	6043	1003	1105	2	2023-10-21	2	3.00	10.00	10.00	19.40	0.00
16038	6044	778	542	1	2023-08-01	3	5.00	250.00	310.00	883.50	171.00
16039	6045	778	1051	1	2023-04-08	7	3.00	30.00	30.00	203.70	0.00
16040	6046	196	1072	2	2022-07-06	3	4.00	200.00	240.00	691.20	115.20
16041	6047	687	1745	2	2022-04-22	3	4.00	580.00	690.00	1987.20	316.80
16042	6048	418	571	2	2022-02-06	9	3.00	20.00	20.00	174.60	0.00
16043	6049	418	1177	2	2023-12-25	5	2.00	1160.00	1350.00	6615.00	931.00
16044	6050	75	1694	5	2022-04-13	7	5.00	150.00	170.00	1130.50	133.00
16045	6051	363	333	2	2023-06-06	5	2.00	60.00	60.00	294.00	0.00
16046	6052	363	1310	2	2022-03-17	5	2.00	260.00	270.00	1323.00	49.00
16047	6053	732	1026	1	2023-10-01	3	2.00	10.00	10.00	29.40	0.00
16048	6054	732	1458	1	2022-02-19	4	2.00	30.00	30.00	117.60	0.00
16049	6055	732	700	1	2023-08-03	7	4.00	10.00	10.00	67.20	0.00
16050	6056	782	1340	5	2022-12-31	1	5.00	0.00	0.00	0.00	0.00
16051	6057	782	1403	5	2022-05-16	8	2.00	70.00	80.00	627.20	78.40
16052	6058	44	153	2	2023-09-09	2	3.00	10.00	10.00	19.40	0.00
16053	6059	44	58	2	2023-05-05	5	4.00	40.00	40.00	192.00	0.00
16054	6060	210	1564	2	2022-03-03	2	3.00	30.00	30.00	58.20	0.00
16055	6061	674	842	2	2022-08-14	4	4.00	120.00	140.00	537.60	76.80
16056	6062	674	283	2	2023-05-05	3	4.00	10.00	10.00	28.80	0.00
16057	6063	103	852	1	2022-02-13	5	5.00	1040.00	1200.00	5700.00	760.00
16058	6064	103	795	1	2022-11-19	3	5.00	10.00	10.00	28.50	0.00
16059	6065	103	458	1	2022-11-22	3	2.00	20.00	20.00	58.80	0.00
16060	6066	210	640	5	2022-04-24	6	4.00	20.00	20.00	115.20	0.00
16061	6067	1004	1206	2	2023-01-31	8	3.00	80.00	90.00	698.40	77.60
16062	6068	1005	406	2	2023-05-12	8	5.00	480.00	520.00	3952.00	304.00
16063	6069	1005	771	2	2022-12-18	1	2.00	10.00	10.00	9.80	0.00
16064	6070	1005	1772	2	2023-10-16	1	2.00	290.00	340.00	333.20	49.00
16065	6071	86	677	2	2023-01-07	3	2.00	20.00	20.00	58.80	0.00
16066	6072	132	622	2	2023-10-25	2	2.00	130.00	150.00	294.00	39.20
16067	6073	132	846	2	2023-01-17	2	4.00	0.00	0.00	0.00	0.00
16068	6074	132	328	2	2022-08-24	2	2.00	10.00	10.00	19.60	0.00
16069	6075	177	1243	2	2022-07-15	3	3.00	140.00	150.00	436.50	29.10
16070	6076	177	274	2	2022-09-30	2	2.00	230.00	270.00	529.20	78.40
16071	6077	383	476	2	2022-08-19	6	4.00	400.00	470.00	2707.20	403.20
16072	6078	383	1520	2	2022-06-20	2	5.00	60.00	70.00	133.00	19.00
16073	6079	383	504	2	2022-12-30	3	3.00	10.00	10.00	29.10	0.00
16074	6080	383	442	2	2023-02-26	3	4.00	180.00	190.00	547.20	28.80
16075	6081	355	1223	5	2023-10-25	9	3.00	130.00	150.00	1309.50	174.60
16076	6082	1006	1599	7	2022-08-03	5	2.00	30.00	30.00	147.00	0.00
16077	6083	141	1500	2	2022-06-17	6	3.00	10.00	10.00	58.20	0.00
16078	6084	141	1610	2	2023-04-23	9	3.00	20.00	20.00	174.60	0.00
16079	6085	141	1375	2	2023-07-19	2	4.00	20.00	20.00	38.40	0.00
16080	6086	141	949	2	2022-01-10	1	4.00	0.00	0.00	0.00	0.00
16081	6087	141	1391	2	2023-01-15	6	2.00	0.00	0.00	0.00	0.00
16082	6088	183	222	2	2022-01-25	3	5.00	20.00	30.00	85.50	28.50
16083	6089	468	681	2	2022-04-09	1	2.00	10.00	10.00	9.80	0.00
16084	6090	914	923	1	2022-05-18	2	5.00	0.00	0.00	0.00	0.00
16085	6091	134	932	2	2022-08-15	3	4.00	220.00	270.00	777.60	144.00
16086	6092	134	1773	2	2022-10-31	2	4.00	180.00	210.00	403.20	57.60
16087	6093	134	1672	2	2023-11-11	9	4.00	30.00	40.00	345.60	86.40
16088	6094	134	478	2	2023-08-21	2	5.00	60.00	70.00	133.00	19.00
16089	6095	134	76	2	2022-07-15	4	2.00	40.00	50.00	196.00	39.20
16090	6096	134	321	2	2023-04-19	2	2.00	10.00	10.00	19.60	0.00
16091	6097	134	52	2	2023-04-06	1	2.00	60.00	80.00	78.40	19.60
16092	6098	134	186	2	2023-07-09	3	2.00	10.00	10.00	29.40	0.00
16093	6099	134	53	2	2023-12-22	2	3.00	0.00	0.00	0.00	0.00
16094	6100	134	285	2	2023-08-26	11	4.00	2570.00	2890.00	30518.40	3379.20
16095	6101	134	1149	2	2022-12-19	2	3.00	1140.00	1300.00	2522.00	310.40
16096	6102	134	446	2	2023-02-25	5	3.00	2140.00	2250.00	10912.50	533.50
16097	6103	134	140	2	2022-10-05	3	3.00	90.00	100.00	291.00	29.10
16098	6104	134	85	2	2023-09-13	3	2.00	50.00	60.00	176.40	29.40
16099	6105	282	737	5	2022-02-27	2	2.00	250.00	310.00	607.60	117.60
16100	6106	1007	320	2	2023-03-06	4	4.00	10.00	10.00	38.40	0.00
16101	6107	535	536	2	2023-03-12	2	2.00	20.00	20.00	39.20	0.00
16102	6108	535	961	2	2023-01-19	5	2.00	60.00	70.00	343.00	49.00
16103	6109	194	1551	2	2022-10-30	2	5.00	10.00	10.00	19.00	0.00
16104	6110	194	1311	2	2023-01-14	3	2.00	0.00	0.00	0.00	0.00
16105	6111	398	1497	2	2023-06-02	7	4.00	1180.00	1470.00	9878.40	1948.80
16106	6112	398	15	2	2023-11-11	2	4.00	100.00	110.00	211.20	19.20
16107	6113	398	204	2	2023-03-16	6	2.00	20.00	20.00	117.60	0.00
16108	6114	398	2	2	2023-12-09	9	3.00	1320.00	1540.00	13444.20	1920.60
16109	6115	398	624	2	2022-04-28	2	5.00	360.00	450.00	855.00	171.00
16110	6116	1008	45	2	2022-12-25	6	4.00	40.00	40.00	230.40	0.00
16111	6117	304	1774	2	2023-08-31	4	5.00	2170.00	2280.00	8664.00	418.00
16112	6118	304	640	2	2023-09-19	3	4.00	10.00	10.00	28.80	0.00
16113	6119	487	517	2	2023-04-25	3	5.00	160.00	190.00	541.50	85.50
16114	6120	487	1069	2	2023-04-23	3	4.00	20.00	20.00	57.60	0.00
16115	6121	487	442	2	2023-07-23	8	3.00	330.00	410.00	3181.60	620.80
16116	6122	487	367	2	2022-09-17	2	5.00	60.00	70.00	133.00	19.00
16117	6123	101	1425	2	2022-03-05	2	2.00	50.00	60.00	117.60	19.60
16118	6124	1009	1255	2	2023-01-19	4	4.00	20.00	20.00	76.80	0.00
16119	6125	2	1045	2	2023-01-30	5	4.00	40.00	40.00	192.00	0.00
16120	6126	2	1775	2	2023-03-21	2	3.00	10.00	10.00	19.40	0.00
16121	6127	2	767	2	2022-08-04	1	3.00	0.00	0.00	0.00	0.00
16122	6128	31	164	2	2022-07-31	6	4.00	270.00	330.00	1900.80	345.60
16123	6129	142	1088	5	2022-01-08	4	4.00	50.00	50.00	192.00	0.00
16124	6130	986	937	2	2023-03-06	3	2.00	40.00	50.00	147.00	29.40
16125	6131	986	1015	2	2023-04-27	2	2.00	0.00	0.00	0.00	0.00
16126	6132	304	213	2	2023-04-22	14	2.00	660.00	770.00	10564.40	1509.20
16127	6133	1010	1523	2	2023-03-25	5	5.00	140.00	160.00	760.00	95.00
16128	6134	156	1530	5	2023-10-13	2	3.00	140.00	160.00	310.40	38.80
16129	6135	878	282	7	2022-03-01	4	4.00	160.00	190.00	729.60	115.20
16130	6136	1011	1576	2	2022-11-23	3	3.00	30.00	30.00	87.30	0.00
16131	6137	1011	1307	2	2023-12-25	6	2.00	60.00	70.00	411.60	58.80
16132	6138	802	482	1	2023-01-17	6	5.00	30.00	30.00	171.00	0.00
16133	6139	152	431	2	2023-02-25	2	3.00	180.00	210.00	407.40	58.20
16134	6140	1012	1425	5	2023-11-08	3	3.00	100.00	120.00	349.20	58.20
16135	6141	855	1767	2	2023-01-17	5	4.00	230.00	270.00	1296.00	192.00
16136	6142	855	1167	2	2023-03-09	4	3.00	170.00	200.00	776.00	116.40
16137	6143	855	958	2	2023-01-10	2	2.00	210.00	260.00	509.60	98.00
16138	6144	855	1572	2	2022-12-28	6	5.00	110.00	120.00	684.00	57.00
16139	6145	266	1071	2	2022-03-04	3	2.00	20.00	20.00	58.80	0.00
16140	6146	308	502	2	2023-09-05	4	2.00	10.00	10.00	39.20	0.00
16141	6147	60	502	2	2023-08-23	4	3.00	10.00	10.00	38.80	0.00
16142	6148	60	987	2	2023-04-16	2	5.00	30.00	40.00	76.00	19.00
16143	6149	10	1552	1	2023-04-25	2	3.00	190.00	200.00	388.00	19.40
16144	6150	127	57	5	2023-11-22	6	4.00	320.00	340.00	1958.40	115.20
16145	6151	375	1545	5	2022-11-09	5	3.00	280.00	350.00	1697.50	339.50
16146	6152	258	1602	1	2022-12-23	10	3.00	1030.00	1200.00	11640.00	1649.00
16147	6153	27	211	2	2023-08-15	4	4.00	80.00	90.00	345.60	38.40
16148	6154	86	1417	5	2022-03-04	2	4.00	50.00	50.00	96.00	0.00
16149	6155	86	81	5	2023-09-05	3	5.00	40.00	50.00	142.50	28.50
16150	6156	86	404	5	2022-09-15	1	4.00	290.00	330.00	316.80	38.40
16151	6157	86	1382	5	2022-02-15	3	2.00	30.00	40.00	117.60	29.40
16152	6158	498	114	1	2022-09-09	3	4.00	60.00	80.00	230.40	57.60
16153	6159	498	1776	1	2023-04-01	12	3.00	160.00	170.00	1978.80	116.40
16154	6160	14	1663	2	2022-04-06	4	4.00	650.00	770.00	2956.80	460.80
16155	6161	697	525	5	2023-09-21	3	3.00	280.00	320.00	931.20	116.40
16156	6162	697	1140	5	2022-07-18	4	3.00	10.00	10.00	38.80	0.00
16157	6163	697	377	5	2022-10-28	3	5.00	30.00	30.00	85.50	0.00
16158	6164	697	1404	5	2022-05-24	5	4.00	30.00	30.00	144.00	0.00
16159	6165	697	1036	5	2022-01-23	3	5.00	0.00	0.00	0.00	0.00
16160	6166	697	1683	5	2022-10-30	3	3.00	20.00	20.00	58.20	0.00
16161	6167	697	1773	5	2022-05-15	2	5.00	160.00	170.00	323.00	19.00
16162	6168	75	127	2	2023-03-08	3	5.00	110.00	120.00	342.00	28.50
16163	6169	177	497	1	2023-05-31	2	2.00	20.00	20.00	39.20	0.00
16164	6170	30	482	1	2023-04-20	2	3.00	10.00	10.00	19.40	0.00
16165	6171	49	1396	1	2023-01-29	3	5.00	30.00	30.00	85.50	0.00
16166	6172	49	825	1	2023-03-31	2	5.00	0.00	0.00	0.00	0.00
16167	6173	625	952	2	2023-08-27	5	5.00	20.00	30.00	142.50	47.50
16168	6174	625	1652	2	2022-11-02	2	5.00	20.00	20.00	38.00	0.00
16169	6175	625	1075	2	2023-01-11	2	3.00	710.00	840.00	1629.60	252.20
16170	6176	40	775	2	2023-05-19	4	3.00	1420.00	1690.00	6557.20	1047.60
16171	6177	40	577	2	2022-05-28	7	2.00	80.00	90.00	617.40	68.60
16172	6178	40	1698	2	2022-02-12	2	5.00	100.00	120.00	228.00	38.00
16173	6179	40	1777	2	2022-02-23	4	2.00	20.00	20.00	78.40	0.00
16174	6180	40	912	2	2022-01-04	2	3.00	60.00	60.00	116.40	0.00
16175	6181	40	1371	2	2022-09-15	5	3.00	510.00	630.00	3055.50	582.00
16176	6182	40	530	2	2023-11-23	3	2.00	90.00	110.00	323.40	58.80
16177	6183	40	348	2	2022-09-20	2	5.00	10.00	10.00	19.00	0.00
16178	6184	40	17	2	2023-05-13	8	3.00	710.00	890.00	6906.40	1396.80
16179	6185	43	39	5	2022-06-14	5	5.00	380.00	400.00	1900.00	95.00
16180	6186	210	819	2	2022-05-20	10	4.00	100.00	110.00	1056.00	96.00
16181	6187	49	393	5	2022-05-20	3	5.00	60.00	70.00	199.50	28.50
16182	6188	49	1345	5	2022-07-14	6	2.00	20.00	30.00	176.40	58.80
16183	6189	49	1042	5	2023-05-15	6	4.00	110.00	120.00	691.20	57.60
16184	6190	1013	1192	2	2023-03-12	4	3.00	360.00	380.00	1474.40	77.60
16185	6191	134	1741	2	2023-08-13	9	5.00	750.00	800.00	6840.00	427.50
16186	6192	6	471	7	2022-08-16	3	2.00	30.00	30.00	88.20	0.00
16187	6193	141	713	2	2022-10-07	5	2.00	20.00	30.00	147.00	49.00
16188	6194	141	859	2	2022-10-18	5	5.00	10.00	10.00	47.50	0.00
16189	6195	141	641	2	2023-01-18	5	3.00	70.00	80.00	388.00	48.50
16190	6196	130	904	2	2022-01-01	2	3.00	300.00	330.00	640.20	58.20
16191	6197	130	1070	2	2023-05-08	3	3.00	60.00	70.00	203.70	29.10
16192	6198	167	1347	2	2022-01-25	7	4.00	50.00	60.00	403.20	67.20
16193	6199	167	1260	2	2023-10-05	3	2.00	50.00	50.00	147.00	0.00
16194	6200	167	695	2	2023-02-09	2	5.00	80.00	100.00	190.00	38.00
16195	6201	249	1078	2	2023-05-05	4	3.00	1370.00	1440.00	5587.20	271.60
16196	6202	249	1701	2	2022-01-24	3	5.00	30.00	40.00	114.00	28.50
16197	6203	1014	902	2	2023-06-20	5	4.00	460.00	560.00	2688.00	480.00
16198	6204	51	1693	2	2023-10-26	8	4.00	190.00	240.00	1843.20	384.00
16199	6205	1015	764	5	2023-11-12	2	2.00	10.00	10.00	19.60	0.00
16200	6206	141	1347	1	2022-11-30	7	5.00	50.00	50.00	332.50	0.00
16201	6207	141	551	1	2023-05-31	4	2.00	30.00	30.00	117.60	0.00
16202	6208	141	395	1	2023-05-29	1	2.00	50.00	60.00	58.80	9.80
16203	6209	854	912	2	2022-08-08	2	5.00	50.00	50.00	95.00	0.00
16204	6210	237	761	2	2023-01-07	9	2.00	2260.00	2790.00	24607.80	4674.60
16205	6211	237	385	2	2023-09-10	7	3.00	890.00	1000.00	6790.00	746.90
16206	6212	237	505	2	2023-02-14	3	4.00	60.00	70.00	201.60	28.80
16207	6213	1016	830	1	2023-07-09	3	2.00	20.00	20.00	58.80	0.00
16208	6214	1016	514	1	2022-08-01	2	3.00	70.00	80.00	155.20	19.40
16209	6215	900	589	2	2022-08-15	1	4.00	10.00	10.00	9.60	0.00
16210	6216	49	206	2	2023-07-05	3	2.00	60.00	70.00	205.80	29.40
16211	6217	49	838	2	2022-12-10	8	2.00	50.00	60.00	470.40	78.40
16212	6218	226	1137	2	2023-03-07	3	3.00	20.00	30.00	87.30	29.10
16213	6219	250	1021	2	2023-12-20	6	5.00	110.00	130.00	741.00	114.00
16214	6220	250	665	2	2022-08-27	2	3.00	170.00	190.00	368.60	38.80
16215	6221	250	384	2	2022-01-02	7	2.00	20.00	20.00	137.20	0.00
16216	6222	70	920	1	2023-12-29	9	4.00	60.00	60.00	518.40	0.00
16217	6223	1017	206	2	2022-01-29	4	4.00	60.00	70.00	268.80	38.40
16218	6224	1017	910	2	2022-12-06	7	3.00	10.00	10.00	67.90	0.00
16219	6225	1017	73	2	2022-10-29	3	2.00	180.00	220.00	646.80	117.60
16220	6226	113	1488	2	2023-06-15	1	4.00	60.00	70.00	67.20	9.60
16221	6227	113	1456	2	2023-10-21	4	2.00	260.00	290.00	1136.80	117.60
16222	6228	1018	688	2	2022-01-11	3	4.00	80.00	90.00	259.20	28.80
16223	6229	906	41	2	2023-07-06	4	4.00	90.00	110.00	422.40	76.80
16224	6230	906	44	2	2022-11-26	3	2.00	50.00	60.00	176.40	29.40
16225	6231	1019	774	2	2022-06-14	4	5.00	30.00	30.00	114.00	0.00
16226	6232	203	638	7	2022-12-18	2	3.00	150.00	180.00	349.20	58.20
16227	6233	203	511	7	2023-01-22	3	5.00	20.00	20.00	57.00	0.00
16228	6234	203	512	7	2023-02-17	11	3.00	70.00	70.00	746.90	0.00
16229	6235	203	1499	7	2022-06-08	5	3.00	1190.00	1470.00	7129.50	1358.00
16230	6236	203	1778	7	2023-04-08	5	3.00	60.00	80.00	388.00	97.00
16231	6237	86	245	2	2022-02-11	3	2.00	60.00	60.00	176.40	0.00
16232	6238	31	1264	2	2022-05-28	4	3.00	20.00	30.00	116.40	38.80
16233	6239	308	1282	2	2022-10-25	3	2.00	140.00	170.00	499.80	88.20
16234	6240	308	735	2	2022-03-26	2	4.00	300.00	360.00	691.20	115.20
16235	6241	204	909	1	2022-02-15	1	4.00	10.00	10.00	9.60	0.00
16236	6242	893	1436	1	2022-09-27	8	2.00	230.00	250.00	1960.00	156.80
16237	6243	274	1000	2	2022-07-08	2	5.00	20.00	20.00	38.00	0.00
16238	6244	1020	1567	2	2022-08-06	3	3.00	30.00	30.00	87.30	0.00
16239	6245	67	1168	2	2023-09-13	6	4.00	100.00	120.00	691.20	115.20
16240	6246	67	1257	2	2023-07-16	3	2.00	20.00	20.00	58.80	0.00
16241	6247	67	1696	2	2022-02-14	2	5.00	10.00	10.00	19.00	0.00
16242	6248	167	1312	2	2023-01-26	1	4.00	40.00	40.00	38.40	0.00
16243	6249	167	1036	2	2022-04-26	3	4.00	10.00	10.00	28.80	0.00
16244	6250	167	1779	2	2023-10-12	2	4.00	390.00	470.00	902.40	153.60
16245	6251	167	227	2	2023-01-22	1	4.00	10.00	10.00	9.60	0.00
16246	6252	118	361	5	2023-06-20	1	2.00	0.00	0.00	0.00	0.00
16247	6253	1021	491	7	2022-05-20	9	5.00	60.00	60.00	513.00	0.00
16248	6254	1021	1087	7	2023-11-15	3	5.00	180.00	200.00	570.00	57.00
16249	6255	499	1566	2	2022-02-26	8	3.00	20.00	20.00	155.20	0.00
16250	6256	1022	86	2	2023-03-21	4	3.00	10.00	10.00	38.80	0.00
16251	6257	1023	1427	1	2023-06-06	1	3.00	0.00	0.00	0.00	0.00
16252	6258	57	263	1	2022-07-11	2	5.00	360.00	380.00	722.00	38.00
16253	6259	31	662	1	2023-09-09	3	5.00	20.00	20.00	57.00	0.00
16254	6260	517	799	1	2022-08-02	4	4.00	10.00	10.00	38.40	0.00
16255	6261	68	526	2	2023-11-01	3	2.00	10.00	10.00	29.40	0.00
16256	6262	536	323	2	2022-06-23	4	3.00	30.00	40.00	155.20	38.80
16257	6263	953	383	5	2023-12-20	7	3.00	400.00	440.00	2987.60	271.60
16258	6264	135	1024	2	2023-05-22	3	3.00	30.00	30.00	87.30	0.00
16259	6265	498	69	7	2023-05-11	5	5.00	30.00	30.00	142.50	0.00
16260	6266	611	835	2	2022-11-03	2	2.00	0.00	0.00	0.00	0.00
16261	6267	611	682	2	2022-01-29	9	4.00	120.00	140.00	1209.60	172.80
16262	6268	1024	496	1	2023-08-10	2	2.00	290.00	310.00	607.60	39.20
16263	6269	1024	1367	1	2023-12-25	5	3.00	20.00	20.00	97.00	0.00
16264	6270	333	141	2	2023-03-28	1	2.00	30.00	40.00	39.20	9.80
16265	6271	333	1579	2	2023-06-03	9	2.00	1030.00	1160.00	10231.20	1146.60
16266	6272	333	916	2	2022-10-29	5	3.00	170.00	180.00	873.00	48.50
16267	6273	1025	1197	5	2022-04-27	7	4.00	100.00	120.00	806.40	134.40
16268	6274	203	1380	1	2023-01-30	3	5.00	10.00	10.00	28.50	0.00
16269	6275	203	1780	1	2022-11-26	3	5.00	400.00	430.00	1225.50	85.50
16270	6276	203	1593	1	2022-09-22	5	3.00	20.00	20.00	97.00	0.00
16271	6277	203	301	1	2022-02-20	7	4.00	80.00	90.00	604.80	67.20
16272	6278	203	55	1	2023-05-27	2	2.00	60.00	70.00	137.20	19.60
16273	6279	203	781	1	2023-01-24	2	4.00	20.00	20.00	38.40	0.00
16274	6280	203	962	1	2023-02-26	3	5.00	10.00	10.00	28.50	0.00
16275	6281	144	1140	2	2022-04-27	2	3.00	10.00	10.00	19.40	0.00
16276	6282	555	1781	2	2022-10-16	2	3.00	50.00	60.00	116.40	19.40
16277	6283	555	1756	2	2023-03-07	3	5.00	120.00	140.00	399.00	57.00
16278	6284	19	1698	2	2022-09-07	5	3.00	280.00	300.00	1455.00	97.00
16279	6285	19	1154	2	2023-09-05	5	3.00	490.00	560.00	2716.00	339.50
16280	6286	514	1259	2	2023-01-28	2	3.00	590.00	660.00	1280.40	135.80
16281	6287	1026	836	2	2023-11-07	3	5.00	200.00	240.00	684.00	114.00
16282	6288	60	1022	2	2022-05-18	3	5.00	460.00	500.00	1425.00	114.00
16283	6289	60	801	2	2022-05-11	6	3.00	160.00	200.00	1164.00	232.80
16284	6290	1027	121	1	2023-10-01	4	3.00	790.00	920.00	3569.60	504.40
16285	6291	1027	515	1	2022-04-04	8	2.00	280.00	330.00	2587.20	392.00
16286	6292	567	1132	5	2023-03-09	2	4.00	610.00	700.00	1344.00	172.80
16287	6293	204	688	2	2022-08-26	3	5.00	70.00	90.00	256.50	57.00
16288	6294	204	1395	2	2022-10-07	3	4.00	50.00	60.00	172.80	28.80
16289	6295	25	736	5	2022-02-15	1	3.00	30.00	30.00	29.10	0.00
16290	6296	1028	1365	2	2022-08-17	6	2.00	1570.00	1740.00	10231.20	999.60
16291	6297	1028	427	2	2023-11-26	5	2.00	670.00	700.00	3430.00	147.00
16292	6298	1028	1734	2	2022-05-23	4	3.00	120.00	140.00	543.20	77.60
16293	6299	841	59	2	2022-01-02	3	4.00	40.00	40.00	115.20	0.00
16294	6300	427	1782	5	2022-03-05	3	5.00	30.00	30.00	85.50	0.00
16295	6301	118	103	2	2023-09-05	3	4.00	20.00	20.00	57.60	0.00
16296	6302	118	756	2	2023-06-04	2	5.00	10.00	10.00	19.00	0.00
16297	6303	89	1693	2	2023-10-01	5	2.00	190.00	200.00	980.00	49.00
16298	6304	1029	1091	1	2022-09-19	3	3.00	60.00	70.00	203.70	29.10
16299	6305	134	712	7	2022-05-19	1	2.00	10.00	10.00	9.80	0.00
16300	6306	1030	1591	1	2022-04-07	7	4.00	20.00	20.00	134.40	0.00
16301	6307	1030	1586	1	2022-11-29	1	5.00	80.00	100.00	95.00	19.00
16302	6308	1030	1674	1	2022-07-21	3	5.00	40.00	50.00	142.50	28.50
16303	6309	1030	1632	1	2023-08-27	3	3.00	570.00	650.00	1891.50	232.80
16304	6310	1030	509	1	2023-11-08	8	4.00	600.00	630.00	4838.40	230.40
16305	6311	1030	641	1	2023-04-24	1	4.00	20.00	20.00	19.20	0.00
16306	6312	1031	102	2	2022-07-09	3	2.00	120.00	130.00	382.20	29.40
16307	6313	818	1663	2	2022-01-19	3	3.00	520.00	580.00	1687.80	174.60
16308	6314	818	1251	2	2022-12-26	1	2.00	10.00	10.00	9.80	0.00
16309	6315	753	109	2	2023-03-08	4	4.00	120.00	150.00	576.00	115.20
16310	6316	753	509	2	2022-01-21	2	4.00	180.00	200.00	384.00	38.40
16311	6317	753	1416	2	2022-07-23	3	5.00	120.00	140.00	399.00	57.00
16312	6318	753	227	2	2023-11-08	2	4.00	20.00	20.00	38.40	0.00
16313	6319	1032	1558	1	2022-09-23	5	2.00	40.00	40.00	196.00	0.00
16314	6320	1032	127	1	2023-02-27	6	4.00	20.00	30.00	172.80	57.60
16315	6321	251	586	2	2023-07-07	2	5.00	10.00	10.00	19.00	0.00
16316	6322	240	508	2	2022-05-31	3	3.00	10.00	10.00	29.10	0.00
16317	6323	1033	662	1	2022-11-13	2	3.00	20.00	20.00	38.80	0.00
16318	6324	436	1735	2	2023-04-27	3	3.00	60.00	70.00	203.70	29.10
16319	6325	142	482	2	2023-09-01	5	4.00	20.00	30.00	144.00	48.00
16320	6326	142	440	2	2022-07-11	4	2.00	180.00	210.00	823.20	117.60
16321	6327	22	5	2	2023-12-14	1	4.00	10.00	10.00	9.60	0.00
16322	6328	22	270	2	2022-01-19	3	2.00	250.00	270.00	793.80	58.80
16323	6329	22	537	2	2022-10-02	5	2.00	20.00	20.00	98.00	0.00
16324	6330	22	15	2	2023-07-25	4	4.00	230.00	250.00	960.00	76.80
16325	6331	22	1292	2	2022-12-06	2	5.00	60.00	70.00	133.00	19.00
16326	6332	22	1065	2	2022-08-16	3	5.00	30.00	40.00	114.00	28.50
16327	6333	22	876	2	2022-07-15	3	3.00	10.00	10.00	29.10	0.00
16328	6334	22	991	2	2023-08-22	5	4.00	30.00	30.00	144.00	0.00
16329	6335	383	315	2	2023-03-17	4	2.00	40.00	50.00	196.00	39.20
16330	6336	383	1204	2	2023-05-15	5	5.00	20.00	20.00	95.00	0.00
16331	6337	204	1531	2	2023-06-20	4	5.00	50.00	50.00	190.00	0.00
16332	6338	204	1496	2	2023-02-13	5	5.00	290.00	340.00	1615.00	237.50
16333	6339	49	1514	2	2022-02-22	4	2.00	70.00	90.00	352.80	78.40
16334	6340	49	813	2	2023-04-07	2	4.00	180.00	220.00	422.40	76.80
16335	6341	49	1647	2	2022-02-21	4	5.00	4520.00	5200.00	19760.00	2584.00
16336	6342	630	1167	5	2022-04-14	4	4.00	140.00	160.00	614.40	76.80
16337	6343	1034	241	5	2023-03-03	3	4.00	100.00	120.00	345.60	57.60
16338	6344	1034	339	5	2022-12-08	2	2.00	20.00	30.00	58.80	19.60
16339	6345	1034	1003	5	2022-04-03	2	5.00	60.00	70.00	133.00	19.00
16340	6346	1034	1603	5	2023-10-10	3	4.00	540.00	590.00	1699.20	144.00
16341	6347	126	1124	7	2022-10-03	5	4.00	20.00	20.00	96.00	0.00
16342	6348	10	339	2	2023-01-02	1	3.00	10.00	10.00	9.70	0.00
16343	6349	10	254	2	2023-05-24	3	2.00	40.00	40.00	117.60	0.00
16344	6350	10	355	2	2022-11-06	2	3.00	30.00	40.00	77.60	19.40
16345	6351	442	798	2	2023-04-03	5	3.00	100.00	110.00	533.50	48.50
16346	6352	1007	945	2	2022-01-17	2	5.00	330.00	360.00	684.00	57.00
16347	6353	210	1233	2	2023-04-11	1	3.00	0.00	0.00	0.00	0.00
16348	6354	213	1613	2	2022-05-09	1	4.00	10.00	10.00	9.60	0.00
16349	6355	213	982	2	2023-06-10	2	2.00	310.00	340.00	666.40	58.80
16350	6356	210	194	2	2022-07-01	5	3.00	70.00	80.00	388.00	48.50
16351	6357	237	1182	2	2023-09-12	5	5.00	20.00	20.00	95.00	0.00
16352	6358	237	748	2	2023-05-29	4	5.00	30.00	30.00	114.00	0.00
16353	6359	237	1010	2	2022-11-24	1	5.00	10.00	10.00	9.50	0.00
16354	6360	237	1764	2	2023-12-18	6	3.00	80.00	90.00	523.80	58.20
16355	6361	80	1474	2	2023-04-13	2	2.00	50.00	60.00	117.60	19.60
16356	6362	672	1584	2	2023-08-15	7	2.00	40.00	50.00	343.00	68.60
16357	6363	1035	444	2	2023-04-13	5	3.00	140.00	150.00	727.50	48.50
16358	6364	1035	1783	2	2022-01-04	1	2.00	880.00	1040.00	1019.20	156.80
16359	6365	1035	1724	2	2023-01-04	8	2.00	40.00	50.00	392.00	78.40
16360	6366	44	1784	5	2022-09-15	1	2.00	40.00	40.00	39.20	0.00
16361	6367	44	263	5	2023-09-08	1	4.00	210.00	240.00	230.40	28.80
16362	6368	44	477	5	2023-01-25	2	2.00	100.00	120.00	235.20	39.20
16363	6369	308	1198	2	2022-05-29	5	2.00	120.00	130.00	637.00	49.00
16364	6370	81	286	2	2023-05-05	5	4.00	30.00	40.00	192.00	48.00
16365	6371	44	1532	7	2022-07-23	2	5.00	90.00	110.00	209.00	38.00
16366	6372	44	108	1	2022-08-11	4	5.00	80.00	80.00	304.00	0.00
16367	6373	44	791	1	2023-07-02	3	2.00	10.00	10.00	29.40	0.00
16368	6374	44	696	1	2022-01-14	3	2.00	300.00	370.00	1087.80	205.80
16369	6375	903	655	2	2022-05-10	2	5.00	450.00	560.00	1064.00	209.00
16370	6376	903	353	2	2023-11-24	5	4.00	90.00	100.00	480.00	48.00
16371	6377	282	86	5	2023-01-20	2	4.00	0.00	0.00	0.00	0.00
16372	6378	27	1257	2	2022-12-17	2	4.00	10.00	10.00	19.20	0.00
16373	6379	1036	410	2	2023-09-24	1	3.00	80.00	100.00	97.00	19.40
16374	6380	1036	1278	2	2022-06-11	5	2.00	240.00	290.00	1421.00	245.00
16375	6381	920	1507	2	2022-06-13	8	3.00	40.00	50.00	388.00	77.60
16376	6382	197	575	2	2022-05-22	5	4.00	260.00	300.00	1440.00	192.00
16377	6383	197	1327	2	2022-03-09	4	4.00	130.00	160.00	614.40	115.20
16378	6384	132	801	5	2022-05-30	4	3.00	30.00	30.00	116.40	0.00
16379	6385	132	247	5	2023-03-02	2	3.00	40.00	50.00	97.00	19.40
16380	6386	132	1600	5	2022-10-23	8	3.00	60.00	60.00	465.60	0.00
16381	6387	132	411	5	2022-11-23	1	4.00	0.00	0.00	0.00	0.00
16382	6388	641	524	2	2022-06-01	2	3.00	10.00	10.00	19.40	0.00
16383	6389	641	157	2	2023-09-14	2	2.00	190.00	230.00	450.80	78.40
16384	6390	280	634	2	2023-06-02	5	5.00	280.00	310.00	1472.50	142.50
16385	6391	280	220	2	2023-07-09	2	2.00	10.00	10.00	19.60	0.00
16386	6392	383	1491	2	2023-03-03	2	5.00	10.00	10.00	19.00	0.00
16387	6393	383	1187	2	2022-12-12	2	3.00	10.00	10.00	19.40	0.00
16388	6394	383	111	2	2022-01-07	6	2.00	20.00	20.00	117.60	0.00
16389	6395	383	1072	2	2022-04-05	4	4.00	380.00	400.00	1536.00	76.80
16390	6396	383	457	2	2022-08-17	1	2.00	20.00	20.00	19.60	0.00
16391	6397	383	1785	2	2022-01-27	2	3.00	20.00	20.00	38.80	0.00
16392	6398	691	280	2	2023-08-09	2	3.00	10.00	10.00	19.40	0.00
16393	6399	284	1406	2	2022-07-19	5	2.00	770.00	820.00	4018.00	245.00
16394	6400	284	1039	2	2023-03-05	8	4.00	20.00	20.00	153.60	0.00
16395	6401	284	109	2	2022-03-18	6	2.00	210.00	230.00	1352.40	117.60
16396	6402	439	1120	5	2022-02-09	2	3.00	220.00	240.00	465.60	38.80
16397	6403	439	1066	5	2023-04-12	1	4.00	0.00	0.00	0.00	0.00
16398	6404	439	1566	5	2023-05-05	3	4.00	10.00	10.00	28.80	0.00
16399	6405	716	1193	2	2022-08-12	3	2.00	150.00	180.00	529.20	88.20
16400	6406	876	407	1	2023-08-14	2	3.00	510.00	570.00	1105.80	116.40
16401	6407	876	81	1	2023-01-05	7	4.00	120.00	150.00	1008.00	201.60
16402	6408	188	1190	5	2023-06-01	5	3.00	770.00	900.00	4365.00	630.50
16403	6409	188	1176	5	2022-08-27	5	2.00	40.00	50.00	245.00	49.00
16404	6410	188	1786	5	2022-09-25	3	3.00	50.00	50.00	145.50	0.00
16405	6411	188	1558	5	2023-02-12	1	2.00	10.00	10.00	9.80	0.00
16406	6412	188	1685	5	2022-03-30	2	4.00	70.00	80.00	153.60	19.20
16407	6413	693	142	2	2023-07-12	3	4.00	90.00	100.00	288.00	28.80
16408	6414	693	961	2	2022-02-13	6	2.00	90.00	100.00	588.00	58.80
16409	6415	1037	1737	1	2022-07-02	5	5.00	10.00	10.00	47.50	0.00
16410	6416	1038	657	7	2022-02-26	1	3.00	70.00	80.00	77.60	9.70
16411	6417	210	1410	2	2023-06-01	4	5.00	100.00	110.00	418.00	38.00
16412	6418	210	1029	2	2022-06-15	2	3.00	10.00	10.00	19.40	0.00
16413	6419	461	134	2	2023-05-22	2	3.00	20.00	20.00	38.80	0.00
16414	6420	461	1266	2	2023-03-04	3	5.00	320.00	370.00	1054.50	142.50
16415	6421	461	1561	2	2022-01-11	3	4.00	10.00	10.00	28.80	0.00
16416	6422	461	1440	2	2023-08-01	3	4.00	300.00	330.00	950.40	86.40
16417	6423	1039	1098	2	2022-05-05	7	4.00	90.00	110.00	739.20	134.40
16418	6424	543	368	5	2022-08-10	8	4.00	410.00	450.00	3456.00	307.20
16419	6425	190	1554	2	2023-12-16	3	2.00	20.00	20.00	58.80	0.00
16420	6426	210	1389	2	2023-06-07	4	3.00	7310.00	8400.00	32592.00	4229.20
16421	6427	210	1787	2	2023-10-02	1	3.00	10.00	10.00	9.70	0.00
16422	6428	210	816	2	2023-03-26	2	2.00	10.00	10.00	19.60	0.00
16423	6429	210	1788	2	2022-06-11	3	3.00	100.00	120.00	349.20	58.20
16424	6430	312	721	2	2022-07-09	2	5.00	30.00	30.00	57.00	0.00
16425	6431	312	115	2	2023-10-11	6	3.00	870.00	950.00	5529.00	465.60
16426	6432	312	1283	2	2022-06-20	7	2.00	10.00	10.00	68.60	0.00
16427	6433	312	1305	2	2022-04-05	3	5.00	340.00	410.00	1168.50	199.50
16428	6434	322	1018	2	2023-04-27	5	4.00	20.00	20.00	96.00	0.00
16429	6435	322	1410	2	2023-12-28	5	4.00	150.00	180.00	864.00	144.00
16430	6436	970	1458	5	2023-08-07	4	2.00	40.00	40.00	156.80	0.00
16431	6437	970	622	5	2023-07-25	5	5.00	450.00	480.00	2280.00	142.50
16432	6438	970	1444	5	2022-07-04	3	5.00	250.00	300.00	855.00	142.50
16433	6439	444	4	2	2022-07-08	4	2.00	890.00	970.00	3802.40	313.60
16434	6440	104	1586	5	2023-04-19	5	2.00	550.00	590.00	2891.00	196.00
16435	6441	25	925	2	2023-01-08	5	3.00	30.00	30.00	145.50	0.00
16436	6442	25	1292	2	2023-11-21	3	4.00	80.00	100.00	288.00	57.60
16437	6443	25	1238	2	2023-11-13	2	5.00	40.00	40.00	76.00	0.00
16438	6444	25	1509	2	2023-02-03	5	3.00	20.00	20.00	97.00	0.00
16439	6445	25	906	2	2023-11-15	3	5.00	70.00	80.00	228.00	28.50
16440	6446	118	1085	2	2023-08-08	6	2.00	10.00	10.00	58.80	0.00
16441	6447	15	29	1	2023-05-01	5	5.00	100.00	100.00	475.00	0.00
16442	6448	15	1099	1	2023-01-19	1	3.00	0.00	0.00	0.00	0.00
16443	6449	15	377	1	2022-05-25	1	4.00	10.00	10.00	9.60	0.00
16444	6450	467	974	2	2022-12-26	2	4.00	10.00	10.00	19.20	0.00
16445	6451	467	394	2	2022-06-16	2	5.00	50.00	50.00	95.00	0.00
16446	6452	467	88	2	2022-11-01	1	5.00	10.00	10.00	9.50	0.00
16447	6453	1040	985	1	2023-06-26	3	4.00	140.00	160.00	460.80	57.60
16448	6454	75	1540	2	2022-11-29	2	2.00	0.00	0.00	0.00	0.00
16449	6455	152	87	5	2022-09-07	2	4.00	50.00	60.00	115.20	19.20
16450	6456	152	1227	5	2022-10-08	7	4.00	40.00	40.00	268.80	0.00
16451	6457	253	1237	2	2022-09-04	1	2.00	130.00	140.00	137.20	9.80
16452	6458	253	1606	2	2022-01-09	7	2.00	20.00	20.00	137.20	0.00
16453	6459	457	869	5	2023-04-25	2	2.00	0.00	0.00	0.00	0.00
16454	6460	457	426	5	2022-12-31	5	4.00	10.00	10.00	48.00	0.00
16455	6461	457	1454	5	2022-02-17	5	4.00	40.00	40.00	192.00	0.00
16456	6462	457	1049	5	2023-03-14	3	3.00	70.00	90.00	261.90	58.20
16457	6463	457	1586	5	2022-05-19	2	3.00	220.00	260.00	504.40	77.60
16458	6464	457	199	5	2022-01-10	5	2.00	60.00	70.00	343.00	49.00
16459	6465	693	1495	2	2023-11-18	2	2.00	10.00	10.00	19.60	0.00
16460	6466	1010	1755	2	2022-11-16	6	3.00	70.00	80.00	465.60	58.20
16461	6467	204	1600	1	2022-03-26	7	4.00	60.00	70.00	470.40	67.20
16462	6468	509	404	2	2022-08-02	5	5.00	1850.00	2080.00	9880.00	1092.50
16463	6469	509	1067	2	2022-01-04	5	3.00	520.00	630.00	3055.50	533.50
16464	6470	509	442	2	2023-03-22	6	2.00	60.00	70.00	411.60	58.80
16465	6471	928	985	2	2023-02-16	2	3.00	110.00	130.00	252.20	38.80
16466	6472	928	961	2	2022-07-13	7	3.00	100.00	110.00	746.90	67.90
16467	6473	355	301	2	2022-04-02	10	4.00	90.00	100.00	960.00	96.00
16468	6474	97	964	1	2022-09-17	3	4.00	760.00	870.00	2505.60	316.80
16469	6475	59	928	5	2023-03-24	4	3.00	50.00	60.00	232.80	38.80
16470	6476	143	882	2	2023-10-05	3	4.00	0.00	0.00	0.00	0.00
16471	6477	143	190	2	2022-06-17	2	4.00	10.00	10.00	19.20	0.00
16472	6478	143	218	2	2023-04-30	1	3.00	170.00	210.00	203.70	38.80
16473	6479	143	1146	2	2023-03-03	3	5.00	20.00	20.00	57.00	0.00
16474	6480	143	1067	2	2022-08-28	5	4.00	420.00	500.00	2400.00	384.00
16475	6481	143	1299	2	2023-05-21	7	2.00	20.00	20.00	137.20	0.00
16476	6482	143	416	2	2022-02-18	2	3.00	210.00	240.00	465.60	58.20
16477	6483	143	1616	2	2023-10-03	2	2.00	100.00	110.00	215.60	19.60
16478	6484	213	856	2	2022-04-26	2	2.00	350.00	380.00	744.80	58.80
16479	6485	213	1729	2	2023-06-02	6	5.00	70.00	80.00	456.00	57.00
16480	6486	213	753	2	2022-10-30	4	3.00	40.00	50.00	194.00	38.80
16481	6487	312	228	2	2022-05-18	4	2.00	870.00	960.00	3763.20	352.80
16482	6488	312	1396	2	2023-07-31	3	5.00	10.00	10.00	28.50	0.00
16483	6489	312	146	2	2023-09-04	14	3.00	240.00	300.00	4074.00	814.80
16484	6490	383	1435	2	2022-03-13	5	2.00	20.00	30.00	147.00	49.00
16485	6491	86	597	2	2023-11-23	4	4.00	90.00	100.00	384.00	38.40
16486	6492	1041	200	2	2023-05-30	2	3.00	230.00	290.00	562.60	116.40
16487	6493	1041	338	2	2023-10-16	5	5.00	40.00	40.00	190.00	0.00
16488	6494	1041	1082	2	2023-11-29	4	4.00	230.00	240.00	921.60	38.40
16489	6495	141	47	1	2022-12-02	2	2.00	20.00	20.00	39.20	0.00
16490	6496	141	290	1	2022-12-12	3	3.00	20.00	20.00	58.20	0.00
16491	6497	141	961	1	2023-02-23	2	3.00	20.00	30.00	58.20	19.40
16492	6498	693	6	2	2022-04-10	3	2.00	20.00	20.00	58.80	0.00
16493	6499	693	492	2	2023-07-05	9	2.00	120.00	140.00	1234.80	176.40
16494	6500	693	1236	2	2022-05-29	14	3.00	250.00	280.00	3802.40	407.40
16495	6501	693	492	2	2023-01-01	6	5.00	80.00	90.00	513.00	57.00
16496	6502	938	1502	2	2022-09-17	6	4.00	480.00	540.00	3110.40	345.60
16497	6503	938	180	2	2023-04-13	7	5.00	40.00	50.00	332.50	66.50
16498	6504	938	411	2	2023-11-30	3	5.00	20.00	20.00	57.00	0.00
16499	6505	213	404	1	2023-07-07	3	3.00	1100.00	1250.00	3637.50	436.50
16500	6506	199	148	2	2023-10-25	3	5.00	10.00	10.00	28.50	0.00
16501	6507	125	1775	1	2023-09-09	4	5.00	20.00	20.00	76.00	0.00
16502	6508	125	576	1	2022-07-30	4	5.00	280.00	330.00	1254.00	190.00
16503	6509	253	315	2	2023-10-03	5	3.00	240.00	280.00	1358.00	194.00
16504	6510	253	302	2	2023-07-27	3	5.00	50.00	50.00	142.50	0.00
16505	6511	253	753	2	2022-07-01	3	2.00	30.00	30.00	88.20	0.00
16506	6512	427	704	2	2023-12-05	6	3.00	20.00	20.00	116.40	0.00
16507	6513	427	1364	2	2023-08-21	4	2.00	10.00	10.00	39.20	0.00
16508	6514	427	1523	2	2023-07-04	7	3.00	240.00	290.00	1969.10	339.50
16509	6515	427	958	2	2023-08-13	2	3.00	190.00	210.00	407.40	38.80
16510	6516	37	956	2	2022-09-11	3	3.00	200.00	220.00	640.20	58.20
16511	6517	37	1061	2	2022-03-14	5	2.00	480.00	530.00	2597.00	245.00
16512	6518	37	1069	2	2022-02-10	10	2.00	80.00	100.00	980.00	196.00
16513	6519	37	1310	2	2023-06-15	2	2.00	100.00	110.00	215.60	19.60
16514	6520	37	473	2	2022-11-20	1	3.00	0.00	0.00	0.00	0.00
16515	6521	32	317	1	2022-10-15	4	4.00	4570.00	5440.00	20889.60	3340.80
16516	6522	32	1720	1	2023-08-22	3	3.00	280.00	300.00	873.00	58.20
16517	6523	32	1789	1	2023-10-13	7	2.00	50.00	60.00	411.60	68.60
16518	6524	285	1622	2	2022-09-23	2	2.00	10.00	10.00	19.60	0.00
16519	6525	285	967	2	2022-04-24	1	3.00	60.00	60.00	58.20	0.00
16520	6526	285	32	2	2023-06-06	5	3.00	10.00	10.00	48.50	0.00
16521	6527	285	1376	2	2023-03-19	5	2.00	10.00	10.00	49.00	0.00
16522	6528	148	616	1	2023-05-09	4	5.00	1680.00	2000.00	7600.00	1216.00
16523	6529	126	1790	2	2023-06-04	4	3.00	190.00	220.00	853.60	116.40
16524	6530	1042	866	2	2023-04-01	3	3.00	10.00	10.00	29.10	0.00
16525	6531	1042	778	2	2022-03-18	3	4.00	0.00	0.00	0.00	0.00
16526	6532	41	1040	2	2022-03-22	5	5.00	10.00	10.00	47.50	0.00
16527	6533	41	1780	2	2022-08-22	1	3.00	120.00	140.00	135.80	19.40
16528	6534	41	1594	2	2023-03-27	5	2.00	340.00	400.00	1960.00	294.00
16529	6535	359	1177	2	2022-07-26	3	4.00	1810.00	2150.00	6192.00	979.20
16530	6536	359	1249	2	2023-02-08	10	5.00	3690.00	4010.00	38095.00	3040.00
16531	6537	778	963	5	2022-12-16	3	5.00	270.00	330.00	940.50	171.00
16532	6538	778	357	5	2022-10-10	3	3.00	80.00	100.00	291.00	58.20
16533	6539	417	560	2	2023-12-30	1	3.00	140.00	160.00	155.20	19.40
16534	6540	417	1341	2	2022-01-26	5	2.00	250.00	290.00	1421.00	196.00
16535	6541	6	1636	5	2023-01-17	6	4.00	60.00	70.00	403.20	57.60
16536	6542	6	584	5	2022-01-03	2	2.00	130.00	140.00	274.40	19.60
16537	6543	6	1518	5	2023-08-03	3	2.00	100.00	110.00	323.40	29.40
16538	6544	6	1292	5	2022-07-24	1	5.00	30.00	30.00	28.50	0.00
16539	6545	228	1562	2	2023-10-08	5	2.00	60.00	60.00	294.00	0.00
16540	6546	228	841	2	2022-03-17	2	3.00	10.00	10.00	19.40	0.00
16541	6547	228	1694	2	2023-08-06	1	2.00	20.00	20.00	19.60	0.00
16542	6548	591	84	2	2023-08-29	6	3.00	590.00	630.00	3666.60	232.80
16543	6549	591	1750	2	2023-05-14	3	2.00	20.00	20.00	58.80	0.00
16544	6550	102	793	5	2023-01-30	6	5.00	130.00	160.00	912.00	171.00
16545	6551	134	1456	1	2022-08-29	4	2.00	310.00	330.00	1293.60	78.40
16546	6552	316	482	1	2023-10-06	2	3.00	10.00	10.00	19.40	0.00
16547	6553	316	968	1	2023-05-02	5	5.00	150.00	160.00	760.00	47.50
16548	6554	229	591	1	2022-04-24	4	3.00	280.00	320.00	1241.60	155.20
16549	6555	229	1673	1	2023-01-03	3	3.00	440.00	510.00	1484.10	203.70
16550	6556	229	1791	1	2022-01-28	1	3.00	0.00	0.00	0.00	0.00
16551	6557	229	1312	1	2022-08-01	1	3.00	10.00	10.00	9.70	0.00
16552	6558	229	581	1	2022-03-07	1	4.00	20.00	20.00	19.20	0.00
16553	6559	1043	500	2	2023-10-02	9	5.00	1430.00	1520.00	12996.00	769.50
16554	6560	1044	971	2	2022-02-12	5	5.00	360.00	420.00	1995.00	285.00
16555	6561	1044	366	2	2023-04-06	1	3.00	0.00	0.00	0.00	0.00
16556	6562	493	732	5	2023-10-22	5	2.00	30.00	30.00	147.00	0.00
16557	6563	190	62	2	2022-01-01	3	4.00	20.00	20.00	57.60	0.00
16558	6564	190	1583	2	2022-07-25	2	5.00	170.00	190.00	361.00	38.00
16559	6565	190	672	2	2023-12-22	3	2.00	10.00	10.00	29.40	0.00
16560	6566	190	636	2	2023-11-13	4	2.00	770.00	870.00	3410.40	392.00
16561	6567	926	570	1	2023-11-12	4	4.00	220.00	240.00	921.60	76.80
16562	6568	926	1326	1	2022-03-20	5	2.00	10.00	10.00	49.00	0.00
16563	6569	141	60	2	2022-10-25	2	2.00	0.00	0.00	0.00	0.00
16564	6570	141	292	2	2022-07-27	3	2.00	270.00	320.00	940.80	147.00
16565	6571	141	634	2	2022-02-02	3	2.00	140.00	150.00	441.00	29.40
16566	6572	141	1524	2	2022-08-30	3	4.00	190.00	230.00	662.40	115.20
16567	6573	203	1297	2	2023-10-12	2	5.00	10.00	10.00	19.00	0.00
16568	6574	829	427	2	2022-01-06	4	4.00	480.00	560.00	2150.40	307.20
16569	6575	829	1792	2	2022-03-19	8	4.00	270.00	320.00	2457.60	384.00
16570	6576	204	1544	2	2023-05-19	8	3.00	1000.00	1050.00	8148.00	388.00
16571	6577	204	57	2	2023-01-21	3	4.00	140.00	170.00	489.60	86.40
16572	6578	121	1130	1	2022-06-17	6	2.00	140.00	170.00	999.60	176.40
16573	6579	6	1150	2	2022-07-10	7	3.00	940.00	1010.00	6857.90	475.30
16574	6580	203	1084	7	2022-01-06	1	2.00	10.00	10.00	9.80	0.00
16575	6581	203	1623	7	2022-07-13	3	2.00	10.00	10.00	29.40	0.00
16576	6582	203	1793	7	2023-06-05	3	5.00	90.00	100.00	285.00	28.50
16577	6583	1045	604	2	2022-05-02	3	2.00	150.00	180.00	529.20	88.20
16578	6584	567	1386	2	2023-09-10	6	2.00	80.00	100.00	588.00	117.60
16579	6585	567	705	2	2022-11-22	4	5.00	240.00	270.00	1026.00	114.00
16580	6586	567	248	2	2022-11-08	5	3.00	10.00	10.00	48.50	0.00
16581	6587	567	951	2	2023-09-02	6	5.00	20.00	20.00	114.00	0.00
16582	6588	567	714	2	2023-01-14	3	3.00	280.00	300.00	873.00	58.20
16583	6589	567	592	2	2022-06-12	3	5.00	10.00	10.00	28.50	0.00
16584	6590	567	414	2	2022-12-31	2	5.00	190.00	230.00	437.00	76.00
16585	6591	1046	618	5	2022-03-03	3	3.00	10.00	10.00	29.10	0.00
16586	6592	111	333	2	2023-03-11	3	3.00	30.00	30.00	87.30	0.00
16587	6593	111	501	2	2023-07-06	5	3.00	20.00	20.00	97.00	0.00
16588	6594	104	543	1	2022-01-11	2	3.00	20.00	30.00	58.20	19.40
16589	6595	488	647	2	2022-10-20	7	2.00	110.00	130.00	891.80	137.20
16590	6596	57	461	5	2023-09-22	5	2.00	10.00	10.00	49.00	0.00
16591	6597	57	129	5	2022-11-06	1	4.00	10.00	10.00	9.60	0.00
16592	6598	164	249	2	2023-03-13	1	2.00	0.00	0.00	0.00	0.00
16593	6599	164	1414	2	2023-06-29	2	2.00	60.00	60.00	117.60	0.00
16594	6600	763	527	2	2022-10-06	3	3.00	50.00	60.00	174.60	29.10
16595	6601	763	1439	2	2023-10-22	3	5.00	130.00	150.00	427.50	57.00
16596	6602	763	1145	2	2023-01-26	8	5.00	210.00	240.00	1824.00	228.00
16597	6603	763	287	2	2023-11-14	6	5.00	20.00	20.00	114.00	0.00
16598	6604	1047	887	5	2023-02-06	3	4.00	140.00	150.00	432.00	28.80
16599	6605	268	495	2	2022-05-26	3	2.00	10.00	10.00	29.40	0.00
16600	6606	268	1005	2	2022-11-03	7	2.00	50.00	50.00	343.00	0.00
16601	6607	268	782	2	2023-12-13	4	3.00	200.00	210.00	814.80	38.80
16602	6608	268	212	2	2023-05-24	6	2.00	430.00	480.00	2822.40	294.00
16603	6609	268	1521	2	2023-05-18	3	4.00	320.00	370.00	1065.60	144.00
16604	6610	763	329	7	2023-11-25	6	3.00	80.00	90.00	523.80	58.20
16605	6611	19	1233	5	2022-01-24	3	2.00	20.00	20.00	58.80	0.00
16606	6612	226	269	2	2022-03-24	2	4.00	160.00	190.00	364.80	57.60
16607	6613	226	21	2	2022-02-04	3	5.00	20.00	20.00	57.00	0.00
16608	6614	226	540	2	2023-06-03	5	4.00	440.00	470.00	2256.00	144.00
16609	6615	226	584	2	2023-07-23	3	4.00	180.00	210.00	604.80	86.40
16610	6616	70	1602	5	2023-08-27	2	3.00	190.00	240.00	465.60	97.00
16611	6617	70	1346	5	2023-02-02	6	3.00	20.00	20.00	116.40	0.00
16612	6618	70	1767	5	2022-11-14	4	3.00	200.00	220.00	853.60	77.60
16613	6619	773	1348	1	2022-01-02	5	4.00	30.00	30.00	144.00	0.00
16614	6620	773	1754	1	2022-10-20	6	4.00	200.00	210.00	1209.60	57.60
16615	6621	773	466	1	2022-12-26	5	3.00	3700.00	4160.00	20176.00	2231.00
16616	6622	773	1545	1	2023-01-29	3	2.00	170.00	210.00	617.40	117.60
16617	6623	142	6	5	2022-08-30	6	4.00	30.00	40.00	230.40	57.60
16618	6624	142	574	5	2023-05-01	8	2.00	50.00	60.00	470.40	78.40
16619	6625	1048	1214	2	2023-10-24	1	5.00	90.00	100.00	95.00	9.50
16620	6626	1048	1460	2	2023-06-10	4	4.00	160.00	200.00	768.00	153.60
16621	6627	104	1630	2	2022-06-20	4	3.00	6440.00	7000.00	27160.00	2172.80
16622	6628	734	90	2	2022-05-29	2	3.00	10.00	10.00	19.40	0.00
16623	6629	104	223	1	2022-09-06	14	3.00	260.00	280.00	3802.40	271.60
16624	6630	1049	1182	2	2022-12-05	5	4.00	10.00	10.00	48.00	0.00
16625	6631	68	1004	2	2022-09-17	3	5.00	600.00	700.00	1995.00	285.00
16626	6632	68	1111	2	2022-10-30	5	4.00	1420.00	1750.00	8400.00	1584.00
16627	6633	625	1310	1	2023-06-30	1	2.00	40.00	50.00	49.00	9.80
16628	6634	10	652	7	2022-07-12	1	3.00	180.00	200.00	194.00	19.40
16629	6635	47	351	7	2022-12-10	11	3.00	70.00	70.00	746.90	0.00
16630	6636	47	35	7	2022-06-05	4	4.00	590.00	630.00	2419.20	153.60
16631	6637	47	581	7	2023-03-07	5	3.00	110.00	120.00	582.00	48.50
16632	6638	383	373	1	2022-01-07	3	5.00	10.00	10.00	28.50	0.00
16633	6639	383	1404	1	2022-07-26	6	2.00	90.00	110.00	646.80	117.60
16634	6640	797	1235	1	2022-06-18	8	4.00	1330.00	1420.00	10905.60	691.20
16635	6641	446	543	2	2022-05-03	6	4.00	120.00	130.00	748.80	57.60
16636	6642	446	686	2	2022-10-02	2	5.00	70.00	80.00	152.00	19.00
16637	6643	446	1761	2	2022-07-19	9	3.00	110.00	130.00	1134.90	174.60
16638	6644	463	820	2	2023-01-29	4	5.00	390.00	440.00	1672.00	190.00
16639	6645	463	772	2	2023-08-31	7	5.00	120.00	140.00	931.00	133.00
16640	6646	463	587	2	2023-01-10	4	4.00	120.00	130.00	499.20	38.40
16641	6647	502	216	2	2022-02-14	3	3.00	480.00	560.00	1629.60	232.80
16642	6648	502	1310	2	2022-11-29	2	2.00	80.00	90.00	176.40	19.60
16643	6649	493	472	5	2022-09-21	7	2.00	30.00	40.00	274.40	68.60
16644	6650	493	1688	5	2023-02-20	2	2.00	300.00	320.00	627.20	39.20
16645	6651	493	272	5	2022-05-10	5	3.00	40.00	50.00	242.50	48.50
16646	6652	493	751	5	2023-05-24	2	4.00	20.00	20.00	38.40	0.00
16647	6653	493	181	5	2023-08-14	4	4.00	20.00	20.00	76.80	0.00
16648	6654	493	1535	5	2023-08-28	5	2.00	200.00	210.00	1029.00	49.00
16649	6655	1050	873	2	2023-01-18	3	2.00	290.00	330.00	970.20	117.60
16650	6656	1050	1228	2	2022-06-26	1	2.00	30.00	30.00	29.40	0.00
16651	6657	1050	912	2	2022-04-16	2	3.00	50.00	50.00	97.00	0.00
16652	6658	1050	1511	2	2023-06-28	5	3.00	10.00	10.00	48.50	0.00
16653	6659	1050	593	2	2023-01-16	2	4.00	60.00	70.00	134.40	19.20
16654	6660	1050	978	2	2023-02-15	9	5.00	370.00	390.00	3334.50	171.00
16655	6661	190	1644	1	2023-10-05	2	4.00	30.00	40.00	76.80	19.20
16656	6662	190	1052	1	2022-06-20	2	5.00	90.00	110.00	209.00	38.00
16657	6663	190	1243	1	2023-01-20	7	2.00	370.00	450.00	3087.00	548.80
16658	6664	931	720	2	2022-09-26	5	2.00	330.00	360.00	1764.00	147.00
16659	6665	931	843	2	2022-09-16	7	2.00	230.00	250.00	1715.00	137.20
16660	6666	1018	1767	1	2023-12-15	5	3.00	190.00	220.00	1067.00	145.50
16661	6667	405	1686	1	2022-08-24	5	4.00	40.00	40.00	192.00	0.00
16662	6668	405	642	1	2022-11-26	2	5.00	10.00	10.00	19.00	0.00
16663	6669	405	1769	1	2022-02-21	2	2.00	20.00	20.00	39.20	0.00
16664	6670	405	1564	1	2023-06-04	5	2.00	90.00	90.00	441.00	0.00
16665	6671	402	529	2	2022-06-15	2	5.00	30.00	30.00	57.00	0.00
16666	6672	376	583	1	2023-04-27	2	5.00	50.00	50.00	95.00	0.00
16667	6673	841	109	2	2023-03-03	7	4.00	220.00	270.00	1814.40	336.00
16668	6674	1051	1794	2	2022-08-27	4	5.00	60.00	70.00	266.00	38.00
16669	6675	755	854	1	2022-10-17	6	5.00	10.00	10.00	57.00	0.00
16670	6676	755	1795	1	2023-03-27	2	2.00	70.00	80.00	156.80	19.60
16671	6677	755	1684	1	2023-03-10	5	2.00	20.00	20.00	98.00	0.00
16672	6678	755	1544	1	2023-09-22	3	5.00	370.00	390.00	1111.50	57.00
16673	6679	173	905	2	2022-03-29	7	5.00	40.00	50.00	332.50	66.50
16674	6680	467	377	1	2022-11-26	1	3.00	10.00	10.00	9.70	0.00
16675	6681	467	369	1	2023-07-25	4	3.00	60.00	80.00	310.40	77.60
16676	6682	467	1620	1	2023-03-23	3	3.00	120.00	150.00	436.50	87.30
16677	6683	1052	752	5	2022-02-14	2	4.00	0.00	0.00	0.00	0.00
16678	6684	329	1534	2	2023-05-13	6	2.00	20.00	20.00	117.60	0.00
16679	6685	54	907	2	2023-10-30	1	4.00	150.00	180.00	172.80	28.80
16680	6686	54	690	2	2022-08-15	2	5.00	30.00	40.00	76.00	19.00
16681	6687	54	951	2	2022-11-03	5	2.00	10.00	10.00	49.00	0.00
16682	6688	4	1363	2	2022-12-01	4	4.00	1060.00	1120.00	4300.80	230.40
16683	6689	142	1131	1	2023-07-01	4	2.00	100.00	110.00	431.20	39.20
16684	6690	515	1280	2	2023-07-31	5	4.00	10.00	10.00	48.00	0.00
16685	6691	269	237	2	2023-05-11	4	2.00	20.00	20.00	78.40	0.00
16686	6692	269	409	2	2022-09-16	6	4.00	150.00	160.00	921.60	57.60
16687	6693	1053	1312	1	2022-01-01	11	2.00	420.00	480.00	5174.40	646.80
16688	6694	521	1398	1	2023-07-12	3	3.00	130.00	160.00	465.60	87.30
16689	6695	1052	1098	2	2022-09-18	3	5.00	40.00	50.00	142.50	28.50
16690	6696	104	1592	2	2023-03-15	3	4.00	390.00	420.00	1209.60	86.40
16691	6697	104	909	2	2023-05-28	3	2.00	40.00	40.00	117.60	0.00
16692	6698	104	1398	2	2022-02-27	1	2.00	50.00	50.00	49.00	0.00
16693	6699	178	1796	2	2022-03-01	2	4.00	20.00	20.00	38.40	0.00
16694	6700	178	1154	2	2023-07-15	2	5.00	190.00	230.00	437.00	76.00
16695	6701	178	302	2	2022-11-11	3	2.00	40.00	50.00	147.00	29.40
16696	6702	1054	1155	2	2022-05-17	4	2.00	150.00	160.00	627.20	39.20
16697	6703	1054	881	2	2022-09-16	4	2.00	10.00	10.00	39.20	0.00
16698	6704	206	1237	2	2022-05-23	2	5.00	200.00	220.00	418.00	38.00
16699	6705	206	805	2	2023-09-09	3	4.00	10.00	10.00	28.80	0.00
16700	6706	206	161	2	2022-04-30	3	4.00	130.00	140.00	403.20	28.80
16701	6707	1055	919	2	2023-12-29	7	4.00	440.00	520.00	3494.40	537.60
16702	6708	814	1797	2	2023-02-22	3	2.00	10.00	10.00	29.40	0.00
16703	6709	1056	158	2	2023-09-22	4	5.00	720.00	880.00	3344.00	608.00
16704	6710	1056	269	2	2022-11-05	3	5.00	200.00	230.00	655.50	85.50
16705	6711	1057	1161	5	2022-09-17	8	2.00	220.00	270.00	2116.80	392.00
16706	6712	51	1025	1	2023-06-30	3	5.00	10.00	10.00	28.50	0.00
16707	6713	670	1320	7	2022-02-07	6	2.00	250.00	270.00	1587.60	117.60
16708	6714	670	268	7	2023-05-11	3	3.00	50.00	60.00	174.60	29.10
16709	6715	670	961	7	2022-05-24	3	2.00	30.00	40.00	117.60	29.40
16710	6716	670	1572	7	2023-06-28	6	5.00	90.00	100.00	570.00	57.00
16711	6717	1058	660	2	2023-06-11	6	5.00	30.00	30.00	171.00	0.00
16712	6718	1058	549	2	2023-07-15	4	4.00	30.00	30.00	115.20	0.00
16713	6719	1058	893	2	2022-05-31	4	3.00	150.00	160.00	620.80	38.80
16714	6720	1059	938	5	2022-03-29	3	5.00	20.00	30.00	85.50	28.50
16715	6721	376	633	2	2023-10-07	5	4.00	130.00	150.00	720.00	96.00
16716	6722	376	1760	2	2022-01-18	2	3.00	20.00	20.00	38.80	0.00
16717	6723	376	1261	2	2023-10-12	3	2.00	20.00	20.00	58.80	0.00
16718	6724	1060	1100	1	2022-04-22	6	3.00	10.00	10.00	58.20	0.00
16719	6725	6	204	2	2023-07-22	3	2.00	10.00	10.00	29.40	0.00
16720	6726	6	1648	2	2022-12-03	3	4.00	10.00	10.00	28.80	0.00
16721	6727	6	626	2	2022-08-08	4	5.00	20.00	20.00	76.00	0.00
16722	6728	813	1734	1	2022-09-12	5	2.00	140.00	180.00	882.00	196.00
16723	6729	563	1173	2	2022-08-16	6	5.00	50.00	50.00	285.00	0.00
16724	6730	754	1283	5	2022-10-13	3	2.00	10.00	10.00	29.40	0.00
16725	6731	754	229	5	2023-12-06	4	2.00	610.00	640.00	2508.80	117.60
16726	6732	754	290	5	2022-10-05	4	2.00	20.00	20.00	78.40	0.00
16727	6733	400	1487	5	2022-01-31	4	5.00	150.00	180.00	684.00	114.00
16728	6734	400	1267	5	2022-11-13	2	5.00	20.00	30.00	57.00	19.00
16729	6735	933	677	2	2022-05-03	2	3.00	10.00	10.00	19.40	0.00
16730	6736	37	984	2	2023-10-17	3	2.00	90.00	110.00	323.40	58.80
16731	6737	37	1663	2	2023-03-22	3	3.00	520.00	580.00	1687.80	174.60
16732	6738	37	1765	2	2023-10-27	9	3.00	140.00	150.00	1309.50	87.30
16733	6739	37	492	2	2023-01-22	4	2.00	40.00	50.00	196.00	39.20
16734	6740	118	1355	2	2022-05-20	3	4.00	80.00	100.00	288.00	57.60
16735	6741	118	1190	2	2023-01-12	2	5.00	310.00	360.00	684.00	95.00
16736	6742	118	797	2	2022-10-08	3	2.00	10.00	10.00	29.40	0.00
16737	6743	204	65	2	2023-04-05	3	4.00	110.00	120.00	345.60	28.80
16738	6744	534	151	2	2022-04-27	6	4.00	40.00	40.00	230.40	0.00
16739	6745	95	591	1	2023-07-07	6	2.00	390.00	480.00	2822.40	529.20
16740	6746	95	251	1	2022-03-05	5	4.00	20.00	20.00	96.00	0.00
16741	6747	253	1444	5	2023-01-10	5	5.00	540.00	630.00	2992.50	427.50
16742	6748	134	441	2	2023-03-01	1	4.00	10.00	10.00	9.60	0.00
16743	6749	134	1358	2	2023-07-12	3	5.00	20.00	20.00	57.00	0.00
16744	6750	134	1718	2	2022-09-22	2	5.00	110.00	120.00	228.00	19.00
16745	6751	497	1535	1	2022-04-02	2	5.00	100.00	120.00	228.00	38.00
16746	6752	497	1519	1	2022-10-20	2	5.00	10.00	10.00	19.00	0.00
16747	6753	497	335	1	2023-05-05	2	2.00	60.00	60.00	117.60	0.00
16748	6754	497	1407	1	2023-04-07	2	3.00	10.00	10.00	19.40	0.00
16749	6755	497	15	1	2022-09-20	4	2.00	230.00	280.00	1097.60	196.00
16750	6756	708	1463	2	2022-05-09	5	5.00	40.00	50.00	237.50	47.50
16751	6757	708	1585	2	2022-07-06	4	5.00	410.00	510.00	1938.00	380.00
16752	6758	708	804	2	2023-02-05	6	3.00	370.00	400.00	2328.00	174.60
16753	6759	708	357	2	2022-02-12	2	2.00	70.00	80.00	156.80	19.60
16754	6760	456	895	2	2022-03-24	1	2.00	30.00	30.00	29.40	0.00
16755	6761	134	73	2	2023-03-27	3	5.00	220.00	270.00	769.50	142.50
16756	6762	49	902	1	2023-01-02	2	3.00	230.00	250.00	485.00	38.80
16757	6763	118	3	2	2023-11-09	5	2.00	30.00	30.00	147.00	0.00
16758	6764	118	211	2	2022-07-19	2	2.00	30.00	40.00	78.40	19.60
16759	6765	118	1798	2	2022-10-22	3	5.00	1180.00	1360.00	3876.00	513.00
16760	6766	194	292	2	2023-08-29	3	3.00	280.00	320.00	931.20	116.40
16761	6767	194	33	2	2022-01-20	2	2.00	20.00	20.00	39.20	0.00
16762	6768	194	1028	2	2022-08-21	5	4.00	10.00	10.00	48.00	0.00
16763	6769	708	913	2	2023-12-17	7	5.00	180.00	200.00	1330.00	133.00
16764	6770	402	1659	2	2023-08-26	5	3.00	30.00	40.00	194.00	48.50
16765	6771	762	1079	2	2023-07-13	5	5.00	360.00	420.00	1995.00	285.00
16766	6772	762	1785	2	2022-10-01	3	2.00	10.00	10.00	29.40	0.00
16767	6773	56	309	2	2022-03-15	2	5.00	10.00	10.00	19.00	0.00
16768	6774	56	1582	2	2023-08-08	1	5.00	0.00	0.00	0.00	0.00
16769	6775	56	1799	2	2023-10-07	6	2.00	30.00	40.00	235.20	58.80
16770	6776	104	250	2	2022-05-01	4	2.00	20.00	20.00	78.40	0.00
16771	6777	73	42	2	2023-12-02	3	3.00	80.00	90.00	261.90	29.10
16772	6778	44	1234	2	2022-04-06	9	5.00	370.00	450.00	3847.50	684.00
16773	6779	521	1122	1	2022-01-26	3	2.00	320.00	340.00	999.60	58.80
16774	6780	521	1257	1	2023-04-17	2	3.00	10.00	10.00	19.40	0.00
16775	6781	521	850	1	2022-01-08	2	4.00	10.00	10.00	19.20	0.00
16776	6782	521	677	1	2022-08-20	8	2.00	50.00	60.00	470.40	78.40
16777	6783	130	546	1	2023-03-16	4	4.00	20.00	20.00	76.80	0.00
16778	6784	130	1800	1	2022-04-14	3	4.00	40.00	40.00	115.20	0.00
16779	6785	130	1745	1	2022-05-23	1	5.00	120.00	140.00	133.00	19.00
16780	6786	130	392	1	2023-05-07	5	5.00	240.00	260.00	1235.00	95.00
16781	6787	130	261	1	2022-07-27	4	2.00	20.00	20.00	78.40	0.00
16782	6788	185	785	2	2023-03-15	3	3.00	120.00	130.00	378.30	29.10
16783	6789	185	992	2	2023-06-02	7	2.00	60.00	70.00	480.20	68.60
16784	6790	38	400	1	2023-09-15	4	3.00	110.00	140.00	543.20	116.40
16785	6791	58	256	5	2022-02-24	5	3.00	10.00	10.00	48.50	0.00
16786	6792	1061	1612	2	2023-06-07	1	2.00	10.00	10.00	9.80	0.00
16787	6793	79	543	5	2023-10-11	3	2.00	50.00	60.00	176.40	29.40
16788	6794	322	1032	2	2022-07-10	2	4.00	20.00	20.00	38.40	0.00
16789	6795	322	1279	2	2023-10-19	3	2.00	200.00	240.00	705.60	117.60
16790	6796	322	1619	2	2022-02-18	2	4.00	20.00	30.00	57.60	19.20
16791	6797	188	1002	7	2023-02-15	2	5.00	20.00	20.00	38.00	0.00
16792	6798	188	413	7	2023-04-30	1	2.00	0.00	0.00	0.00	0.00
16793	6799	188	1801	7	2022-05-11	5	3.00	10.00	10.00	48.50	0.00
16794	6800	762	224	2	2023-09-22	1	4.00	30.00	40.00	38.40	9.60
16795	6801	762	1385	2	2023-04-02	2	2.00	250.00	270.00	529.20	39.20
16796	6802	762	1203	2	2023-12-22	3	4.00	40.00	50.00	144.00	28.80
16797	6803	762	726	2	2022-06-05	2	3.00	90.00	100.00	194.00	19.40
16798	6804	762	1145	2	2022-08-24	2	2.00	40.00	50.00	98.00	19.60
16799	6805	518	1234	5	2022-08-17	2	4.00	90.00	100.00	192.00	19.20
16800	6806	255	1384	5	2022-12-25	2	5.00	10.00	10.00	19.00	0.00
16801	6807	1062	309	2	2022-01-04	1	3.00	0.00	0.00	0.00	0.00
16802	6808	515	448	2	2022-02-12	3	3.00	80.00	100.00	291.00	58.20
16803	6809	515	1609	2	2023-10-14	3	3.00	20.00	20.00	58.20	0.00
16804	6810	12	626	5	2023-09-10	2	2.00	0.00	0.00	0.00	0.00
16805	6811	12	1795	5	2022-06-12	1	4.00	10.00	10.00	9.60	0.00
16806	6812	12	395	5	2022-04-24	2	3.00	90.00	110.00	213.40	38.80
16807	6813	12	786	5	2022-03-31	4	3.00	20.00	20.00	77.60	0.00
16808	6814	12	1802	5	2022-06-29	8	2.00	110.00	130.00	1019.20	156.80
16809	6815	12	345	5	2023-11-21	2	2.00	220.00	240.00	470.40	39.20
16810	6816	203	1036	2	2023-07-24	3	3.00	10.00	10.00	29.10	0.00
16811	6817	203	295	2	2022-08-01	5	2.00	20.00	20.00	98.00	0.00
16812	6818	203	317	2	2023-05-09	3	2.00	2940.00	3270.00	9613.80	970.20
16813	6819	146	1339	2	2022-05-13	5	4.00	0.00	0.00	0.00	0.00
16814	6820	146	1495	2	2023-07-11	3	5.00	10.00	10.00	28.50	0.00
16815	6821	146	168	2	2023-08-11	2	2.00	100.00	110.00	215.60	19.60
16816	6822	146	346	2	2022-09-29	2	5.00	0.00	0.00	0.00	0.00
16817	6823	234	732	2	2022-10-26	5	3.00	150.00	170.00	824.50	97.00
16818	6824	499	467	2	2023-02-08	9	2.00	90.00	100.00	882.00	88.20
16819	6825	499	364	2	2023-10-09	2	3.00	290.00	360.00	698.40	135.80
16820	6826	746	721	2	2023-06-17	2	3.00	30.00	30.00	58.20	0.00
16821	6827	746	1389	2	2022-08-14	5	3.00	14000.00	17500.00	84875.00	16975.00
16822	6828	746	1499	2	2023-05-17	2	5.00	670.00	740.00	1406.00	133.00
16823	6829	746	697	2	2023-03-04	7	5.00	30.00	30.00	199.50	0.00
16824	6830	746	208	2	2023-10-10	2	2.00	30.00	30.00	58.80	0.00
16825	6831	253	985	1	2023-06-01	3	3.00	180.00	200.00	582.00	58.20
16826	6832	104	1299	2	2022-10-05	4	3.00	20.00	20.00	77.60	0.00
16827	6833	101	1413	2	2023-09-07	3	4.00	10.00	10.00	28.80	0.00
16828	6834	268	963	7	2022-11-18	1	4.00	130.00	150.00	144.00	19.20
16829	6835	1063	1776	2	2022-03-26	2	3.00	30.00	30.00	58.20	0.00
16830	6836	1064	581	2	2022-12-29	5	3.00	140.00	150.00	727.50	48.50
16831	6837	1064	206	2	2023-04-03	1	2.00	20.00	20.00	19.60	0.00
16832	6838	907	325	2	2022-02-02	4	3.00	10.00	10.00	38.80	0.00
16833	6839	299	1740	2	2022-02-22	5	2.00	1510.00	1640.00	8036.00	637.00
16834	6840	299	919	2	2023-05-21	5	4.00	310.00	370.00	1776.00	288.00
16835	6841	759	92	5	2023-07-26	3	3.00	10.00	10.00	29.10	0.00
16836	6842	280	1692	2	2023-02-26	3	2.00	20.00	20.00	58.80	0.00
16837	6843	280	1229	2	2023-12-24	3	4.00	10.00	10.00	28.80	0.00
16838	6844	280	1034	2	2023-07-18	5	4.00	60.00	70.00	336.00	48.00
16839	6845	280	1803	2	2023-03-30	4	5.00	910.00	1060.00	4028.00	570.00
16840	6846	1065	1181	2	2023-12-23	2	2.00	460.00	480.00	940.80	39.20
16841	6847	2	1789	2	2022-10-26	4	4.00	20.00	30.00	115.20	38.40
16842	6848	55	432	2	2023-11-30	1	3.00	50.00	60.00	58.20	9.70
16843	6849	930	1685	5	2023-05-03	2	2.00	70.00	80.00	156.80	19.60
16844	6850	70	1443	2	2022-08-18	4	2.00	50.00	60.00	235.20	39.20
16845	6851	64	38	2	2023-08-08	6	3.00	1320.00	1570.00	9137.40	1455.00
16846	6852	64	59	2	2022-12-19	7	5.00	90.00	110.00	731.50	133.00
16847	6853	605	178	1	2023-11-23	4	2.00	50.00	60.00	235.20	39.20
16848	6854	605	1406	1	2023-05-07	3	3.00	420.00	490.00	1425.90	203.70
16849	6855	605	197	1	2022-08-28	4	3.00	300.00	370.00	1435.60	271.60
16850	6856	605	1135	1	2023-12-28	2	3.00	30.00	40.00	77.60	19.40
16851	6857	605	1698	1	2023-08-26	3	5.00	140.00	180.00	513.00	114.00
16852	6858	204	946	2	2022-10-11	3	2.00	30.00	30.00	88.20	0.00
16853	6859	204	933	2	2023-10-08	2	2.00	10.00	10.00	19.60	0.00
16854	6860	204	846	2	2023-07-24	5	3.00	10.00	10.00	48.50	0.00
16855	6861	204	607	2	2023-02-25	11	3.00	220.00	270.00	2880.90	533.50
16856	6862	204	1187	2	2023-03-04	8	2.00	20.00	20.00	156.80	0.00
16857	6863	204	1210	2	2023-08-19	3	2.00	180.00	220.00	646.80	117.60
16858	6864	162	1441	2	2022-07-28	2	2.00	10.00	10.00	19.60	0.00
16859	6865	351	742	2	2022-06-11	2	4.00	10.00	10.00	19.20	0.00
16860	6866	351	462	2	2023-05-04	5	4.00	80.00	90.00	432.00	48.00
16861	6867	351	107	2	2022-07-11	3	4.00	210.00	250.00	720.00	115.20
16862	6868	351	1432	2	2023-08-04	2	4.00	30.00	30.00	57.60	0.00
16863	6869	351	1383	2	2022-10-22	9	5.00	2690.00	2890.00	24709.50	1710.00
16864	6870	351	1466	2	2022-10-07	2	2.00	10.00	10.00	19.60	0.00
16865	6871	351	1611	2	2022-07-05	9	2.00	40.00	50.00	441.00	88.20
16866	6872	322	691	1	2022-05-28	3	4.00	10.00	10.00	28.80	0.00
16867	6873	203	1669	5	2023-03-15	1	2.00	0.00	0.00	0.00	0.00
16868	6874	1066	829	1	2023-11-05	5	5.00	10.00	10.00	47.50	0.00
16869	6875	1066	960	1	2022-11-23	3	2.00	100.00	120.00	352.80	58.80
16870	6876	680	1352	2	2022-03-01	2	3.00	20.00	30.00	58.20	19.40
16871	6877	680	1259	2	2022-10-12	3	3.00	1550.00	1650.00	4801.50	291.00
16872	6878	442	860	7	2022-09-23	6	5.00	110.00	130.00	741.00	114.00
16873	6879	442	1084	7	2022-07-02	1	5.00	10.00	10.00	9.50	0.00
16874	6880	67	446	1	2022-10-30	5	5.00	1900.00	2000.00	9500.00	475.00
16875	6881	67	1331	1	2023-05-19	5	3.00	30.00	30.00	145.50	0.00
16876	6882	67	215	1	2022-12-14	9	2.00	1760.00	1910.00	16846.20	1323.00
16877	6883	67	1167	1	2023-09-29	3	4.00	120.00	150.00	432.00	86.40
16878	6884	67	394	1	2023-08-24	5	4.00	90.00	110.00	528.00	96.00
16879	6885	42	1477	2	2022-08-05	8	4.00	2060.00	2570.00	19737.60	3916.80
16880	6886	197	104	2	2022-08-31	4	4.00	40.00	40.00	153.60	0.00
16881	6887	197	1016	2	2022-05-23	2	5.00	230.00	260.00	494.00	57.00
16882	6888	4	70	2	2022-11-28	3	4.00	20.00	20.00	57.60	0.00
16883	6889	4	998	2	2023-05-20	3	5.00	60.00	70.00	199.50	28.50
16884	6890	135	180	2	2023-06-24	8	5.00	90.00	100.00	760.00	76.00
16885	6891	135	252	2	2022-02-09	7	3.00	40.00	50.00	339.50	67.90
16886	6892	135	109	2	2023-05-12	3	3.00	100.00	110.00	320.10	29.10
16887	6893	135	1466	2	2022-03-25	4	4.00	20.00	30.00	115.20	38.40
16888	6894	135	1525	2	2022-09-19	4	5.00	20.00	20.00	76.00	0.00
16889	6895	135	54	2	2023-11-11	2	4.00	340.00	410.00	787.20	134.40
16890	6896	135	611	2	2022-12-06	2	3.00	30.00	30.00	58.20	0.00
16891	6897	135	1690	2	2022-05-06	5	2.00	230.00	240.00	1176.00	49.00
16892	6898	1067	1225	2	2022-05-22	3	3.00	10.00	10.00	29.10	0.00
16893	6899	908	813	1	2023-01-02	7	5.00	500.00	600.00	3990.00	665.00
16894	6900	908	1207	1	2022-10-15	6	2.00	10.00	10.00	58.80	0.00
16895	6901	44	658	2	2022-11-11	7	4.00	450.00	560.00	3763.20	739.20
16896	6902	479	307	7	2023-10-19	5	5.00	1940.00	2400.00	11400.00	2185.00
16897	6903	199	660	2	2023-04-03	4	4.00	20.00	20.00	76.80	0.00
16898	6904	199	1804	2	2022-01-06	2	3.00	10.00	10.00	19.40	0.00
16899	6905	199	1756	2	2023-12-04	5	5.00	220.00	240.00	1140.00	95.00
16900	6906	501	684	1	2022-10-23	1	3.00	10.00	10.00	9.70	0.00
16901	6907	1068	341	7	2022-12-02	2	4.00	30.00	40.00	76.80	19.20
16902	6908	6	1719	2	2022-06-30	2	2.00	860.00	1000.00	1960.00	274.40
16903	6909	1069	1257	2	2022-05-27	2	4.00	10.00	10.00	19.20	0.00
16904	6910	51	758	1	2023-06-12	3	2.00	0.00	0.00	0.00	0.00
16905	6911	6	267	2	2022-01-03	2	4.00	100.00	120.00	230.40	38.40
16906	6912	10	822	1	2023-03-28	3	5.00	150.00	190.00	541.50	114.00
16907	6913	19	686	1	2023-07-23	4	2.00	140.00	160.00	627.20	78.40
16908	6914	1070	105	2	2022-05-26	2	5.00	50.00	60.00	114.00	19.00
16909	6915	118	547	2	2023-01-31	1	3.00	110.00	130.00	126.10	19.40
16910	6916	118	529	2	2022-02-14	6	2.00	20.00	20.00	117.60	0.00
16911	6917	118	969	2	2022-03-02	4	3.00	110.00	120.00	465.60	38.80
16912	6918	745	1132	2	2023-08-05	5	2.00	1120.00	1400.00	6860.00	1372.00
16913	6919	68	1512	1	2022-05-22	3	5.00	30.00	30.00	85.50	0.00
16914	6920	125	801	2	2022-02-28	2	2.00	20.00	20.00	39.20	0.00
16915	6921	1071	544	2	2023-04-10	7	2.00	300.00	360.00	2469.60	411.60
16916	6922	304	619	2	2023-02-14	1	4.00	20.00	20.00	19.20	0.00
16917	6923	507	509	1	2022-04-29	5	3.00	440.00	490.00	2376.50	242.50
16918	6924	507	437	1	2023-01-13	2	2.00	10.00	10.00	19.60	0.00
16919	6925	134	939	2	2022-10-27	7	5.00	20.00	20.00	133.00	0.00
16920	6926	134	1545	2	2022-10-25	12	3.00	550.00	680.00	7915.20	1513.20
16921	6927	4	1730	2	2023-09-02	3	5.00	20.00	20.00	57.00	0.00
16922	6928	10	1248	1	2023-09-29	4	3.00	70.00	90.00	349.20	77.60
16923	6929	10	574	1	2023-10-27	3	2.00	20.00	20.00	58.80	0.00
16924	6930	10	349	1	2023-05-23	7	5.00	740.00	860.00	5719.00	798.00
16925	6931	10	682	1	2022-02-22	1	2.00	20.00	20.00	19.60	0.00
16926	6932	12	1805	2	2022-07-17	1	2.00	10.00	10.00	9.80	0.00
16927	6933	12	1731	2	2023-05-11	2	2.00	20.00	20.00	39.20	0.00
16928	6934	12	1802	2	2022-11-26	2	2.00	30.00	30.00	58.80	0.00
16929	6935	12	1063	2	2023-09-17	2	4.00	30.00	40.00	76.80	19.20
16930	6936	857	98	1	2023-11-14	3	2.00	90.00	100.00	294.00	29.40
16931	6937	229	1806	5	2022-08-13	2	2.00	70.00	80.00	156.80	19.60
16932	6938	429	1768	7	2022-07-19	2	4.00	40.00	40.00	76.80	0.00
16933	6939	203	1807	2	2022-10-20	4	2.00	410.00	480.00	1881.60	274.40
16934	6940	253	670	2	2023-08-05	2	3.00	90.00	100.00	194.00	19.40
16935	6941	253	676	2	2022-05-28	5	3.00	20.00	30.00	145.50	48.50
16936	6942	253	519	2	2023-02-10	4	4.00	580.00	710.00	2726.40	499.20
16937	6943	253	1275	2	2023-03-10	3	4.00	60.00	70.00	201.60	28.80
16938	6944	4	1808	2	2022-09-21	5	4.00	580.00	620.00	2976.00	192.00
16939	6945	417	995	2	2022-08-16	4	4.00	10.00	10.00	38.40	0.00
16940	6946	383	1220	2	2023-11-05	5	5.00	450.00	520.00	2470.00	332.50
16941	6947	1072	311	2	2022-04-29	2	5.00	0.00	0.00	0.00	0.00
16942	6948	623	943	2	2023-05-02	2	5.00	190.00	220.00	418.00	57.00
16943	6949	623	1535	2	2023-05-15	3	3.00	110.00	130.00	378.30	58.20
16944	6950	304	1125	7	2022-07-31	7	3.00	50.00	60.00	407.40	67.90
16945	6951	304	973	7	2022-11-22	3	5.00	80.00	80.00	228.00	0.00
16946	6952	211	1809	2	2022-10-10	2	5.00	460.00	480.00	912.00	38.00
16947	6953	204	1182	5	2022-05-28	3	2.00	10.00	10.00	29.40	0.00
16948	6954	204	1596	5	2022-02-09	4	2.00	40.00	50.00	196.00	39.20
16949	6955	204	1371	5	2022-08-24	5	4.00	410.00	500.00	2400.00	432.00
16950	6956	351	762	2	2022-04-26	2	3.00	20.00	20.00	38.80	0.00
16951	6957	375	1345	2	2022-09-16	5	4.00	30.00	40.00	192.00	48.00
16952	6958	375	29	2	2022-06-01	1	2.00	40.00	50.00	49.00	9.80
16953	6959	258	178	1	2023-06-02	1	3.00	20.00	20.00	19.40	0.00
16954	6960	258	127	1	2023-04-27	3	2.00	120.00	150.00	441.00	88.20
16955	6961	258	491	1	2023-11-07	2	5.00	10.00	10.00	19.00	0.00
16956	6962	1073	1027	7	2022-02-15	3	4.00	10.00	10.00	28.80	0.00
16957	6963	259	30	1	2022-08-22	5	3.00	10.00	10.00	48.50	0.00
16958	6964	259	1454	1	2022-12-26	3	2.00	20.00	20.00	58.80	0.00
16959	6965	259	545	1	2023-12-10	5	5.00	20.00	20.00	95.00	0.00
16960	6966	259	1303	1	2023-04-01	2	3.00	70.00	80.00	155.20	19.40
16961	6967	259	508	1	2022-01-23	2	2.00	10.00	10.00	19.60	0.00
16962	6968	259	1605	1	2022-05-31	9	4.00	50.00	60.00	518.40	86.40
16963	6969	213	904	1	2023-10-20	3	3.00	740.00	820.00	2386.20	232.80
16964	6970	1016	528	1	2023-03-22	5	3.00	20.00	20.00	97.00	0.00
16965	6971	55	1556	2	2023-01-14	2	4.00	10.00	10.00	19.20	0.00
16966	6972	55	202	2	2023-10-11	2	3.00	80.00	90.00	174.60	19.40
16967	6973	55	1539	2	2022-05-16	2	2.00	440.00	470.00	921.20	58.80
16968	6974	55	59	2	2023-10-22	4	5.00	20.00	20.00	76.00	0.00
16969	6975	141	1572	2	2022-09-16	2	4.00	30.00	30.00	57.60	0.00
16970	6976	29	1140	2	2022-09-24	2	3.00	10.00	10.00	19.40	0.00
16971	6977	29	623	2	2022-11-01	4	5.00	580.00	620.00	2356.00	152.00
16972	6978	341	994	5	2023-10-17	2	5.00	60.00	60.00	114.00	0.00
16973	6979	185	363	1	2023-11-07	9	5.00	40.00	50.00	427.50	85.50
16974	6980	234	1694	2	2023-05-07	5	3.00	140.00	150.00	727.50	48.50
16975	6981	25	1085	5	2023-01-03	4	2.00	10.00	10.00	39.20	0.00
16976	6982	25	1604	5	2022-12-08	3	4.00	30.00	30.00	86.40	0.00
16977	6983	166	545	2	2023-10-28	5	2.00	20.00	20.00	98.00	0.00
16978	6984	166	403	2	2022-01-08	1	3.00	10.00	10.00	9.70	0.00
16979	6985	166	550	2	2023-01-29	4	5.00	330.00	380.00	1444.00	190.00
16980	6986	166	778	2	2022-07-10	4	2.00	30.00	30.00	117.60	0.00
16981	6987	166	880	2	2023-02-14	2	5.00	10.00	10.00	19.00	0.00
16982	6988	166	1086	2	2022-01-13	5	5.00	20.00	30.00	142.50	47.50
16983	6989	1055	1365	1	2022-04-27	5	5.00	930.00	1160.00	5510.00	1092.50
16984	6990	1074	1810	5	2023-01-07	2	4.00	0.00	0.00	0.00	0.00
16985	6991	851	668	1	2022-03-29	3	2.00	30.00	40.00	117.60	29.40
16986	6992	851	1410	1	2023-03-28	5	4.00	190.00	230.00	1104.00	192.00
16987	6993	851	1293	1	2022-03-19	3	4.00	160.00	190.00	547.20	86.40
16988	6994	851	109	1	2023-08-02	7	5.00	230.00	270.00	1795.50	266.00
16989	6995	851	312	1	2023-12-13	5	5.00	30.00	30.00	142.50	0.00
16990	6996	1075	1038	2	2023-08-23	4	2.00	30.00	30.00	117.60	0.00
16991	6997	953	154	1	2022-09-11	4	3.00	10.00	10.00	38.80	0.00
16992	6998	953	1083	1	2022-06-29	4	3.00	150.00	180.00	698.40	116.40
16993	6999	420	728	2	2022-03-13	2	5.00	10.00	10.00	19.00	0.00
16994	7000	1076	1711	5	2022-04-11	3	4.00	170.00	210.00	604.80	115.20
16995	7001	1076	506	5	2022-11-25	2	4.00	30.00	30.00	57.60	0.00
16996	7002	1077	1586	2	2022-03-30	4	5.00	300.00	370.00	1406.00	266.00
16997	7003	156	480	1	2022-09-16	7	4.00	240.00	290.00	1948.80	336.00
16998	7004	156	1312	1	2023-01-07	2	4.00	60.00	70.00	134.40	19.20
16999	7005	822	1397	2	2022-12-05	1	5.00	10.00	10.00	9.50	0.00
17000	7006	31	1757	2	2022-04-11	2	5.00	190.00	210.00	399.00	38.00
17001	7007	74	1446	2	2023-02-21	2	4.00	10.00	10.00	19.20	0.00
17002	7008	291	411	2	2022-09-11	2	2.00	10.00	10.00	19.60	0.00
17003	7009	291	464	2	2023-05-03	3	3.00	540.00	600.00	1746.00	174.60
17004	7010	291	1526	2	2022-05-04	1	3.00	30.00	30.00	29.10	0.00
17005	7011	134	1367	2	2023-06-06	5	5.00	20.00	20.00	95.00	0.00
17006	7012	134	1577	2	2022-06-20	2	3.00	10.00	10.00	19.40	0.00
17007	7013	134	78	2	2023-11-17	1	3.00	180.00	210.00	203.70	29.10
17008	7014	1078	673	1	2023-07-23	3	3.00	140.00	150.00	436.50	29.10
17009	7015	155	415	1	2023-03-07	3	2.00	140.00	150.00	441.00	29.40
17010	7016	155	679	1	2022-07-02	2	4.00	30.00	30.00	57.60	0.00
17011	7017	155	470	1	2022-11-06	3	5.00	480.00	590.00	1681.50	313.50
17012	7018	155	1464	1	2023-07-10	3	3.00	10.00	10.00	29.10	0.00
17013	7019	134	1648	1	2023-10-15	7	5.00	30.00	30.00	199.50	0.00
17014	7020	88	1811	2	2023-11-26	3	5.00	20.00	20.00	57.00	0.00
17015	7021	88	1769	2	2023-09-14	1	5.00	10.00	10.00	9.50	0.00
17016	7022	88	248	2	2023-03-12	3	2.00	0.00	0.00	0.00	0.00
17017	7023	88	425	2	2023-05-21	9	3.00	120.00	140.00	1222.20	174.60
17018	7024	88	713	2	2022-07-10	6	4.00	30.00	30.00	172.80	0.00
17019	7025	88	1031	2	2022-01-24	9	5.00	200.00	220.00	1881.00	171.00
17020	7026	25	530	2	2022-10-22	6	4.00	210.00	230.00	1324.80	115.20
17021	7027	25	1785	2	2023-07-18	4	4.00	40.00	50.00	192.00	38.40
17022	7028	383	710	2	2023-09-07	2	4.00	10.00	10.00	19.20	0.00
17023	7029	752	988	1	2023-12-11	5	5.00	30.00	30.00	142.50	0.00
17024	7030	213	1191	2	2023-07-21	3	2.00	30.00	30.00	88.20	0.00
17025	7031	213	1543	2	2022-04-03	2	5.00	40.00	40.00	76.00	0.00
17026	7032	213	291	2	2023-01-03	3	5.00	80.00	90.00	256.50	28.50
17027	7033	213	1210	2	2023-04-14	3	3.00	200.00	250.00	727.50	145.50
17028	7034	213	711	2	2023-07-22	3	4.00	50.00	60.00	172.80	28.80
17029	7035	213	909	2	2022-02-28	3	2.00	30.00	40.00	117.60	29.40
17030	7036	248	636	2	2022-12-02	3	4.00	490.00	520.00	1497.60	86.40
17031	7037	815	852	1	2023-02-01	2	5.00	460.00	480.00	912.00	38.00
17032	7038	582	1331	2	2023-04-21	2	2.00	10.00	10.00	19.60	0.00
17033	7039	582	1812	2	2022-01-03	3	4.00	20.00	20.00	57.60	0.00
17034	7040	31	226	2	2022-04-27	2	2.00	140.00	170.00	333.20	58.80
17035	7041	31	1340	2	2023-02-03	3	4.00	20.00	20.00	57.60	0.00
17036	7042	31	1293	2	2022-06-16	2	3.00	110.00	120.00	232.80	19.40
17037	7043	71	1688	2	2022-12-26	5	4.00	560.00	600.00	2880.00	192.00
17038	7044	71	475	2	2022-05-03	4	2.00	190.00	200.00	784.00	39.20
17039	7045	71	1323	2	2022-08-29	2	5.00	10.00	10.00	19.00	0.00
17040	7046	211	1216	2	2023-01-01	2	4.00	10.00	10.00	19.20	0.00
17041	7047	1079	210	2	2023-02-03	1	2.00	90.00	100.00	98.00	9.80
17042	7048	1079	296	2	2022-12-01	4	5.00	330.00	400.00	1520.00	266.00
17043	7049	611	1554	5	2023-09-16	3	4.00	20.00	20.00	57.60	0.00
17044	7050	730	1584	2	2022-05-23	2	4.00	10.00	10.00	19.20	0.00
17045	7051	646	271	7	2022-03-15	5	2.00	180.00	210.00	1029.00	147.00
17046	7052	646	1760	7	2022-09-27	2	5.00	20.00	20.00	38.00	0.00
17047	7053	646	1175	7	2022-02-15	1	5.00	30.00	30.00	28.50	0.00
17048	7054	646	633	7	2023-08-11	4	5.00	100.00	120.00	456.00	76.00
17049	7055	646	1210	7	2022-06-13	5	3.00	290.00	360.00	1746.00	339.50
17050	7056	646	529	7	2022-12-21	3	5.00	30.00	40.00	114.00	28.50
17051	7057	646	823	7	2022-03-15	9	2.00	100.00	120.00	1058.40	176.40
17052	7058	646	899	7	2023-07-29	7	2.00	740.00	890.00	6105.40	1029.00
17053	7059	646	1765	7	2022-03-26	3	2.00	40.00	50.00	147.00	29.40
17054	7060	646	587	7	2023-07-23	2	2.00	70.00	80.00	156.80	19.60
17055	7061	646	1813	7	2022-10-28	2	3.00	10.00	10.00	19.40	0.00
17056	7062	1080	882	1	2023-10-31	3	5.00	10.00	10.00	28.50	0.00
17057	7063	672	1759	1	2022-07-20	3	5.00	30.00	30.00	85.50	0.00
17058	7064	969	1563	2	2022-03-22	2	3.00	10.00	10.00	19.40	0.00
17059	7065	181	931	2	2023-02-05	3	5.00	30.00	30.00	85.50	0.00
17060	7066	177	735	5	2022-06-06	7	5.00	1110.00	1260.00	8379.00	997.50
17061	7067	381	1435	2	2023-02-07	6	3.00	30.00	40.00	232.80	58.20
17062	7068	227	186	2	2022-04-02	2	2.00	0.00	0.00	0.00	0.00
17063	7069	227	694	2	2022-01-16	9	5.00	70.00	80.00	684.00	85.50
17064	7070	362	458	2	2023-09-22	1	2.00	10.00	10.00	9.80	0.00
17065	7071	229	610	1	2023-07-03	2	5.00	10.00	10.00	19.00	0.00
17066	7072	1081	1478	2	2023-03-30	2	4.00	0.00	0.00	0.00	0.00
17067	7073	1081	1115	2	2022-08-31	1	2.00	10.00	10.00	9.80	0.00
17068	7074	1081	400	2	2022-09-01	5	2.00	160.00	180.00	882.00	98.00
17069	7075	1081	991	2	2022-08-23	4	4.00	0.00	0.00	0.00	0.00
17070	7076	1081	1060	2	2022-09-12	2	2.00	10.00	10.00	19.60	0.00
17071	7077	203	599	2	2023-05-04	5	2.00	50.00	50.00	245.00	0.00
17072	7078	47	635	2	2023-04-30	7	2.00	20.00	20.00	137.20	0.00
17073	7079	47	1429	2	2022-12-10	9	5.00	290.00	310.00	2650.50	171.00
17074	7080	47	488	2	2023-07-11	4	4.00	20.00	20.00	76.80	0.00
17075	7081	47	115	2	2023-07-22	3	4.00	380.00	470.00	1353.60	259.20
17076	7082	47	696	2	2023-09-19	3	3.00	950.00	1010.00	2939.10	174.60
17077	7083	47	1427	2	2022-12-23	5	3.00	20.00	20.00	97.00	0.00
17078	7084	1082	1274	1	2022-12-22	2	4.00	0.00	0.00	0.00	0.00
17079	7085	1082	945	1	2022-12-26	9	5.00	1400.00	1630.00	13936.50	1966.50
17080	7086	1083	1548	5	2022-04-10	5	3.00	10.00	10.00	48.50	0.00
17081	7087	1083	1421	5	2023-12-16	2	2.00	170.00	190.00	372.40	39.20
17082	7088	27	1292	1	2023-09-04	3	3.00	90.00	100.00	291.00	29.10
17083	7089	1084	1042	1	2023-06-08	4	3.00	70.00	80.00	310.40	38.80
17084	7090	376	1188	1	2023-05-28	1	3.00	100.00	120.00	116.40	19.40
17085	7091	1	259	2	2023-05-02	3	3.00	100.00	110.00	320.10	29.10
17086	7092	1	1310	2	2023-09-08	3	4.00	140.00	160.00	460.80	57.60
17087	7093	1	1395	2	2023-11-21	2	4.00	40.00	40.00	76.80	0.00
17088	7094	1	1541	2	2022-10-04	5	5.00	50.00	50.00	237.50	0.00
17089	7095	172	296	1	2022-12-27	6	2.00	390.00	480.00	2822.40	529.20
17090	7096	31	998	5	2022-12-05	6	5.00	120.00	150.00	855.00	171.00
17091	7097	31	1592	5	2023-05-30	2	2.00	250.00	280.00	548.80	58.80
17092	7098	31	859	5	2023-03-08	5	5.00	30.00	30.00	142.50	0.00
17093	7099	383	1734	2	2023-03-20	9	5.00	280.00	320.00	2736.00	342.00
17094	7100	31	1734	1	2022-01-02	6	2.00	170.00	210.00	1234.80	235.20
17095	7101	313	1171	2	2022-11-14	3	4.00	20.00	20.00	57.60	0.00
17096	7102	175	34	1	2022-09-02	2	2.00	20.00	20.00	39.20	0.00
17097	7103	12	348	5	2023-10-24	3	3.00	10.00	10.00	29.10	0.00
17098	7104	268	1673	2	2023-05-23	2	4.00	340.00	420.00	806.40	153.60
17099	7105	473	324	1	2023-10-18	6	4.00	710.00	760.00	4377.60	288.00
17100	7106	473	1373	1	2022-08-30	3	4.00	40.00	40.00	115.20	0.00
17101	7107	473	1618	1	2023-07-04	9	3.00	100.00	120.00	1047.60	174.60
17102	7108	134	715	2	2022-09-27	2	5.00	20.00	30.00	57.00	19.00
17103	7109	134	1200	2	2022-03-11	2	3.00	0.00	0.00	0.00	0.00
17104	7110	134	157	2	2022-04-03	4	4.00	400.00	460.00	1766.40	230.40
17105	7111	134	1563	2	2022-03-03	2	4.00	10.00	10.00	19.20	0.00
17106	7112	134	916	2	2022-09-14	2	2.00	60.00	70.00	137.20	19.60
17107	7113	134	134	2	2023-02-27	5	4.00	50.00	50.00	240.00	0.00
17108	7114	134	1459	2	2022-05-22	2	2.00	10.00	10.00	19.60	0.00
17109	7115	474	1661	5	2022-11-10	6	5.00	1500.00	1690.00	9633.00	1083.00
17110	7116	474	176	5	2022-06-07	2	4.00	10.00	10.00	19.20	0.00
17111	7117	6	1091	1	2023-11-15	2	4.00	50.00	60.00	115.20	19.20
17112	7118	6	1339	1	2023-01-16	1	3.00	0.00	0.00	0.00	0.00
17113	7119	253	1332	2	2022-11-01	3	2.00	20.00	20.00	58.80	0.00
17114	7120	237	531	2	2023-03-17	2	2.00	10.00	10.00	19.60	0.00
17115	7121	754	1189	2	2023-01-01	1	4.00	60.00	70.00	67.20	9.60
17116	7122	203	1775	2	2023-05-22	7	2.00	30.00	40.00	274.40	68.60
17117	7123	203	1532	2	2022-07-09	2	3.00	120.00	140.00	271.60	38.80
17118	7124	49	1534	2	2022-11-28	3	2.00	10.00	10.00	29.40	0.00
17119	7125	49	1416	2	2022-08-08	3	2.00	110.00	140.00	411.60	88.20
17120	7126	185	1297	1	2023-06-17	3	5.00	20.00	20.00	57.00	0.00
17121	7127	185	183	1	2023-08-22	3	4.00	10.00	10.00	28.80	0.00
17122	7128	436	1129	2	2023-08-09	5	3.00	20.00	20.00	97.00	0.00
17123	7129	436	1468	2	2022-12-26	4	5.00	20.00	20.00	76.00	0.00
17124	7130	611	917	2	2022-07-07	4	3.00	30.00	40.00	155.20	38.80
17125	7131	611	1666	2	2022-07-07	7	5.00	100.00	120.00	798.00	133.00
17126	7132	342	978	2	2022-01-24	3	4.00	250.00	260.00	748.80	28.80
17127	7133	342	1148	2	2023-11-26	4	5.00	1750.00	1880.00	7144.00	494.00
17128	7134	342	1002	2	2023-01-26	2	4.00	20.00	30.00	57.60	19.20
17129	7135	342	818	2	2023-07-19	2	4.00	90.00	90.00	172.80	0.00
17130	7136	342	158	2	2023-04-29	3	3.00	710.00	830.00	2415.30	349.20
17131	7137	150	545	2	2023-02-19	5	5.00	10.00	10.00	47.50	0.00
17132	7138	150	377	2	2022-06-14	2	2.00	20.00	20.00	39.20	0.00
17133	7139	150	271	2	2023-09-04	4	4.00	50.00	60.00	230.40	38.40
17134	7140	150	431	2	2023-08-19	3	4.00	230.00	290.00	835.20	172.80
17135	7141	1085	722	7	2022-05-18	4	4.00	100.00	110.00	422.40	38.40
17136	7142	1085	1252	7	2023-02-11	5	4.00	130.00	140.00	672.00	48.00
17137	7143	986	1381	2	2023-05-05	5	2.00	100.00	110.00	539.00	49.00
17138	7144	243	1368	2	2022-07-13	5	3.00	690.00	780.00	3783.00	436.50
17139	7145	243	103	2	2023-01-29	1	5.00	10.00	10.00	9.50	0.00
17140	7146	243	839	2	2023-08-06	3	5.00	120.00	150.00	427.50	85.50
17141	7147	243	1790	2	2023-06-02	1	3.00	30.00	40.00	38.80	9.70
17142	7148	365	1175	2	2022-12-14	3	3.00	80.00	90.00	261.90	29.10
17143	7149	365	1298	2	2023-10-29	3	3.00	50.00	50.00	145.50	0.00
17144	7150	35	1247	2	2022-12-19	3	3.00	880.00	970.00	2822.70	261.90
17145	7151	899	475	2	2022-08-14	2	2.00	130.00	140.00	274.40	19.60
17146	7152	193	963	1	2022-04-27	2	2.00	150.00	180.00	352.80	58.80
17147	7153	384	418	2	2022-05-24	2	4.00	80.00	90.00	172.80	19.20
17148	7154	101	984	2	2023-05-02	7	4.00	40.00	50.00	336.00	67.20
17149	7155	375	1763	1	2022-06-17	6	4.00	240.00	280.00	1612.80	230.40
17150	7156	375	352	1	2023-11-11	5	3.00	150.00	160.00	776.00	48.50
17151	7157	845	747	2	2022-06-08	1	2.00	0.00	0.00	0.00	0.00
17152	7158	4	211	1	2023-11-11	4	5.00	80.00	90.00	342.00	38.00
17153	7159	4	1814	1	2022-09-22	1	5.00	10.00	10.00	9.50	0.00
17154	7160	39	873	1	2022-04-22	2	5.00	200.00	220.00	418.00	38.00
17155	7161	39	660	1	2022-08-11	4	2.00	20.00	20.00	78.40	0.00
17156	7162	261	340	2	2022-05-19	3	4.00	20.00	20.00	57.60	0.00
17157	7163	261	745	2	2022-11-23	5	2.00	20.00	20.00	98.00	0.00
17158	7164	1086	1504	1	2023-10-04	8	5.00	200.00	250.00	1900.00	380.00
17159	7165	1086	926	1	2022-05-27	3	3.00	10.00	10.00	29.10	0.00
17160	7166	371	55	5	2023-12-25	2	5.00	60.00	70.00	133.00	19.00
17161	7167	37	650	1	2023-06-18	4	4.00	10.00	10.00	38.40	0.00
17162	7168	37	1181	1	2022-12-21	3	4.00	630.00	720.00	2073.60	259.20
17163	7169	37	393	1	2023-04-09	10	5.00	210.00	240.00	2280.00	285.00
17164	7170	37	1170	1	2023-04-28	3	5.00	150.00	170.00	484.50	57.00
17165	7171	31	395	2	2022-08-29	2	3.00	120.00	150.00	291.00	58.20
17166	7172	10	358	1	2023-12-10	3	4.00	90.00	110.00	316.80	57.60
17167	7173	165	358	2	2023-08-13	5	2.00	110.00	140.00	686.00	147.00
17168	7174	165	350	2	2022-08-14	5	3.00	1940.00	2400.00	11640.00	2231.00
17169	7175	165	1324	2	2023-06-09	3	5.00	60.00	70.00	199.50	28.50
17170	7176	165	1310	2	2023-08-13	8	2.00	80.00	90.00	705.60	78.40
17171	7177	165	1032	2	2022-08-01	3	4.00	20.00	30.00	86.40	28.80
17172	7178	59	1813	2	2022-08-15	2	3.00	0.00	0.00	0.00	0.00
17173	7179	59	865	2	2022-04-12	3	2.00	10.00	10.00	29.40	0.00
17174	7180	521	1508	2	2022-03-30	3	2.00	80.00	90.00	264.60	29.40
17175	7181	1087	320	5	2022-05-06	3	2.00	10.00	10.00	29.40	0.00
17176	7182	630	1073	1	2023-06-05	2	3.00	30.00	40.00	77.60	19.40
17177	7183	80	700	2	2022-07-17	5	4.00	20.00	20.00	96.00	0.00
17178	7184	521	39	5	2022-03-29	9	5.00	730.00	910.00	7780.50	1539.00
17179	7185	15	1568	2	2022-09-29	2	3.00	10.00	10.00	19.40	0.00
17180	7186	15	1413	2	2022-02-18	3	5.00	10.00	10.00	28.50	0.00
17181	7187	15	1392	2	2022-10-31	4	2.00	60.00	70.00	274.40	39.20
17182	7188	15	1479	2	2022-03-26	2	4.00	20.00	20.00	38.40	0.00
17183	7189	15	536	2	2022-12-12	4	3.00	40.00	40.00	155.20	0.00
17184	7190	423	1496	5	2023-04-08	3	4.00	180.00	200.00	576.00	57.60
17185	7191	423	1661	5	2022-04-14	3	2.00	620.00	670.00	1969.80	147.00
17186	7192	629	308	1	2022-05-15	4	2.00	10.00	10.00	39.20	0.00
17187	7193	629	1160	1	2023-10-26	8	2.00	30.00	30.00	235.20	0.00
17188	7194	185	907	5	2023-04-24	6	3.00	1120.00	1350.00	7857.00	1338.60
17189	7195	185	123	5	2023-07-03	4	4.00	20.00	20.00	76.80	0.00
17190	7196	551	29	2	2023-09-12	2	5.00	20.00	20.00	38.00	0.00
17191	7197	316	1047	2	2022-06-04	5	3.00	20.00	20.00	97.00	0.00
17192	7198	316	1730	2	2022-07-04	2	2.00	10.00	10.00	19.60	0.00
17193	7199	82	251	2	2023-07-10	2	2.00	10.00	10.00	19.60	0.00
17194	7200	82	303	2	2023-12-27	2	5.00	130.00	140.00	266.00	19.00
17195	7201	3	1286	2	2023-09-07	1	3.00	110.00	120.00	116.40	9.70
17196	7202	3	978	2	2022-12-06	7	5.00	290.00	330.00	2194.50	266.00
17197	7203	263	1815	7	2022-08-16	5	5.00	650.00	760.00	3610.00	522.50
17198	7204	1088	1678	2	2023-05-15	3	5.00	10.00	10.00	28.50	0.00
17199	7205	104	1280	2	2023-07-26	2	5.00	10.00	10.00	19.00	0.00
17200	7206	10	699	2	2023-02-21	2	4.00	20.00	20.00	38.40	0.00
17201	7207	10	1795	2	2023-08-17	11	4.00	340.00	370.00	3907.20	316.80
17202	7208	762	854	5	2023-09-30	2	5.00	0.00	0.00	0.00	0.00
17203	7209	762	1811	5	2023-09-25	4	2.00	20.00	20.00	78.40	0.00
17204	7210	762	458	5	2023-02-12	2	4.00	10.00	10.00	19.20	0.00
17205	7211	411	1604	2	2023-08-09	3	4.00	20.00	30.00	86.40	28.80
17206	7212	411	62	2	2023-08-31	12	5.00	40.00	50.00	570.00	114.00
17207	7213	411	606	2	2022-10-21	3	4.00	10.00	10.00	28.80	0.00
17208	7214	1089	1124	2	2023-10-03	3	3.00	10.00	10.00	29.10	0.00
17209	7215	242	1211	1	2022-10-07	5	2.00	20.00	20.00	98.00	0.00
17210	7216	242	861	1	2023-11-12	4	3.00	30.00	30.00	116.40	0.00
17211	7217	10	455	5	2023-04-02	3	4.00	10.00	10.00	28.80	0.00
17212	7218	10	921	5	2023-08-07	2	2.00	60.00	60.00	117.60	0.00
17213	7219	10	107	5	2022-05-30	4	4.00	300.00	340.00	1305.60	153.60
17214	7220	10	583	5	2023-07-15	2	4.00	40.00	50.00	96.00	19.20
17215	7221	12	570	2	2023-03-18	3	5.00	250.00	270.00	769.50	57.00
17216	7222	134	1677	2	2023-01-17	3	2.00	130.00	140.00	411.60	29.40
17217	7223	118	659	2	2023-07-11	3	3.00	30.00	40.00	116.40	29.10
17218	7224	37	41	2	2023-12-15	3	3.00	100.00	110.00	320.10	29.10
17219	7225	37	1657	2	2022-12-20	7	2.00	130.00	150.00	1029.00	137.20
17220	7226	37	443	2	2022-12-17	4	2.00	30.00	30.00	117.60	0.00
17221	7227	325	1031	2	2023-11-14	5	4.00	110.00	120.00	576.00	48.00
17222	7228	325	765	2	2023-04-28	5	4.00	1080.00	1320.00	6336.00	1152.00
17223	7229	37	441	5	2022-06-21	6	3.00	70.00	90.00	523.80	116.40
17224	7230	37	230	5	2023-04-07	3	4.00	20.00	20.00	57.60	0.00
17225	7231	79	1088	5	2022-05-19	2	4.00	20.00	30.00	57.60	19.20
17226	7232	79	1779	5	2023-12-29	2	5.00	410.00	470.00	893.00	114.00
17227	7233	79	988	5	2023-03-22	4	5.00	30.00	30.00	114.00	0.00
17228	7234	383	379	2	2022-02-10	8	5.00	90.00	110.00	836.00	152.00
17229	7235	383	549	2	2022-06-08	2	5.00	10.00	10.00	19.00	0.00
17230	7236	383	1312	2	2022-05-25	2	5.00	60.00	70.00	133.00	19.00
17231	7237	14	650	5	2022-05-05	3	4.00	10.00	10.00	28.80	0.00
17232	7238	125	1816	7	2022-08-23	3	2.00	270.00	340.00	999.60	205.80
17233	7239	308	1449	2	2022-02-18	7	2.00	40.00	40.00	274.40	0.00
17234	7240	308	153	2	2022-04-07	7	3.00	40.00	40.00	271.60	0.00
17235	7241	62	1463	1	2023-12-05	7	5.00	70.00	70.00	465.50	0.00
17236	7242	62	613	1	2023-10-24	6	2.00	80.00	90.00	529.20	58.80
17237	7243	62	442	1	2023-09-29	2	3.00	20.00	20.00	38.80	0.00
17238	7244	71	484	1	2022-02-27	9	3.00	3540.00	4420.00	38586.60	7682.40
17239	7245	14	1659	5	2023-07-01	7	4.00	40.00	50.00	336.00	67.20
17240	7246	4	1044	2	2022-01-19	5	2.00	310.00	350.00	1715.00	196.00
17241	7247	57	1730	2	2023-11-13	3	4.00	20.00	20.00	57.60	0.00
17242	7248	57	367	2	2023-08-08	5	5.00	250.00	300.00	1425.00	237.50
17243	7249	57	701	2	2023-05-11	8	4.00	30.00	40.00	307.20	76.80
17244	7250	204	1581	1	2023-07-04	2	2.00	100.00	120.00	235.20	39.20
17245	7251	204	1739	1	2023-06-15	3	3.00	810.00	990.00	2880.90	523.80
17246	7252	1090	1817	2	2023-09-11	4	2.00	10.00	10.00	39.20	0.00
17247	7253	1091	1275	2	2023-06-14	3	2.00	70.00	70.00	205.80	0.00
17248	7254	793	167	2	2023-11-17	3	3.00	300.00	360.00	1047.60	174.60
17249	7255	793	1184	2	2022-06-05	5	2.00	40.00	50.00	245.00	49.00
17250	7256	793	254	2	2022-08-02	4	5.00	40.00	50.00	190.00	38.00
17251	7257	793	325	2	2023-11-30	2	5.00	10.00	10.00	19.00	0.00
17252	7258	793	922	2	2022-04-03	6	2.00	570.00	630.00	3704.40	352.80
17253	7259	793	135	2	2023-03-14	5	4.00	10.00	10.00	48.00	0.00
17254	7260	793	975	2	2023-07-14	7	4.00	40.00	50.00	336.00	67.20
17255	7261	793	1067	2	2022-12-27	1	5.00	110.00	130.00	123.50	19.00
17256	7262	1064	1707	1	2023-06-08	7	4.00	10.00	10.00	67.20	0.00
17257	7263	325	48	2	2022-02-28	5	5.00	30.00	30.00	142.50	0.00
17258	7264	325	1653	2	2022-12-09	4	5.00	30.00	30.00	114.00	0.00
17259	7265	30	1503	2	2023-03-14	7	2.00	150.00	180.00	1234.80	205.80
17260	7266	515	914	1	2022-10-18	2	4.00	150.00	160.00	307.20	19.20
17261	7267	97	529	7	2022-05-26	3	2.00	10.00	10.00	29.40	0.00
17262	7268	97	1019	7	2023-03-23	4	3.00	60.00	70.00	271.60	38.80
17263	7269	5	1559	2	2023-02-16	2	4.00	70.00	90.00	172.80	38.40
17264	7270	5	1818	2	2022-03-19	8	2.00	290.00	320.00	2508.80	235.20
17265	7271	66	1163	2	2022-10-31	2	5.00	230.00	270.00	513.00	76.00
17266	7272	66	1299	2	2023-04-11	4	3.00	20.00	20.00	77.60	0.00
17267	7273	771	506	2	2022-06-17	2	4.00	20.00	20.00	38.40	0.00
17268	7274	771	249	2	2023-11-09	3	5.00	0.00	0.00	0.00	0.00
17269	7275	1092	1496	2	2023-05-16	5	5.00	300.00	340.00	1615.00	190.00
17270	7276	1092	646	2	2022-02-25	7	2.00	50.00	60.00	411.60	68.60
17271	7277	604	1337	2	2023-05-13	10	4.00	700.00	800.00	7680.00	960.00
17272	7278	258	1805	5	2022-11-23	2	3.00	30.00	40.00	77.60	19.40
17273	7279	258	1302	5	2023-07-13	3	2.00	370.00	390.00	1146.60	58.80
17274	7280	1093	218	7	2023-10-25	7	4.00	170.00	190.00	1276.80	134.40
17275	7281	842	451	2	2023-10-11	2	4.00	2340.00	2540.00	4876.80	384.00
17276	7282	884	207	2	2022-03-15	5	3.00	560.00	600.00	2910.00	194.00
17277	7283	194	882	2	2023-06-18	3	2.00	0.00	0.00	0.00	0.00
17278	7284	228	314	2	2022-01-22	5	4.00	30.00	30.00	144.00	0.00
17279	7285	228	480	2	2023-07-10	2	2.00	70.00	70.00	137.20	0.00
17280	7286	152	568	2	2023-08-11	4	3.00	50.00	50.00	194.00	0.00
17281	7287	919	1692	2	2023-11-12	1	4.00	10.00	10.00	9.60	0.00
17282	7288	919	1007	2	2023-07-03	3	2.00	50.00	60.00	176.40	29.40
17283	7289	515	1390	2	2022-03-09	3	2.00	510.00	560.00	1646.40	147.00
17284	7290	37	299	5	2022-09-12	9	2.00	290.00	310.00	2734.20	176.40
17285	7291	37	133	5	2023-07-04	2	2.00	50.00	50.00	98.00	0.00
17286	7292	37	265	5	2023-12-05	9	3.00	30.00	30.00	261.90	0.00
17287	7293	611	1819	2	2022-06-24	2	4.00	590.00	650.00	1248.00	115.20
17288	7294	234	1686	2	2023-04-03	7	2.00	50.00	60.00	411.60	68.60
17289	7295	734	527	2	2022-07-27	1	4.00	20.00	20.00	19.20	0.00
17290	7296	75	1560	5	2022-06-11	2	5.00	40.00	40.00	76.00	0.00
17291	7297	75	1706	5	2023-07-21	6	5.00	10.00	10.00	57.00	0.00
17292	7298	125	1221	1	2022-11-17	5	2.00	80.00	80.00	392.00	0.00
17293	7299	1013	278	5	2022-02-08	4	5.00	230.00	290.00	1102.00	228.00
17294	7300	1013	1446	5	2023-07-13	2	3.00	10.00	10.00	19.40	0.00
17295	7301	1013	1660	5	2022-05-11	6	3.00	370.00	420.00	2444.40	291.00
17296	7302	1013	545	5	2023-08-11	3	3.00	0.00	0.00	0.00	0.00
17297	7303	1013	622	5	2022-04-19	5	4.00	340.00	380.00	1824.00	192.00
17298	7304	360	164	2	2022-01-23	2	3.00	80.00	100.00	194.00	38.80
17299	7305	360	731	2	2023-12-27	2	5.00	10.00	10.00	19.00	0.00
17300	7306	444	412	2	2022-03-21	3	5.00	720.00	890.00	2536.50	484.50
17301	7307	308	1543	1	2023-07-24	4	4.00	60.00	70.00	268.80	38.40
17302	7308	308	1460	1	2023-11-07	2	3.00	90.00	110.00	213.40	38.80
17303	7309	308	440	1	2022-07-12	3	5.00	150.00	160.00	456.00	28.50
17304	7310	25	1218	1	2022-07-03	3	5.00	10.00	10.00	28.50	0.00
17305	7311	166	570	2	2022-05-13	5	3.00	50.00	60.00	291.00	48.50
17306	7312	484	745	2	2022-12-05	2	4.00	0.00	0.00	0.00	0.00
17307	7313	484	441	2	2023-12-31	2	5.00	10.00	10.00	19.00	0.00
17308	7314	484	1664	2	2022-02-03	8	5.00	40.00	40.00	304.00	0.00
17309	7315	174	1119	2	2023-09-21	1	5.00	270.00	290.00	275.50	19.00
17310	7316	104	1065	1	2023-07-16	3	2.00	30.00	40.00	117.60	29.40
17311	7317	213	11	2	2022-03-17	1	4.00	110.00	140.00	134.40	28.80
17312	7318	1094	1796	2	2023-02-14	3	2.00	20.00	20.00	58.80	0.00
17313	7319	1094	923	2	2022-09-12	7	5.00	0.00	0.00	0.00	0.00
17314	7320	31	967	1	2022-11-01	5	2.00	830.00	980.00	4802.00	735.00
17315	7321	31	1252	1	2022-04-19	5	4.00	130.00	140.00	672.00	48.00
17316	7322	74	1102	2	2022-06-06	3	5.00	10.00	10.00	28.50	0.00
17317	7323	74	726	2	2022-11-15	2	2.00	90.00	100.00	196.00	19.60
17318	7324	104	108	5	2022-12-09	2	3.00	40.00	40.00	77.60	0.00
17319	7325	104	366	5	2023-06-05	3	4.00	10.00	10.00	28.80	0.00
17320	7326	887	1318	2	2023-10-05	5	4.00	330.00	400.00	1920.00	336.00
17321	7327	887	380	2	2023-03-21	1	5.00	30.00	30.00	28.50	0.00
17322	7328	1095	1282	2	2023-08-03	2	4.00	100.00	110.00	211.20	19.20
17323	7329	1095	207	2	2023-05-29	4	4.00	1110.00	1280.00	4915.20	652.80
17324	7330	1095	1245	2	2023-06-14	7	5.00	1540.00	1860.00	12369.00	2128.00
17325	7331	74	1184	5	2022-09-15	6	5.00	20.00	20.00	114.00	0.00
17326	7332	281	240	2	2023-05-18	1	4.00	50.00	60.00	57.60	9.60
17327	7333	281	1562	2	2023-02-01	7	3.00	70.00	80.00	543.20	67.90
17328	7334	202	452	2	2023-05-07	2	4.00	60.00	70.00	134.40	19.20
17329	7335	202	206	2	2022-06-01	3	2.00	40.00	50.00	147.00	29.40
17330	7336	104	696	2	2022-01-16	2	2.00	790.00	840.00	1646.40	98.00
17331	7337	104	179	2	2023-04-03	2	5.00	400.00	450.00	855.00	95.00
17332	7338	156	1019	5	2022-07-17	1	3.00	20.00	20.00	19.40	0.00
17333	7339	49	1460	1	2023-10-24	3	5.00	170.00	190.00	541.50	57.00
17334	7340	253	650	5	2023-06-02	2	5.00	10.00	10.00	19.00	0.00
17335	7341	185	1273	2	2022-06-24	2	5.00	60.00	70.00	133.00	19.00
17336	7342	185	50	2	2022-11-16	13	2.00	140.00	160.00	2038.40	254.80
17337	7343	185	1686	2	2023-12-27	3	4.00	20.00	30.00	86.40	28.80
17338	7344	31	912	2	2022-05-13	6	4.00	180.00	190.00	1094.40	57.60
17339	7345	251	189	2	2022-05-02	6	5.00	580.00	720.00	4104.00	798.00
17340	7346	251	462	2	2023-07-12	4	5.00	60.00	70.00	266.00	38.00
17341	7347	251	208	2	2022-11-13	1	5.00	10.00	10.00	9.50	0.00
17342	7348	251	406	2	2022-06-26	1	5.00	50.00	60.00	57.00	9.50
17343	7349	141	1219	2	2022-04-28	3	4.00	150.00	180.00	518.40	86.40
17344	7350	269	626	2	2022-08-02	6	3.00	40.00	40.00	232.80	0.00
17345	7351	269	237	2	2022-08-30	5	5.00	20.00	20.00	95.00	0.00
17346	7352	1096	405	2	2022-04-06	7	5.00	90.00	110.00	731.50	133.00
17347	7353	826	919	1	2022-09-05	8	5.00	410.00	450.00	3420.00	304.00
17348	7354	344	618	2	2023-12-29	5	3.00	20.00	20.00	97.00	0.00
17349	7355	427	1775	2	2022-10-05	5	3.00	30.00	30.00	145.50	0.00
17350	7356	242	940	1	2023-05-04	8	4.00	100.00	120.00	921.60	153.60
17351	7357	173	1040	2	2022-01-23	1	2.00	0.00	0.00	0.00	0.00
17352	7358	173	1061	2	2022-04-15	2	4.00	140.00	170.00	326.40	57.60
17353	7359	125	600	1	2022-12-06	6	3.00	210.00	250.00	1455.00	232.80
17354	7360	125	310	1	2023-09-19	3	3.00	460.00	520.00	1513.20	174.60
17355	7361	234	1146	5	2022-10-19	3	5.00	20.00	20.00	57.00	0.00
17356	7362	234	406	5	2023-04-07	3	2.00	160.00	190.00	558.60	88.20
17357	7363	234	786	5	2023-11-07	3	3.00	40.00	40.00	116.40	0.00
17358	7364	59	868	2	2022-04-14	3	2.00	280.00	340.00	999.60	176.40
17359	7365	59	1240	2	2023-01-09	8	5.00	10.00	10.00	76.00	0.00
17360	7366	59	1427	2	2022-11-09	2	2.00	10.00	10.00	19.60	0.00
17361	7367	59	1513	2	2023-07-13	2	4.00	30.00	30.00	57.60	0.00
17362	7368	59	475	2	2022-08-16	7	3.00	310.00	350.00	2376.50	271.60
17363	7369	563	69	5	2022-09-11	3	4.00	20.00	20.00	57.60	0.00
17364	7370	716	783	1	2022-10-07	2	5.00	0.00	0.00	0.00	0.00
17365	7371	1097	958	2	2022-11-27	2	3.00	240.00	260.00	504.40	38.80
17366	7372	206	5	1	2023-11-21	11	4.00	130.00	150.00	1584.00	211.20
17367	7373	206	1513	1	2023-02-09	3	4.00	50.00	60.00	172.80	28.80
17368	7374	206	1800	1	2023-05-23	7	5.00	90.00	110.00	731.50	133.00
17369	7375	206	551	1	2022-04-14	1	3.00	10.00	10.00	9.70	0.00
17370	7376	326	492	2	2022-02-21	3	4.00	30.00	40.00	115.20	28.80
17371	7377	1098	208	5	2023-01-18	4	2.00	50.00	50.00	196.00	0.00
17372	7378	411	422	2	2023-02-22	6	3.00	70.00	90.00	523.80	116.40
17373	7379	597	1047	7	2023-01-04	3	3.00	10.00	10.00	29.10	0.00
17374	7380	266	1034	2	2022-03-16	3	5.00	30.00	40.00	114.00	28.50
17375	7381	266	1364	2	2022-05-04	5	5.00	10.00	10.00	47.50	0.00
17376	7382	266	1508	2	2022-03-05	5	3.00	130.00	150.00	727.50	97.00
17377	7383	266	1567	2	2022-02-08	2	2.00	20.00	20.00	39.20	0.00
17378	7384	266	708	2	2023-03-22	3	4.00	20.00	20.00	57.60	0.00
17379	7385	266	1142	2	2023-10-17	2	4.00	340.00	380.00	729.60	76.80
17380	7386	266	1018	2	2022-01-28	3	3.00	20.00	20.00	58.20	0.00
17381	7387	266	822	2	2022-03-29	6	2.00	300.00	370.00	2175.60	411.60
17382	7388	266	36	2	2022-11-26	14	3.00	1190.00	1340.00	18197.20	2037.00
17383	7389	266	1137	2	2023-08-09	3	3.00	30.00	30.00	87.30	0.00
17384	7390	684	2	2	2023-03-30	2	2.00	350.00	390.00	764.40	78.40
17385	7391	684	217	2	2022-06-20	5	2.00	90.00	100.00	490.00	49.00
17386	7392	478	1175	1	2022-03-30	3	4.00	60.00	70.00	201.60	28.80
17387	7393	14	1408	2	2022-06-07	5	4.00	20.00	20.00	96.00	0.00
17388	7394	14	1501	2	2023-08-29	3	3.00	60.00	60.00	174.60	0.00
17389	7395	14	321	2	2022-05-30	5	5.00	30.00	30.00	142.50	0.00
17390	7396	25	972	2	2022-07-22	2	4.00	280.00	310.00	595.20	57.60
17391	7397	25	624	2	2023-08-18	3	3.00	740.00	870.00	2531.70	378.30
17392	7398	581	191	7	2022-04-25	6	4.00	720.00	800.00	4608.00	460.80
17393	7399	101	1051	1	2023-12-18	9	2.00	30.00	40.00	352.80	88.20
17394	7400	101	541	1	2023-12-14	4	4.00	20.00	20.00	76.80	0.00
17395	7401	6	485	2	2022-04-09	1	3.00	40.00	40.00	38.80	0.00
17396	7402	6	250	2	2022-10-28	7	3.00	30.00	30.00	203.70	0.00
17397	7403	383	355	2	2022-02-12	4	3.00	60.00	70.00	271.60	38.80
17398	7404	1099	575	2	2022-10-27	5	3.00	430.00	510.00	2473.50	388.00
17399	7405	1099	515	2	2023-03-09	3	2.00	100.00	120.00	352.80	58.80
17400	7406	1099	1226	2	2022-05-04	2	5.00	90.00	100.00	190.00	19.00
17401	7407	1099	1497	2	2023-07-20	3	2.00	680.00	720.00	2116.80	117.60
17402	7408	194	746	5	2023-12-14	5	4.00	10.00	10.00	48.00	0.00
17403	7409	376	1479	2	2023-05-05	8	3.00	140.00	170.00	1319.20	232.80
17404	7410	296	1667	2	2023-08-27	1	3.00	150.00	170.00	164.90	19.40
17405	7411	383	960	5	2023-07-04	2	2.00	90.00	100.00	196.00	19.60
17406	7412	1100	1603	2	2022-03-03	1	5.00	140.00	160.00	152.00	19.00
17407	7413	1100	177	2	2023-02-18	2	2.00	30.00	40.00	78.40	19.60
17408	7414	1100	1794	2	2023-07-29	1	5.00	10.00	10.00	9.50	0.00
17409	7415	325	158	1	2022-12-14	2	3.00	320.00	390.00	756.60	135.80
17410	7416	325	1524	1	2022-04-05	5	5.00	330.00	380.00	1805.00	237.50
17411	7417	325	717	1	2022-08-22	3	4.00	450.00	540.00	1555.20	259.20
17412	7418	325	1541	1	2022-03-02	5	2.00	40.00	40.00	196.00	0.00
17413	7419	325	1592	1	2022-03-11	1	5.00	50.00	50.00	47.50	0.00
17414	7420	325	943	1	2023-05-03	5	5.00	520.00	550.00	2612.50	142.50
17415	7421	325	1088	1	2023-07-05	5	3.00	20.00	20.00	97.00	0.00
17416	7422	325	1820	1	2022-06-26	2	2.00	110.00	130.00	254.80	39.20
17417	7423	325	207	1	2023-12-01	3	4.00	420.00	450.00	1296.00	86.40
17418	7424	130	1307	2	2023-04-29	4	3.00	190.00	200.00	776.00	38.80
17419	7425	130	678	2	2023-08-13	3	4.00	40.00	40.00	115.20	0.00
17420	7426	35	65	1	2023-12-10	2	3.00	70.00	90.00	174.60	38.80
17421	7427	35	1536	1	2023-08-26	2	3.00	30.00	30.00	58.20	0.00
17422	7428	962	537	2	2023-11-15	3	4.00	10.00	10.00	28.80	0.00
17423	7429	962	339	2	2023-05-08	2	4.00	30.00	30.00	57.60	0.00
17424	7430	962	220	2	2023-05-02	2	4.00	10.00	10.00	19.20	0.00
17425	7431	962	1733	2	2022-10-17	4	5.00	20.00	20.00	76.00	0.00
17426	7432	962	931	2	2022-12-07	3	4.00	20.00	30.00	86.40	28.80
17427	7433	55	803	2	2022-10-06	3	3.00	0.00	0.00	0.00	0.00
17428	7434	55	800	2	2022-05-19	5	2.00	10.00	10.00	49.00	0.00
17429	7435	1101	537	2	2023-08-23	3	4.00	10.00	10.00	28.80	0.00
17430	7436	1101	309	2	2022-05-28	6	4.00	20.00	20.00	115.20	0.00
17431	7437	1101	1168	2	2022-04-18	5	2.00	90.00	100.00	490.00	49.00
17432	7438	153	881	2	2023-08-13	5	5.00	20.00	20.00	95.00	0.00
17433	7439	1102	1442	1	2022-06-20	5	2.00	50.00	50.00	245.00	0.00
17434	7440	14	606	2	2023-06-03	5	3.00	20.00	20.00	97.00	0.00
17435	7441	14	1117	2	2023-01-17	2	5.00	190.00	240.00	456.00	95.00
17436	7442	248	166	5	2023-02-28	3	2.00	20.00	20.00	58.80	0.00
17437	7443	1103	129	5	2023-10-10	2	3.00	10.00	10.00	19.40	0.00
17438	7444	1103	596	5	2023-08-15	3	3.00	220.00	240.00	698.40	58.20
17439	7445	28	779	1	2023-12-25	1	5.00	10.00	10.00	9.50	0.00
17440	7446	28	1523	1	2022-05-04	2	4.00	60.00	70.00	134.40	19.20
17441	7447	28	1282	1	2023-02-12	1	2.00	20.00	20.00	19.60	0.00
17442	7448	28	977	1	2023-04-24	5	5.00	350.00	420.00	1995.00	332.50
17443	7449	549	643	5	2022-01-22	5	5.00	70.00	90.00	427.50	95.00
17444	7450	522	106	1	2022-01-29	3	3.00	10.00	10.00	29.10	0.00
17445	7451	522	1210	1	2022-07-14	5	4.00	260.00	320.00	1536.00	288.00
17446	7452	522	327	1	2023-08-19	5	3.00	10.00	10.00	48.50	0.00
17447	7453	522	1539	1	2022-12-15	6	5.00	1350.00	1420.00	8094.00	399.00
17448	7454	695	919	2	2023-03-02	2	4.00	140.00	150.00	288.00	19.20
17449	7455	118	1388	2	2023-05-20	4	3.00	10.00	10.00	38.80	0.00
17450	7456	118	487	2	2022-12-06	2	2.00	850.00	1040.00	2038.40	372.40
17451	7457	233	12	5	2022-10-26	2	4.00	520.00	570.00	1094.40	96.00
17452	7458	233	625	5	2023-07-18	1	5.00	10.00	10.00	9.50	0.00
17453	7459	233	1305	5	2022-06-28	7	3.00	1020.00	1200.00	8148.00	1222.20
17454	7460	233	673	5	2022-06-15	9	3.00	470.00	520.00	4539.60	436.50
17455	7461	27	1688	1	2022-10-20	4	4.00	530.00	640.00	2457.60	422.40
17456	7462	27	814	1	2022-05-10	2	3.00	40.00	50.00	97.00	19.40
17457	7463	203	334	1	2023-04-10	9	5.00	460.00	540.00	4617.00	684.00
17458	7464	1104	1454	2	2022-05-10	2	5.00	10.00	10.00	19.00	0.00
17459	7465	1104	1533	2	2022-01-18	8	5.00	20.00	30.00	228.00	76.00
17460	7466	1104	534	2	2023-05-22	2	4.00	240.00	260.00	499.20	38.40
17461	7467	177	1645	2	2023-04-09	8	2.00	80.00	90.00	705.60	78.40
17462	7468	179	699	1	2022-07-16	4	3.00	30.00	30.00	116.40	0.00
17463	7469	383	812	2	2023-03-09	3	5.00	10.00	10.00	28.50	0.00
17464	7470	383	1028	2	2023-09-05	2	4.00	10.00	10.00	19.20	0.00
17465	7471	125	99	2	2022-01-13	4	4.00	0.00	0.00	0.00	0.00
17466	7472	125	197	2	2022-02-08	2	2.00	140.00	150.00	294.00	19.60
17467	7473	1105	1328	5	2023-03-05	5	2.00	1410.00	1500.00	7350.00	441.00
17468	7474	199	754	2	2022-06-19	4	3.00	10.00	10.00	38.80	0.00
17469	7475	694	121	2	2022-08-02	9	3.00	2290.00	2570.00	22436.10	2444.40
17470	7476	694	570	2	2022-10-05	2	5.00	570.00	610.00	1159.00	76.00
17471	7477	694	449	2	2022-05-18	2	3.00	10.00	10.00	19.40	0.00
17472	7478	694	35	2	2022-05-31	2	4.00	330.00	390.00	748.80	115.20
17473	7479	694	868	2	2023-08-09	4	5.00	630.00	760.00	2888.00	494.00
17474	7480	694	1507	2	2023-01-27	4	4.00	30.00	30.00	115.20	0.00
17475	7481	694	784	2	2022-05-10	1	4.00	10.00	10.00	9.60	0.00
17476	7482	1106	119	1	2022-12-31	1	3.00	10.00	10.00	9.70	0.00
17477	7483	304	69	2	2022-09-08	4	5.00	20.00	20.00	76.00	0.00
17478	7484	59	1210	1	2023-07-15	7	4.00	360.00	450.00	3024.00	604.80
17479	7485	1107	1821	2	2022-09-19	1	4.00	0.00	0.00	0.00	0.00
17480	7486	1107	1500	2	2022-05-02	5	5.00	20.00	30.00	142.50	47.50
17481	7487	1108	1332	1	2022-04-28	5	2.00	20.00	30.00	147.00	49.00
17482	7488	1108	1288	1	2022-03-05	9	3.00	2120.00	2250.00	19642.50	1134.90
17483	7489	1108	216	1	2022-03-27	4	5.00	1000.00	1050.00	3990.00	190.00
17484	7490	287	861	2	2023-07-25	2	2.00	10.00	10.00	19.60	0.00
17485	7491	376	91	2	2022-06-04	6	2.00	90.00	110.00	646.80	117.60
17486	7492	984	1731	7	2023-11-16	6	4.00	110.00	120.00	691.20	57.60
17487	7493	35	1434	2	2022-09-26	3	4.00	10.00	10.00	28.80	0.00
17488	7494	35	1214	2	2023-10-21	5	5.00	460.00	510.00	2422.50	237.50
17489	7495	35	1035	2	2023-04-27	2	3.00	0.00	0.00	0.00	0.00
17490	7496	409	758	2	2022-07-13	2	2.00	0.00	0.00	0.00	0.00
17491	7497	409	738	2	2023-07-12	3	5.00	230.00	280.00	798.00	142.50
17492	7498	409	311	2	2022-03-29	4	5.00	0.00	0.00	0.00	0.00
17493	7499	409	31	2	2022-12-03	4	4.00	60.00	70.00	268.80	38.40
17494	7500	409	192	2	2023-09-04	3	4.00	20.00	20.00	57.60	0.00
17495	7501	409	438	2	2022-09-16	3	3.00	120.00	140.00	407.40	58.20
17496	7502	409	35	2	2023-07-22	3	3.00	410.00	470.00	1367.70	174.60
17497	7503	234	1280	7	2022-11-23	2	3.00	10.00	10.00	19.40	0.00
17498	7504	234	54	7	2022-10-01	1	4.00	140.00	160.00	153.60	19.20
17499	7505	1109	1041	1	2022-03-22	2	2.00	20.00	20.00	39.20	0.00
17500	7506	670	339	2	2022-08-15	4	4.00	10.00	10.00	38.40	0.00
17501	7507	37	1130	2	2023-09-15	2	4.00	40.00	50.00	96.00	19.20
17502	7508	37	246	2	2023-12-28	2	4.00	300.00	360.00	691.20	115.20
17503	7509	51	821	2	2022-11-15	2	2.00	10.00	10.00	19.60	0.00
17504	7510	51	755	2	2022-05-30	9	3.00	1720.00	1890.00	16499.70	1484.10
17505	7511	51	171	2	2023-11-07	5	4.00	50.00	60.00	288.00	48.00
17506	7512	51	1072	2	2022-05-11	5	4.00	350.00	400.00	1920.00	240.00
17507	7513	51	1355	2	2022-03-06	7	2.00	190.00	240.00	1646.40	343.00
17508	7514	51	347	2	2022-11-26	5	2.00	10.00	10.00	49.00	0.00
17509	7515	207	909	1	2023-08-29	2	5.00	30.00	30.00	57.00	0.00
17510	7516	207	1429	1	2023-04-11	5	4.00	180.00	210.00	1008.00	144.00
17511	7517	207	123	1	2022-11-21	4	4.00	20.00	20.00	76.80	0.00
17512	7518	207	826	1	2022-12-21	5	4.00	120.00	150.00	720.00	144.00
17513	7519	207	465	1	2022-02-22	1	2.00	20.00	20.00	19.60	0.00
17514	7520	207	1569	1	2023-12-18	2	5.00	10.00	10.00	19.00	0.00
17515	7521	207	891	1	2022-02-04	2	2.00	1160.00	1400.00	2744.00	470.40
17516	7522	630	529	2	2023-02-08	2	3.00	10.00	10.00	19.40	0.00
17517	7523	630	1182	2	2023-06-27	6	2.00	10.00	10.00	58.80	0.00
17518	7524	630	213	2	2023-09-12	2	3.00	70.00	90.00	174.60	38.80
17519	7525	682	777	2	2022-11-10	7	5.00	20.00	20.00	133.00	0.00
17520	7526	682	874	2	2022-02-10	5	4.00	1420.00	1490.00	7152.00	336.00
17521	7527	142	1607	7	2023-02-25	6	2.00	60.00	70.00	411.60	58.80
17522	7528	142	1393	7	2023-01-17	3	4.00	10.00	10.00	28.80	0.00
17523	7529	142	1358	7	2022-04-27	6	5.00	30.00	40.00	228.00	57.00
17524	7530	142	21	7	2022-02-01	3	3.00	20.00	20.00	58.20	0.00
17525	7531	142	761	7	2022-08-08	3	3.00	790.00	930.00	2706.30	407.40
17526	7532	1110	1320	5	2022-08-28	3	5.00	240.00	270.00	769.50	85.50
17527	7533	1110	532	5	2022-12-05	4	2.00	460.00	480.00	1881.60	78.40
17528	7534	976	813	2	2023-11-25	2	2.00	170.00	200.00	392.00	58.80
17529	7535	976	267	2	2023-06-12	5	5.00	210.00	230.00	1092.50	95.00
17530	7536	351	559	2	2023-12-13	3	2.00	30.00	30.00	88.20	0.00
17531	7537	188	1794	2	2022-06-06	2	3.00	10.00	10.00	19.40	0.00
17532	7538	10	130	1	2022-04-12	2	4.00	60.00	70.00	134.40	19.20
17533	7539	358	385	2	2023-03-21	1	4.00	100.00	110.00	105.60	9.60
17534	7540	358	786	2	2023-08-06	8	5.00	30.00	40.00	304.00	76.00
17535	7541	358	1660	2	2023-12-14	8	2.00	210.00	240.00	1881.60	235.20
17536	7542	358	1671	2	2022-06-11	2	2.00	40.00	50.00	98.00	19.60
17537	7543	358	1061	2	2022-07-05	6	2.00	470.00	510.00	2998.80	235.20
17538	7544	358	1379	2	2023-07-10	6	2.00	60.00	60.00	352.80	0.00
17539	7545	358	630	2	2023-05-12	5	5.00	780.00	910.00	4322.50	617.50
17540	7546	586	1522	2	2023-12-28	6	2.00	600.00	720.00	4233.60	705.60
17541	7547	586	525	2	2022-06-03	7	2.00	650.00	760.00	5213.60	754.60
17542	7548	586	1225	2	2023-11-25	5	3.00	10.00	10.00	48.50	0.00
17543	7549	586	308	2	2022-12-12	1	3.00	0.00	0.00	0.00	0.00
17544	7550	106	1382	5	2022-04-23	3	2.00	20.00	20.00	58.80	0.00
17545	7551	25	1759	2	2022-02-08	3	2.00	20.00	30.00	88.20	29.40
17546	7552	25	873	2	2023-04-19	6	2.00	730.00	830.00	4880.40	588.00
17547	7553	25	807	2	2023-09-25	3	2.00	10.00	10.00	29.40	0.00
17548	7554	25	1397	2	2022-10-17	4	5.00	30.00	30.00	114.00	0.00
17549	7555	71	900	1	2022-03-11	7	3.00	290.00	350.00	2376.50	407.40
17550	7556	71	797	1	2022-03-27	5	4.00	20.00	20.00	96.00	0.00
17551	7557	305	955	2	2023-06-17	6	2.00	150.00	160.00	940.80	58.80
17552	7558	305	897	2	2023-05-02	3	3.00	470.00	500.00	1455.00	87.30
17553	7559	365	160	2	2022-08-06	3	4.00	470.00	530.00	1526.40	172.80
17554	7560	365	965	2	2022-08-28	3	5.00	150.00	170.00	484.50	57.00
17555	7561	365	1227	2	2023-07-19	6	5.00	20.00	30.00	171.00	57.00
17556	7562	552	2	5	2022-11-30	1	4.00	160.00	170.00	163.20	9.60
17557	7563	101	1639	2	2023-11-14	4	4.00	190.00	200.00	768.00	38.40
17558	7564	330	686	5	2022-07-22	2	4.00	60.00	60.00	115.20	0.00
17559	7565	6	1350	1	2022-12-14	4	5.00	410.00	440.00	1672.00	114.00
17560	7566	6	1196	1	2023-08-01	1	3.00	50.00	50.00	48.50	0.00
17561	7567	165	85	5	2023-04-30	3	5.00	50.00	50.00	142.50	0.00
17562	7568	165	1484	5	2022-12-20	4	2.00	20.00	20.00	78.40	0.00
17563	7569	70	426	2	2023-04-26	9	3.00	20.00	30.00	261.90	87.30
17564	7570	70	1636	2	2022-07-10	4	4.00	50.00	50.00	192.00	0.00
17565	7571	70	660	2	2022-07-25	3	3.00	20.00	20.00	58.20	0.00
17566	7572	1111	42	2	2022-11-03	5	2.00	170.00	190.00	931.00	98.00
17567	7573	1111	1117	2	2022-10-02	4	4.00	540.00	590.00	2265.60	192.00
17568	7574	1111	889	2	2022-03-16	1	3.00	0.00	0.00	0.00	0.00
17569	7575	2	17	2	2023-07-05	2	5.00	210.00	220.00	418.00	19.00
17570	7576	2	1014	2	2023-06-12	4	5.00	220.00	240.00	912.00	76.00
17571	7577	411	918	1	2023-11-20	2	2.00	30.00	40.00	78.40	19.60
17572	7578	411	985	1	2023-03-28	1	2.00	50.00	50.00	49.00	0.00
17573	7579	413	500	5	2023-05-16	3	5.00	480.00	560.00	1596.00	228.00
17574	7580	109	1740	1	2022-11-27	8	5.00	2100.00	2630.00	19988.00	4028.00
17575	7581	109	880	1	2022-08-20	3	3.00	20.00	20.00	58.20	0.00
17576	7582	130	719	5	2022-09-03	3	2.00	380.00	420.00	1234.80	117.60
17577	7583	25	57	2	2023-01-16	2	3.00	100.00	130.00	252.20	58.20
17578	7584	280	1578	2	2022-03-09	7	3.00	3150.00	3500.00	23765.00	2376.50
17579	7585	280	1569	2	2023-06-01	5	4.00	10.00	10.00	48.00	0.00
17580	7586	280	1128	2	2022-02-26	3	2.00	100.00	120.00	352.80	58.80
17581	7587	280	373	2	2022-08-13	4	2.00	10.00	10.00	39.20	0.00
17582	7588	280	801	2	2023-06-25	3	3.00	110.00	120.00	349.20	29.10
17583	7589	58	1138	2	2023-08-22	3	5.00	20.00	20.00	57.00	0.00
17584	7590	774	1244	2	2022-04-05	7	5.00	120.00	130.00	864.50	66.50
17585	7591	71	75	2	2022-09-29	9	4.00	60.00	60.00	518.40	0.00
17586	7592	71	65	2	2022-04-30	2	4.00	60.00	70.00	134.40	19.20
17587	7593	71	966	2	2022-07-14	3	4.00	10.00	10.00	28.80	0.00
17588	7594	71	775	2	2023-04-21	3	2.00	730.00	890.00	2616.60	470.40
17589	7595	641	543	2	2022-11-10	7	3.00	120.00	150.00	1018.50	203.70
17590	7596	641	625	2	2023-03-30	4	4.00	40.00	40.00	153.60	0.00
17591	7597	351	540	2	2022-08-08	3	2.00	200.00	230.00	676.20	88.20
17592	7598	672	1356	2	2022-11-01	2	5.00	10.00	10.00	19.00	0.00
17593	7599	672	948	2	2023-11-28	3	5.00	30.00	40.00	114.00	28.50
17594	7600	672	1604	2	2022-01-04	5	2.00	30.00	40.00	196.00	49.00
17595	7601	672	1822	2	2022-05-28	5	5.00	30.00	30.00	142.50	0.00
17596	7602	672	335	2	2022-03-30	6	2.00	140.00	150.00	882.00	58.80
17597	7603	672	61	2	2022-02-07	10	2.00	50.00	60.00	588.00	98.00
17598	7604	696	731	2	2023-08-24	2	5.00	10.00	10.00	19.00	0.00
17599	7605	118	1479	2	2023-02-20	3	4.00	30.00	30.00	86.40	0.00
17600	7606	118	771	2	2023-10-30	2	5.00	10.00	10.00	19.00	0.00
17601	7607	118	735	2	2023-12-07	9	4.00	1170.00	1300.00	11232.00	1123.20
17602	7608	89	547	5	2023-05-04	2	4.00	240.00	260.00	499.20	38.40
17603	7609	37	779	2	2023-12-02	4	5.00	30.00	30.00	114.00	0.00
17604	7610	37	280	2	2022-12-23	7	5.00	20.00	20.00	133.00	0.00
17605	7611	910	586	5	2022-03-30	3	2.00	20.00	20.00	58.80	0.00
17606	7612	1112	1447	5	2023-12-29	2	3.00	10.00	10.00	19.40	0.00
17607	7613	1112	196	5	2022-08-25	1	4.00	10.00	10.00	9.60	0.00
17608	7614	1112	131	5	2023-08-12	2	3.00	10.00	10.00	19.40	0.00
17609	7615	134	528	1	2023-05-25	3	4.00	10.00	10.00	28.80	0.00
17610	7616	1041	1700	2	2023-05-17	9	3.00	10.00	10.00	87.30	0.00
17611	7617	663	1287	2	2022-08-06	2	3.00	20.00	20.00	38.80	0.00
17612	7618	663	14	2	2023-10-30	5	5.00	560.00	680.00	3230.00	570.00
17613	7619	376	11	5	2023-11-05	1	2.00	150.00	190.00	186.20	39.20
17614	7620	376	1764	5	2022-08-01	5	4.00	60.00	70.00	336.00	48.00
17615	7621	27	234	2	2022-08-30	5	3.00	460.00	540.00	2619.00	388.00
17616	7622	27	630	2	2022-02-20	4	4.00	690.00	730.00	2803.20	153.60
17617	7623	27	1821	2	2022-04-22	3	5.00	10.00	10.00	28.50	0.00
17618	7624	1034	644	2	2023-12-14	1	5.00	40.00	40.00	38.00	0.00
17619	7625	928	1142	1	2022-05-23	5	2.00	730.00	850.00	4165.00	588.00
17620	7626	928	905	1	2023-12-17	9	5.00	70.00	80.00	684.00	85.50
17621	7627	762	1528	1	2023-09-04	6	5.00	260.00	330.00	1881.00	399.00
17622	7628	762	1208	1	2023-02-18	2	5.00	20.00	20.00	38.00	0.00
17623	7629	762	1009	1	2023-04-19	5	2.00	20.00	20.00	98.00	0.00
17624	7630	1113	557	5	2023-09-15	5	4.00	300.00	340.00	1632.00	192.00
17625	7631	1113	818	5	2022-02-24	7	2.00	230.00	250.00	1715.00	137.20
17626	7632	1113	793	5	2023-07-28	7	4.00	110.00	130.00	873.60	134.40
17627	7633	226	292	1	2023-10-11	8	2.00	1050.00	1210.00	9486.40	1254.40
17628	7634	226	1096	1	2023-12-06	1	2.00	10.00	10.00	9.80	0.00
17629	7635	226	1262	1	2022-03-23	1	2.00	30.00	30.00	29.40	0.00
17630	7636	226	1497	1	2023-01-24	1	2.00	240.00	300.00	294.00	58.80
17631	7637	226	867	1	2022-10-12	3	2.00	240.00	260.00	764.40	58.80
17632	7638	417	1501	2	2023-11-28	3	3.00	60.00	60.00	174.60	0.00
17633	7639	417	1452	2	2023-08-05	7	3.00	50.00	60.00	407.40	67.90
17634	7640	417	1488	2	2023-12-07	2	4.00	380.00	440.00	844.80	115.20
17635	7641	417	1714	2	2022-08-01	6	5.00	60.00	70.00	399.00	57.00
17636	7642	1114	1823	5	2023-05-10	6	2.00	620.00	700.00	4116.00	470.40
17637	7643	1114	529	5	2023-12-24	4	5.00	20.00	20.00	76.00	0.00
17638	7644	1114	1231	5	2022-09-25	4	4.00	10.00	10.00	38.40	0.00
17639	7645	1114	1618	5	2023-07-13	5	5.00	60.00	70.00	332.50	47.50
17640	7646	2	874	2	2022-10-13	3	5.00	780.00	890.00	2536.50	313.50
17641	7647	976	1783	2	2022-09-14	2	5.00	1160.00	1300.00	2470.00	266.00
17642	7648	111	799	5	2023-06-10	2	2.00	0.00	0.00	0.00	0.00
17643	7649	111	775	5	2023-10-23	4	4.00	1230.00	1350.00	5184.00	460.80
17644	7650	854	739	2	2023-10-01	9	4.00	1460.00	1550.00	13392.00	777.60
17645	7651	854	1452	2	2022-05-23	3	5.00	20.00	20.00	57.00	0.00
17646	7652	452	101	5	2022-10-23	3	2.00	100.00	120.00	352.80	58.80
17647	7653	452	236	5	2022-02-14	2	4.00	110.00	120.00	230.40	19.20
17648	7654	956	1662	2	2023-01-27	4	5.00	20.00	20.00	76.00	0.00
17649	7655	724	1703	1	2022-11-24	4	3.00	70.00	80.00	310.40	38.80
17650	7656	724	1466	1	2022-04-19	4	2.00	30.00	30.00	117.60	0.00
17651	7657	381	651	7	2023-10-06	2	4.00	100.00	110.00	211.20	19.20
17652	7658	381	268	7	2023-06-03	4	4.00	170.00	190.00	729.60	76.80
17653	7659	826	670	5	2022-01-30	4	4.00	70.00	80.00	307.20	38.40
17654	7660	11	829	2	2022-08-13	5	5.00	40.00	50.00	237.50	47.50
17655	7661	648	442	2	2022-12-29	3	3.00	70.00	80.00	232.80	29.10
17656	7662	648	986	2	2022-10-20	7	4.00	10.00	10.00	67.20	0.00
17657	7663	234	1168	5	2022-12-21	5	3.00	80.00	100.00	485.00	97.00
17658	7664	262	704	2	2022-06-15	5	5.00	20.00	20.00	95.00	0.00
17659	7665	256	1526	2	2022-03-29	4	5.00	120.00	130.00	494.00	38.00
17660	7666	509	1000	2	2022-07-20	1	2.00	30.00	30.00	29.40	0.00
17661	7667	509	307	2	2022-08-05	9	4.00	4320.00	5400.00	46656.00	9331.20
17662	7668	509	1717	2	2023-08-04	3	3.00	100.00	120.00	349.20	58.20
17663	7669	865	579	1	2022-08-17	6	4.00	30.00	40.00	230.40	57.60
17664	7670	865	682	1	2023-12-17	3	4.00	60.00	60.00	172.80	0.00
17665	7671	865	1302	1	2023-08-02	2	4.00	240.00	260.00	499.20	38.40
17666	7672	865	1529	1	2023-08-07	1	4.00	150.00	170.00	163.20	19.20
17667	7673	865	1824	1	2023-03-03	3	5.00	30.00	40.00	114.00	28.50
17668	7674	865	1020	1	2022-11-18	5	3.00	130.00	150.00	727.50	97.00
17669	7675	865	899	1	2023-08-05	4	3.00	380.00	450.00	1746.00	271.60
17670	7676	676	474	1	2022-10-27	3	5.00	140.00	150.00	427.50	28.50
17671	7677	47	1600	7	2023-10-19	3	3.00	20.00	20.00	58.20	0.00
17672	7678	509	1690	2	2023-06-02	4	2.00	160.00	200.00	784.00	156.80
17673	7679	509	1026	2	2023-03-19	3	5.00	10.00	10.00	28.50	0.00
17674	7680	509	696	2	2022-01-29	4	4.00	1400.00	1690.00	6489.60	1113.60
17675	7681	509	1058	2	2022-01-11	2	3.00	310.00	340.00	659.60	58.20
17676	7682	509	39	2	2023-06-15	6	4.00	540.00	610.00	3513.60	403.20
17677	7683	1033	1471	5	2023-11-30	1	2.00	150.00	190.00	186.20	39.20
17678	7684	1033	451	5	2023-12-31	3	3.00	3160.00	3810.00	11087.10	1891.50
17679	7685	181	1813	2	2022-05-20	9	4.00	30.00	30.00	259.20	0.00
17680	7686	181	1719	2	2022-08-01	1	5.00	530.00	630.00	598.50	95.00
17681	7687	753	617	2	2022-02-24	9	3.00	1440.00	1570.00	13706.10	1134.90
17682	7688	753	154	2	2023-04-19	1	4.00	20.00	20.00	19.20	0.00
17683	7689	753	1825	2	2023-09-04	8	3.00	130.00	160.00	1241.60	232.80
17684	7690	1115	811	5	2023-10-30	3	5.00	140.00	180.00	513.00	114.00
17685	7691	1115	310	5	2023-03-28	3	5.00	700.00	870.00	2479.50	484.50
17686	7692	1115	90	5	2022-03-28	2	4.00	10.00	10.00	19.20	0.00
17687	7693	107	430	2	2022-09-27	6	4.00	80.00	90.00	518.40	57.60
17688	7694	107	1279	2	2022-05-18	4	4.00	280.00	320.00	1228.80	153.60
17689	7695	6	1145	7	2022-04-22	7	2.00	150.00	170.00	1166.20	137.20
17690	7696	522	448	5	2022-03-19	5	4.00	150.00	160.00	768.00	48.00
17691	7697	522	1505	5	2022-09-09	4	4.00	10.00	10.00	38.40	0.00
17692	7698	991	350	2	2023-05-06	2	2.00	1030.00	1200.00	2352.00	333.20
17693	7699	991	236	2	2022-08-12	1	5.00	60.00	70.00	66.50	9.50
17694	7700	991	1258	2	2023-07-12	3	3.00	20.00	30.00	87.30	29.10
17695	7701	991	1580	2	2022-02-05	6	2.00	20.00	20.00	117.60	0.00
17696	7702	991	216	2	2023-12-30	2	3.00	480.00	530.00	1028.20	97.00
17697	7703	641	821	2	2022-06-08	2	5.00	10.00	10.00	19.00	0.00
17698	7704	641	600	2	2022-07-11	3	4.00	180.00	210.00	604.80	86.40
17699	7705	641	824	2	2022-08-20	4	3.00	420.00	450.00	1746.00	116.40
17700	7706	641	332	2	2022-12-28	3	2.00	450.00	480.00	1411.20	88.20
17701	7707	641	672	2	2023-04-10	3	3.00	10.00	10.00	29.10	0.00
17702	7708	1116	1664	2	2022-04-23	2	3.00	10.00	10.00	19.40	0.00
17703	7709	210	1618	2	2022-06-15	3	4.00	30.00	40.00	115.20	28.80
17704	7710	210	339	2	2022-09-14	3	3.00	10.00	10.00	29.10	0.00
17705	7711	193	1514	2	2022-12-28	5	5.00	80.00	90.00	427.50	47.50
17706	7712	597	1417	1	2023-11-20	3	2.00	80.00	80.00	235.20	0.00
17707	7713	597	197	1	2023-07-27	2	3.00	120.00	150.00	291.00	58.20
17708	7714	597	1786	1	2023-09-23	3	5.00	50.00	50.00	142.50	0.00
17709	7715	4	587	5	2022-11-27	6	5.00	220.00	250.00	1425.00	171.00
17710	7716	12	1618	2	2022-03-03	3	2.00	30.00	40.00	117.60	29.40
17711	7717	116	957	2	2022-03-31	5	4.00	30.00	30.00	144.00	0.00
17712	7718	116	508	2	2022-05-27	2	3.00	0.00	0.00	0.00	0.00
17713	7719	376	1228	2	2023-07-27	4	4.00	140.00	160.00	614.40	76.80
17714	7720	253	1501	2	2023-02-01	3	2.00	50.00	60.00	176.40	29.40
17715	7721	253	756	2	2022-11-07	2	4.00	20.00	20.00	38.40	0.00
17716	7722	253	1264	2	2022-12-08	2	3.00	10.00	10.00	19.40	0.00
17717	7723	427	1826	2	2023-12-18	3	2.00	30.00	40.00	117.60	29.40
17718	7724	466	1190	2	2023-08-31	1	2.00	170.00	180.00	176.40	9.80
17719	7725	228	848	2	2023-06-15	1	2.00	260.00	290.00	284.20	29.40
17720	7726	228	465	2	2022-04-04	2	5.00	20.00	20.00	38.00	0.00
17721	7727	228	943	2	2023-07-01	3	4.00	300.00	330.00	950.40	86.40
17722	7728	44	1664	1	2022-03-22	3	2.00	20.00	20.00	58.80	0.00
17723	7729	429	797	2	2023-03-22	4	2.00	20.00	20.00	78.40	0.00
17724	7730	1117	1333	2	2023-11-20	3	3.00	370.00	430.00	1251.30	174.60
17725	7731	551	1210	2	2022-03-06	4	3.00	280.00	290.00	1125.20	38.80
17726	7732	749	82	5	2022-06-07	4	4.00	90.00	110.00	422.40	76.80
17727	7733	35	579	2	2022-04-09	2	4.00	10.00	10.00	19.20	0.00
17728	7734	197	1394	1	2022-03-12	4	3.00	20.00	20.00	77.60	0.00
17729	7735	6	155	2	2023-02-07	3	2.00	10.00	10.00	29.40	0.00
17730	7736	153	681	2	2022-01-01	3	2.00	20.00	20.00	58.80	0.00
17731	7737	104	716	2	2023-11-16	4	4.00	60.00	70.00	268.80	38.40
17732	7738	47	1040	5	2022-02-22	9	3.00	10.00	10.00	87.30	0.00
17733	7739	521	832	2	2023-06-10	5	4.00	80.00	90.00	432.00	48.00
17734	7740	258	1129	2	2022-05-01	2	2.00	10.00	10.00	19.60	0.00
17735	7741	258	1524	2	2022-07-16	1	5.00	80.00	90.00	85.50	9.50
17736	7742	138	1514	1	2023-07-14	2	4.00	40.00	40.00	76.80	0.00
17737	7743	234	989	2	2022-11-17	4	5.00	20.00	30.00	114.00	38.00
17738	7744	1118	1407	2	2023-12-26	2	3.00	10.00	10.00	19.40	0.00
17739	7745	1118	868	2	2022-01-12	3	4.00	490.00	570.00	1641.60	230.40
17740	7746	1118	951	2	2023-05-08	3	2.00	10.00	10.00	29.40	0.00
17741	7747	28	789	2	2022-11-15	2	5.00	30.00	30.00	57.00	0.00
17742	7748	1119	243	1	2022-11-03	6	5.00	10.00	10.00	57.00	0.00
17743	7749	121	1493	2	2023-07-28	3	2.00	50.00	60.00	176.40	29.40
17744	7750	121	907	2	2023-05-18	2	3.00	400.00	450.00	873.00	97.00
17745	7751	121	154	2	2023-12-02	2	5.00	30.00	30.00	57.00	0.00
17746	7752	121	496	2	2023-11-25	3	3.00	430.00	470.00	1367.70	116.40
17747	7753	121	730	2	2023-01-21	2	4.00	30.00	30.00	57.60	0.00
17748	7754	384	1446	5	2022-10-14	2	5.00	20.00	20.00	38.00	0.00
17749	7755	57	869	1	2023-10-23	2	3.00	0.00	0.00	0.00	0.00
17750	7756	47	1827	2	2022-02-09	7	5.00	230.00	270.00	1795.50	266.00
17751	7757	47	620	2	2023-04-13	5	3.00	360.00	430.00	2085.50	339.50
17752	7758	1043	48	1	2023-02-22	4	2.00	30.00	40.00	156.80	39.20
17753	7759	1043	1705	1	2022-10-12	3	3.00	140.00	150.00	436.50	29.10
17754	7760	34	935	2	2022-02-02	3	3.00	20.00	20.00	58.20	0.00
17755	7761	33	955	2	2023-06-02	2	3.00	30.00	40.00	77.60	19.40
17756	7762	444	1152	5	2023-07-25	2	5.00	10.00	10.00	19.00	0.00
17757	7763	969	1062	5	2022-02-21	1	3.00	0.00	0.00	0.00	0.00
17758	7764	375	1452	2	2022-12-03	9	2.00	60.00	70.00	617.40	88.20
17759	7765	702	513	7	2022-05-12	3	3.00	20.00	20.00	58.20	0.00
17760	7766	702	407	7	2023-07-21	5	5.00	1600.00	1780.00	8455.00	855.00
17761	7767	702	400	7	2023-06-02	5	2.00	180.00	220.00	1078.00	196.00
17762	7768	113	80	5	2022-01-26	3	5.00	10.00	10.00	28.50	0.00
17763	7769	610	653	2	2022-05-09	5	2.00	30.00	30.00	147.00	0.00
17764	7770	298	1149	7	2023-03-30	2	4.00	830.00	1040.00	1996.80	403.20
17765	7771	298	10	7	2022-09-25	2	4.00	40.00	50.00	96.00	19.20
17766	7772	630	693	2	2022-03-01	2	5.00	400.00	460.00	874.00	114.00
17767	7773	630	1498	2	2022-05-31	5	2.00	3780.00	4500.00	22050.00	3528.00
17768	7774	630	1828	2	2022-08-09	3	5.00	50.00	60.00	171.00	28.50
17769	7775	10	30	5	2022-07-30	3	5.00	10.00	10.00	28.50	0.00
17770	7776	1120	1645	2	2022-08-09	1	4.00	10.00	10.00	9.60	0.00
17771	7777	1120	1712	2	2023-11-11	3	3.00	10.00	10.00	29.10	0.00
17772	7778	1120	457	2	2023-04-09	3	2.00	40.00	50.00	147.00	29.40
17773	7779	1120	1088	2	2023-11-01	3	3.00	40.00	40.00	116.40	0.00
17774	7780	680	474	2	2022-01-22	4	4.00	170.00	200.00	768.00	115.20
17775	7781	680	1180	2	2023-02-02	4	4.00	30.00	30.00	115.20	0.00
17776	7782	118	277	2	2023-11-03	3	3.00	10.00	10.00	29.10	0.00
17777	7783	98	87	1	2022-06-29	2	2.00	40.00	50.00	98.00	19.60
17778	7784	98	278	1	2023-12-10	10	5.00	740.00	880.00	8360.00	1330.00
17779	7785	98	414	1	2022-03-03	2	5.00	160.00	190.00	361.00	57.00
17780	7786	31	50	2	2022-07-08	2	2.00	30.00	30.00	58.80	0.00
17781	7787	194	1785	5	2023-12-18	1	4.00	0.00	0.00	0.00	0.00
17782	7788	194	1322	5	2023-07-18	3	3.00	10.00	10.00	29.10	0.00
17783	7789	194	1156	5	2023-10-01	3	2.00	20.00	20.00	58.80	0.00
17784	7790	194	1447	5	2022-12-18	8	3.00	30.00	30.00	232.80	0.00
17785	7791	285	637	7	2023-11-12	3	4.00	0.00	0.00	0.00	0.00
17786	7792	74	752	2	2023-07-18	5	2.00	0.00	0.00	0.00	0.00
17787	7793	211	607	5	2023-06-19	2	2.00	30.00	40.00	78.40	19.60
17788	7794	1075	330	1	2022-03-04	5	5.00	30.00	30.00	142.50	0.00
17789	7795	1075	127	1	2022-12-27	2	5.00	80.00	100.00	190.00	38.00
17790	7796	399	1486	2	2022-06-10	4	2.00	280.00	310.00	1215.20	117.60
17791	7797	565	62	2	2022-07-19	5	3.00	30.00	30.00	145.50	0.00
17792	7798	49	1359	5	2022-09-25	3	5.00	50.00	50.00	142.50	0.00
17793	7799	49	1148	5	2022-01-26	1	4.00	390.00	470.00	451.20	76.80
17794	7800	49	390	5	2022-02-02	3	3.00	180.00	210.00	611.10	87.30
17795	7801	210	274	2	2022-02-08	3	2.00	280.00	320.00	940.80	117.60
17796	7802	362	1703	1	2022-09-10	2	4.00	40.00	40.00	76.80	0.00
17797	7803	1121	1172	2	2023-11-14	4	3.00	10.00	10.00	38.80	0.00
17798	7804	1121	907	2	2023-02-27	4	4.00	590.00	720.00	2764.80	499.20
17799	7805	1121	968	2	2022-01-19	1	3.00	30.00	30.00	29.10	0.00
17800	7806	1121	1040	2	2022-05-27	2	3.00	0.00	0.00	0.00	0.00
17801	7807	1121	962	2	2023-02-24	2	2.00	0.00	0.00	0.00	0.00
17802	7808	716	909	2	2022-02-09	7	5.00	20.00	30.00	199.50	66.50
17803	7809	716	1042	2	2023-05-19	3	2.00	40.00	50.00	147.00	29.40
17804	7810	716	1788	2	2022-08-30	2	5.00	90.00	110.00	209.00	38.00
17805	7811	580	1447	5	2023-12-18	1	2.00	0.00	0.00	0.00	0.00
17806	7812	580	1597	5	2023-02-14	3	2.00	10.00	10.00	29.40	0.00
17807	7813	580	737	5	2023-05-04	3	2.00	500.00	550.00	1617.00	147.00
17808	7814	580	248	5	2023-05-04	6	3.00	10.00	10.00	58.20	0.00
17809	7815	381	27	5	2022-12-21	2	2.00	1220.00	1500.00	2940.00	548.80
17810	7816	381	851	5	2023-08-21	2	4.00	20.00	20.00	38.40	0.00
17811	7817	1122	979	1	2022-09-21	3	4.00	90.00	110.00	316.80	57.60
17812	7818	1122	1777	1	2023-02-22	6	4.00	30.00	40.00	230.40	57.60
17813	7819	1122	1626	1	2023-11-01	3	2.00	3770.00	4540.00	13347.60	2263.80
17814	7820	10	1085	2	2022-11-30	8	3.00	10.00	10.00	77.60	0.00
17815	7821	1123	596	1	2022-05-29	6	4.00	540.00	590.00	3398.40	288.00
17816	7822	410	1019	1	2023-06-08	9	2.00	100.00	110.00	970.20	88.20
17817	7823	1034	1008	2	2023-07-06	3	3.00	10.00	10.00	29.10	0.00
17818	7824	1034	1234	2	2022-10-20	3	2.00	140.00	150.00	441.00	29.40
17819	7825	2	1341	2	2023-01-18	5	3.00	190.00	230.00	1115.50	194.00
17820	7826	1124	39	2	2023-10-28	1	5.00	80.00	90.00	85.50	9.50
17821	7827	322	560	2	2023-10-08	4	2.00	410.00	510.00	1999.20	392.00
17822	7828	322	319	2	2023-03-10	3	3.00	10.00	10.00	29.10	0.00
17823	7829	248	1392	2	2023-11-29	3	2.00	50.00	60.00	176.40	29.40
17824	7830	248	398	2	2022-04-24	3	5.00	50.00	60.00	171.00	28.50
17825	7831	248	1766	2	2022-02-17	3	5.00	280.00	310.00	883.50	85.50
17826	7832	248	302	2	2023-05-09	3	2.00	40.00	50.00	147.00	29.40
17827	7833	75	180	2	2023-02-09	2	2.00	20.00	20.00	39.20	0.00
17828	7834	1125	347	2	2023-01-06	5	5.00	10.00	10.00	47.50	0.00
17829	7835	70	1001	1	2022-11-17	2	3.00	210.00	240.00	465.60	58.20
17830	7836	70	717	1	2022-05-10	2	5.00	420.00	480.00	912.00	114.00
17831	7837	237	993	2	2023-08-09	4	2.00	270.00	310.00	1215.20	156.80
17832	7838	237	1622	2	2022-09-29	2	4.00	10.00	10.00	19.20	0.00
17833	7839	237	429	2	2023-03-14	2	3.00	140.00	160.00	310.40	38.80
17834	7840	332	30	2	2023-02-13	3	4.00	10.00	10.00	28.80	0.00
17835	7841	332	1235	2	2023-07-04	4	5.00	1050.00	1180.00	4484.00	494.00
17836	7842	104	10	2	2022-07-08	2	3.00	50.00	50.00	97.00	0.00
17837	7843	121	613	1	2023-02-23	3	3.00	50.00	60.00	174.60	29.10
17838	7844	121	56	1	2022-06-11	11	5.00	60.00	70.00	731.50	104.50
17839	7845	1126	973	2	2022-03-07	4	4.00	110.00	120.00	460.80	38.40
17840	7846	121	1031	2	2023-06-01	5	4.00	120.00	150.00	720.00	144.00
17841	7847	121	496	2	2023-10-23	12	5.00	1590.00	1870.00	21318.00	3192.00
17842	7848	35	1654	2	2022-01-06	2	5.00	20.00	20.00	38.00	0.00
17843	7849	1018	1556	2	2022-04-27	3	4.00	20.00	20.00	57.60	0.00
17844	7850	1018	1506	2	2022-02-23	3	5.00	10.00	10.00	28.50	0.00
17845	7851	1018	841	2	2022-04-04	2	5.00	10.00	10.00	19.00	0.00
17846	7852	199	1715	2	2023-06-01	2	4.00	10.00	10.00	19.20	0.00
17847	7853	199	544	2	2022-03-27	2	4.00	20.00	20.00	38.40	0.00
17848	7854	381	1051	2	2023-10-30	2	2.00	10.00	10.00	19.60	0.00
17849	7855	998	1318	2	2022-03-02	4	4.00	270.00	320.00	1228.80	192.00
17850	7856	998	198	2	2023-03-12	4	5.00	40.00	50.00	190.00	38.00
17851	7857	25	1400	5	2023-09-25	2	5.00	30.00	30.00	57.00	0.00
17852	7858	25	919	5	2022-04-27	5	2.00	390.00	460.00	2254.00	343.00
17853	7859	25	1153	5	2023-06-21	3	4.00	190.00	240.00	691.20	144.00
17854	7860	25	992	5	2023-04-24	4	4.00	30.00	40.00	153.60	38.40
17855	7861	1127	1088	2	2023-08-30	4	5.00	20.00	20.00	76.00	0.00
17856	7862	6	1045	2	2023-06-25	2	2.00	20.00	20.00	39.20	0.00
17857	7863	6	357	2	2023-12-31	2	2.00	70.00	80.00	156.80	19.60
17858	7864	193	419	1	2023-09-27	3	5.00	240.00	270.00	769.50	85.50
17859	7865	193	1829	1	2022-11-11	4	2.00	20.00	20.00	78.40	0.00
17860	7866	193	158	1	2022-05-17	2	5.00	370.00	440.00	836.00	133.00
17861	7867	193	1545	1	2022-02-02	6	3.00	110.00	130.00	756.60	116.40
17862	7868	547	448	1	2022-11-21	3	5.00	140.00	170.00	484.50	85.50
17863	7869	70	1071	2	2023-01-31	2	5.00	10.00	10.00	19.00	0.00
17864	7870	312	47	2	2023-04-05	2	3.00	20.00	20.00	38.80	0.00
17865	7871	514	662	2	2023-07-22	4	5.00	20.00	20.00	76.00	0.00
17866	7872	1128	642	2	2023-04-10	2	3.00	10.00	10.00	19.40	0.00
17867	7873	1128	121	2	2023-11-28	4	2.00	780.00	920.00	3606.40	548.80
17868	7874	1128	1533	2	2022-08-12	2	5.00	10.00	10.00	19.00	0.00
17869	7875	1128	1185	2	2023-08-02	2	3.00	80.00	100.00	194.00	38.80
17870	7876	1129	330	2	2022-08-17	6	3.00	30.00	30.00	174.60	0.00
17871	7877	1129	1804	2	2022-07-09	1	3.00	10.00	10.00	9.70	0.00
17872	7878	47	1043	2	2022-05-12	2	2.00	10.00	10.00	19.60	0.00
17873	7879	224	1815	1	2022-12-26	4	4.00	190.00	240.00	921.60	192.00
17874	7880	59	1661	2	2022-06-26	2	4.00	300.00	340.00	652.80	76.80
17875	7881	775	450	1	2023-01-22	6	5.00	10.00	10.00	57.00	0.00
17876	7882	775	1098	1	2023-10-20	6	2.00	70.00	80.00	470.40	58.80
17877	7883	775	1098	1	2023-03-22	8	5.00	90.00	100.00	760.00	76.00
17878	7884	775	1409	1	2022-11-19	2	2.00	10.00	10.00	19.60	0.00
17879	7885	775	1567	1	2022-04-03	7	2.00	50.00	50.00	343.00	0.00
17880	7886	775	222	1	2023-08-20	3	3.00	20.00	20.00	58.20	0.00
17881	7887	775	1007	1	2022-04-25	5	5.00	20.00	20.00	95.00	0.00
17882	7888	775	1654	1	2023-04-14	1	3.00	20.00	20.00	19.40	0.00
17883	7889	1130	713	2	2022-01-07	5	5.00	30.00	30.00	142.50	0.00
17884	7890	182	454	2	2023-10-29	9	2.00	20.00	20.00	176.40	0.00
17885	7891	182	652	2	2022-01-23	2	5.00	350.00	400.00	760.00	95.00
17886	7892	182	569	2	2022-07-17	5	5.00	300.00	340.00	1615.00	190.00
17887	7893	182	1734	2	2023-01-12	3	3.00	90.00	110.00	320.10	58.20
17888	7894	304	327	2	2022-07-13	3	5.00	10.00	10.00	28.50	0.00
17889	7895	1131	92	2	2023-10-14	5	4.00	70.00	80.00	384.00	48.00
17890	7896	1131	745	2	2022-08-13	2	3.00	10.00	10.00	19.40	0.00
17891	7897	1131	315	2	2022-07-27	8	5.00	380.00	450.00	3420.00	532.00
17892	7898	33	536	2	2022-05-22	7	3.00	230.00	270.00	1833.30	271.60
17893	7899	33	1177	2	2023-03-18	6	5.00	1370.00	1610.00	9177.00	1368.00
17894	7900	33	830	2	2022-10-02	5	2.00	20.00	20.00	98.00	0.00
17895	7901	33	1426	2	2022-09-15	2	4.00	0.00	0.00	0.00	0.00
17896	7902	33	893	2	2022-12-04	1	5.00	30.00	30.00	28.50	0.00
17897	7903	33	437	2	2023-11-09	5	3.00	10.00	10.00	48.50	0.00
17898	7904	33	1803	2	2022-12-09	2	4.00	350.00	420.00	806.40	134.40
17899	7905	75	1053	2	2023-07-02	2	5.00	70.00	80.00	152.00	19.00
17900	7906	691	408	2	2023-08-10	1	5.00	0.00	0.00	0.00	0.00
17901	7907	691	923	2	2023-03-16	10	2.00	0.00	0.00	0.00	0.00
17902	7908	60	848	5	2022-02-28	2	2.00	680.00	720.00	1411.20	78.40
17903	7909	1132	824	2	2022-04-12	3	3.00	220.00	270.00	785.70	145.50
17904	7910	1132	449	2	2023-12-11	8	4.00	20.00	20.00	153.60	0.00
17905	7911	1132	721	2	2022-04-14	3	4.00	50.00	50.00	144.00	0.00
17906	7912	1132	431	2	2023-12-12	2	5.00	180.00	210.00	399.00	57.00
17907	7913	1133	768	1	2023-03-16	2	5.00	30.00	30.00	57.00	0.00
17908	7914	228	1230	5	2022-11-15	2	4.00	30.00	30.00	57.60	0.00
17909	7915	126	1830	2	2022-09-30	5	2.00	3130.00	3400.00	16660.00	1323.00
17910	7916	126	1736	2	2023-01-01	3	4.00	90.00	100.00	288.00	28.80
17911	7917	243	813	2	2022-05-30	4	2.00	280.00	340.00	1332.80	235.20
17912	7918	940	109	1	2022-07-22	1	4.00	30.00	30.00	28.80	0.00
17913	7919	423	277	1	2022-12-01	2	4.00	20.00	20.00	38.40	0.00
17914	7920	1036	1221	2	2022-01-04	2	5.00	30.00	40.00	76.00	19.00
17915	7921	1036	1601	2	2023-06-16	2	2.00	50.00	60.00	117.60	19.60
17916	7922	842	921	2	2022-10-08	3	4.00	150.00	170.00	489.60	57.60
17917	7923	1037	1486	2	2023-12-22	5	5.00	360.00	380.00	1805.00	95.00
17918	7924	1037	154	2	2022-01-13	3	5.00	20.00	20.00	57.00	0.00
17919	7925	30	79	5	2023-09-26	4	2.00	20.00	20.00	78.40	0.00
17920	7926	30	430	5	2022-02-20	7	4.00	80.00	100.00	672.00	134.40
17921	7927	49	1431	1	2023-12-10	3	3.00	0.00	0.00	0.00	0.00
17922	7928	49	433	1	2022-11-15	1	4.00	470.00	570.00	547.20	96.00
17923	7929	49	1794	1	2023-05-26	3	4.00	40.00	50.00	144.00	28.80
17924	7930	691	1170	5	2022-01-10	6	5.00	290.00	300.00	1710.00	57.00
17925	7931	25	1042	1	2023-07-30	3	2.00	50.00	60.00	176.40	29.40
17926	7932	1129	371	2	2023-11-07	3	2.00	200.00	230.00	676.20	88.20
17927	7933	1129	955	2	2022-01-16	5	4.00	100.00	110.00	528.00	48.00
17928	7934	501	1041	2	2022-08-11	2	5.00	20.00	20.00	38.00	0.00
17929	7935	501	994	2	2023-03-16	3	2.00	60.00	70.00	205.80	29.40
17930	7936	501	1118	2	2023-07-05	2	2.00	10.00	10.00	19.60	0.00
17931	7937	501	1459	2	2023-12-14	3	3.00	10.00	10.00	29.10	0.00
17932	7938	501	138	2	2022-07-11	9	2.00	2040.00	2520.00	22226.40	4233.60
17933	7939	501	735	2	2023-12-02	3	5.00	510.00	540.00	1539.00	85.50
17934	7940	501	656	2	2022-05-02	8	5.00	200.00	220.00	1672.00	152.00
17935	7941	326	65	5	2022-10-10	2	5.00	80.00	80.00	152.00	0.00
17936	7942	326	147	5	2022-02-28	10	4.00	120.00	130.00	1248.00	96.00
17937	7943	452	716	2	2022-11-21	9	4.00	40.00	40.00	345.60	0.00
17938	7944	452	1445	2	2023-12-24	7	4.00	30.00	40.00	268.80	67.20
17939	7945	452	1501	2	2022-07-27	2	2.00	30.00	30.00	58.80	0.00
17940	7946	452	801	2	2022-02-22	5	4.00	40.00	40.00	192.00	0.00
17941	7947	452	1086	2	2022-11-29	3	4.00	0.00	0.00	0.00	0.00
17942	7948	429	1218	2	2023-03-12	5	3.00	20.00	20.00	97.00	0.00
17943	7949	429	867	2	2023-01-16	6	3.00	310.00	360.00	2095.20	291.00
17944	7950	429	751	2	2022-09-11	6	5.00	60.00	60.00	342.00	0.00
17945	7951	429	399	2	2023-07-19	3	3.00	120.00	130.00	378.30	29.10
17946	7952	134	1391	2	2023-02-06	2	4.00	10.00	10.00	19.20	0.00
17947	7953	134	884	2	2023-07-11	4	2.00	770.00	860.00	3371.20	352.80
17948	7954	738	1765	2	2023-06-19	4	4.00	60.00	70.00	268.80	38.40
17949	7955	738	745	2	2022-12-14	2	3.00	10.00	10.00	19.40	0.00
17950	7956	1134	1350	2	2022-09-22	4	4.00	350.00	440.00	1689.60	345.60
17951	7957	1134	128	2	2022-09-29	5	5.00	10.00	10.00	47.50	0.00
17952	7958	1134	1684	2	2023-12-03	4	2.00	20.00	20.00	78.40	0.00
17953	7959	1134	1475	2	2023-01-09	5	2.00	70.00	70.00	343.00	0.00
17954	7960	1134	839	2	2022-04-29	3	3.00	200.00	210.00	611.10	29.10
17955	7961	1134	313	2	2022-01-21	1	2.00	10.00	10.00	9.80	0.00
17956	7962	1135	1513	1	2023-06-18	5	4.00	70.00	80.00	384.00	48.00
17957	7963	1135	675	1	2022-09-03	8	4.00	20.00	20.00	153.60	0.00
17958	7964	1135	167	1	2022-02-16	4	2.00	360.00	390.00	1528.80	117.60
17959	7965	1135	1517	1	2022-02-13	4	3.00	20.00	20.00	77.60	0.00
17960	7966	1135	1166	1	2023-07-18	8	2.00	30.00	40.00	313.60	78.40
17961	7967	19	1306	2	2022-03-29	4	2.00	30.00	30.00	117.60	0.00
17962	7968	358	1831	5	2022-07-21	3	5.00	80.00	90.00	256.50	28.50
17963	7969	358	1731	5	2022-11-27	1	3.00	20.00	20.00	19.40	0.00
17964	7970	358	532	5	2022-08-15	1	3.00	100.00	120.00	116.40	19.40
17965	7971	325	1016	2	2022-09-04	4	4.00	470.00	520.00	1996.80	192.00
17966	7972	325	1422	2	2022-01-01	3	3.00	30.00	30.00	87.30	0.00
17967	7973	325	1291	2	2023-08-09	2	3.00	10.00	10.00	19.40	0.00
17968	7974	325	110	2	2023-04-10	2	2.00	0.00	0.00	0.00	0.00
17969	7975	325	1061	2	2022-06-23	3	3.00	220.00	250.00	727.50	87.30
17970	7976	325	808	2	2023-01-08	3	3.00	0.00	0.00	0.00	0.00
17971	7977	325	1013	2	2022-02-13	3	2.00	10.00	10.00	29.40	0.00
17972	7978	159	421	2	2023-07-13	3	2.00	530.00	660.00	1940.40	382.20
17973	7979	159	530	2	2022-08-15	3	2.00	100.00	110.00	323.40	29.40
17974	7980	179	1207	2	2022-09-23	1	5.00	10.00	10.00	9.50	0.00
17975	7981	141	1537	2	2022-02-16	2	5.00	20.00	20.00	38.00	0.00
17976	7982	1136	565	5	2022-03-07	4	3.00	70.00	80.00	310.40	38.80
17977	7983	1136	1155	5	2023-08-03	5	4.00	230.00	250.00	1200.00	96.00
17978	7984	74	1229	1	2023-01-07	5	4.00	20.00	20.00	96.00	0.00
17979	7985	74	1610	1	2022-02-23	3	3.00	10.00	10.00	29.10	0.00
17980	7986	68	256	5	2023-10-23	5	4.00	10.00	10.00	48.00	0.00
17981	7987	365	832	1	2023-08-22	5	4.00	70.00	90.00	432.00	96.00
17982	7988	1137	1622	2	2022-07-03	4	5.00	30.00	30.00	114.00	0.00
17983	7989	1137	1587	2	2022-12-18	3	5.00	40.00	40.00	114.00	0.00
17984	7990	1137	329	2	2023-12-15	1	3.00	10.00	10.00	9.70	0.00
17985	7991	1137	1431	2	2022-06-16	2	3.00	0.00	0.00	0.00	0.00
17986	7992	303	1198	5	2022-11-26	4	3.00	40.00	40.00	155.20	0.00
17987	7993	303	1576	5	2023-10-01	2	4.00	20.00	20.00	38.40	0.00
17988	7994	46	305	1	2023-03-20	3	5.00	0.00	0.00	0.00	0.00
17989	7995	46	318	1	2023-07-06	6	2.00	140.00	150.00	882.00	58.80
17990	7996	46	952	1	2022-08-28	6	2.00	10.00	10.00	58.80	0.00
17991	7997	449	241	5	2022-10-13	5	5.00	170.00	200.00	950.00	142.50
17992	7998	449	617	5	2022-08-29	12	5.00	1350.00	1670.00	19038.00	3648.00
17993	7999	153	853	5	2023-07-04	7	4.00	10.00	10.00	67.20	0.00
17994	8000	153	337	5	2023-11-02	4	4.00	50.00	60.00	230.40	38.40
17995	8001	1138	782	2	2023-08-30	4	3.00	210.00	260.00	1008.80	194.00
17996	8002	4	1136	5	2023-07-09	6	5.00	270.00	300.00	1710.00	171.00
17997	8003	4	328	5	2022-07-07	7	4.00	20.00	30.00	201.60	67.20
17998	8004	133	1624	5	2023-09-11	2	3.00	240.00	270.00	523.80	58.20
17999	8005	133	678	5	2022-12-23	3	3.00	50.00	50.00	145.50	0.00
18000	8006	133	876	5	2022-08-17	2	2.00	10.00	10.00	19.60	0.00
18001	8007	205	1507	2	2022-02-02	12	5.00	80.00	90.00	1026.00	114.00
18002	8008	500	274	2	2022-05-14	4	4.00	490.00	540.00	2073.60	192.00
18003	8009	500	259	2	2022-04-17	3	2.00	90.00	110.00	323.40	58.80
18004	8010	500	1803	2	2022-01-28	5	2.00	1250.00	1320.00	6468.00	343.00
18005	8011	325	955	1	2023-07-23	6	4.00	120.00	130.00	748.80	57.60
18006	8012	46	1805	5	2022-09-17	7	5.00	120.00	130.00	864.50	66.50
18007	8013	31	897	7	2022-06-08	5	5.00	580.00	660.00	3135.00	380.00
18008	8014	31	47	7	2022-11-27	8	4.00	100.00	120.00	921.60	153.60
18009	8015	31	1322	7	2023-10-19	1	4.00	0.00	0.00	0.00	0.00
18010	8016	31	546	7	2023-07-16	3	4.00	20.00	20.00	57.60	0.00
18011	8017	732	1309	5	2023-07-27	6	3.00	50.00	60.00	349.20	58.20
18012	8018	732	1006	5	2022-11-21	9	3.00	30.00	30.00	261.90	0.00
18013	8019	1139	195	1	2023-04-17	1	5.00	50.00	50.00	47.50	0.00
18014	8020	539	1613	5	2023-04-09	10	3.00	70.00	80.00	776.00	97.00
18015	8021	539	1018	5	2022-06-25	2	4.00	10.00	10.00	19.20	0.00
18016	8022	211	1253	2	2022-03-23	3	2.00	0.00	0.00	0.00	0.00
18017	8023	211	1665	2	2022-09-01	5	2.00	80.00	90.00	441.00	49.00
18018	8024	211	500	2	2023-06-02	5	2.00	590.00	660.00	3234.00	343.00
18019	8025	211	1582	2	2023-09-04	1	4.00	0.00	0.00	0.00	0.00
18020	8026	49	1806	1	2023-09-12	2	2.00	170.00	210.00	411.60	78.40
18021	8027	49	1820	1	2022-10-25	1	5.00	70.00	80.00	76.00	9.50
18022	8028	49	85	1	2023-08-20	1	5.00	20.00	20.00	19.00	0.00
18023	8029	49	1663	1	2022-06-23	4	5.00	720.00	770.00	2926.00	190.00
18024	8030	73	177	2	2023-09-07	6	5.00	90.00	110.00	627.00	114.00
18025	8031	399	1007	2	2022-02-24	3	2.00	20.00	20.00	58.80	0.00
18026	8032	399	748	2	2023-04-19	5	5.00	30.00	30.00	142.50	0.00
18027	8033	188	682	5	2023-10-12	3	3.00	40.00	50.00	145.50	29.10
18028	8034	188	1700	5	2023-04-30	2	4.00	0.00	0.00	0.00	0.00
18029	8035	188	1378	5	2023-05-23	9	5.00	70.00	80.00	684.00	85.50
18030	8036	188	746	5	2022-11-07	2	4.00	0.00	0.00	0.00	0.00
18031	8037	190	1376	5	2022-05-07	6	4.00	30.00	40.00	230.40	57.60
18032	8038	135	1804	2	2022-11-19	3	5.00	40.00	40.00	114.00	0.00
18033	8039	4	1107	1	2022-06-27	3	5.00	390.00	440.00	1254.00	142.50
18034	8040	411	168	1	2023-04-01	6	2.00	370.00	390.00	2293.20	117.60
18035	8041	411	622	1	2023-05-19	6	4.00	480.00	570.00	3283.20	518.40
18036	8042	411	1351	1	2023-09-14	2	3.00	20.00	30.00	58.20	19.40
18037	8043	1024	405	2	2023-06-19	4	4.00	50.00	60.00	230.40	38.40
18038	8044	1024	1832	2	2022-02-24	1	2.00	20.00	30.00	29.40	9.80
18039	8045	967	103	1	2022-11-10	9	4.00	280.00	300.00	2592.00	172.80
18040	8046	134	1153	2	2022-10-31	5	5.00	340.00	390.00	1852.50	237.50
18041	8047	1127	1700	1	2022-11-11	3	2.00	0.00	0.00	0.00	0.00
18042	8048	201	988	1	2023-03-22	3	5.00	20.00	20.00	57.00	0.00
18043	8049	49	1726	2	2022-04-05	7	5.00	620.00	710.00	4721.50	598.50
18044	8050	59	123	2	2023-09-14	5	3.00	10.00	10.00	48.50	0.00
18045	8051	59	751	2	2023-04-16	1	4.00	20.00	20.00	19.20	0.00
18046	8052	59	23	2	2022-11-28	6	2.00	30.00	40.00	235.20	58.80
18047	8053	253	880	1	2022-08-21	3	3.00	20.00	20.00	58.20	0.00
18048	8054	325	609	2	2023-09-04	1	5.00	0.00	0.00	0.00	0.00
18049	8055	14	519	2	2022-02-18	5	3.00	720.00	890.00	4316.50	824.50
18050	8056	14	200	2	2023-04-12	2	2.00	290.00	310.00	607.60	39.20
18051	8057	14	460	2	2022-10-12	9	5.00	600.00	730.00	6241.50	1111.50
18052	8058	14	1340	2	2023-07-04	5	4.00	30.00	40.00	192.00	48.00
18053	8059	14	832	2	2023-05-30	3	2.00	30.00	40.00	117.60	29.40
18054	8060	14	1036	2	2023-06-16	2	4.00	0.00	0.00	0.00	0.00
18055	8061	536	315	2	2022-01-01	5	2.00	60.00	60.00	294.00	0.00
18056	8062	536	1330	2	2022-11-24	2	4.00	20.00	20.00	38.40	0.00
18057	8063	181	507	5	2023-02-01	4	5.00	230.00	260.00	988.00	114.00
18058	8064	181	1212	5	2022-03-06	3	5.00	330.00	360.00	1026.00	85.50
18059	8065	181	1348	5	2022-11-02	2	2.00	10.00	10.00	19.60	0.00
18060	8066	181	42	5	2023-10-27	3	3.00	110.00	120.00	349.20	29.10
18061	8067	181	1592	5	2022-01-09	2	2.00	260.00	280.00	548.80	39.20
18062	8068	142	429	2	2022-10-24	3	5.00	200.00	240.00	684.00	114.00
18063	8069	142	1566	2	2023-02-20	6	4.00	20.00	20.00	115.20	0.00
18064	8070	648	419	2	2022-01-31	5	3.00	420.00	450.00	2182.50	145.50
18065	8071	648	1455	2	2023-09-23	5	5.00	130.00	140.00	665.00	47.50
18066	8072	648	638	2	2022-03-21	4	4.00	280.00	310.00	1190.40	115.20
18067	8073	648	704	2	2023-06-09	4	5.00	10.00	10.00	38.00	0.00
18068	8074	648	626	2	2023-12-12	5	2.00	10.00	10.00	49.00	0.00
18069	8075	648	186	2	2022-08-17	14	2.00	10.00	10.00	137.20	0.00
18070	8076	648	514	2	2022-06-03	2	5.00	20.00	20.00	38.00	0.00
18071	8077	1140	646	2	2023-02-17	3	4.00	30.00	30.00	86.40	0.00
18072	8078	1140	897	2	2022-11-19	1	3.00	140.00	170.00	164.90	29.10
18073	8079	1140	1372	2	2022-12-12	3	2.00	70.00	80.00	235.20	29.40
18074	8080	44	302	2	2022-09-16	8	5.00	120.00	130.00	988.00	76.00
18075	8081	487	934	2	2023-08-22	6	3.00	130.00	150.00	873.00	116.40
18076	8082	487	1767	2	2022-11-26	3	2.00	110.00	130.00	382.20	58.80
18077	8083	487	544	2	2023-01-29	5	4.00	170.00	200.00	960.00	144.00
18078	8084	487	1283	2	2023-05-31	7	5.00	10.00	10.00	66.50	0.00
18079	8085	487	436	2	2023-09-19	10	2.00	660.00	720.00	7056.00	588.00
18080	8086	374	391	2	2023-01-07	5	5.00	50.00	60.00	285.00	47.50
18081	8087	201	1268	2	2022-04-10	3	3.00	20.00	30.00	87.30	29.10
18082	8088	1093	837	1	2023-07-30	4	3.00	10.00	10.00	38.80	0.00
18083	8089	508	692	2	2023-02-26	2	4.00	40.00	40.00	76.80	0.00
18084	8090	457	23	5	2022-07-09	9	2.00	60.00	80.00	705.60	176.40
18085	8091	551	1425	2	2022-06-12	7	2.00	230.00	270.00	1852.20	274.40
18086	8092	152	746	2	2023-06-22	2	3.00	10.00	10.00	19.40	0.00
18087	8093	82	941	1	2023-03-02	5	2.00	100.00	110.00	539.00	49.00
18088	8094	68	741	1	2023-07-01	3	2.00	20.00	20.00	58.80	0.00
18089	8095	68	1255	1	2022-03-13	4	5.00	20.00	30.00	114.00	38.00
18090	8096	68	1291	1	2022-03-12	2	5.00	10.00	10.00	19.00	0.00
18091	8097	68	438	1	2022-06-19	5	3.00	180.00	230.00	1115.50	242.50
18092	8098	828	393	2	2023-10-17	5	3.00	110.00	120.00	582.00	48.50
18093	8099	828	1434	2	2022-11-28	1	2.00	0.00	0.00	0.00	0.00
18094	8100	179	1045	5	2022-11-22	3	2.00	30.00	30.00	88.20	0.00
18095	8101	179	1833	5	2023-01-21	3	2.00	3190.00	3360.00	9878.40	499.80
18096	8102	70	618	2	2023-08-11	2	5.00	10.00	10.00	19.00	0.00
18097	8103	70	669	2	2023-12-20	7	5.00	2790.00	2970.00	19750.50	1197.00
18098	8104	70	329	2	2023-06-22	7	2.00	100.00	100.00	686.00	0.00
18099	8105	70	298	2	2023-11-16	6	4.00	690.00	780.00	4492.80	518.40
18100	8106	17	420	5	2022-06-27	1	4.00	80.00	90.00	86.40	9.60
18101	8107	17	1834	5	2023-04-11	6	2.00	170.00	180.00	1058.40	58.80
18102	8108	17	1076	5	2023-10-26	4	5.00	360.00	440.00	1672.00	304.00
18103	8109	12	390	2	2023-05-10	4	4.00	200.00	220.00	844.80	76.80
18104	8110	118	1759	2	2023-08-30	6	2.00	50.00	60.00	352.80	58.80
18105	8111	118	1456	2	2022-09-01	2	5.00	110.00	130.00	247.00	38.00
18106	8112	1141	475	1	2022-07-19	5	3.00	210.00	250.00	1212.50	194.00
18107	8113	1141	938	1	2023-12-05	4	3.00	10.00	10.00	38.80	0.00
18108	8114	1141	213	1	2023-07-25	2	2.00	70.00	90.00	176.40	39.20
18109	8115	105	924	1	2022-01-23	5	5.00	20.00	20.00	95.00	0.00
18110	8116	19	1818	2	2022-03-29	3	5.00	140.00	150.00	427.50	28.50
18111	8117	1097	1292	7	2022-09-18	1	3.00	30.00	30.00	29.10	0.00
18112	8118	70	1128	2	2023-11-23	5	5.00	170.00	200.00	950.00	142.50
18113	8119	194	500	2	2023-02-02	4	5.00	440.00	530.00	2014.00	342.00
18114	8120	152	108	2	2022-03-08	2	5.00	30.00	40.00	76.00	19.00
18115	8121	152	500	2	2022-09-25	3	3.00	430.00	450.00	1309.50	58.20
18116	8122	152	176	2	2023-04-18	11	4.00	30.00	30.00	316.80	0.00
18117	8123	71	119	2	2022-10-03	3	5.00	30.00	30.00	85.50	0.00
18118	8124	71	1078	2	2022-12-01	4	5.00	980.00	1080.00	4104.00	380.00
18119	8125	1096	212	2	2023-09-19	2	2.00	130.00	160.00	313.60	58.80
18120	8126	35	767	2	2022-06-23	3	3.00	0.00	0.00	0.00	0.00
18121	8127	35	104	2	2022-02-17	2	5.00	20.00	20.00	38.00	0.00
18122	8128	35	1363	2	2023-01-09	3	5.00	550.00	670.00	1909.50	342.00
18123	8129	101	597	2	2022-08-14	5	4.00	50.00	60.00	288.00	48.00
18124	8130	298	918	5	2022-10-10	2	2.00	40.00	40.00	78.40	0.00
18125	8131	298	1297	5	2022-04-27	2	3.00	10.00	10.00	19.40	0.00
18126	8132	298	1610	5	2023-05-13	4	3.00	10.00	10.00	38.80	0.00
18127	8133	298	519	5	2023-08-22	3	4.00	450.00	540.00	1555.20	259.20
18128	8134	227	72	2	2022-11-29	3	4.00	60.00	70.00	201.60	28.80
18129	8135	204	315	2	2022-11-15	3	3.00	30.00	40.00	116.40	29.10
18130	8136	204	50	2	2022-04-22	7	3.00	70.00	90.00	611.10	135.80
18131	8137	697	278	2	2023-01-09	7	4.00	480.00	560.00	3763.20	537.60
18132	8138	82	268	2	2023-05-24	9	3.00	60.00	60.00	523.80	0.00
18133	8139	243	825	2	2023-10-07	8	5.00	10.00	10.00	76.00	0.00
18134	8140	243	842	2	2022-10-26	10	2.00	230.00	280.00	2744.00	490.00
18135	8141	243	610	2	2023-12-10	4	5.00	20.00	20.00	76.00	0.00
18136	8142	103	608	2	2023-05-07	3	5.00	10.00	10.00	28.50	0.00
18137	8143	103	822	2	2022-08-06	3	5.00	160.00	190.00	541.50	85.50
18138	8144	103	617	2	2023-03-18	4	5.00	480.00	560.00	2128.00	304.00
18139	8145	103	141	2	2023-12-28	4	2.00	150.00	160.00	627.20	39.20
18140	8146	849	1153	2	2023-03-20	6	4.00	390.00	470.00	2707.20	460.80
18141	8147	849	1274	2	2023-12-29	2	2.00	0.00	0.00	0.00	0.00
18142	8148	567	34	2	2023-06-08	4	2.00	40.00	50.00	196.00	39.20
18143	8149	807	746	2	2022-09-10	7	4.00	20.00	20.00	134.40	0.00
18144	8150	1142	952	5	2022-10-28	2	5.00	10.00	10.00	19.00	0.00
18145	8151	1142	632	5	2023-11-22	2	2.00	130.00	140.00	274.40	19.60
18146	8152	68	721	5	2022-04-09	2	3.00	30.00	30.00	58.20	0.00
18147	8153	68	482	5	2023-07-24	3	2.00	20.00	20.00	58.80	0.00
18148	8154	68	1389	5	2022-10-25	4	4.00	13020.00	14000.00	53760.00	3763.20
18149	8155	382	1201	2	2022-06-23	2	2.00	220.00	240.00	470.40	39.20
18150	8156	382	1031	2	2022-07-13	2	3.00	60.00	60.00	116.40	0.00
18151	8157	521	976	2	2023-12-16	2	4.00	220.00	240.00	460.80	38.40
18152	8158	287	1201	2	2023-08-23	5	3.00	500.00	600.00	2910.00	485.00
18153	8159	765	1284	2	2022-10-21	3	3.00	20.00	20.00	58.20	0.00
18154	8160	1143	241	2	2022-04-20	5	2.00	160.00	200.00	980.00	196.00
18155	8161	270	1757	2	2023-03-24	2	4.00	220.00	230.00	441.60	19.20
18156	8162	134	415	1	2023-11-08	6	3.00	240.00	290.00	1687.80	291.00
18157	8163	134	349	1	2022-04-12	2	5.00	290.00	310.00	589.00	38.00
18158	8164	287	1373	2	2023-08-04	6	4.00	90.00	100.00	576.00	57.60
18159	8165	287	302	2	2022-01-31	7	5.00	100.00	120.00	798.00	133.00
18160	8166	287	592	2	2023-06-28	3	2.00	10.00	10.00	29.40	0.00
18161	8167	287	1374	2	2023-02-04	3	2.00	460.00	510.00	1499.40	147.00
18162	8168	60	585	2	2023-05-16	7	4.00	800.00	860.00	5779.20	403.20
18163	8169	67	310	2	2023-02-05	7	2.00	1670.00	2040.00	13994.40	2538.20
18164	8170	67	300	2	2022-05-07	2	2.00	400.00	450.00	882.00	98.00
18165	8171	67	478	2	2022-03-28	3	2.00	90.00	110.00	323.40	58.80
18166	8172	159	979	2	2023-07-10	7	4.00	240.00	260.00	1747.20	134.40
18167	8173	381	1364	2	2023-11-13	1	4.00	0.00	0.00	0.00	0.00
18168	8174	381	45	2	2023-01-21	6	5.00	30.00	40.00	228.00	57.00
18169	8175	381	1199	2	2022-06-02	4	2.00	20.00	20.00	78.40	0.00
18170	8176	74	63	2	2022-03-26	4	5.00	130.00	160.00	608.00	114.00
18171	8177	82	81	5	2022-12-21	6	4.00	110.00	130.00	748.80	115.20
18172	8178	204	1524	5	2022-07-20	5	4.00	400.00	470.00	2256.00	336.00
18173	8179	145	616	2	2022-10-31	2	3.00	870.00	1000.00	1940.00	252.20
18174	8180	672	1583	2	2023-02-06	4	5.00	260.00	280.00	1064.00	76.00
18175	8181	210	972	2	2022-01-14	8	4.00	1150.00	1250.00	9600.00	768.00
18176	8182	210	688	2	2022-08-06	5	2.00	100.00	110.00	539.00	49.00
18177	8183	199	1156	2	2023-07-24	3	4.00	20.00	20.00	57.60	0.00
18178	8184	199	284	2	2022-06-29	1	4.00	0.00	0.00	0.00	0.00
18179	8185	74	955	2	2023-08-17	3	4.00	50.00	60.00	172.80	28.80
18180	8186	118	1171	1	2022-11-04	1	4.00	10.00	10.00	9.60	0.00
18181	8187	118	164	1	2023-02-10	4	4.00	150.00	170.00	652.80	76.80
18182	8188	25	162	2	2022-12-02	9	5.00	50.00	60.00	513.00	85.50
18183	8189	354	681	1	2022-01-10	3	2.00	20.00	20.00	58.80	0.00
18184	8190	354	778	1	2022-04-27	1	4.00	10.00	10.00	9.60	0.00
18185	8191	383	833	2	2023-02-09	6	3.00	40.00	40.00	232.80	0.00
18186	8192	383	268	2	2022-06-02	4	5.00	170.00	190.00	722.00	76.00
18187	8193	1144	615	5	2022-07-22	7	3.00	10.00	10.00	67.90	0.00
18188	8194	1144	1361	5	2023-01-29	3	5.00	80.00	100.00	285.00	57.00
18189	8195	1144	221	5	2022-12-02	2	4.00	280.00	340.00	652.80	115.20
18190	8196	1145	1057	1	2022-09-03	2	3.00	10.00	10.00	19.40	0.00
18191	8197	549	1131	2	2023-12-10	4	5.00	80.00	90.00	342.00	38.00
18192	8198	549	647	2	2023-08-12	5	4.00	60.00	70.00	336.00	48.00
18193	8199	549	586	2	2022-09-02	3	2.00	20.00	20.00	58.80	0.00
18194	8200	101	1125	2	2023-03-11	5	5.00	10.00	10.00	47.50	0.00
18195	8201	101	73	2	2023-06-21	1	4.00	70.00	70.00	67.20	0.00
18196	8202	25	1679	7	2022-10-07	5	2.00	60.00	70.00	343.00	49.00
18197	8203	25	904	7	2023-03-09	2	5.00	500.00	550.00	1045.00	95.00
18198	8204	25	1801	7	2023-02-03	3	4.00	10.00	10.00	28.80	0.00
18199	8205	25	1716	7	2023-07-21	4	3.00	4270.00	4640.00	18003.20	1435.60
18200	8206	25	624	7	2022-06-14	2	5.00	490.00	580.00	1102.00	171.00
18201	8207	831	4	2	2023-10-31	1	2.00	150.00	190.00	186.20	39.20
18202	8208	831	347	2	2023-08-08	1	5.00	0.00	0.00	0.00	0.00
18203	8209	611	693	2	2023-08-05	6	2.00	1110.00	1370.00	8055.60	1528.80
18204	8210	611	197	2	2022-04-17	4	3.00	260.00	290.00	1125.20	116.40
18205	8211	902	474	2	2023-07-25	2	3.00	60.00	80.00	155.20	38.80
18206	8212	89	1835	2	2022-09-29	5	5.00	40.00	40.00	190.00	0.00
18207	8213	89	534	2	2022-12-21	3	5.00	290.00	310.00	883.50	57.00
18208	8214	129	1086	2	2023-03-29	4	2.00	10.00	10.00	39.20	0.00
18209	8215	129	1403	2	2023-05-13	1	3.00	10.00	10.00	9.70	0.00
18210	8216	129	1264	2	2023-09-23	1	2.00	0.00	0.00	0.00	0.00
18211	8217	129	305	2	2023-09-05	2	2.00	0.00	0.00	0.00	0.00
18212	8218	442	1089	2	2023-09-03	3	2.00	0.00	0.00	0.00	0.00
18213	8219	442	1093	2	2022-01-26	3	2.00	30.00	30.00	88.20	0.00
18214	8220	442	642	2	2022-11-21	2	2.00	0.00	0.00	0.00	0.00
18215	8221	442	99	2	2023-12-05	3	5.00	0.00	0.00	0.00	0.00
18216	8222	442	1836	2	2023-07-01	4	4.00	20.00	20.00	76.80	0.00
18217	8223	225	1556	2	2022-06-15	2	5.00	10.00	10.00	19.00	0.00
18218	8224	683	1175	2	2023-07-24	6	3.00	170.00	190.00	1105.80	116.40
18219	8225	683	1435	2	2023-07-31	2	3.00	10.00	10.00	19.40	0.00
18220	8226	422	275	1	2023-09-18	10	4.00	150.00	190.00	1824.00	384.00
18221	8227	422	1523	1	2023-05-26	1	2.00	40.00	40.00	39.20	0.00
18222	8228	1146	480	1	2023-01-23	2	4.00	70.00	80.00	153.60	19.20
18223	8229	1146	171	1	2022-10-09	2	4.00	20.00	30.00	57.60	19.20
18224	8230	1146	1017	1	2022-08-31	3	2.00	80.00	90.00	264.60	29.40
18225	8231	1147	370	1	2022-03-16	3	3.00	40.00	40.00	116.40	0.00
18226	8232	1147	200	1	2023-08-05	7	5.00	1160.00	1270.00	8445.50	731.50
18227	8233	308	299	2	2022-03-31	5	3.00	160.00	170.00	824.50	48.50
18228	8234	308	1513	2	2022-07-11	2	5.00	40.00	40.00	76.00	0.00
18229	8235	164	1699	2	2022-12-01	2	2.00	0.00	0.00	0.00	0.00
18230	8236	164	412	2	2022-07-02	4	5.00	870.00	930.00	3534.00	228.00
18231	8237	164	484	2	2022-10-10	5	2.00	2600.00	2800.00	13720.00	980.00
18232	8238	164	384	7	2023-04-20	2	2.00	0.00	0.00	0.00	0.00
18233	8239	164	1306	7	2022-07-15	1	5.00	10.00	10.00	9.50	0.00
18234	8240	164	1062	7	2023-11-17	2	3.00	0.00	0.00	0.00	0.00
18235	8241	164	1650	7	2023-04-30	4	5.00	30.00	40.00	152.00	38.00
18236	8242	31	709	2	2023-05-04	2	5.00	20.00	20.00	38.00	0.00
18237	8243	31	1201	2	2023-10-04	3	5.00	310.00	360.00	1026.00	142.50
18238	8244	37	1420	2	2022-10-14	8	2.00	760.00	810.00	6350.40	392.00
18239	8245	37	1147	2	2022-06-28	3	3.00	80.00	90.00	261.90	29.10
18240	8246	135	157	2	2023-04-30	3	3.00	300.00	340.00	989.40	116.40
18241	8247	224	555	7	2022-07-14	5	4.00	70.00	70.00	336.00	0.00
18242	8248	224	1244	7	2023-05-07	2	2.00	40.00	40.00	78.40	0.00
18243	8249	344	648	1	2023-12-30	2	5.00	610.00	740.00	1406.00	247.00
18244	8250	194	913	1	2022-04-16	2	4.00	10.00	10.00	19.20	0.00
18245	8251	194	326	1	2022-01-21	2	2.00	0.00	0.00	0.00	0.00
18246	8252	194	1108	1	2022-02-17	5	2.00	150.00	180.00	882.00	147.00
18247	8253	194	118	1	2023-07-09	2	2.00	50.00	60.00	117.60	19.60
18248	8254	6	1328	2	2022-10-25	1	5.00	280.00	300.00	285.00	19.00
18249	8255	6	1685	2	2022-06-16	4	5.00	180.00	190.00	722.00	38.00
18250	8256	6	530	2	2023-02-27	8	4.00	190.00	240.00	1843.20	384.00
18251	8257	6	231	2	2022-08-31	3	4.00	50.00	50.00	144.00	0.00
18252	8258	6	1482	2	2022-08-22	5	5.00	160.00	170.00	807.50	47.50
18253	8259	6	1787	2	2022-05-02	6	3.00	90.00	100.00	582.00	58.20
18254	8260	1148	448	7	2022-10-18	9	3.00	300.00	370.00	3230.10	611.10
18255	8261	1148	386	7	2022-02-09	1	3.00	10.00	10.00	9.70	0.00
18256	8262	1148	1355	7	2022-09-25	4	2.00	160.00	170.00	666.40	39.20
18257	8263	302	354	2	2023-12-10	3	3.00	20.00	20.00	58.20	0.00
18258	8264	312	635	2	2023-02-17	4	4.00	10.00	10.00	38.40	0.00
18259	8265	134	1837	2	2023-04-09	3	2.00	110.00	120.00	352.80	29.40
18260	8266	134	859	2	2023-10-12	7	5.00	40.00	40.00	266.00	0.00
18261	8267	23	434	2	2023-10-10	2	4.00	20.00	20.00	38.40	0.00
18262	8268	623	1583	2	2023-05-05	1	3.00	70.00	70.00	67.90	0.00
18263	8269	623	559	2	2023-05-05	4	3.00	30.00	30.00	116.40	0.00
18264	8270	623	1719	2	2022-08-22	4	4.00	1880.00	2000.00	7680.00	460.80
18265	8271	623	242	2	2022-06-19	2	5.00	10.00	10.00	19.00	0.00
18266	8272	31	407	2	2023-07-27	8	3.00	2410.00	2560.00	19865.60	1164.00
18267	8273	1149	1709	2	2023-05-28	4	2.00	330.00	390.00	1528.80	235.20
18268	8274	318	1006	1	2023-10-06	1	3.00	0.00	0.00	0.00	0.00
18269	8275	240	1450	2	2023-04-09	7	3.00	890.00	1090.00	7401.10	1358.00
18270	8276	826	100	2	2022-07-23	9	3.00	30.00	40.00	349.20	87.30
18271	8277	99	808	2	2022-10-07	3	4.00	0.00	0.00	0.00	0.00
18272	8278	99	921	2	2023-09-07	2	5.00	30.00	30.00	57.00	0.00
18273	8279	99	735	2	2022-07-27	3	3.00	360.00	430.00	1251.30	203.70
18274	8280	375	907	2	2022-04-03	3	2.00	560.00	680.00	1999.20	352.80
18275	8281	384	114	5	2022-02-10	3	2.00	60.00	70.00	205.80	29.40
18276	8282	384	867	5	2023-05-01	3	3.00	170.00	210.00	611.10	116.40
18277	8283	1088	847	1	2022-10-03	2	2.00	530.00	600.00	1176.00	137.20
18278	8284	1088	727	1	2022-11-22	2	3.00	50.00	60.00	116.40	19.40
18279	8285	1088	770	1	2023-07-30	8	4.00	580.00	640.00	4915.20	460.80
18280	8286	1088	485	1	2023-07-05	3	5.00	50.00	50.00	142.50	0.00
18281	8287	768	1799	2	2022-01-04	6	3.00	30.00	30.00	174.60	0.00
18282	8288	768	370	2	2022-03-27	5	2.00	40.00	50.00	245.00	49.00
18283	8289	768	722	2	2023-03-02	7	5.00	140.00	160.00	1064.00	133.00
18284	8290	768	1325	2	2022-07-25	6	5.00	180.00	210.00	1197.00	171.00
18285	8291	768	1568	2	2022-10-03	2	4.00	10.00	10.00	19.20	0.00
18286	8292	768	1140	2	2023-01-27	1	2.00	0.00	0.00	0.00	0.00
18287	8293	686	1427	2	2023-12-14	3	3.00	10.00	10.00	29.10	0.00
18288	8294	237	1213	2	2022-03-17	4	3.00	20.00	20.00	77.60	0.00
18289	8295	383	1188	2	2023-02-04	2	3.00	240.00	300.00	582.00	116.40
18290	8296	386	112	2	2022-04-02	9	4.00	20.00	30.00	259.20	86.40
18291	8297	386	202	2	2022-10-27	2	3.00	100.00	110.00	213.40	19.40
18292	8298	98	1393	2	2022-09-04	2	3.00	0.00	0.00	0.00	0.00
18293	8299	98	608	2	2023-11-18	3	4.00	10.00	10.00	28.80	0.00
18294	8300	58	1597	2	2022-05-25	3	3.00	10.00	10.00	29.10	0.00
18295	8301	641	232	2	2022-04-29	2	2.00	150.00	180.00	352.80	58.80
18296	8302	2	1739	2	2023-02-25	5	2.00	1450.00	1650.00	8085.00	980.00
18297	8303	2	663	2	2023-11-20	3	4.00	320.00	360.00	1036.80	115.20
18298	8304	258	522	1	2023-04-17	2	2.00	70.00	70.00	137.20	0.00
18299	8305	639	1747	2	2022-10-09	4	3.00	460.00	490.00	1901.20	116.40
18300	8306	852	681	2	2022-04-10	5	4.00	20.00	30.00	144.00	48.00
18301	8307	852	571	2	2022-10-04	7	2.00	40.00	40.00	274.40	0.00
18302	8308	852	1562	2	2022-10-28	2	3.00	80.00	80.00	155.20	0.00
18303	8309	337	1025	7	2022-05-30	9	2.00	30.00	40.00	352.80	88.20
18304	8310	75	1278	2	2023-06-21	3	5.00	120.00	140.00	399.00	57.00
18305	8311	75	1295	2	2022-07-12	3	4.00	330.00	380.00	1094.40	144.00
18306	8312	375	117	2	2022-12-09	4	4.00	50.00	60.00	230.40	38.40
18307	8313	375	1462	2	2022-08-01	7	3.00	2560.00	2940.00	19962.60	2580.20
18308	8314	1150	857	2	2022-05-26	3	3.00	460.00	510.00	1484.10	145.50
18309	8315	1150	846	2	2022-02-19	2	5.00	0.00	0.00	0.00	0.00
18310	8316	1150	704	2	2022-05-05	7	4.00	20.00	20.00	134.40	0.00
18311	8317	1150	129	2	2023-01-22	3	4.00	20.00	20.00	57.60	0.00
18312	8318	320	910	2	2023-04-28	1	2.00	0.00	0.00	0.00	0.00
18313	8319	320	1211	2	2023-10-10	8	3.00	20.00	20.00	155.20	0.00
18314	8320	31	603	2	2022-04-27	1	5.00	10.00	10.00	9.50	0.00
18315	8321	89	1474	5	2022-03-15	2	2.00	40.00	50.00	98.00	19.60
18316	8322	141	921	2	2022-02-07	2	2.00	20.00	20.00	39.20	0.00
18317	8323	365	1519	2	2022-11-10	2	5.00	10.00	10.00	19.00	0.00
18318	8324	365	423	2	2022-10-29	5	2.00	30.00	40.00	196.00	49.00
18319	8325	477	422	5	2023-02-21	5	2.00	50.00	60.00	294.00	49.00
18320	8326	477	985	5	2023-05-08	3	3.00	130.00	160.00	465.60	87.30
18321	8327	393	176	1	2023-04-30	4	3.00	0.00	0.00	0.00	0.00
18322	8328	393	1081	1	2022-09-17	7	5.00	80.00	90.00	598.50	66.50
18323	8329	270	1053	2	2022-11-27	3	5.00	120.00	140.00	399.00	57.00
18324	8330	270	975	2	2023-09-23	1	3.00	10.00	10.00	9.70	0.00
18325	8331	104	1838	2	2023-11-12	4	2.00	10.00	10.00	39.20	0.00
18326	8332	1151	603	5	2022-09-07	1	2.00	10.00	10.00	9.80	0.00
18327	8333	1151	475	5	2022-08-27	5	5.00	330.00	350.00	1662.50	95.00
18328	8334	1151	1777	5	2022-10-29	3	2.00	20.00	20.00	58.80	0.00
18329	8335	1151	570	5	2023-03-19	4	3.00	40.00	50.00	194.00	38.80
18330	8336	1034	1198	1	2023-05-15	9	3.00	240.00	300.00	2619.00	523.80
18331	8337	121	1839	2	2023-12-18	2	3.00	10.00	10.00	19.40	0.00
18332	8338	36	1814	2	2023-07-03	4	5.00	20.00	20.00	76.00	0.00
18333	8339	36	770	2	2022-07-05	5	5.00	460.00	500.00	2375.00	190.00
18334	8340	128	1210	2	2022-10-30	6	5.00	400.00	440.00	2508.00	228.00
18335	8341	680	1010	2	2023-04-14	5	4.00	30.00	30.00	144.00	0.00
18336	8342	234	565	5	2022-01-25	3	2.00	50.00	60.00	176.40	29.40
18337	8343	548	471	2	2022-10-02	7	5.00	60.00	70.00	465.50	66.50
18338	8344	549	199	2	2022-04-04	5	2.00	60.00	60.00	294.00	0.00
18339	8345	549	1002	2	2023-06-04	3	2.00	30.00	30.00	88.20	0.00
18340	8346	549	1456	2	2023-12-31	3	4.00	190.00	220.00	633.60	86.40
18341	8347	158	192	2	2023-01-30	5	5.00	30.00	30.00	142.50	0.00
18342	8348	158	1463	2	2022-09-28	1	3.00	10.00	10.00	9.70	0.00
18343	8349	158	1021	2	2023-01-28	10	4.00	170.00	210.00	2016.00	384.00
18344	8350	158	1722	2	2023-06-04	5	3.00	20.00	20.00	97.00	0.00
18345	8351	158	1077	2	2023-06-26	1	5.00	10.00	10.00	9.50	0.00
18346	8352	325	1758	2	2022-07-19	2	3.00	30.00	30.00	58.20	0.00
18347	8353	325	716	2	2022-06-27	4	5.00	30.00	30.00	114.00	0.00
18348	8354	325	210	2	2023-08-28	5	2.00	330.00	370.00	1813.00	196.00
18349	8355	325	1161	2	2022-07-12	5	3.00	50.00	60.00	291.00	48.50
18350	8356	325	660	2	2023-02-12	2	3.00	10.00	10.00	19.40	0.00
18351	8357	873	1293	2	2023-07-10	3	4.00	170.00	190.00	547.20	57.60
18352	8358	1152	254	2	2023-06-19	7	3.00	80.00	90.00	611.10	67.90
18353	8359	1152	507	2	2022-09-14	2	5.00	90.00	110.00	209.00	38.00
18354	8360	1152	1520	2	2023-08-25	6	5.00	180.00	220.00	1254.00	228.00
18355	8361	429	1042	1	2022-12-24	2	2.00	30.00	30.00	58.80	0.00
18356	8362	429	1826	1	2023-04-11	2	3.00	10.00	10.00	19.40	0.00
18357	8363	429	972	1	2022-04-22	5	4.00	730.00	910.00	4368.00	864.00
18358	8364	429	1450	1	2023-04-26	3	5.00	320.00	370.00	1054.50	142.50
18359	8365	1153	1148	2	2023-03-11	2	5.00	680.00	750.00	1425.00	133.00
18360	8366	67	8	5	2022-04-12	4	5.00	530.00	600.00	2280.00	266.00
18361	8367	100	1840	1	2023-12-01	4	5.00	30.00	30.00	114.00	0.00
18362	8368	100	1537	1	2022-03-14	2	5.00	20.00	20.00	38.00	0.00
18363	8369	100	1787	1	2023-02-06	5	3.00	80.00	80.00	388.00	0.00
18364	8370	14	216	2	2022-01-29	3	2.00	810.00	900.00	2646.00	264.60
18365	8371	1154	1639	2	2023-03-29	2	3.00	110.00	120.00	232.80	19.40
18366	8372	198	445	5	2023-12-28	1	5.00	0.00	0.00	0.00	0.00
18367	8373	67	906	2	2023-04-26	3	2.00	70.00	80.00	235.20	29.40
18368	8374	152	1070	5	2022-08-26	1	2.00	30.00	30.00	29.40	0.00
18369	8375	258	938	2	2023-12-22	6	2.00	90.00	90.00	529.20	0.00
18370	8376	258	674	2	2023-04-28	6	3.00	50.00	60.00	349.20	58.20
18371	8377	640	1430	2	2022-03-22	1	2.00	50.00	60.00	58.80	9.80
18372	8378	515	872	2	2023-12-31	1	4.00	50.00	60.00	57.60	9.60
18373	8379	515	220	2	2023-10-20	3	4.00	20.00	20.00	57.60	0.00
18374	8380	515	890	2	2022-03-18	7	4.00	180.00	220.00	1478.40	268.80
18375	8381	194	703	1	2023-12-13	3	2.00	10.00	10.00	29.40	0.00
18376	8382	10	510	1	2023-08-02	2	4.00	80.00	80.00	153.60	0.00
18377	8383	106	867	2	2023-12-14	4	2.00	230.00	240.00	940.80	39.20
18378	8384	1155	809	5	2022-08-12	3	4.00	50.00	60.00	172.80	28.80
18379	8385	1155	1284	5	2023-04-27	2	2.00	10.00	10.00	19.60	0.00
18380	8386	333	1182	2	2022-07-02	3	4.00	10.00	10.00	28.80	0.00
18381	8387	855	721	2	2023-03-19	1	2.00	20.00	20.00	19.60	0.00
18382	8388	855	178	2	2022-01-01	5	4.00	60.00	80.00	384.00	96.00
18383	8389	1156	514	2	2022-10-15	2	5.00	60.00	80.00	152.00	38.00
18384	8390	1157	111	5	2023-11-11	6	4.00	20.00	20.00	115.20	0.00
18385	8391	376	1018	5	2023-08-20	2	3.00	10.00	10.00	19.40	0.00
18386	8392	1158	1002	2	2023-07-20	2	5.00	20.00	30.00	57.00	19.00
18387	8393	491	1677	1	2022-05-19	3	3.00	130.00	140.00	407.40	29.10
18388	8394	491	1381	1	2022-09-25	5	3.00	90.00	110.00	533.50	97.00
18389	8395	491	228	1	2022-11-07	3	5.00	840.00	900.00	2565.00	171.00
18390	8396	491	617	1	2023-12-03	3	3.00	310.00	370.00	1076.70	174.60
18391	8397	201	163	7	2022-05-17	7	4.00	290.00	310.00	2083.20	134.40
18392	8398	15	1737	5	2022-06-06	5	4.00	10.00	10.00	48.00	0.00
18393	8399	318	914	1	2022-06-28	2	4.00	130.00	160.00	307.20	57.60
18394	8400	406	1032	2	2022-10-23	1	4.00	10.00	10.00	9.60	0.00
18395	8401	31	921	1	2023-06-15	5	3.00	190.00	230.00	1115.50	194.00
18396	8402	31	1535	1	2022-05-10	3	4.00	150.00	160.00	460.80	28.80
18397	8403	31	753	1	2023-09-08	2	2.00	20.00	20.00	39.20	0.00
18398	8404	2	146	2	2022-10-20	4	2.00	90.00	110.00	431.20	78.40
18399	8405	417	1479	2	2022-11-05	4	3.00	70.00	80.00	310.40	38.80
18400	8406	417	722	2	2023-02-10	5	3.00	120.00	140.00	679.00	97.00
18401	8407	417	1802	2	2022-01-06	2	2.00	40.00	40.00	78.40	0.00
18402	8408	417	1025	2	2023-08-24	7	4.00	30.00	30.00	201.60	0.00
18403	8409	417	1754	2	2022-04-16	5	5.00	150.00	170.00	807.50	95.00
18404	8410	1159	656	2	2022-01-07	4	2.00	100.00	110.00	431.20	39.20
18405	8411	232	115	7	2022-04-11	4	5.00	540.00	630.00	2394.00	342.00
18406	8412	567	182	1	2023-01-17	7	3.00	30.00	30.00	203.70	0.00
18407	8413	442	602	2	2023-12-30	4	2.00	840.00	930.00	3645.60	352.80
18408	8414	493	1194	2	2023-09-24	10	5.00	40.00	50.00	475.00	95.00
18409	8415	493	1616	2	2023-07-02	3	4.00	150.00	170.00	489.60	57.60
18410	8416	1160	259	2	2022-08-17	3	2.00	100.00	110.00	323.40	29.40
18411	8417	67	806	5	2023-12-14	5	3.00	140.00	150.00	727.50	48.50
18412	8418	67	55	5	2022-08-21	3	3.00	100.00	100.00	291.00	0.00
18413	8419	67	739	5	2022-09-11	1	3.00	270.00	290.00	281.30	19.40
18414	8420	67	1765	5	2022-06-20	4	3.00	60.00	70.00	271.60	38.80
18415	8421	67	1337	5	2023-06-07	2	3.00	190.00	200.00	388.00	19.40
18416	8422	356	47	2	2023-07-23	3	4.00	40.00	50.00	144.00	28.80
18417	8423	356	111	2	2023-08-12	5	4.00	20.00	20.00	96.00	0.00
18418	8424	356	1654	2	2022-04-29	2	3.00	30.00	40.00	77.60	19.40
18419	8425	356	1399	2	2023-11-10	5	3.00	2040.00	2150.00	10427.50	533.50
18420	8426	110	1737	5	2022-10-22	8	5.00	20.00	20.00	152.00	0.00
18421	8427	775	1840	2	2023-03-18	2	3.00	10.00	10.00	19.40	0.00
18422	8428	927	483	5	2022-04-03	2	5.00	0.00	0.00	0.00	0.00
18423	8429	709	1422	2	2023-12-20	6	2.00	50.00	60.00	352.80	58.80
18424	8430	1161	1598	1	2022-12-18	5	3.00	280.00	300.00	1455.00	97.00
18425	8431	664	558	2	2023-09-05	2	5.00	120.00	130.00	247.00	19.00
18426	8432	457	906	2	2023-12-11	10	2.00	250.00	270.00	2646.00	196.00
18427	8433	643	970	1	2022-04-17	4	3.00	10.00	10.00	38.80	0.00
18428	8434	643	1533	1	2023-12-04	2	3.00	10.00	10.00	19.40	0.00
18429	8435	643	1468	1	2022-10-31	5	2.00	10.00	10.00	49.00	0.00
18430	8436	643	95	1	2022-08-11	2	2.00	10.00	10.00	19.60	0.00
18431	8437	724	1500	2	2022-08-02	11	5.00	40.00	50.00	522.50	104.50
18432	8438	228	1366	2	2023-06-17	2	2.00	20.00	30.00	58.80	19.60
18433	8439	203	1637	2	2022-08-28	4	4.00	120.00	140.00	537.60	76.80
18434	8440	74	1671	1	2022-03-07	2	2.00	40.00	50.00	98.00	19.60
18435	8441	115	250	1	2023-04-07	3	2.00	10.00	10.00	29.40	0.00
18436	8442	138	146	2	2023-03-22	4	2.00	80.00	80.00	313.60	0.00
18437	8443	285	908	2	2023-08-30	2	4.00	370.00	430.00	825.60	115.20
18438	8444	285	1283	2	2022-11-08	1	2.00	0.00	0.00	0.00	0.00
18439	8445	285	530	2	2022-02-01	3	2.00	60.00	70.00	205.80	29.40
18440	8446	992	978	5	2022-04-26	4	3.00	230.00	240.00	931.20	38.80
18441	8447	992	1458	5	2023-04-15	4	2.00	40.00	40.00	156.80	0.00
18442	8448	992	1806	5	2022-09-12	2	5.00	190.00	210.00	399.00	38.00
18443	8449	992	336	5	2022-11-07	3	2.00	540.00	640.00	1881.60	294.00
18444	8450	992	363	5	2023-11-08	8	4.00	30.00	40.00	307.20	76.80
18445	8451	992	1109	5	2022-08-09	1	5.00	0.00	0.00	0.00	0.00
18446	8452	37	1462	5	2022-04-10	5	4.00	1510.00	1680.00	8064.00	816.00
18447	8453	165	813	2	2023-07-26	4	2.00	310.00	340.00	1332.80	117.60
18448	8454	165	487	2	2023-03-07	3	4.00	1290.00	1550.00	4464.00	748.80
18449	8455	165	1269	2	2023-09-14	5	3.00	120.00	130.00	630.50	48.50
18450	8456	19	193	2	2023-12-12	2	5.00	180.00	220.00	418.00	76.00
18451	8457	199	65	1	2022-05-27	3	4.00	90.00	110.00	316.80	57.60
18452	8458	199	991	1	2022-11-25	3	3.00	0.00	0.00	0.00	0.00
18453	8459	35	1161	2	2023-10-20	3	5.00	20.00	30.00	85.50	28.50
18454	8460	35	341	2	2022-09-30	3	5.00	10.00	10.00	28.50	0.00
18455	8461	1162	882	2	2022-01-19	5	2.00	30.00	30.00	147.00	0.00
18456	8462	1162	912	2	2023-11-27	3	2.00	80.00	100.00	294.00	58.80
18457	8463	1163	1551	1	2022-06-18	2	4.00	10.00	10.00	19.20	0.00
18458	8464	689	173	2	2023-05-02	3	3.00	280.00	300.00	873.00	58.20
18459	8465	157	1208	2	2023-02-06	4	5.00	40.00	50.00	190.00	38.00
18460	8466	104	1199	2	2023-06-10	3	5.00	20.00	20.00	57.00	0.00
18461	8467	883	533	2	2022-12-26	3	4.00	330.00	370.00	1065.60	115.20
18462	8468	60	79	2	2023-12-09	2	5.00	10.00	10.00	19.00	0.00
18463	8469	1164	1300	2	2022-06-23	6	5.00	2220.00	2680.00	15276.00	2622.00
18464	8470	1165	367	2	2022-06-25	4	2.00	340.00	390.00	1528.80	196.00
18465	8471	1165	722	2	2022-03-28	2	5.00	40.00	50.00	95.00	19.00
18466	8472	1165	1526	2	2023-11-06	3	5.00	70.00	80.00	228.00	28.50
18467	8473	1165	1346	2	2023-10-13	1	3.00	0.00	0.00	0.00	0.00
18468	8474	802	254	1	2022-12-24	1	5.00	10.00	10.00	9.50	0.00
18469	8475	537	352	2	2022-09-01	4	2.00	30.00	40.00	156.80	39.20
18470	8476	537	1523	2	2023-03-12	2	4.00	60.00	70.00	134.40	19.20
18471	8477	806	1559	2	2022-12-18	1	3.00	30.00	40.00	38.80	9.70
18472	8478	25	1841	7	2022-08-20	4	5.00	830.00	1040.00	3952.00	798.00
18473	8479	258	672	2	2022-10-24	2	3.00	10.00	10.00	19.40	0.00
18474	8480	234	1634	2	2023-01-19	2	4.00	20.00	20.00	38.40	0.00
18475	8481	266	1764	2	2023-09-17	2	5.00	40.00	40.00	76.00	0.00
18476	8482	285	925	2	2022-02-06	3	3.00	20.00	20.00	58.20	0.00
18477	8483	25	489	2	2022-09-10	2	4.00	20.00	20.00	38.40	0.00
18478	8484	1166	1596	2	2022-09-26	5	5.00	70.00	80.00	380.00	47.50
18479	8485	68	562	7	2022-12-14	10	2.00	160.00	200.00	1960.00	392.00
18480	8486	1154	1265	2	2023-10-25	2	4.00	40.00	50.00	96.00	19.20
18481	8487	1154	163	2	2022-06-29	2	4.00	90.00	110.00	211.20	38.40
18482	8488	1154	1742	2	2023-07-31	3	3.00	10.00	10.00	29.10	0.00
18483	8489	121	1630	1	2023-02-22	5	2.00	8050.00	8750.00	42875.00	3430.00
18484	8490	121	249	1	2022-05-03	8	5.00	30.00	40.00	304.00	76.00
18485	8491	121	1566	1	2022-09-01	7	5.00	20.00	20.00	133.00	0.00
18486	8492	14	1080	2	2022-07-07	3	2.00	10.00	10.00	29.40	0.00
18487	8493	1006	1588	2	2023-12-13	8	5.00	50.00	60.00	456.00	76.00
18488	8494	1006	1688	2	2022-02-19	3	5.00	450.00	480.00	1368.00	85.50
18489	8495	1006	1000	2	2023-05-23	1	2.00	10.00	10.00	9.80	0.00
18490	8496	1167	1616	2	2022-12-16	3	2.00	160.00	170.00	499.80	29.40
18491	8497	331	398	1	2022-03-27	3	4.00	50.00	60.00	172.80	28.80
18492	8498	331	266	1	2023-02-03	3	2.00	400.00	480.00	1411.20	235.20
18493	8499	331	661	1	2022-12-06	2	2.00	20.00	20.00	39.20	0.00
18494	8500	331	1340	1	2022-02-19	6	3.00	50.00	50.00	291.00	0.00
18495	8501	331	1185	1	2023-09-12	2	2.00	90.00	100.00	196.00	19.60
18496	8502	156	434	1	2023-07-05	2	2.00	20.00	20.00	39.20	0.00
18497	8503	156	390	1	2022-11-26	3	4.00	170.00	180.00	518.40	28.80
18498	8504	381	1542	2	2022-07-15	2	2.00	10.00	10.00	19.60	0.00
18499	8505	399	1586	2	2022-05-14	4	2.00	350.00	370.00	1450.40	78.40
18500	8506	691	1182	2	2022-05-27	9	5.00	10.00	10.00	85.50	0.00
18501	8507	691	61	2	2023-03-01	5	5.00	30.00	30.00	142.50	0.00
18502	8508	691	1698	2	2022-12-10	3	2.00	130.00	150.00	441.00	58.80
18503	8509	638	789	5	2023-12-24	11	2.00	150.00	180.00	1940.40	323.40
18504	8510	638	1420	5	2022-08-17	1	4.00	120.00	130.00	124.80	9.60
18505	8511	638	1024	5	2022-08-31	2	3.00	20.00	20.00	38.80	0.00
18506	8512	134	1400	2	2023-04-30	2	5.00	30.00	30.00	57.00	0.00
18507	8513	34	738	2	2022-05-26	2	3.00	60.00	70.00	135.80	19.40
18508	8514	1041	1291	2	2022-10-27	4	3.00	20.00	20.00	77.60	0.00
18509	8515	1168	242	2	2022-09-01	3	5.00	20.00	20.00	57.00	0.00
18510	8516	1168	80	2	2022-04-08	12	5.00	40.00	40.00	456.00	0.00
18511	8517	31	7	2	2023-01-10	2	4.00	0.00	0.00	0.00	0.00
18512	8518	1169	1309	1	2023-12-01	6	4.00	30.00	30.00	172.80	0.00
18513	8519	497	1824	2	2022-11-28	1	3.00	10.00	10.00	9.70	0.00
18514	8520	497	164	2	2023-03-31	3	3.00	170.00	180.00	523.80	29.10
18515	8521	497	212	2	2023-06-15	3	5.00	270.00	300.00	855.00	85.50
18516	8522	115	876	2	2023-02-24	14	2.00	40.00	50.00	686.00	137.20
18517	8523	269	781	2	2022-03-29	1	2.00	10.00	10.00	9.80	0.00
18518	8524	10	227	2	2022-01-23	7	3.00	50.00	60.00	407.40	67.90
18519	8525	51	996	7	2022-07-04	2	2.00	30.00	40.00	78.40	19.60
18520	8526	51	1681	7	2022-08-26	6	2.00	40.00	50.00	294.00	58.80
18521	8527	51	69	7	2022-10-14	3	5.00	10.00	10.00	28.50	0.00
18522	8528	51	410	7	2023-09-30	2	4.00	130.00	160.00	307.20	57.60
18523	8529	51	299	7	2023-11-02	2	4.00	40.00	50.00	96.00	19.20
18524	8530	329	1319	2	2022-10-24	2	5.00	230.00	240.00	456.00	19.00
18525	8531	166	1306	2	2022-01-08	4	5.00	30.00	30.00	114.00	0.00
18526	8532	166	321	2	2023-02-05	2	3.00	10.00	10.00	19.40	0.00
18527	8533	166	1044	2	2023-01-31	7	2.00	440.00	500.00	3430.00	411.60
18528	8534	166	71	2	2023-06-24	3	5.00	330.00	390.00	1111.50	171.00
18529	8535	135	608	1	2023-02-26	2	5.00	10.00	10.00	19.00	0.00
18530	8536	37	1203	2	2022-07-09	3	3.00	50.00	60.00	174.60	29.10
18531	8537	282	786	2	2022-11-05	4	3.00	20.00	20.00	77.60	0.00
18532	8538	282	1554	2	2022-12-07	5	5.00	30.00	30.00	142.50	0.00
18533	8539	282	1413	2	2023-06-18	3	2.00	10.00	10.00	29.40	0.00
18534	8540	204	1328	2	2022-11-18	2	2.00	400.00	480.00	940.80	156.80
18535	8541	204	9	2	2022-02-14	5	4.00	30.00	30.00	144.00	0.00
18536	8542	59	1223	5	2023-01-22	2	5.00	20.00	30.00	57.00	19.00
18537	8543	59	867	5	2022-11-06	7	3.00	340.00	420.00	2851.80	543.20
18538	8544	134	410	2	2022-05-27	2	3.00	180.00	200.00	388.00	38.80
18539	8545	135	1654	2	2022-11-23	1	5.00	20.00	20.00	19.00	0.00
18540	8546	135	1612	2	2023-01-07	4	4.00	40.00	40.00	153.60	0.00
18541	8547	135	1527	2	2022-10-03	2	3.00	20.00	30.00	58.20	19.40
18542	8548	19	198	2	2022-01-08	3	5.00	40.00	40.00	114.00	0.00
18543	8549	19	817	2	2022-05-22	4	3.00	10.00	10.00	38.80	0.00
18544	8550	400	443	5	2023-09-04	4	2.00	20.00	20.00	78.40	0.00
18545	8551	34	1797	2	2023-02-10	3	4.00	10.00	10.00	28.80	0.00
18546	8552	34	486	2	2023-12-01	4	5.00	10.00	10.00	38.00	0.00
18547	8553	74	852	2	2023-12-29	3	5.00	660.00	720.00	2052.00	171.00
18548	8554	712	702	2	2022-12-15	8	3.00	220.00	240.00	1862.40	155.20
18549	8555	30	1001	5	2023-04-04	7	4.00	930.00	1060.00	7123.20	873.60
18550	8556	1170	429	7	2022-09-13	7	3.00	380.00	450.00	3055.50	475.30
18551	8557	1170	1752	7	2022-07-15	9	5.00	140.00	150.00	1282.50	85.50
18552	8558	34	868	1	2022-12-06	3	2.00	380.00	450.00	1323.00	205.80
18553	8559	34	1622	1	2022-05-16	9	3.00	40.00	50.00	436.50	87.30
18554	8560	34	1192	1	2023-02-11	3	3.00	240.00	290.00	843.90	145.50
18555	8561	34	1515	1	2022-06-25	3	2.00	110.00	130.00	382.20	58.80
18556	8562	34	397	1	2023-03-13	2	2.00	0.00	0.00	0.00	0.00
18557	8563	269	1004	1	2023-03-30	5	2.00	1330.00	1450.00	7105.00	588.00
18558	8564	1171	974	2	2023-10-25	3	2.00	0.00	0.00	0.00	0.00
18559	8565	1171	1763	2	2023-06-03	6	3.00	200.00	220.00	1280.40	116.40
18560	8566	827	1481	5	2023-01-05	3	2.00	60.00	70.00	205.80	29.40
18561	8567	827	1394	5	2023-07-21	4	4.00	20.00	20.00	76.80	0.00
18562	8568	686	1291	5	2022-07-24	6	2.00	30.00	30.00	176.40	0.00
18563	8569	1172	1592	2	2022-08-30	7	5.00	810.00	970.00	6450.50	1064.00
18564	8570	1172	95	2	2023-02-10	13	5.00	180.00	220.00	2717.00	494.00
18565	8571	1172	852	2	2023-03-19	2	5.00	420.00	480.00	912.00	114.00
18566	8572	541	1118	7	2023-03-04	3	5.00	10.00	10.00	28.50	0.00
18567	8573	188	1094	2	2023-01-05	5	3.00	820.00	1000.00	4850.00	873.00
18568	8574	134	34	5	2023-12-24	2	5.00	20.00	20.00	38.00	0.00
18569	8575	258	970	7	2022-08-10	3	2.00	10.00	10.00	29.40	0.00
18570	8576	760	567	1	2022-02-11	4	3.00	10.00	10.00	38.80	0.00
18571	8577	283	744	5	2023-11-04	1	4.00	90.00	100.00	96.00	9.60
18572	8578	41	336	2	2022-10-10	2	4.00	510.00	610.00	1171.20	192.00
18573	8579	41	231	2	2022-05-20	2	3.00	30.00	30.00	58.20	0.00
18574	8580	226	1797	2	2022-06-26	1	4.00	0.00	0.00	0.00	0.00
18575	8581	1173	1782	1	2023-05-09	3	5.00	10.00	10.00	28.50	0.00
18576	8582	1173	731	1	2022-09-16	2	4.00	10.00	10.00	19.20	0.00
18577	8583	1173	1422	1	2023-03-13	2	2.00	20.00	20.00	39.20	0.00
18578	8584	1173	1765	1	2022-08-06	5	4.00	60.00	70.00	336.00	48.00
18579	8585	1174	829	1	2022-02-17	2	5.00	20.00	20.00	38.00	0.00
18580	8586	71	1086	2	2022-07-30	7	2.00	10.00	10.00	68.60	0.00
18581	8587	19	218	2	2023-05-24	5	2.00	1080.00	1290.00	6321.00	1029.00
18582	8588	19	732	2	2023-01-06	5	3.00	160.00	170.00	824.50	48.50
18583	8589	59	572	2	2022-11-28	2	4.00	50.00	50.00	96.00	0.00
18584	8590	210	80	5	2023-09-11	2	4.00	0.00	0.00	0.00	0.00
18585	8591	1172	1511	5	2022-06-23	3	2.00	10.00	10.00	29.40	0.00
18586	8592	1175	1041	5	2023-02-02	2	2.00	20.00	20.00	39.20	0.00
18587	8593	1175	1722	5	2023-02-09	3	3.00	10.00	10.00	29.10	0.00
18588	8594	307	429	2	2022-06-07	3	5.00	170.00	190.00	541.50	57.00
18589	8595	307	1808	2	2022-06-28	4	5.00	440.00	500.00	1900.00	228.00
18590	8596	386	991	5	2023-01-19	2	3.00	10.00	10.00	19.40	0.00
18591	8597	386	259	5	2023-07-25	1	2.00	30.00	40.00	39.20	9.80
18592	8598	337	1787	2	2023-12-28	4	5.00	70.00	70.00	266.00	0.00
18593	8599	705	752	2	2022-12-31	3	2.00	0.00	0.00	0.00	0.00
18594	8600	705	1026	2	2023-02-10	3	2.00	10.00	10.00	29.40	0.00
18595	8601	705	1267	2	2022-04-11	2	2.00	40.00	40.00	78.40	0.00
18596	8602	705	1317	2	2023-04-14	1	4.00	10.00	10.00	9.60	0.00
18597	8603	1176	1496	7	2022-06-21	7	4.00	410.00	480.00	3225.60	470.40
18598	8604	162	1203	2	2023-03-21	2	4.00	30.00	30.00	57.60	0.00
18599	8605	162	1616	2	2023-03-01	3	5.00	150.00	170.00	484.50	57.00
18600	8606	162	1410	2	2022-08-13	5	2.00	150.00	180.00	882.00	147.00
18601	8607	1177	568	2	2022-09-30	2	4.00	20.00	20.00	38.40	0.00
18602	8608	134	1147	2	2022-12-30	2	4.00	50.00	60.00	115.20	19.20
18603	8609	134	1035	2	2023-10-14	4	5.00	20.00	20.00	76.00	0.00
18604	8610	134	588	2	2023-04-28	2	2.00	290.00	350.00	686.00	117.60
18605	8611	134	771	2	2022-05-07	2	5.00	10.00	10.00	19.00	0.00
18606	8612	1031	1351	1	2022-08-28	5	4.00	60.00	80.00	384.00	96.00
18607	8613	2	398	1	2022-01-26	2	2.00	30.00	40.00	78.40	19.60
18608	8614	454	266	2	2022-02-27	3	2.00	400.00	480.00	1411.20	235.20
18609	8615	267	1648	2	2023-02-10	2	3.00	10.00	10.00	19.40	0.00
18610	8616	267	991	2	2022-05-29	3	2.00	10.00	10.00	29.40	0.00
18611	8617	267	840	2	2022-07-22	2	5.00	70.00	80.00	152.00	19.00
18612	8618	267	730	2	2022-07-11	3	5.00	30.00	40.00	114.00	28.50
18613	8619	351	720	2	2022-10-14	7	2.00	330.00	400.00	2744.00	480.20
18614	8620	25	1570	1	2023-03-16	4	3.00	60.00	70.00	271.60	38.80
18615	8621	442	678	1	2022-12-26	5	4.00	30.00	30.00	144.00	0.00
18616	8622	90	96	2	2022-04-19	2	2.00	20.00	20.00	39.20	0.00
18617	8623	55	254	2	2022-08-19	4	2.00	30.00	40.00	156.80	39.20
18618	8624	484	1081	2	2022-06-22	6	5.00	110.00	120.00	684.00	57.00
18619	8625	484	1131	2	2022-02-25	5	3.00	100.00	110.00	533.50	48.50
18620	8626	116	1222	2	2022-07-21	3	3.00	20.00	20.00	58.20	0.00
18621	8627	213	1248	2	2023-10-13	3	3.00	60.00	70.00	203.70	29.10
18622	8628	213	1543	2	2022-08-16	5	5.00	70.00	90.00	427.50	95.00
18623	8629	213	537	2	2023-04-10	2	4.00	10.00	10.00	19.20	0.00
18624	8630	213	1383	2	2023-12-10	2	3.00	450.00	480.00	931.20	58.20
18625	8631	213	805	2	2023-01-04	4	4.00	10.00	10.00	38.40	0.00
18626	8632	1178	632	5	2022-04-23	5	5.00	160.00	180.00	855.00	95.00
18627	8633	1178	693	5	2022-05-17	6	3.00	1300.00	1370.00	7973.40	407.40
18628	8634	1178	1684	5	2022-01-31	3	3.00	10.00	10.00	29.10	0.00
18629	8635	12	1	2	2022-07-24	2	3.00	120.00	130.00	252.20	19.40
18630	8636	226	1754	5	2023-11-28	5	2.00	150.00	170.00	833.00	98.00
18631	8637	226	547	5	2023-10-19	5	3.00	730.00	830.00	4025.50	485.00
18632	8638	203	64	2	2022-05-15	7	3.00	120.00	140.00	950.60	135.80
18633	8639	1179	1106	5	2022-08-07	5	2.00	320.00	400.00	1960.00	392.00
18634	8640	571	926	1	2022-12-25	3	3.00	10.00	10.00	29.10	0.00
18635	8641	211	693	2	2023-03-16	5	3.00	650.00	760.00	3686.00	533.50
18636	8642	1180	444	7	2023-03-09	6	2.00	60.00	70.00	411.60	58.80
18637	8643	384	295	2	2022-01-21	11	4.00	30.00	30.00	316.80	0.00
18638	8644	384	1622	2	2023-06-22	1	4.00	10.00	10.00	9.60	0.00
18639	8645	384	413	2	2022-07-14	7	4.00	40.00	40.00	268.80	0.00
18640	8646	384	326	2	2022-02-17	1	3.00	0.00	0.00	0.00	0.00
18641	8647	4	168	2	2023-03-19	3	5.00	180.00	190.00	541.50	28.50
18642	8648	902	213	5	2023-08-05	2	3.00	90.00	100.00	194.00	19.40
18643	8649	47	719	2	2022-04-20	5	2.00	620.00	700.00	3430.00	392.00
18644	8650	47	472	2	2023-01-28	3	5.00	30.00	30.00	85.50	0.00
18645	8651	6	1706	7	2023-10-10	5	3.00	10.00	10.00	48.50	0.00
18646	8652	6	284	7	2022-05-02	3	4.00	10.00	10.00	28.80	0.00
18647	8653	6	504	7	2022-06-05	2	3.00	10.00	10.00	19.40	0.00
18648	8654	6	591	7	2022-06-11	2	4.00	170.00	200.00	384.00	57.60
18649	8655	6	1520	7	2023-12-05	4	4.00	130.00	140.00	537.60	38.40
18650	8656	6	1014	7	2022-02-06	2	5.00	110.00	120.00	228.00	19.00
18651	8657	6	1439	7	2022-05-09	1	3.00	40.00	50.00	48.50	9.70
18652	8658	6	1202	7	2022-02-28	2	2.00	20.00	20.00	39.20	0.00
18653	8659	74	808	2	2022-02-17	1	5.00	0.00	0.00	0.00	0.00
18654	8660	110	1409	2	2022-12-28	6	5.00	30.00	30.00	171.00	0.00
18655	8661	3	1104	2	2022-12-07	5	2.00	620.00	720.00	3528.00	490.00
18656	8662	188	1650	2	2023-04-27	4	2.00	20.00	20.00	78.40	0.00
18657	8663	188	958	2	2022-09-19	6	5.00	570.00	620.00	3534.00	285.00
18658	8664	188	601	2	2022-05-31	7	3.00	110.00	130.00	882.70	135.80
18659	8665	788	1156	1	2022-08-15	5	2.00	80.00	90.00	441.00	49.00
18660	8666	337	559	5	2022-10-21	5	5.00	50.00	50.00	237.50	0.00
18661	8667	59	1561	5	2023-06-19	5	3.00	20.00	20.00	97.00	0.00
18662	8668	246	154	1	2022-02-17	4	5.00	60.00	60.00	228.00	0.00
18663	8669	246	1704	1	2023-01-12	1	4.00	10.00	10.00	9.60	0.00
18664	8670	234	1116	1	2023-06-07	4	5.00	20.00	20.00	76.00	0.00
18665	8671	228	1598	1	2023-10-20	3	5.00	170.00	180.00	513.00	28.50
18666	8672	228	236	1	2022-10-31	2	2.00	100.00	120.00	235.20	39.20
18667	8673	172	272	2	2022-07-14	2	3.00	20.00	20.00	38.80	0.00
18668	8674	172	121	2	2022-01-16	3	2.00	560.00	600.00	1764.00	117.60
18669	8675	172	194	2	2022-11-30	3	2.00	40.00	50.00	147.00	29.40
18670	8676	172	513	2	2023-05-11	6	4.00	20.00	30.00	172.80	57.60
18671	8677	172	1007	2	2023-11-16	1	3.00	10.00	10.00	9.70	0.00
18672	8678	1181	1117	5	2022-03-26	5	2.00	420.00	520.00	2548.00	490.00
18673	8679	355	637	1	2023-01-21	8	5.00	10.00	10.00	76.00	0.00
18674	8680	355	686	1	2023-02-12	5	5.00	140.00	160.00	760.00	95.00
18675	8681	868	228	1	2023-09-25	7	2.00	1680.00	2100.00	14406.00	2881.20
18676	8682	868	598	1	2023-07-03	5	5.00	40.00	40.00	190.00	0.00
18677	8683	374	1366	2	2022-04-01	3	3.00	40.00	50.00	145.50	29.10
18678	8684	37	680	2	2022-11-05	2	5.00	10.00	10.00	19.00	0.00
18679	8685	423	428	2	2022-01-04	7	2.00	20.00	20.00	137.20	0.00
18680	8686	424	1230	1	2023-03-26	6	4.00	80.00	100.00	576.00	115.20
18681	8687	2	414	7	2023-10-12	2	4.00	190.00	230.00	441.60	76.80
18682	8688	2	295	7	2023-08-18	5	2.00	20.00	20.00	98.00	0.00
18683	8689	2	911	7	2023-07-06	2	4.00	10.00	10.00	19.20	0.00
18684	8690	59	1217	2	2023-06-07	3	2.00	10.00	10.00	29.40	0.00
18685	8691	169	1016	2	2022-01-03	2	3.00	230.00	260.00	504.40	58.20
18686	8692	169	639	2	2023-09-29	2	4.00	200.00	250.00	480.00	96.00
18687	8693	169	1510	2	2023-10-20	5	2.00	250.00	280.00	1372.00	147.00
18688	8694	258	294	2	2022-09-10	5	5.00	420.00	450.00	2137.50	142.50
18689	8695	1182	549	1	2022-01-05	3	5.00	20.00	20.00	57.00	0.00
18690	8696	427	216	1	2023-12-05	1	2.00	240.00	300.00	294.00	58.80
18691	8697	902	1279	2	2022-09-23	3	2.00	220.00	240.00	705.60	58.80
18692	8698	902	222	2	2022-06-28	4	4.00	30.00	30.00	115.20	0.00
18693	8699	902	1530	2	2022-01-23	2	4.00	110.00	120.00	230.40	19.20
18694	8700	902	755	2	2023-11-25	8	2.00	2080.00	2240.00	17561.60	1254.40
18695	8701	902	361	2	2023-10-25	8	3.00	70.00	80.00	620.80	77.60
18696	8702	902	519	2	2022-07-27	1	2.00	110.00	140.00	137.20	29.40
18697	8703	902	1842	2	2023-04-27	5	2.00	70.00	90.00	441.00	98.00
18698	8704	210	1109	2	2022-03-06	2	4.00	0.00	0.00	0.00	0.00
18699	8705	188	1764	5	2023-06-01	8	2.00	110.00	120.00	940.80	78.40
18700	8706	1176	1836	2	2023-04-15	1	4.00	0.00	0.00	0.00	0.00
18701	8707	44	993	2	2022-12-23	2	4.00	160.00	170.00	326.40	19.20
18702	8708	44	1274	2	2023-02-26	2	2.00	0.00	0.00	0.00	0.00
18703	8709	177	772	5	2022-09-18	4	3.00	60.00	80.00	310.40	77.60
18704	8710	177	575	5	2023-09-16	3	4.00	280.00	310.00	892.80	86.40
18705	8711	177	157	5	2023-03-01	3	3.00	300.00	340.00	989.40	116.40
18706	8712	103	972	2	2022-11-09	3	4.00	510.00	630.00	1814.40	345.60
18707	8713	152	1249	2	2023-12-16	3	3.00	290.00	360.00	1047.60	203.70
18708	8714	248	612	2	2022-11-29	6	5.00	60.00	70.00	399.00	57.00
18709	8715	248	986	2	2023-01-05	5	5.00	30.00	30.00	142.50	0.00
18710	8716	1183	526	1	2022-11-15	1	2.00	0.00	0.00	0.00	0.00
18711	8717	355	1430	1	2022-04-22	4	3.00	50.00	60.00	232.80	38.80
18712	8718	355	699	1	2022-09-17	2	3.00	10.00	10.00	19.40	0.00
18713	8719	355	1274	1	2022-08-10	8	2.00	10.00	10.00	78.40	0.00
18714	8720	355	1642	1	2022-02-09	3	4.00	20.00	20.00	57.60	0.00
18715	8721	355	1632	1	2022-07-20	2	2.00	350.00	380.00	744.80	58.80
18716	8722	355	1191	1	2022-04-29	9	3.00	60.00	70.00	611.10	87.30
18717	8723	355	32	1	2023-09-20	2	4.00	0.00	0.00	0.00	0.00
18718	8724	1184	482	1	2023-01-06	7	3.00	40.00	40.00	271.60	0.00
18719	8725	1184	1715	1	2022-01-20	6	2.00	30.00	30.00	176.40	0.00
18720	8726	68	685	2	2022-11-19	4	2.00	50.00	50.00	196.00	0.00
18721	8727	129	1838	2	2022-02-02	3	3.00	0.00	0.00	0.00	0.00
18722	8728	129	1835	2	2022-11-06	3	3.00	40.00	50.00	145.50	29.10
18723	8729	129	1633	2	2023-02-11	2	2.00	110.00	130.00	254.80	39.20
18724	8730	129	1191	2	2022-05-17	3	2.00	20.00	20.00	58.80	0.00
18725	8731	129	1422	2	2023-05-03	7	2.00	60.00	70.00	480.20	68.60
18726	8732	621	355	2	2023-04-25	3	3.00	50.00	50.00	145.50	0.00
18727	8733	153	1466	1	2023-01-18	3	3.00	20.00	20.00	58.20	0.00
18728	8734	153	452	1	2022-02-28	3	5.00	120.00	130.00	370.50	28.50
18729	8735	153	218	1	2023-03-01	5	2.00	1170.00	1290.00	6321.00	588.00
18730	8736	25	721	1	2023-03-25	4	4.00	60.00	60.00	230.40	0.00
18731	8737	944	519	2	2022-11-28	3	2.00	450.00	540.00	1587.60	264.60
18732	8738	983	807	2	2023-01-09	5	2.00	10.00	10.00	49.00	0.00
18733	8739	12	155	5	2023-12-07	4	3.00	10.00	10.00	38.80	0.00
18734	8740	12	432	5	2022-04-28	2	4.00	60.00	80.00	153.60	38.40
18735	8741	439	1065	5	2023-09-10	5	3.00	60.00	70.00	339.50	48.50
18736	8742	836	176	7	2023-06-04	3	3.00	10.00	10.00	29.10	0.00
18737	8743	1185	94	5	2023-12-14	1	2.00	10.00	10.00	9.80	0.00
18738	8744	1185	177	5	2023-01-26	3	5.00	50.00	50.00	142.50	0.00
18739	8745	1024	19	1	2022-10-21	4	2.00	20.00	20.00	78.40	0.00
18740	8746	1024	1786	1	2022-06-14	3	2.00	50.00	60.00	176.40	29.40
18741	8747	248	794	2	2023-07-26	2	3.00	180.00	210.00	407.40	58.20
18742	8748	248	613	2	2023-05-21	2	5.00	30.00	30.00	57.00	0.00
18743	8749	248	1749	2	2023-06-02	2	5.00	210.00	240.00	456.00	57.00
18744	8750	31	451	5	2022-02-05	3	2.00	2680.00	3050.00	8967.00	1087.80
18745	8751	31	1087	5	2023-01-10	2	5.00	120.00	130.00	247.00	19.00
18746	8752	1117	1843	2	2022-10-26	4	4.00	80.00	90.00	345.60	38.40
18747	8753	1117	1193	2	2022-03-04	3	2.00	170.00	180.00	529.20	29.40
18748	8754	296	1140	5	2022-06-15	6	5.00	20.00	20.00	114.00	0.00
18749	8755	296	807	5	2022-05-30	3	5.00	0.00	0.00	0.00	0.00
18750	8756	296	1125	5	2023-09-22	2	4.00	10.00	10.00	19.20	0.00
18751	8757	702	552	2	2022-09-20	2	5.00	40.00	40.00	76.00	0.00
18752	8758	702	261	2	2022-12-31	8	4.00	40.00	50.00	384.00	76.80
18753	8759	702	646	2	2022-06-02	3	2.00	30.00	30.00	88.20	0.00
18754	8760	702	752	2	2023-01-14	3	3.00	10.00	10.00	29.10	0.00
18755	8761	1186	451	2	2023-10-21	1	3.00	1080.00	1270.00	1231.90	184.30
18756	8762	1186	1359	2	2022-12-16	8	5.00	120.00	130.00	988.00	76.00
18757	8763	579	769	2	2022-11-23	1	5.00	10.00	10.00	9.50	0.00
18758	8764	579	1353	2	2023-07-08	2	2.00	20.00	30.00	58.80	19.60
18759	8765	275	1217	2	2023-03-15	2	4.00	10.00	10.00	19.20	0.00
18760	8766	275	16	2	2022-11-09	2	3.00	0.00	0.00	0.00	0.00
18761	8767	275	1837	2	2022-01-20	3	3.00	20.00	20.00	58.20	0.00
18762	8768	275	417	2	2023-03-31	5	5.00	10.00	10.00	47.50	0.00
18763	8769	51	294	2	2022-10-19	4	3.00	230.00	290.00	1125.20	232.80
18764	8770	677	1751	7	2023-10-24	3	5.00	130.00	150.00	427.50	57.00
18765	8771	677	793	7	2023-08-13	4	2.00	70.00	80.00	313.60	39.20
18766	8772	904	1219	5	2022-02-04	4	4.00	770.00	940.00	3609.60	652.80
18767	8773	904	1031	5	2022-01-02	3	4.00	60.00	70.00	201.60	28.80
18768	8774	126	567	2	2022-09-14	6	5.00	30.00	30.00	171.00	0.00
18769	8775	126	1283	2	2023-06-13	2	3.00	10.00	10.00	19.40	0.00
18770	8776	39	148	1	2022-06-02	2	5.00	0.00	0.00	0.00	0.00
18771	8777	586	663	5	2023-05-26	5	2.00	500.00	530.00	2597.00	147.00
18772	8778	586	1441	5	2023-10-20	8	5.00	40.00	40.00	304.00	0.00
18773	8779	25	575	2	2023-10-20	3	2.00	260.00	290.00	852.60	88.20
18774	8780	208	763	1	2023-07-06	3	5.00	30.00	30.00	85.50	0.00
18775	8781	165	1262	5	2023-07-15	2	2.00	50.00	60.00	117.60	19.60
18776	8782	165	790	5	2022-07-20	6	4.00	1010.00	1230.00	7084.80	1267.20
18777	8783	1187	1207	2	2023-05-12	4	4.00	20.00	20.00	76.80	0.00
18778	8784	1187	216	2	2022-01-19	3	5.00	950.00	1130.00	3220.50	513.00
18779	8785	942	1187	2	2023-03-19	2	2.00	0.00	0.00	0.00	0.00
18780	8786	762	1693	2	2022-11-23	5	2.00	180.00	200.00	980.00	98.00
18781	8787	762	1484	2	2023-12-28	3	5.00	20.00	20.00	57.00	0.00
18782	8788	762	107	2	2023-05-02	4	4.00	230.00	270.00	1036.80	153.60
18783	8789	913	1004	2	2022-09-12	3	2.00	640.00	700.00	2058.00	176.40
18784	8790	913	1196	2	2023-03-24	2	2.00	70.00	80.00	156.80	19.60
18785	8791	868	1473	2	2023-05-14	9	5.00	50.00	50.00	427.50	0.00
18786	8792	188	665	2	2022-04-13	7	3.00	510.00	540.00	3666.60	203.70
18787	8793	177	574	5	2023-02-05	2	4.00	10.00	10.00	19.20	0.00
18788	8794	177	486	5	2022-08-19	5	5.00	20.00	20.00	95.00	0.00
18789	8795	177	1286	5	2023-06-21	5	4.00	520.00	580.00	2784.00	288.00
18790	8796	177	666	5	2023-08-10	4	4.00	170.00	210.00	806.40	153.60
18791	8797	13	491	2	2023-12-03	2	4.00	10.00	10.00	19.20	0.00
18792	8798	13	1244	2	2022-03-23	2	5.00	50.00	50.00	95.00	0.00
18793	8799	1188	1368	2	2022-06-24	5	5.00	1170.00	1290.00	6127.50	570.00
18794	8800	71	307	5	2023-12-09	5	2.00	1440.00	1800.00	8820.00	1764.00
18795	8801	74	1284	2	2022-03-21	2	5.00	10.00	10.00	19.00	0.00
18796	8802	500	1721	5	2022-12-01	2	4.00	200.00	220.00	422.40	38.40
18797	8803	500	1107	5	2023-07-10	2	3.00	270.00	340.00	659.60	135.80
18798	8804	49	568	5	2023-08-25	3	3.00	20.00	30.00	87.30	29.10
18799	8805	49	166	5	2023-11-30	3	4.00	20.00	20.00	57.60	0.00
18800	8806	967	1161	2	2022-11-19	3	4.00	80.00	100.00	288.00	57.60
18801	8807	1189	1703	2	2023-11-06	2	4.00	40.00	40.00	76.80	0.00
18802	8808	71	806	2	2023-05-24	3	4.00	30.00	30.00	86.40	0.00
18803	8809	71	1256	2	2023-08-01	5	4.00	110.00	120.00	576.00	48.00
18804	8810	71	933	2	2022-01-04	5	2.00	10.00	10.00	49.00	0.00
18805	8811	351	946	2	2022-10-21	4	4.00	30.00	40.00	153.60	38.40
18806	8812	753	1144	2	2022-03-23	3	5.00	170.00	210.00	598.50	114.00
18807	8813	753	1623	2	2022-09-29	5	4.00	10.00	10.00	48.00	0.00
18808	8814	757	638	2	2022-12-30	3	4.00	230.00	270.00	777.60	115.20
18809	8815	53	349	1	2022-12-24	2	4.00	280.00	310.00	595.20	57.60
18810	8816	53	1844	1	2023-03-16	6	4.00	30.00	40.00	230.40	57.60
18811	8817	53	170	1	2023-05-22	4	4.00	10.00	10.00	38.40	0.00
18812	8818	53	1452	1	2023-06-19	2	4.00	20.00	20.00	38.40	0.00
18813	8819	53	491	1	2023-08-15	6	2.00	40.00	40.00	235.20	0.00
18814	8820	132	657	2	2023-02-03	4	4.00	320.00	340.00	1305.60	76.80
18815	8821	652	456	2	2022-01-21	2	3.00	880.00	960.00	1862.40	155.20
18816	8822	652	1283	2	2023-02-16	2	3.00	0.00	0.00	0.00	0.00
18817	8823	652	1754	2	2022-10-28	2	3.00	50.00	60.00	116.40	19.40
18818	8824	652	712	2	2022-02-22	2	5.00	10.00	10.00	19.00	0.00
18819	8825	1161	437	1	2023-10-07	3	2.00	10.00	10.00	29.40	0.00
18820	8826	71	1187	5	2023-01-03	3	5.00	10.00	10.00	28.50	0.00
18821	8827	141	482	1	2023-02-26	5	3.00	30.00	30.00	145.50	0.00
18822	8828	141	1775	1	2022-05-06	7	2.00	30.00	30.00	205.80	0.00
18823	8829	1190	1158	2	2022-03-03	2	5.00	10.00	10.00	19.00	0.00
18824	8830	488	1663	5	2023-12-09	2	4.00	310.00	390.00	748.80	153.60
18825	8831	411	808	1	2022-04-05	10	5.00	20.00	30.00	285.00	95.00
18826	8832	350	562	2	2022-06-04	2	2.00	40.00	40.00	78.40	0.00
18827	8833	181	693	2	2023-04-30	2	3.00	1110.00	1220.00	2366.80	213.40
18828	8834	1191	1019	2	2022-11-25	1	5.00	20.00	20.00	19.00	0.00
18829	8835	1191	1518	2	2023-12-09	2	5.00	80.00	90.00	171.00	19.00
18830	8836	1191	1743	2	2023-07-21	4	5.00	10.00	10.00	38.00	0.00
18831	8837	1191	754	2	2022-09-29	3	5.00	10.00	10.00	28.50	0.00
18832	8838	1191	366	2	2023-08-03	5	3.00	20.00	20.00	97.00	0.00
18833	8839	351	1560	1	2022-11-21	3	4.00	60.00	70.00	201.60	28.80
18834	8840	351	103	1	2022-10-27	2	4.00	60.00	70.00	134.40	19.20
18835	8841	351	1337	1	2022-08-07	3	5.00	260.00	300.00	855.00	114.00
18836	8842	111	247	2	2022-03-28	3	4.00	80.00	90.00	259.20	28.80
18837	8843	111	789	2	2022-08-26	2	2.00	20.00	30.00	58.80	19.60
18838	8844	217	1679	1	2023-05-26	5	4.00	70.00	70.00	336.00	0.00
18839	8845	51	1233	2	2022-12-15	3	2.00	10.00	10.00	29.40	0.00
18840	8846	51	132	2	2023-01-03	3	5.00	0.00	0.00	0.00	0.00
18841	8847	51	394	2	2022-08-25	5	5.00	80.00	90.00	427.50	47.50
18842	8848	51	724	2	2022-08-04	2	2.00	110.00	130.00	254.80	39.20
18843	8849	904	919	5	2022-09-23	1	5.00	60.00	70.00	66.50	9.50
18844	8850	904	892	5	2023-05-19	10	2.00	150.00	160.00	1568.00	98.00
18845	8851	904	545	5	2022-02-13	2	5.00	0.00	0.00	0.00	0.00
18846	8852	904	708	5	2023-01-19	2	3.00	10.00	10.00	19.40	0.00
18847	8853	383	1020	1	2022-03-19	4	5.00	100.00	120.00	456.00	76.00
18848	8854	130	1206	5	2023-11-10	5	2.00	50.00	60.00	294.00	49.00
18849	8855	130	218	5	2023-11-26	3	5.00	590.00	620.00	1767.00	85.50
18850	8856	1192	214	2	2023-01-19	3	4.00	20.00	20.00	57.60	0.00
18851	8857	745	344	2	2022-02-25	6	4.00	170.00	210.00	1209.60	230.40
18852	8858	745	1432	2	2022-07-24	2	5.00	20.00	30.00	57.00	19.00
18853	8859	745	451	2	2022-01-25	5	5.00	4060.00	5080.00	24130.00	4845.00
18854	8860	336	1518	2	2022-08-06	1	3.00	30.00	40.00	38.80	9.70
18855	8861	1193	1656	2	2023-08-22	3	4.00	20.00	30.00	86.40	28.80
18856	8862	1193	1349	2	2023-11-23	4	5.00	10.00	10.00	38.00	0.00
18857	8863	1193	271	2	2022-03-22	4	5.00	200.00	210.00	798.00	38.00
18858	8864	1193	1110	2	2022-04-29	4	2.00	90.00	110.00	431.20	78.40
18859	8865	1193	1651	2	2023-01-16	6	3.00	30.00	40.00	232.80	58.20
18860	8866	121	1205	2	2023-07-09	3	2.00	30.00	40.00	117.60	29.40
18861	8867	194	1602	5	2023-03-21	5	5.00	460.00	490.00	2327.50	142.50
18862	8868	194	1092	5	2022-09-03	2	5.00	10.00	10.00	19.00	0.00
18863	8869	103	1772	2	2023-12-25	2	5.00	620.00	690.00	1311.00	133.00
18864	8870	153	1407	2	2023-07-22	5	3.00	20.00	20.00	97.00	0.00
18865	8871	153	326	2	2022-07-08	12	3.00	60.00	70.00	814.80	116.40
18866	8872	153	274	2	2023-12-03	4	3.00	460.00	540.00	2095.20	310.40
18867	8873	51	1845	7	2022-02-13	2	4.00	90.00	100.00	192.00	19.20
18868	8874	51	472	7	2022-05-26	2	4.00	20.00	20.00	38.40	0.00
18869	8875	141	716	1	2023-10-18	5	4.00	20.00	20.00	96.00	0.00
18870	8876	1018	414	2	2022-11-08	2	2.00	160.00	190.00	372.40	58.80
18871	8877	1018	1219	2	2023-12-14	1	4.00	60.00	60.00	57.60	0.00
18872	8878	109	1846	2	2023-05-21	4	2.00	400.00	480.00	1881.60	313.60
18873	8879	109	76	2	2022-04-07	3	5.00	30.00	30.00	85.50	0.00
18874	8880	177	162	5	2023-03-13	11	2.00	170.00	190.00	2048.20	215.60
18875	8881	177	1106	5	2023-02-07	3	5.00	200.00	240.00	684.00	114.00
18876	8882	224	1045	1	2023-02-08	7	4.00	40.00	50.00	336.00	67.20
18877	8883	38	1558	2	2023-08-25	2	2.00	20.00	20.00	39.20	0.00
18878	8884	38	458	2	2023-01-23	3	4.00	10.00	10.00	28.80	0.00
18879	8885	57	305	2	2022-04-04	4	4.00	10.00	10.00	38.40	0.00
18880	8886	57	1311	2	2022-11-03	3	5.00	0.00	0.00	0.00	0.00
18881	8887	57	531	2	2023-05-20	8	4.00	20.00	20.00	153.60	0.00
18882	8888	2	943	1	2023-02-05	2	5.00	250.00	280.00	532.00	57.00
18883	8889	1194	584	2	2022-04-27	9	4.00	570.00	630.00	5443.20	518.40
18884	8890	1195	1335	1	2023-08-16	3	3.00	370.00	450.00	1309.50	232.80
18885	8891	1195	1342	1	2022-04-18	7	4.00	1640.00	1930.00	12969.60	1948.80
18886	8892	402	65	5	2023-01-15	2	5.00	100.00	120.00	228.00	38.00
18887	8893	449	874	2	2022-04-22	9	5.00	2390.00	2680.00	22914.00	2479.50
18888	8894	1048	1111	2	2023-12-24	2	3.00	430.00	490.00	950.60	116.40
18889	8895	27	576	2	2023-06-24	3	3.00	290.00	310.00	902.10	58.20
18890	8896	27	1199	2	2022-05-22	3	3.00	20.00	20.00	58.20	0.00
18891	8897	27	303	2	2023-12-21	3	4.00	150.00	170.00	489.60	57.60
18892	8898	27	946	2	2022-08-03	4	3.00	40.00	40.00	155.20	0.00
18893	8899	280	1406	1	2022-04-13	3	2.00	440.00	490.00	1440.60	147.00
18894	8900	280	1352	1	2022-06-25	2	5.00	20.00	30.00	57.00	19.00
18895	8901	172	1832	2	2022-08-23	3	3.00	20.00	30.00	87.30	29.10
18896	8902	172	1829	2	2023-03-22	4	4.00	20.00	20.00	76.80	0.00
18897	8903	172	1456	2	2022-08-03	3	4.00	160.00	190.00	547.20	86.40
18898	8904	172	748	2	2023-01-16	2	4.00	10.00	10.00	19.20	0.00
18899	8905	44	934	7	2023-05-30	1	5.00	30.00	30.00	28.50	0.00
18900	8906	44	1387	7	2023-10-22	3	4.00	30.00	30.00	86.40	0.00
18901	8907	44	145	7	2022-01-22	9	2.00	70.00	80.00	705.60	88.20
18902	8908	111	180	5	2023-03-11	7	2.00	60.00	70.00	480.20	68.60
18903	8909	1196	1275	2	2023-03-08	8	3.00	150.00	180.00	1396.80	232.80
18904	8910	422	149	2	2023-04-30	3	2.00	20.00	20.00	58.80	0.00
18905	8911	684	435	2	2022-11-01	3	3.00	100.00	100.00	291.00	0.00
18906	8912	684	1778	2	2022-11-15	9	3.00	120.00	140.00	1222.20	174.60
18907	8913	684	991	2	2022-11-08	2	2.00	0.00	0.00	0.00	0.00
18908	8914	684	1039	2	2023-08-01	2	4.00	0.00	0.00	0.00	0.00
18909	8915	466	519	2	2023-12-31	6	3.00	720.00	860.00	5005.20	814.80
18910	8916	466	92	2	2022-01-04	4	4.00	10.00	10.00	38.40	0.00
18911	8917	466	1713	2	2023-09-10	4	5.00	50.00	50.00	190.00	0.00
18912	8918	466	137	2	2022-11-15	2	5.00	80.00	80.00	152.00	0.00
18913	8919	466	1088	2	2023-08-23	6	5.00	20.00	20.00	114.00	0.00
18914	8920	309	1741	2	2023-06-27	2	3.00	150.00	180.00	349.20	58.20
18915	8921	1197	1106	2	2022-12-12	2	4.00	140.00	160.00	307.20	38.40
18916	8922	1198	1514	2	2022-11-08	3	2.00	50.00	50.00	147.00	0.00
18917	8923	1198	764	2	2023-02-25	3	5.00	10.00	10.00	28.50	0.00
18918	8924	742	32	2	2023-12-06	4	5.00	0.00	0.00	0.00	0.00
18919	8925	774	1847	2	2022-07-25	4	5.00	1320.00	1440.00	5472.00	456.00
18920	8926	774	615	2	2023-04-02	3	2.00	0.00	0.00	0.00	0.00
18921	8927	774	490	2	2022-06-25	3	4.00	570.00	630.00	1814.40	172.80
18922	8928	237	1168	1	2022-10-07	5	2.00	90.00	100.00	490.00	49.00
18923	8929	648	563	2	2023-04-27	4	5.00	570.00	610.00	2318.00	152.00
18924	8930	648	1001	2	2023-03-18	2	5.00	170.00	210.00	399.00	76.00
18925	8931	648	836	2	2023-08-19	3	2.00	200.00	240.00	705.60	117.60
18926	8932	269	1802	2	2022-06-18	5	2.00	80.00	100.00	490.00	98.00
18927	8933	269	1600	2	2023-11-23	3	2.00	30.00	30.00	88.20	0.00
18928	8934	254	905	2	2023-02-03	2	4.00	20.00	20.00	38.40	0.00
18929	8935	86	1158	7	2022-09-09	3	4.00	10.00	10.00	28.80	0.00
18930	8936	86	296	7	2022-10-07	14	4.00	970.00	1120.00	15052.80	2016.00
18931	8937	204	895	1	2022-08-31	5	3.00	170.00	200.00	970.00	145.50
18932	8938	204	1496	1	2023-08-30	2	4.00	130.00	140.00	268.80	19.20
18933	8939	204	170	1	2023-11-08	5	2.00	20.00	20.00	98.00	0.00
18934	8940	204	921	1	2022-02-16	2	4.00	80.00	90.00	172.80	19.20
18935	8941	750	1848	1	2022-06-06	3	3.00	10.00	10.00	29.10	0.00
18936	8942	113	923	5	2023-04-24	7	5.00	0.00	0.00	0.00	0.00
18937	8943	113	1849	5	2023-10-02	3	5.00	150.00	180.00	513.00	85.50
18938	8944	623	1757	2	2023-04-01	3	2.00	200.00	240.00	705.60	117.60
18939	8945	427	1398	5	2022-04-22	3	5.00	150.00	160.00	456.00	28.50
18940	8946	111	504	1	2022-01-05	3	2.00	10.00	10.00	29.40	0.00
18941	8947	403	1194	2	2022-04-01	3	3.00	20.00	20.00	58.20	0.00
18942	8948	403	1700	2	2023-12-07	5	4.00	10.00	10.00	48.00	0.00
18943	8949	103	1804	5	2023-07-04	1	3.00	10.00	10.00	9.70	0.00
18944	8950	410	258	2	2023-08-20	6	5.00	820.00	930.00	5301.00	627.00
18945	8951	410	826	2	2022-05-24	2	5.00	50.00	50.00	95.00	0.00
18946	8952	410	377	2	2022-07-09	3	2.00	30.00	30.00	88.20	0.00
18947	8953	410	1025	2	2022-01-20	7	5.00	20.00	20.00	133.00	0.00
18948	8954	410	668	2	2022-12-08	5	3.00	60.00	60.00	291.00	0.00
18949	8955	164	1196	1	2022-05-11	4	3.00	130.00	160.00	620.80	116.40
18950	8956	841	1533	2	2023-03-11	2	3.00	10.00	10.00	19.40	0.00
18951	8957	629	1458	5	2022-04-27	3	4.00	20.00	20.00	57.60	0.00
18952	8958	629	1846	5	2022-06-21	2	2.00	110.00	120.00	235.20	19.60
18953	8959	35	930	2	2022-10-08	5	2.00	270.00	300.00	1470.00	147.00
18954	8960	35	1528	2	2023-03-26	5	3.00	60.00	70.00	339.50	48.50
18955	8961	35	857	2	2022-10-18	5	5.00	760.00	850.00	4037.50	427.50
18956	8962	35	1664	2	2023-02-26	4	2.00	20.00	20.00	78.40	0.00
18957	8963	931	1370	5	2023-07-20	2	3.00	220.00	270.00	523.80	97.00
18958	8964	931	633	5	2023-11-18	3	4.00	90.00	90.00	259.20	0.00
18959	8965	931	1815	5	2023-06-24	5	4.00	620.00	760.00	3648.00	672.00
18960	8966	35	745	2	2023-07-03	2	4.00	0.00	0.00	0.00	0.00
18961	8967	285	294	2	2023-08-06	1	3.00	60.00	70.00	67.90	9.70
18962	8968	285	371	2	2023-05-17	7	3.00	380.00	470.00	3191.30	611.10
18963	8969	33	1167	5	2023-07-25	1	5.00	30.00	40.00	38.00	9.50
18964	8970	514	449	2	2023-09-04	9	4.00	20.00	20.00	172.80	0.00
18965	8971	514	723	2	2023-11-16	2	3.00	130.00	150.00	291.00	38.80
18966	8972	383	663	2	2023-06-13	2	5.00	250.00	270.00	513.00	38.00
18967	8973	210	1090	5	2022-01-04	1	3.00	40.00	50.00	48.50	9.70
18968	8974	204	267	1	2023-04-28	7	5.00	320.00	340.00	2261.00	133.00
18969	8975	93	1232	5	2022-10-02	7	4.00	40.00	40.00	268.80	0.00
18970	8976	93	1439	5	2023-04-01	2	2.00	70.00	80.00	156.80	19.60
18971	8977	93	963	5	2022-03-17	1	4.00	120.00	130.00	124.80	9.60
18972	8978	93	786	5	2023-07-21	2	2.00	10.00	10.00	19.60	0.00
18973	8979	1156	615	1	2022-11-18	2	5.00	10.00	10.00	19.00	0.00
18974	8980	89	481	1	2023-11-03	1	2.00	0.00	0.00	0.00	0.00
18975	8981	1199	1404	1	2023-07-14	2	4.00	10.00	10.00	19.20	0.00
18976	8982	118	1035	2	2023-06-10	3	3.00	0.00	0.00	0.00	0.00
18977	8983	118	871	2	2022-08-26	4	5.00	0.00	0.00	0.00	0.00
18978	8984	118	125	2	2022-11-27	5	4.00	140.00	160.00	768.00	96.00
18979	8985	118	1343	2	2023-10-05	2	3.00	130.00	150.00	291.00	38.80
18980	8986	312	597	2	2023-08-02	3	4.00	70.00	80.00	230.40	28.80
18981	8987	312	1243	2	2023-07-25	5	2.00	80.00	100.00	490.00	98.00
18982	8988	312	195	2	2023-06-26	2	5.00	90.00	110.00	209.00	38.00
18983	8989	312	513	2	2023-04-05	2	2.00	10.00	10.00	19.60	0.00
18984	8990	773	1574	2	2022-01-29	2	5.00	10.00	10.00	19.00	0.00
18985	8991	773	1294	2	2023-09-14	7	3.00	4360.00	4900.00	33271.00	3666.60
18986	8992	258	342	2	2022-02-15	5	5.00	90.00	100.00	475.00	47.50
18987	8993	789	104	2	2022-10-29	2	3.00	20.00	20.00	38.80	0.00
18988	8994	789	1300	2	2022-03-22	7	4.00	1670.00	1880.00	12633.60	1411.20
18989	8995	802	1842	5	2023-07-13	5	5.00	80.00	90.00	427.50	47.50
18990	8996	802	514	5	2022-03-28	5	5.00	130.00	150.00	712.50	95.00
18991	8997	452	723	5	2022-01-07	2	4.00	30.00	40.00	76.80	19.20
18992	8998	188	259	7	2023-02-08	2	2.00	50.00	60.00	117.60	19.60
18993	8999	188	127	7	2022-07-15	7	4.00	230.00	270.00	1814.40	268.80
18994	9000	243	542	2	2023-10-03	5	4.00	410.00	460.00	2208.00	240.00
18995	9001	55	1317	7	2023-02-18	3	4.00	10.00	10.00	28.80	0.00
18996	9002	844	1629	2	2023-11-21	1	5.00	10.00	10.00	9.50	0.00
18997	9003	844	728	2	2022-05-09	3	5.00	20.00	20.00	57.00	0.00
18998	9004	475	98	7	2022-03-14	6	2.00	220.00	240.00	1411.20	117.60
18999	9005	475	1702	7	2022-05-13	8	2.00	20.00	20.00	156.80	0.00
19000	9006	269	422	7	2023-08-15	6	5.00	80.00	90.00	513.00	57.00
19001	9007	269	118	7	2023-01-22	1	5.00	30.00	40.00	38.00	9.50
19002	9008	269	1648	7	2023-04-21	2	4.00	10.00	10.00	19.20	0.00
19003	9009	269	397	7	2022-09-09	2	4.00	10.00	10.00	19.20	0.00
19004	9010	478	1447	2	2023-12-10	1	4.00	0.00	0.00	0.00	0.00
19005	9011	956	1505	2	2022-02-25	4	5.00	30.00	30.00	114.00	0.00
19006	9012	522	726	5	2022-09-20	2	2.00	90.00	100.00	196.00	19.60
19007	9013	213	276	5	2022-05-25	7	2.00	110.00	140.00	960.40	205.80
19008	9014	177	1623	2	2023-10-20	5	5.00	10.00	10.00	47.50	0.00
19009	9015	177	777	2	2023-09-01	5	4.00	20.00	20.00	96.00	0.00
19010	9016	620	675	2	2022-10-25	2	3.00	10.00	10.00	19.40	0.00
19011	9017	620	1396	2	2022-07-19	1	4.00	10.00	10.00	9.60	0.00
19012	9018	970	1018	1	2022-09-03	3	2.00	20.00	20.00	58.80	0.00
19013	9019	970	21	1	2022-07-06	3	3.00	20.00	20.00	58.20	0.00
19014	9020	30	960	1	2022-07-01	2	5.00	90.00	100.00	190.00	19.00
19015	9021	30	876	1	2023-09-06	6	2.00	30.00	30.00	176.40	0.00
19016	9022	327	1161	2	2023-11-27	13	3.00	160.00	170.00	2143.70	126.10
19017	9023	572	515	5	2022-04-05	3	4.00	80.00	100.00	288.00	57.60
19018	9024	104	542	5	2023-06-03	1	4.00	110.00	120.00	115.20	9.60
19019	9025	49	1696	2	2022-03-17	3	5.00	20.00	20.00	57.00	0.00
19020	9026	49	1482	2	2023-08-10	4	5.00	110.00	140.00	532.00	114.00
19021	9027	49	981	2	2022-08-14	3	4.00	30.00	40.00	115.20	28.80
19022	9028	1200	628	2	2022-09-12	3	2.00	10.00	10.00	29.40	0.00
19023	9029	1200	442	2	2023-06-12	3	3.00	160.00	190.00	552.90	87.30
19024	9030	289	531	2	2023-09-30	2	3.00	10.00	10.00	19.40	0.00
19025	9031	237	1153	7	2022-05-13	4	4.00	270.00	310.00	1190.40	153.60
19026	9032	237	224	7	2022-11-30	4	3.00	240.00	280.00	1086.40	155.20
19027	9033	286	2	2	2023-01-04	2	4.00	460.00	490.00	940.80	57.60
19028	9034	182	1177	2	2022-05-28	2	4.00	1450.00	1790.00	3436.80	652.80
19029	9035	230	1391	2	2022-12-09	4	5.00	0.00	0.00	0.00	0.00
19030	9036	230	152	2	2022-12-15	4	5.00	100.00	110.00	418.00	38.00
19031	9037	134	1010	5	2022-04-29	4	4.00	30.00	30.00	115.20	0.00
19032	9038	134	1012	5	2023-04-02	2	5.00	20.00	20.00	38.00	0.00
19033	9039	141	462	7	2022-04-16	3	2.00	50.00	60.00	176.40	29.40
19034	9040	638	693	2	2023-02-25	13	5.00	8410.00	9890.00	122141.50	18278.00
19035	9041	1038	1117	2	2023-11-30	1	5.00	60.00	70.00	66.50	9.50
19036	9042	802	1806	2	2023-11-11	4	5.00	270.00	340.00	1292.00	266.00
19037	9043	19	565	1	2022-06-04	3	5.00	60.00	60.00	171.00	0.00
19038	9044	60	332	2	2023-08-02	3	2.00	450.00	480.00	1411.20	88.20
19039	9045	532	1391	1	2022-01-26	2	2.00	10.00	10.00	19.60	0.00
19040	9046	532	1303	1	2023-08-12	5	2.00	160.00	190.00	931.00	147.00
19041	9047	532	633	1	2023-07-28	5	4.00	140.00	150.00	720.00	48.00
19042	9048	532	759	1	2023-08-24	5	4.00	30.00	30.00	144.00	0.00
19043	9049	532	1761	1	2023-01-08	3	3.00	30.00	40.00	116.40	29.10
19044	9050	304	667	2	2022-07-09	3	4.00	60.00	70.00	201.60	28.80
19045	9051	351	363	2	2023-01-06	2	5.00	10.00	10.00	19.00	0.00
19046	9052	60	1246	1	2023-03-30	2	3.00	0.00	0.00	0.00	0.00
19047	9053	60	45	1	2023-12-22	4	3.00	30.00	30.00	116.40	0.00
19048	9054	60	1764	1	2023-11-12	2	5.00	30.00	30.00	57.00	0.00
19049	9055	268	134	2	2023-06-14	2	4.00	20.00	20.00	38.40	0.00
19050	9056	6	917	1	2023-12-05	2	2.00	20.00	20.00	39.20	0.00
19051	9057	304	1803	5	2022-02-07	11	2.00	2100.00	2620.00	28243.60	5605.60
19052	9058	70	1681	2	2023-03-08	7	4.00	60.00	70.00	470.40	67.20
19053	9059	70	1747	2	2022-08-13	3	5.00	310.00	360.00	1026.00	142.50
19054	9060	237	899	2	2022-12-17	7	4.00	940.00	1120.00	7526.40	1209.60
19055	9061	841	913	5	2022-01-06	4	2.00	80.00	90.00	352.80	39.20
19056	9062	841	50	5	2023-02-15	4	4.00	40.00	50.00	192.00	38.40
19057	9063	49	830	2	2023-08-14	6	5.00	30.00	40.00	228.00	57.00
19058	9064	194	1324	2	2023-06-26	13	3.00	290.00	320.00	4035.20	378.30
19059	9065	194	186	2	2023-02-18	3	3.00	0.00	0.00	0.00	0.00
19060	9066	194	1332	2	2023-05-02	4	4.00	20.00	20.00	76.80	0.00
19061	9067	462	1576	2	2023-07-23	2	5.00	20.00	20.00	38.00	0.00
19062	9068	354	1410	2	2023-09-29	2	5.00	70.00	90.00	171.00	38.00
19063	9069	145	52	1	2023-12-05	3	2.00	180.00	220.00	646.80	117.60
19064	9070	145	1665	1	2022-07-22	3	4.00	60.00	70.00	201.60	28.80
19065	9071	325	284	5	2022-06-01	3	3.00	10.00	10.00	29.10	0.00
19066	9072	221	577	2	2022-04-19	2	5.00	20.00	20.00	38.00	0.00
19067	9073	496	1452	2	2023-10-19	2	5.00	20.00	20.00	38.00	0.00
19068	9074	496	202	2	2022-05-27	5	3.00	240.00	280.00	1358.00	194.00
19069	9075	571	943	2	2023-08-29	6	5.00	700.00	830.00	4731.00	741.00
19070	9076	1067	386	5	2022-09-17	3	2.00	10.00	10.00	29.40	0.00
19071	9077	1067	1769	5	2023-05-28	4	5.00	30.00	30.00	114.00	0.00
19072	9078	644	1049	2	2022-04-06	3	4.00	70.00	90.00	259.20	57.60
19073	9079	1	125	2	2022-08-29	4	4.00	280.00	320.00	1228.80	153.60
19074	9080	1	327	2	2022-08-03	1	3.00	10.00	10.00	9.70	0.00
19075	9081	1201	994	1	2023-12-13	6	5.00	130.00	140.00	798.00	57.00
19076	9082	1201	1010	1	2022-03-09	3	3.00	20.00	20.00	58.20	0.00
19077	9083	30	22	2	2023-06-19	2	5.00	10.00	10.00	19.00	0.00
19078	9084	1115	1167	5	2022-10-09	3	4.00	140.00	150.00	432.00	28.80
19079	9085	1115	151	5	2022-10-17	5	5.00	30.00	30.00	142.50	0.00
19080	9086	14	1592	1	2022-09-27	2	2.00	270.00	280.00	548.80	19.60
19081	9087	34	1779	2	2022-01-05	2	4.00	80.00	90.00	172.80	19.20
19082	9088	34	71	2	2023-10-17	5	4.00	370.00	450.00	2160.00	384.00
19083	9089	238	240	2	2022-06-20	3	4.00	240.00	250.00	720.00	28.80
19084	9090	197	236	1	2023-09-15	5	2.00	280.00	300.00	1470.00	98.00
19085	9091	226	124	5	2023-08-25	8	2.00	330.00	350.00	2744.00	156.80
19086	9092	642	90	1	2023-08-02	3	3.00	20.00	20.00	58.20	0.00
19087	9093	642	1163	1	2022-05-19	6	5.00	440.00	480.00	2736.00	228.00
19088	9094	166	1502	2	2022-01-21	2	3.00	250.00	300.00	582.00	97.00
19089	9095	166	1081	2	2022-12-31	6	3.00	330.00	400.00	2328.00	407.40
19090	9096	166	1021	2	2023-04-20	2	3.00	30.00	40.00	77.60	19.40
19091	9097	166	1723	2	2023-12-16	7	5.00	30.00	30.00	199.50	0.00
19092	9098	779	731	2	2023-07-18	5	4.00	30.00	30.00	144.00	0.00
19093	9099	541	666	2	2022-06-29	7	2.00	350.00	370.00	2538.20	137.20
19094	9100	541	549	2	2022-02-21	2	4.00	10.00	10.00	19.20	0.00
19095	9101	541	765	2	2022-01-02	3	3.00	750.00	790.00	2298.90	116.40
19096	9102	188	33	2	2022-08-22	3	3.00	20.00	20.00	58.20	0.00
19097	9103	188	46	2	2023-08-04	2	5.00	70.00	80.00	152.00	19.00
19098	9104	188	1526	2	2023-12-22	5	5.00	50.00	60.00	285.00	47.50
19099	9105	188	28	2	2022-10-13	10	2.00	30.00	30.00	294.00	0.00
19100	9106	188	1668	2	2022-09-04	2	3.00	150.00	180.00	349.20	58.20
19101	9107	188	1617	2	2022-07-22	3	4.00	250.00	290.00	835.20	115.20
19102	9108	617	1353	5	2022-04-27	2	5.00	20.00	20.00	38.00	0.00
19103	9109	617	1216	5	2022-09-04	7	5.00	30.00	30.00	199.50	0.00
19104	9110	617	1302	5	2023-10-22	2	5.00	180.00	210.00	399.00	57.00
19105	9111	1202	1048	5	2023-06-13	5	4.00	40.00	40.00	192.00	0.00
19106	9112	1202	1691	5	2023-09-26	2	2.00	20.00	20.00	39.20	0.00
19107	9113	1202	1820	5	2022-09-09	4	3.00	290.00	320.00	1241.60	116.40
19108	9114	1202	882	5	2023-03-13	3	3.00	20.00	20.00	58.20	0.00
19109	9115	19	1808	1	2022-08-07	5	4.00	580.00	620.00	2976.00	192.00
19110	9116	12	1119	1	2022-10-11	2	4.00	410.00	430.00	825.60	38.40
19111	9117	12	562	1	2023-04-14	2	4.00	30.00	30.00	57.60	0.00
19112	9118	12	775	1	2023-01-13	3	2.00	850.00	890.00	2616.60	117.60
19113	9119	12	988	1	2023-08-03	4	4.00	20.00	20.00	76.80	0.00
19114	9120	316	817	2	2022-07-01	7	2.00	20.00	20.00	137.20	0.00
19115	9121	316	1850	2	2022-06-25	5	2.00	90.00	100.00	490.00	49.00
19116	9122	376	96	1	2022-04-09	7	5.00	90.00	90.00	598.50	0.00
19117	9123	10	566	7	2023-11-18	1	3.00	10.00	10.00	9.70	0.00
19118	9124	210	706	1	2023-01-17	9	3.00	70.00	80.00	698.40	87.30
19119	9125	355	741	1	2023-04-15	3	5.00	10.00	10.00	28.50	0.00
19120	9126	355	1534	1	2023-04-30	4	4.00	10.00	10.00	38.40	0.00
19121	9127	1203	155	2	2023-09-12	2	4.00	10.00	10.00	19.20	0.00
19122	9128	35	1752	2	2022-08-14	3	4.00	40.00	50.00	144.00	28.80
19123	9129	824	736	5	2023-05-14	7	3.00	80.00	90.00	611.10	67.90
19124	9130	228	1374	1	2022-05-26	3	4.00	290.00	300.00	864.00	28.80
19125	9131	228	1133	1	2022-04-07	2	3.00	20.00	20.00	38.80	0.00
19126	9132	1204	1002	2	2023-05-31	2	4.00	30.00	30.00	57.60	0.00
19127	9133	1204	587	2	2022-09-08	3	2.00	120.00	130.00	382.20	29.40
19128	9134	449	873	2	2023-08-27	5	2.00	490.00	560.00	2744.00	343.00
19129	9135	1205	399	2	2023-12-19	3	2.00	120.00	130.00	382.20	29.40
19130	9136	1205	392	2	2022-03-14	1	5.00	40.00	50.00	47.50	9.50
19131	9137	1205	1672	2	2022-05-19	3	3.00	10.00	10.00	29.10	0.00
19132	9138	653	998	2	2022-01-29	2	2.00	20.00	20.00	39.20	0.00
19133	9139	653	1410	2	2023-05-30	5	4.00	150.00	180.00	864.00	144.00
19134	9140	977	107	2	2023-05-06	7	5.00	440.00	480.00	3192.00	266.00
19135	9141	381	658	1	2022-01-27	2	3.00	150.00	160.00	310.40	19.40
19136	9142	213	48	5	2022-09-21	4	3.00	30.00	40.00	155.20	38.80
19137	9143	724	1500	2	2023-06-19	2	4.00	10.00	10.00	19.20	0.00
19138	9144	724	1808	2	2022-09-12	9	5.00	1030.00	1120.00	9576.00	769.50
19139	9145	724	96	2	2023-09-18	5	3.00	60.00	60.00	291.00	0.00
19140	9146	908	606	2	2022-06-10	3	2.00	0.00	0.00	0.00	0.00
19141	9147	557	1136	2	2023-09-22	2	3.00	80.00	100.00	194.00	38.80
19142	9148	557	1851	2	2022-03-24	6	2.00	10.00	10.00	58.80	0.00
19143	9149	557	773	2	2023-08-13	13	2.00	1330.00	1560.00	19874.40	2930.20
19144	9150	189	1003	2	2023-12-29	4	3.00	120.00	140.00	543.20	77.60
19145	9151	189	938	2	2022-03-09	5	4.00	60.00	70.00	336.00	48.00
19146	9152	879	1584	1	2022-04-23	2	2.00	10.00	10.00	19.60	0.00
19147	9153	879	175	1	2023-10-19	2	3.00	20.00	20.00	38.80	0.00
19148	9154	879	455	1	2022-08-14	7	4.00	20.00	20.00	134.40	0.00
19149	9155	12	442	1	2022-03-18	2	2.00	20.00	20.00	39.20	0.00
19150	9156	724	129	2	2023-10-13	6	4.00	30.00	40.00	230.40	57.60
19151	9157	561	474	2	2022-07-25	2	3.00	90.00	100.00	194.00	19.40
19152	9158	561	1674	2	2022-09-05	13	3.00	240.00	260.00	3278.60	252.20
19153	9159	561	722	2	2023-07-28	9	5.00	240.00	260.00	2223.00	171.00
19154	9160	1206	309	2	2023-06-29	3	3.00	0.00	0.00	0.00	0.00
19155	9161	1206	742	2	2023-09-14	5	5.00	10.00	10.00	47.50	0.00
19156	9162	882	1369	2	2023-05-03	7	5.00	380.00	410.00	2726.50	199.50
19157	9163	882	630	2	2022-10-29	3	3.00	560.00	680.00	1978.80	349.20
19158	9164	101	1431	2	2023-07-20	3	2.00	0.00	0.00	0.00	0.00
19159	9165	101	848	2	2023-04-14	2	4.00	130.00	140.00	268.80	19.20
19160	9166	103	1833	1	2022-03-24	4	4.00	3670.00	4480.00	17203.20	3110.40
19161	9167	103	977	1	2022-05-16	1	5.00	90.00	100.00	95.00	9.50
19162	9168	103	1430	1	2023-10-09	3	3.00	200.00	240.00	698.40	116.40
19163	9169	526	601	2	2023-01-17	14	5.00	290.00	320.00	4256.00	399.00
19164	9170	526	601	2	2022-07-05	2	4.00	40.00	50.00	96.00	19.20
19165	9171	1207	469	7	2022-01-19	2	5.00	20.00	30.00	57.00	19.00
19166	9172	1207	1053	7	2022-01-18	1	3.00	40.00	50.00	48.50	9.70
19167	9173	1207	879	7	2022-08-02	3	3.00	1040.00	1110.00	3230.10	203.70
19168	9174	1207	589	7	2022-04-25	3	4.00	20.00	20.00	57.60	0.00
19169	9175	438	994	1	2022-04-26	3	3.00	60.00	70.00	203.70	29.10
19170	9176	438	989	1	2023-10-16	3	3.00	20.00	20.00	58.20	0.00
19171	9177	902	304	2	2022-03-02	3	2.00	30.00	30.00	88.20	0.00
19172	9178	134	1710	2	2023-02-25	2	4.00	10.00	10.00	19.20	0.00
19173	9179	134	1560	2	2022-09-15	1	3.00	20.00	20.00	19.40	0.00
19174	9180	409	1539	2	2022-09-01	3	5.00	600.00	710.00	2023.50	313.50
19175	9181	409	592	2	2023-06-29	3	5.00	10.00	10.00	28.50	0.00
19176	9182	409	1646	2	2023-09-09	3	5.00	30.00	30.00	85.50	0.00
19177	9183	409	1776	2	2023-11-04	4	4.00	60.00	60.00	230.40	0.00
19178	9184	409	315	2	2022-01-02	2	4.00	20.00	20.00	38.40	0.00
19179	9185	409	29	2	2023-12-26	1	3.00	40.00	50.00	48.50	9.70
19180	9186	409	1852	2	2023-01-30	1	4.00	180.00	210.00	201.60	28.80
19181	9187	409	1219	2	2022-01-21	5	4.00	1310.00	1470.00	7056.00	768.00
19182	9188	1208	483	2	2022-08-31	2	4.00	0.00	0.00	0.00	0.00
19183	9189	1208	235	2	2023-11-27	4	5.00	20.00	20.00	76.00	0.00
19184	9190	1208	943	2	2022-12-31	6	5.00	630.00	660.00	3762.00	171.00
19185	9191	1208	897	2	2023-03-26	2	5.00	90.00	100.00	190.00	19.00
19186	9192	1208	760	2	2023-12-14	2	2.00	40.00	50.00	98.00	19.60
19187	9193	162	302	2	2022-05-21	7	3.00	20.00	30.00	203.70	67.90
19188	9194	162	884	2	2022-04-05	2	5.00	290.00	340.00	646.00	95.00
19189	9195	879	1258	2	2023-08-20	7	4.00	40.00	50.00	336.00	67.20
19190	9196	879	1366	2	2023-08-27	4	2.00	90.00	100.00	392.00	39.20
19191	9197	308	1674	2	2022-09-10	2	2.00	30.00	40.00	78.40	19.60
19192	9198	308	1119	2	2023-12-25	5	2.00	1320.00	1430.00	7007.00	539.00
19193	9199	308	1727	2	2022-10-07	6	3.00	30.00	40.00	232.80	58.20
19194	9200	308	1477	2	2023-04-18	1	5.00	250.00	260.00	247.00	9.50
19195	9201	737	431	5	2023-04-02	1	3.00	110.00	120.00	116.40	9.70
19196	9202	737	383	5	2023-09-07	1	4.00	280.00	320.00	307.20	38.40
19197	9203	213	1225	2	2022-10-13	3	2.00	30.00	30.00	88.20	0.00
19198	9204	213	1244	2	2023-09-20	5	4.00	90.00	110.00	528.00	96.00
19199	9205	351	131	2	2023-07-13	8	5.00	20.00	20.00	152.00	0.00
19200	9206	1209	924	7	2022-06-16	3	5.00	20.00	20.00	57.00	0.00
19201	9207	1209	1724	7	2022-07-09	8	2.00	40.00	50.00	392.00	78.40
19202	9208	54	1351	2	2022-01-04	3	3.00	40.00	40.00	116.40	0.00
19203	9209	153	1230	1	2022-06-12	1	4.00	20.00	20.00	19.20	0.00
19204	9210	1210	1048	1	2022-01-16	1	2.00	10.00	10.00	9.80	0.00
19205	9211	1210	752	1	2023-11-27	3	2.00	10.00	10.00	29.40	0.00
19206	9212	58	273	2	2022-11-01	3	4.00	20.00	20.00	57.60	0.00
19207	9213	111	64	2	2022-02-24	2	5.00	40.00	40.00	76.00	0.00
19208	9214	111	1093	2	2022-09-07	3	5.00	70.00	80.00	228.00	28.50
19209	9215	86	1853	5	2023-09-04	7	4.00	20.00	20.00	134.40	0.00
19210	9216	19	499	2	2022-06-25	5	5.00	30.00	30.00	142.50	0.00
19211	9217	765	15	2	2022-10-11	1	4.00	10.00	10.00	9.60	0.00
19212	9218	687	662	5	2023-02-15	2	3.00	20.00	20.00	38.80	0.00
19213	9219	210	862	2	2023-07-03	7	3.00	30.00	40.00	271.60	67.90
19214	9220	210	1334	2	2022-08-10	3	3.00	270.00	300.00	873.00	87.30
19215	9221	439	1239	5	2023-04-29	3	2.00	10.00	10.00	29.40	0.00
19216	9222	439	216	5	2023-01-26	4	3.00	1280.00	1500.00	5820.00	853.60
19217	9223	439	1115	5	2023-06-27	4	2.00	20.00	30.00	117.60	39.20
19218	9224	1211	1376	7	2022-01-19	6	4.00	10.00	10.00	57.60	0.00
19219	9225	1211	654	7	2023-06-20	2	5.00	0.00	0.00	0.00	0.00
19220	9226	1211	1500	7	2022-01-03	4	5.00	0.00	0.00	0.00	0.00
19221	9227	1211	211	7	2022-12-11	3	5.00	40.00	50.00	142.50	28.50
19222	9228	177	1310	2	2023-07-18	7	2.00	350.00	380.00	2606.80	205.80
19223	9229	381	60	7	2023-03-19	4	2.00	10.00	10.00	39.20	0.00
19224	9230	70	859	5	2023-07-22	3	2.00	20.00	20.00	58.80	0.00
19225	9231	70	1077	5	2022-08-23	9	5.00	50.00	60.00	513.00	85.50
19226	9232	55	116	2	2023-09-10	6	5.00	830.00	950.00	5415.00	684.00
19227	9233	234	1173	2	2022-10-30	9	5.00	70.00	90.00	769.50	171.00
19228	9234	234	1556	2	2022-11-10	3	3.00	20.00	20.00	58.20	0.00
19229	9235	234	639	2	2023-02-17	4	5.00	900.00	1090.00	4142.00	722.00
19230	9236	234	1127	2	2022-05-19	7	2.00	20.00	20.00	137.20	0.00
19231	9237	234	11	2	2022-10-04	3	3.00	460.00	570.00	1658.70	320.10
19232	9238	234	1317	2	2022-07-09	1	5.00	10.00	10.00	9.50	0.00
19233	9239	51	738	5	2023-12-02	2	5.00	130.00	150.00	285.00	38.00
19234	9240	700	886	2	2023-08-24	7	5.00	50.00	60.00	399.00	66.50
19235	9241	700	800	2	2023-02-22	3	4.00	10.00	10.00	28.80	0.00
19236	9242	700	449	2	2023-07-06	3	5.00	10.00	10.00	28.50	0.00
19237	9243	337	99	2	2023-05-18	6	5.00	10.00	10.00	57.00	0.00
19238	9244	337	1602	2	2023-09-05	1	3.00	110.00	120.00	116.40	9.70
19239	9245	337	1062	2	2022-02-26	2	2.00	10.00	10.00	19.60	0.00
19240	9246	337	13	2	2023-10-30	5	2.00	30.00	30.00	147.00	0.00
19241	9247	427	280	2	2023-06-23	3	3.00	10.00	10.00	29.10	0.00
19242	9248	427	325	2	2022-09-06	1	5.00	0.00	0.00	0.00	0.00
19243	9249	31	249	2	2023-04-27	1	3.00	0.00	0.00	0.00	0.00
19244	9250	31	1420	2	2022-03-28	7	2.00	830.00	880.00	6036.80	343.00
19245	9251	1212	498	2	2022-02-06	8	5.00	100.00	120.00	912.00	152.00
19246	9252	177	1081	2	2023-01-20	2	3.00	100.00	110.00	213.40	19.40
19247	9253	1213	1228	1	2022-02-13	5	3.00	190.00	200.00	970.00	48.50
19248	9254	1213	511	1	2022-04-21	2	4.00	10.00	10.00	19.20	0.00
19249	9255	1214	65	1	2023-01-17	1	3.00	60.00	60.00	58.20	0.00
19250	9256	1214	691	1	2023-09-06	3	3.00	10.00	10.00	29.10	0.00
19251	9257	1214	545	1	2022-06-24	2	4.00	10.00	10.00	19.20	0.00
19252	9258	1214	1320	1	2022-11-27	3	4.00	280.00	330.00	950.40	144.00
19253	9259	1214	69	1	2023-09-09	3	4.00	50.00	50.00	144.00	0.00
19254	9260	1214	572	1	2022-08-26	2	3.00	50.00	60.00	116.40	19.40
19255	9261	1215	1769	1	2022-08-19	3	4.00	30.00	30.00	86.40	0.00
19256	9262	551	52	7	2022-02-08	3	5.00	200.00	220.00	627.00	57.00
19257	9263	166	71	2	2023-02-18	3	3.00	370.00	390.00	1134.90	58.20
19258	9264	166	811	2	2022-04-01	5	3.00	230.00	270.00	1309.50	194.00
19259	9265	903	1646	2	2023-01-22	3	4.00	10.00	10.00	28.80	0.00
19260	9266	903	1725	2	2023-07-15	7	5.00	60.00	60.00	399.00	0.00
19261	9267	1122	1678	5	2022-04-19	2	4.00	10.00	10.00	19.20	0.00
19262	9268	385	1757	7	2022-06-05	1	5.00	90.00	100.00	95.00	9.50
19263	9269	385	712	7	2022-01-16	3	2.00	20.00	20.00	58.80	0.00
19264	9270	134	1548	2	2023-04-27	7	5.00	20.00	30.00	199.50	66.50
19265	9271	134	1177	2	2022-03-07	6	3.00	3840.00	4310.00	25084.20	2735.40
19266	9272	25	1534	2	2022-06-07	3	4.00	10.00	10.00	28.80	0.00
19267	9273	25	1357	2	2023-01-29	4	5.00	550.00	630.00	2394.00	304.00
19268	9274	1	116	2	2022-04-21	3	4.00	1340.00	1580.00	4550.40	691.20
19269	9275	588	1834	7	2022-12-22	7	3.00	240.00	260.00	1765.40	135.80
19270	9276	1216	1425	1	2022-04-09	6	5.00	150.00	180.00	1026.00	171.00
19271	9277	1216	539	1	2023-07-14	2	5.00	50.00	50.00	95.00	0.00
19272	9278	12	691	2	2022-05-18	4	4.00	20.00	20.00	76.80	0.00
19273	9279	12	734	2	2023-11-02	7	5.00	10.00	10.00	66.50	0.00
19274	9280	12	464	2	2023-02-08	2	5.00	340.00	400.00	760.00	114.00
19275	9281	67	1633	2	2022-09-30	2	2.00	150.00	160.00	313.60	19.60
19276	9282	261	1826	2	2022-03-19	5	4.00	60.00	70.00	336.00	48.00
19277	9283	1070	1438	2	2022-07-17	4	5.00	70.00	70.00	266.00	0.00
19278	9284	701	149	1	2023-09-12	2	3.00	10.00	10.00	19.40	0.00
19279	9285	64	542	2	2023-09-12	3	5.00	340.00	390.00	1111.50	142.50
19280	9286	913	206	5	2022-05-07	1	3.00	20.00	20.00	19.40	0.00
19281	9287	541	1427	2	2022-01-07	3	3.00	10.00	10.00	29.10	0.00
19282	9288	541	563	2	2023-08-05	3	4.00	400.00	460.00	1324.80	172.80
19283	9289	71	1190	5	2023-04-05	6	4.00	890.00	1080.00	6220.80	1094.40
19284	9290	427	1185	1	2023-10-04	1	2.00	50.00	50.00	49.00	0.00
19285	9291	23	837	5	2022-08-02	3	5.00	10.00	10.00	28.50	0.00
19286	9292	23	1024	5	2023-02-17	3	3.00	30.00	30.00	87.30	0.00
19287	9293	1217	758	7	2022-08-24	1	2.00	0.00	0.00	0.00	0.00
19288	9294	1218	348	1	2023-12-12	6	3.00	40.00	40.00	232.80	0.00
19289	9295	236	1011	2	2022-10-01	3	2.00	10.00	10.00	29.40	0.00
19290	9296	236	267	2	2022-06-18	4	3.00	100.00	120.00	465.60	77.60
19291	9297	808	1114	1	2023-11-11	2	3.00	40.00	40.00	77.60	0.00
19292	9298	808	1082	1	2023-02-21	4	4.00	190.00	240.00	921.60	192.00
19293	9299	808	291	1	2023-05-05	3	2.00	60.00	70.00	205.80	29.40
19294	9300	808	829	1	2023-04-27	2	4.00	0.00	0.00	0.00	0.00
19295	9301	808	406	1	2023-11-25	1	5.00	50.00	60.00	57.00	9.50
19296	9302	808	1751	1	2023-04-22	2	3.00	90.00	100.00	194.00	19.40
19297	9303	808	1610	1	2022-01-03	3	5.00	10.00	10.00	28.50	0.00
19298	9304	808	1308	1	2022-11-10	3	2.00	20.00	20.00	58.80	0.00
19299	9305	808	778	1	2022-10-20	1	4.00	0.00	0.00	0.00	0.00
19300	9306	1219	1643	2	2023-07-20	5	4.00	10.00	10.00	48.00	0.00
19301	9307	152	951	2	2023-12-20	2	3.00	10.00	10.00	19.40	0.00
19302	9308	152	1454	2	2022-05-27	2	3.00	10.00	10.00	19.40	0.00
19303	9309	152	1565	2	2022-09-12	4	5.00	40.00	50.00	190.00	38.00
19304	9310	152	754	2	2023-03-28	6	5.00	30.00	30.00	171.00	0.00
19305	9311	25	711	2	2022-06-03	8	2.00	130.00	150.00	1176.00	156.80
19306	9312	89	86	2	2022-11-22	2	2.00	0.00	0.00	0.00	0.00
19307	9313	89	398	2	2022-12-28	4	4.00	50.00	60.00	230.40	38.40
19308	9314	189	43	7	2023-11-17	7	4.00	340.00	420.00	2822.40	537.60
19309	9315	189	15	7	2022-07-04	2	4.00	110.00	120.00	230.40	19.20
19310	9316	12	1327	2	2023-10-21	3	5.00	100.00	120.00	342.00	57.00
19311	9317	12	263	2	2023-11-17	4	2.00	620.00	770.00	3018.40	588.00
19312	9318	433	334	2	2022-03-26	1	5.00	40.00	50.00	47.50	9.50
19313	9319	253	579	2	2022-09-28	2	3.00	10.00	10.00	19.40	0.00
19314	9320	253	1854	2	2022-11-27	2	3.00	150.00	160.00	310.40	19.40
19315	9321	253	1763	2	2023-05-04	4	4.00	160.00	180.00	691.20	76.80
19316	9322	188	1463	2	2023-02-26	3	2.00	10.00	10.00	29.40	0.00
19317	9323	188	480	2	2022-10-22	4	3.00	60.00	70.00	271.60	38.80
19318	9324	234	955	2	2023-10-27	8	5.00	200.00	210.00	1596.00	76.00
19319	9325	234	874	2	2023-05-29	2	2.00	480.00	590.00	1156.40	215.60
19320	9326	234	1000	2	2022-09-28	3	3.00	60.00	70.00	203.70	29.10
19321	9327	267	1654	5	2022-04-06	4	3.00	70.00	80.00	310.40	38.80
19322	9328	267	12	5	2022-12-18	2	5.00	400.00	460.00	874.00	114.00
19323	9329	267	1503	5	2022-07-30	1	2.00	30.00	30.00	29.40	0.00
19324	9330	152	1627	5	2022-02-08	4	5.00	40.00	50.00	190.00	38.00
19325	9331	134	838	2	2022-02-24	2	5.00	20.00	20.00	38.00	0.00
19326	9332	487	1119	2	2023-09-02	3	3.00	710.00	860.00	2502.60	436.50
19327	9333	911	415	1	2023-12-08	4	3.00	170.00	200.00	776.00	116.40
19328	9334	911	1054	1	2023-11-24	4	3.00	10.00	10.00	38.80	0.00
19329	9335	659	1	5	2022-04-13	3	2.00	290.00	310.00	911.40	58.80
19330	9336	659	1569	5	2023-08-05	2	4.00	0.00	0.00	0.00	0.00
19331	9337	111	111	2	2023-01-12	5	3.00	20.00	20.00	97.00	0.00
19332	9338	111	1391	1	2023-11-20	1	5.00	0.00	0.00	0.00	0.00
19333	9339	111	808	1	2022-11-14	6	2.00	20.00	20.00	117.60	0.00
19334	9340	111	1690	1	2023-05-16	3	5.00	140.00	150.00	427.50	28.50
19335	9341	111	548	1	2023-07-13	5	4.00	20.00	20.00	96.00	0.00
19336	9342	111	1693	1	2022-08-17	3	3.00	110.00	120.00	349.20	29.10
19337	9343	1073	625	2	2023-09-12	7	5.00	40.00	50.00	332.50	66.50
19338	9344	759	1747	5	2022-09-07	5	5.00	400.00	460.00	2185.00	285.00
19339	9345	759	32	5	2023-09-12	5	2.00	10.00	10.00	49.00	0.00
19340	9346	759	1486	5	2023-03-12	1	5.00	50.00	60.00	57.00	9.50
19341	9347	759	1156	5	2022-07-03	2	2.00	20.00	30.00	58.80	19.60
19342	9348	759	1190	5	2022-07-10	5	4.00	750.00	900.00	4320.00	720.00
19343	9349	910	1806	2	2023-01-07	8	2.00	760.00	840.00	6585.60	627.20
19344	9350	910	108	2	2023-12-16	2	2.00	30.00	40.00	78.40	19.60
19345	9351	411	926	2	2022-09-16	4	2.00	10.00	10.00	39.20	0.00
19346	9352	411	390	2	2023-02-28	3	3.00	150.00	180.00	523.80	87.30
19347	9353	118	874	5	2022-05-01	2	2.00	430.00	520.00	1019.20	176.40
19348	9354	118	1791	5	2023-11-29	3	5.00	10.00	10.00	28.50	0.00
19349	9355	149	1770	2	2022-06-21	3	4.00	20.00	20.00	57.60	0.00
19350	9356	149	1064	2	2023-11-13	2	2.00	0.00	0.00	0.00	0.00
19351	9357	149	1287	2	2023-11-26	2	4.00	20.00	20.00	38.40	0.00
19352	9358	25	829	1	2023-09-01	5	3.00	40.00	40.00	194.00	0.00
19353	9359	25	617	1	2022-11-03	3	3.00	260.00	310.00	902.10	145.50
19354	9360	25	1763	1	2023-10-25	1	2.00	40.00	50.00	49.00	9.80
19355	9361	25	855	1	2023-04-01	7	3.00	360.00	430.00	2919.70	475.30
19356	9362	67	49	2	2023-08-10	6	2.00	30.00	30.00	176.40	0.00
19357	9363	67	803	2	2022-09-01	7	2.00	10.00	10.00	68.60	0.00
19358	9364	67	1257	2	2022-08-01	3	4.00	20.00	20.00	57.60	0.00
19359	9365	67	436	2	2022-03-05	4	5.00	340.00	360.00	1368.00	76.00
19360	9366	1085	1829	5	2022-08-13	2	2.00	10.00	10.00	19.60	0.00
19361	9367	365	1637	2	2022-06-03	2	2.00	70.00	70.00	137.20	0.00
19362	9368	365	1363	2	2023-07-11	6	5.00	1580.00	1680.00	9576.00	570.00
19363	9369	708	275	5	2022-07-28	2	4.00	40.00	40.00	76.80	0.00
19364	9370	763	1456	1	2023-10-30	3	2.00	250.00	270.00	793.80	58.80
19365	9371	57	1824	5	2022-10-16	4	4.00	40.00	40.00	153.60	0.00
19366	9372	57	84	5	2023-01-25	3	2.00	290.00	320.00	940.80	88.20
19367	9373	57	132	5	2023-02-07	5	2.00	10.00	10.00	49.00	0.00
19368	9374	62	930	2	2022-11-18	7	5.00	370.00	420.00	2793.00	332.50
19369	9375	153	683	2	2022-04-24	6	3.00	60.00	60.00	349.20	0.00
19370	9376	70	1073	1	2023-07-19	2	4.00	40.00	50.00	96.00	19.20
19371	9377	1220	1652	2	2022-12-20	3	5.00	20.00	30.00	85.50	28.50
19372	9378	1221	1570	2	2023-08-05	2	4.00	20.00	30.00	57.60	19.20
19373	9379	101	1855	2	2022-07-07	2	4.00	10.00	10.00	19.20	0.00
19374	9380	202	1238	1	2023-10-23	3	2.00	40.00	50.00	147.00	29.40
19375	9381	202	168	1	2022-02-15	1	5.00	50.00	60.00	57.00	9.50
19376	9382	202	1245	1	2023-12-23	2	4.00	340.00	420.00	806.40	153.60
19377	9383	202	60	1	2023-01-21	1	2.00	0.00	0.00	0.00	0.00
19378	9384	202	1019	1	2022-07-06	5	5.00	60.00	80.00	380.00	95.00
19379	9385	44	491	2	2023-12-19	4	4.00	30.00	30.00	115.20	0.00
19380	9386	193	1156	2	2023-02-19	8	2.00	100.00	120.00	940.80	156.80
19381	9387	934	369	2	2022-11-14	4	5.00	70.00	80.00	304.00	38.00
19382	9388	934	315	2	2022-06-02	1	5.00	10.00	10.00	9.50	0.00
19383	9389	934	1108	2	2022-05-08	3	4.00	460.00	540.00	1555.20	230.40
19384	9390	934	30	2	2022-04-12	1	2.00	0.00	0.00	0.00	0.00
19385	9391	355	1278	2	2022-02-26	5	3.00	220.00	230.00	1115.50	48.50
19386	9392	393	858	5	2023-06-29	1	4.00	10.00	10.00	9.60	0.00
19387	9393	358	1456	7	2022-01-29	8	2.00	520.00	580.00	4547.20	470.40
19388	9394	383	1552	5	2023-09-09	5	2.00	540.00	630.00	3087.00	441.00
19389	9395	383	655	5	2023-01-15	2	5.00	500.00	630.00	1197.00	247.00
19390	9396	383	1249	5	2022-11-01	2	2.00	740.00	800.00	1568.00	117.60
19391	9397	383	50	5	2022-09-29	6	3.00	60.00	80.00	465.60	116.40
19392	9398	383	1272	5	2022-10-29	1	5.00	20.00	30.00	28.50	9.50
19393	9399	383	1335	5	2023-04-20	9	5.00	1150.00	1350.00	11542.50	1710.00
19394	9400	1222	502	2	2022-05-21	6	3.00	10.00	10.00	58.20	0.00
19395	9401	596	838	2	2022-11-22	4	5.00	30.00	30.00	114.00	0.00
19396	9402	138	1566	2	2022-10-17	2	2.00	0.00	0.00	0.00	0.00
19397	9403	104	617	1	2023-03-01	2	4.00	180.00	210.00	403.20	57.60
19398	9404	104	1245	1	2022-06-12	6	5.00	1370.00	1590.00	9063.00	1254.00
19399	9405	325	1240	2	2022-04-02	5	2.00	10.00	10.00	49.00	0.00
19400	9406	229	1411	5	2023-03-26	2	4.00	530.00	570.00	1094.40	76.80
19401	9407	229	1738	5	2023-07-29	2	5.00	10.00	10.00	19.00	0.00
19402	9408	134	1201	1	2022-01-24	9	5.00	970.00	1070.00	9148.50	855.00
19403	9409	134	442	1	2023-10-05	1	3.00	10.00	10.00	9.70	0.00
19404	9410	130	635	5	2022-08-23	1	4.00	0.00	0.00	0.00	0.00
19405	9411	130	505	5	2022-02-12	5	5.00	80.00	90.00	427.50	47.50
19406	9412	757	534	1	2023-03-15	1	3.00	90.00	100.00	97.00	9.70
19407	9413	234	484	5	2022-12-01	5	5.00	2380.00	2800.00	13300.00	1995.00
19408	9414	34	823	5	2023-07-20	2	3.00	10.00	10.00	19.40	0.00
19409	9415	68	1808	2	2023-05-16	2	5.00	210.00	250.00	475.00	76.00
19410	9416	68	1332	2	2023-06-16	3	4.00	20.00	20.00	57.60	0.00
19411	9417	68	225	2	2022-08-25	3	5.00	10.00	10.00	28.50	0.00
19412	9418	1223	779	2	2023-10-28	2	4.00	10.00	10.00	19.20	0.00
19413	9419	1223	812	2	2022-09-19	3	2.00	10.00	10.00	29.40	0.00
19414	9420	34	514	1	2022-08-03	2	3.00	20.00	20.00	38.80	0.00
19415	9421	34	1550	1	2022-08-11	6	4.00	20.00	20.00	115.20	0.00
19416	9422	60	1067	2	2022-06-15	6	5.00	500.00	600.00	3420.00	570.00
19417	9423	60	598	2	2022-11-20	5	2.00	30.00	40.00	196.00	49.00
19418	9424	60	723	2	2022-03-21	3	2.00	260.00	300.00	882.00	117.60
19419	9425	60	47	2	2023-03-10	3	2.00	40.00	50.00	147.00	29.40
19420	9426	134	484	1	2023-09-18	6	5.00	3180.00	3790.00	21603.00	3477.00
19421	9427	203	1659	2	2023-03-26	5	2.00	30.00	40.00	196.00	49.00
19422	9428	1043	893	2	2022-06-29	5	2.00	170.00	200.00	980.00	147.00
19423	9429	586	378	2	2022-10-18	8	3.00	970.00	1210.00	9389.60	1862.40
19424	9430	227	904	2	2023-02-06	5	4.00	880.00	1100.00	5280.00	1056.00
19425	9431	227	1117	2	2023-11-06	1	3.00	90.00	100.00	97.00	9.70
19426	9432	344	1853	7	2022-05-06	2	5.00	10.00	10.00	19.00	0.00
19427	9433	1180	1203	2	2022-08-09	2	2.00	30.00	30.00	58.80	0.00
19428	9434	1180	290	2	2023-05-20	7	3.00	40.00	40.00	271.60	0.00
19429	9435	1180	787	2	2023-05-15	3	4.00	10.00	10.00	28.80	0.00
19430	9436	1180	553	2	2023-03-16	4	2.00	230.00	250.00	980.00	78.40
19431	9437	130	697	7	2022-03-28	2	4.00	0.00	0.00	0.00	0.00
19432	9438	301	1441	2	2023-07-09	2	2.00	10.00	10.00	19.60	0.00
19433	9439	71	1271	2	2023-04-21	4	5.00	240.00	290.00	1102.00	190.00
19434	9440	74	1206	2	2023-06-29	2	4.00	20.00	20.00	38.40	0.00
19435	9441	134	1491	2	2022-04-29	2	4.00	10.00	10.00	19.20	0.00
19436	9442	545	1205	1	2022-01-17	5	4.00	40.00	50.00	240.00	48.00
19437	9443	307	401	2	2023-11-20	2	5.00	20.00	20.00	38.00	0.00
19438	9444	307	820	2	2023-11-11	2	4.00	200.00	220.00	422.40	38.40
19439	9445	1224	1621	5	2023-08-21	4	4.00	90.00	100.00	384.00	38.40
19440	9446	446	618	2	2022-11-03	3	3.00	10.00	10.00	29.10	0.00
19441	9447	755	1358	2	2022-01-14	6	5.00	30.00	40.00	228.00	57.00
19442	9448	498	36	2	2023-05-04	5	4.00	390.00	480.00	2304.00	432.00
19443	9449	1225	1039	2	2023-02-17	4	4.00	10.00	10.00	38.40	0.00
19444	9450	10	974	2	2023-01-31	2	2.00	10.00	10.00	19.60	0.00
19445	9451	1226	465	2	2022-04-22	9	2.00	110.00	140.00	1234.80	264.60
19446	9452	376	1095	2	2022-06-20	3	5.00	160.00	190.00	541.50	85.50
19447	9453	376	823	2	2022-03-26	6	3.00	70.00	80.00	465.60	58.20
19448	9454	376	1800	2	2022-01-21	3	3.00	40.00	50.00	145.50	29.10
19449	9455	376	462	2	2023-11-04	2	3.00	40.00	40.00	77.60	0.00
19450	9456	1227	1856	1	2023-01-12	1	4.00	70.00	90.00	86.40	19.20
19451	9457	771	1857	2	2023-10-29	3	5.00	20.00	30.00	85.50	28.50
19452	9458	771	1233	2	2022-09-22	5	4.00	10.00	10.00	48.00	0.00
19453	9459	37	282	2	2022-05-18	3	2.00	130.00	140.00	411.60	29.40
19454	9460	37	1731	2	2023-10-01	1	5.00	20.00	20.00	19.00	0.00
19455	9461	126	694	1	2022-10-01	3	2.00	30.00	30.00	88.20	0.00
19456	9462	1005	1087	2	2022-12-20	6	4.00	280.00	320.00	1843.20	230.40
19457	9463	1076	1132	1	2023-04-12	2	2.00	600.00	700.00	1372.00	196.00
19458	9464	51	488	5	2022-03-26	4	3.00	20.00	20.00	77.60	0.00
19459	9465	436	1569	2	2023-01-15	6	2.00	20.00	20.00	117.60	0.00
19460	9466	411	469	2	2023-06-06	2	5.00	30.00	30.00	57.00	0.00
19461	9467	104	142	1	2023-05-10	6	2.00	140.00	160.00	940.80	117.60
19462	9468	104	1583	1	2022-07-31	2	3.00	140.00	170.00	329.80	58.20
19463	9469	104	681	1	2022-01-20	2	3.00	10.00	10.00	19.40	0.00
19464	9470	104	418	1	2022-02-03	2	4.00	100.00	110.00	211.20	19.20
19465	9471	104	141	1	2022-02-16	2	2.00	90.00	100.00	196.00	19.60
19466	9472	104	277	1	2023-10-11	1	3.00	10.00	10.00	9.70	0.00
19467	9473	104	1460	1	2022-03-09	2	5.00	110.00	130.00	247.00	38.00
19468	9474	104	1758	1	2022-08-26	5	4.00	90.00	100.00	480.00	48.00
19469	9475	199	1140	1	2022-07-09	2	3.00	10.00	10.00	19.40	0.00
19470	9476	199	1031	1	2022-08-12	7	4.00	140.00	170.00	1142.40	201.60
19471	9477	199	1538	1	2022-08-27	2	3.00	50.00	50.00	97.00	0.00
19472	9478	199	991	1	2023-06-21	3	4.00	0.00	0.00	0.00	0.00
19473	9479	1228	1322	2	2023-09-05	5	5.00	10.00	10.00	47.50	0.00
19474	9480	1228	1207	2	2023-07-02	3	4.00	0.00	0.00	0.00	0.00
19475	9481	1228	570	2	2022-11-16	5	3.00	290.00	300.00	1455.00	48.50
19476	9482	89	76	2	2023-06-01	2	5.00	20.00	20.00	38.00	0.00
19477	9483	344	652	1	2022-10-04	2	2.00	280.00	320.00	627.20	78.40
19478	9484	329	347	2	2022-05-07	6	3.00	20.00	20.00	116.40	0.00
19479	9485	106	1687	1	2023-03-19	10	5.00	720.00	780.00	7410.00	570.00
19480	9486	106	1118	1	2023-08-03	9	5.00	30.00	30.00	256.50	0.00
19481	9487	1229	856	7	2023-01-18	3	2.00	620.00	670.00	1969.80	147.00
19482	9488	1230	846	5	2023-04-10	3	4.00	10.00	10.00	28.80	0.00
19483	9489	113	1119	5	2022-09-25	2	2.00	530.00	570.00	1117.20	78.40
19484	9490	956	1270	2	2022-01-09	7	3.00	170.00	200.00	1358.00	203.70
19485	9491	152	383	2	2022-10-09	8	5.00	1780.00	2020.00	15352.00	1824.00
19486	9492	152	1280	2	2022-03-05	3	5.00	10.00	10.00	28.50	0.00
19487	9493	500	16	7	2023-04-29	9	3.00	30.00	40.00	349.20	87.30
19488	9494	1231	343	2	2023-12-29	7	2.00	1350.00	1590.00	10907.40	1646.40
19489	9495	1231	991	2	2022-12-07	2	4.00	10.00	10.00	19.20	0.00
19490	9496	218	1825	2	2023-04-05	6	4.00	100.00	120.00	691.20	115.20
19491	9497	218	1296	2	2022-03-03	1	5.00	10.00	10.00	9.50	0.00
19492	9498	1232	250	5	2023-01-07	1	4.00	0.00	0.00	0.00	0.00
19493	9499	1232	1655	5	2023-05-19	3	4.00	150.00	170.00	489.60	57.60
19494	9500	1232	988	5	2023-09-08	10	5.00	60.00	70.00	665.00	95.00
19495	9501	363	1105	2	2023-01-07	3	4.00	20.00	30.00	86.40	28.80
19496	9502	10	1446	2	2023-09-10	3	5.00	30.00	30.00	85.50	0.00
19497	9503	1233	1743	2	2023-01-04	9	3.00	20.00	30.00	261.90	87.30
19498	9504	1233	650	2	2022-10-02	1	2.00	0.00	0.00	0.00	0.00
19499	9505	253	1808	2	2023-04-19	7	3.00	940.00	1090.00	7401.10	1018.50
19500	9506	253	315	2	2023-04-24	2	5.00	100.00	110.00	209.00	19.00
19501	9507	739	819	1	2023-07-28	2	2.00	20.00	30.00	58.80	19.60
19502	9508	739	1233	1	2022-01-25	5	3.00	30.00	40.00	194.00	48.50
19503	9509	739	183	1	2022-09-08	3	3.00	10.00	10.00	29.10	0.00
19504	9510	739	157	1	2023-12-23	6	3.00	590.00	690.00	4015.80	582.00
19505	9511	104	320	2	2022-09-09	9	2.00	40.00	40.00	352.80	0.00
19506	9512	74	1088	5	2023-12-26	3	4.00	10.00	10.00	28.80	0.00
19507	9513	442	790	1	2022-11-19	1	5.00	160.00	200.00	190.00	38.00
19508	9514	1234	765	2	2022-07-20	5	3.00	1340.00	1650.00	8002.50	1503.50
19509	9515	307	641	2	2022-06-02	6	4.00	80.00	90.00	518.40	57.60
19510	9516	194	1160	2	2022-11-01	14	4.00	50.00	50.00	672.00	0.00
19511	9517	602	1251	1	2023-12-10	3	2.00	30.00	30.00	88.20	0.00
19512	9518	602	1187	1	2022-09-18	3	4.00	10.00	10.00	28.80	0.00
19513	9519	602	246	1	2022-08-11	3	2.00	360.00	440.00	1293.60	235.20
19514	9520	152	1267	1	2023-05-03	4	2.00	70.00	80.00	313.60	39.20
19515	9521	19	244	2	2022-09-16	2	2.00	80.00	90.00	176.40	19.60
19516	9522	118	1858	2	2023-10-11	3	3.00	280.00	320.00	931.20	116.40
19517	9523	118	1799	2	2022-02-16	3	3.00	20.00	20.00	58.20	0.00
19518	9524	118	1034	2	2022-08-04	3	5.00	30.00	30.00	85.50	0.00
19519	9525	246	302	5	2023-09-07	5	5.00	70.00	80.00	380.00	47.50
19520	9526	246	893	5	2023-06-05	5	5.00	160.00	200.00	950.00	190.00
19521	9527	246	781	5	2023-08-12	3	3.00	30.00	30.00	87.30	0.00
19522	9528	246	380	5	2022-03-19	6	4.00	150.00	170.00	979.20	115.20
19523	9529	246	700	5	2023-03-03	2	3.00	10.00	10.00	19.40	0.00
19524	9530	1235	862	7	2022-07-06	2	4.00	10.00	10.00	19.20	0.00
19525	9531	551	814	2	2022-05-07	2	4.00	50.00	50.00	96.00	0.00
19526	9532	691	1157	2	2022-02-15	2	5.00	50.00	60.00	114.00	19.00
19527	9533	383	1273	2	2023-12-04	14	4.00	370.00	430.00	5779.20	806.40
19528	9534	383	196	2	2022-08-30	7	5.00	30.00	40.00	266.00	66.50
19529	9535	383	1765	2	2023-02-23	2	3.00	30.00	30.00	58.20	0.00
19530	9536	383	526	2	2022-03-05	2	4.00	10.00	10.00	19.20	0.00
19531	9537	101	1257	1	2022-09-06	3	2.00	10.00	10.00	29.40	0.00
19532	9538	111	179	5	2022-07-01	2	4.00	380.00	480.00	921.60	192.00
19533	9539	371	939	5	2023-06-04	5	5.00	20.00	20.00	95.00	0.00
19534	9540	371	369	5	2022-01-17	2	2.00	30.00	40.00	78.40	19.60
19535	9541	173	878	1	2023-04-21	7	2.00	160.00	190.00	1303.40	205.80
19536	9542	515	199	2	2023-01-07	3	2.00	40.00	40.00	117.60	0.00
19537	9543	515	800	2	2023-03-17	5	4.00	10.00	10.00	48.00	0.00
19538	9544	515	1734	2	2022-12-25	2	2.00	50.00	60.00	117.60	19.60
19539	9545	515	1104	2	2022-10-08	3	2.00	330.00	370.00	1087.80	117.60
19540	9546	305	1431	2	2022-01-13	2	5.00	0.00	0.00	0.00	0.00
19541	9547	305	68	2	2022-05-09	2	2.00	70.00	80.00	156.80	19.60
19542	9548	325	1533	1	2023-12-30	2	5.00	10.00	10.00	19.00	0.00
19543	9549	325	9	1	2023-12-01	2	4.00	0.00	0.00	0.00	0.00
19544	9550	325	1142	1	2022-06-01	3	3.00	420.00	450.00	1309.50	87.30
19545	9551	594	69	5	2023-01-15	3	4.00	10.00	10.00	28.80	0.00
19546	9552	12	773	2	2023-01-13	6	4.00	520.00	580.00	3340.80	345.60
19547	9553	295	1303	2	2022-09-02	4	2.00	130.00	150.00	588.00	78.40
19548	9554	1236	391	2	2022-08-19	7	4.00	60.00	70.00	470.40	67.20
19549	9555	51	91	2	2023-12-04	5	3.00	60.00	70.00	339.50	48.50
19550	9556	51	1015	2	2023-02-06	2	4.00	0.00	0.00	0.00	0.00
19551	9557	284	780	1	2023-08-01	7	2.00	150.00	180.00	1234.80	205.80
19552	9558	141	1495	1	2022-01-26	2	4.00	10.00	10.00	19.20	0.00
19553	9559	76	218	5	2022-12-04	5	5.00	120.00	130.00	617.50	47.50
19554	9560	76	1167	5	2023-08-19	5	5.00	170.00	200.00	950.00	142.50
19555	9561	76	1417	5	2023-01-05	2	5.00	50.00	50.00	95.00	0.00
19556	9562	76	1333	5	2022-10-30	3	2.00	350.00	430.00	1264.20	235.20
19557	9563	76	1859	5	2023-02-15	3	2.00	200.00	220.00	646.80	58.80
19558	9564	76	1346	5	2023-02-22	2	3.00	10.00	10.00	19.40	0.00
19559	9565	179	1018	2	2023-12-10	2	2.00	10.00	10.00	19.60	0.00
19560	9566	202	229	7	2023-12-19	7	3.00	1070.00	1130.00	7672.70	407.40
19561	9567	202	675	7	2023-07-02	5	3.00	10.00	10.00	48.50	0.00
19562	9568	202	184	7	2022-06-07	2	4.00	0.00	0.00	0.00	0.00
19563	9569	11	126	5	2023-01-04	4	4.00	60.00	80.00	307.20	76.80
19564	9570	51	1391	7	2023-03-19	6	2.00	10.00	10.00	58.80	0.00
19565	9571	51	1223	7	2022-02-27	2	4.00	30.00	30.00	57.60	0.00
19566	9572	51	1653	7	2022-10-27	2	4.00	20.00	20.00	38.40	0.00
19567	9573	51	581	7	2022-04-02	1	5.00	20.00	20.00	19.00	0.00
19568	9574	51	1047	7	2023-09-08	5	3.00	20.00	20.00	97.00	0.00
19569	9575	518	1173	7	2023-10-10	3	4.00	20.00	30.00	86.40	28.80
19570	9576	73	84	1	2022-07-21	1	4.00	100.00	110.00	105.60	9.60
19571	9577	73	1094	1	2023-03-09	2	3.00	350.00	400.00	776.00	97.00
19572	9578	73	1145	1	2022-07-22	5	4.00	90.00	100.00	480.00	48.00
19573	9579	82	908	5	2023-08-21	3	4.00	870.00	1080.00	3110.40	604.80
19574	9580	82	1044	5	2023-12-22	1	2.00	60.00	70.00	68.60	9.80
19575	9581	82	759	5	2022-11-20	5	4.00	20.00	30.00	144.00	48.00
19576	9582	82	1586	5	2022-03-29	5	3.00	470.00	590.00	2861.50	582.00
19577	9583	285	132	2	2023-05-16	6	3.00	10.00	10.00	58.20	0.00
19578	9584	104	1249	1	2022-12-07	1	4.00	330.00	400.00	384.00	67.20
19579	9585	928	1032	5	2022-08-08	4	5.00	40.00	50.00	190.00	38.00
19580	9586	418	1414	5	2022-06-16	1	4.00	30.00	30.00	28.80	0.00
19581	9587	171	1330	7	2023-05-15	5	2.00	60.00	60.00	294.00	0.00
19582	9588	199	887	2	2023-06-17	4	4.00	170.00	200.00	768.00	115.20
19583	9589	618	109	2	2022-07-23	4	2.00	100.00	120.00	470.40	78.40
19584	9590	28	1750	2	2022-07-22	3	5.00	20.00	20.00	57.00	0.00
19585	9591	28	921	2	2023-05-27	9	5.00	90.00	100.00	855.00	85.50
19586	9592	306	894	2	2022-12-13	5	4.00	20.00	20.00	96.00	0.00
19587	9593	306	1815	2	2023-03-22	5	5.00	250.00	300.00	1425.00	237.50
19588	9594	104	1490	2	2023-03-10	2	3.00	10.00	10.00	19.40	0.00
19589	9595	104	372	2	2023-11-04	2	2.00	10.00	10.00	19.60	0.00
19590	9596	66	23	2	2022-01-18	3	5.00	30.00	30.00	85.50	0.00
19591	9597	66	1592	2	2023-01-26	2	4.00	240.00	280.00	537.60	76.80
19592	9598	66	1677	2	2022-01-10	3	3.00	100.00	110.00	320.10	29.10
19593	9599	1061	1493	2	2023-11-03	3	3.00	60.00	60.00	174.60	0.00
19594	9600	672	1325	2	2022-06-07	1	4.00	40.00	40.00	38.40	0.00
19595	9601	1237	1466	1	2023-07-03	8	3.00	40.00	40.00	310.40	0.00
19596	9602	341	1053	2	2022-06-03	5	3.00	190.00	240.00	1164.00	242.50
19597	9603	931	1727	5	2023-04-09	5	5.00	30.00	30.00	142.50	0.00
19598	9604	263	1022	2	2023-06-20	3	2.00	360.00	380.00	1117.20	58.80
19599	9605	680	1860	5	2023-09-04	4	3.00	160.00	200.00	776.00	155.20
19600	9606	948	177	2	2023-05-11	4	4.00	60.00	70.00	268.80	38.40
19601	9607	948	872	2	2022-04-17	3	4.00	150.00	190.00	547.20	115.20
19602	9608	104	1553	1	2023-08-23	6	5.00	20.00	20.00	114.00	0.00
19603	9609	104	1239	1	2022-07-10	3	3.00	10.00	10.00	29.10	0.00
19604	9610	70	1455	1	2023-08-31	4	2.00	260.00	280.00	1097.60	78.40
19605	9611	70	1039	1	2022-08-06	9	3.00	30.00	30.00	261.90	0.00
19606	9612	159	849	2	2023-05-02	4	5.00	10.00	10.00	38.00	0.00
19607	9613	1238	1502	2	2022-01-22	2	2.00	230.00	240.00	470.40	19.60
19608	9614	411	10	5	2023-10-03	1	3.00	20.00	20.00	19.40	0.00
19609	9615	411	1208	5	2022-08-29	7	3.00	90.00	100.00	679.00	67.90
19610	9616	411	451	5	2023-07-20	2	2.00	1640.00	2030.00	3978.80	764.40
19611	9617	19	827	2	2022-08-29	2	4.00	10.00	10.00	19.20	0.00
19612	9618	1239	616	2	2023-08-03	3	4.00	760.00	900.00	2592.00	403.20
19613	9619	1239	916	2	2022-10-27	3	2.00	80.00	90.00	264.60	29.40
19614	9620	1239	344	2	2022-01-24	5	5.00	120.00	140.00	665.00	95.00
19615	9621	732	1810	2	2023-04-20	6	2.00	20.00	20.00	117.60	0.00
19616	9622	732	1838	2	2023-11-21	2	3.00	0.00	0.00	0.00	0.00
19617	9623	732	1537	2	2022-05-21	4	4.00	20.00	30.00	115.20	38.40
19618	9624	89	651	5	2023-12-18	2	2.00	20.00	20.00	39.20	0.00
19619	9625	89	1214	5	2023-08-11	3	4.00	280.00	310.00	892.80	86.40
19620	9626	89	1334	5	2022-06-26	3	5.00	340.00	410.00	1168.50	199.50
19621	9627	1240	1829	5	2022-11-03	2	3.00	10.00	10.00	19.40	0.00
19622	9628	166	767	2	2023-09-20	3	4.00	10.00	10.00	28.80	0.00
19623	9629	76	712	2	2022-10-22	7	4.00	40.00	40.00	268.80	0.00
19624	9630	76	1548	2	2023-05-05	2	4.00	0.00	0.00	0.00	0.00
19625	9631	383	99	2	2023-08-22	3	2.00	10.00	10.00	29.40	0.00
19626	9632	383	1621	2	2023-06-28	6	3.00	170.00	180.00	1047.60	58.20
19627	9633	42	1202	2	2023-08-12	8	4.00	80.00	90.00	691.20	76.80
19628	9634	422	1014	5	2022-04-04	3	3.00	140.00	180.00	523.80	116.40
19629	9635	422	76	5	2023-09-25	7	5.00	80.00	80.00	532.00	0.00
19630	9636	422	1689	5	2022-01-31	9	5.00	1320.00	1630.00	13936.50	2650.50
19631	9637	153	569	2	2022-05-07	2	4.00	110.00	140.00	268.80	57.60
19632	9638	153	963	2	2022-04-23	4	3.00	670.00	730.00	2832.40	232.80
19633	9639	4	1829	1	2022-03-26	2	3.00	10.00	10.00	19.40	0.00
19634	9640	5	595	1	2022-11-27	13	5.00	3530.00	4300.00	53105.00	9509.50
19635	9641	237	106	2	2023-01-15	5	3.00	20.00	20.00	97.00	0.00
19636	9642	237	357	2	2023-10-14	5	3.00	190.00	200.00	970.00	48.50
19637	9643	237	1854	2	2022-10-31	6	5.00	400.00	440.00	2508.00	228.00
19638	9644	237	1497	2	2023-02-27	2	2.00	460.00	480.00	940.80	39.20
19639	9645	406	1098	2	2023-11-08	7	4.00	70.00	90.00	604.80	134.40
19640	9646	406	211	2	2022-02-25	2	2.00	40.00	40.00	78.40	0.00
19641	9647	406	262	2	2022-01-19	2	2.00	70.00	70.00	137.20	0.00
19642	9648	1241	1126	2	2022-04-05	4	4.00	210.00	220.00	844.80	38.40
19643	9649	1241	540	2	2022-09-14	3	3.00	240.00	280.00	814.80	116.40
19644	9650	70	1249	2	2023-09-07	8	2.00	3000.00	3410.00	26734.40	3214.40
19645	9651	70	1561	2	2022-08-16	9	5.00	30.00	40.00	342.00	85.50
19646	9652	70	792	2	2023-01-30	2	5.00	50.00	60.00	114.00	19.00
19647	9653	70	1072	2	2022-07-16	6	5.00	550.00	600.00	3420.00	285.00
19648	9654	527	1581	2	2022-07-02	2	5.00	90.00	100.00	190.00	19.00
19649	9655	527	1264	2	2022-12-21	2	5.00	0.00	0.00	0.00	0.00
19650	9656	134	1417	2	2023-08-17	3	4.00	90.00	100.00	288.00	28.80
19651	9657	134	592	2	2023-03-21	1	5.00	0.00	0.00	0.00	0.00
19652	9658	134	1732	2	2023-06-01	4	4.00	10.00	10.00	38.40	0.00
19653	9659	134	1579	2	2022-02-20	4	2.00	470.00	580.00	2273.60	431.20
19654	9660	518	1551	1	2023-07-24	5	3.00	20.00	20.00	97.00	0.00
19655	9661	958	1462	2	2023-01-22	9	4.00	2720.00	3020.00	26092.80	2592.00
19656	9662	958	1557	2	2022-02-23	2	2.00	30.00	30.00	58.80	0.00
19657	9663	958	257	2	2022-01-01	3	5.00	430.00	480.00	1368.00	142.50
19658	9664	10	558	2	2023-11-18	3	2.00	160.00	190.00	558.60	88.20
19659	9665	298	645	7	2022-08-16	2	2.00	10.00	10.00	19.60	0.00
19660	9666	14	893	2	2022-06-15	3	4.00	100.00	120.00	345.60	57.60
19661	9667	14	1380	2	2022-02-03	3	3.00	10.00	10.00	29.10	0.00
19662	9668	1242	508	2	2022-05-08	7	3.00	20.00	20.00	135.80	0.00
19663	9669	1242	245	2	2023-06-22	3	4.00	60.00	70.00	201.60	28.80
19664	9670	712	640	2	2022-07-20	3	5.00	10.00	10.00	28.50	0.00
19665	9671	771	1176	5	2022-12-02	7	2.00	50.00	60.00	411.60	68.60
19666	9672	1243	896	2	2023-05-31	5	4.00	20.00	20.00	96.00	0.00
19667	9673	282	1232	2	2022-09-12	2	3.00	10.00	10.00	19.40	0.00
19668	9674	282	1861	2	2022-01-15	5	4.00	1280.00	1500.00	7200.00	1056.00
19669	9675	141	1292	1	2022-07-31	1	3.00	20.00	30.00	29.10	9.70
19670	9676	639	1164	2	2022-03-24	4	2.00	30.00	40.00	156.80	39.20
19671	9677	813	762	2	2022-01-31	6	3.00	50.00	60.00	349.20	58.20
19672	9678	253	373	2	2022-07-21	3	2.00	10.00	10.00	29.40	0.00
19673	9679	253	1840	2	2022-07-07	1	4.00	10.00	10.00	9.60	0.00
19674	9680	60	766	2	2022-01-04	2	3.00	290.00	320.00	620.80	58.20
19675	9681	60	919	2	2022-02-17	9	5.00	620.00	670.00	5728.50	427.50
19676	9682	37	1364	2	2022-08-06	3	2.00	10.00	10.00	29.40	0.00
19677	9683	37	861	2	2022-09-04	6	5.00	30.00	40.00	228.00	57.00
19678	9684	37	1002	2	2023-03-13	8	4.00	190.00	200.00	1536.00	76.80
19679	9685	37	1642	2	2023-03-12	2	3.00	10.00	10.00	19.40	0.00
19680	9686	376	1351	1	2023-07-04	1	2.00	20.00	20.00	19.60	0.00
19681	9687	103	629	2	2023-10-11	6	5.00	40.00	40.00	228.00	0.00
19682	9688	1244	626	2	2022-09-23	9	2.00	10.00	10.00	88.20	0.00
19683	9689	261	1484	2	2023-12-18	5	4.00	20.00	30.00	144.00	48.00
19684	9690	261	1420	2	2023-12-18	4	5.00	480.00	500.00	1900.00	76.00
19685	9691	82	825	5	2023-12-15	4	5.00	10.00	10.00	38.00	0.00
19686	9692	188	790	2	2022-01-22	3	2.00	500.00	610.00	1793.40	323.40
19687	9693	818	1355	2	2022-07-23	11	5.00	410.00	470.00	4911.50	627.00
19688	9694	258	1263	1	2022-12-19	6	3.00	30.00	30.00	174.60	0.00
19689	9695	258	504	1	2023-05-31	2	3.00	10.00	10.00	19.40	0.00
19690	9696	291	10	5	2022-12-13	4	3.00	60.00	70.00	271.60	38.80
19691	9697	189	509	1	2023-11-07	5	2.00	450.00	490.00	2401.00	196.00
19692	9698	243	1184	7	2023-01-15	4	5.00	30.00	30.00	114.00	0.00
19693	9699	733	230	2	2023-11-24	3	3.00	20.00	20.00	58.20	0.00
19694	9700	733	1826	2	2022-09-24	4	3.00	50.00	50.00	194.00	0.00
19695	9701	733	1362	2	2022-04-04	3	2.00	160.00	200.00	588.00	117.60
19696	9702	1245	805	2	2022-07-09	2	5.00	0.00	0.00	0.00	0.00
19697	9703	1246	97	2	2022-12-17	1	3.00	10.00	10.00	9.70	0.00
19698	9704	1246	14	2	2022-09-25	5	2.00	730.00	850.00	4165.00	588.00
19699	9705	1246	1813	2	2023-07-14	3	2.00	10.00	10.00	29.40	0.00
19700	9706	37	730	2	2023-06-21	3	5.00	30.00	40.00	114.00	28.50
19701	9707	70	1720	2	2023-04-30	3	3.00	210.00	240.00	698.40	87.30
19702	9708	70	106	2	2023-07-28	3	2.00	10.00	10.00	29.40	0.00
19703	9709	70	1612	2	2023-01-29	2	5.00	20.00	20.00	38.00	0.00
19704	9710	70	419	2	2022-03-26	3	3.00	310.00	340.00	989.40	87.30
19705	9711	130	1305	2	2023-04-04	2	5.00	230.00	270.00	513.00	76.00
19706	9712	130	716	2	2022-12-18	2	4.00	10.00	10.00	19.20	0.00
19707	9713	130	907	2	2023-01-26	6	3.00	940.00	1080.00	6285.60	814.80
19708	9714	130	554	2	2022-10-04	5	2.00	50.00	50.00	245.00	0.00
19709	9715	130	1313	2	2023-10-31	2	4.00	50.00	60.00	115.20	19.20
19710	9716	37	380	2	2022-05-05	2	5.00	50.00	60.00	114.00	19.00
19711	9717	344	1760	1	2023-02-28	4	2.00	30.00	40.00	156.80	39.20
19712	9718	188	126	7	2023-04-12	5	4.00	70.00	80.00	384.00	48.00
19713	9719	188	202	7	2022-09-19	5	5.00	210.00	220.00	1045.00	47.50
19714	9720	552	943	1	2023-04-24	2	4.00	180.00	220.00	422.40	76.80
19715	9721	254	1463	2	2023-05-01	2	2.00	20.00	20.00	39.20	0.00
19716	9722	104	1709	2	2023-11-05	3	2.00	280.00	330.00	970.20	147.00
19717	9723	104	247	2	2023-07-24	3	2.00	70.00	90.00	264.60	58.80
19718	9724	304	698	2	2023-09-16	13	4.00	290.00	300.00	3744.00	124.80
19719	9725	54	662	2	2023-02-02	2	3.00	10.00	10.00	19.40	0.00
19720	9726	1247	1017	5	2023-08-03	3	2.00	80.00	90.00	264.60	29.40
19721	9727	133	1361	5	2023-02-20	7	4.00	250.00	290.00	1948.80	268.80
19722	9728	133	35	5	2022-09-23	5	2.00	790.00	980.00	4802.00	931.00
19723	9729	133	483	5	2022-09-28	2	4.00	0.00	0.00	0.00	0.00
19724	9730	68	1376	2	2022-06-04	2	4.00	10.00	10.00	19.20	0.00
19725	9731	68	766	2	2023-01-31	5	3.00	750.00	810.00	3928.50	291.00
19726	9732	14	1047	2	2023-12-02	8	4.00	30.00	30.00	230.40	0.00
19727	9733	1248	1465	2	2022-12-07	13	3.00	440.00	500.00	6305.00	756.60
19728	9734	1248	1604	2	2022-06-26	2	5.00	20.00	20.00	38.00	0.00
19729	9735	1248	1177	2	2022-07-31	1	3.00	740.00	900.00	873.00	155.20
19730	9736	344	1844	1	2023-03-20	1	4.00	10.00	10.00	9.60	0.00
19731	9737	413	525	2	2023-03-13	2	4.00	250.00	270.00	518.40	38.40
19732	9738	376	1450	2	2022-11-23	2	3.00	250.00	310.00	601.40	116.40
19733	9739	376	909	2	2023-12-15	6	2.00	60.00	70.00	411.60	58.80
19734	9740	376	1182	2	2023-04-18	5	3.00	20.00	20.00	97.00	0.00
19735	9741	376	590	2	2023-01-22	3	3.00	120.00	140.00	407.40	58.20
19736	9742	557	27	2	2023-08-12	5	3.00	3650.00	4400.00	21340.00	3637.50
19737	9743	103	301	2	2022-12-27	5	5.00	60.00	60.00	285.00	0.00
19738	9744	436	1043	2	2022-03-21	3	2.00	10.00	10.00	29.40	0.00
19739	9745	623	557	2	2022-01-11	4	5.00	250.00	270.00	1026.00	76.00
19740	9746	204	343	7	2023-01-18	2	4.00	320.00	360.00	691.20	76.80
19741	9747	204	973	7	2022-05-25	2	5.00	70.00	70.00	133.00	0.00
19742	9748	194	1650	2	2022-11-06	2	4.00	10.00	10.00	19.20	0.00
19743	9749	194	464	2	2022-06-19	4	2.00	650.00	800.00	3136.00	588.00
19744	9750	534	429	2	2023-11-12	2	5.00	150.00	160.00	304.00	19.00
19745	9751	101	1413	2	2023-01-15	2	2.00	10.00	10.00	19.60	0.00
19746	9752	101	1176	2	2022-10-05	3	4.00	30.00	30.00	86.40	0.00
19747	9753	246	745	5	2023-06-17	1	2.00	0.00	0.00	0.00	0.00
19748	9754	261	1571	1	2023-08-20	2	3.00	10.00	10.00	19.40	0.00
19749	9755	261	214	1	2023-01-28	2	2.00	20.00	20.00	39.20	0.00
19750	9756	261	1440	1	2022-10-06	3	4.00	290.00	330.00	950.40	115.20
19751	9757	261	278	1	2022-06-24	2	5.00	260.00	290.00	551.00	57.00
19752	9758	261	1784	1	2022-12-19	5	5.00	170.00	210.00	997.50	190.00
19753	9759	261	250	1	2022-07-08	4	2.00	20.00	20.00	78.40	0.00
19754	9760	142	1132	2	2022-11-24	5	2.00	1220.00	1400.00	6860.00	882.00
19755	9761	1249	1540	2	2023-10-02	2	3.00	0.00	0.00	0.00	0.00
19756	9762	237	1106	2	2023-05-22	3	5.00	220.00	240.00	684.00	57.00
19757	9763	237	1361	2	2023-10-11	2	4.00	70.00	80.00	153.60	19.20
19758	9764	237	1421	2	2023-05-21	2	5.00	210.00	240.00	456.00	57.00
19759	9765	234	140	2	2023-07-15	5	4.00	110.00	140.00	672.00	144.00
19760	9766	382	1182	2	2023-10-05	2	2.00	10.00	10.00	19.60	0.00
19761	9767	382	566	2	2023-04-06	1	3.00	10.00	10.00	9.70	0.00
19762	9768	1166	1046	2	2023-03-22	5	4.00	40.00	50.00	240.00	48.00
19763	9769	337	1306	2	2022-12-07	6	3.00	40.00	50.00	291.00	58.20
19764	9770	477	605	2	2022-05-18	5	2.00	290.00	340.00	1666.00	245.00
19765	9771	477	1129	2	2023-08-25	4	3.00	10.00	10.00	38.80	0.00
19766	9772	477	1277	2	2023-12-21	2	3.00	40.00	40.00	77.60	0.00
19767	9773	125	1091	7	2023-03-27	5	3.00	100.00	120.00	582.00	97.00
19768	9774	185	1624	2	2023-11-22	1	2.00	130.00	140.00	137.20	9.80
19769	9775	73	317	2	2023-10-16	8	2.00	1790.00	2180.00	17091.20	3057.60
19770	9776	73	1475	2	2022-03-29	3	5.00	20.00	20.00	57.00	0.00
19771	9777	73	302	2	2022-05-29	4	2.00	20.00	20.00	78.40	0.00
19772	9778	73	334	2	2022-07-05	9	4.00	360.00	430.00	3715.20	604.80
19773	9779	73	214	2	2022-11-30	5	3.00	10.00	10.00	48.50	0.00
19774	9780	73	1205	2	2023-11-16	2	4.00	0.00	0.00	0.00	0.00
19775	9781	365	1286	2	2023-03-07	3	3.00	380.00	440.00	1280.40	174.60
19776	9782	365	1179	2	2023-04-15	2	2.00	580.00	670.00	1313.20	176.40
19777	9783	1230	520	1	2023-03-08	5	5.00	220.00	270.00	1282.50	237.50
19778	9784	1230	822	1	2023-11-30	1	5.00	60.00	60.00	57.00	0.00
19779	9785	1230	1380	1	2023-03-08	2	5.00	10.00	10.00	19.00	0.00
19780	9786	226	1527	2	2023-03-23	3	5.00	50.00	50.00	142.50	0.00
19781	9787	851	1145	7	2022-06-24	5	4.00	130.00	150.00	720.00	96.00
19782	9788	35	790	2	2023-01-07	5	3.00	860.00	1020.00	4947.00	776.00
19783	9789	35	121	2	2023-04-07	3	2.00	480.00	600.00	1764.00	352.80
19784	9790	35	649	2	2022-05-09	1	4.00	30.00	40.00	38.40	9.60
19785	9791	35	1319	2	2023-05-16	2	3.00	170.00	210.00	407.40	77.60
19786	9792	35	1041	1	2022-12-31	6	4.00	60.00	60.00	345.60	0.00
19787	9793	35	390	1	2023-01-23	2	5.00	100.00	110.00	209.00	19.00
19788	9794	35	671	1	2023-07-29	1	4.00	0.00	0.00	0.00	0.00
19789	9795	35	1000	1	2023-04-14	3	4.00	20.00	20.00	57.60	0.00
19790	9796	322	859	2	2022-11-03	3	4.00	0.00	0.00	0.00	0.00
19791	9797	327	314	2	2023-05-11	2	3.00	10.00	10.00	19.40	0.00
19792	9798	327	35	2	2022-11-08	2	2.00	210.00	240.00	470.40	58.80
19793	9799	327	1354	2	2023-06-02	4	2.00	30.00	30.00	117.60	0.00
19794	9800	327	1695	2	2023-10-27	2	4.00	10.00	10.00	19.20	0.00
19795	9801	327	477	2	2023-09-23	3	5.00	90.00	110.00	313.50	57.00
19796	9802	1250	1206	2	2022-06-04	7	3.00	90.00	100.00	679.00	67.90
19797	9803	104	74	1	2022-08-29	2	3.00	0.00	0.00	0.00	0.00
19798	9804	104	1237	1	2022-11-13	1	2.00	130.00	140.00	137.20	9.80
19799	9805	104	1257	1	2023-02-16	1	4.00	10.00	10.00	9.60	0.00
19800	9806	604	1147	2	2023-03-27	2	4.00	40.00	50.00	96.00	19.20
19801	9807	604	1225	2	2023-02-13	8	4.00	30.00	30.00	230.40	0.00
19802	9808	716	65	1	2023-12-16	4	4.00	170.00	190.00	729.60	76.80
19803	9809	118	1086	2	2023-01-08	2	2.00	0.00	0.00	0.00	0.00
19804	9810	113	89	1	2023-10-28	5	3.00	30.00	30.00	145.50	0.00
19805	9811	113	979	1	2023-03-20	4	2.00	110.00	120.00	470.40	39.20
19806	9812	1220	1415	5	2022-04-29	4	5.00	30.00	30.00	114.00	0.00
19807	9813	1220	333	5	2022-02-09	3	4.00	30.00	30.00	86.40	0.00
19808	9814	1220	840	5	2023-08-26	5	3.00	170.00	200.00	970.00	145.50
19809	9815	1220	1400	5	2023-02-16	5	3.00	60.00	80.00	388.00	97.00
19810	9816	124	1324	2	2023-02-27	7	4.00	160.00	170.00	1142.40	67.20
19811	9817	124	766	2	2022-02-16	4	3.00	420.00	520.00	2017.60	388.00
19812	9818	124	1436	2	2023-11-01	7	2.00	150.00	170.00	1166.20	137.20
19813	9819	124	450	2	2022-07-12	2	2.00	0.00	0.00	0.00	0.00
19814	9820	124	1551	2	2022-07-22	3	5.00	10.00	10.00	28.50	0.00
19815	9821	124	1738	2	2022-06-02	10	2.00	40.00	40.00	392.00	0.00
19816	9822	124	472	2	2022-08-23	2	5.00	20.00	20.00	38.00	0.00
19817	9823	37	544	2	2022-12-16	3	2.00	140.00	150.00	441.00	29.40
19818	9824	37	1091	2	2022-04-23	3	3.00	80.00	90.00	261.90	29.10
19819	9825	37	79	2	2022-04-23	4	3.00	20.00	20.00	77.60	0.00
19820	9826	37	613	2	2022-07-06	3	2.00	40.00	50.00	147.00	29.40
19821	9827	37	1226	2	2023-06-17	4	3.00	190.00	200.00	776.00	38.80
19822	9828	49	558	2	2023-07-08	2	3.00	110.00	130.00	252.20	38.80
19823	9829	49	545	2	2022-01-28	3	5.00	10.00	10.00	28.50	0.00
19824	9830	47	39	2	2023-06-12	3	4.00	200.00	240.00	691.20	115.20
19825	9831	1066	1337	1	2023-03-27	4	4.00	260.00	320.00	1228.80	230.40
19826	9832	1066	51	1	2022-07-27	7	2.00	10.00	10.00	68.60	0.00
19827	9833	89	1051	1	2022-11-25	1	5.00	0.00	0.00	0.00	0.00
19828	9834	291	266	2	2022-10-16	7	5.00	790.00	900.00	5985.00	731.50
19829	9835	1251	1458	5	2023-11-21	4	3.00	10.00	10.00	38.80	0.00
19830	9836	1251	801	5	2023-11-24	2	4.00	20.00	20.00	38.40	0.00
19831	9837	206	835	2	2022-05-12	5	2.00	10.00	10.00	49.00	0.00
19832	9838	206	430	2	2022-07-09	2	3.00	30.00	30.00	58.20	0.00
19833	9839	206	1141	2	2023-03-01	1	3.00	0.00	0.00	0.00	0.00
19834	9840	206	1688	2	2022-07-25	3	3.00	420.00	480.00	1396.80	174.60
19835	9841	206	1710	2	2023-10-26	8	2.00	30.00	40.00	313.60	78.40
19836	9842	206	827	2	2023-07-10	2	5.00	10.00	10.00	19.00	0.00
19837	9843	206	663	2	2023-08-22	4	5.00	440.00	480.00	1824.00	152.00
19838	9844	172	1141	5	2023-01-22	4	5.00	20.00	20.00	76.00	0.00
19839	9845	172	505	5	2023-03-04	7	4.00	50.00	60.00	403.20	67.20
19840	9846	172	1126	5	2022-08-22	3	4.00	120.00	130.00	374.40	28.80
19841	9847	329	23	1	2022-05-23	5	5.00	30.00	40.00	190.00	47.50
19842	9848	329	744	1	2022-07-04	5	3.00	460.00	510.00	2473.50	242.50
19843	9849	329	806	1	2022-09-26	5	5.00	130.00	150.00	712.50	95.00
19844	9850	1252	1572	2	2022-08-05	2	4.00	40.00	40.00	76.80	0.00
19845	9851	253	546	2	2022-05-26	2	4.00	10.00	10.00	19.20	0.00
19846	9852	253	444	2	2023-08-10	3	3.00	80.00	90.00	261.90	29.10
19847	9853	253	1222	2	2023-06-15	2	2.00	10.00	10.00	19.60	0.00
19848	9854	253	593	2	2023-03-22	5	5.00	180.00	210.00	997.50	142.50
19849	9855	10	1599	2	2022-02-13	4	5.00	40.00	50.00	190.00	38.00
19850	9856	10	1494	2	2022-12-13	2	4.00	20.00	20.00	38.40	0.00
19851	9857	375	58	2	2023-07-27	6	4.00	30.00	40.00	230.40	57.60
19852	9858	237	412	2	2022-09-07	8	4.00	2880.00	3390.00	26035.20	3916.80
19853	9859	342	147	2	2023-10-04	5	5.00	60.00	70.00	332.50	47.50
19854	9860	342	243	2	2022-08-13	2	2.00	0.00	0.00	0.00	0.00
19855	9861	342	1050	2	2022-06-07	4	3.00	70.00	70.00	271.60	0.00
19856	9862	342	1191	2	2023-11-06	2	3.00	20.00	20.00	38.80	0.00
19857	9863	342	428	2	2023-01-30	4	4.00	10.00	10.00	38.40	0.00
19858	9864	342	753	2	2023-10-02	1	3.00	10.00	10.00	9.70	0.00
19859	9865	342	241	2	2022-07-16	4	2.00	150.00	160.00	627.20	39.20
19860	9866	342	1184	2	2023-03-27	2	5.00	20.00	20.00	38.00	0.00
19861	9867	253	1450	1	2022-07-12	7	2.00	980.00	1090.00	7477.40	754.60
19862	9868	253	1519	1	2023-12-11	3	3.00	10.00	10.00	29.10	0.00
19863	9869	1253	593	5	2022-11-16	2	4.00	60.00	70.00	134.40	19.20
19864	9870	1253	1582	5	2023-01-02	2	5.00	0.00	0.00	0.00	0.00
19865	9871	1253	445	5	2022-03-07	3	2.00	20.00	20.00	58.80	0.00
19866	9872	118	246	7	2023-07-16	2	4.00	230.00	290.00	556.80	115.20
19867	9873	118	788	7	2022-08-08	2	4.00	20.00	20.00	38.40	0.00
19868	9874	126	1517	2	2022-05-01	1	5.00	10.00	10.00	9.50	0.00
19869	9875	1254	890	1	2022-11-03	2	3.00	50.00	60.00	116.40	19.40
19870	9876	134	1848	2	2022-02-06	2	2.00	10.00	10.00	19.60	0.00
19871	9877	906	1245	5	2022-01-10	4	2.00	770.00	850.00	3332.00	313.60
19872	9878	906	1459	5	2023-11-06	5	2.00	10.00	10.00	49.00	0.00
19873	9879	906	1788	5	2023-02-06	3	2.00	100.00	120.00	352.80	58.80
19874	9880	134	956	2	2023-09-25	7	5.00	530.00	570.00	3790.50	266.00
19875	9881	906	259	5	2022-01-09	3	3.00	70.00	90.00	261.90	58.20
19876	9882	1255	606	5	2023-01-02	3	5.00	10.00	10.00	28.50	0.00
19877	9883	1255	918	5	2022-12-24	13	5.00	250.00	270.00	3334.50	247.00
19878	9884	177	408	2	2023-08-25	2	2.00	10.00	10.00	19.60	0.00
19879	9885	177	1197	2	2023-09-20	3	5.00	50.00	60.00	171.00	28.50
19880	9886	177	1106	2	2022-09-05	2	3.00	140.00	160.00	310.40	38.80
19881	9887	573	495	2	2023-07-10	3	4.00	10.00	10.00	28.80	0.00
19882	9888	104	1232	5	2022-07-23	2	5.00	10.00	10.00	19.00	0.00
19883	9889	984	1106	2	2023-03-10	1	2.00	60.00	80.00	78.40	19.60
19884	9890	708	1702	5	2022-10-16	3	3.00	10.00	10.00	29.10	0.00
19885	9891	269	1541	1	2023-07-26	2	2.00	20.00	20.00	39.20	0.00
19886	9892	269	937	1	2023-05-21	7	3.00	110.00	120.00	814.80	67.90
19887	9893	269	477	1	2023-01-02	5	3.00	260.00	300.00	1455.00	194.00
19888	9894	269	1720	1	2023-05-05	4	4.00	340.00	400.00	1536.00	230.40
19889	9895	269	286	1	2023-10-16	5	2.00	80.00	100.00	490.00	98.00
19890	9896	118	1564	2	2022-07-25	11	3.00	140.00	150.00	1600.50	106.70
19891	9897	194	1670	1	2022-03-17	2	5.00	50.00	60.00	114.00	19.00
19892	9898	478	623	2	2023-12-29	3	4.00	390.00	470.00	1353.60	230.40
19893	9899	478	1705	2	2023-02-27	2	5.00	70.00	80.00	152.00	19.00
19894	9900	318	595	2	2023-06-26	1	2.00	290.00	330.00	323.40	39.20
19895	9901	157	596	2	2023-05-14	3	5.00	210.00	240.00	684.00	85.50
19896	9902	157	1184	2	2023-05-29	3	4.00	20.00	20.00	57.60	0.00
19897	9903	157	145	2	2022-02-17	1	2.00	10.00	10.00	9.80	0.00
19898	9904	433	1378	2	2023-10-09	3	2.00	30.00	30.00	88.20	0.00
19899	9905	433	429	2	2022-04-05	2	2.00	110.00	130.00	254.80	39.20
19900	9906	200	1156	5	2022-10-27	7	5.00	110.00	130.00	864.50	133.00
19901	9907	200	1125	5	2022-11-21	3	5.00	30.00	30.00	85.50	0.00
19902	9908	200	1181	5	2022-07-06	3	4.00	680.00	720.00	2073.60	115.20
19903	9909	200	1485	5	2023-07-15	5	3.00	180.00	210.00	1018.50	145.50
19904	9910	200	944	5	2023-04-25	3	4.00	30.00	40.00	115.20	28.80
19905	9911	200	922	5	2023-09-05	2	4.00	180.00	210.00	403.20	57.60
19906	9912	155	92	2	2022-03-23	7	4.00	100.00	120.00	806.40	134.40
19907	9913	1145	1319	5	2022-10-06	3	3.00	330.00	360.00	1047.60	87.30
19908	9914	1145	1656	5	2022-03-15	3	4.00	20.00	30.00	86.40	28.80
19909	9915	1256	1466	1	2022-12-18	2	2.00	10.00	10.00	19.60	0.00
19910	9916	1256	641	1	2023-01-22	5	2.00	70.00	90.00	441.00	98.00
19911	9917	1256	147	1	2022-10-25	1	2.00	10.00	10.00	9.80	0.00
19912	9918	1256	528	1	2023-04-09	3	3.00	10.00	10.00	29.10	0.00
19913	9919	134	890	2	2022-07-05	1	2.00	30.00	40.00	39.20	9.80
19914	9920	1257	84	2	2022-04-03	5	2.00	460.00	530.00	2597.00	343.00
19915	9921	1257	1400	2	2023-07-13	7	2.00	20.00	20.00	137.20	0.00
19916	9922	1157	850	2	2023-04-15	3	2.00	10.00	10.00	29.40	0.00
19917	9923	194	877	2	2023-08-01	4	3.00	160.00	190.00	737.20	116.40
19918	9924	49	351	5	2023-07-02	3	5.00	40.00	50.00	142.50	28.50
19919	9925	49	245	5	2023-01-28	1	5.00	20.00	20.00	19.00	0.00
19920	9926	49	14	5	2023-02-17	8	3.00	950.00	1090.00	8458.40	1086.40
19921	9927	49	967	5	2022-01-25	2	3.00	160.00	200.00	388.00	77.60
19922	9928	49	1223	5	2023-06-15	4	2.00	70.00	80.00	313.60	39.20
19923	9929	37	75	7	2022-08-03	3	3.00	20.00	20.00	58.20	0.00
19924	9930	37	1294	7	2022-07-13	5	4.00	2380.00	2800.00	13440.00	2016.00
19925	9931	508	1489	2	2023-08-02	2	2.00	10.00	10.00	19.60	0.00
19926	9932	508	1374	2	2022-04-28	4	3.00	560.00	680.00	2638.40	465.60
19927	9933	508	1533	2	2023-03-04	7	4.00	30.00	30.00	201.60	0.00
19928	9934	1258	1515	5	2022-05-10	3	3.00	140.00	160.00	465.60	58.20
19929	9935	210	1804	2	2022-01-04	3	5.00	30.00	30.00	85.50	0.00
19930	9936	210	1862	2	2023-02-10	3	2.00	30.00	40.00	117.60	29.40
19931	9937	811	142	2	2023-10-01	3	5.00	90.00	100.00	285.00	28.50
19932	9938	19	973	1	2023-01-16	2	5.00	60.00	70.00	133.00	19.00
19933	9939	253	442	2	2023-10-14	5	3.00	50.00	60.00	291.00	48.50
19934	9940	253	1281	2	2022-10-28	4	4.00	40.00	40.00	153.60	0.00
19935	9941	253	903	2	2023-03-30	7	4.00	10.00	10.00	67.20	0.00
19936	9942	37	405	2	2022-07-21	14	5.00	180.00	220.00	2926.00	532.00
19937	9943	646	1440	2	2022-04-08	9	3.00	950.00	1000.00	8730.00	436.50
19938	9944	646	683	2	2022-12-06	5	2.00	40.00	50.00	245.00	49.00
19939	9945	551	1034	1	2022-09-25	3	3.00	30.00	40.00	116.40	29.10
19940	9946	86	1451	2	2023-06-26	1	4.00	0.00	0.00	0.00	0.00
19941	9947	86	726	2	2022-04-16	3	2.00	120.00	150.00	441.00	88.20
19942	9948	488	624	1	2022-10-31	6	4.00	1600.00	1930.00	11116.80	1900.80
19943	9949	488	228	1	2022-09-13	8	3.00	1950.00	2410.00	18701.60	3569.60
19944	9950	488	1131	1	2022-01-07	3	3.00	70.00	80.00	232.80	29.10
19945	9951	488	686	1	2022-03-19	1	3.00	40.00	40.00	38.80	0.00
19946	9952	488	845	1	2022-04-07	2	3.00	20.00	20.00	38.80	0.00
19947	9953	156	304	1	2022-09-28	2	4.00	50.00	60.00	115.20	19.20
19948	9954	156	1348	1	2022-10-27	1	2.00	10.00	10.00	9.80	0.00
19949	9955	156	1396	1	2023-08-02	3	2.00	20.00	30.00	88.20	29.40
19950	9956	156	976	1	2022-03-18	2	2.00	220.00	270.00	529.20	98.00
19951	9957	161	1287	2	2022-10-10	5	2.00	50.00	50.00	245.00	0.00
19952	9958	161	1559	2	2023-01-03	4	4.00	210.00	220.00	844.80	38.40
19953	9959	161	504	2	2023-12-21	2	3.00	10.00	10.00	19.40	0.00
19954	9960	950	1664	2	2023-02-09	2	2.00	10.00	10.00	19.60	0.00
19955	9961	1259	1543	1	2023-02-26	1	5.00	20.00	20.00	19.00	0.00
19956	9962	17	1128	5	2022-04-18	2	4.00	60.00	70.00	134.40	19.20
19957	9963	17	1602	5	2022-09-02	4	3.00	320.00	380.00	1474.40	232.80
19958	9964	12	935	7	2022-01-17	2	3.00	10.00	10.00	19.40	0.00
19959	9965	417	279	1	2023-07-08	1	3.00	10.00	10.00	9.70	0.00
19960	9966	417	812	1	2022-12-31	1	5.00	0.00	0.00	0.00	0.00
19961	9967	417	1359	1	2022-02-21	7	4.00	100.00	110.00	739.20	67.20
19962	9968	595	1233	2	2022-10-02	5	2.00	30.00	40.00	196.00	49.00
19963	9969	595	1499	2	2023-04-15	2	3.00	700.00	740.00	1435.60	77.60
19964	9970	595	190	2	2023-11-18	7	5.00	20.00	20.00	133.00	0.00
19965	9971	392	980	2	2023-05-04	2	2.00	110.00	120.00	235.20	19.60
19966	9972	392	1270	2	2023-07-27	5	4.00	110.00	140.00	672.00	144.00
19967	9973	188	634	2	2022-04-07	2	2.00	90.00	100.00	196.00	19.60
19968	9974	80	1788	2	2023-03-07	5	4.00	230.00	270.00	1296.00	192.00
19969	9975	80	1127	2	2022-11-17	7	2.00	20.00	20.00	137.20	0.00
19970	9976	80	579	2	2023-12-16	2	4.00	10.00	10.00	19.20	0.00
19971	9977	80	496	2	2022-09-11	2	5.00	200.00	250.00	475.00	95.00
19972	9978	80	495	2	2023-12-03	7	4.00	10.00	10.00	67.20	0.00
19973	9979	80	808	2	2023-06-05	4	4.00	10.00	10.00	38.40	0.00
19974	9980	80	921	2	2023-10-12	14	3.00	410.00	440.00	5975.20	407.40
19975	9981	439	978	1	2023-06-26	1	2.00	80.00	90.00	88.20	9.80
19976	9982	478	618	5	2022-11-14	5	5.00	20.00	20.00	95.00	0.00
19977	9983	1166	728	2	2023-05-27	7	4.00	40.00	40.00	268.80	0.00
19978	9984	1166	1693	2	2022-09-14	2	4.00	80.00	100.00	192.00	38.40
19979	9985	365	366	2	2023-08-04	10	2.00	30.00	30.00	294.00	0.00
19980	9986	365	1206	2	2023-09-30	4	3.00	50.00	60.00	232.80	38.80
19981	9987	204	1520	2	2022-11-30	1	5.00	40.00	40.00	38.00	0.00
19982	9988	1087	1594	2	2023-04-01	1	3.00	80.00	80.00	77.60	0.00
19983	9989	1087	1784	2	2022-11-17	5	5.00	180.00	210.00	997.50	142.50
19984	9990	150	1173	1	2023-02-18	3	4.00	30.00	30.00	86.40	0.00
19985	9991	183	1763	2	2023-03-17	2	4.00	70.00	90.00	172.80	38.40
19986	9992	183	298	2	2022-08-07	2	2.00	220.00	260.00	509.60	78.40
19987	9993	183	957	2	2022-11-19	4	3.00	30.00	30.00	116.40	0.00
19988	9994	409	167	1	2022-07-17	2	3.00	210.00	240.00	465.60	58.20
\.


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 230
-- Name: dim_category_sk_category_seq; Type: SEQUENCE SET; Schema: dwh; Owner: postgres
--

SELECT pg_catalog.setval('dwh.dim_category_sk_category_seq', 17, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 232
-- Name: dim_customer_sk_customer_seq; Type: SEQUENCE SET; Schema: dwh; Owner: postgres
--

SELECT pg_catalog.setval('dwh.dim_customer_sk_customer_seq', 1259, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 234
-- Name: dim_product_sk_product_seq; Type: SEQUENCE SET; Schema: dwh; Owner: postgres
--

SELECT pg_catalog.setval('dwh.dim_product_sk_product_seq', 1862, true);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 236
-- Name: dim_shipping_sk_shipping_seq; Type: SEQUENCE SET; Schema: dwh; Owner: postgres
--

SELECT pg_catalog.setval('dwh.dim_shipping_sk_shipping_seq', 7, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 238
-- Name: fact_sales_trx_id_seq; Type: SEQUENCE SET; Schema: dwh; Owner: postgres
--

SELECT pg_catalog.setval('dwh.fact_sales_trx_id_seq', 19988, true);


--
-- TOC entry 3235 (class 2606 OID 27307)
-- Name: dim_category dim_category_pkey; Type: CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_category
    ADD CONSTRAINT dim_category_pkey PRIMARY KEY (sk_category);


--
-- TOC entry 3237 (class 2606 OID 27316)
-- Name: dim_customer dim_customer_pkey; Type: CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_customer
    ADD CONSTRAINT dim_customer_pkey PRIMARY KEY (sk_customer);


--
-- TOC entry 3239 (class 2606 OID 27323)
-- Name: dim_product dim_product_pkey; Type: CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_product
    ADD CONSTRAINT dim_product_pkey PRIMARY KEY (sk_product);


--
-- TOC entry 3241 (class 2606 OID 27330)
-- Name: dim_shipping dim_shipping_pkey; Type: CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.dim_shipping
    ADD CONSTRAINT dim_shipping_pkey PRIMARY KEY (sk_shipping);


--
-- TOC entry 3243 (class 2606 OID 27337)
-- Name: fact_sales fact_sales_pkey; Type: CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.fact_sales
    ADD CONSTRAINT fact_sales_pkey PRIMARY KEY (trx_id);


--
-- TOC entry 3244 (class 2606 OID 27338)
-- Name: fact_sales fk_fact_customer; Type: FK CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.fact_sales
    ADD CONSTRAINT fk_fact_customer FOREIGN KEY (sk_customer) REFERENCES dwh.dim_customer(sk_customer);


--
-- TOC entry 3245 (class 2606 OID 27343)
-- Name: fact_sales fk_fact_product; Type: FK CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.fact_sales
    ADD CONSTRAINT fk_fact_product FOREIGN KEY (sk_product) REFERENCES dwh.dim_product(sk_product);


--
-- TOC entry 3246 (class 2606 OID 27348)
-- Name: fact_sales fk_fact_shipping; Type: FK CONSTRAINT; Schema: dwh; Owner: postgres
--

ALTER TABLE ONLY dwh.fact_sales
    ADD CONSTRAINT fk_fact_shipping FOREIGN KEY (sk_shipping) REFERENCES dwh.dim_shipping(sk_shipping);


-- Completed on 2026-06-17 17:43:38

--
-- PostgreSQL database dump complete
--

