PGDMP                       |            postgres    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �          0    16402    chat 
   TABLE DATA           C   COPY public.chat (id, name, createdate, usercreaterid) FROM stdin;
    public          postgres    false    217   	       �          0    16438    chatuserInfi 
   TABLE DATA           S   COPY public."chatuserInfi" (id, userid, groupid, entrydate, exitedate) FROM stdin;
    public          postgres    false    218   K	       �          0    16485    file 
   TABLE DATA           J   COPY public.file (id, useruploaderid, uploaddate, size, type) FROM stdin;
    public          postgres    false    221   h	       �          0    16453    message 
   TABLE DATA           Z   COPY public.message (id, groupid, usersenderid, createdate, updatedate, text) FROM stdin;
    public          postgres    false    219   �	       �          0    16495    messagefile 
   TABLE DATA           <   COPY public.messagefile (id, messageid, fileid) FROM stdin;
    public          postgres    false    222   �	       �          0    16470    messagereadstate 
   TABLE DATA           M   COPY public.messagereadstate (id, messageid, userid, readstatus) FROM stdin;
    public          postgres    false    220   �	       �          0    16397    userinfo 
   TABLE DATA           J   COPY public.userinfo (id, firstname, lastname, bday, country) FROM stdin;
    public          postgres    false    216   �	       �      x�3�442�4200�#NC�=... 0^�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   ;   x�3�442615�462�4200�#���T.#N���TC0i��4I�Tr������ ��     