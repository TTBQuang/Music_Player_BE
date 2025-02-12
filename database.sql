PGDMP  )                    |            MusicPlayer    16.2    16.2 `    k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    display_name text NOT NULL,
    role text NOT NULL
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
    public          postgres    false    227   7s       Y          0    24632    genre 
   TABLE DATA           6   COPY public.genre (id_genre, name, image) FROM stdin;
    public          postgres    false    221   �t       Z          0    24713    genre_of_song 
   TABLE DATA           :   COPY public.genre_of_song (id_genre, id_song) FROM stdin;
    public          postgres    false    222   v       f          0    32883    listen_history 
   TABLE DATA           M   COPY public.listen_history (id_listen, id_user, id_song, "time") FROM stdin;
    public          postgres    false    234   w       h          0    32952    playlist 
   TABLE DATA           D   COPY public.playlist (id_playlist, id_genre, id_singer) FROM stdin;
    public          postgres    false    236   $�       a          0    32824    search_history 
   TABLE DATA           K   COPY public.search_history (id_search, id_user, query, "time") FROM stdin;
    public          postgres    false    229   ۀ       W          0    24607    singer 
   TABLE DATA           8   COPY public.singer (id_singer, name, image) FROM stdin;
    public          postgres    false    219   G�       [          0    24728    singer_of_song 
   TABLE DATA           <   COPY public.singer_of_song (id_singer, id_song) FROM stdin;
    public          postgres    false    223   -�       U          0    24594    song 
   TABLE DATA           M   COPY public.song (id_song, name, release_date, image, link_song) FROM stdin;
    public          postgres    false    217   h�       ]          0    32791    user 
   TABLE DATA           Q   COPY public."user" (id_user, username, password, display_name, role) FROM stdin;
    public          postgres    false    225   ��       d          0    32867    user_like_comment 
   TABLE DATA           @   COPY public.user_like_comment (id_user, id_comment) FROM stdin;
    public          postgres    false    232   �       b          0    32837    user_like_song 
   TABLE DATA           :   COPY public.user_like_song (id_user, id_song) FROM stdin;
    public          postgres    false    230   U�       c          0    32852    user_save_song 
   TABLE DATA           :   COPY public.user_save_song (id_user, id_song) FROM stdin;
    public          postgres    false    231   ��       x           0    0    Comment_id_comment_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Comment_id_comment_seq"', 51, true);
          public          postgres    false    226            y           0    0    genre_id_genre_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genre_id_genre_seq', 4, true);
          public          postgres    false    220            z           0    0    listen_history_id_listen_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.listen_history_id_listen_seq', 214, true);
          public          postgres    false    233            {           0    0    playlist_id_playlist_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.playlist_id_playlist_seq', 44, true);
          public          postgres    false    235            |           0    0    search_history_id_search_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.search_history_id_search_seq', 23, true);
          public          postgres    false    228            }           0    0    singer_id_singer_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.singer_id_singer_seq', 38, true);
          public          postgres    false    218            ~           0    0    song_id_song_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.song_id_song_seq', 106, true);
          public          postgres    false    216                       0    0    user_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_id_user_seq', 34, true);
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
       public          postgres    false    223    217    4760            _   y  x�u��M$A���(:�i�o��XX+����i���. <,0�DȄ�a����ޫׯ����#�y`��}�p���3����q}�2����@��ǎ(�Tf�Α��D<��/΃��g�2S02u䮖H�����ƛ��{�-o19J�['���p���'h��r����ݚ��mఓm&ˀI:��%�2Z��!�!x�w�ȓ�Jj��]���,���}�7����~�-!K�7���*����-�쵕�����o?�����&�N�
�B�����ݙU"�\�|�Y�*)�J^�n��}��I*������O��M�`�T�7��r���"���ox���`u�0�����7�����bj�$�^m��      Y   =  x���=N�@�:>������w�H
��BT4��cHl��D�\���$��!D�P�F�}=9���>��M���&���(M�f`�#�����z��7cB�2]�ԧ����|��3F$��c߅�.��8�.�9R��u�!���c\���Cw��TkE�
"gZh���%g2��%e[���S�/g|.�Y<��<>U�L�I��5玫ʖ%hG
4J��l�cE����zX�����&i�k#l� ]�%��OցT��U�(���V�/{��/��z���,�D 1���2`a�"�&���TF�IE�R��g      Z   �   x��ɕ1C�v0���t�q����$cG��r����'��{��������A�-��́ r[�~i��}
Ca�nA��s
 w� Ca�ۂ��`�m��0�а`8.���s\9
����0���\�@#�h#�#q��Jr$�D#�H�[�H^0
F�Q�*4����,4��y��f���h4M����j�0�>�wg�0u�?�ذ�a�c_�×��w���1D�      f   	  x�}��q�:E��(&���X^�q�����v�|��A�v��A���X?�}r�����o����������~�}D=���}}������?�>¿ףes���w�O�����K��^��O�,�Y�CR2t-������<��	y��3#5}7�7F�G�,�A��+=�y�7HMX�w��!�������>U�e��x��3�����A�S�`x�epr2������#̧�`�^����(ؑ�z�<R��//�#�G9E��3X�������00��vE
�q��g��\���gG��m�Ó�����t�rs�A
���$�,7K��iT��ٛ���I������Ct��3�ok-�Y~V�0��� �y���?�@�2�Ц�Yn�"��{��b��i��T�!���wF�aa`j�0�����������DH��U����a9g�]�Ór��T�� �IQ��Da�{�G��P�0��`�H���g�/+q�;�g�Ar�X���[����"4���.���.�{�{"'�؇ўA���3h�\�U�۹��].=�a�~zމ�?�����Yp�0o���1f���-�(�yP���ܬU(�(·Ȭ�a�e8֭aG��ɮ=�q4���H}�ʮ�f�ե��5f�p�3�W��׎�;F������e,��M���3���I�����D_zt=bA��|�T��8:I۩=�)����ј{��.�3��#=���,�{�:�1> �GȞ��� AN��cpY��8��Lv�F�OH�-R���?!��w��������)�P;˪;r�g3��1����4�<9r�d0�݄6!>r9Y�Hb��/HД��A+֙��S� �pb���Il��)�u��/!*k�A��N3�L�k*Y���-�D����#�`I��.��lrL)�Qs���b����E{F��0.���-�v���^ɖQ�G�f��wL�r
^�2k�!����L�6A˯�3��҉sTn��_>*���{'�k�����}�낡�Fρ[(��&��0tϝ��[B�UCr���^.ͯ���Z� 8	y�� tk�rT>���JZe�w~1�.ç��n�Z�����m�>���MvdW�� O�g[��j�}��TwBݭa����ΎaDe�N�z��&1w�@:��R7/M���+�o���P�Ptj��%�D�X�]eL=3RڂT!O��7K'T�~\ݩ�� �!'�V-���+��t�>\�!�}k�@�һ@֕�'��/O�w��܄q���p�0�Z(�V���t�����zPr��.�B�`��T{7H{D��"NN�w]��XR/[ĺ�C
CT��-�� bmٹ����cV�=zʽ+�NoE��8��+�=nr�~��.���2���Yf��������ʬ�rT�^̶:��{���z3�Z9b��-W+m A�7�]tj>�����,����Ȗ'��I����b��-�톮r�7�S;�Ni���x��~�Q�mɖ!�b�|���@Ft�֫r�fz^D<��N?�A%0�H���aX�������jm��k�����X�P�g��79�k'Y���:`w��g0���j�;W:�*ܛ��A�&�����Q��̭�L-�^���) o�YS�$@����z���~���QE�ue������ˤ��p�8�!�u@ւhu�,���9�|��j�3���K�ԉ�h�N"�_'uo��	��*��
p��SGJ���\!���b�	�'^K]C�_g�o�������@n���ˤpB�'?Y�Bq�9�!d�t�)��?O����u��m �'������Ⴅ5< |�ړ�{b��z��^7�P��9dKoܷ�N���Eo�~�\�B]vð�ᐆlw��{o���v5��z�!�b-L�ދ�v��~�3u�/���sMf���--'i�wہ>�pc�_1�Aw��f������
+�$��N�'�oV�Uwg��B+� ��L6s[����(�t��~qӤ���Rܭƽ�i�������~��_z �=�4�w�)��:��aI�̒T����Z��߁���*JPK�����'fCk��.���tg��cb�����Z�(�eoޮ���|��%� ��Ͽ�iP���)(���\/�ޯ���F��+i���B��hE0��zB��$TR���r=��?goH��=��!ߙ��5ѹz-�_D�fx����h�f�+�a؞�=�gxM�H���2q�֓c0P�ou1.�zh�5��W���l��[s�=�:ۖ��fk��C���a[O�Le�����1���4W      h   �   x�5��A�C0�4�&��.����.���yCC7jT��v6���N/��!�q��1�����K0m
L�s�s�	��n(x�l�e�.(fzv�Y�bVA1k�1k�1k�1��1���m8f�ل�/�1�p�ި��P1{�b�A�ߩ_����A�      a   \  x�u�Kn�0�x
_`��(��F���I�"P4m��-z��F0O��W�G��Z�ʧ��������"2��� ���������4�0����̶=܎���V`��������뻿����hR�9j��7r-�h��D(�*�t 9�r�O���D#��^0{�\û�:m�rhS�u�]~���z�T�	�\�"�M�=�(�@k,-�9ͭ��@b�R5X����n�9��8�d�Y������޷ꪪ��غ���v�匪,�9�l��BQ�_\���&K�c�,�7�:���R4.���}KpM�E��!ƞ]"h�V�!���a�ͬ��R��%�LI����Q��      W   �  x��XMo$W]W��ޘݳ��R�ܙL<6c���}vW��6#�,+V��""E�������p^u�#H�
Yjw�Z�{߹�[�9z��[�?��}v�p�U��l�W�?8(�e�*_mV�~�����U���j?�.~A����U����ɗDX��_��֫����U�/��z��ۛ�>�{���{s�g��O��^����|p�S翷Y���js�ib�sD
H�L&��Ӝxjy��훷����a�����N�Ƌ��ޜ��C�/��>Ho�7�dƑH@�H���x=qT:S<u��V4�W>����|"��VY�$Ӂ�����˖���*iY+����~�'B�=|���y�#�֣�,��BH���EF-��j�������������'º�����!�(xC��6rbd0DZMI�\=��-���9��M\]� ?�?�R�O}��Dr/���"�1"J�j�����;?;^��/'U������hU2����t�q�_���4�^�G"���Caɫ�6���������w��8-�fD�ڰCލ/�I^#\պ[^H�E��b%���l]s�|���bv����"��[�~Rq#� ������Ql-ZR2T�%�"�ŉB��-�ͳ�/gg�w��8u������-�Z���A���]b���/E�� 6�O*K\�f���J��2�8dξ�+�̋o~��>��9����oC�F��a�����{d.�ߜ<^�z4�L��	�za�J�&
$���Zƛ������WS�nw�xs��))��)�3���Hd<�ʶL4�v�R�����~1���&��t4�����,��,%iH���t�4#�e���Sa�e�9[z����d�IZ��(�!�tMfH���]��A��"n [�x���^��Ҭe��i��d���/��p!�z�c�X��1*�d,�]	�Q"�͢H�d�2�f�-fs?Yp|��=�`�q�E �p��K���M��,W�6�����٧���8ݤ�~���8�8�b<M�$S?ňQe=1E�AŔ�J���o���<;�Χ��]�*s2jh��VLī�� �-Q'+J���5�Iw��+u�>��Ļ����w�ʣ�������>��j�����	��9�Kr����Խ�������@t4�$,�Zr�Pi�9�@�BS���9y��#mR�r�_t�����TxM�s�X�i�%�P���:��7Ϻ��V�z�86ʳ�����8�F�`fq��[��,�\4ǹ�Zv���>�r�&��@=�Q�g���Ē�p��[� a�Q��专E���ٮ��~��~�M5$ޭ	�| &��m���9H�.V����HG��1�&��b��y�3�T��yp����R�=�U�0f3�Bf�0�]�F� [�r���c��ɶ������m��n��>���9�Z73�QRR*9O��!����m��\?�~>��֩u��\�_��OZ�YR�(��Q�,V5ʱ��ȥ`�m0�<v�s����J7j�a�܅G���Gj)��	����	S���>�Y��b��@G��o�𢊤�_͊X|�UXeoVA�m�V}3{�A���T&����T�7�X�uVdA�C=e)�����%�/���
֜�Vpko�<��)��w�=%A���]��Ј�{���T4�C.$&u@/lw�|!)v@.Z��'���|*a�>^Z�AR�`v�Rh/�F9��9��{Q����伻X����`��T:�RW�!�8bIc�ս�L�3���,2�(����
b��D�w��1nԼAǀ��U��P'�r�Q#�l�PU��g��k?Ui/ `������b�Ê�A\��6�I%=�Z�������?YYk��@e�1n�tf	�h
����_��b�q�l�Q����u�r*�����%� K�E�
��-�>w�kʬa����z}3�w��e�7�M�s`f�HJn����(f���Z�H1��Hl<���~۶�n�      [   +  x�5RK�(1Z�a^E�/w����AO͆2$ ��ps��]�%�
m��ym������;i��5wxꪨ��c����"�J"�A� ���>��1�L�҇{�予*���Me��mA^)�~��y,��dK�eƤ��%�lΔ�|I� �����'��u]���I��f�цV��J�(W;�Vξ���ǖ���9�T�4��W�l��&5��5�6c����<k�ֲ2^�p��VK������}v�W�(�����Z�b؜ؿH����x��'��6x|s�V���XB]3��?�O��?3�	W      U      x��}KodW��:�W�<-�G}��I�f��Vq$�0@�'3��yk�L���Y��m�^Fã�y4f0ݛQa���?����I�JuS�!%Y,�O܈s"�/"N\=9��-�l�����m���]ś�Drə�&����Ϳ��O�⺦xSo��u��^v��U��7�n�ӯ�O�O���Ef���m�f�[�?��^ݼ����t?��V�O�ǋ%������u��G�=I�/$Ç����ǫ�/kY���^��g��ᎳʋbZ�����$b6Q�RƑ���^�Oۧ�_A�g�>;8:y���	�2Hnԇ�W�=�ct��d��0�Zc1��x�N)/��|j`�ͬ�V�lݥ�u$+H&$Sc[a��;���]|P�5[���Un��.3o�e�W]K�B�0��7�u罄FX��1�j�i�\��A��i^<�s�rR^��L
S;9Xw���u���@�x..��j|M��o�t-��hX�A3]�a��Ĵ��אCmu\M���R�Ǜ����n����t{s��^�A�'�Z:3Q�`:K�<f�@�6Z���O�nyo�|�h$�zT�ӂ�T6�U	g<�7��w�Ri�����~�]"B�'M)�6uRj6U� r��BC�)4�BM��U�77�n��%��\����/h���A�GUK&1�ce�z�b��Y�oW�Q��Q�(&ۊ���NY�A�ln++ܟ��'ED��CiD�E�Z]�
79>��������8��^�X>e���vP���Xb�,!Bh�����s%�d����eS6��{��GO�妲�Cb���y�T%���$�v?9^���.\39�F�T��*$�-G�܂��RKQ�ڼ�m\�h�~�W7�k�ϹA�z�y�2����"1����\�&J�S�'Ϻ�zM�u�;&�u��b��5<�kzJ�Q�i�t,����!g?���Ec��~rxp��v�j>�+��M���iu0 Y���"D�YM��|\��buI�匫��G�.w��)�.��l�V1� O�y,U_���J�q7�N'o�Y:?�uFIÙ��d J�ᘵ�IY�[.Si'O��fF�i�A3��i-x�ݗT����ST��Xm ����.�Xs0Q����NBҿ��l#�5����ZK�g m,�������S`���l�e����q�ޯFz���U(���f��KqT��r��<����e�~��{UO/7�/��aw�Z"�	��*�deM��\T��4Uzrҽ쮻U���*�r9��~k�a���m�ZV
�C��*(�J>�e+Ҹ`�-��U\��t�r�Ą�I3j�oC,W�����>�����g�jqC,!�=��ޮv�����?y�N*�h@T.�TGJ�,�y����jv�Hً�H\�8~?#��O�:V�RL�2W�,6G�E'P�&��g1�Ҡ�p/��v� ϹEp{CE�g2�L�A�̥H��Dc'u���U����0��P|�YKJ��$-W�w�4D�ddPo����۝�=��/6욹R�e�|1��),f<�ΪX��q�{�ho��aJ)c��1�Lc�[��1��	Rqj���Ov�Y��g�ԠJwV''Xu����%b���&��c?[^�MF��*�U�y���hp� �O)J6��L�`1S#'�����j/�������Y��&�&=rȖyD	&�����4.� �سZ�.�Sab7� �3�q ҃�h���p�s�}�|j���|1;��ҫ�qڸz�r�b�O�ԓ�p���G��������d�����C������\��$(�z�s!z`��Y���Pl�^�j<���"�oNn኱��$��nU�X��/|6vLk��VB	NS�`j���b�r�E]uK2�F�V�5V���5�,K��"6k*ȬG�k��pٜwV�2��!a/�[)#�4V��PU1Y�!sr%��ĭ`%F��FD35~��:��~�弛\��W�f�f/��f�`f��8�`�j���d!di�����߭TO(_.��d����)�l��)q�KX�.)�,Gf7�x< �ߊM2v��Ul�
·0l9�/	8h����7$�75�`Aظ�S`��^��^į!����֫~Qh��_v��  r�fL�bBD����=�|���'!��y;��(�4�x� ���T�)�"�� [)�Rm�VM^�#E^���+	�ְ�)XR�C ���j�;]h;r�${7uB8}��Y�I�bv3�7<����m�Z�^�WT��}�z�JA��p!,Ɛ�����t0`�Z1,ld����W{��qw�xٽ��뵆1Lס������p%��KiЦOrj���fծ�o���'�]��7�=��|\��<��� ?��C�����R�@h�<9:��n��v�m~/�NXHz��5u��{-٤���l�LG��F4u���D�Z;9�W[�ș�q�|��0=��0K�sR�X%�4 ��V�9Qҋ��/^]-�b���fح�.�sf��[��8�y�o����bj��|^gO���>Y\_��b�z;�s�ۥ�-->����+�I�D����&K#��W��z/'	�}�ሙ�52�k�T��Y�<1�O���4uX����lfg���[���ƮMb�J��lQ��X�G��T8�pB���3+J��i����$!��N�g��괮.?�+�S�N��P�`���q`�hXͩ�m]�:��y����d~���%0�b����XQ�	�}��8�|��}9��H��y��D�*M���!����Ē�u�����Mz��'$+4�R��˸8��1�p�{������˖p@�S�5��H�@ŧN��7��f5�A�fw���_�qv`G��b��㊺ڰ:5ҷ�ݞJ��.qUhn˞_a��R��Ս[��%=}u��fq���o�.�G����/8Ȟ�T��e&ڐ���Kb�����U|;
8&�A�ǂ?�����g�O�l4�Lm@�	"��?R��A�p��=���R�(�ũN���B֍y#�	9�\��ӓ?YG8��I\�<_̾ğ��N�u-ԟ"�v���	��� �O�ʁ���{��4���-��i��ځW��A#���69�1��g���_FȻ��x��LZg���W�|Ȃ����H>PV��X]���3�/���G���܅�0v���>���b���h*�4��df��̒ȍE/����{�z�����|��W}d8-��H��IX��ؒ�.P	��g
�x J��P�?���f���z����8P�f�0����������\�}%���	�$�Ҡ�f"�B )��` r����:�e]�[���;/����Z��ƫz��ڡ��}t��2�h�Թ�W5�g�~#=��i-�c>~��.�OF i*��DU�9���Q���d��~����ű[XC��>?�4k&%�A��������쬛���y1v� �I���Y�j��_��R��4��l�N��}A���dw���g��b�}�q�l`g�%uj,����Z�8�|�S,A�iM(߁˄R��&�\hQM]��uvN��e|��ީ���q�.U��خ=|����T�������
�)a=D�[Z!Iϻ{�nG<��g�{�y��Ӝz恎�����b�&��_���_go^�W� w��G���D�.Y���fWZ<<��-��KnRq���
L�̒�
�7
�>�u��޹X�_��VDǶ�G�L$�ㄒ�5i�r4��W���A��&�h�nrHY�����������V�ś��~5����6g��S*}�����
*�r�����_����!Q��	a��~�� �!I���[���t���qsF�}U7�i��"��ϙQR� #��[��8e*�"8'�.�u�PQ�(�4L��o��-�qЧ+�ͳ����/��v�_��7n���B��۔E�����X������1����5!ר(,[ĎS"����e>X�
��D�h�6gq	�� ;S^�!-ը"�S5P;D���X�Y���\O����f��vvt�/tX��(�{�ha(>�4!o�#�e��Xd����l��Ò�PxEE�I&)�%�:�R��<.�t�J
g��    V��ie�l�Љ:,��,�R�Vic� bGo^��-=C ��=�Y����盻�[���w���Q�3r[��.������M%�U�ÉO�!%�"IHT���XW��|G��ޞCڟC��{Vϯ�KO�c&+����{�ԇ
U��E��d����\��������N߼� �������m�y�q�Vz�,�<����!Dט�؊n3x�����9hD������h��0wq�N���N�@T�x�҂JG�MA��#�� �SD�����w�����};���'G�I��T�oVg$ϟ�'�<^|���>D����>=@����j�PA�GS�]���1�
^�nM7Cx��@�G�Mܓ�Ax>lIE�iMz�C)7�q�R�F�m����W�l�}������ˑ����~[�z���yzto.|l-�m���OEa����z��EM-.΁R��8v�U�.7@�o�")����"���c<&Џ������@`�}{;�~��`�I�3&�H.v�{\5����$X�tts�2�|�hS��c[���4�4�[PǕ5~X��B>Es��\��������7��L�Sx1��׈�3�}=;�÷����υ�u6q6(Мޟ�@t�h�����z�a�X �<�sH|�"��D��͖8nj��[�v�nu����7{�0V�M��/5Zy>���2wY�؂�J����N�Ɂ�7{������g��#���R���d�_}�̒":@ �+
*��(�e2)�dcC���H^R�QwpK���
��S����p�{N�EN�v���h�5���3��ئRL>Z�N7�Ϋ�y�f���a�y�c�9}D�e��fZ�c�}��$ꓠ��Q�Ui��@]����4Z������G�S�z)�Ψ�='#|Z�+f��=��\�p_��J�9�yc��ւw���dĢ[�=��pz�W��{�x��zC���}�pd��>�p�Q���JdъdI
�!�ċ�A�嘊�|�hR\]=�����J�w�s1l�
�����n���Rɍ2���R��8z��ݷ�9��w�2��!�_ncx�w��	�0LW���P���՘�+��f�6z\��	�ie�q�|���r2��Wi���CU�N' �Ƣ�V��L�JCw�%�u_���Jk�'�i��VbWJ"fU$�=;Y����H� �9�KR�w$߾@9��⭤(�`�HCh1�c/�&�6*Q��T:������n{uR�����%Z��P�����h8��s��ojd����/P��$ݻ��8���a@�>0�8���Q,yW�t��FLe�<E�]��)Ӟ)0D�a;����V��2O�4�zQs���P̸x���ᘪ��R��HD��5#7�����q�=D?�ܔD<�����p.cU����>�R�"�ϔQ�"�\�e�8鿬���n"��hO{(��Ͱr.�Ra5�>��2 �Ǹ��A6�����4��+��Fɀ�P*MK��%X^@���'.�JL�v��w��-^���z7�G�>��ץn��+,�W���(� @�
��(����hh�`�-_��� Z��HG���n��s��#1�EB��g�ݑ��V��e��*9�e�vu�]�t9{��0�0v��ɮ�5m���U\�=��8�*]@g�B��~|<�.:{k��y��Me?J�?�K�k�;2&�=S25�	SYs�Ґ�D���)ĸZ����S�&'��+����=6��G���*a#��C��2;ɪBh��!�` 4��{�����$	�?+lOeI[嚨�Y�S���`��j�[;UfBl�`��?H��%c�h�x'�ԟ����1�j�������e��ZCr�9�&����$��V
{�����}�U�f�.P�OQ?T��)+��S��J0Z8#�T��6����w������g�w�YQ�·�w�X�ʲ�_�8�ֽ�Z���u��V�����7�\�,y����*�֩Q8r���gqu�P����o��k���q	-#3F�����=�5�ز����;�]��%U���*�T���<{A9��} ��d��m5�Gae�6�_�Q"ZMP[J����P�����8r3d>��G�����_��\x~��e�6�3.��5n{|ШJ�.�H�u�O�������i���؍�}�b��+��{2k��%��|H�Y�jy܌���N��8��	v�(��s�t7� B$�������V�Sp~��?_��߼���,�06�x�8q~���.ߞ�q8L�m���Dɜ�({p��z]�1�:n#	�>��r;M���p0	J�J��'
��WSc�Ҵ�� :�j=����N��g�Uo^��rW�Sc���+�R��}���g��"���T0�K-���b�	\�E��!&�S�.���:�I% �|��ʁ����:�P]F��T�s�2��x�)y�ͣ���#*���<^������'6r�f�؇�	`���!�K�[���-ʢ�w#I��ro�9*=���-Ѩ�x[�t	��.��b��6�vr
������_gGo^�M���%��G�e��=�z�G���{���XΘh�4�W4A���"!BY�����hOs**��/���Y[A���b �=�3w�?��e�ڑ�_��zD�����M��Q�����@���18D`�<v&�C��ں)J�|�g���Z��龴NtՏ��٘8xL�u\.y6���Wu�N��
6�=\��Z�i��+�v8�D߼�eD0b������Z�g�ֻ^o/ƞ�}�m��m/9�R.��x=U�(�%5ͣ�"�o�[)እ#�{ꉃUV�ɚzxߩ�Oi)��`)+@�Y�H|`^��\���E���?|Kc����x�?�q@"7ӵF�D����]n���[�X�p�b���5\���*��q���V+��9�l�j���x7o_DA�'�b��w�h*���E<��%Ѵ���V�45�=���G�|~�]޶/��W��eb�p�Åٖ�
U2�%�W�i�L�d��b���V9��>W��Y��ܸᴽ�Q"r��F`ѧ(X������5y^c�����9�#�x�W��i��m�!yU�k�����
LlIG;�03������U��ӥ#��ɠO�����ATc�i�=w*�85z�K�o��?Z>\�ڎ`9!�|���6���]��	ԏ;Rz��g#K
%(kӅ�f�"9���q����.pV`��~Aod�@�b�\e	�4k��25n��,V��/���c<�W9l����X_h��2a�� � B�sP"��Tt� ��L�n�r[QIN������B�"�a���5y�� x�tK�M-�|ާsO����L�糟o�m?(�R����6gH�k���Ϸ<�R��}�q72�O���g˙�2����xLS�vՖq{ �ɼ;������Y|�����=�s0�R�k�t�N�J�,<�K�4�HO�d?n�-V�^׫����r�Ln�v_;�������V�k .e�|n��+
>K�"���Ҹ��^Z��(���
�g``A@k�;�3��u�.  �j
��	vj���|��w��fJQ���� �OK����*���Jl��S����x)J�q[9I@��Y.��!��D��؂}�
+s22���S�&7��gw��w�y���c8�]K�;���ޥ����KZ�𾗞�.���ݾm����E �B7�}�	����G���8�s��� �0eP�[�΂ׅ�Nc UM� �jS�f8@�2��.�k����������c�c{KSSZd�4�]�8�I���rR�z�\RU��������Z�?���/��S�?�2���*S�9��h�]������Q��Q���z>9�y�_/�<5��$m��~�=��Jzj�hU9j��It�A ��\��b(��V)�lq9_�@J	k���6{���n�>�E��wK�e�S1	R��O@~�糧w�[}�K�˱G,��԰p��;8�b�o�}��1ֽ�}���)�@н5�B[n�[���8� )	  �|�����m&�}�vGIWƚ���4F�ӈw�[QYdd��IВ�~r[� �r�쒹��Ɏv&� ��)�dra���a>��6Ј�I.!%+Z,���#���x���p��g(E�����ۇ���*�����pkç^L��/n�Wug;���o����"U����IQ��?2.w��3�[�����3�I/e����P%� z����#�H��[5�r�1�����:C�&��8��a�n�'�(�=]U��[3�YII&m��ңW.��q��N�^������*(,A��&�k��qa��JN=5旳O�C�Ÿ7�i9����[]!r��:J��Ԯ�=c3�mܴ��U4�����V�=�Z�`i��J}+a�,4P�2W՗T#<��<�^��Y�~,������2Xq����@��,�i�bI4X>{�C�y7�|�=-od!�p�1�U-M���n�到��/<��7��k����΁��>��_�����'�<����Ѥ]��y&t�,Q�=��������l�C��$�3����<md���.�^��� [8Ce�-n����v��ݷ3�B����l�����Ub�%�=�ɾ�p75bأg)b��]���'�,/��p�Jbܔ5	��4�tqH7Z������<ROl鳻��!h87)���;�󷳳�7����&�÷;���ϸ��u����]�pUM#�IZ:���hk3�T�km�.�g��Q�Z� �p�M Vf�<M��1�4��B�6�֕�#��]�.g'sdw�X����<���w���M�ꬑK7G����~�������/��׼M����;���@�P�H�}Y8��l����$�ɼB�P#M$��}e���7]��j��þ+��Do'�.��+�C���hQ'gC�S�W{��]+2�����EH�i�A^�c��oZZ����
��D���y�Z�/�i�t��q�Yb.�(9N��������
�6nj�Bmɧ��k�V� ���sŇ_�笱
�տ�n+d3���4[�����M�}�߈����R�.��ݝ���N��&`j>-y��"]$Mٍ���e��������!H?lSd�Tf�B�Vt�Li���)�l�4�`=���ʮC�]w;��n��pK��4�+�lh�nU��}��M4s9��5	���D{^"|��n�JzSvf�s��
4�C훅����5BU�~x�HwwFC���3��yo )��;��&�pL(���_��N���U�Ւ3@Y��JD���d�����4�ɋxۭ�u�,n�u]�����o�ڭ�D�}���pH��J˅�� )�g֤j_����� &{_.N�m\�2Xg��f΋���ש��6�rL����Mu\O���m�Ŏ��~N��h�c��>מh쌕��Y�Lu�$�շ:rf󰒄������
%l�Т��d�Ժ��9��l��Ūd���Ϻ�����5v����N"��8諘��=������o�p�(iF�R�*���Z��m�����E>�^n����2�����B���6|�1Vx�X14��;�RЍՊ�RU��4��)�^ԗq�og/���:�ܬ��z�t?�o��$5��[��}Q-D��ԙYe	�SnL�D�rYL��|5��~O^F��E�������g��c�R�L]I����T��LHww�]���.J�>��~�z�=ɰ�҈�:Dj��L[J�[ۨ$��K81f�q/�;*�$��WU� ��6�4S;��
Q�2{�К������/�s��˴�ŧ/�nEn�l��a���\���"�� �A�\f&��8��\��-��1�d�
|��ׯ�t��HB�"s�Y�HW�E�B��a�6ar��}��N�e]�ٟ,��ʱ_W��)���;گ�o��p�K��sp�RiH�L��D��,T) |*��Z̃ŗ�VJ���v������v�<�Nh�Y��D޴� ���Bֆ��|�C����6�Ӻ��7�F��Jmd��~���ދB�
v�<ٽ��1��"W{�0�ަD�.����d)��ok(q�W�<<�����d~��x�yy���3aH����P;5���#^��dΊ��"L(&'��bvL�h��\ϟ�-'Ӛԝ�]u���$k��h��L��>ɲvtO�ƭ*��;�q��pq���x��a�����@M��)��QWtaT(�]O*P���_��m���>2����>�����B*���P�kz��6�k�%��8W�O��ڹ+�u�w?f��U��娶h��z�����su�8?9�����p���ʔ�1�������M1���p:��?���      ]   X  x�U�9��H���+����*�4�l��g�U�_?s@���=�<�U]��qH{d��F���9%D@G7A�g�52*�CQ���T�+�bb�茸��Xx�3Ǩ��8}��AV�!�D?n7���&��}[9rml��V�E�������6���������> �F����/n�,7�wc�P��M��&ta��z�#�ʹ����@rM�¸Y�����tv�����Q���Y�+뼟$7��i���Ml �&�Ֆg$)�Y
Rφ��=�'���!za�U���4�-� *.��Ml ����l���2bi�sh�Ʃ2��L�FG$ @f>��v�'�H�	>�Ec�t'�!�Ddp���<�Qj�Pdp�Rq�?���;U�,|>O��G:ob�$����Y�Q%�c*T��6���3?��C7����������h?{Ф�6a���?'<>�y.S���0e���I��i��1��B�%�
ٌ��K���l^��a[ǷG쒴�}�{��b5��$�7���}��qLt� �v	��'�.I�E���:l��m�w���i%�(��B�>�ܞ� ���D��C=ٴ'����:�G+
}H��w��&��T�W�!Ϻ�s,Mf�`$o�[f�m�:Lr��� ����0��ߵ~I>_�O������h"<=�U*%�h%v�x(�y�E����м�������t�О�c�G�wx�l`�,R�˰�L5!p.�3��{+��k�8C�4��`{���}<�EQs�PW�s���˽r_|�����=c�&~?��P ,�S{ٳ��Zv�x�1N���������z�m�D��s��������7�      d   2   x�34�4�24�4�24�L \C.#S���9��9��%���4����� Ǩe      b   H   x�̱ !C�:�DI�.�?�a��'�4.��	o〇U��}]F�s�S������5���z�)��| ~88       c   7   x���  �7)Ƒ(
�������1��i9��]���c��b�o �X�	�     