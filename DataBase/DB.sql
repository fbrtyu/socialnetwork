PGDMP      5                 |            socialnetwork3    16.1    16.1 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16715    socialnetwork3    DATABASE     �   CREATE DATABASE socialnetwork3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE socialnetwork3;
                postgres    false                        3079    16716 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16726    chat    TABLE     �   CREATE TABLE public.chat (
    id bigint NOT NULL,
    chatname character varying(255) NOT NULL,
    createdate date NOT NULL,
    usercreaterid bigint NOT NULL
);
    DROP TABLE public.chat;
       public         heap    postgres    false            �            1259    16729    chatuserinfo    TABLE     �   CREATE TABLE public.chatuserinfo (
    id bigint NOT NULL,
    userid bigint NOT NULL,
    chatid bigint NOT NULL,
    entrydate date NOT NULL,
    exitedate date NOT NULL
);
     DROP TABLE public.chatuserinfo;
       public         heap    postgres    false            �            1259    16732    file    TABLE     �   CREATE TABLE public.file (
    id bigint NOT NULL,
    useruploaderid bigint NOT NULL,
    uploaddate date NOT NULL,
    size bigint NOT NULL,
    type character varying(15) NOT NULL
);
    DROP TABLE public.file;
       public         heap    postgres    false            �            1259    16735    message    TABLE       CREATE TABLE public.message (
    id bigint NOT NULL,
    chatid bigint NOT NULL,
    usersenderid bigint NOT NULL,
    createdate timestamp with time zone NOT NULL,
    updatedate timestamp with time zone NOT NULL,
    text character varying(1000) NOT NULL
);
    DROP TABLE public.message;
       public         heap    postgres    false            �            1259    16740    message_id_seq    SEQUENCE     �   ALTER TABLE public.message ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16741    messagefile    TABLE     w   CREATE TABLE public.messagefile (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    fileid bigint NOT NULL
);
    DROP TABLE public.messagefile;
       public         heap    postgres    false            �            1259    16744    messagereadstate    TABLE     �   CREATE TABLE public.messagereadstate (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    userid bigint NOT NULL,
    readstatus boolean NOT NULL
);
 $   DROP TABLE public.messagereadstate;
       public         heap    postgres    false            �            1259    16842 	   usertoken    TABLE     �   CREATE TABLE public.usertoken (
    userid bigint NOT NULL,
    hashtoken character varying(256) NOT NULL,
    createdate timestamp with time zone,
    id bigint NOT NULL
);
    DROP TABLE public.usertoken;
       public         heap    postgres    false            �            1259    16845    userToken_id_seq    SEQUENCE     �   ALTER TABLE public.usertoken ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."userToken_id_seq"
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16747    userinfo    TABLE       CREATE TABLE public.userinfo (
    id bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(100),
    bday date,
    country character varying(150),
    email character varying(256) NOT NULL,
    password character varying(64) NOT NULL
);
    DROP TABLE public.userinfo;
       public         heap    postgres    false            �            1259    16853    userinfo_id_seq    SEQUENCE     �   ALTER TABLE public.userinfo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.userinfo_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �          0    16726    chat 
   TABLE DATA           G   COPY public.chat (id, chatname, createdate, usercreaterid) FROM stdin;
    public          postgres    false    216   68       �          0    16729    chatuserinfo 
   TABLE DATA           P   COPY public.chatuserinfo (id, userid, chatid, entrydate, exitedate) FROM stdin;
    public          postgres    false    217   k8       �          0    16732    file 
   TABLE DATA           J   COPY public.file (id, useruploaderid, uploaddate, size, type) FROM stdin;
    public          postgres    false    218   �8       �          0    16735    message 
   TABLE DATA           Y   COPY public.message (id, chatid, usersenderid, createdate, updatedate, text) FROM stdin;
    public          postgres    false    219   �8       �          0    16741    messagefile 
   TABLE DATA           <   COPY public.messagefile (id, messageid, fileid) FROM stdin;
    public          postgres    false    221   �9       �          0    16744    messagereadstate 
   TABLE DATA           M   COPY public.messagereadstate (id, messageid, userid, readstatus) FROM stdin;
    public          postgres    false    222   �9       �          0    16747    userinfo 
   TABLE DATA           [   COPY public.userinfo (id, firstname, lastname, bday, country, email, password) FROM stdin;
    public          postgres    false    223   �9       �          0    16842 	   usertoken 
   TABLE DATA           F   COPY public.usertoken (userid, hashtoken, createdate, id) FROM stdin;
    public          postgres    false    224   �:       �           0    0    message_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.message_id_seq', 19, true);
          public          postgres    false    220            �           0    0    userToken_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."userToken_id_seq"', 16, true);
          public          postgres    false    225            �           0    0    userinfo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.userinfo_id_seq', 6, true);
          public          postgres    false    226            <           2606    16751    chatuserinfo ChatUserInfo_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_pkey";
       public            postgres    false    217            :           2606    16753    chat Chat_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_pkey";
       public            postgres    false    216            >           2606    16755    file File_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_pkey";
       public            postgres    false    218            B           2606    16757    messagefile MessageFile_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_pkey";
       public            postgres    false    221            D           2606    16759 &   messagereadstate MessageReadState_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_pkey";
       public            postgres    false    222            @           2606    16761    message Message_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_pkey";
       public            postgres    false    219            F           2606    16763    userinfo User_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT "User_pkey";
       public            postgres    false    223            H           2606    16852    userinfo unique_email 
   CONSTRAINT     Q   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT unique_email UNIQUE (email);
 ?   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT unique_email;
       public            postgres    false    223            J           2606    16850    usertoken userToken_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usertoken
    ADD CONSTRAINT "userToken_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.usertoken DROP CONSTRAINT "userToken_pkey";
       public            postgres    false    224            L           2606    16764 &   chatuserinfo ChatUserInfo_GroupID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_GroupID_fkey" FOREIGN KEY (chatid) REFERENCES public.chat(id) NOT VALID;
 R   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_GroupID_fkey";
       public          postgres    false    216    4666    217            M           2606    16769 %   chatuserinfo ChatUserInfo_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Q   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_UserID_fkey";
       public          postgres    false    4678    223    217            K           2606    16774    chat Chat_UserCreaterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_UserCreaterId_fkey" FOREIGN KEY (usercreaterid) REFERENCES public.userinfo(id);
 H   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_UserCreaterId_fkey";
       public          postgres    false    223    4678    216            N           2606    16779    file File_UserUploaderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_UserUploaderID_fkey" FOREIGN KEY (useruploaderid) REFERENCES public.userinfo(id);
 I   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_UserUploaderID_fkey";
       public          postgres    false    223    218    4678            Q           2606    16784 #   messagefile MessageFile_FileID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_FileID_fkey" FOREIGN KEY (fileid) REFERENCES public.file(id);
 O   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_FileID_fkey";
       public          postgres    false    221    4670    218            R           2606    16789 &   messagefile MessageFile_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 R   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_MessageID_fkey";
       public          postgres    false    221    219    4672            S           2606    16794 0   messagereadstate MessageReadState_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 \   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_MessageID_fkey";
       public          postgres    false    219    222    4672            T           2606    16799 -   messagereadstate MessageReadState_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Y   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_UserID_fkey";
       public          postgres    false    223    222    4678            O           2606    16804    message Message_GroupID_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_GroupID_fkey" FOREIGN KEY (chatid) REFERENCES public.chat(id);
 H   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_GroupID_fkey";
       public          postgres    false    4666    219    216            P           2606    16809 !   message Message_UserSenderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_UserSenderID_fkey" FOREIGN KEY (usersenderid) REFERENCES public.userinfo(id);
 M   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_UserSenderID_fkey";
       public          postgres    false    219    223    4678            �   %   x�3�442�4200�#NC.#Nc#Cd!#�=... ���      �   %   x�3�4B#C]0Bbrq�3�������� ~7+      �      x������ � �      �   �   x�ŒM� F��)����igq������iܙ&��:�n�u3���  �0���9�~b��l�(9���B��hn���N�j�罧V�M��ޟLA!Hc��k�2��t�F��4Lw�͸�9����gÚe��Yþ�ls�gB���-A��}��\�KY6�:��#*�K�?ō.�x�l      �      x������ � �      �      x������ � �      �   �   x�3�442615�462�4200�#���Tv�M���+*��J*��8/L������.6^�pa�-8/,��|�	���L��`�闘�j&�p�)A�d���?(*N,�H�T1JR10SI
�(s��(�4s�v��w�Iww�+-	��	�,���K�3�I��ɪ(���w�
7*�2#l�̆���B����������J�2��t��(�L��`�b���䪢L#o�T߰`�@#�=... �?�G      �     x�M�Ƕ�J ����9�,��3J��B�$H|�n��.}�o��O�������yx���wgPl���qB�s%ą�%�hO�C���XĖ���g�!�7��A��qPh���|��d׫�*������^��ﭗ�=�ow�w$�-�=x[�㟍a
Iኌȅ��k��l�4!z������O2wb���Up�qf�LC��I�!��N� ~��q��EY޾�1����l��I���И/�Xg��Y����r�K"���������i�-i�3g�7 ZZ� �,��a:��%=��I�bE���&�>�ǀp6��ȞoM�v�q�� t��0_��'}A{��qQ~�1
���8~zu��m"��C��b��m��zۂ�ǃ�q�&m���;2I/u�{S�1(�:>���v�O�F���޼�y:�*�2H'Vuf'N��P��A}mJ��Ӡ&WLd���?�6f6���c�UrŽ��H�d"N�;.ջ��aB5��g�X� �q��'#��P0"*?�P��	�Z�ꐪa���R)M�6.�-���z�Kll��4}�{�f�fvP�2�|�z �0ML��~��F�k�(=�����Peu�lY��ѭ�
��F�Z=���V��^��S�DԔ`m�F�������^��'�r�$x����u~���u��j'�/M�b�6:=;�T�){晾��\j�1����W�Bͬ��T+
p�X��Ɛ��v{�&z��֍/=�x�'�����M��l����hJ�     