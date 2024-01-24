PGDMP                       |            newdb    16.1    16.1 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         heap    postgres    false            �            1259    16971    message    TABLE       CREATE TABLE public.message (
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
    public          postgres    false    216   8       �          0    16965    chatuserinfo 
   TABLE DATA           P   COPY public.chatuserinfo (id, userid, chatid, entrydate, exitedate) FROM stdin;
    public          postgres    false    217   I8       �          0    16968    file 
   TABLE DATA           J   COPY public.file (id, useruploaderid, uploaddate, size, type) FROM stdin;
    public          postgres    false    218   �8       �          0    16971    message 
   TABLE DATA           Y   COPY public.message (id, chatid, usersenderid, createdate, updatedate, text) FROM stdin;
    public          postgres    false    219   �8       �          0    16977    messagefile 
   TABLE DATA           <   COPY public.messagefile (id, messageid, fileid) FROM stdin;
    public          postgres    false    221   NB       �          0    16980    messagereadstate 
   TABLE DATA           M   COPY public.messagereadstate (id, messageid, userid, readstatus) FROM stdin;
    public          postgres    false    222   kB       �          0    16987    userinfo 
   TABLE DATA           [   COPY public.userinfo (id, firstname, lastname, bday, country, email, password) FROM stdin;
    public          postgres    false    225   �B       �          0    16983 	   usertoken 
   TABLE DATA           F   COPY public.usertoken (userid, hashtoken, createdate, id) FROM stdin;
    public          postgres    false    223   �C       �           0    0    message_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.message_id_seq', 174, true);
          public          postgres    false    220            �           0    0    userToken_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."userToken_id_seq"', 121, true);
          public          postgres    false    224            �           0    0    userinfo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.userinfo_id_seq', 7, true);
          public          postgres    false    226            <           2606    16994    chatuserinfo ChatUserInfo_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_pkey";
       public            postgres    false    217            :           2606    16996    chat Chat_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_pkey";
       public            postgres    false    216            >           2606    16998    file File_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_pkey";
       public            postgres    false    218            B           2606    17000    messagefile MessageFile_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_pkey";
       public            postgres    false    221            D           2606    17002 &   messagereadstate MessageReadState_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_pkey";
       public            postgres    false    222            @           2606    17004    message Message_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_pkey";
       public            postgres    false    219            H           2606    17006    userinfo User_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT "User_pkey";
       public            postgres    false    225            J           2606    17008    userinfo unique_email 
   CONSTRAINT     Q   ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT unique_email UNIQUE (email);
 ?   ALTER TABLE ONLY public.userinfo DROP CONSTRAINT unique_email;
       public            postgres    false    225            F           2606    17010    usertoken userToken_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.usertoken
    ADD CONSTRAINT "userToken_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.usertoken DROP CONSTRAINT "userToken_pkey";
       public            postgres    false    223            L           2606    17011 &   chatuserinfo ChatUserInfo_GroupID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_GroupID_fkey" FOREIGN KEY (chatid) REFERENCES public.chat(id) NOT VALID;
 R   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_GroupID_fkey";
       public          postgres    false    216    4666    217            M           2606    17016 %   chatuserinfo ChatUserInfo_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chatuserinfo
    ADD CONSTRAINT "ChatUserInfo_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Q   ALTER TABLE ONLY public.chatuserinfo DROP CONSTRAINT "ChatUserInfo_UserID_fkey";
       public          postgres    false    217    225    4680            K           2606    17021    chat Chat_UserCreaterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "Chat_UserCreaterId_fkey" FOREIGN KEY (usercreaterid) REFERENCES public.userinfo(id);
 H   ALTER TABLE ONLY public.chat DROP CONSTRAINT "Chat_UserCreaterId_fkey";
       public          postgres    false    4680    216    225            N           2606    17026    file File_UserUploaderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "File_UserUploaderID_fkey" FOREIGN KEY (useruploaderid) REFERENCES public.userinfo(id);
 I   ALTER TABLE ONLY public.file DROP CONSTRAINT "File_UserUploaderID_fkey";
       public          postgres    false    218    225    4680            Q           2606    17031 #   messagefile MessageFile_FileID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_FileID_fkey" FOREIGN KEY (fileid) REFERENCES public.file(id);
 O   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_FileID_fkey";
       public          postgres    false    221    218    4670            R           2606    17036 &   messagefile MessageFile_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagefile
    ADD CONSTRAINT "MessageFile_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 R   ALTER TABLE ONLY public.messagefile DROP CONSTRAINT "MessageFile_MessageID_fkey";
       public          postgres    false    4672    219    221            S           2606    17041 0   messagereadstate MessageReadState_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_MessageID_fkey" FOREIGN KEY (messageid) REFERENCES public.message(id);
 \   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_MessageID_fkey";
       public          postgres    false    219    4672    222            T           2606    17046 -   messagereadstate MessageReadState_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messagereadstate
    ADD CONSTRAINT "MessageReadState_UserID_fkey" FOREIGN KEY (userid) REFERENCES public.userinfo(id);
 Y   ALTER TABLE ONLY public.messagereadstate DROP CONSTRAINT "MessageReadState_UserID_fkey";
       public          postgres    false    225    222    4680            O           2606    17051    message Message_GroupID_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_GroupID_fkey" FOREIGN KEY (chatid) REFERENCES public.chat(id);
 H   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_GroupID_fkey";
       public          postgres    false    216    4666    219            P           2606    17056 !   message Message_UserSenderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "Message_UserSenderID_fkey" FOREIGN KEY (usersenderid) REFERENCES public.userinfo(id);
 M   ALTER TABLE ONLY public.message DROP CONSTRAINT "Message_UserSenderID_fkey";
       public          postgres    false    4680    219    225            �   %   x�3�442�4200�#NC.#Nc#Cd!#�=... ���      �   :   x�3�4B#C]0Bbrq�3���3�4é�(�K��9N9sNS�f��qqq �� O      �      x������ � �      �   �	  x��Zˎ$9]����+������U��F��#v�@�K$ĂhZji`D�/D��F���=���Y٭<��t���^��rx�eq?��w�r��?Z­��wƿ�/��/�|W'?�u�_z�.�_��3�~)%S_�w��������i/ X��O���'��[^��I��s/az:~Dk�O�n����0� �6��'������q���]�+/��:;�tH���u-N�3�4E���Oإ��`�^���Ƌ��m�߹v�h^�i)}�	��ýP�}�:7��D1C xu���~n�����27�L���l�����1��-�2*�pX�!�]�9&(�e|"Ρ��DB1@������ό'|��3�z�����/#M�D�R�1�����K*#�h��5�rh}�q�5E�p����_lbw0B&8�N�6�D�{(���{<,�.��=�L̹J�܈w�RL���b�fB�C�V!���/��ZE2c�h�m�t� ��2��P�`�nq��
��C����6\��K-�e�D�bC.����>�#S�/�X�ȨP9]&2aJP�hP5� afn�S'1�9�~�S3�F�Cl��X3z�d"�i,�lc:�_�{�����&2��z��cb$=$���6�I66$k�#�z��0�Md�M���������D�\�j���'&2��y#:�3t��4��`_
�z��o��b�f�m^T(� �k�rm��QBժf�஥��4뛚�3dR��M�U�3dR����9AZ����/��8	�^fZ��6i[�l�*Mл�eR�,� J��\�Ӽ0I����mk�)=$j�Z����605u����}��Ɏ݇�9�*o�z0��pǨ��9"p7��-�i���C&l��������{���V�46Ap�r�q�+@}cr��u: N�oM���S��z4�qw�6w�ޯ�)����^�<��zk
^��Y#�+w*��� �^��=w*=Ԏ���C��V�����Ta?AoL��6m[6M{��{S���α��C����������~^�?~\�a���G"�[�f]͐3EE��ڋe��I@+����jXgH������U<���@eh��{na-�!�]��$�J�sd���@�i�*�6	f�J�'�b�2�r��ty��vU�2CpWY6X^{��?�ZA�LU)Z̒uRK�����_n��g�*)�J�6�X/�0�`�
�bX��)�{���ٴ��c�]U0C��n��h,D($���?�Uΐ��8��p��2"��g�2-r.�UU33��$ƃ��Hظ�Pϣ��n,�������/��5�n��uN!&_^�Q�"v�nSY���3OF�.��r��-*��
k�lT;X3�2�����o VU��J!�e����������O���ww�J6���S�*����� ���]���,��e�B��^@��������H�Zj/g����g�j�d1;��($�<,L��B���&���0���GP1��>E,8���\�ޣ��\��E����o~��_��<Z�^N��V�gD�
�+
���2��x�r�˞7�@�J7�K���(�%�E�O��wNV��>�^j����ֿ�;2n�4����C���%�rʣ�Ŀ���7����e��H�U�+��X�jECM.pT�!���u.k��7U�k��Ky]+���}���؍¶YYHo�l ��cQ�o�5������F�VO�BW��Og#�:���W�8�3��e�ksAU>�~@�Ѧ|�!��|��Eһg�?@�t��I���e*@4�wfp2j5����"��Fz�"��F�Pk�9�>e'�2�\��у���vӰm���1@'���QgC�"�ߩ޽�T2�7�.�"'
�&���t�?�HG���dF%DG4>@��/�1��(&��'z�(�:Q� .�F(h��|��m]��<��>��XeL�hg`�ܷ�C$�c�ğ�Fa�����@��P�;.:řG�UQ"�G�7��)���MB� ��L�Dyz@ē�9@M�A�(�wt�:�z��ؘ���������b�l�z�L2�>],QH&���e>��m��2���\�r���.v��R�s�|�[n��ea��!�g)F�!�!3�����^��}��K��l��l�8:{�8�4/FH�5��2�i�vV+���jiR�gQg�(g_��
���6.�$/��YT]=ty@�<R�Y-��%@+�Wz����d]��m[��0��P�� �X��G��H�M>A�*�,�$B{�ްw�NB�	j0&輯0s�NSrQ���nD�=��.�oR��O*�C2���?���A�q������C����ʺ���ߩ����?j�e��C����%�X3AX���^g#���;A��E�t3
�o������?3o�      �      x������ � �      �      x������ � �      �   +  x����N�@��3���igz1�jZn� Z�a�b��i�^(e��|���n4���L	��hL�K��0�dE���">�	�r����	��j�����'���_�����|*4��Ʊ��zx��Lz)�Ŏ�^�����&�5wh���_����[\t�z3��Ag���t��I��+��feףQ��H���O��Xc%D�¶�b��cMn�TY�!��C3��]1��1:-�gi��Sy���:�~&m$���e$��X�j�0C���LM����F�Ö�W��k�Ų�B�@��      �      x�M���ʒm��|G�� hJxފQ�����J���X#3r�$��A�����	<d�GI�'�@>�m�S]OH1e��di:��D�a"�2��U��C����W=,AQ&c���D�Ƞ~
T�����z����y��m����5��j1<� Av�à�]ZL����a�U�@l�؈R�.j��I���@�j�L��B�N���ûuRh	=�e��(��I�0�C�ۉu�1-���_�8�uK����a��+.R;V/,gô7`e"9�=�K��8���z�5&�]�n$��`�-�Ki�Tl*f�M�Oq	ϛ}BnA�&(�}.��A�� ���0�C<N�����\շ����d���y�?�zp��82!��55^��I�����XH/},��h�a��8b-��IoX�r��=�l'�[S��ԑ㓜�2!h��ؖ���W��|J5]�;�v'ɀ����jP��RL�h��
�$�[xp�a� ):��f��F�"_�	��ng�e�+BG福�ѱJ�F�f�. ր�V2�[?�I�q�:ӷC�5�+r#�R���� �9�b~���P��g��
��l��lc��!R��+rC��u�����An�)����i�6��4�zKｵ%ɧqG�+$ϯȍՇ[:c�����g����b���}j��A����>	�ɳ��*|����� &Kq���5�dX��>�	_�gY���_F�I�n����o��}�n��b'˘S%�d�X�A�C���*!N��k<�Z�'�L���עG6!Qp��U��XB�"m]V�D����������v���V~+��j�FV9%>�$����\��W�:�
$t_+YC(��uI�_��܀%��q�Z�bGZ�2�?5�u9ŏ^�&a,�@@%3�W�F�ʤ��Ki�pY�fݐm�:��V�7�s�ס���1Y��D�7�Kf��K|��gp��5oR	(~g�,�9�cܧWu��F����B�ȍX$�X�M��,^h_��{� y��)��^�0�W��]�a��Gn�N`E���|_E .+�3-i*KgN��zyn:1.�-&6�����΍XU~<�G��GK]10��b��������c�аS�D?2"`���F�������z����mx^Zr�<�0�kF������� T�����F�R��ɅnxO�d�/�~�9�vB��\�P�wd9�u�h��Y�+r'Vm����KZÝ���Z�Z��Oܠ� ��O���&5 ��o���	r#v�J.v�^	�������R�<A�������ƇixH8�b3���w#6^+�U ��Lp��D��@��<�����R�a���[��s#�7|���F�\z_����1��N��O�N�9(1�b��"�۷��,\��	i�ٙ!��n����պ�5�)ao?�^pTN��ȍX��y�=��{��a��#��H��'2�L��V���f�WHr���܈-���H���s���s�6�����rg��~��ވş�#i�H �`�΅懽R�����|U�T�9y�Q�=u2�e��z��ǳ��d~;������@BLN͛yKK-�\�L��K,z#��[�U�^vHE{I�!j3�^`�"*����]������K�X9X����c���*�{��ն.D�� �ɡ �_��R��aCo�>]7�FǶd�#�GC`��ױi���ib���,���r�����e$�V������#D�h�S�F���`��QW}��x�J���s#6���K��ˋ���d�x���L�¡��>�!8A!�x��%1�oZ��(���ܟ���߄c��X���W�Y���O�V�idb�.C}W�݈���?�pϢ����:�W[j듵�F�	4��0���8pZ��[�F�Stz#�!y�}�EEagW#fs�O��=C�Ljd��R��Q|v#V⺵��x��Z��h��&=1�F��t��\�<�*לWv�o��n�f��J<��9�4�OL� �\�����_L�H��On/�G���;؍X;	���&��t���ȡb:^\��:���8����^�ݛ���F�*Đi;��bQH�:`O��W�`T�}N��/�����.3O��b7b� ��GzƧ�F_���T-�ˏ8|M5�T͆����[�L��~���'u����6z�q�j�+Y�{CIo�M��-�h�m���"���F�d��|�M7\�fXZ�e�}�d��5�@=�p�J���&�1D~�}��=� ZjV�XG�:=H�zԒ�����O�	s���  �߈>B���Xŉ+��ä��/���H�N����w��Z��R�����:~#V3|�J?8D�����	��\%ঢ�q	�+�J�7�4�>ٯ��7bg6��~�Ah��7@���+���S��ȒؠWI՟F���lu��߈��#k�f�ubR�����x�ơ�. �i҆m���~�r"}[~#6U?8��)����-�w-Nɧ)^��\Dzy���;����&j�������&��r�[3T��8E���}z'�2Vc���5���qF��)᏿"ۂ�vȲ�^D)��8遇;Y�M��\ԥ�C���2���	�W�#lE2�p�v%���F �����"�<>���ݾ�?��D��"h���QjY�����
';V�AO/y`U�����[��Z����~�C@Ev�;�o����"�K0�=���ׂ��pmY�C�H�E�[��C�j"&Y��p%��w��������&��(ʷ�>����1���C[7C�����s�\U|y���g�wNO����b�k����W���@h��`oO��"r�6�"�����E-`��*'�N�7�c��yt�\��s�.	2b��Y�!���#��z�Pf�����l~�$*`q�9�%�M����Vw�{��B
<�Q�}��M�h�K܈�ɥ����=�8��ֹ{G[��{����Ny���E,^7��7�7b�B��W�?���.�7�*C2~��M�9����g,oW�� #f�~G|#v���@p[){��n�:��r�O�E�}P= L_��},m|�JA�Dn�� ��B��t"[�# 3D���G�j���a�h� ��g�����q#V���������7o�\:|����ݗ��9�Hu!"6�xpW����7b	j �� ���Q�-h��:�dw��k#D~�mFx��[ɍء ��ﳐwL�Pǝ1���.�{E��0��G\d���+*+�����k"��b=���d?���e��'�`ܦo獀s�>0�r�w���7b�J�hg�z>[����?�'��4��c�h� G,	"Ѳ� �����{������ĥ�x{��]�:�.;<�B��Ծ#��MG��0�m�F��=��5)pr���=��rE*�w���� ��1�yΓ��yL������3��z��GEmgښ���<���O$���.�s��z���Ǎ���,�H��1��Q>�u��R��H.�=P���>[�9L������9�����\�0�<�	!����YEو�_F�ZC4�r���/ۍX&-��|=a,i��@@�=���M��t�/-�J�wT�I��Gd�yKc{�i�j�R��< ��s#�6��>w���Xܢ�-/��!�����z���VL�כ�,0w�3�Z����7\�T�]��;?����nɤ��M�,u��3*�ԭJZJB�(�aJ��O��/��X��Laı{AF�Ւ���86óV�=x��ڣ�����e0�_Mn� �������k�>��%�o�Zd�)c�.�,�Ƈ�bCd�o|���˽���ҹK���CQ���ִ�u~�-��嘠�x �DE�~+�k#R}���7+cZ�{�4�O��@-f!���d�j�41�BA_���ًP	��4L��=��Z� ���L2O:�5l��>#t5k���m�XX6���f'<=b
v�Z���!6t`p�����'�2�|v���lԍ�-�ы�{�0Y�W=����+a f  	�����Ef<�c��t�{���u�c6�:���/�P|@��Z�?2�� ុMWWRPd}�0u#�8�׋�h��������WO	m�(��!�v?��4��UW��:u#6�c�q�:DEj=	T`BOJ-�8�z�v�az����F8�{�F,B@��Y���B����a�X�z��l���vUテQ��ү=R7������I��sS�{O� #�6=�z`l��|�gC졼�?���S7bi����z!��`>���Vf!ZȦ�-c��ɲ����<Z(}\(�儺��,=���:�%�UO�y �A�9�`�j
`�0�m�W|'���W����������0|���c�a�[�_�V�!0NV�A��qrK/9H��-�x3J;fֵ�D����������]�k���+����6z]P(�u;�5�x��hW�3�bi�UC�y;�xK�׋��̃?�[. $������~���+c誘��Z�K'�*@��	:
m/h!���܆�q�'cF�J���sY+�����/q�(}]� �c���Y?�����ݠ[2 .@�s�]�$>����/����=X������8_�I"#�
�/+��k֚<5:^�L�����Ɖu���P�v�|j&+�A�`��]�_����]`Ȩ,�9V��œ�HK-`v�'Bsm��`�p�m��*��O�.rz�p�� E�M�t��G���l�nuWV���*�@����uP�]��k�m=�I%�G�q��^3j�L2��k�L�R��.B�2N�r���=#���!/����� =�4�ށb�^w�'���q�D�{��n�:����euOi8���b���B=���D�ʩٰ�������oG��nsDH��,��0&�#�'9i�f���
3�=aGd�E(����U�U��+���RA4(�<��pZ���aG�=�@���);0>I�d�r��q�.]K��?ᬥm���|�t�!�>J�O��d��h}���@����]�Ʈ%�X�'8?WB:��!\j��V�2�<"hT��)�{r7�M�I��rc�|�.,�^�.�}��Y�>����!?Q\TU0Zh�D$�S�~*�� �ZT��j�q`K<�_U哏D���;�GezK���C�8Z��������/��j���
\aZ}��j�Ve�!�i�\VAƒv������~���۴�G-1�.�6pMM���;DY�߉�uO|�N*̜u��v���4=���G;u(%�QTʀ��6U�l,�^����[�[R(ݙ��,٠�uz'��������dZEyc���}�6/av?�D�������E��xq����|���&��3#���&E!"�+k�{S�����������     