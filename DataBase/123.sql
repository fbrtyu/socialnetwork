PGDMP  
    9                |            123    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17096    123    DATABASE     y   CREATE DATABASE "123" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "123";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    17097    Покупатели    TABLE     �   CREATE TABLE public."Покупатели" (
    id bigint NOT NULL,
    "fullName" character varying(300) NOT NULL,
    mobile character varying(15) NOT NULL
);
 *   DROP TABLE public."Покупатели";
       public         heap    postgres    false    4            �            1259    17102    Продавцы    TABLE     �   CREATE TABLE public."Продавцы" (
    id bigint NOT NULL,
    "fullName" bit varying(300) NOT NULL,
    mobile bit varying(15) NOT NULL
);
 &   DROP TABLE public."Продавцы";
       public         heap    postgres    false    4            �            1259    17171    Сделки    TABLE     �   CREATE TABLE public."Сделки" (
    id bigint NOT NULL,
    status boolean NOT NULL,
    "idПокупателя" bigint NOT NULL,
    "idПродавца" bigint NOT NULL,
    "idТовара" bigint NOT NULL
);
 "   DROP TABLE public."Сделки";
       public         heap    postgres    false    4            �            1259    17107    Товары    TABLE     �   CREATE TABLE public."Товары" (
    id bigint NOT NULL,
    name character varying(500) NOT NULL,
    cost real NOT NULL,
    "idПродавца" bigint NOT NULL
);
 "   DROP TABLE public."Товары";
       public         heap    postgres    false    4            �          0    17097    Покупатели 
   TABLE DATA           H   COPY public."Покупатели" (id, "fullName", mobile) FROM stdin;
    public          postgres    false    215   �       �          0    17102    Продавцы 
   TABLE DATA           D   COPY public."Продавцы" (id, "fullName", mobile) FROM stdin;
    public          postgres    false    216          �          0    17171    Сделки 
   TABLE DATA           v   COPY public."Сделки" (id, status, "idПокупателя", "idПродавца", "idТовара") FROM stdin;
    public          postgres    false    218   #       �          0    17107    Товары 
   TABLE DATA           N   COPY public."Товары" (id, name, cost, "idПродавца") FROM stdin;
    public          postgres    false    217   @       (           2606    17106 &   Продавцы Продавцы_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Продавцы"
    ADD CONSTRAINT "Продавцы_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Продавцы" DROP CONSTRAINT "Продавцы_pkey";
       public            postgres    false    216            ,           2606    17175    Сделки Сделки_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."Сделки"
    ADD CONSTRAINT "Сделки_pkey" PRIMARY KEY ("idПокупателя");
 L   ALTER TABLE ONLY public."Сделки" DROP CONSTRAINT "Сделки_pkey";
       public            postgres    false    218            *           2606    17187    Товары Товары_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Товары"
    ADD CONSTRAINT "Товары_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Товары" DROP CONSTRAINT "Товары_pkey";
       public            postgres    false    217            &           2606    17101 .   Покупатели покупатели_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Покупатели"
    ADD CONSTRAINT "покупатели_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public."Покупатели" DROP CONSTRAINT "покупатели_pkey";
       public            postgres    false    215            .           2606    17176 5   Сделки Сделки_idПокупателя_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Сделки"
    ADD CONSTRAINT "Сделки_idПокупателя_fkey" FOREIGN KEY ("idПокупателя") REFERENCES public."Покупатели"(id);
 c   ALTER TABLE ONLY public."Сделки" DROP CONSTRAINT "Сделки_idПокупателя_fkey";
       public          postgres    false    215    218    4646            /           2606    17181 1   Сделки Сделки_idПродавца_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Сделки"
    ADD CONSTRAINT "Сделки_idПродавца_fkey" FOREIGN KEY ("idПродавца") REFERENCES public."Продавцы"(id);
 _   ALTER TABLE ONLY public."Сделки" DROP CONSTRAINT "Сделки_idПродавца_fkey";
       public          postgres    false    218    4648    216            0           2606    17188 -   Сделки Сделки_idТовара_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Сделки"
    ADD CONSTRAINT "Сделки_idТовара_fkey" FOREIGN KEY ("idТовара") REFERENCES public."Товары"(id) NOT VALID;
 [   ALTER TABLE ONLY public."Сделки" DROP CONSTRAINT "Сделки_idТовара_fkey";
       public          postgres    false    217    4650    218            -           2606    17136 1   Товары Товары_idПродавца_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Товары"
    ADD CONSTRAINT "Товары_idПродавца_fkey" FOREIGN KEY ("idПродавца") REFERENCES public."Продавцы"(id) NOT VALID;
 _   ALTER TABLE ONLY public."Товары" DROP CONSTRAINT "Товары_idПродавца_fkey";
       public          postgres    false    217    216    4648            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     