CREATE SEQUENCE public.subject_category_seq
    INCREMENT 1
    START 1000
    MINVALUE 1000
    MAXVALUE 10000
    CACHE 1;

CREATE SEQUENCE public.subject_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;



CREATE TABLE public.tbl_subject_category
(
    sub_cat_id smallint NOT NULL DEFAULT nextval('subject_category_seq'::regclass),
    sub_cat_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tbl_subject_category_pkey PRIMARY KEY (sub_cat_id),
    CONSTRAINT tbl_subject_category_sub_cat_name_key UNIQUE (sub_cat_name)
);



CREATE TABLE public.tbl_subject
(
    sub_id smallint NOT NULL DEFAULT nextval('subject_seq'::regclass),
    sub_name character varying(100) COLLATE pg_catalog."default" NOT NULL unique,
	sub_Description character varying(8000),
	sub_cat_id smallint,
    CONSTRAINT subject_id_pkey PRIMARY KEY (sub_id),
	 CONSTRAINT subject_cat_id_fkey foreign key(sub_cat_id) references tbl_subject_category(sub_cat_id)
);
