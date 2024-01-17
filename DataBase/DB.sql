PGDMP  +                     |            postgres    16.1    16.1 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4837                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    16402    Chat    TABLE     �   CREATE TABLE public."Chat" (
    "ID" bigint NOT NULL,
    "Name" character varying(255) NOT NULL,
    "CreateDate" date NOT NULL,
    "UserCreaterId" bigint NOT NULL
);
    DROP TABLE public."Chat";
       public         heap    postgres    false    5            �            1259    16438    ChatUserInfo    TABLE     �   CREATE TABLE public."ChatUserInfo" (
    "ID" bigint NOT NULL,
    "UserID" bigint NOT NULL,
    "GroupID" bigint NOT NULL,
    "EntryDate" date NOT NULL,
    "ExiteDate" date NOT NULL
);
 "   DROP TABLE public."ChatUserInfo";
       public         heap    postgres    false    5            �            1259    16485    File    TABLE     �   CREATE TABLE public."File" (
    "ID" bigint NOT NULL,
    "UserUploaderID" bigint NOT NULL,
    "UploadDate" date NOT NULL,
    "Size" bigint NOT NULL,
    "Type" character varying(15) NOT NULL
);
    DROP TABLE public."File";
       public         heap    postgres    false    5            �            1259    16453    Message    TABLE     �   CREATE TABLE public."Message" (
    "ID" bigint NOT NULL,
    "GroupID" bigint NOT NULL,
    "UserSenderID" bigint NOT NULL,
    "CreateDate" date NOT NULL,
    "UpdateDate" date NOT NULL,
    "Text" character varying(1000) NOT NULL
);
    DROP TABLE public."Message";
       public         heap    postgres    false    5            �            1259    16495    MessageFile    TABLE        CREATE TABLE public."MessageFile" (
    "ID" bigint NOT NULL,
    "MessageID" bigint NOT NULL,
    "FileID" bigint NOT NULL
);
 !   DROP TABLE public."MessageFile";
       public         heap    postgres    false    5            �            1259    16470    MessageReadState    TABLE     �   CREATE TABLE public."MessageReadState" (
    "ID" bigint NOT NULL,
    "MessageID" bigint NOT NULL,
    "UserID" bigint NOT NULL,
    "ReadStatus" boolean NOT NULL
);
 &   DROP TABLE public."MessageReadState";
       public         heap    postgres    false    5            �            1259    16397    User    TABLE     �   CREATE TABLE public."User" (
    "ID" bigint NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(100) NOT NULL,
    "BDay" date NOT NULL,
    "Country" character varying(150) NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false    5            �          0    16402    Chat 
   TABLE DATA           M   COPY public."Chat" ("ID", "Name", "CreateDate", "UserCreaterId") FROM stdin;
    public          postgres    false    217   ].       �          0    16438    ChatUserInfo 
   TABLE DATA           ]   COPY public."ChatUserInfo" ("ID", "UserID", "GroupID", "EntryDate", "ExiteDate") FROM stdin;
    public          postgres    false    218   z.       �          0    16485    File 
   TABLE DATA           V   COPY public."File" ("ID", "UserUploaderID", "UploadDate", "Size", "Type") FROM stdin;
    public          postgres    false    221   �.       �          0    16453    Message 
   TABLE DATA           h   COPY public."Message" ("ID", "GroupID", "UserSenderID", "CreateDate", "UpdateDate", "Text") FROM stdin;
    public          postgres    false    219   �.       �          0    16495    MessageFile 
   TABLE DATA           D   COPY public."MessageFile" ("ID", "MessageID", "FileID") FROM stdin;
    public          postgres    false    222   �.       �          0    16470    MessageReadState 
   TABLE DATA           W   COPY public."MessageReadState" ("ID", "MessageID", "UserID", "ReadStatus") FROM stdin;
    public          postgres    false    220   �.       �          0    16397    User 
   TABLE DATA           R   COPY public."User" ("ID", "FirstName", "LastName", "BDay", "Country") FROM stdin;
    public          postgres    false    216   /       7           2606    16442    ChatUserInfo ChatUserInfo_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."ChatUserInfo"
    ADD CONSTRAINT "ChatUserInfo_pkey" PRIMARY KEY ("ID");
 L   ALTER TABLE ONLY public."ChatUserInfo" DROP CONSTRAINT "ChatUserInfo_pkey";
       public            postgres    false    218            5           2606    16406    Chat Chat_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_pkey" PRIMARY KEY ("ID");
 <   ALTER TABLE ONLY public."Chat" DROP CONSTRAINT "Chat_pkey";
       public            postgres    false    217            =           2606    16489    File File_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."File"
    ADD CONSTRAINT "File_pkey" PRIMARY KEY ("ID");
 <   ALTER TABLE ONLY public."File" DROP CONSTRAINT "File_pkey";
       public            postgres    false    221            ?           2606    16499    MessageFile MessageFile_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."MessageFile"
    ADD CONSTRAINT "MessageFile_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."MessageFile" DROP CONSTRAINT "MessageFile_pkey";
       public            postgres    false    222            ;           2606    16474 &   MessageReadState MessageReadState_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."MessageReadState"
    ADD CONSTRAINT "MessageReadState_pkey" PRIMARY KEY ("ID");
 T   ALTER TABLE ONLY public."MessageReadState" DROP CONSTRAINT "MessageReadState_pkey";
       public            postgres    false    220            9           2606    16459    Message Message_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."Message" DROP CONSTRAINT "Message_pkey";
       public            postgres    false    219            3           2606    16401    User User_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("ID");
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    216            A           2606    16448 &   ChatUserInfo ChatUserInfo_GroupID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ChatUserInfo"
    ADD CONSTRAINT "ChatUserInfo_GroupID_fkey" FOREIGN KEY ("GroupID") REFERENCES public."Chat"("ID") NOT VALID;
 T   ALTER TABLE ONLY public."ChatUserInfo" DROP CONSTRAINT "ChatUserInfo_GroupID_fkey";
       public          postgres    false    4661    218    217            B           2606    16443 %   ChatUserInfo ChatUserInfo_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ChatUserInfo"
    ADD CONSTRAINT "ChatUserInfo_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES public."User"("ID");
 S   ALTER TABLE ONLY public."ChatUserInfo" DROP CONSTRAINT "ChatUserInfo_UserID_fkey";
       public          postgres    false    218    4659    216            @           2606    16407    Chat Chat_UserCreaterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Chat"
    ADD CONSTRAINT "Chat_UserCreaterId_fkey" FOREIGN KEY ("UserCreaterId") REFERENCES public."User"("ID");
 J   ALTER TABLE ONLY public."Chat" DROP CONSTRAINT "Chat_UserCreaterId_fkey";
       public          postgres    false    216    4659    217            G           2606    16490    File File_UserUploaderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."File"
    ADD CONSTRAINT "File_UserUploaderID_fkey" FOREIGN KEY ("UserUploaderID") REFERENCES public."User"("ID");
 K   ALTER TABLE ONLY public."File" DROP CONSTRAINT "File_UserUploaderID_fkey";
       public          postgres    false    221    4659    216            H           2606    16505 #   MessageFile MessageFile_FileID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MessageFile"
    ADD CONSTRAINT "MessageFile_FileID_fkey" FOREIGN KEY ("FileID") REFERENCES public."File"("ID");
 Q   ALTER TABLE ONLY public."MessageFile" DROP CONSTRAINT "MessageFile_FileID_fkey";
       public          postgres    false    221    4669    222            I           2606    16500 &   MessageFile MessageFile_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MessageFile"
    ADD CONSTRAINT "MessageFile_MessageID_fkey" FOREIGN KEY ("MessageID") REFERENCES public."Message"("ID");
 T   ALTER TABLE ONLY public."MessageFile" DROP CONSTRAINT "MessageFile_MessageID_fkey";
       public          postgres    false    219    4665    222            E           2606    16475 0   MessageReadState MessageReadState_MessageID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MessageReadState"
    ADD CONSTRAINT "MessageReadState_MessageID_fkey" FOREIGN KEY ("MessageID") REFERENCES public."Message"("ID");
 ^   ALTER TABLE ONLY public."MessageReadState" DROP CONSTRAINT "MessageReadState_MessageID_fkey";
       public          postgres    false    219    220    4665            F           2606    16480 -   MessageReadState MessageReadState_UserID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."MessageReadState"
    ADD CONSTRAINT "MessageReadState_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES public."User"("ID");
 [   ALTER TABLE ONLY public."MessageReadState" DROP CONSTRAINT "MessageReadState_UserID_fkey";
       public          postgres    false    4659    220    216            C           2606    16460    Message Message_GroupID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "Message_GroupID_fkey" FOREIGN KEY ("GroupID") REFERENCES public."Chat"("ID");
 J   ALTER TABLE ONLY public."Message" DROP CONSTRAINT "Message_GroupID_fkey";
       public          postgres    false    217    4661    219            D           2606    16465 !   Message Message_UserSenderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Message"
    ADD CONSTRAINT "Message_UserSenderID_fkey" FOREIGN KEY ("UserSenderID") REFERENCES public."User"("ID");
 O   ALTER TABLE ONLY public."Message" DROP CONSTRAINT "Message_UserSenderID_fkey";
       public          postgres    false    219    4659    216            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   %   x�3�442615�462�4200�#���T�=... c��     