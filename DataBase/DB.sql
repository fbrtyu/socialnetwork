PGDMP      3                 |            postgres    16.1    16.1 (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4839                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16402    chat    TABLE     �   CREATE TABLE public.chat (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    createdate date NOT NULL,
    usercreaterid bigint NOT NULL
);
    DROP TABLE public.chat;
       public         heap    postgres    false            �            1259    16438    chatuserinfo    TABLE     �   CREATE TABLE public.chatuserinfo (
    id bigint NOT NULL,
    userid bigint NOT NULL,
    groupid bigint NOT NULL,
    entrydate date NOT NULL,
    exitedate date NOT NULL
);
     DROP TABLE public.chatuserinfo;
       public         heap    postgres    false            �            1259    16485    file    TABLE     �   CREATE TABLE public.file (
    id bigint NOT NULL,
    useruploaderid bigint NOT NULL,
    uploaddate date NOT NULL,
    size bigint NOT NULL,
    type character varying(15) NOT NULL
);
    DROP TABLE public.file;
       public         heap    postgres    false            �            1259    16453    message    TABLE     �   CREATE TABLE public.message (
    id bigint NOT NULL,
    groupid bigint NOT NULL,
    usersenderid bigint NOT NULL,
    createdate date NOT NULL,
    updatedate date NOT NULL,
    text character varying(1000) NOT NULL
);
    DROP TABLE public.message;
       public         heap    postgres    false            �            1259    16510    message_id_seq    SEQUENCE     �   ALTER TABLE public.message ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16495    messagefile    TABLE     w   CREATE TABLE public.messagefile (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    fileid bigint NOT NULL
);
    DROP TABLE public.messagefile;
       public         heap    postgres    false            �            1259    16470    messagereadstate    TABLE     �   CREATE TABLE public.messagereadstate (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    userid bigint NOT NULL,
    readstatus boolean NOT NULL
);
 $   DROP TABLE public.messagereadstate;
       public         heap    postgres    false            �            1259    16397    userinfo    TABLE     �   CREATE TABLE public.userinfo (
    id bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(100) NOT NULL,
    bday date NOT NULL,
    country character varying(150) NOT NULL
);
    DROP TABLE public.userinfo;
       public         heap    postgres    false            �          0    16402    chat 
   TABLE DATA           C   COPY public.chat (id, name, createdate, usercreaterid) FROM stdin;
    public          postgres    false    217   �/       �          0    16438    chatuserinfo 
   TABLE DATA           Q   COPY public.chatuserinfo (id, userid, groupid, entrydate, exitedate) FROM stdin;
    public          postgres    false    218   �/       �          0    16485    file 
   TABLE DATA           J   COPY public.file (id, useruploaderid, uploaddate, size, type) FROM stdin;
    public          postgres    false    221   �/       �          0    16453    message 
   TABLE DATA           Z   COPY public.message (id, groupid, usersenderid, createdate, updatedate, text) FROM stdin;
    public          postgres    false    219   0       �          0    16495    messagefile 
   TABLE DATA           <   COPY public.messagefile (id, messageid, fileid) FROM stdin;
    public          postgres    false    222   �0       �          0    16470    messagereadstate 
   TABLE DATA           M   COPY public.messagereadstate (id, messageid, userid, readstatus) FROM stdin;
    public          postgres    false    220   �0       �          0    16397    userinfo 
   TABLE DATA           J   COPY public.userinfo (id, firstname, lastname, bday, country) FROM stdin;
    public          postgres    false    216   �0       �           0    0    message_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.message_id_seq', 15, true);
          public          postgres    false    223            8           2606    16442    chatuserinfo ChatUserInfo_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_pkey";
       public            postgres    false    218            6           2606    16406    chat Chat_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_pkey";
       public            postgres    false    217            >           2606    16489    file File_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_pkey";
       public            postgres    false    221            @           2606    16499    messagefile MessageFile_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_pkey";
       public            postgres    false    222            <           2606    16474 &   messagereadstate MessageReadState_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_pkey";
       public            postgres    false    220            :           2606    16459    message Message_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_pkey";
       public            postgres    false    219            4           2606    16401    userinfo User_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT "User_pkey";
       public            postgres    false    216            B           2606    16448 &   chatuserinfo ChatUserInfo_GroupID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_GroupID_fkey" FOREIGN KEY (groupid) REFERENCES public.chat(id) NOT VALID;
 R   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_GroupID_fkey";
       public          postgres    false    218    217    4662            C           2606    16443 %   chatuserinfo ChatUserInfo_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Q   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_UserID_fkey";
       public          postgres    false    4660    216    218            A           2606    16407    chat Chat_UserCreaterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_UserCreaterId_fkey" FOREIGN KEY (usercreaterid) REFERENCES public.userinfo(id);
 H   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_UserCreaterId_fkey";
       public          postgres    false    4660    216    217            H           2606    16490    file File_UserUploaderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_UserUploaderID_fkey" FOREIGN KEY (useruploaderid) REFERENCES public.userinfo(id);
 I   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_UserUploaderID_fkey";
       public          postgres    false    216    4660    221            I           2606    16505 #   messagefile MessageFile_FileID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_FileID_fkey" FOREIGN KEY (fileid) REFERENCES public.file(id);
 O   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_FileID_fkey";
       public          postgres    false    4670    222    221            J           2606    16500 &   messagefile MessageFile_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 R   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_MessageID_fkey";
       public          postgres    false    219    4666    222            F           2606    16475 0   messagereadstate MessageReadState_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 \   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_MessageID_fkey";
       public          postgres    false    219    220    4666            G           2606    16480 -   messagereadstate MessageReadState_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Y   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_UserID_fkey";
       public          postgres    false    4660    216    220            D           2606    16460    message Message_GroupID_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_GroupID_fkey" FOREIGN KEY (groupid) REFERENCES public.chat(id);
 H   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_GroupID_fkey";
       public          postgres    false    4662    217    219            E           2606    16465 !   message Message_UserSenderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_UserSenderID_fkey" FOREIGN KEY (usersenderid) REFERENCES public.userinfo(id);
 M   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_UserSenderID_fkey";
       public          postgres    false    4660    216    219            �   %   x�3�442�4200�#NC.#Nc#Cd!#�=... ���      �   %   x�3�4B#C]0Bbrq�3�������� ~7+      �      x������ � �      �   �   x�����0D��]�r&ia��T�� �P$X!���#R%c���lv��ؗ׶�rÇ�/�C�אc�z���x�x<�������i�)&Ø������,�� ��=�z��QP����X�U�v� N]�      �      x������ � �      �      x������ � �      �   ;   x�3�442615�462�4200�#���T.#N���TC0i��4I�Tr������ ��     