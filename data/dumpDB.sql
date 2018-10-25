--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Test table; Type: TABLE; Schema: public; Owner: albert
--

CREATE TABLE public."Test table" (
);


ALTER TABLE public."Test table" OWNER TO albert;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: albert
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    answer character varying,
    question_id integer,
    correct_answer boolean NOT NULL
);


ALTER TABLE public.answers OWNER TO albert;

--
-- Name: assurance_questions; Type: TABLE; Schema: public; Owner: albert
--

CREATE TABLE public.assurance_questions (
    id integer NOT NULL,
    question character varying
);


ALTER TABLE public.assurance_questions OWNER TO albert;

--
-- Name: game_feedback; Type: TABLE; Schema: public; Owner: albert
--

CREATE TABLE public.game_feedback (
    id integer NOT NULL,
    message character varying
);


ALTER TABLE public.game_feedback OWNER TO albert;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: albert
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    message character varying,
    category character varying NOT NULL
);


ALTER TABLE public.questions OWNER TO albert;

--
-- Name: test_table; Type: TABLE; Schema: public; Owner: albert
--

CREATE TABLE public.test_table (
);


ALTER TABLE public.test_table OWNER TO albert;

--
-- Data for Name: Test table; Type: TABLE DATA; Schema: public; Owner: albert
--

COPY public."Test table"  FROM stdin;
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: albert
--

