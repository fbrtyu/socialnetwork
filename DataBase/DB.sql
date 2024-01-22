PGDMP  1                     |            socialnetwork3    16.1    16.1 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    223   :       �          0    16842 	   usertoken 
   TABLE DATA           F   COPY public.usertoken (userid, hashtoken, createdate, id) FROM stdin;
    public          postgres    false    224   ;       �           0    0    message_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.message_id_seq', 21, true);
          public          postgres    false    220            �           0    0    userToken_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."userToken_id_seq"', 54, true);
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
       public          postgres    false    219    223    4678            �   %   x�3�442�4200�#NC.#Nc#Cd!#�=... ���      �   /   x�3�4B#C]0Bbrq�3���3�4é�(�K_� �;      �      x������ � �      �   �   x�ŒMj�0FםSd_*�,��Y�1��@����J ��}��S����M�3����� ���G;�K�>���F.��R������6�;ᢅ�F� ����i0p��r����A0���|^�L��XN�� ��|J5���"�-����fX��+Ak�v=/���2���4�Xb,�S�N5A~��Y^�|�Z�R�?���^��S����\���7R�t����O
F	�s�K��B�D0�������*W      �      x������ � �      �      x������ � �      �   �   x�3�442615�462�4200�#���Tv�M���+*��J*��8/L������.6^�pa�-8/,��|�	���L��`�闘�j&�p�)A�d���?(*N,�H�T1JR10SI
�(s��(�4s�v��w�Iww�+-	��	�,���K�3�I��ɪ(���w�
7*�2#l�̆���B����������J�2��t��(�L��`�b���䪢L#o�T߰`�@#�=... �?�G      �   �	  x�M�Gң�@�q�:z���FxO��U��E���/�)����_�7��1%ٟt����m�t=%Ō�Jɳl�T�8��"�1-���?�_��'?�zT��L&,�|�� ~���A���~:|<T�l���֟����sȳH@8���@���׵u���vZ`�ֆ��w�4M2��@�6
���k�+'}sp�n��ZJXa�Tg�:	OH};�O0fe5�i�Xp(�VL��=Ê�W^�v�^T2Άjo��Ernz��b(O0,����6&�[�ψ����[�
�Ҟ����ޛ����7���1��M�Pz�\�i�$y�#0z8$��h�'U���7*�N��q�W��m7��#��X�4���rri\0���2b9mF�P��88J{�ڕ��G���Y���Lɿ���ĎOr��D�=p�/�[V�����X���~ڨؙ�s8i���i<o3}2��=wW�%ۢ��0�����c]��6�5I�x.즻����7B���3-�cU<�����U[�_C���	����Mj�y֙���i��M�S�kL��N�D����6pr@M��iF�9f3�g=8��H9)�o�FA�u�����զ�A��VeҖ����-��Ζ$���:��<���U­��k��@����W+
%�;�����Q'����S�������� &Kq��ŵ�dX����	[�gY�����SF�I�n1�D�~ܴ��b��ď,�N���9hb=�a�ԅ�B�Z!�zj��/����g&7�e�lJ"�F������eֹ���"�9i��9��vɞm+?+�y5g����)f���v.]3�kNx>�(y�+%����Jn`ɩ".[�(v�q��H�=�BG�S�ZG�(�9��g:�Q�#7�+��/e5��1�ktKv��Ԑ3t;R���.0^�r��:b�@�|�`�&��i����`p���7��c�,��1�U<F�QP��ְ����ǪljDUI!}���; 䥮kd�SxaJ����wY(y���e��N`����|_e.+��3-i*Kg���zyn61&`*�c�����Ī2AD��G��`tŨ�M�� ���F3: Q3��t�~l������XuEF��7��������@x�0�kF>����E	�8��=
��إ�ɓ��>�^��R_���sx�D4`��3�������ݺ`�o�.V�.IɄ��hgc&X�^���tƽT�'�f��� ���|��7�ó�蕨l(�� d+��	j�Y�"FW�����l4:P��P��|7��ZT	��3�b�C�h�ǁ&<�y�f�����Ò��9�����M,o��-đ���Cp�}�G;@�t�&͛>?���I�s)�;(f��r�>��!!�C1?s�4���6f�CѵF���A9%������(����z��]��KyV|o�����-���q��~V����WJrC�DnbK�D�,�>����5�g��\���Sq�u�����Yo??����b/�H�4�8��s����g��,����Vu�$�#a�������ϛ�&VϜ�x}f(��NB��tv�>����]�f��2l�T��Y������R�_e���=i/��1��{
��X�g(�³�y����r+���xA?9�:��¼i^m�E/
ÙJ`���e'�Z,�����}�nv��mɺG��:��V[�c�ث�C�.��ǋ4���r��{�"7��(H��Y9�G�G*���HP�F�eq0lp4u�.�.���u??�&��ե��4�EB��d��0�h'i���^���{��ԋ����vKO�����ٿq�b�X��/V��T�kк5h��ǝ�<�+Aobc���C/ݳ,�ar5��UG��
�n~=nM`6odr�Vv����}�No�2$���o��(��jd�<�B��O�L��ఔa0������J�g�86��H�Qͷ�f�'ۨ����VR�������������@ob�TC$�]�pZ�'�Av �F\_P{w�.Ҷ��>b���;�M,��8��ɣ4i�:r���W�!{!�G���#�8�|����fr�
	dڎ�S,)��3G��g_?B��AJe�=m��,��X�&����ap�����K��ŏ*pB�op�A���`:�}k�����Ɇ���~u��$�6z!иb5��l��}J率	'[-�����=�&�M�g�7��9Z򩶟���.G��Z-��-���z�᪕�$�Mec����v�y�a�4�CI`��X�0<�h$E�}�k�ۨ1����[�w��M,E���U��©��T��ʜ���D�������YK�Y���ߓ���_����x�1�z8�r� �W���`R=��$��q_��d�nbg6��~�Ah��7@����+���?K�5�%�A����`��!����b���_�~���^     