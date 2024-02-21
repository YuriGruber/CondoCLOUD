PGDMP                      |         
   condominio    16.1    16.0 (               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394 
   condominio    DATABASE     �   CREATE DATABASE condominio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE condominio;
                postgres    false            �            1259    32842    area    TABLE     X   CREATE TABLE public.area (
    id_area integer NOT NULL,
    nome_area text NOT NULL
);
    DROP TABLE public.area;
       public         heap    postgres    false            �            1259    32841    area_id_area_seq    SEQUENCE     �   CREATE SEQUENCE public.area_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.area_id_area_seq;
       public          postgres    false    218                       0    0    area_id_area_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.area_id_area_seq OWNED BY public.area.id_area;
          public          postgres    false    217            �            1259    32833 
   condominio    TABLE     j   CREATE TABLE public.condominio (
    id_condominio integer NOT NULL,
    nome_condominio text NOT NULL
);
    DROP TABLE public.condominio;
       public         heap    postgres    false            �            1259    32832    condominio_id_condominio_seq    SEQUENCE     �   CREATE SEQUENCE public.condominio_id_condominio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.condominio_id_condominio_seq;
       public          postgres    false    216                       0    0    condominio_id_condominio_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.condominio_id_condominio_seq OWNED BY public.condominio.id_condominio;
          public          postgres    false    215            �            1259    32850    estrutura_condominio    TABLE     o   CREATE TABLE public.estrutura_condominio (
    id_condominio integer NOT NULL,
    id_area integer NOT NULL
);
 (   DROP TABLE public.estrutura_condominio;
       public         heap    postgres    false            �            1259    32878    reserva    TABLE     �   CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    id_area integer NOT NULL,
    id_usuario integer NOT NULL,
    id_condominio integer NOT NULL,
    data date NOT NULL
);
    DROP TABLE public.reserva;
       public         heap    postgres    false            �            1259    32877    reserva_id_reserva_seq    SEQUENCE     �   CREATE SEQUENCE public.reserva_id_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.reserva_id_reserva_seq;
       public          postgres    false    223                       0    0    reserva_id_reserva_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.reserva_id_reserva_seq OWNED BY public.reserva.id_reserva;
          public          postgres    false    222            �            1259    32864    usuario    TABLE     �   CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_condominio integer NOT NULL,
    nome_usuario text NOT NULL,
    senha text NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    32863    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    221                       0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public          postgres    false    220            d           2604    32845    area id_area    DEFAULT     l   ALTER TABLE ONLY public.area ALTER COLUMN id_area SET DEFAULT nextval('public.area_id_area_seq'::regclass);
 ;   ALTER TABLE public.area ALTER COLUMN id_area DROP DEFAULT;
       public          postgres    false    218    217    218            c           2604    32836    condominio id_condominio    DEFAULT     �   ALTER TABLE ONLY public.condominio ALTER COLUMN id_condominio SET DEFAULT nextval('public.condominio_id_condominio_seq'::regclass);
 G   ALTER TABLE public.condominio ALTER COLUMN id_condominio DROP DEFAULT;
       public          postgres    false    215    216    216            f           2604    32881    reserva id_reserva    DEFAULT     x   ALTER TABLE ONLY public.reserva ALTER COLUMN id_reserva SET DEFAULT nextval('public.reserva_id_reserva_seq'::regclass);
 A   ALTER TABLE public.reserva ALTER COLUMN id_reserva DROP DEFAULT;
       public          postgres    false    222    223    223            e           2604    32867    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    220    221    221                      0    32842    area 
   TABLE DATA           2   COPY public.area (id_area, nome_area) FROM stdin;
    public          postgres    false    218   �-                 0    32833 
   condominio 
   TABLE DATA           D   COPY public.condominio (id_condominio, nome_condominio) FROM stdin;
    public          postgres    false    216   j.                 0    32850    estrutura_condominio 
   TABLE DATA           F   COPY public.estrutura_condominio (id_condominio, id_area) FROM stdin;
    public          postgres    false    219   �.                 0    32878    reserva 
   TABLE DATA           W   COPY public.reserva (id_reserva, id_area, id_usuario, id_condominio, data) FROM stdin;
    public          postgres    false    223   �.       
          0    32864    usuario 
   TABLE DATA           Q   COPY public.usuario (id_usuario, id_condominio, nome_usuario, senha) FROM stdin;
    public          postgres    false    221   ./                  0    0    area_id_area_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.area_id_area_seq', 5, true);
          public          postgres    false    217                       0    0    condominio_id_condominio_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.condominio_id_condominio_seq', 2, true);
          public          postgres    false    215                       0    0    reserva_id_reserva_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.reserva_id_reserva_seq', 40, true);
          public          postgres    false    222                       0    0    usuario_id_usuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 2, true);
          public          postgres    false    220            j           2606    32849    area area_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id_area);
 8   ALTER TABLE ONLY public.area DROP CONSTRAINT area_pkey;
       public            postgres    false    218            h           2606    32840    condominio condominio_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_pkey PRIMARY KEY (id_condominio);
 D   ALTER TABLE ONLY public.condominio DROP CONSTRAINT condominio_pkey;
       public            postgres    false    216            n           2606    32883    reserva reserva_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);
 >   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_pkey;
       public            postgres    false    223            l           2606    32871    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    221            o           2606    32858 6   estrutura_condominio estrutura_condominio_id_area_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estrutura_condominio
    ADD CONSTRAINT estrutura_condominio_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.area(id_area);
 `   ALTER TABLE ONLY public.estrutura_condominio DROP CONSTRAINT estrutura_condominio_id_area_fkey;
       public          postgres    false    219    4714    218            p           2606    32853 <   estrutura_condominio estrutura_condominio_id_condominio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estrutura_condominio
    ADD CONSTRAINT estrutura_condominio_id_condominio_fkey FOREIGN KEY (id_condominio) REFERENCES public.condominio(id_condominio);
 f   ALTER TABLE ONLY public.estrutura_condominio DROP CONSTRAINT estrutura_condominio_id_condominio_fkey;
       public          postgres    false    4712    216    219            r           2606    32884    reserva reserva_id_area_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.area(id_area);
 F   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_id_area_fkey;
       public          postgres    false    223    218    4714            s           2606    32894 "   reserva reserva_id_condominio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_condominio_fkey FOREIGN KEY (id_condominio) REFERENCES public.condominio(id_condominio);
 L   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_id_condominio_fkey;
       public          postgres    false    223    216    4712            t           2606    32889    reserva reserva_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 I   ALTER TABLE ONLY public.reserva DROP CONSTRAINT reserva_id_usuario_fkey;
       public          postgres    false    223    221    4716            q           2606    32872 "   usuario usuario_id_condominio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_condominio_fkey FOREIGN KEY (id_condominio) REFERENCES public.condominio(id_condominio);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_condominio_fkey;
       public          postgres    false    216    4712    221               [   x�3�L�(-*J,.,M�,J�2�,,ML)JTHIUH-.�/*I-�2�,N�9�8$��Z\�X�e�$���wxy"�)�kqA����
Q�y\1z\\\ <� �         (   x�3��M,�,���2���ITpN�-H-.)J����� �A	Y            x�3�4�2�4bc.# m�i����� 'l�         N   x�]���0D�3�,c/�_��)d������1�\9qJt�0$?X�g[e"����1�۲����0d�Qix /��      
   &   x�3�4�,-��442�2�4�t�,�426����� _��     