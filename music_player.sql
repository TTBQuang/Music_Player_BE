PGDMP      #                |            MusicPlayer    16.2    16.2 `    k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            n           1262    16399    MusicPlayer    DATABASE     �   CREATE DATABASE "MusicPlayer" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "MusicPlayer";
                postgres    false                        3079    40974    unaccent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;
    DROP EXTENSION unaccent;
                   false            o           0    0    EXTENSION unaccent    COMMENT     P   COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';
                        false    2            �            1259    32802    comment    TABLE     �   CREATE TABLE public.comment (
    id_comment integer NOT NULL,
    response_to_id_comment integer,
    id_song integer NOT NULL,
    id_user integer NOT NULL,
    "time" timestamp(6) without time zone NOT NULL,
    content text NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    32801    Comment_id_comment_seq    SEQUENCE     �   CREATE SEQUENCE public."Comment_id_comment_seq"
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Comment_id_comment_seq";
       public          postgres    false    227            p           0    0    Comment_id_comment_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Comment_id_comment_seq" OWNED BY public.comment.id_comment;
          public          postgres    false    226            �            1259    24632    genre    TABLE     n   CREATE TABLE public.genre (
    id_genre integer NOT NULL,
    name text NOT NULL,
    image text NOT NULL
);
    DROP TABLE public.genre;
       public         heap    postgres    false            �            1259    24631    genre_id_genre_seq    SEQUENCE     �   CREATE SEQUENCE public.genre_id_genre_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genre_id_genre_seq;
       public          postgres    false    221            q           0    0    genre_id_genre_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genre_id_genre_seq OWNED BY public.genre.id_genre;
          public          postgres    false    220            �            1259    24713    genre_of_song    TABLE     c   CREATE TABLE public.genre_of_song (
    id_genre integer NOT NULL,
    id_song integer NOT NULL
);
 !   DROP TABLE public.genre_of_song;
       public         heap    postgres    false            �            1259    32883    listen_history    TABLE     �   CREATE TABLE public.listen_history (
    id_listen integer NOT NULL,
    id_user integer NOT NULL,
    id_song integer NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 "   DROP TABLE public.listen_history;
       public         heap    postgres    false            �            1259    32882    listen_history_id_listen_seq    SEQUENCE     �   CREATE SEQUENCE public.listen_history_id_listen_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.listen_history_id_listen_seq;
       public          postgres    false    234            r           0    0    listen_history_id_listen_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.listen_history_id_listen_seq OWNED BY public.listen_history.id_listen;
          public          postgres    false    233            �            1259    32952    playlist    TABLE     �   CREATE TABLE public.playlist (
    id_playlist integer NOT NULL,
    id_genre integer,
    id_singer integer,
    CONSTRAINT check_only_one_not_null CHECK (((((id_genre IS NOT NULL))::integer + ((id_singer IS NOT NULL))::integer) = 1))
);
    DROP TABLE public.playlist;
       public         heap    postgres    false            �            1259    32951    playlist_id_playlist_seq    SEQUENCE     �   CREATE SEQUENCE public.playlist_id_playlist_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.playlist_id_playlist_seq;
       public          postgres    false    236            s           0    0    playlist_id_playlist_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.playlist_id_playlist_seq OWNED BY public.playlist.id_playlist;
          public          postgres    false    235            �            1259    32824    search_history    TABLE     �   CREATE TABLE public.search_history (
    id_search integer NOT NULL,
    id_user integer NOT NULL,
    query text NOT NULL,
    "time" timestamp without time zone NOT NULL
);
 "   DROP TABLE public.search_history;
       public         heap    postgres    false            �            1259    32823    search_history_id_search_seq    SEQUENCE     �   CREATE SEQUENCE public.search_history_id_search_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.search_history_id_search_seq;
       public          postgres    false    229            t           0    0    search_history_id_search_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.search_history_id_search_seq OWNED BY public.search_history.id_search;
          public          postgres    false    228            �            1259    24607    singer    TABLE     y   CREATE TABLE public.singer (
    id_singer integer NOT NULL,
    name character varying(255) NOT NULL,
    image text
);
    DROP TABLE public.singer;
       public         heap    postgres    false            �            1259    24606    singer_id_singer_seq    SEQUENCE     �   CREATE SEQUENCE public.singer_id_singer_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.singer_id_singer_seq;
       public          postgres    false    219            u           0    0    singer_id_singer_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.singer_id_singer_seq OWNED BY public.singer.id_singer;
          public          postgres    false    218            �            1259    24728    singer_of_song    TABLE     e   CREATE TABLE public.singer_of_song (
    id_singer integer NOT NULL,
    id_song integer NOT NULL
);
 "   DROP TABLE public.singer_of_song;
       public         heap    postgres    false            �            1259    24594    song    TABLE     �   CREATE TABLE public.song (
    id_song integer NOT NULL,
    name character varying(255) NOT NULL,
    release_date date NOT NULL,
    image text NOT NULL,
    link_song text NOT NULL
);
    DROP TABLE public.song;
       public         heap    postgres    false            �            1259    24593    song_id_song_seq    SEQUENCE     �   CREATE SEQUENCE public.song_id_song_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.song_id_song_seq;
       public          postgres    false    217            v           0    0    song_id_song_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.song_id_song_seq OWNED BY public.song.id_song;
          public          postgres    false    216            �            1259    32791    user    TABLE     �   CREATE TABLE public."user" (
    id_user integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    display_name text NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    32790    user_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_user_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_id_user_seq;
       public          postgres    false    225            w           0    0    user_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_id_user_seq OWNED BY public."user".id_user;
          public          postgres    false    224            �            1259    32867    user_like_comment    TABLE     i   CREATE TABLE public.user_like_comment (
    id_user integer NOT NULL,
    id_comment integer NOT NULL
);
 %   DROP TABLE public.user_like_comment;
       public         heap    postgres    false            �            1259    32837    user_like_song    TABLE     c   CREATE TABLE public.user_like_song (
    id_user integer NOT NULL,
    id_song integer NOT NULL
);
 "   DROP TABLE public.user_like_song;
       public         heap    postgres    false            �            1259    32852    user_save_song    TABLE     c   CREATE TABLE public.user_save_song (
    id_user integer NOT NULL,
    id_song integer NOT NULL
);
 "   DROP TABLE public.user_save_song;
       public         heap    postgres    false            �           2604    49173    comment id_comment    DEFAULT     z   ALTER TABLE ONLY public.comment ALTER COLUMN id_comment SET DEFAULT nextval('public."Comment_id_comment_seq"'::regclass);
 A   ALTER TABLE public.comment ALTER COLUMN id_comment DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    33056    genre id_genre    DEFAULT     p   ALTER TABLE ONLY public.genre ALTER COLUMN id_genre SET DEFAULT nextval('public.genre_id_genre_seq'::regclass);
 =   ALTER TABLE public.genre ALTER COLUMN id_genre DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    33004    listen_history id_listen    DEFAULT     �   ALTER TABLE ONLY public.listen_history ALTER COLUMN id_listen SET DEFAULT nextval('public.listen_history_id_listen_seq'::regclass);
 G   ALTER TABLE public.listen_history ALTER COLUMN id_listen DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    33097    playlist id_playlist    DEFAULT     |   ALTER TABLE ONLY public.playlist ALTER COLUMN id_playlist SET DEFAULT nextval('public.playlist_id_playlist_seq'::regclass);
 C   ALTER TABLE public.playlist ALTER COLUMN id_playlist DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    40987    search_history id_search    DEFAULT     �   ALTER TABLE ONLY public.search_history ALTER COLUMN id_search SET DEFAULT nextval('public.search_history_id_search_seq'::regclass);
 G   ALTER TABLE public.search_history ALTER COLUMN id_search DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    33124    singer id_singer    DEFAULT     t   ALTER TABLE ONLY public.singer ALTER COLUMN id_singer SET DEFAULT nextval('public.singer_id_singer_seq'::regclass);
 ?   ALTER TABLE public.singer ALTER COLUMN id_singer DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    24597    song id_song    DEFAULT     l   ALTER TABLE ONLY public.song ALTER COLUMN id_song SET DEFAULT nextval('public.song_id_song_seq'::regclass);
 ;   ALTER TABLE public.song ALTER COLUMN id_song DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    32909    user id_user    DEFAULT     n   ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    225    224    225            _          0    32802    comment 
   TABLE DATA           h   COPY public.comment (id_comment, response_to_id_comment, id_song, id_user, "time", content) FROM stdin;
    public          postgres    false    227   s       Y          0    24632    genre 
   TABLE DATA           6   COPY public.genre (id_genre, name, image) FROM stdin;
    public          postgres    false    221   .t       Z          0    24713    genre_of_song 
   TABLE DATA           :   COPY public.genre_of_song (id_genre, id_song) FROM stdin;
    public          postgres    false    222   {u       f          0    32883    listen_history 
   TABLE DATA           M   COPY public.listen_history (id_listen, id_user, id_song, "time") FROM stdin;
    public          postgres    false    234   kv       h          0    32952    playlist 
   TABLE DATA           D   COPY public.playlist (id_playlist, id_genre, id_singer) FROM stdin;
    public          postgres    false    236   �}       a          0    32824    search_history 
   TABLE DATA           K   COPY public.search_history (id_search, id_user, query, "time") FROM stdin;
    public          postgres    false    229   �~       W          0    24607    singer 
   TABLE DATA           8   COPY public.singer (id_singer, name, image) FROM stdin;
    public          postgres    false    219   �       [          0    24728    singer_of_song 
   TABLE DATA           <   COPY public.singer_of_song (id_singer, id_song) FROM stdin;
    public          postgres    false    223   ��       U          0    24594    song 
   TABLE DATA           M   COPY public.song (id_song, name, release_date, image, link_song) FROM stdin;
    public          postgres    false    217   ��       ]          0    32791    user 
   TABLE DATA           K   COPY public."user" (id_user, username, password, display_name) FROM stdin;
    public          postgres    false    225   ��       d          0    32867    user_like_comment 
   TABLE DATA           @   COPY public.user_like_comment (id_user, id_comment) FROM stdin;
    public          postgres    false    232   )�       b          0    32837    user_like_song 
   TABLE DATA           :   COPY public.user_like_song (id_user, id_song) FROM stdin;
    public          postgres    false    230   X�       c          0    32852    user_save_song 
   TABLE DATA           :   COPY public.user_save_song (id_user, id_song) FROM stdin;
    public          postgres    false    231   ��       x           0    0    Comment_id_comment_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Comment_id_comment_seq"', 45, true);
          public          postgres    false    226            y           0    0    genre_id_genre_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genre_id_genre_seq', 4, true);
          public          postgres    false    220            z           0    0    listen_history_id_listen_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.listen_history_id_listen_seq', 176, true);
          public          postgres    false    233            {           0    0    playlist_id_playlist_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.playlist_id_playlist_seq', 44, true);
          public          postgres    false    235            |           0    0    search_history_id_search_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.search_history_id_search_seq', 16, true);
          public          postgres    false    228            }           0    0    singer_id_singer_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.singer_id_singer_seq', 38, true);
          public          postgres    false    218            ~           0    0    song_id_song_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.song_id_song_seq', 101, true);
          public          postgres    false    216                       0    0    user_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_id_user_seq', 22, true);
          public          postgres    false    224            �           2606    49175    comment Comment_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id_comment);
 @   ALTER TABLE ONLY public.comment DROP CONSTRAINT "Comment_pkey";
       public            postgres    false    227            �           2606    33087     genre_of_song genre_of_song_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.genre_of_song
    ADD CONSTRAINT genre_of_song_pkey PRIMARY KEY (id_genre, id_song);
 J   ALTER TABLE ONLY public.genre_of_song DROP CONSTRAINT genre_of_song_pkey;
       public            postgres    false    222    222            �           2606    33058    genre genre_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id_genre);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public            postgres    false    221            �           2606    33006 "   listen_history listen_history_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.listen_history
    ADD CONSTRAINT listen_history_pkey PRIMARY KEY (id_listen);
 L   ALTER TABLE ONLY public.listen_history DROP CONSTRAINT listen_history_pkey;
       public            postgres    false    234            �           2606    33099    playlist playlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id_playlist);
 @   ALTER TABLE ONLY public.playlist DROP CONSTRAINT playlist_pkey;
       public            postgres    false    236            �           2606    40989 "   search_history search_history_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_pkey PRIMARY KEY (id_search);
 L   ALTER TABLE ONLY public.search_history DROP CONSTRAINT search_history_pkey;
       public            postgres    false    229            �           2606    33155 "   singer_of_song singer_of_song_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.singer_of_song
    ADD CONSTRAINT singer_of_song_pkey PRIMARY KEY (id_singer, id_song);
 L   ALTER TABLE ONLY public.singer_of_song DROP CONSTRAINT singer_of_song_pkey;
       public            postgres    false    223    223            �           2606    33126    singer singer_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.singer
    ADD CONSTRAINT singer_pkey PRIMARY KEY (id_singer);
 <   ALTER TABLE ONLY public.singer DROP CONSTRAINT singer_pkey;
       public            postgres    false    219            �           2606    24601    song song_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id_song);
 8   ALTER TABLE ONLY public.song DROP CONSTRAINT song_pkey;
       public            postgres    false    217            �           2606    49234 (   user_like_comment user_like_comment_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.user_like_comment
    ADD CONSTRAINT user_like_comment_pkey PRIMARY KEY (id_user, id_comment);
 R   ALTER TABLE ONLY public.user_like_comment DROP CONSTRAINT user_like_comment_pkey;
       public            postgres    false    232    232            �           2606    32972 "   user_like_song user_like_song_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.user_like_song
    ADD CONSTRAINT user_like_song_pkey PRIMARY KEY (id_user, id_song);
 L   ALTER TABLE ONLY public.user_like_song DROP CONSTRAINT user_like_song_pkey;
       public            postgres    false    230    230            �           2606    32911    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    225            �           2606    32994 "   user_save_song user_save_song_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.user_save_song
    ADD CONSTRAINT user_save_song_pkey PRIMARY KEY (id_user, id_song);
 L   ALTER TABLE ONLY public.user_save_song DROP CONSTRAINT user_save_song_pkey;
       public            postgres    false    231    231            �           2606    32800    user username_unique 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT username_unique UNIQUE (username);
 @   ALTER TABLE ONLY public."user" DROP CONSTRAINT username_unique;
       public            postgres    false    225            �           2606    49199    comment comment_id_song_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_id_song_fkey FOREIGN KEY (id_song) REFERENCES public.song(id_song) NOT VALID;
 F   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_id_song_fkey;
       public          postgres    false    217    227    4760            �           2606    49208    comment commnet_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT commnet_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user) NOT VALID;
 F   ALTER TABLE ONLY public.comment DROP CONSTRAINT commnet_id_user_fkey;
       public          postgres    false    225    4770    227            �           2606    33088 )   genre_of_song genre_of_song_id_genre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genre_of_song
    ADD CONSTRAINT genre_of_song_id_genre_fkey FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre);
 S   ALTER TABLE ONLY public.genre_of_song DROP CONSTRAINT genre_of_song_id_genre_fkey;
       public          postgres    false    221    222    4764            �           2606    33077 (   genre_of_song genre_of_song_id_song_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genre_of_song
    ADD CONSTRAINT genre_of_song_id_song_fkey FOREIGN KEY (id_song) REFERENCES public.song(id_song);
 R   ALTER TABLE ONLY public.genre_of_song DROP CONSTRAINT genre_of_song_id_song_fkey;
       public          postgres    false    4760    217    222            �           2606    49235 .   user_like_comment like_comment_id_comment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_like_comment
    ADD CONSTRAINT like_comment_id_comment_fkey FOREIGN KEY (id_comment) REFERENCES public.comment(id_comment) NOT VALID;
 X   ALTER TABLE ONLY public.user_like_comment DROP CONSTRAINT like_comment_id_comment_fkey;
       public          postgres    false    232    4774    227            �           2606    49224 +   user_like_comment like_comment_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_like_comment
    ADD CONSTRAINT like_comment_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user) NOT VALID;
 U   ALTER TABLE ONLY public.user_like_comment DROP CONSTRAINT like_comment_id_user_fkey;
       public          postgres    false    225    4770    232            �           2606    32973 %   user_like_song like_song_id_song_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_like_song
    ADD CONSTRAINT like_song_id_song_fkey FOREIGN KEY (id_song) REFERENCES public.song(id_song) NOT VALID;
 O   ALTER TABLE ONLY public.user_like_song DROP CONSTRAINT like_song_id_song_fkey;
       public          postgres    false    230    217    4760            �           2606    32962 %   user_like_song like_song_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_like_song
    ADD CONSTRAINT like_song_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user) NOT VALID;
 O   ALTER TABLE ONLY public.user_like_song DROP CONSTRAINT like_song_id_user_fkey;
       public          postgres    false    230    225    4770            �           2606    33011 *   listen_history listen_history_id_song_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listen_history
    ADD CONSTRAINT listen_history_id_song_fkey FOREIGN KEY (id_song) REFERENCES public.song(id_song) NOT VALID;
 T   ALTER TABLE ONLY public.listen_history DROP CONSTRAINT listen_history_id_song_fkey;
       public          postgres    false    4760    234    217            �           2606    33020 *   listen_history listen_history_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listen_history
    ADD CONSTRAINT listen_history_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user) NOT VALID;
 T   ALTER TABLE ONLY public.listen_history DROP CONSTRAINT listen_history_id_user_fkey;
       public          postgres    false    225    4770    234            �           2606    33105    playlist playlist_id_genre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_id_genre_fkey FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre) NOT VALID;
 I   ALTER TABLE ONLY public.playlist DROP CONSTRAINT playlist_id_genre_fkey;
       public          postgres    false    221    4764    236            �           2606    33132     playlist playlist_id_singer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_id_singer_fkey FOREIGN KEY (id_singer) REFERENCES public.singer(id_singer) NOT VALID;
 J   ALTER TABLE ONLY public.playlist DROP CONSTRAINT playlist_id_singer_fkey;
       public          postgres    false    236    4762    219            �           2606    49190 "   comment respond_to_id_comment_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT respond_to_id_comment_fkey FOREIGN KEY (response_to_id_comment) REFERENCES public.comment(id_comment) NOT VALID;
 L   ALTER TABLE ONLY public.comment DROP CONSTRAINT respond_to_id_comment_fkey;
       public          postgres    false    227    4774    227            �           2606    32995 %   user_save_song save_song_id_song_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_save_song
    ADD CONSTRAINT save_song_id_song_fkey FOREIGN KEY (id_song) REFERENCES public.song(id_song) NOT VALID;
 O   ALTER TABLE ONLY public.user_save_song DROP CONSTRAINT save_song_id_song_fkey;
       public          postgres    false    217    231    4760            �           2606    32984 %   user_save_song save_song_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_save_song
    ADD CONSTRAINT save_song_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user) NOT VALID;
 O   ALTER TABLE ONLY public.user_save_song DROP CONSTRAINT save_song_id_user_fkey;
       public          postgres    false    4770    225    231            �           2606    40996 *   search_history search_history_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id_user) NOT VALID;
 T   ALTER TABLE ONLY public.search_history DROP CONSTRAINT search_history_id_user_fkey;
       public          postgres    false    229    225    4770            �           2606    33156 ,   singer_of_song singer_of_song_id_singer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.singer_of_song
    ADD CONSTRAINT singer_of_song_id_singer_fkey FOREIGN KEY (id_singer) REFERENCES public.singer(id_singer);
 V   ALTER TABLE ONLY public.singer_of_song DROP CONSTRAINT singer_of_song_id_singer_fkey;
       public          postgres    false    4762    223    219            �           2606    33145 *   singer_of_song singer_of_song_id_song_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.singer_of_song
    ADD CONSTRAINT singer_of_song_id_song_fkey FOREIGN KEY (id_song) REFERENCES public.song(id_song);
 T   ALTER TABLE ONLY public.singer_of_song DROP CONSTRAINT singer_of_song_id_song_fkey;
       public          postgres    false    223    217    4760            _     x�u�AN�0���)|�X3c��xɊ'���A�*()��pVl���D�Z^>��67��$6����.���{�O��oG�-��84,+�6�!���(��䘪,��u��o1�9� ���'ǣ�cL\[��1WQ�-I��hEO��h4V�>S�6���~�^���Kܒ�s������Tc�)�-�#�e�3U)���Pv;:K=�Ԫ��K��0�N0$�#���`+�=!�o��5����~��w��t��ÍG�ocl^      Y   =  x���=N�@�:>������w�H
