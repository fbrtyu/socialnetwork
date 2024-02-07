PGDMP                      |            newdb    16.1    16.1 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16951    newdb    DATABASE     y   CREATE DATABASE newdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE newdb;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    16962    chat    TABLE     �   CREATE TABLE public.chat (
    id bigint NOT NULL,
    chatname character varying(255) NOT NULL,
    createdate date NOT NULL,
    usercreaterid bigint NOT NULL
);
    DROP TABLE public.chat;
       public         heap    postgres    false    5            �            1259    16965    chatuserinfo    TABLE     �   CREATE TABLE public.chatuserinfo (
    id bigint NOT NULL,
    userid bigint NOT NULL,
    chatid bigint NOT NULL,
    entrydate date NOT NULL,
    exitedate date NOT NULL
);
     DROP TABLE public.chatuserinfo;
       public         heap    postgres    false    5            �            1259    16968    file    TABLE     �   CREATE TABLE public.file (
    id bigint NOT NULL,
    useruploaderid bigint NOT NULL,
    uploaddate date NOT NULL,
    size bigint NOT NULL,
    type character varying(15) NOT NULL
);
    DROP TABLE public.file;
       public         heap    postgres    false    5            �            1259    16971    message    TABLE       CREATE TABLE public.message (
    id bigint NOT NULL,
    chatid bigint NOT NULL,
    usersenderid bigint NOT NULL,
    createdate timestamp with time zone NOT NULL,
    updatedate timestamp with time zone NOT NULL,
    text character varying(1000) NOT NULL
);
    DROP TABLE public.message;
       public         heap    postgres    false    5            �            1259    16976    message_id_seq    SEQUENCE     �   ALTER TABLE public.message ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219    5            �            1259    16977    messagefile    TABLE     w   CREATE TABLE public.messagefile (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    fileid bigint NOT NULL
);
    DROP TABLE public.messagefile;
       public         heap    postgres    false    5            �            1259    16980    messagereadstate    TABLE     �   CREATE TABLE public.messagereadstate (
    id bigint NOT NULL,
    messageid bigint NOT NULL,
    userid bigint NOT NULL,
    readstatus boolean NOT NULL
);
 $   DROP TABLE public.messagereadstate;
       public         heap    postgres    false    5            �            1259    16983 	   usertoken    TABLE     �   CREATE TABLE public.usertoken (
    userid bigint NOT NULL,
    hashtoken character varying(256) NOT NULL,
    createdate timestamp with time zone,
    id bigint NOT NULL
);
    DROP TABLE public.usertoken;
       public         heap    postgres    false    5            �            1259    16986    userToken_id_seq    SEQUENCE     �   ALTER TABLE public.usertoken ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."userToken_id_seq"
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    223            �            1259    16987    userinfo    TABLE       CREATE TABLE public.userinfo (
    id bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(100),
    bday date,
    country character varying(150),
    email character varying(256) NOT NULL,
    password character varying(64) NOT NULL
);
    DROP TABLE public.userinfo;
       public         heap    postgres    false    5            �            1259    16992    userinfo_id_seq    SEQUENCE     �   ALTER TABLE public.userinfo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.userinfo_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    225            �          0    16962    chat 
   TABLE DATA           G   COPY public.chat (id, chatname, createdate, usercreaterid) FROM stdin;
    public          postgres    false    216   #8       �          0    16965    chatuserinfo 
   TABLE DATA           P   COPY public.chatuserinfo (id, userid, chatid, entrydate, exitedate) FROM stdin;
    public          postgres    false    217   X8       �          0    16968    file 
   TABLE DATA           J   COPY public.file (id, useruploaderid, uploaddate, size, type) FROM stdin;
    public          postgres    false    218   �8       �          0    16971    message 
   TABLE DATA           Y   COPY public.message (id, chatid, usersenderid, createdate, updatedate, text) FROM stdin;
    public          postgres    false    219   �8       �          0    16977    messagefile 
   TABLE DATA           <   COPY public.messagefile (id, messageid, fileid) FROM stdin;
    public          postgres    false    221   �I       �          0    16980    messagereadstate 
   TABLE DATA           M   COPY public.messagereadstate (id, messageid, userid, readstatus) FROM stdin;
    public          postgres    false    222   J       �          0    16987    userinfo 
   TABLE DATA           [   COPY public.userinfo (id, firstname, lastname, bday, country, email, password) FROM stdin;
    public          postgres    false    225   +J       �          0    16983 	   usertoken 
   TABLE DATA           F   COPY public.usertoken (userid, hashtoken, createdate, id) FROM stdin;
    public          postgres    false    223   fK       �           0    0    message_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.message_id_seq', 331, true);
          public          postgres    false    220            �           0    0    userToken_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."userToken_id_seq"', 159, true);
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
       public          postgres    false    4680    219    225            �   %   x�3�442�4200�#NC.#Nc#Cd!#�=... ���      �   :   x�3�4B#C]0Bbrq�3���3�4é�(�K��9N9sNS�f��qqq �� O      �      x������ � �      �      x�Ŝˎd7r��s�����d��g0�Ѹ�Ր�1��=�N��;/���^Ѐf��
Yo�?ȼ�jQge���""y�`0xK�3������8N��'Gx�����_�^�E>���J��9B/�F�-�B�9��W襔��
���^�����{k�0p�t�����7�m�x�������k,}|���t�o��9�K�����o���9լ��Z�����k�E�jE�N)�\�]�JY�n��tx|�~��(�������ŝ�l�?�v�(^��Q�b���7bB�{1��)�r�W&4���޼�l�^���Sr"���FB��Y�2��+Q��9���,�����RسkچBI^�OĄs(�^"1���o�߼}~����3�O>��3;3z���xo��fBw�����*�*��@F��\10#'��7n!{M�Z�#DQw��{bO��-8��J�{����(l�3�x:�~���$m!0�*�s#�3*�l!2�03��n!����)��Z�(Bf<ʺ7G�Au����P�`��ᨑ;��"��y����*{�����r!Ff�F��#}9ŊpFZeA���"sL	���� �̞l1� �0GR����hp���#V�]�Ldn�ɥ�1?_��}������E檱�"�11#3��y}o��ll�wI�,���[��"��tHOϑt�}��[d�+Rm�၁��-2��ƍ�H�,�R'��l��������3�[�ۺ���aB�B�ɺk�!)T��a��u�!�v�L��hKqMP�2�ﭚ*�hK���	�
(}f�}�`�wpq�7�Ӓ$���z��h�#�����T��X�xa���/�d��2|ﭱ��H�![��R>�y�D����_~��-;���Ty����u��	�+�rx��Ҙ/��6dB�H���=����2u�ғa;�)u!��;�]���-��.��D��i˕��~ja?��-7����<�]Bz9X�\b�7�/�B�HȬ���A�:^�di/��A��r�G�7�ۨV�V	�͙�^�w[��5dZ�6Mg���[�.�$v�����������������ǗoϿ݊qK����\#h���m�D�!ߋE��F�J���yӬ��j"␂�d�4��-R��V���ڪ����#YG&��3LcV�z'<Lt���//2e/��K��n��"�5I�FP7�4d0���_��Axm��"�����ri$k{/�������jRJ1%y۞X--H,���VM �ғ���uF�O[;�>���d ��{����GY����HL>���8:��9LgYI_��~��-$��d3�v����HX��h�c����J��3�󇭙9��m�UΌ�o?[����)�U��f$�&ϼ�����g}w��R����G���i>=�|w�5�,`h#S�fګ��x������������域�'Y ����/X7I��p�|%-���>pY%p�Ȳ�Y���\������������H�Zf-G#ٽ@�Y�L���dm�?$�vH!_�f�O�����˷0��)b��M��\���=Rx+3i����ǿ�꛿y�+ر��e�@j�{V�R8�Q@O_0��@ۦ^ּ1
do�F� }�Jt!�D�L�5��W~���$d�]�^Z����?�ۑ��L#��l���ԑNy$ځ��h��9��(��zn�dYչ�-���V,j�Jl�:0�:����EU���%������^eC(���BjsA���6�e�V�i-�}C���1b�=�*f����OW!�:���wtz�*���"x�O��n45^Z���O](2�{��r��0ׄ,:hQ	�E�"�c'�V3��]&��7R��S9�E�]�H`�)+���厮[NoE�ЗVX�X����~�Ucq�	���wo"u�ě���"7ܞ��/H����Gڲ3���@���=C����W���8����3^0����Rh�Ă�뭨!֫*�~6�����nR�����C�%��� �g��p�?�@�����.q&Ff#ɬ(��=�kč,b���y�P� X��aNy9 �I�\�d�<01)�OtG����L�c"}lAS�7������Y��jD�>�$�H�(��Eo@�,�L%�>7��.z�&��_X#��:�鍨!�����1#�gC<�0f�ȚxF�2�
KA�Z�^���V�l�OUj�3B$Nl�!�bF�4�����R�Ud-M�`�u���ŭ�Q�	��e6�˲5B����� G�2�ES���jeF��ɺLݶ���`3��� L�, ��#����e��0�2�,{I,�Έ>�u��'a�	�1��+�m�!�d3%S*���֜�uY}�$���B�̳�J����������=g����MYse�1#�w&k�����شO!9��跽dk��L�{]�P��\����u�.0F��w�X�����$$�*g������	�]�(�əB�_L`i}]�쮚GPS�b�m�k��S�.)ԏr�bc�˻�I�B�a��`�EJk�g�� �FX5ɨ�:�E㤯`!��а`Ӏ.��mj����4`��ڠ���3��S:m0�A����,F�'0�m<l2UB5��=���M��9g\��۹}B%+����z��&�\��ЂDߦ�J=h��BrT��C(!h�Y����S��<��	A�N����}hEЧ�׷_��/�����B1�S��>��&�7�ءE�!zg��C"^��}�"���������07;�k}�1K5y���P�>kJ�	�� �g�Q,�l�+���Я���،J!�gcQ�"��B(��BH;d������U��B�-�*��;6�>L�d��� B�n�H��$w*���d�ax�2^ƽ�.0�Τ���y����[P�>���D\!�g q�l�Z�� ;�prG"Ђ�����,/���3�+<�DN"-+.&���)��.�!y�c]J_ѰHv^�����fV�{5�H#4��us*�H�E�oQ���_�I%4B>��ċ��%�-�Q7`\Q�������<�	�C-E+`"�t��1d���hG&^�d�\{�F�oR!��v^�Q�Zy}�f�EI�����1�Y:l�C�"�~}Ѧ��5 V{&�7��5���l��
\а�<��c=E�AEzf,�H���hXP.�.�6e�MEC�~�͛��{޼��H����6�Q7�0�9�c��[4.zfat,�ܹ��n�M���9n��6��Wk�rHc\�&�����2�kj���j#?��I5��]mf�
o��,�9��};Z[$�j�N�~,�L��'�ͧ�'��G�H��wn?b��w$���~b�8#�\_��'��O�B���~b��^BL��f���g!V3}�}rb�����/>U���XO�$0-H�Mt��=?ҿ!����U�W�-�S>���ו�l�"$	�y`_�c�%��}��HR;H\��3=�w�-�Q]_�b=T���E���"��Ri�E��C��P��Ȃ�8�Y�Xry�hX`�P9Ds â��yc���c59�a�y#Ē���?�X�J�qA�c�Q�G�~S��O.hX`>%-�i̙�g`)R���nhX`)be�$,�$��	撲Z��qwt3���e��8�L�)Xt���d�z7�*��K�	��Aߛ�	%�3f��3O�}�B_'��M�$܄��8W��f9bI��3��@}0���$�ld��b�����/������hX`Q�L$�,B(����f$�p��a�c '�lA�	�^�U�G���3�F99����>��"Tw�&+%��0����	�Lb謕ͺ$�4�D(FV�3%����D�U�D�x�����z潱,wA��l0o��K9�B����:�?&/:2.hX`��r`JBZbAR(���7,hX`QQ�Q��O,O�"�\D�fU΢a�yd�I���D����c}Ǎ �[�Ex�Zذ��A�CF�ޘVT(Aߎ�]HNqژ�Pނ����ddX	>]_?��4���~C���P�I���ۈ�d�]%��B}   Q2��yr}VQ�i~��K�[,C0���a'-
u'�M�|aT��[2�)$��	墐�"Q!ѷn؅�ޙn��m@BÃ�E������*���l'VH��:��{-�)G�,]���(�[P�,���}X�x��<�
���gKz�ː�o_�=�x�����W0�rūx�j O-���7/�=�5��^�����xYt���w0Qx��,�j�F�~��Tf'���(�Ό��s�p��4�<Q�52���_��eC�C�ߏ�r�0��E}�\n��bm��jE�t�o���˙�      �      x������ � �      �      x������ � �      �   +  x����N�@��3���igz1�jZn� Z�a�b��i�^(e��|���n4���L	��hL�K��0�dE���">�	�r����	��j�����'���_�����|*4��Ʊ��zx��Lz)�Ŏ�^�����&�5wh���_����[\t�z3��Ag���t��I��+��feףQ��H���O��Xc%D�¶�b��cMn�TY�!��C3��]1��1:-�gi��Sy���:�~&m$���e$��X�j�0C���LM����F�Ö�W��k�Ų�B�@��      �      x�M�G�ڒD����� h"<�𰪃��k��'ݪ� ��I��������E�x�oұ
WԶ=����R.�j��s
��H"�&�)� ��������8�y���2�HaJ�#�z)PkX��3W���s�g��?��j 5����Aٙ6�� ��b�ӵu��rDF��B�BpP�02�W��������������I�%̀�qϣ�}N"�!>�o'��cZ���_�x�sJ������-ޤv�nX���i��$r�{2�#(�q<�����jLr���HX� M�9S��ؽ7�Oq	ם=BiYQu'o(�}.�� �j��a�������є���am��<��Lx��N=8i�:21�n������ɓ耙t[H7�-��j��ʟ㈵<&���ճ�F��d�4iߚ�5(��l��m�Ak�wO¶�lX���e�
)�tM����>�$�J	�ՠ.5��fѨ�3Y�������~�dh�G�����^E�	"w������W��Q7-�m��$�xͪ-|@��Эd��^,�ӳ�]�L6�д�ȅTJ���4��ȉ��,�䁊�\��0z�F��v�w"�� �"TQ�Y�����F�r�6:Z��hS�Hc����[K�=���a�����zsJ{l���3u�aL��A1�B��7w���9�� i���,��
_`=���&SuT��C~����˄/J+p��j��W�ˍ
n�����/�
��/�NQ0�J��1hR5A��7V�qb|�>�%�yvj�_M.�8r	����&�2�*���M�O�H�ᙑq�g�yc,��$^��ՆUNI7#Iry8(�����'��
��&�j�jA��.����$`ɩ��--�s#�Js��ڧ&��!��땎qa�J
�1T2a@|E.Įl��9�X>��Lc�MW����Ѫq�G�:����&ti�{���dƼzY�@p�;���&���u����3:�}�W������ｗT�����.��WXw�/��y{6 ���R��������d��pP����;�u���]�B-13�����	/_߮�N���x�IM�����΅اr��0ۏ�z����6Uf��h�gl@�z@�-y�+�ߓ\�}�� ���
6=�q跖��݌�=��n^�xA^ O�M�Zr!v),��C�\�|C��`��<Q�!Xb��,��;�ӺA�S����l�74!㻼�;��Z�Z��i��A�?��A�M���F���/'ȅ؁*��z5,��r�ֹ��oMU��w��E��U�@!5C��|b����g��n{@��h=����C;�7�EP*b�Y�4�R���\�^�b�Qh������`k��P'Y�'A'�����1�B��[�X�Nԃ�4��̐��m/m#.<T]�u�k�W�ޢ�^����1_��.�~�F�T)���@�D@e�xgMd�Zӭ�-��f�[�J}��\�-���H�D�=��I%�}������ro�l��~��^��i어I$�Q0x�@��Z����ט�����O"�<�2Z'�_����v}��%�Î�\콝I��b���;���`#%:28T�h˗X�B�7�w��!��&�O�F:���NT0(���i	��H� �w���J�ض���m<�g���A�W�|#��L� �ظ��ߖJ*��z!�v��=ږ��.�8�m}�ƽ+ �BJ�~|߂���0�*�z,z!vE���B3c�0vI�x�+)z;X�?�O�|�NAm���\����qty~�u�&�.9Y.�x4���h��:'(F� �բ&/��.��Jh�9��$��a���+���ҵ?@E���S��+���uX��$؅������,�i��e�xձ�6���i�'� ���ٌ����5�.�Ғݿ2R�j�7ORUnv42`a.׽���3Dn��^��?ފo`�.��|��<O~�e���h�ѕ�mT^NW3�ŷ����m^��؅�,�PY��3�F��Ɇ�������ޞ֝y[���E�|�v!��Nl��0�	5�9򨔎o���ڝ�;���n�^�݃���B�*Ɛa��~�PH�:`Om��{�`T�}v���'��IͿ�<��]�u �6�Y�Q}�V���"����j�U�K�l�����+��ٰ��ԑg�o��Ջ����\�:�J~PN*�\�0�F���,2�_a/�N�h*���_���h�h��l�U��#,_�d)�N��f��O��w��-�R�����:�ձ�A*�歖U�c���xU�7�s�V���-,~!�ż�d���U����3o�@�1���(<�k��l��$��p]���u6�B����*�mp�&�L؞�Di?�J��	�%̬d*�3�Cs_g�/��\����-� {;W�J����c Kb�n%W�F�ai6���/�*pؑ/k�f�tbz&���g���PyL�yÏ���E?b%��-��>}��y���M��(��$�D�[�g�T��n�.����p���'����B�g�nӓ�s�_3T��8E���=f'�2~��ёkT㌈_S�oE66����&�F|x���'p2� w�*�����˴M������	�W�#lE2�p�vd���F �����A�8��A�j��'�?~�(�W��8J�!�ԧ+��X�3�q���O	��'�:i��{�û�}�+�K�ԩ7�x<�k(*1!QP�t�A�M{C�侠��\�f�ơ_$�"��&񐦚��Cy?�@�D�w|��nn��Y�7�}��@��P���������B��i
�O|�Q`ѳ»g�����b�k�����W�q�@lT��`wO��	"r�6�"�d��m�AM`��*'�N�7�c�ӹu�\�4���.�
b�躋Y�1��֕"�q�q(3��U�u6�p�4�<��	Y߻&��]��\1��[�~��G���g��%.���0�D�CHx.n�C�׹{D[�y{����Nyj��N,n7��7�b�B�W�O,`h����ꐌ>�>()'��~x����"}����#���oZ$��T��t��h�:��r�O�A�}x� ��!M�Mm|�j��D.�� �����|"[�# ;D,�[��M����0��!��Z!&��{\���#r���7X�æ���O_ȈOw_־��#�ňؤ�ƿ�m���x�KP�=��9��C��-	��s��^ή�lP��l3�%�ߓ\�
b/�>�Ћ縳F�X������� &Lu��ؤ��ʊ�-��ך(�'�X�a�([�>�sE�F���ߴ�a?p��f�B��n}��Bl�P)K��i�e���#��=g�#�D�8bII��������B,��!�YS)�JK�	֮��uSvxԅ�gjߑA֦#��!~�s!��nrOH�ع�f�`F�"��ۍET�� ��~)E�l���yL��t���}-0�	t����ʴ5c>��b���!�����r;G&���-�]����͈�*N��WH�y��^�j�#��S����H+�2�0��O�
*�4�ooz��ȧ�	!���ɛE�H�WF�ZC4�r�����B,��]n�iK�>�|�.ཧM��t��Z��g?�$wl�<"�{w�K*�����a�Ʊ�(�K�M�<7ro3��s;Z�2����!��&�7�bcܛWw�٪��~�� ��:��{�Ab����\sT�)ų"�/�ܒIU�7��
�8�LW:*���J^UJF�(�aJ���_e�K,y!�*�!SYi���+��j�˛VP��Y��<>W{T�x�m��W�K*������<�Jx/��I\�Ʃ%���e�Ő��x3�Cj��^_�&/��j�&wH����PT��j+�5-b�~�e|�t7 �K$P���$b-D�N��fexL��j��b��[��u��YM~S##􅍼�݉'�f�%|L���%�g���,̈́����v�?B�fM��Y�-��+��g*kv��ӣ!�`ת�&|R`CG��Ko*��g�J��F]��bq0l�Ⱥ����gE\sFy�   �J���;񺻑�̘ǟ�N׾���[67f��"�ͯn~^��R���0`��:�b��݀��0L]�-��~�LF�>�\XQYau��"���MBj��.OC̹�*�_g�.�&J�4�P@��ʭ+�*L�)B=��E�4o��v!�n--��6�Ş������F�d�qPn=����B��Y��d	:���FIK��H]<vBl>B�V"	���]�^�D��2���J=b��~�ܞ�� �)������i��Zمh!�ᶌ�;�ƪ��y4Q�x�ė�
��l�r��u|�"�?]� P ux���e�)��goۨ��N<����byj���FcM�a��;��m�a�[LX��SD��u*�$@*�'�TpW��4 y�BY �Wi��vR�(�����>u)ҵw�X����Ρ�6���%�[��P#�+��v�\0��p����+��6�;Y����% �Ň�8^�x�=c���ԹZ��N
U��'tھ��5��r���^3J�����\9��j�r��7�/��! ��;�e֏�1&��tI���\l4�O�߄7oj6Q��,�i��Y�����I"#Ҋʟ��e���&O_�����H��Ɖs܁�P���|j&3�A�`���
����.�7(�"}N��`qe'�R���F�c4-�]�e^��@�r9�d8�J���-�;m���H��'W�[ݕp���l �zh�:<�<��k�m=��Id��w���3�J�d���5O&B����\���:��9:|�sF��7�R��4B�F��]D�Lki.?�b��lO5��-�z	�ⷣ�.�ڞ�����hy8��S���w��G�i �d�O6\鶴�t��{#�b�9"&#=��sڬ����v/����Yʚ�#2�"�������_��ds��Wo�0��hu�Qc/$P�8�9C��GRٶ<�[�����%��~8ki�hE~�>��D�GI|���<��� �����vM�ƢOp�WB>��&��M��Z�+}D�8<!����]~�M�I�ra�|�..�^��a_��E�d�tj
����	Fk ����|t��O��T�Js��!6lJ� ��S�󑨖{��.@o>�~�P;�����.�pʊq�vs	�̶�,p��f���Yܬ�8ĠOk7�
2�����]\�'�so��o��N�(L��5�j:D�!"*��H����=�0����U�P֧�AC��@ԡ� ��E��ahS�ͯ��~�D�F�rI
�3�9ޕ%4.�N�������l�O�U�[1��~8�؂�%̎����5��0p��y��By0y��)����M�����a�AQ������v�0ra���I�Q�ᵞ��'x�k
<�a,Õr��q��{^K�1���u�V�l�Ո݂O�?ԇ�X,�֖�c"�x�}��B���Ѩ��� _�ESc���IE��k[�J|jK�g��>1�#�Fz��Oh!��m��W��2��IJHn����H�P
c����xnS�}hB��o�|~&D^��_���K^�|B\@� r2:���x�ד�i$a� z�c�~[������Ou/�V��$��\w��d��9�� 11V2�s�{�qL��t�} ���<��H����׶�<��
f	U��T�L?C>�L쬖>~�{]���T䮧ʄ� �Ã����/`�;R�"C�)��Ha�3z�?�C.�[����9���(q����Z�Ύ���uNlA�*��-^��N��^Wb1����QQ�w�!�S/�1�vu%������{�@�N�yQN�׋%�_u���Ѱg�� �Ya�Vj>/�i�R�z�x�+���r�����l/>$�uץXgH̰�g��{7�t$?���p���8_62�	d��Oq��W��.踾S�����)�\5u/ ����m�W�	V1i��X�āms#Jן�%�r��w�N�X~{U��E9=ju~�C�`���w���bў��q:��{a� ��gB�R5�>�:���O��1vF�.�8Ui��Oj������v��)
�'����@��`	�q��}o��8��u�
�4��8����^�}�&i86�-�?TT?>wp�(�����  !�'l43]�����:.�v#��nS�9h�zj�c�4�R��(}jL�V:ղ���0��i�S����Yr���>hl�Tf��5��p�i{K�����TF�%��>}]�mP�yp1A����Dء�V"0�ɶ��i�R�����p�@T��׏��P�:4���0�A}�O�u7�Q�ϻ��q����В�e�w�6{�ϳ\�-g2[O�"��� �a0���b8 ,M7������{'Wl<���1'+���anb�]@I1`�r�=�~D�%*Hw$Qf��\d֍<ߑ�y'D�ܝϐ��C<�{��|fb�v��p��R��?������!i6���
I���#�"]6�����ЃS
2PY��K���~t]�=s��l}嬎�C�ʁ� �l��nS+�����3BP%r��raWI�)�7]cV)U����y7�z�A��E��e½KƭEA��{]�%x���.�S ���CS��ƮIm#�dA��γ?7�ן����w*|K��d��%������z�5uH^�ě����4��զ�6��r]��`'B�D��$8���X�6I�=Z��GѺ0�T�z@�/��>���ra���,MtŸRb �d׻�+۱&���q�h��Y
�7gs����(+=��9A�!��L�io�Q��4{O8��.x��\�}=} �{IG;���Ԟ�aͬh@͸F��R<i�r�{*����?Ǽ���χ��o�̀�e�d����i)���b|��Ϡ�as�faWɟ�\�nC.L�mV���jx5ϸ�_�T�au"Oϋ1�g��'�벌���GiCLk����QOg?�R y�Z�f��O�ͬmG��raW~����.�t8�9}{���<s�*�{6�jN���a���۾���]����yC��,-B�s~'��xTU���e�+-�c5wu3��ͬN6)*�?����?���ܑ     