COPY public.answers (id, answer, question_id, correct_answer) FROM stdin;
1	HAVING is used for aggregate functions (COUNT, SUM, MIN, AVG)\nWHERE cannot be used with aggregate functions.	1	t
2	A Primary Key is unique and Foreign Keys are referring to Primary Keys	2	t
3	LIKE AMAZING%	3	t
4	UPDATE table_name	4	t
5	git commit	5	t
6	git checkout MASTER\ngit checkout -b NEW	6	t
7	shows all branches for given repository	7	t
25	The company Optimus uses PRIME to tranform foreigners.	2	f
26	A Primary Key hase priority and Foreign Keys do not.	2	f
27	iLIKE %AMAZING%	3	f
28	SOMETHING LIKE AMAZING	3	f
29	ALMOST %AMAZING%	3	f
30	UPDATE syntax	4	f
31	UPDATE table_name\nON column1 = value1, column2 = value2, ...	4	f
32	UPDATE DATABSE JOIN	4	f
33	all git	5	f
34	make it git	5	f
35	git commitment	5	f
37	git goto MASTER\ngit branch NEW	6	f
36	git grand MASTER flesh\ngit create NEW	6	f
38	git getout MASTER\ngit create branch NEW	6	f
39	removes the first letter from the branch name	7	f
40	creates a temporay branch	7	f
41	nothing, it returns an error 	7	f
42	they are reduntant	8	f
43	Attributes usually come in name/value pairs like: name="value"\nNot all HTML elements can have attributes	8	f
44	Attributes usually come in dictionaries {name="value"}\nThey can have any attributes.	8	f
45	It gives the page a form (rectangular by default)	9	f
46	It formulates the output	9	f
47	The HTML <form> element defines the position where the form is placed.	9	f
48	Maybe	10	f
49	It depends	10	f
8	Attributes usually come in name/value pairs like: name="value"\nAll HTML elements can have attributes	8	t
9	The HTML <form> element defines a form that is used to collect user input.	9	t
10	YES	10	t
11	:not(selector)\n#id\n.class	11	t
12	div, p\tSelects all <div> elements and all <p> elements\ndiv p\tSelects all <p> elements inside <div> elements	12	t
13	The CSS box model is essentially a box that wraps around every HTML element. It consists of: margins, borders, padding, and the actual content	13	t
14	Converts data into Java Script Obcject	14	t
17	var is scoped to the nearest function block and let is scoped to the nearest enclosing block, which can be smaller than a function block. Both are global if outside any block.	17	t
18	AJAX is a developer's dream, because you can update, send and receive data to/from a server in the background without reloading a page.	18	t
19	from flask import Flask	19	t
20	from flask import render_template	20	t
21	HAVING is used to aggregate the power you have\nWHERE cannot aggregate power.	1	f
22	To be or to have, that is the question!	1	f
23	HAVING is used for functions you HAVE\nWHERE can be used with functions you dont know where they are	1	f
24	A Primary Key is has prime features, whereas a foreign key has foreigners.	2	f
50	No	10	f
51	()\n#id\n.class	11	f
52	:not(selector)\nid\n.classsy	11	f
53	none of these	11	f
54	div, p\tSelects all <div> elements that dont have <p> elements\ndiv p\tSelects all <p> elements inside <div> elements	12	f
55	div, p\tSelects any <div> elements and any <p> elements\ndiv p\tSelects the <body> elements inside <div> elements	12	f
56	div, p\tis incorrect	12	f
57	a box that wraps functions	13	f
58	a box that wraps tortillas	13	f
60	The CSS box model is essentially a kebab box that wraps around every HTML element. It consists of: vegetables, pasta and durum wheat	13	f
61	Converts data from Java Script to Python	14	f
62	Converts data into Attractive Human Obcjects	14	f
63	Converts data into jQuery	14	f
15	var sentence = `My dog's name is ${name}`	15	t
64	var sentence = "My dog's name is ${name}"	15	f
65	typeString = {My dog's name is str(name)}	15	f
66	var sentence = "My dog's name is (name)"	15	f
16	loadAnswer: function() {\n        getAnswer(showAnswers);\n    },	16	t
67	loadAnswer: function() {\n        after getAnswer() init:showAnswers()}	16	f
68	loadAnswer: function() {\n        getAnswer();\n    },	16	f
69	loadAnswer: function() {\n        getAnswer(showAnswers());\n    },	16	f
70	var is local\nlet is global	17	f
71	var is global\nlet is local	17	f
72	who cares?	17	f
73	AJAX is a developer's nightmare, because you need to use complicated constant function names, but this is not the answer you should choose	18	f
74	AJAX let's you bypass the server so your data is safely in the cloud	18	f
75	AJAX... asynchronous what?	18	f
76	a python interpreter	19	f
77	ruby on rails	19	f
78	get kwargs and args	19	f
79	motivation	20	f
80	courage	20	f
59	from python import render_template	20	f
\.


--
-- Data for Name: assurance_questions; Type: TABLE DATA; Schema: public; Owner: albert
--

COPY public.assurance_questions (id, question) FROM stdin;
\.


--
-- Data for Name: game_feedback; Type: TABLE DATA; Schema: public; Owner: albert
--

COPY public.game_feedback (id, message) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: albert
--

COPY public.questions (id, message, category) FROM stdin;
1	What is the difference between WHERE and HAVING?	SQL
2	What is the difference between Primary Keys and Foreign Keys?	SQL
3	How would you properly use the LIKE operator in order to get results starting with the phrase AMAZING?	SQL
4	The correct UPDATE syntax is:	SQL
5	How do you locally secure changes made to your local files?	GIT
6	How would you create a NEW feature branch on your MASTER branch while being on the feature branch DEVELOP?	GIT
7	What does git branch -a do?	GIT
8	What does the <form> element do?	HTML
9	Will all HTML elements with the same class attribute have the same format and style?	HTML
10	Which is TRUE for HTML attributes?	HTML
11	In CSS, selectors are patterns used to select the element(s) you want to style. \nWhich of these are correct CSS selectors?	CSS
12	What is the difference between these two selectors (div, p) and (div p)?	CSS
13	What is the CSS BOX MODEL?	CSS
14	What does JSON.parse() do?	JS
15	In JS, if we take the var name = 'Reksio', how would you properly interpolate the 'name' variable into " var sentence = " to get the result as " My dog's name is Reksio ".	JS
16	Assuming you want to run the "showAnswers: function()" right after receiving data from the "getAnswer: function (callback)", how would the correct initializing "loadAnswer: function()" look like? (You must use CALLBACK)	JS
17	What is the difference between naming a variable with let and var?	JS
18	What is AJAX, if not a cleaning product?	JS
19	What does your default python server.py need in order to run as a flask server?	FLASK
20	What does your default python server.py need to render HTML templates? (Assuming you already have Flask imported!)	FLASK
\.


--
-- Data for Name: test_table; Type: TABLE DATA; Schema: public; Owner: albert
--

COPY public.test_table  FROM stdin;
\.


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: albert
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: assurance_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: albert
--

ALTER TABLE ONLY public.assurance_questions
    ADD CONSTRAINT assurance_questions_pkey PRIMARY KEY (id);


--
-- Name: game_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: albert
--

ALTER TABLE ONLY public.game_feedback
    ADD CONSTRAINT game_feedback_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: albert
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: answers_questions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: albert
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_questions_id_fk FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