��BT4��cHl��D�\���$��!D�P�F�}=9���>��M���&���(M�f`�#�����z��7cB�2]�ԧ����|��3F$��c߅�.��8�.�9R��u�!���c\���Cw��TkE�
"gZh���%g2��%e[���S�/g|.�Y<��<>U�L�I��5玫ʖ%hG
4J��l�cE����zX�����&i�k#l� ]�%��OցT��U�(���V�/{��/��z���,�D 1���2`a�"�&���TF�IE�R��g      Z   �   x���C!D�ZL�����_G�Yd�/3��v�ʱ�ǯ��_�v��?[��D�,�7G�=*��f;{N!Buj��U �]����#�A�m��0�0<��Åܺ�T�A�!��p��# �9�Txs�G@��: �TI�d��H<��H���Q�G���(&�Ff�I��k:7/ѰM�ƣ�h�hR��Fx����k�:�nlx��I���~?�� �D       f   ^  x�}��q�8E�f?��P,�}Ay��\�ub���'�Xߧ�s���\C�[�o�>���<y}�7�����q��o�F�-S}�7����hɜ�yD�n������o]�o��<'��r�:9I��A���ߓ�#9�Nփ�<y������>������3�d��d��J�q��DR�b~�$.h�1ܷ���� �{���m��T1U��K7'S�s�vp�a>��ݡ���C�� G�r�y���^V�
�OFG9E��+X���IyxF�ef�#��8��3xYY��(��H��_1<��,?8�M/3�� ��Ib�2�ē10��@�޽�:��o�n|���D�\��8k1@8lȲ�����Ã���o�؉4eD�Ms��7D ��,�Ų!*�i��T�!���OF�aa`jc0�����ed��:��Cw�`10rX�Cw��fxR�_Uq1�dCR�a2QX���S����j��	����x�=#���Crb��Ir�Z���[���"4���.��p��=��=�d��h� ���4���EGz��vf�mf�KOw���w!��T>4F�����'c��A0۰�2�B�jX��Y�R��|��
V[�cy��{&��L�/h8m���$1�]��ե��5f�p�3ٮ�����Qi�w��]n[Ƣۀ�t��;;������_V.�I�ӣ����I�An��󗴜�3������g�TtܩF��Y�5g��3֩���<B��%ir"�gq*:��3ٵ�>i �Hu���� &^1�bBd�#Ww$��K�l,��ȡ�����`���0��ȝ���vڄD��ed�#���� ASv"�Xgv�O}����:
�I�|��9����5ˠ�O�{��4�,�%w5�)��H��KvFA69��ɨ�E�b1\hdp��=#]qN���d�,m��@�l�Np�]a&(}�t�!�Pp`�-��Rܼ|���`���=] )�8G����B+q���� p"�V`���ٺ3b]0t��9pe����3�u�Ch`��jH��sA�ǥ���Nz�����7�"@��(WA壛hoI�,�L�O����i}�Ǥ�����e�O�d�vdW�� O��%=f�Z��v�a*�9�ݭa���Bg�0��� I����`&1w�@����n^���}nx_Pϡ������PYcAv_c�##5�[�*��k�㇤*d?\w�yvc���l�^���+��t��\�!i���@צw��+5�n[^��r�J0�ц���Ơj��[MF~ӵ�=���%g���a(�&�p���m�i�H4V�ɵ��O�`,��-b��
c��[&{�kK�c�^��!:f��G�ޝY�7�F\��o�{���~,�d��sz��,���/�li}�{qg֋B9*Wf[�.7�VzZ�V+G,V��ej�$��������7�5~��k�{hdˌ�z�k���a��-�����Oȧv]��������Gu��-A����t���5�˶�7�/��E�c+t�q'[���i�J��)ٯ[Z/��f�6�ܸ��r�R?�D���;�z����F?��%U�s��O���L�PZh7Y��� �b�h�`�bjm�ū�]��5K`�(�Pu�BO�]ٟ+���ET�&F]٬��lh�eR�ap��!�u`���6Y��ı��ӿԋ�D_�-}S'�u;��~�Խ��'vU��V�ӷNL)�;�&s��D�7I�z��5�}����_l_�}\ފ�/��qu�.��� 밫P�g�/Y��2:������u��jݱ,nH�ǉ~���?x~Cp����f����N��\���o��~^5��Ҋ���*�,�c��?p�^�      h   �   x�5��A�C0�4�&��.����.���yCC7jT��v6���N/��!�q��1�����K0m
L�s�s�	��n(x�l�e�.(fzv�Y�bVA1k�1k�1k�1��1���m8f�ل�/�1�p�ި��P1{�b�A�ߩ_����A�      a   �   x�u�MN1���)�cَ�ع+6!��(?���#US@�*�{��KN����#	��Tf�Q[H�HWǷ��Y�Yb�yx��m�����[�=?�E��-c��iM�Ir�ܬ"��(��$JSF�`�A<\,�#2׀X���7#��*X���]��1{-���h#A�9K�����J�a��.�P��
�ĵ�7S$u�
��mo=*;�g2����5���m0\�RD�1%����Ӻ�ȠrmYъp��/ck�      W   �  x��XMo$W]W��ޘݳ��R�ܙL<6c���}vW��6#�,+V��""E�������p^u�#H�
Yjw�Z�{߹�[�9z��[�?��}v�p�U��l�W�?8(�e�*_mV�~�����U���j?�.~A����U����ɗDX��_��֫����U�/��z��ۛ�>�{���{s�g��O��^����|p�S翷Y���js�ib�sD
H�L&��Ӝxjy��훷����a�����N�Ƌ��ޜ��C�/��>Ho�7�dƑH@�H���x=qT:S<u��V4�W>����|"��VY�$Ӂ�����˖���*iY+����~�'B�=|���y�#�֣�,��BH���EF-��j�������������'º�����!�(xC��6rbd0DZMI�\=��-���9��M\]� ?�?�R�O}��Dr/���"�1"J�j�����;?;^��/'U������hU2����t�q�_���4�^�G"���Caɫ�6���������w��8-�fD�ڰCލ/�I^#\պ[^H�E��b%���l]s�|���bv����"��[�~Rq#� ������Ql-ZR2T�%�"�ŉB��-�ͳ�/gg�w��8u������-�Z���A���]b���/E�� 6�O*K\�f���J��2�8dξ�+�̋o~��>��9����oC�F��a�����{d.�ߜ<^�z4�L��	�za�J�&
$���Zƛ������WS�nw�xs��))��)�3���Hd<�ʶL4�v�R�����~1���&��t4�����,��,%iH���t�4#�e���Sa�e�9[z����d�IZ��(�!�tMfH���]��A��"n [�x���^��Ҭe��i��d���/��p!�z�c�X��1*�d,�]	�Q"�͢H�d�2�f�-fs?Yp|��=�`�q�E �p��K���M��,W�6�����٧���8ݤ�~���8�8�b<M�$S?ňQe=1E�AŔ�J���o���<;�Χ��]�*s2jh��VLī�� �-Q'+J���5�Iw��+u�>��Ļ����w�ʣ�������>��j�����	��9�Kr����Խ�������@t4�$,�Zr�Pi�9�@�BS���9y��#mR�r�_t�����TxM�s�X�i�%�P���:��7Ϻ��V�z�86ʳ�����8�F�`fq��[��,�\4ǹ�Zv���>�r�&��@=�Q�g���Ē�p��[� a�Q��专E���ٮ��~��~�M5$ޭ	�| &��m���9H�.V����HG��1�&��b��y�3�T��yp����R�=�U�0f3�Bf�0�]�F� [�r���c��ɶ������m��n��>���9�Z73�QRR*9O��!����m��\?�~>��֩u��\�_��OZ�YR�(��Q�,V5ʱ��ȥ`�m0�<v�s����J7j�a�܅G���Gj)��	����	S���>�Y��b��@G��o�𢊤�_͊X|�UXeoVA�m�V}3{�A���T&����T�7�X�uVdA�C=e)�����%�/���
֜�Vpko�<��)��w�=%A���]��Ј�{���T4�C.$&u@/lw�|!)v@.Z��'���|*a�>^Z�AR�`v�Rh/�F9��9��{Q����伻X����`��T:�RW�!�8bIc�ս�L�3���,2�(����
b��D�w��1nԼAǀ��U��P'�r�Q#�l�PU��g��k?Ui/ `������b�Ê�A\��6�I%=�Z�������?YYk��@e�1n�tf	�h
����_��b�q�l�Q����u�r*�����%� K�E�
��-�>w�kʬa����z}3�w��e�7�M�s`f�HJn����(f���Z�H1��Hl<���~۶�n�      [   '  x�5QK�`1Z�a������1�zC����v��(+���ų?��=x���ᩫ�ޛ�}��:?�*lP�0ou�H����6_�|�2J���"n��7-H��y����C�H�[�-����F���9S��%u�|�:
_��B�u���&U�R��FZUO+�\�$Z9�j��[��&{��R��s�g\�G��ƛԼS�רی�bV��Z��x��՟��^�r'�����Qx�˓��Ű9��L�ѧ��W3N��m����x?����f����矙���VD      U      x��}Kodّ�:�W�<�#�����ࣻ��EvKEu���d�����T���,-���0O�lF�`���0����G�qo�����Нd��:q#Ή���8q���f�j����n���zqo63�%g���-7�W7��?l���M��t�����..k|���A�~�S���ë��*�W��^3��?��^ݼ�6��t?���O䇫+�?�����W�����{� _H��嫋/7~U�*��M����<K�w�U^�����&����2������>�<�r>�������ɧ��0+��F���zO�]�-Yƥ,L��X��1�S��b*��b���u��tiu�
�	���V�B����;|����f��֜��-��e捶,�kiQ&V�������e|a�3�Zw�4�}dP�c��|�����W!$����6���j�mn��8���Ĵߐ��â㚮Eq+9h��2,5��v��r��N��M�S
�p�~y{ڭ_��Øno^(��mT�ɵ��L#��*��3�м�V�:��î�:��q�s4�q=��i�D�*�۪�3�����;���K��s	�zZe?���?!������	�:� 5��Y9A`�����s�fGݺ՛�U�|	v6��*�q��m���£�%
��2m�g1��,����(�ܤ
�b���SVvT����
��d@�Iѧ�P�xѥVW��͎����/мP���5�k����oGu�L��!���R �fiXH�:W�HvZ~\�e�����x���Xn*+�>$���GIU\{Lj����fӑ���5��n�~�Q��B��0�r��-X(�)����ئU0����Q���y��97�Zo2o\f�"6�V$&�P�k�D	z���YwS�I��q�Ĵκ_lT��'Sc�@O	8�5͒���uR9��uԽh����>6���¸ڴ0���V��!j,BT��\�ه�^���[θ�y�a�iu���b\��iUS�4���R� [�<�T�v�t򶞥��>Yga�4�IO��Yp�Y��U��2�v�4^o�A�F4Sk�ւ�}�V�+x<EL*���/)��쒊5�4��^�$$����6b\�HZH�������x�6�B��-oи�=F�^-�/�����z���f<V�DzR�I/Y�Q��[ȉ��4B>���m�dO#0����^n_���\^��.��AO�W�< +kBV碒���ҳ��ewݭ�ͲWy ��i��[K����l3ղR(
� VAT�	.[ِ�{o	m��&��Ơ��$&d'M��Q�b��&f�����1�͕�=���b�9�iw��ڋg??����t���҉D�k@u���B@�+ۿ�f�������e����8��T�c�*�4�(se�bs�\t�Qn��^�,[�eR]�b��9�.co��,@��<H��iZ��h줮������g[f���;k�CIB��%��
�.#��������3�z���'����]3Wʵ�/�!��l���Y�];m~���];NI e�7&�iL{�!q� �V:�C*"΍�}r��5˩�,�Ui�����N�8�����D̔���iw�'Wo���
�{�za}8��) �Sʅ��17<X����'��~���!��b�q�ǥ���I���eQ�I`/t42M"H2��֧+�T�؍;��h���� �'Bk ;\�\�C�8�3�t�Z������{�6�^�����#��0�x���������x2~����ɡ�e����8W�4	ʷ��\�X.hVl�5[�W��r����ۓ[�bl�=I��[չ�=���Ӛg��P�Ӕ6�;�t�~�����+2�F�V�5V���5G�,K��"6k*ȬG�k��pٜwV�2��!a/�[)#�4V���PU1Y�!sr%��ĭ`%F��FD37~��u�]|��e�8���/��-��e�].��,>y~�����S;p�����ȃOH�O���P�\|!�Fme"S�٬5BS�,���\R�YN�n�9�x H?�M2r��Ul�
·0n9�/	8h����7$�75�`Aظ�s`����.�ǟB�.�S{�W����M���Y@�̘@ń�(� k{�)"�Ɖ�OB�y;��(�4�x� ���T�)�"�� [)�Rm�V͞o"E^���+	�ָ�)XR�C ���j�;]h;q�${7uB8}��Y�I�bv3�7<����m�[�^�WT��}�z�JA��x!,Ɛ�����t0`�Z1,ld����W{��qw�zٽ��뵆1Nס������p%��KiЦOrn���v�.�/���{�]��7�=��|Z��<��� ���C�����R�@h�<9:��n��v�m~/�NXHz��5u��{-٤���l�LG��F4u���D�[;;���w�LĴ[�_l�yx	���Ń9)X��Z �D��M�(�E��_]��j���fܭ�.�sf��[��8�y�o����bn��|YO��
/>Z]_��b�z;�s�����ot���$x"x�`
������NO��e�������x�����5T*���,E��Ɏ'S\}�;��|�����ݯ�;���k�X�n<[��,V��k�Ψ���̊3w��7=IH�S����>���5©�J�'C��_0���8�U4��T�
���̝��߼��jq�����q�x���߮�݄��~b�x��޾\�?Z�?]�<�~�x��DAĐR	���@bI�:pF�A�&�H���z)��E\�/�A8�=ir	@���eK8 �)�߀x�E��s'a�훯�^�u��_,ί�8;�#�n1��qM]mX����nO�BJ�8�*4�eς�0�o)���-|���8���p�:X/Ϸd�oǣ\r�dOk*��2mH�C�%1wjv~�*�� ��c�o�����3��� 6Z�6 �������F��o8�����x�k���T���d!�Ƽ����@�����O6q71/W���'���z]��Ⱦh�ld�# ��9�����zo4H3�AH���(�,�xu4r� �j���~��I�y�����Ż�0i��~<?_M�!�J8�"�@Yͦcu�f����>���[�7��i�����$�G��O�=�x����Q�3K"7�0�z�f�b��!dc�m����z�Y\�����#�'a-�bK̺@m$xƞ)8�	| (	>�B�Y��-����~���8P�f�0����^�����X��}%���	�$�Ҡ�f"�B �(��` r����:�y]�[���;/����Z��ƫz��ڡ��}t��2�h�ܹ�5.�~#=��i-�c>~��.�OF i*��DU�9���Q����d��~����ű[XC��>?�4k&%�A���������[���y1u� �I���Y�z��_��R��4��l�N��}A���d�v���g��|�}�a�l`g�%uj\�������q嫜b	�OkB�\&�ʜ5A�B�j��U���ŗ��N� ;�M8кT�0�=~����T�������
�)a=DO[Z!Iϻ{�nG<��g�{�y��Ӝz恎�����b�f�럿��_o^�W� w��G��MD�.Y���fWZ<<���	��%7�8NAj� pfIW��p��:�i�\����'k�cC��?����8��rMZ�M��U�fc������%ڹ�Rb�����vq���?����_�_��j�p&�4�҇K�J��)7�^n{n�Ӟ���q<$Js5!LQ�/�D3$	�`�7}+8;Ӟ��8n�HZ`�/�=�>Z���%3Jj�qDT}k�!�L�^��e��*�E������׿�9�t�Wyqv����j����K�����Q�qHYD*��/���u�\p�Ax���\r��²E�8%´I�^����H�����,^-��Δ�{�AK5�H7�T��wr9Ve�8�9�s`�#D��a�]����� ~0qo-ŧ�&�?b8(���"��-Ef[��ԇ�(*�H2Ia�-ِ�P���Ζ�O�1��pv�    kE�VA�f���2�ʲN)Em�6v"v�������S��_�?���j_v��ʧ�G]��m-{��Z��㯶��W'>Qo��h�Kj�$!Q���b]�~�B��z�����سz~�_z��3AX������[�>�P�
O-��&\� ��J̅���nq���� ��?���?�书mZ�r��Y��g!�Ɯ\(�Vt��k<V�A#���T�F�G3�v����wB��tr���Ƌ�T"8*�h
"���L	�#*���w�ܝ:G���ȓWԞ�'��:P�Q�=X?���|rd������<�/;��� � �3�ޫ�B�M},83t��J�[(�x+x�5q��q���-�qOZ����%5�5�YT�܈�~ıJ͗��y���ǟóu����?��.GN���.l���St�N�}�ѽ��1Xph���OEa����z��EM-.΁R���8v�U�.�@�o�")����"���c<&Џ������@`�}u� �~�7�`��I�3&�H�v�{\5����$X�tts�2�|�hS��S[���4�4�[PǕ5~\��B>Es��\��������7��L�sx1��׈�3�}�8��W����υ� �u6q6(Мޟ�@t�h����<޸m� �@���9$�K�w"��fK�6�{ܭN��Q�>��G�Ǜ=W+¦r���<��px��,blA�%��k��S`r���/�|��n���pat⻸��xL&�Շ�=�,)!������
��Y&�BH66�8mދ�%eu��(� <ŏ��'��� ^d�h�J�͍ZPsYlQ;���m.�샫���y�8�C���7��#����b/W�!�����%Q�]%���J�U�%ǀ��b����%>�:����*�K2�ǥ�d���qx�0	7�U���$N�S��7�)m-x��KI�@,��ރ��w;t�S�cZ��b���c�#�\�ф�����xW�P"�V$K�P(�%^,�(-�T�D��GÐ���Y<��oUB�s��q�T�D�=�t�����Jn���%�����г��Z/O���L�W��@~1���^�'$�8]���ByVCTck�x���7��i��G8����է�mf�k���V?�J�<|(�v�8�4���`%g�\�{](	���i��ꬴ�}��o%v�$bVER߳�x���t�J���3�$�yG��� ��y,�J�B�4�&�8�rn"i�u�ϥ��v�8톫��o.�/т��=(�lE#�1ިŘ�}}S#s�_�OM}��$�ޭt���d��"g���@���͏bɻ
��e6b.��)"�jqN��L��!"�l��Z���<�� �U�}6�C0��۴u<�T��p��RUE"����d���N��!�9�$�1$�G��sa����Tg��>�}���A��/s��H�e��Lv	&o@{�C�m�=�s�h�
���h�h�� p>�el���`m����\���4J��RiZҜ,����D�>q9Wb�����K�l��.�7��<jj����.u�^b���G	 �V@�E��w�� FC��mA�Z��-��D:"�wSg|�;E�	p,�T>�莬7�
/��\��.�����瀠W���S�����_�P��e�/�U�;ހ��Et6�)${���Sꢳ�FȘ�=��T�����x}�qG��g�A�4a*k�Z����T0�W�1p=~���duy�����FR}p�V%l�u��Af'YU: <$�F�<p/T���Ar��$�7g���,i�\�8K#
6��,s^-�Rrk��̈��w���ϴd���¢/��!�'�l�z̟�Z����q�}�e��ZCr�9�&����$��V
�z�����}�U�f�.P�OQ?T��)+��S��J0Z8#�\�ِ�{���X/�|��7��߮�a���?^�we�ɯT�v��u�����Y���o�|O��F.I�<w��jW�Ԩ�9�h�ͳ�>��~����[M�����w����������Ti���sl��T�\����.������B�Z*g�2/�SN�b&�5�l}1T�zV�ac��q� �����t(���9�ܡ�7cA�3|ԭ�!�s�%�˅��8[F!n�q�8㲩��P�������t�[�\�����^�]�M݈~�W.�5�]��ދ�Y�T�(�0���C��U���f<Now���i�M�{F9'�+���<�  `� am����͵ڝ���?�������_�f9���ƻŉ�롺z��$��qbn�4(�$J�E�3���벎A�iI���ͯ�io'ƃIPRV*gE8Q��������\��}-uq$�@�z��o�v<5u����)�X�' ?���jz�����{|�*�ʥ�[`1�.�"�����f��V}��� �z��ʁ����:�P]F��T�s�2��x�)y�ͣ���#*����<����+��Ol���±�����CT���>1�[�E��&�ޛ�<>��sTz���[�Q!���40�]+!�*��m������ݿ.�޼��8��%��;�e��=�z�G�-���$t=���1�`i��h� '�E
B�8��!����6�>�T^�����>�Vdm� Ӌ�\���8f�U�kG�������~�7��D�}���c�p$���!x�L�4}1�)J�|�g���Z��龴NtՏ��٘8xL�uZ.y��V��u�N��
6�=\��Z�i��+�v8�D߼�eD0b�����w���Z/�ֻ^o/���}64�����KN��K��&^O%�}IM�H���VJ�b�����z�`���o���w*��SZ��4X
�
{�����46W �x�k����O_�X���0��o�'2H��a��ĕ��]Z���m1`�%�w,��l�Y�uјy�2h=�MMpi��a�N�3�Ư�8+`��q��Ed��{�/�jz���r>�^�#�\Mkϩ�j�Is�߳�IdΗw_�}qz��~�(/����/̶�T��I�,!�jNSg�'�&3-��I������"��ƍ�����#��D0�>E����^H��ܨ٧5�x��x��:�~E(��o)�6�W% ��y�x˪0�Ėt�3#	I�o�\�J�=]:�����ɯ�HD5V�V�s�"�s�g����������a��	�O�\���^���Z�N�~ܑ�s%<YR�(AY��.�6��I֏V���Ũot逳[���z#�/���K�*K��X��\��q�O!�j}��|�Y.>�<p����na�����/F�jr
 �8%ҘKEw	�-�4�&*7�Jr�����tJ���=����(D�[�[2nn���}:�d	lK̈́���6���B�'%|�Z9C�^�6V�x�=�*��k���!}�w��d8#xXά���TtP��c�⵫�L�� �O��q%��_w��7=d��)�����\[�v�Ug�i\��A�8@z'����-��պ��zyy�YN�����k'����xժ�"`��L��-�~E�gIQ�U0S��2�KQ�\��,h-r�x�t�.҅ �RM��a2�έ�=_n7�����L)ꃞx#��i�q��X]�sRV��Y8�Z�ۏ��������$�ޛ�2b)NDz�-���@�p�2'#��Q�<�n�ps�xv�/}7ϛ��m�8�Cڵ������.��PG/=h-��^z��
pv��NO/1� ��n4�6�"M=Ï���q|窓�A�qʠ�4f��q��"": ��nD���f8@�}��w5M�|��f�CV�}Ly�45�Ev�A3�U��A��a�Qy)'Ũ���%�P���L<��qޭ@!�����j����� �2���*S�9��h�]������Q��Q���{>;�y�^��<5���$s[���C%=5a����Ф�� cq.�i1ieP
;[],7��R}� ��^8z#�[�e���R��{�\̂�n�=Ї���������ߥ���#hejX8�o�g��7Ǿ��1ֽ�}���)�@н5�B[n�[���8�� �  |��˧��m&�}�vGIWƚ���4F�ӈw�[QYdd��YВ/�w[� �r���%s�7 ��L�'@�S���'��|�K%�m�;�\BJ4V�X)�'�I?���he�V��P�N#P��UI�;T,s����ֆϽ�}�\�l.��v��_ˍ��"U����IQ��?2.w��3L[�����3�I/e����P%� z����#�H��[5�r�!��O�5u��M �8��a�n�'�(�=]U��[3�YII&m��ңW.��i��N�^������*(,A��&�k��qa��J�=5旋�7C�Ŵ7�i9����[]!r��:J��Ԯ�=c3�mܴ�U4����V�=�Z�`i��J}+a�,4P�2W՗T#<��=�^��Y�y,�L����2Xq����@��,�i�bI4X>{�C��x7�|�=-�od!�p�1�U-M���n�到��/<��7��k����΁�L>��_������'�<����Ѥ]��y&t�,Q�=�§�����d�!�u�����}�62E�Z�H/^KD�-����7�v��j��r�Ղ���iG}=��*����a�J�d�G0�wa�F�{�,El4�+�������b�TIL��&��ْf���F����=S"�t�G�-}v8?d�&���C�{G�p�qqv���W�m�?}��+�L{��]��}ޫ=�3�j�id;IK�s@�mm&�jr��£��E�,�>�]�O�	�ʬ���4��~zC(�&�úq|?�뫫�ɒٝ���B�n�����c�u�ĥ��e��e?b�O�j�W}�ku�2�Ndi#��*�'�t_�')[sF�:m�%����#�H	 p_�9�O��.�w�l5IE�qߕ�P���d��ĕ�!�^N����!ֹ��Ů��F,���"$�4� �����oZ���<df�D���n��_���F5�\��\�Qr��]�Um��>m����ڒO�
|�N��M� $=�犏���Yc4�#6�V� f6)%ri�h569�ۛ���������m�~]��;1���r�M��|<Z�E�H���6����1II�݃C6�~���d��ЅV��"����+Rh��y��f�aו];����v���h��J/i\W`�Шݪ"�%��u�h<�:q\�nߛ���$D�d��T������4�h��7m���k��z��6����<��ح�g�{�� RTAw��M^�P|K�N���۫�= �%g���ѕ�7,&z1��Ql��yP���[��8X�,W�������� �[��<��(wˏ��F��=�7@R�ϬI�����AL�<�\���x�`���9/��^�N#�T���1��G�[4�q=zvX������������V�}�=��+�3H����I480-�ou���a%	ɭ����*���3@�:Xbf��R�6�K�T���r��a��?�gt�vW��mۏ~�D�/�⠯b��~���������ý��J�H�&jɚ���^���{�%W���x����/]��񫿈��{Ǌ���9��n�V<����\�A' Mq񼾌��x�\]�6��v�%6�K��俉o�ԀGb~離�Z���3�� �ܘ؉8岘J��j0	�K����B���%uwK��4I���$6�2,4��*}qQ������n��]��|���z/�1��$�J#B����3m)�nm����.�ĘicĽ�靖��{^U�4�ڈ�L�`Z*D���g@kR�b<�nT���O�i��\]ukrSa#]��ܥ�r�~A��*�23Q\��΀���AXstտ�q'� �]~��/ǻ�$��!2�a�2E�2.��&�y�����nq�]�M]���~ ���u���������������\=�*����dYJT�B�����<X}�RBD�`��dN}�7�#'�ivB��RM/%�5�}
�6������m�]��+��zCo�~���F��Y�'M�(4�`'̓�˨{/�x�'��mj`A��"�YI�"����'~����K��iI�������*�=�DHI;�S�N<��L&�(Z1)bv��Z-�)>���y�r2�I�yê�'$Y��,F�-�d��I����{�p5mU�d�	�荛����Ͳ�[���X`%�j��K9<����B��2xR����������      ]   �  x�=̻��0  �Z�b
kL0)���A|�mP"
2|����t��P���QFc%C0��� VVO_�@�;��+�]�<�y�M<�l�*F����˚�w!����E#�5��tXg�P{t}�)M|�J�r���lV���)�1��]HP{}.������mpZ�j*���=5Xp�[#P�Ig�wv���/$A���r*J,+�]vb���%>%�^9q�Yq����~TU�~<G��� Eq�W��nΪ�X�c��<�����沟u���ox� p�η��l���?$�^�o� F���Ñk�ln7�5D�G�=w����";S���A��@��o�*�
�������J�S�1'�j&+����ݕ�)�´���"k4,�d�Y�6��$w�.���$I� ���      d      x�34�4�24�4�24�L \C�=... @��      b   8   x���  ��]�����|V�Ն'u0��;�I�;`����JF�\���'�	      c   ,   x�34�42�24�44��\FF� Ҙ��$ $�1z\\\ �t�     