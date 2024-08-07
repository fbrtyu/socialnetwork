PGDMP  0                    |            newdb    16.1    16.1 5    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16951    newdb    DATABASE     y   CREATE DATABASE newdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE newdb;
                postgres    false                        3079    16952 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16962    chat    TABLE     �   CREATE TABLE public.chat (
    id bigint NOT NULL,
    chatname character varying(255) NOT NULL,
    createdate date NOT NULL,
    usercreaterid bigint NOT NULL
);
    DROP TABLE public.chat;
       public         heap    postgres    false            �            1259    16965    chatuserinfo    TABLE     �   CREATE TABLE public.chatuserinfo (
    id bigint NOT NULL,
    userid bigint NOT NULL,
    chatid bigint NOT NULL,
    entrydate date NOT NULL,
    exitedate date NOT NULL
);
     DROP TABLE public.chatuserinfo;
       public         heap    postgres    false            �            1259    16968    file    TABLE     �   CREATE TABLE public.file (
    id bigint NOT NULL,
    useruploaderid bigint NOT NULL,
    uploaddate date NOT NULL,
    size bigint NOT NULL,
    type character varying(15) NOT NULL
);
    DROP TABLE public.file;
       public         heap    postgres    false            �            1259    17064    friends    TABLE     �   CREATE TABLE public.friends (
    id bigint NOT NULL,
    idinitiator bigint NOT NULL,
    idfriend bigint NOT NULL,
    date time with time zone NOT NULL
);
    DROP TABLE public.friends;
       public         heap    postgres    false            �            1259    17063    friends_id_seq    SEQUENCE     �   ALTER TABLE public.friends ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    16971    message    TABLE       CREATE TABLE public.message (
    id bigint NOT NULL,
    chatid bigint NOT NULL,
    usersenderid bigint NOT NULL,
    createdate timestamp with time zone NOT NULL,
    updatedate timestamp with time zone NOT NULL,
    text character varying(1000) NOT NULL
);
    DROP TABLE public.message;
       public         heap    postgres    false            �            1259    16976    message_id_seq    SEQUENCE     �   ALTER TABLE public.message ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16977    messagefile    TABLE     w   CREATE TABLE public.messagefile (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    fileid bigint NOT NULL
);
    DROP TABLE public.messagefile;
       public         heap    postgres    false            �            1259    16980    messagereadstate    TABLE     �   CREATE TABLE public.messagereadstate (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    userid bigint NOT NULL,
    readstatus boolean NOT NULL
);
 $   DROP TABLE public.messagereadstate;
       public         heap    postgres    false            �            1259    16983 	   usertoken    TABLE     �   CREATE TABLE public.usertoken (
    userid bigint NOT NULL,
    hashtoken character varying(256) NOT NULL,
    createdate timestamp with time zone,
    id bigint NOT NULL
);
    DROP TABLE public.usertoken;
       public         heap    postgres    false            �            1259    16986    userToken_id_seq    SEQUENCE     �   ALTER TABLE public.usertoken ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."userToken_id_seq"
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16987    userinfo    TABLE       CREATE TABLE public.userinfo (
    id bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(100),
    bday date,
    country character varying(150),
    email character varying(256) NOT NULL,
    password character varying(64) NOT NULL
);
    DROP TABLE public.userinfo;
       public         heap    postgres    false            �            1259    16992    userinfo_id_seq    SEQUENCE     �   ALTER TABLE public.userinfo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.userinfo_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �          0    16962    chat 
   TABLE DATA           G   COPY public.chat (id, chatname, createdate, usercreaterid) FROM stdin;
    public          postgres    false    216   R?       �          0    16965    chatuserinfo 
   TABLE DATA           P   COPY public.chatuserinfo (id, userid, chatid, entrydate, exitedate) FROM stdin;
    public          postgres    false    217   �?       �          0    16968    file 
   TABLE DATA           J   COPY public.file (id, useruploaderid, uploaddate, size, type) FROM stdin;
    public          postgres    false    218   �?       �          0    17064    friends 
   TABLE DATA           B   COPY public.friends (id, idinitiator, idfriend, date) FROM stdin;
    public          postgres    false    228   �?       �          0    16971    message 
   TABLE DATA           Y   COPY public.message (id, chatid, usersenderid, createdate, updatedate, text) FROM stdin;
    public          postgres    false    219   @       �          0    16977    messagefile 
   TABLE DATA           <   COPY public.messagefile (id, messageid, fileid) FROM stdin;
    public          postgres    false    221   =Q       �          0    16980    messagereadstate 
   TABLE DATA           M   COPY public.messagereadstate (id, messageid, userid, readstatus) FROM stdin;
    public          postgres    false    222   ZQ       �          0    16987    userinfo 
   TABLE DATA           [   COPY public.userinfo (id, firstname, lastname, bday, country, email, password) FROM stdin;
    public          postgres    false    225   wQ       �          0    16983 	   usertoken 
   TABLE DATA           F   COPY public.usertoken (userid, hashtoken, createdate, id) FROM stdin;
    public          postgres    false    223   �R       �           0    0    friends_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.friends_id_seq', 1, false);
          public          postgres    false    227                        0    0    message_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.message_id_seq', 331, true);
          public          postgres    false    220                       0    0    userToken_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."userToken_id_seq"', 161, true);
          public          postgres    false    224                       0    0    userinfo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.userinfo_id_seq', 7, true);
          public          postgres    false    226            A           2606    16994    chatuserinfo ChatUserInfo_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_pkey";
       public            postgres    false    217            ?           2606    16996    chat Chat_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_pkey";
       public            postgres    false    216            C           2606    16998    file File_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_pkey";
       public            postgres    false    218            G           2606    17000    messagefile MessageFile_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_pkey";
       public            postgres    false    221            I           2606    17002 &   messagereadstate MessageReadState_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_pkey";
       public            postgres    false    222            E           2606    17004    message Message_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_pkey";
       public            postgres    false    219            M           2606    17006    userinfo User_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT "User_pkey";
       public            postgres    false    225            O           2606    17008    userinfo unique_email 
   CONSTRAINT     Q   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT unique_email UNIQUE (email);
 ?   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT unique_email;
       public            postgres    false    225            K           2606    17010    usertoken userToken_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usertoken
    ADD CONSTRAINT "userToken_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.usertoken DROP CONSTRAINT "userToken_pkey";
       public            postgres    false    223            Q           2606    17011 &   chatuserinfo ChatUserInfo_GroupID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_GroupID_fkey" FOREIGN KEY (chatid) REFERENCES public.chat(id) NOT VALID;
 R   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_GroupID_fkey";
       public          postgres    false    217    4671    216            R           2606    17016 %   chatuserinfo ChatUserInfo_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Q   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_UserID_fkey";
       public          postgres    false    225    4685    217            P           2606    17021    chat Chat_UserCreaterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_UserCreaterId_fkey" FOREIGN KEY (usercreaterid) REFERENCES public.userinfo(id);
 H   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_UserCreaterId_fkey";
       public          postgres    false    216    4685    225            S           2606    17026    file File_UserUploaderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_UserUploaderID_fkey" FOREIGN KEY (useruploaderid) REFERENCES public.userinfo(id);
 I   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_UserUploaderID_fkey";
       public          postgres    false    225    218    4685            V           2606    17031 #   messagefile MessageFile_FileID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_FileID_fkey" FOREIGN KEY (fileid) REFERENCES public.file(id);
 O   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_FileID_fkey";
       public          postgres    false    4675    221    218            W           2606    17036 &   messagefile MessageFile_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 R   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_MessageID_fkey";
       public          postgres    false    221    4677    219            X           2606    17041 0   messagereadstate MessageReadState_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 \   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_MessageID_fkey";
       public          postgres    false    219    222    4677            Y           2606    17046 -   messagereadstate MessageReadState_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Y   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_UserID_fkey";
       public          postgres    false    222    225    4685            T           2606    17051    message Message_GroupID_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_GroupID_fkey" FOREIGN KEY (chatid) REFERENCES public.chat(id);
 H   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_GroupID_fkey";
       public          postgres    false    216    219    4671            U           2606    17056 !   message Message_UserSenderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_UserSenderID_fkey" FOREIGN KEY (usersenderid) REFERENCES public.userinfo(id);
 M   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_UserSenderID_fkey";
       public          postgres    false    225    4685    219            Z           2606    17072    friends friends_idfriend_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_idfriend_fkey FOREIGN KEY (idfriend) REFERENCES public.userinfo(id);
 G   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_idfriend_fkey;
       public          postgres    false    4685    225    228            [           2606    17067     friends friends_idinitiator_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_idinitiator_fkey FOREIGN KEY (idinitiator) REFERENCES public.userinfo(id);
 J   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_idinitiator_fkey;
       public          postgres    false    4685    228    225            �   %   x�3�442�4200�#NC.#Nc#Cd!#�=... ���      �   :   x�3�4B#C]0Bbrq�3���3�4é�(�K��9N9sNS�f��qqq �� O      �      x������ � �      �      x������ � �      �      x�Ŝˎd7r��s�����d��g0�Ѹ�Ր�1��=�N��;/���^Ѐf��
Yo�?ȼ�jQge���""y�`0xK�3������8N��'Gx�����_�^�E>���J��9B/�F�-�B�9��W襔��
���^�����{k�0p�t�����7�m�x�������k,}|���t�o��9�K�����o���9լ��Z�����k�E�jE�N)�\�]�JY�n��tx|�~��(�������ŝ�l�?�v�(^��Q�b���7bB�{1��)�r�W&4���޼�l�^���Sr"���FB��Y�2��+Q��9���,�����RسkچBI^�OĄs(�^"1���o�߼}~����3�O>��3;3z���xo��fBw�����*�*��@F��\10#'��7n!{M�Z�#DQw��{bO��-8��J�{����(l�3�x:�~���$m!0�*�s#�3*�l!2�03��n!����)��Z�(Bf<ʺ7G�Au����P�`��ᨑ;��"��y����*{�����r!Ff�F��#}9ŊpFZeA���"sL	���� �̞l1� �0GR����hp���#V�]�Ldn�ɥ�1?_��}������E檱�"�11#3��y}o��ll�wI�,���[��"��tHOϑt�}��[d�+Rm�၁��-2��ƍ�H�,�R'��l��������3�[�ۺ���aB�B�ɺk�!)T��a��u�!�v�L��hKqMP�2�ﭚ*�hK���	�
(}f�}�`�wpq�7�Ӓ$���z��h�#�����T��X�xa���/�d��2|ﭱ��H�![��R>�y�D����_~��-;���Ty����u��	�+�rx��Ҙ/��6dB�H���=����2u�ғa;�)u!��;�]���-��.��D��i˕��~ja?��-7����<�]Bz9X�\b�7�/�B�HȬ���A�:^�di/��A��r�G�7�ۨV�V	�͙�^�w[��5dZ�6Mg���[�.�$v�����������������ǗoϿ݊qK����\#h���m�D�!ߋE��F�J���yӬ��j"␂�d�4��-R��V���ڪ����#YG&��3LcV�z'<Lt���//2e/��K��n��"�5I�FP7�4d0���_��Axm��"�����ri$k{/�������jRJ1%y۞X--H,���VM �ғ���uF�O[;�>���d ��{����GY����HL>���8:��9LgYI_��~��-$��d3�v����HX��h�c����J��3�󇭙9��m�UΌ�o?[����)�U��f$�&ϼ�����g}w��R����G���i>=�|w�5�,`h#S�fګ��x������������域�'Y ����/X7I��p�|%-���>pY%p�Ȳ�Y���\������������H�Zf-G#ٽ@�Y�L���dm�?$�vH!_�f�O�����˷0��)b��M��\���=Rx+3i����ǿ�꛿y�+ر��e�@j�{V�R8�Q@O_0��@ۦ^ּ1
do�F� }�Jt!�D�L�5��W~���$d�]�^Z����?�ۑ��L#��l���ԑNy$ځ��h��9��(��zn�dYչ�-���V,j�Jl�:0�:����EU���%������^eC(���BjsA���6�e�V�i-�}C���1b�=�*f����OW!�:���wtz�*���"x�O��n45^Z���O](2�{��r��0ׄ,:hQ	�E�"�c'�V3��]&��7R��S9�E�]�H`�)+���厮[NoE�ЗVX�X����~�Ucq�	���wo"u�ě���"7ܞ��/H����Gڲ3���@���=C����W���8����3^0����Rh�Ă�뭨!֫*�~6�����nR�����C�%��� �g��p�?�@�����.q&Ff#ɬ(��=�kč,b���y�P� X��aNy9 �I�\�d�<01)�OtG����L�c"}lAS�7������Y��jD�>�$�H�(��Eo@�,�L%�>7��.z�&��_X#��:�鍨!�����1#�gC<�0f�ȚxF�2�
KA�Z�^���V�l�OUj�3B$Nl�!�bF�4�����R�Ud-M�`�u���ŭ�Q�	��e6�˲5B����� G�2�ES���jeF��ɺLݶ���`3��� L�, ��#����e��0�2�,{I,�Έ>�u��'a�	�1��+�m�!�d3%S*���֜�uY}�$���B�̳�J����������=g����MYse�1#�w&k�����شO!9��跽dk��L�{]�P��\����u�.0F��w�X�����$$�*g������	�]�(�əB�_L`i}]�쮚GPS�b�m�k��S�.)ԏr�bc�˻�I�B�a��`�EJk�g�� �FX5ɨ�:�E㤯`!��а`Ӏ.��mj����4`��ڠ���3��S:m0�A����,F�'0�m<l2UB5��=���M��9g\��۹}B%+����z��&�\��ЂDߦ�J=h��BrT��C(!h�Y����S��<��	A�N����}hEЧ�׷_��/�����B1�S��>��&�7�ءE�!zg��C"^��}�"���������07;�k}�1K5y���P�>kJ�	�� �g�Q,�l�+���Я���،J!�gcQ�"��B(��BH;d������U��B�-�*��;6�>L�d��� B�n�H��$w*���d�ax�2^ƽ�.0�Τ���y����[P�>���D\!�g q�l�Z�� ;�prG"Ђ�����,/���3�+<�DN"-+.&���)��.�!y�c]J_ѰHv^�����fV�{5�H#4��us*�H�E�oQ���_�I%4B>��ċ��%�-�Q7`\Q�������<�	�C-E+`"�t��1d���hG&^�d�\{�F�oR!��v^�Q�Zy}�f�EI�����1�Y:l�C�"�~}Ѧ��5 V{&�7��5���l��
\а�<��c=E�AEzf,�H���hXP.�.�6e�MEC�~�͛��{޼��H����6�Q7�0�9�c��[4.zfat,�ܹ��n�M���9n��6��Wk�rHc\�&�����2�kj���j#?��I5��]mf�
o��,�9��};Z[$�j�N�~,�L��'�ͧ�'��G�H��wn?b��w$���~b�8#�\_��'��O�B���~b��^BL��f���g!V3}�}rb�����/>U���XO�$0-H�Mt��=?ҿ!����U�W�-�S>���ו�l�"$	�y`_�c�%��}��HR;H\��3=�w�-�Q]_�b=T���E���"��Ri�E��C��P��Ȃ�8�Y�Xry�hX`�P9Ds â��yc���c59�a�y#Ē���?�X�J�qA�c�Q�G�~S��O.hX`>%-�i̙�g`)R���nhX`)be�$,�$��	撲Z��qwt3���e��8�L�)Xt���d�z7�*��K�	��Aߛ�	%�3f��3O�}�B_'��M�$܄��8W��f9bI��3��@}0���$�ld��b�����/������hX`Q�L$�,B(����f$�p��a�c '�lA�	�^�U�G���3�F99����>��"Tw�&+%��0����	�Lb謕ͺ$�4�D(FV�3%����D�U�D�x�����z潱,wA��l0o��K9�B����:�?&/:2.hX`��r`JBZbAR(���7,hX`QQ�Q��O,O�"�\D�fU΢a�yd�I���D����c}Ǎ �[�Ex�Zذ��A�CF�ޘVT(Aߎ�]HNqژ�Pނ����ddX	>]_?��4���~C���P�I���ۈ�d�]%��B}   Q2��yr}VQ�i~��K�[,C0���a'-
u'�M�|aT��[2�)$��	墐�"Q!ѷn؅�ޙn��m@BÃ�E������*���l'VH��:��{-�)G�,]���(�[P�,���}X�x��<�
���gKz�ː�o_�=�x�����W0�rūx�j O-���7/�=�5��^�����xYt���w0Qx��,�j�F�~��Tf'���(�Ό��s�p��4�<Q�52���_��eC�C�ߏ�r�0��E}�\n��bm��jE�t�o���˙�      �      x������ � �      �      x������ � �      �   +  x����N�@��3���igz1�jZn� Z�a�b��i�^(e��|���n4���L	��hL�K��0�dE���">�	�r����	��j�����'���_�����|*4��Ʊ��zx��Lz)�Ŏ�^�����&�5wh���_����[\t�z3��Ag���t��I��+��feףQ��H���O��Xc%D�¶�b��cMn�TY�!��C3��]1��1:-�gi��Sy���:�~&m$���e$��X�j�0C���LM����F�Ö�W��k�Ų�B�@��      �      x�M�G��ڒE������ ���
�{���yG7�� ���^����"�!⿡�Lɤ��l`5(����Gf)%g|<>�<˖~4�L<0L�2�E��?������q��fD(�T�S�(Vȏ�g@lQ�B5b�O���^����b�����x�K(�$HB�[�z ���7�툆�v%V���F�RtQ�4M*�W��Qp��~V�rҧ�d��6i�����(��{��!e��SVVӿ�_��w+��ҁ���+?�~n^TrΎ�O��eji�Pb(Op<���՘�n����?'o�!&YZ{er[s�`:?�%<o�	��$͛����W���AQ�pg�c2͜��bTm���?���?��p���f��̥$&�5ȿ���+�䂹L�����eszx���4a��D���*��#�|�g����_�ibǧ��"��×�=�Z6�GUlbF�}�tN'́�V�5�[Mi�]u�p�\Q�=:�s��9�����_S�ȥ�t���e�+��ϸ��ɱ*�	
F�v�W!$�P�7*�;?������ueO�x���ȍTZ��ϔ�%�_ȅ�˓�m����<ӌ^0z.f�,6v
�Ԥ~En����ۻ�?��>09�z�h[jOHg��<:[Q|w^�iE��+rc�t+g�Z��ƞ}YQBՆA	�b�3:����"��x�A;E��
�`=���fKs5�ZSy[��1댯j'�
��f�w,(�F��h{�û)^ɽ�bN��s��z	�:����
��{�k��ܝߚ�p-[p�S
w�ݔ]N�]f�˫�,�����N⹙�o��E���}�����e�L��Z�.*�[f	����AR������V�h(���>�Xj�ȏ�g~b5y��H��Ia`�%Fm`|�F��ax� �.D�"7b7.Sߢ�՜��|��-�e�SC��h�zӳ�E�q����=���ȍX*g߃"� 8�S�eW*@�������1?�S���x��OkD���$���wT�t����� y��3�)��|K��jsXty(������;�5����S��A�����Y�*��>��͜�Kx��m��<���΍ؗJ�'���џ�\I{W����P��т�hԌ��|d?~���}����T$3��S��'4�#���1��>گ��W�%�"�`ԕ_+@nĮ�M]B���PHU��A 'b[*��u�@�s�v�u��~E�ľ���T�P���c.��A�^	���0��WP=i�����#2�R��	r#v�+!q�A��ц���|����
:K����%����hy7P��X};ߍ�d��G�`̕�o�B�Y} �&��e�����!�S�[wl���΍X����G6�������~���M�7C��ũIH˹�s�}��������塜_9r������G�f�aG�	Z4�2H�K00�W�F��E�3]��M�0б1P[��3�	�����HsE�㕊�<�"7bK���,Vz��@��,J"�,qئ���\s�y c��C���t��8��i����
.���F�d��6'���L
!�8��
���F��9����.O'i�6;7H���ԼE���[95�ѥ�T_�Eo�>������G�^�Dcf�D�r1�ؐU�dHtY������ �����x�0;�kze��e��"{Q.�X+pJ�����r����7b��>�c[��QϳN �շϹ����C�.���XR�����Ǣ7b�IR< � >�rV���]`Ѡ�ߩ��������C��|�Z�}_�Fl��k(�m�����������U@k�c�1�@)�D��W-}��i�F,9�bk-�?�!=<	��؀d(6�i�*�-h�4߹�ǝ�ѿO�݈����N�t������96L6[+Ȼ��QaM`y����p����&؍XFv�w�B�V���˚�/�N������{Eί��kY�6�F�"�[%��Dz��d>�6�<��'��l��B�x�Um����������:���z���?;0��	C�8��~p��8���# ��߾�݈e�� �`1E�e#�~M*g�G(����N/E�,�W�U>y��?�oMn�nR��c������ ����5�p��x�Ǒ6��,�_b��n���#�Zk��&~^zW�:bC�t����;���u�u6�F�O�(r�Iv���@��nT�-�<i7�.�Z�w��'M�淰7bgs������[(���j��O��n�N�6�R<7UߋDW��w��=#���H���6��a&y�(��c���|׸?&,��ހ��[X�F,HE����ׄ�S��{ e��z~��hm�a<�m��|Q�m��篳�7b��/�Y��c<�m�΢]�(��)�nj/0�`v�2��\��u6�F�§l4l*����r�k}���|�&��6��J�3�,/V�{��*��[�ڲ�|��_���3��I�>Kfޡ��gW��j���*�-���\ }}N&��#���'Ÿ�����u�A�Wtk�>�&��D����߼P��������U�%�,��=(�J^�~�Ԗ@!��� ү)��_��Kl��t����#^���\�(½��î&Q!
�Pp���v}kB���ې�B\h\E鄣5 @�p�t�d^�g?#б����џ�A��+�"N���RU0f��N~n ��y�K�����I;=�ߏ�����9�S�5<���IjB�4��}��F��>Vt�|`�ˊ>8���W�ٻ4�L�1i̓��O
�C�*��/��/]
!���b���a��#&��"�J`h���3�F�{'��텯
�F�Bx_���z\BW�I�S��A����J�f�;���aL�.�q�Sl�Ç����RD�KS*�s�v:d_,�[g�� ��"v�n��7�c�
c�<9�����*�`R��F�7N��gC��A� ��b��/��G R��AƉD�g2],|��/�č��]V�i|��#�]p�϶��xO|����V��Ȝz<��맥���čة�Dwµ�'� 0����3mL��Ϟ�\|�8}��W����[��߈]�#�^��Qy�yvN�-P5.�"�1�< ����>=/�d�"7b �BAc�NG^��=7�c�m,��F�~������S��=n�����
Z�`�}�f%dc ��Ow_�a�33����>�տ�Hވ%����
�����Sҫ=�u
����O\Xŧ�r£��܈K�(�!�D�4��tpf= X������fL��	���������[L������D؀aǤ��P����+&���t��$�s�x���:y#6u錣�n�?�qmS��1�Q��L1T�!	NXƲeqa*��~Bވ匣f D�:C<y�t�>�될�f�������dT��,����܈�uRYWB�p�<:R̬6�6����ݟ�z:o�l����;Lٯ)��T y��c#��j�q�ع����చ'p� �������F�������Ѯ��(��V	���^׶�հ3Qk5��h^��1ˌ3~|En��v.�����dV;���ʑe^�UV���U�htdDS��V�9�_�n�rY�惁������g�e=˖�P%�΋"!���ۿw�����M<�|��f�;�҇����SG���P8��Qx�bW9,/m~Cu#6��e�g�o����[`�3������Y��~�OއV}�+r�{���uF"��ְ��W�1q�u�a�ʦ�
R���d�?�U���n�ڕ7�'O�z'�[�EE�%-��]�����jO��/೯�}krK��G�S'V��U	H���o�F�߬S%PS�y!L��rK���5j�F����e�r	�%�e�X���X�!�4{.4�9CgI`P!�f��'�k#Js򢎷gZ�s�u��}�*)�����]��	�
BC��Q7b��"^�"�Q�F�Y6���VU�c��ױû&��n�;��oˠn�����3������sx���P'>���#�#�h�?����C���F߈�i4����	S��iU�
V� e  $�FX�i��vx��L�T$?㝡��b�Fl:����D��y�xk>``j�%����-A��ěe�O�Pl��a�Fly&�m�b���U���7O�l�i��!�qK?���2��m���l��TM��K�5��P�	#C�W��$P��]���5�z;᰿��7b�hک�*t*�k~�wԒ�옝Ol��#�m��da�"�����Έ#����!Ⅹۃ���;��6=�"1~p�2�1�P�?������,�[b�������!���[��Y~�9:t�|���Y&e�J�rB�RA�]�S�L�MOEB��'5" ��O�z�b�%p�OƆĳ~|{#V�WI8<2�,�`zQ��k��a���^:��K�_�(r�9�������	(�)"��+;ᶭ��Tm����2���?�k���vO��A��^(����� �i=�#���\��,˿����P�${�>T�3~Un� P�l#=u���������-�jJ�CD���������{_���5��^PFk��r>���N�Շ�~hc]�E�? ��qn�)��ݠ[2 >��R��irY�?��;DNG�j�}W��$�|��B&���?������m��{�����L3�z�У(����V��z�!��������]`"TQU�9^R��S�X�,`q+a�.J�H�)x� �}��Kٯ�\����j)D�2�M�r�@b��_|��M_���/��d�������,7��������U��=�<��q钘?�<�	���k�����k�����Q�H"*�Q�N�
�g��5����� ����H�5$������VgL�g��bZ��8���h�GF��	ȲU���u��'��������N�"��p�P ��8Y��f|���h{����H�~N0���.|cW�ݥ�hQ\#�q��Y՛���AL�Auesǌ9��y����o�+~>kB.A��Y��eq9�M>D5gE��?A��5F�3B��|مo�Zr��?����cR���pC��PE挡i|A�@#x�<��P�W��.�$CZi��\�}�VUW�G"2�u��˯o!tx2�	�eX_�[J 2=��}�Ԏ8�%��<l/-(&�^+��������G�$^�����i;��+d�������7�}=�v3q����~Z�Wu��=d���_G���@6
7�8� 7����yF����3u���'��R�lW�@��e']>pv#�DJ
��7]�*�䄩�u��׏QJ������-)T�Bx_U|�z�6?����U��[rq����TB���>��(?ǯc"��{��F�¥�����J���dL�cp:��3�-&M#27h��ݩ�ȍ�ϫ�������|�=�n�Զ&0�8�k����u�
A��)���})%V��(����O�?���\m�����Dj�$��
B1�|����6�7v��\H���ر}��i@��
ƹ���K+?	�RFx_���V����S��e�Z�+�in�^��
/]xO]��P��	Q��pa����G�m���^d!����I$��g�9��u�ឣ`�����S��u�)�$��g�{DÎƊLn��p�l���j���8f`^�?��ȍ]SG�X��[�g���`�i�OM���j�~iyn\�P�j.�vǜ_߽/�`��J?�UJ������Q^ b�'V�2G�9T�X�ZSr� ���!7�-����pVդ�goE�$M��ɶ��� @��������ou�+��@$���z�T�yP��x���q�\�" ��yQɮ��#�ou����rW擀�n�AVz �xV�՗1������0g|��C���[�(�K�})'9����[W�=�+���Y�
M<MY�P\�Z��	d.��/i�L�[��.�z�[��'��p���7���&��k�<Z����u�g�W�u�Ox{�c����S�゙��8Qp�|	�'26�\���`|������5���3!뙖���=�b�O��S)q'�)	�yM�^b@������7v��%���(���� �|@��}v�X��쉦�Dh�c�9�Ouo��Y�1%��O5Ο;�b4�lmH����S ����h���������W:��z�\ ͡�y ��G:�s�Awܠ�d�A��,������"{�J�a �{L�T��&�,�?=b�?r,z@�SB%��Oߗc�L �n�|Baf	v���	L���!o��t�wl�z(����G؍](z�����0�E!ȼ�0�It����3qN�G��Q�mr���ϳ�ح*�.�!?�I0�!b0�PErR4ô���S��6l������'V��3¦������a��wI�6Jx�t�H���2|y�/�t�����8�I�F}�?C����lI���iZ�	;�q���+)������nAEp�;�S)>$;GL̆��Hna�����֒����"{4�;���=[���W#gv�EL�+����7�IoF����G�Ʈ�=�+V[�h���J�wq���a�FB���$p�{�&YM�(ٽ/�R<�N]C�'𢡄��ӣ���Sߦ�>F1ˋ������?�������k�L��VqL���|��h;��>�����G��:�Z[B-�g�����L�B��DR**~��M˴ߟ:<�x[Yv�5#$зM�?���rc�C�L�zrj"�䶇}jǵg��������U����ˠ��(�|��T�5C�)����B��ș���$�U����B����LTn�_
�ţb��8�a_ӱvQu�a=3|�^�b{�#�sq��c�We- cY�$M�p�.���	`�#J��l���3h�ؒry�7g��.��['�3 N.�}�c+�|� ��Xo�2y��:nn�E9���B�$u_�1��(cJYv�����"�\�����h��=�� ��q���.7v��i�8ʭ�:ΧK.8�]��U�v?�(�w{���Ր����o삜�/�֫�	���R��Y׵���l��M��7�$ؤU_\Z}Uny���QD<��l̞����$�؇�N5{�u�*e�3��7v9H�y0�[;/�����4�r%]{r����0ڏK�D�^#u'����?�?���9�     