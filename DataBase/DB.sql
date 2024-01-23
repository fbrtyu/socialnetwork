PGDMP                       |            newdb    16.1    16.1 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    221   ?       �          0    16980    messagereadstate 
   TABLE DATA           M   COPY public.messagereadstate (id, messageid, userid, readstatus) FROM stdin;
    public          postgres    false    222   ?       �          0    16987    userinfo 
   TABLE DATA           [   COPY public.userinfo (id, firstname, lastname, bday, country, email, password) FROM stdin;
    public          postgres    false    225   <?       �          0    16983 	   usertoken 
   TABLE DATA           F   COPY public.usertoken (userid, hashtoken, createdate, id) FROM stdin;
    public          postgres    false    223   w@       �           0    0    message_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.message_id_seq', 112, true);
          public          postgres    false    220            �           0    0    userToken_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."userToken_id_seq"', 109, true);
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
       public          postgres    false    4680    219    225            �   %   x�3�442�4200�#NC.#Nc#Cd!#�=... ���      �   :   x�3�4B#C]0Bbrq�3���3�4é�(�K��9N9sNS�f��qqq �� O      �      x������ � �      �   B  x��Y�nE]���{D�ޏ������D����@�K6,���R a�B�qnu�S]��f6��'ќ{�TW��u��>�x9c���>3fj�G���;�܉<"/.P�-O�8�O��R���V�x1FUN������Z�U=A`~�����w�)kNQy�_��S���oК������;E�p�i
�;�����Zۏ}�`&�Oa��D�'뵭a �P�L M��+��u����U�씞��ܙ��C�&���������H8;ytn�ɻAb� p~q{�����-E�lG�B��,�1nrE�>~|l7%���~2y�^'[G��t)	k�R�� ��vW������rI�	��:I���.n�[�����tf�U���.)�@B�u*^�!K��UY!]b"#Э���Qz�-�������C�����N���Dm���HT�K�B�R�=�sV>Hu
��*�(�|A�,�`�ZЄ$)8�UW+t�*˥��B��A[cE�D����D�p�Yz�,��)�e�SDz(.S<H�ty
�L���Kɘ�)���03[�%����~�@k3$�z��I��5�ɦ!O6�*�|}u}}��n��d�P� ?FI��(q>�*H���vA��|w5�*Hfz
��@/_�TAr.EU]��'�$�"�F�B�l��O���ؒ}��0o��w�U䎭-��dX* �k�v�����*�� �έ��T�*��#�b�(�1��ZX���Q�Ä��s�Z�$~[/$�X�}A3-Ray������z�Xd�������u^��]�HZ�u�RSz�ܐ�%[�K�Knꐛ˛ח�U��sP�ӱ�M8@W*�#t�:K�[d�t���{t�2�)�+=}ݨ$�1�b�/c:ϐ-�LW� =�J�,�M��8@ߪTd:��d��{h�R��m�ȳ�5�g#�^�u�Fi�z�ʢ�2����;@���+��앾��@�����z�iUˢ��jYa?@�U��5bj�V)����ʢ+��Js���w�����������7��*3[:,���~��Y�YV\bཐG_�%�\e���@aq��w�g#��
MQK��=dۥ
[��@ZGҘ�F�	�e�
�&�a�a�@g�\c��f����|�����H!��*�l����m� \��%��"ud[�����/����
+)I��6�^�@���A�H)0���K��C�F�c�]X0BķG�(�`�D|w��2�Ճ#D|�G� 6Y�H;��^�Y�xa���:Q�A�G��Ҹ�P����L��NjO�w��=���Y�BN~z�*:��N�$���Y��Um�4�=�5l�G�&.��N�FHZi��o�� ̪���J!�m�A����|��y�s����ߝ�#: ��W�
uV$���)��0�h9XO	��22�f�E�`n 4�'��5�=�1)?�1��Y�ѯ�=��I)gG:��OH�~x0���z=�C�z�c~ؿ��d|�ǀ��,u��>�w(�i�4l�>B_�����W_�}nG�PA�f�A+,�(���Xqv����	Gg�X�c� >/%ZV�Ķ�#��Z)��� q      �      x������ � �      �      x������ � �      �   +  x����N�@��3���igz1�jZn� Z�a�b��i�^(e��|���n4���L	��hL�K��0�dE���">�	�r����	��j�����'���_�����|*4��Ʊ��zx��Lz)�Ŏ�^�����&�5wh���_����[\t�z3��Ag���t��I��+��feףQ��H���O��Xc%D�¶�b��cMn�TY�!��C3��]1��1:-�gi��Sy���:�~&m$���e$��X�j�0C���LM����F�Ö�W��k�Ų�B�@��      �      x�M�Ƕ�H��q�s�BC	��'x�=Owi����"����� � �?����(J��c�%�m{��	)�L4��,M�~ב@�1L�S�A�����7��'7�zX��D��\��Ġ~
T����Kz����y��m����?ȟ���y�� ;ˡQ�.-�|][���*��x&jlD)8�M�$�2�?9]�����,�~8�N
-�<��w��:�O���vb�gL�r�'���W �1nIX�ӌ�x�Ej���l�&V&�sݓ�AY����'c���F¾������L�����t~�Kx��RK�7�C��s�O�'�$�C��8���Ʌ�����ʓ�f���p��MK���8z��d<�d�/''�3᱐^�XN�ւ���q�Z	�ްv�,��{P�,Lڷ�䟌�SG�O��K��=��/`[Z64l~�e�r��0�i�9�$�J
��x�j���E{�.�����6`����cm�A�m�+�M���v�_cП*��nZF�*9L#H�U[؀X�[�o�XH'��=�Le��5�r��T���� �9�b���N�H�3�P��c6Sd���}S)���QE1w�w�s;�m����je��M�ȐFU�(�-�>�;�uX!y~CnVn�m�_&���
��^������Kc�z���E<�<�V�֣O/�,�U^ۘ�a�v�Z&|�Z�a$��VS+6
�E~�i�:�b�/�N�0�JT�4��������U|�X�xj�D/����&7�E�LB��F���	��Eں��	��i<33&��9���>�ͫ9mX�O�a&�@.���ɚZl}B��)�m\�d�ć�E��>�,9�����73R�0�y���$�1�>z�cL����ApL�3��0 �!7�+�J'��f�iTC���T�3�;Z5�(�8�C�y�c�@�~w0rKf�ы\��gp��=ob	(~g��9�cܧwup4�F����B�o�M,{��$FXo�/�ݽ|���u��qr/�ҫMs.�0�ٿ쑛�	���k7��e�Zb�DMe(��	?_/�M'��y�ń�Cp�~_�&V���f��>�]^1J`S8nH��1�hX�)^���>�M��������6�и�KK��fz�h���_�~��J �A�� ��]
�<����E^�$�د=K�NH6�+=j��,Ǵn�V9�}C�b��z�	��5ܙ���U��j��*�^���mRBa@����N����Y���JX6��ȔZ��꧵E�6>L�C�٨u����=�nb������7{@�@i=����C;{� �
��Y�c+�����r�/�|�(���K�k88�Ҧ3�IV�IЉ-��S�Ęh����[�M,W'�C|�Bvf�i0��m��k�n{��J��/����1�r����G�Ky�\o��TT�w�D���5ݪ9��:���
Q�߿!7�U`S�Oc�%��} ���l��q*��큼�!�w�!��wuЛX��=�6�x0
�`]h~��3�^���Q���ꚊK"�<���N�3�M��:���f(�e's��w*=VH��gռ����!ё�}���|Ţ7���B�"��C������6���o��A!p�OK���gQq"��~'�&V
��>��ꨦ
-��օ^39�|����X*���/6�&���5:�%�)U���^Ǧ1Wc�]	Џ�#8���˩�o�Eob��= [!&�2�c�T���O������f>G]�ɒ���)m��:7���\]�e�./꒓fB���G3��Vn�Z�����x�Z�����M�cxr�5����^&����
�}�ү�3@E�~�M#��u���I���������,�i�\���xձ��>Y;�`��@�������5�nb_���Ik5�/(
3��0��~���"�`R#�"����;�a7�"ۭ%���'�2� FS6�t�|���Պs��`�\sNY��Ͼ�v�%*r�r��h�?90���}����~��"n+7�=�# �����nb)�$��3�FQ�f�#�
�x�0�t|�O����z�w2�[��ؕ�!�v��͠�Ru��:
���Q>�Qu�8��Ufߓ���<���nb� ��Gzڧ�F_���T-�ˏ8\M5�T͆����[MO��~;v�3u���-=���|5���ӽy���M��)�h�m���"��-�M�d��t�M7l�fXZ�e�}�d��5�@=B��J���&�1�D~��~۽� ZjV�XG�:=Hy�zԢ������
�'YF�j����ob��7?3Vq�
��0���(2*Ҳ�kmt]��YK�Y��og�ob5����C4�m�ά�����V<n**�0���xcN���v6�&vf*�W	��h�2���\9�+��Y���,�z�X�\`�,�V�݀�M��i�XS4����l��n?�&%�����~��.�K��=2��T����צx�{��@ڵ8%_n�xxfRUx���Kr^�����q����/TCt�T��Iv�P	���"z�����X���#�

���M	�	����U�!ˆ���R��'pRw�"������/���ť��&�L����>���Ŗ� DG�����p��g`:v��~ft��"����N�֐e�y���p�c����������"�x�o��:�'d�S�!��5䥘�P�t�A�C��+y/�h�� ז^8�{���&񐦚��Cy?\	 �]"�;>;\7�	�h�r�����KL B������r�>j��4W_^(��Y�]�S��>ٶ��'+�7��zN�7��n���τ
"r�6�"�����E-`�*'ʎ��v��V���smh/ygy]�%��u�|/|���'D��~�Pf��������$*`a�Y�E�M����Vw��yb!�(�>�z���j��7�:�;=�!$|� 7�%�u��h�}/���)O� z����ƹ����M�X�;�J�3� 0���,é2$�I姐L�>|��v�H2��w�ob�z�����` r�����|B.���`��4�ci�|*�rx�
5p20�l�� ��(ncm���e����P�b��w��X<"���O��=l�2g�l:|���9ݗ��Y�Hu>"6�x�W��շ=>nb��@`� ���㢰fԔy�ܒ ^P'��pwm���ȯ���\~��&v(����,�S/�q�ͪ�dA����� &L���|��3+�����k"��b=���h?���%���`��##���f�B��n��Ml�>S�<��^��n����E�9� �A%<�K�H�,:H���<nbi}�^�3E<a)5�޵s��I�u��skߑAԦ#�C���M��=Ğ41pr���=��rE*�w���� ��1�������<�ߦ��M�g,0�	�����δ5�~.�y0�_H`9�]�H�����7��Y�W�-c���t���/����\�)2z�V%a}��k���7�6T�i�/o��b���L��@�T�*�Fp�2z�2��_��:~�����i����cI��Z��5m���s~i9T
���H��\="��w��T06�������s��`;xn��f���N�^"�[��#��%�w�!obcܟWo��lU�T��f!��G���$&�X�g�p�<s�zJ��r�{�-�TU�@���`�y������u�W�)"E���S���|�X�&�.�!Sha�ސ�n���C+����Y+��?[{T4<�k[3���m*�_��2��*�Z�σ%q���r���!���az����FM�Ĳr5|\*wI��Un(��B���5-b��z��z9&�( �)�@ѷ�'����>NÛ�6-@�:���q���ga�B�q��YM�&~B��<�/6�&6{*�>g�%�'�\��3X�H�E�����v�g��fM܁Z�GyK��s+kv��ӣ!�`ת�!|R`CG\��K�*��g�|;��&v���t�"�d&+�g�_sJ��z%,���x� H  �ȌGj��띮}w��&�f̦�FB�]����T+�G�|��!�s ��j�'Y�a�y[����(��ʹ����VO	m螎�CH�~�e�i�9��|��lϛ�D����
���DP�	=E�j�ϒ�C��#�ӫ�e�7¡��7�q^8ndM��J�`��c������t �U�
FIK���y��2�Ipxnjv�i`����GY��{�+�l�=�������7��Y\�Q���z0���sB+�-dS̖���ɲ����<Z(u\(�u�MYz6N9��u�E�U��9 �@�9�`�j
`�Џm�W|'���[؛X����������0|�7��c�a�[�[�V��!0N	V�A ��ur�
�R6�& n[(r$f�vL�k'D�T˯������]�k���v�����uA	�������H�ޣ]!����(F��쀻�-m�o�������@4���5������)�@UŤ��b_:�U"�t�=����׼ߔ��k��ɘї���\��hj���[X����.�t��2W
�ˬ�<&��ݠ�d \�H�|��I|Z���]��9D�{�(���g��p�DF����ܮ_����q�h�G�G֏0N��l�����S3Yj�`��������v�]D ���*/�'���Z��/�b�0FC�&��h�0iU �ߔ\����8+>@��c���H���W���ꮬ�S�U��[��uP�}�[�ն�|N*�=ʏ�u���Q#��96�y2JՎ�����8��=:|�w��?o�� yi�Hx��o��񥥹(�My�ٞ,J�[����?��������� 5�     