PGDMP                         r            redmine    9.3.4    9.3.4 �   W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            Y           1262    28533    redmine    DATABASE     m   CREATE DATABASE redmine WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_IN' LC_CTYPE = 'en_IN';
    DROP DATABASE redmine;
             redmine    false                        2615    25303 
   extensions    SCHEMA        CREATE SCHEMA extensions;
    DROP SCHEMA extensions;
             postgres    false            Z           0    0 
   extensions    ACL     �   REVOKE ALL ON SCHEMA extensions FROM PUBLIC;
REVOKE ALL ON SCHEMA extensions FROM postgres;
GRANT ALL ON SCHEMA extensions TO postgres;
GRANT USAGE ON SCHEMA extensions TO spp_user;
                  postgres    false    7                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            [           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5            \           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5                       3079    11787    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            ]           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    275                       3079    25304    hstore 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA extensions;
    DROP EXTENSION hstore;
                  false    7            ^           0    0    EXTENSION hstore    COMMENT     S   COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';
                       false    276            �            1259    28540    attachments    TABLE     �  CREATE TABLE attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30) DEFAULT NULL::character varying,
    filename character varying(255) DEFAULT ''::character varying NOT NULL,
    disk_filename character varying(255) DEFAULT ''::character varying NOT NULL,
    filesize integer DEFAULT 0 NOT NULL,
    content_type character varying(255) DEFAULT ''::character varying,
    digest character varying(40) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying(255),
    disk_directory character varying(255)
);
    DROP TABLE public.attachments;
       public         spp_user    false    5            �            1259    28538    attachments_id_seq    SEQUENCE     t   CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.attachments_id_seq;
       public       spp_user    false    173    5            _           0    0    attachments_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;
            public       spp_user    false    172            �            1259    28560    auth_sources    TABLE     �  CREATE TABLE auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying(255),
    account_password character varying(255) DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter character varying(255),
    timeout integer
);
     DROP TABLE public.auth_sources;
       public         spp_user    false    5            �            1259    28558    auth_sources_id_seq    SEQUENCE     u   CREATE SEQUENCE auth_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.auth_sources_id_seq;
       public       spp_user    false    175    5            `           0    0    auth_sources_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE auth_sources_id_seq OWNED BY auth_sources.id;
            public       spp_user    false    174            �            1259    29104    boards    TABLE     t  CREATE TABLE boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description character varying(255),
    "position" integer DEFAULT 1,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);
    DROP TABLE public.boards;
       public         spp_user    false    5            �            1259    29102    boards_id_seq    SEQUENCE     o   CREATE SEQUENCE boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.boards_id_seq;
       public       spp_user    false    5    244            a           0    0    boards_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE boards_id_seq OWNED BY boards.id;
            public       spp_user    false    243            �            1259    29057    changes    TABLE     ;  CREATE TABLE changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying(255),
    revision character varying(255),
    branch character varying(255)
);
    DROP TABLE public.changes;
       public         spp_user    false    5            �            1259    29055    changes_id_seq    SEQUENCE     p   CREATE SEQUENCE changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.changes_id_seq;
       public       spp_user    false    237    5            b           0    0    changes_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE changes_id_seq OWNED BY changes.id;
            public       spp_user    false    236                       1259    29513    changeset_parents    TABLE     f   CREATE TABLE changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);
 %   DROP TABLE public.changeset_parents;
       public         spp_user    false    5            �            1259    29045 
   changesets    TABLE     D  CREATE TABLE changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying(255) NOT NULL,
    committer character varying(255),
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying(255),
    user_id integer
);
    DROP TABLE public.changesets;
       public         spp_user    false    5            �            1259    29043    changesets_id_seq    SEQUENCE     s   CREATE SEQUENCE changesets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.changesets_id_seq;
       public       spp_user    false    235    5            c           0    0    changesets_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE changesets_id_seq OWNED BY changesets.id;
            public       spp_user    false    234            �            1259    29087    changesets_issues    TABLE     e   CREATE TABLE changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);
 %   DROP TABLE public.changesets_issues;
       public         spp_user    false    5            �            1259    28889    comments    TABLE     X  CREATE TABLE comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    comments text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);
    DROP TABLE public.comments;
       public         spp_user    false    5            �            1259    28887    comments_id_seq    SEQUENCE     q   CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public       spp_user    false    5    217            d           0    0    comments_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE comments_id_seq OWNED BY comments.id;
            public       spp_user    false    216            �            1259    28574    custom_fields    TABLE     ,  CREATE TABLE custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying(255) DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text
);
 !   DROP TABLE public.custom_fields;
       public         spp_user    false    5            �            1259    28572    custom_fields_id_seq    SEQUENCE     v   CREATE SEQUENCE custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.custom_fields_id_seq;
       public       spp_user    false    177    5            e           0    0    custom_fields_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE custom_fields_id_seq OWNED BY custom_fields.id;
            public       spp_user    false    176            �            1259    28591    custom_fields_projects    TABLE     �   CREATE TABLE custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);
 *   DROP TABLE public.custom_fields_projects;
       public         spp_user    false    5                       1259    29590    custom_fields_roles    TABLE     i   CREATE TABLE custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);
 '   DROP TABLE public.custom_fields_roles;
       public         spp_user    false    5            �            1259    28596    custom_fields_trackers    TABLE     �   CREATE TABLE custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);
 *   DROP TABLE public.custom_fields_trackers;
       public         spp_user    false    5            �            1259    28603    custom_values    TABLE     �   CREATE TABLE custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);
 !   DROP TABLE public.custom_values;
       public         spp_user    false    5            �            1259    28601    custom_values_id_seq    SEQUENCE     v   CREATE SEQUENCE custom_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.custom_values_id_seq;
       public       spp_user    false    5    181            f           0    0    custom_values_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE custom_values_id_seq OWNED BY custom_values.id;
            public       spp_user    false    180            �            1259    28617 	   documents    TABLE       CREATE TABLE documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);
    DROP TABLE public.documents;
       public         spp_user    false    5            �            1259    28615    documents_id_seq    SEQUENCE     r   CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.documents_id_seq;
       public       spp_user    false    183    5            g           0    0    documents_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE documents_id_seq OWNED BY documents.id;
            public       spp_user    false    182            �            1259    29169    enabled_modules    TABLE     |   CREATE TABLE enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying(255) NOT NULL
);
 #   DROP TABLE public.enabled_modules;
       public         spp_user    false    5            �            1259    29167    enabled_modules_id_seq    SEQUENCE     x   CREATE SEQUENCE enabled_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.enabled_modules_id_seq;
       public       spp_user    false    5    250            h           0    0    enabled_modules_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE enabled_modules_id_seq OWNED BY enabled_modules.id;
            public       spp_user    false    249            �            1259    28632    enumerations    TABLE     r  CREATE TABLE enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer DEFAULT 1,
    is_default boolean DEFAULT false NOT NULL,
    type character varying(255),
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);
     DROP TABLE public.enumerations;
       public         spp_user    false    5            �            1259    28630    enumerations_id_seq    SEQUENCE     u   CREATE SEQUENCE enumerations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.enumerations_id_seq;
       public       spp_user    false    185    5            i           0    0    enumerations_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE enumerations_id_seq OWNED BY enumerations.id;
            public       spp_user    false    184                       1259    103778    execution_environments    TABLE     �   CREATE TABLE execution_environments (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(255),
    project_id integer NOT NULL
);
 *   DROP TABLE public.execution_environments;
       public         spp_user    false    5                       1259    103776    execution_environments_id_seq    SEQUENCE        CREATE SEQUENCE execution_environments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.execution_environments_id_seq;
       public       spp_user    false    5    274            j           0    0    execution_environments_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE execution_environments_id_seq OWNED BY execution_environments.id;
            public       spp_user    false    273                       1259    103770    execution_journals    TABLE       CREATE TABLE execution_journals (
    id integer NOT NULL,
    test_case_id integer NOT NULL,
    result_id integer NOT NULL,
    version_id integer,
    comment text,
    created_on timestamp without time zone NOT NULL,
    executor_id integer,
    environment_id integer
);
 &   DROP TABLE public.execution_journals;
       public         spp_user    false    5                       1259    103768    execution_journals_id_seq    SEQUENCE     {   CREATE SEQUENCE execution_journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.execution_journals_id_seq;
       public       spp_user    false    5    272            k           0    0    execution_journals_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE execution_journals_id_seq OWNED BY execution_journals.id;
            public       spp_user    false    271                       1259    103761    execution_results    TABLE     �   CREATE TABLE execution_results (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    order_number integer
);
 %   DROP TABLE public.execution_results;
       public         spp_user    false    5                       1259    103759    execution_results_id_seq    SEQUENCE     z   CREATE SEQUENCE execution_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.execution_results_id_seq;
       public       spp_user    false    5    270            l           0    0    execution_results_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE execution_results_id_seq OWNED BY execution_results.id;
            public       spp_user    false    269                       1259    103755    execution_suite_test_case    TABLE     w   CREATE TABLE execution_suite_test_case (
    execution_suite_id integer NOT NULL,
    test_case_id integer NOT NULL
);
 -   DROP TABLE public.execution_suite_test_case;
       public         spp_user    false    5            	           1259    103734    execution_suites    TABLE     �   CREATE TABLE execution_suites (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent_id integer,
    project_id integer
);
 $   DROP TABLE public.execution_suites;
       public         spp_user    false    5                       1259    103732    execution_suites_id_seq    SEQUENCE     y   CREATE SEQUENCE execution_suites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.execution_suites_id_seq;
       public       spp_user    false    5    265            m           0    0    execution_suites_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE execution_suites_id_seq OWNED BY execution_suites.id;
            public       spp_user    false    264                       1259    29333    groups_users    TABLE     [   CREATE TABLE groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);
     DROP TABLE public.groups_users;
       public         spp_user    false    5            �            1259    28642    issue_categories    TABLE     �   CREATE TABLE issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);
 $   DROP TABLE public.issue_categories;
       public         spp_user    false    5            �            1259    28640    issue_categories_id_seq    SEQUENCE     y   CREATE SEQUENCE issue_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.issue_categories_id_seq;
       public       spp_user    false    5    187            n           0    0    issue_categories_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE issue_categories_id_seq OWNED BY issue_categories.id;
            public       spp_user    false    186            �            1259    29093    issue_relations    TABLE     �   CREATE TABLE issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying(255) DEFAULT ''::character varying NOT NULL,
    delay integer
);
 #   DROP TABLE public.issue_relations;
       public         spp_user    false    5            �            1259    29091    issue_relations_id_seq    SEQUENCE     x   CREATE SEQUENCE issue_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.issue_relations_id_seq;
       public       spp_user    false    242    5            o           0    0    issue_relations_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE issue_relations_id_seq OWNED BY issue_relations.id;
            public       spp_user    false    241            �            1259    28668    issue_statuses    TABLE       CREATE TABLE issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    default_done_ratio integer
);
 "   DROP TABLE public.issue_statuses;
       public         spp_user    false    5            �            1259    28666    issue_statuses_id_seq    SEQUENCE     w   CREATE SEQUENCE issue_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.issue_statuses_id_seq;
       public       spp_user    false    5    189            p           0    0    issue_statuses_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE issue_statuses_id_seq OWNED BY issue_statuses.id;
            public       spp_user    false    188            �            1259    28680    issues    TABLE     /  CREATE TABLE issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone
);
    DROP TABLE public.issues;
       public         spp_user    false    5            �            1259    28678    issues_id_seq    SEQUENCE     o   CREATE SEQUENCE issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.issues_id_seq;
       public       spp_user    false    191    5            q           0    0    issues_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE issues_id_seq OWNED BY issues.id;
            public       spp_user    false    190            �            1259    28853    journal_details    TABLE       CREATE TABLE journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);
 #   DROP TABLE public.journal_details;
       public         spp_user    false    5            �            1259    28851    journal_details_id_seq    SEQUENCE     x   CREATE SEQUENCE journal_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.journal_details_id_seq;
       public       spp_user    false    5    213            r           0    0    journal_details_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE journal_details_id_seq OWNED BY journal_details.id;
            public       spp_user    false    212            �            1259    28839    journals    TABLE     T  CREATE TABLE journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL
);
    DROP TABLE public.journals;
       public         spp_user    false    5            �            1259    28837    journals_id_seq    SEQUENCE     q   CREATE SEQUENCE journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.journals_id_seq;
       public       spp_user    false    211    5            s           0    0    journals_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE journals_id_seq OWNED BY journals.id;
            public       spp_user    false    210                       1259    29327    member_roles    TABLE     �   CREATE TABLE member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);
     DROP TABLE public.member_roles;
       public         spp_user    false    5                        1259    29325    member_roles_id_seq    SEQUENCE     u   CREATE SEQUENCE member_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.member_roles_id_seq;
       public       spp_user    false    257    5            t           0    0    member_roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE member_roles_id_seq OWNED BY member_roles.id;
            public       spp_user    false    256            �            1259    28699    members    TABLE     �   CREATE TABLE members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);
    DROP TABLE public.members;
       public         spp_user    false    5            �            1259    28697    members_id_seq    SEQUENCE     p   CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.members_id_seq;
       public       spp_user    false    193    5            u           0    0    members_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE members_id_seq OWNED BY members.id;
            public       spp_user    false    192            �            1259    29120    messages    TABLE     �  CREATE TABLE messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying(255) DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);
    DROP TABLE public.messages;
       public         spp_user    false    5            �            1259    29118    messages_id_seq    SEQUENCE     q   CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public       spp_user    false    246    5            v           0    0    messages_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE messages_id_seq OWNED BY messages.id;
            public       spp_user    false    245            �            1259    28710    news    TABLE     l  CREATE TABLE news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.news;
       public         spp_user    false    5            �            1259    28708    news_id_seq    SEQUENCE     m   CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public       spp_user    false    5    195            w           0    0    news_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE news_id_seq OWNED BY news.id;
            public       spp_user    false    194            �            1259    29292 #   open_id_authentication_associations    TABLE     �   CREATE TABLE open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying(255),
    assoc_type character varying(255),
    server_url bytea,
    secret bytea
);
 7   DROP TABLE public.open_id_authentication_associations;
       public         spp_user    false    5            �            1259    29290 *   open_id_authentication_associations_id_seq    SEQUENCE     �   CREATE SEQUENCE open_id_authentication_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.open_id_authentication_associations_id_seq;
       public       spp_user    false    253    5            x           0    0 *   open_id_authentication_associations_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE open_id_authentication_associations_id_seq OWNED BY open_id_authentication_associations.id;
            public       spp_user    false    252            �            1259    29303    open_id_authentication_nonces    TABLE     �   CREATE TABLE open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying(255),
    salt character varying(255) NOT NULL
);
 1   DROP TABLE public.open_id_authentication_nonces;
       public         spp_user    false    5            �            1259    29301 $   open_id_authentication_nonces_id_seq    SEQUENCE     �   CREATE SEQUENCE open_id_authentication_nonces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.open_id_authentication_nonces_id_seq;
       public       spp_user    false    255    5            y           0    0 $   open_id_authentication_nonces_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE open_id_authentication_nonces_id_seq OWNED BY open_id_authentication_nonces.id;
            public       spp_user    false    254            �            1259    28746    projects    TABLE       CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying(255) DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying(255),
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL
);
    DROP TABLE public.projects;
       public         spp_user    false    5            �            1259    28744    projects_id_seq    SEQUENCE     q   CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public       spp_user    false    5    197            z           0    0    projects_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE projects_id_seq OWNED BY projects.id;
            public       spp_user    false    196            �            1259    29218    projects_trackers    TABLE     y   CREATE TABLE projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);
 %   DROP TABLE public.projects_trackers;
       public         spp_user    false    5            �            1259    28912    queries    TABLE     u  CREATE TABLE queries (
    id integer NOT NULL,
    project_id integer,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying(255),
    type character varying(255),
    visibility integer DEFAULT 0,
    options text
);
    DROP TABLE public.queries;
       public         spp_user    false    5            �            1259    28910    queries_id_seq    SEQUENCE     p   CREATE SEQUENCE queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.queries_id_seq;
       public       spp_user    false    219    5            {           0    0    queries_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE queries_id_seq OWNED BY queries.id;
            public       spp_user    false    218                       1259    29576    queries_roles    TABLE     \   CREATE TABLE queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);
 !   DROP TABLE public.queries_roles;
       public         spp_user    false    5            �            1259    28926    repositories    TABLE     �  CREATE TABLE repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying(255) DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying(255) DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying(255),
    path_encoding character varying(64) DEFAULT NULL::character varying,
    log_encoding character varying(64) DEFAULT NULL::character varying,
    extra_info text,
    identifier character varying(255),
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);
     DROP TABLE public.repositories;
       public         spp_user    false    5            �            1259    28924    repositories_id_seq    SEQUENCE     u   CREATE SEQUENCE repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.repositories_id_seq;
       public       spp_user    false    221    5            |           0    0    repositories_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE repositories_id_seq OWNED BY repositories.id;
            public       spp_user    false    220            �            1259    28759    roles    TABLE     W  CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer DEFAULT 1,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL
);
    DROP TABLE public.roles;
       public         spp_user    false    5            �            1259    28757    roles_id_seq    SEQUENCE     n   CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       spp_user    false    5    199            }           0    0    roles_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE roles_id_seq OWNED BY roles.id;
            public       spp_user    false    198            �            1259    28534    schema_migrations    TABLE     P   CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         spp_user    false    5            �            1259    28936    settings    TABLE     �   CREATE TABLE settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);
    DROP TABLE public.settings;
       public         spp_user    false    5            �            1259    28934    settings_id_seq    SEQUENCE     q   CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.settings_id_seq;
       public       spp_user    false    223    5            ~           0    0    settings_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE settings_id_seq OWNED BY settings.id;
            public       spp_user    false    222                       1259    103748 
   test_cases    TABLE     x   CREATE TABLE test_cases (
    id integer NOT NULL,
    test_suite_id integer NOT NULL,
    issue_id integer NOT NULL
);
    DROP TABLE public.test_cases;
       public         spp_user    false    5            
           1259    103746    test_cases_id_seq    SEQUENCE     s   CREATE SEQUENCE test_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.test_cases_id_seq;
       public       spp_user    false    5    267                       0    0    test_cases_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE test_cases_id_seq OWNED BY test_cases.id;
            public       spp_user    false    266                       1259    103720    test_suites    TABLE     �   CREATE TABLE test_suites (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent_id integer,
    project_id integer
);
    DROP TABLE public.test_suites;
       public         spp_user    false    5                       1259    103718    test_suites_id_seq    SEQUENCE     t   CREATE SEQUENCE test_suites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.test_suites_id_seq;
       public       spp_user    false    263    5            �           0    0    test_suites_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE test_suites_id_seq OWNED BY test_suites.id;
            public       spp_user    false    262            �            1259    29035    time_entries    TABLE     �  CREATE TABLE time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(255),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);
     DROP TABLE public.time_entries;
       public         spp_user    false    5            �            1259    29033    time_entries_id_seq    SEQUENCE     u   CREATE SEQUENCE time_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.time_entries_id_seq;
       public       spp_user    false    233    5            �           0    0    time_entries_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE time_entries_id_seq OWNED BY time_entries.id;
            public       spp_user    false    232            �            1259    28768    tokens    TABLE       CREATE TABLE tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL
);
    DROP TABLE public.tokens;
       public         spp_user    false    5            �            1259    28766    tokens_id_seq    SEQUENCE     o   CREATE SEQUENCE tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public       spp_user    false    5    201            �           0    0    tokens_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE tokens_id_seq OWNED BY tokens.id;
            public       spp_user    false    200            �            1259    28779    trackers    TABLE        CREATE TABLE trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0
);
    DROP TABLE public.trackers;
       public         spp_user    false    5            �            1259    28777    trackers_id_seq    SEQUENCE     q   CREATE SEQUENCE trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.trackers_id_seq;
       public       spp_user    false    203    5            �           0    0    trackers_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE trackers_id_seq OWNED BY trackers.id;
            public       spp_user    false    202            �            1259    28869    user_preferences    TABLE     �   CREATE TABLE user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT false,
    time_zone character varying(255)
);
 $   DROP TABLE public.user_preferences;
       public         spp_user    false    5            �            1259    28867    user_preferences_id_seq    SEQUENCE     y   CREATE SEQUENCE user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_preferences_id_seq;
       public       spp_user    false    215    5            �           0    0    user_preferences_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE user_preferences_id_seq OWNED BY user_preferences.id;
            public       spp_user    false    214            �            1259    28789    users    TABLE     �  CREATE TABLE users (
    id integer NOT NULL,
    login character varying(255) DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    mail character varying(60) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying(255),
    identity_url character varying(255),
    mail_notification character varying(255) DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL
);
    DROP TABLE public.users;
       public         spp_user    false    5            �            1259    28787    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       spp_user    false    205    5            �           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       spp_user    false    204            �            1259    28806    versions    TABLE       CREATE TABLE versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying(255),
    status character varying(255) DEFAULT 'open'::character varying,
    sharing character varying(255) DEFAULT 'none'::character varying NOT NULL
);
    DROP TABLE public.versions;
       public         spp_user    false    5            �            1259    28804    versions_id_seq    SEQUENCE     q   CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.versions_id_seq;
       public       spp_user    false    207    5            �           0    0    versions_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE versions_id_seq OWNED BY versions.id;
            public       spp_user    false    206            �            1259    29079    watchers    TABLE     �   CREATE TABLE watchers (
    id integer NOT NULL,
    watchable_type character varying(255) DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);
    DROP TABLE public.watchers;
       public         spp_user    false    5            �            1259    29077    watchers_id_seq    SEQUENCE     q   CREATE SEQUENCE watchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.watchers_id_seq;
       public       spp_user    false    5    239            �           0    0    watchers_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE watchers_id_seq OWNED BY watchers.id;
            public       spp_user    false    238            �            1259    29010    wiki_content_versions    TABLE     �  CREATE TABLE wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(255) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);
 )   DROP TABLE public.wiki_content_versions;
       public         spp_user    false    5            �            1259    29008    wiki_content_versions_id_seq    SEQUENCE     ~   CREATE SEQUENCE wiki_content_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.wiki_content_versions_id_seq;
       public       spp_user    false    5    231            �           0    0    wiki_content_versions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE wiki_content_versions_id_seq OWNED BY wiki_content_versions.id;
            public       spp_user    false    230            �            1259    28997    wiki_contents    TABLE       CREATE TABLE wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(255) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);
 !   DROP TABLE public.wiki_contents;
       public         spp_user    false    5            �            1259    28995    wiki_contents_id_seq    SEQUENCE     v   CREATE SEQUENCE wiki_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.wiki_contents_id_seq;
       public       spp_user    false    229    5            �           0    0    wiki_contents_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE wiki_contents_id_seq OWNED BY wiki_contents.id;
            public       spp_user    false    228            �            1259    28988 
   wiki_pages    TABLE     �   CREATE TABLE wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);
    DROP TABLE public.wiki_pages;
       public         spp_user    false    5            �            1259    28986    wiki_pages_id_seq    SEQUENCE     s   CREATE SEQUENCE wiki_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.wiki_pages_id_seq;
       public       spp_user    false    5    227            �           0    0    wiki_pages_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE wiki_pages_id_seq OWNED BY wiki_pages.id;
            public       spp_user    false    226            �            1259    29157    wiki_redirects    TABLE     �   CREATE TABLE wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255),
    redirects_to character varying(255),
    created_on timestamp without time zone NOT NULL
);
 "   DROP TABLE public.wiki_redirects;
       public         spp_user    false    5            �            1259    29155    wiki_redirects_id_seq    SEQUENCE     w   CREATE SEQUENCE wiki_redirects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.wiki_redirects_id_seq;
       public       spp_user    false    248    5            �           0    0    wiki_redirects_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE wiki_redirects_id_seq OWNED BY wiki_redirects.id;
            public       spp_user    false    247            �            1259    28978    wikis    TABLE     �   CREATE TABLE wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.wikis;
       public         spp_user    false    5            �            1259    28976    wikis_id_seq    SEQUENCE     n   CREATE SEQUENCE wikis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.wikis_id_seq;
       public       spp_user    false    225    5            �           0    0    wikis_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE wikis_id_seq OWNED BY wikis.id;
            public       spp_user    false    224            �            1259    28818 	   workflows    TABLE     �  CREATE TABLE workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);
    DROP TABLE public.workflows;
       public         spp_user    false    5            �            1259    28816    workflows_id_seq    SEQUENCE     r   CREATE SEQUENCE workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.workflows_id_seq;
       public       spp_user    false    5    209            �           0    0    workflows_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE workflows_id_seq OWNED BY workflows.id;
            public       spp_user    false    208            �           2604    28543    id    DEFAULT     b   ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);
 =   ALTER TABLE public.attachments ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    173    172    173            	           2604    28563    id    DEFAULT     d   ALTER TABLE ONLY auth_sources ALTER COLUMN id SET DEFAULT nextval('auth_sources_id_seq'::regclass);
 >   ALTER TABLE public.auth_sources ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    174    175    175            �	           2604    29107    id    DEFAULT     X   ALTER TABLE ONLY boards ALTER COLUMN id SET DEFAULT nextval('boards_id_seq'::regclass);
 8   ALTER TABLE public.boards ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    243    244    244            �	           2604    29060    id    DEFAULT     Z   ALTER TABLE ONLY changes ALTER COLUMN id SET DEFAULT nextval('changes_id_seq'::regclass);
 9   ALTER TABLE public.changes ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    237    236    237            �	           2604    29048    id    DEFAULT     `   ALTER TABLE ONLY changesets ALTER COLUMN id SET DEFAULT nextval('changesets_id_seq'::regclass);
 <   ALTER TABLE public.changesets ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    235    234    235            y	           2604    28892    id    DEFAULT     \   ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    216    217    217            	           2604    28577    id    DEFAULT     f   ALTER TABLE ONLY custom_fields ALTER COLUMN id SET DEFAULT nextval('custom_fields_id_seq'::regclass);
 ?   ALTER TABLE public.custom_fields ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    176    177    177            	           2604    28606    id    DEFAULT     f   ALTER TABLE ONLY custom_values ALTER COLUMN id SET DEFAULT nextval('custom_values_id_seq'::regclass);
 ?   ALTER TABLE public.custom_values ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    181    180    181             	           2604    28620    id    DEFAULT     ^   ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);
 ;   ALTER TABLE public.documents ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    183    182    183            �	           2604    29172    id    DEFAULT     j   ALTER TABLE ONLY enabled_modules ALTER COLUMN id SET DEFAULT nextval('enabled_modules_id_seq'::regclass);
 A   ALTER TABLE public.enabled_modules ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    250    249    250            $	           2604    28635    id    DEFAULT     d   ALTER TABLE ONLY enumerations ALTER COLUMN id SET DEFAULT nextval('enumerations_id_seq'::regclass);
 >   ALTER TABLE public.enumerations ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    185    184    185            �	           2604    103781    id    DEFAULT     x   ALTER TABLE ONLY execution_environments ALTER COLUMN id SET DEFAULT nextval('execution_environments_id_seq'::regclass);
 H   ALTER TABLE public.execution_environments ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    274    273    274            �	           2604    103773    id    DEFAULT     p   ALTER TABLE ONLY execution_journals ALTER COLUMN id SET DEFAULT nextval('execution_journals_id_seq'::regclass);
 D   ALTER TABLE public.execution_journals ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    271    272    272            �	           2604    103764    id    DEFAULT     n   ALTER TABLE ONLY execution_results ALTER COLUMN id SET DEFAULT nextval('execution_results_id_seq'::regclass);
 C   ALTER TABLE public.execution_results ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    270    269    270            �	           2604    103737    id    DEFAULT     l   ALTER TABLE ONLY execution_suites ALTER COLUMN id SET DEFAULT nextval('execution_suites_id_seq'::regclass);
 B   ALTER TABLE public.execution_suites ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    264    265    265            )	           2604    28645    id    DEFAULT     l   ALTER TABLE ONLY issue_categories ALTER COLUMN id SET DEFAULT nextval('issue_categories_id_seq'::regclass);
 B   ALTER TABLE public.issue_categories ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    187    186    187            �	           2604    29096    id    DEFAULT     j   ALTER TABLE ONLY issue_relations ALTER COLUMN id SET DEFAULT nextval('issue_relations_id_seq'::regclass);
 A   ALTER TABLE public.issue_relations ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    242    241    242            ,	           2604    28671    id    DEFAULT     h   ALTER TABLE ONLY issue_statuses ALTER COLUMN id SET DEFAULT nextval('issue_statuses_id_seq'::regclass);
 @   ALTER TABLE public.issue_statuses ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    189    188    189            1	           2604    28683    id    DEFAULT     X   ALTER TABLE ONLY issues ALTER COLUMN id SET DEFAULT nextval('issues_id_seq'::regclass);
 8   ALTER TABLE public.issues ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    190    191    191            r	           2604    28856    id    DEFAULT     j   ALTER TABLE ONLY journal_details ALTER COLUMN id SET DEFAULT nextval('journal_details_id_seq'::regclass);
 A   ALTER TABLE public.journal_details ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    213    212    213            m	           2604    28842    id    DEFAULT     \   ALTER TABLE ONLY journals ALTER COLUMN id SET DEFAULT nextval('journals_id_seq'::regclass);
 :   ALTER TABLE public.journals ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    210    211    211            �	           2604    29330    id    DEFAULT     d   ALTER TABLE ONLY member_roles ALTER COLUMN id SET DEFAULT nextval('member_roles_id_seq'::regclass);
 >   ALTER TABLE public.member_roles ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    256    257    257            8	           2604    28702    id    DEFAULT     Z   ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);
 9   ALTER TABLE public.members ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    193    192    193            �	           2604    29123    id    DEFAULT     \   ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    246    245    246            :	           2604    28713    id    DEFAULT     T   ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);
 6   ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    195    194    195            �	           2604    29295    id    DEFAULT     �   ALTER TABLE ONLY open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_associations_id_seq'::regclass);
 U   ALTER TABLE public.open_id_authentication_associations ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    252    253    253            �	           2604    29306    id    DEFAULT     �   ALTER TABLE ONLY open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_nonces_id_seq'::regclass);
 O   ALTER TABLE public.open_id_authentication_nonces ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    254    255    255            @	           2604    28749    id    DEFAULT     \   ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    197    196    197            ~	           2604    28915    id    DEFAULT     Z   ALTER TABLE ONLY queries ALTER COLUMN id SET DEFAULT nextval('queries_id_seq'::regclass);
 9   ALTER TABLE public.queries ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    218    219    219            �	           2604    28929    id    DEFAULT     d   ALTER TABLE ONLY repositories ALTER COLUMN id SET DEFAULT nextval('repositories_id_seq'::regclass);
 >   ALTER TABLE public.repositories ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    221    220    221            E	           2604    28762    id    DEFAULT     V   ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    199    198    199            �	           2604    28939    id    DEFAULT     \   ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);
 :   ALTER TABLE public.settings ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    223    222    223            �	           2604    103751    id    DEFAULT     `   ALTER TABLE ONLY test_cases ALTER COLUMN id SET DEFAULT nextval('test_cases_id_seq'::regclass);
 <   ALTER TABLE public.test_cases ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    267    266    267            �	           2604    103723    id    DEFAULT     b   ALTER TABLE ONLY test_suites ALTER COLUMN id SET DEFAULT nextval('test_suites_id_seq'::regclass);
 =   ALTER TABLE public.test_suites ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    262    263    263            �	           2604    29038    id    DEFAULT     d   ALTER TABLE ONLY time_entries ALTER COLUMN id SET DEFAULT nextval('time_entries_id_seq'::regclass);
 >   ALTER TABLE public.time_entries ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    233    232    233            K	           2604    28771    id    DEFAULT     X   ALTER TABLE ONLY tokens ALTER COLUMN id SET DEFAULT nextval('tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    200    201    201            O	           2604    28782    id    DEFAULT     \   ALTER TABLE ONLY trackers ALTER COLUMN id SET DEFAULT nextval('trackers_id_seq'::regclass);
 :   ALTER TABLE public.trackers ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    203    202    203            v	           2604    28872    id    DEFAULT     l   ALTER TABLE ONLY user_preferences ALTER COLUMN id SET DEFAULT nextval('user_preferences_id_seq'::regclass);
 B   ALTER TABLE public.user_preferences ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    214    215    215            V	           2604    28792    id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    205    204    205            `	           2604    28809    id    DEFAULT     \   ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);
 :   ALTER TABLE public.versions ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    207    206    207            �	           2604    29082    id    DEFAULT     \   ALTER TABLE ONLY watchers ALTER COLUMN id SET DEFAULT nextval('watchers_id_seq'::regclass);
 :   ALTER TABLE public.watchers ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    239    238    239            �	           2604    29013    id    DEFAULT     v   ALTER TABLE ONLY wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('wiki_content_versions_id_seq'::regclass);
 G   ALTER TABLE public.wiki_content_versions ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    230    231    231            �	           2604    29000    id    DEFAULT     f   ALTER TABLE ONLY wiki_contents ALTER COLUMN id SET DEFAULT nextval('wiki_contents_id_seq'::regclass);
 ?   ALTER TABLE public.wiki_contents ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    228    229    229            �	           2604    28991    id    DEFAULT     `   ALTER TABLE ONLY wiki_pages ALTER COLUMN id SET DEFAULT nextval('wiki_pages_id_seq'::regclass);
 <   ALTER TABLE public.wiki_pages ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    226    227    227            �	           2604    29160    id    DEFAULT     h   ALTER TABLE ONLY wiki_redirects ALTER COLUMN id SET DEFAULT nextval('wiki_redirects_id_seq'::regclass);
 @   ALTER TABLE public.wiki_redirects ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    247    248    248            �	           2604    28981    id    DEFAULT     V   ALTER TABLE ONLY wikis ALTER COLUMN id SET DEFAULT nextval('wikis_id_seq'::regclass);
 7   ALTER TABLE public.wikis ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    225    224    225            f	           2604    28821    id    DEFAULT     ^   ALTER TABLE ONLY workflows ALTER COLUMN id SET DEFAULT nextval('workflows_id_seq'::regclass);
 ;   ALTER TABLE public.workflows ALTER COLUMN id DROP DEFAULT;
       public       spp_user    false    208    209    209            �
          0    28540    attachments 
   TABLE DATA                     public       spp_user    false    173   �      �           0    0    attachments_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('attachments_id_seq', 14, true);
            public       spp_user    false    172            �
          0    28560    auth_sources 
   TABLE DATA                     public       spp_user    false    175   �
      �           0    0    auth_sources_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('auth_sources_id_seq', 1, false);
            public       spp_user    false    174            6          0    29104    boards 
   TABLE DATA                     public       spp_user    false    244   �
      �           0    0    boards_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('boards_id_seq', 1, false);
            public       spp_user    false    243            /          0    29057    changes 
   TABLE DATA                     public       spp_user    false    237   �
      �           0    0    changes_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('changes_id_seq', 1, false);
            public       spp_user    false    236            E          0    29513    changeset_parents 
   TABLE DATA                     public       spp_user    false    259   �
      -          0    29045 
   changesets 
   TABLE DATA                     public       spp_user    false    235         �           0    0    changesets_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('changesets_id_seq', 1, false);
            public       spp_user    false    234            2          0    29087    changesets_issues 
   TABLE DATA                     public       spp_user    false    240   ,                0    28889    comments 
   TABLE DATA                     public       spp_user    false    217   F      �           0    0    comments_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('comments_id_seq', 1, false);
            public       spp_user    false    216            �
          0    28574    custom_fields 
   TABLE DATA                     public       spp_user    false    177   `      �           0    0    custom_fields_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('custom_fields_id_seq', 1, false);
            public       spp_user    false    176            �
          0    28591    custom_fields_projects 
   TABLE DATA                     public       spp_user    false    178   z      G          0    29590    custom_fields_roles 
   TABLE DATA                     public       spp_user    false    261   �      �
          0    28596    custom_fields_trackers 
   TABLE DATA                     public       spp_user    false    179   �      �
          0    28603    custom_values 
   TABLE DATA                     public       spp_user    false    181   �      �           0    0    custom_values_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('custom_values_id_seq', 1, false);
            public       spp_user    false    180            �
          0    28617 	   documents 
   TABLE DATA                     public       spp_user    false    183   �      �           0    0    documents_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('documents_id_seq', 1, false);
            public       spp_user    false    182            <          0    29169    enabled_modules 
   TABLE DATA                     public       spp_user    false    250   �      �           0    0    enabled_modules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('enabled_modules_id_seq', 200, true);
            public       spp_user    false    249            �
          0    28632    enumerations 
   TABLE DATA                     public       spp_user    false    185   q      �           0    0    enumerations_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('enumerations_id_seq', 9, true);
            public       spp_user    false    184            T          0    103778    execution_environments 
   TABLE DATA                     public       spp_user    false    274   �      �           0    0    execution_environments_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('execution_environments_id_seq', 13, true);
            public       spp_user    false    273            R          0    103770    execution_journals 
   TABLE DATA                     public       spp_user    false    272   (      �           0    0    execution_journals_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('execution_journals_id_seq', 1, false);
            public       spp_user    false    271            P          0    103761    execution_results 
   TABLE DATA                     public       spp_user    false    270   B      �           0    0    execution_results_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('execution_results_id_seq', 5, true);
            public       spp_user    false    269            N          0    103755    execution_suite_test_case 
   TABLE DATA                     public       spp_user    false    268   �      K          0    103734    execution_suites 
   TABLE DATA                     public       spp_user    false    265   �      �           0    0    execution_suites_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('execution_suites_id_seq', 21, true);
            public       spp_user    false    264            D          0    29333    groups_users 
   TABLE DATA                     public       spp_user    false    258   m      �
          0    28642    issue_categories 
   TABLE DATA                     public       spp_user    false    187   �      �           0    0    issue_categories_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('issue_categories_id_seq', 2, true);
            public       spp_user    false    186            4          0    29093    issue_relations 
   TABLE DATA                     public       spp_user    false    242         �           0    0    issue_relations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('issue_relations_id_seq', 1, false);
            public       spp_user    false    241            �
          0    28668    issue_statuses 
   TABLE DATA                     public       spp_user    false    189         �           0    0    issue_statuses_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('issue_statuses_id_seq', 7, true);
            public       spp_user    false    188                      0    28680    issues 
   TABLE DATA                     public       spp_user    false    191   �      �           0    0    issues_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('issues_id_seq', 63, true);
            public       spp_user    false    190                      0    28853    journal_details 
   TABLE DATA                     public       spp_user    false    213   �@      �           0    0    journal_details_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('journal_details_id_seq', 167, true);
            public       spp_user    false    212                      0    28839    journals 
   TABLE DATA                     public       spp_user    false    211   �J      �           0    0    journals_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('journals_id_seq', 127, true);
            public       spp_user    false    210            C          0    29327    member_roles 
   TABLE DATA                     public       spp_user    false    257   �Z      �           0    0    member_roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('member_roles_id_seq', 61, true);
            public       spp_user    false    256                      0    28699    members 
   TABLE DATA                     public       spp_user    false    193   O\      �           0    0    members_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('members_id_seq', 59, true);
            public       spp_user    false    192            8          0    29120    messages 
   TABLE DATA                     public       spp_user    false    246   }_      �           0    0    messages_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('messages_id_seq', 1, false);
            public       spp_user    false    245                      0    28710    news 
   TABLE DATA                     public       spp_user    false    195   �_      �           0    0    news_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('news_id_seq', 1, false);
            public       spp_user    false    194            ?          0    29292 #   open_id_authentication_associations 
   TABLE DATA                     public       spp_user    false    253   �_      �           0    0 *   open_id_authentication_associations_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('open_id_authentication_associations_id_seq', 1, false);
            public       spp_user    false    252            A          0    29303    open_id_authentication_nonces 
   TABLE DATA                     public       spp_user    false    255   �_      �           0    0 $   open_id_authentication_nonces_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('open_id_authentication_nonces_id_seq', 1, false);
            public       spp_user    false    254                      0    28746    projects 
   TABLE DATA                     public       spp_user    false    197   �_      �           0    0    projects_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('projects_id_seq', 20, true);
            public       spp_user    false    196            =          0    29218    projects_trackers 
   TABLE DATA                     public       spp_user    false    251   ms                0    28912    queries 
   TABLE DATA                     public       spp_user    false    219   �t      �           0    0    queries_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('queries_id_seq', 1, true);
            public       spp_user    false    218            F          0    29576    queries_roles 
   TABLE DATA                     public       spp_user    false    260   �u                0    28926    repositories 
   TABLE DATA                     public       spp_user    false    221   �u      �           0    0    repositories_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('repositories_id_seq', 1, false);
            public       spp_user    false    220            	          0    28759    roles 
   TABLE DATA                     public       spp_user    false    199   �u      �           0    0    roles_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('roles_id_seq', 5, true);
            public       spp_user    false    198            �
          0    28534    schema_migrations 
   TABLE DATA                     public       spp_user    false    171   x      !          0    28936    settings 
   TABLE DATA                     public       spp_user    false    223   )}      �           0    0    settings_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('settings_id_seq', 26, true);
            public       spp_user    false    222            M          0    103748 
   test_cases 
   TABLE DATA                     public       spp_user    false    267   	�      �           0    0    test_cases_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('test_cases_id_seq', 5, true);
            public       spp_user    false    266            I          0    103720    test_suites 
   TABLE DATA                     public       spp_user    false    263   q�      �           0    0    test_suites_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('test_suites_id_seq', 26, true);
            public       spp_user    false    262            +          0    29035    time_entries 
   TABLE DATA                     public       spp_user    false    233   c�      �           0    0    time_entries_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('time_entries_id_seq', 17, true);
            public       spp_user    false    232                      0    28768    tokens 
   TABLE DATA                     public       spp_user    false    201   ��      �           0    0    tokens_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('tokens_id_seq', 9, true);
            public       spp_user    false    200                      0    28779    trackers 
   TABLE DATA                     public       spp_user    false    203   t�      �           0    0    trackers_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('trackers_id_seq', 6, true);
            public       spp_user    false    202                      0    28869    user_preferences 
   TABLE DATA                     public       spp_user    false    215   &�      �           0    0    user_preferences_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('user_preferences_id_seq', 10, true);
            public       spp_user    false    214                      0    28789    users 
   TABLE DATA                     public       spp_user    false    205   k�      �           0    0    users_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('users_id_seq', 11, true);
            public       spp_user    false    204                      0    28806    versions 
   TABLE DATA                     public       spp_user    false    207   �      �           0    0    versions_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('versions_id_seq', 1, true);
            public       spp_user    false    206            1          0    29079    watchers 
   TABLE DATA                     public       spp_user    false    239   ��      �           0    0    watchers_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('watchers_id_seq', 219, true);
            public       spp_user    false    238            )          0    29010    wiki_content_versions 
   TABLE DATA                     public       spp_user    false    231   �      �           0    0    wiki_content_versions_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('wiki_content_versions_id_seq', 1, false);
            public       spp_user    false    230            '          0    28997    wiki_contents 
   TABLE DATA                     public       spp_user    false    229   �      �           0    0    wiki_contents_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('wiki_contents_id_seq', 1, false);
            public       spp_user    false    228            %          0    28988 
   wiki_pages 
   TABLE DATA                     public       spp_user    false    227   5�      �           0    0    wiki_pages_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('wiki_pages_id_seq', 1, false);
            public       spp_user    false    226            :          0    29157    wiki_redirects 
   TABLE DATA                     public       spp_user    false    248   O�      �           0    0    wiki_redirects_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('wiki_redirects_id_seq', 1, false);
            public       spp_user    false    247            #          0    28978    wikis 
   TABLE DATA                     public       spp_user    false    225   i�      �           0    0    wikis_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('wikis_id_seq', 20, true);
            public       spp_user    false    224                      0    28818 	   workflows 
   TABLE DATA                     public       spp_user    false    209   �      �           0    0    workflows_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('workflows_id_seq', 272, true);
            public       spp_user    false    208            �	           2606    28557    attachments_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.attachments DROP CONSTRAINT attachments_pkey;
       public         spp_user    false    173    173            �	           2606    28571    auth_sources_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.auth_sources DROP CONSTRAINT auth_sources_pkey;
       public         spp_user    false    175    175            Q
           2606    29116    boards_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.boards DROP CONSTRAINT boards_pkey;
       public         spp_user    false    244    244            C
           2606    29067    changes_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.changes DROP CONSTRAINT changes_pkey;
       public         spp_user    false    237    237            <
           2606    29053    changesets_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.changesets DROP CONSTRAINT changesets_pkey;
       public         spp_user    false    235    235            
           2606    28900    comments_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         spp_user    false    217    217            �	           2606    28590    custom_fields_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.custom_fields DROP CONSTRAINT custom_fields_pkey;
       public         spp_user    false    177    177            �	           2606    28614    custom_values_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.custom_values DROP CONSTRAINT custom_values_pkey;
       public         spp_user    false    181    181            �	           2606    28628    documents_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.documents DROP CONSTRAINT documents_pkey;
       public         spp_user    false    183    183            `
           2606    29174    enabled_modules_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.enabled_modules DROP CONSTRAINT enabled_modules_pkey;
       public         spp_user    false    250    250            �	           2606    28639    enumerations_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.enumerations DROP CONSTRAINT enumerations_pkey;
       public         spp_user    false    185    185            �
           2606    103783    execution_environments_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY execution_environments
    ADD CONSTRAINT execution_environments_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.execution_environments DROP CONSTRAINT execution_environments_pkey;
       public         spp_user    false    274    274            
           2606    103775    execution_journals_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY execution_journals
    ADD CONSTRAINT execution_journals_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.execution_journals DROP CONSTRAINT execution_journals_pkey;
       public         spp_user    false    272    272            |
           2606    103766    execution_results_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY execution_results
    ADD CONSTRAINT execution_results_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.execution_results DROP CONSTRAINT execution_results_pkey;
       public         spp_user    false    270    270            u
           2606    103739    execution_suites_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY execution_suites
    ADD CONSTRAINT execution_suites_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.execution_suites DROP CONSTRAINT execution_suites_pkey;
       public         spp_user    false    265    265            �	           2606    28649    issue_categories_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.issue_categories DROP CONSTRAINT issue_categories_pkey;
       public         spp_user    false    187    187            O
           2606    29099    issue_relations_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.issue_relations DROP CONSTRAINT issue_relations_pkey;
       public         spp_user    false    242    242            �	           2606    28677    issue_statuses_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.issue_statuses DROP CONSTRAINT issue_statuses_pkey;
       public         spp_user    false    189    189            �	           2606    28695    issues_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.issues DROP CONSTRAINT issues_pkey;
       public         spp_user    false    191    191            
           2606    28864    journal_details_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.journal_details DROP CONSTRAINT journal_details_pkey;
       public         spp_user    false    213    213            
           2606    28850    journals_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.journals DROP CONSTRAINT journals_pkey;
       public         spp_user    false    211    211            k
           2606    29332    member_roles_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.member_roles DROP CONSTRAINT member_roles_pkey;
       public         spp_user    false    257    257            �	           2606    28707    members_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public         spp_user    false    193    193            Z
           2606    29130    messages_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public         spp_user    false    246    246            �	           2606    28721 	   news_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public         spp_user    false    195    195            e
           2606    29300 (   open_id_authentication_associations_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.open_id_authentication_associations DROP CONSTRAINT open_id_authentication_associations_pkey;
       public         spp_user    false    253    253            g
           2606    29311 "   open_id_authentication_nonces_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.open_id_authentication_nonces DROP CONSTRAINT open_id_authentication_nonces_pkey;
       public         spp_user    false    255    255            �	           2606    28756    projects_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public         spp_user    false    197    197            
           2606    28923    queries_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.queries DROP CONSTRAINT queries_pkey;
       public         spp_user    false    219    219             
           2606    28933    repositories_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.repositories DROP CONSTRAINT repositories_pkey;
       public         spp_user    false    221    221            �	           2606    28765 
   roles_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         spp_user    false    199    199            #
           2606    28945    settings_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public         spp_user    false    223    223            x
           2606    103753    test_cases_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY test_cases
    ADD CONSTRAINT test_cases_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.test_cases DROP CONSTRAINT test_cases_pkey;
       public         spp_user    false    267    267            s
           2606    103725    test_suites_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY test_suites
    ADD CONSTRAINT test_suites_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.test_suites DROP CONSTRAINT test_suites_pkey;
       public         spp_user    false    263    263            9
           2606    29040    time_entries_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.time_entries DROP CONSTRAINT time_entries_pkey;
       public         spp_user    false    233    233            �	           2606    28776    tokens_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public         spp_user    false    201    201            �	           2606    28786    trackers_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trackers DROP CONSTRAINT trackers_pkey;
       public         spp_user    false    203    203            
           2606    28878    user_preferences_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_preferences DROP CONSTRAINT user_preferences_pkey;
       public         spp_user    false    215    215            �	           2606    28803 
   users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         spp_user    false    205    205            
           2606    28814    versions_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.versions DROP CONSTRAINT versions_pkey;
       public         spp_user    false    207    207            H
           2606    29086    watchers_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.watchers DROP CONSTRAINT watchers_pkey;
       public         spp_user    false    239    239            2
           2606    29020    wiki_content_versions_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.wiki_content_versions DROP CONSTRAINT wiki_content_versions_pkey;
       public         spp_user    false    231    231            /
           2606    29006    wiki_contents_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.wiki_contents DROP CONSTRAINT wiki_contents_pkey;
       public         spp_user    false    229    229            *
           2606    28993    wiki_pages_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.wiki_pages DROP CONSTRAINT wiki_pages_pkey;
       public         spp_user    false    227    227            ]
           2606    29165    wiki_redirects_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.wiki_redirects DROP CONSTRAINT wiki_redirects_pkey;
       public         spp_user    false    248    248            %
           2606    28984 
   wikis_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.wikis DROP CONSTRAINT wikis_pkey;
       public         spp_user    false    225    225            	
           2606    28827    workflows_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.workflows DROP CONSTRAINT workflows_pkey;
       public         spp_user    false    209    209            R
           1259    29117    boards_project_id    INDEX     C   CREATE INDEX boards_project_id ON boards USING btree (project_id);
 %   DROP INDEX public.boards_project_id;
       public         spp_user    false    244            m
           1259    29516    changeset_parents_changeset_ids    INDEX     ^   CREATE INDEX changeset_parents_changeset_ids ON changeset_parents USING btree (changeset_id);
 3   DROP INDEX public.changeset_parents_changeset_ids;
       public         spp_user    false    259            n
           1259    29517    changeset_parents_parent_ids    INDEX     X   CREATE INDEX changeset_parents_parent_ids ON changeset_parents USING btree (parent_id);
 0   DROP INDEX public.changeset_parents_parent_ids;
       public         spp_user    false    259            D
           1259    29068    changesets_changeset_id    INDEX     L   CREATE INDEX changesets_changeset_id ON changes USING btree (changeset_id);
 +   DROP INDEX public.changesets_changeset_id;
       public         spp_user    false    237            J
           1259    29090    changesets_issues_ids    INDEX     e   CREATE UNIQUE INDEX changesets_issues_ids ON changesets_issues USING btree (changeset_id, issue_id);
 )   DROP INDEX public.changesets_issues_ids;
       public         spp_user    false    240    240            =
           1259    29265    changesets_repos_rev    INDEX     ^   CREATE UNIQUE INDEX changesets_repos_rev ON changesets USING btree (repository_id, revision);
 (   DROP INDEX public.changesets_repos_rev;
       public         spp_user    false    235    235            >
           1259    29432    changesets_repos_scmid    INDEX     V   CREATE INDEX changesets_repos_scmid ON changesets USING btree (repository_id, scmid);
 *   DROP INDEX public.changesets_repos_scmid;
       public         spp_user    false    235    235            p
           1259    29593    custom_fields_roles_ids    INDEX     k   CREATE UNIQUE INDEX custom_fields_roles_ids ON custom_fields_roles USING btree (custom_field_id, role_id);
 +   DROP INDEX public.custom_fields_roles_ids;
       public         spp_user    false    261    261            �	           1259    29154    custom_values_customized    INDEX     e   CREATE INDEX custom_values_customized ON custom_values USING btree (customized_type, customized_id);
 ,   DROP INDEX public.custom_values_customized;
       public         spp_user    false    181    181            �	           1259    28629    documents_project_id    INDEX     I   CREATE INDEX documents_project_id ON documents USING btree (project_id);
 (   DROP INDEX public.documents_project_id;
       public         spp_user    false    183            a
           1259    29175    enabled_modules_project_id    INDEX     U   CREATE INDEX enabled_modules_project_id ON enabled_modules USING btree (project_id);
 .   DROP INDEX public.enabled_modules_project_id;
       public         spp_user    false    250            z
           1259    103758    execution_suite_test_case_index    INDEX     �   CREATE UNIQUE INDEX execution_suite_test_case_index ON execution_suite_test_case USING btree (execution_suite_id, test_case_id);
 3   DROP INDEX public.execution_suite_test_case_index;
       public         spp_user    false    268    268            l
           1259    29336    groups_users_ids    INDEX     V   CREATE UNIQUE INDEX groups_users_ids ON groups_users USING btree (group_id, user_id);
 $   DROP INDEX public.groups_users_ids;
       public         spp_user    false    258    258            �	           1259    29379    index_attachments_on_author_id    INDEX     T   CREATE INDEX index_attachments_on_author_id ON attachments USING btree (author_id);
 2   DROP INDEX public.index_attachments_on_author_id;
       public         spp_user    false    173            �	           1259    29542 4   index_attachments_on_container_id_and_container_type    INDEX     }   CREATE INDEX index_attachments_on_container_id_and_container_type ON attachments USING btree (container_id, container_type);
 H   DROP INDEX public.index_attachments_on_container_id_and_container_type;
       public         spp_user    false    173    173            �	           1259    29394    index_attachments_on_created_on    INDEX     V   CREATE INDEX index_attachments_on_created_on ON attachments USING btree (created_on);
 3   DROP INDEX public.index_attachments_on_created_on;
       public         spp_user    false    173            �	           1259    29351 !   index_auth_sources_on_id_and_type    INDEX     W   CREATE INDEX index_auth_sources_on_id_and_type ON auth_sources USING btree (id, type);
 5   DROP INDEX public.index_auth_sources_on_id_and_type;
       public         spp_user    false    175    175            S
           1259    29359    index_boards_on_last_message_id    INDEX     V   CREATE INDEX index_boards_on_last_message_id ON boards USING btree (last_message_id);
 3   DROP INDEX public.index_boards_on_last_message_id;
       public         spp_user    false    244            ?
           1259    29389     index_changesets_on_committed_on    INDEX     X   CREATE INDEX index_changesets_on_committed_on ON changesets USING btree (committed_on);
 4   DROP INDEX public.index_changesets_on_committed_on;
       public         spp_user    false    235            @
           1259    29355 !   index_changesets_on_repository_id    INDEX     Z   CREATE INDEX index_changesets_on_repository_id ON changesets USING btree (repository_id);
 5   DROP INDEX public.index_changesets_on_repository_id;
       public         spp_user    false    235            A
           1259    29354    index_changesets_on_user_id    INDEX     N   CREATE INDEX index_changesets_on_user_id ON changesets USING btree (user_id);
 /   DROP INDEX public.index_changesets_on_user_id;
       public         spp_user    false    235            
           1259    29345    index_comments_on_author_id    INDEX     N   CREATE INDEX index_comments_on_author_id ON comments USING btree (author_id);
 /   DROP INDEX public.index_comments_on_author_id;
       public         spp_user    false    217            
           1259    29344 1   index_comments_on_commented_id_and_commented_type    INDEX     w   CREATE INDEX index_comments_on_commented_id_and_commented_type ON comments USING btree (commented_id, commented_type);
 E   DROP INDEX public.index_comments_on_commented_id_and_commented_type;
       public         spp_user    false    217    217            �	           1259    29370 "   index_custom_fields_on_id_and_type    INDEX     Y   CREATE INDEX index_custom_fields_on_id_and_type ON custom_fields USING btree (id, type);
 6   DROP INDEX public.index_custom_fields_on_id_and_type;
       public         spp_user    false    177    177            �	           1259    29573 >   index_custom_fields_projects_on_custom_field_id_and_project_id    INDEX     �   CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON custom_fields_projects USING btree (custom_field_id, project_id);
 R   DROP INDEX public.index_custom_fields_projects_on_custom_field_id_and_project_id;
       public         spp_user    false    178    178            �	           1259    29571 >   index_custom_fields_trackers_on_custom_field_id_and_tracker_id    INDEX     �   CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON custom_fields_trackers USING btree (custom_field_id, tracker_id);
 R   DROP INDEX public.index_custom_fields_trackers_on_custom_field_id_and_tracker_id;
       public         spp_user    false    179    179            �	           1259    29381 &   index_custom_values_on_custom_field_id    INDEX     d   CREATE INDEX index_custom_values_on_custom_field_id ON custom_values USING btree (custom_field_id);
 :   DROP INDEX public.index_custom_values_on_custom_field_id;
       public         spp_user    false    181            �	           1259    29352    index_documents_on_category_id    INDEX     T   CREATE INDEX index_documents_on_category_id ON documents USING btree (category_id);
 2   DROP INDEX public.index_documents_on_category_id;
       public         spp_user    false    183            �	           1259    29395    index_documents_on_created_on    INDEX     R   CREATE INDEX index_documents_on_created_on ON documents USING btree (created_on);
 1   DROP INDEX public.index_documents_on_created_on;
       public         spp_user    false    183            �	           1259    29346 !   index_enumerations_on_id_and_type    INDEX     W   CREATE INDEX index_enumerations_on_id_and_type ON enumerations USING btree (id, type);
 5   DROP INDEX public.index_enumerations_on_id_and_type;
       public         spp_user    false    185    185            �	           1259    29324     index_enumerations_on_project_id    INDEX     X   CREATE INDEX index_enumerations_on_project_id ON enumerations USING btree (project_id);
 4   DROP INDEX public.index_enumerations_on_project_id;
       public         spp_user    false    185            }
           1259    103767    index_execution_results_on_name    INDEX     ]   CREATE UNIQUE INDEX index_execution_results_on_name ON execution_results USING btree (name);
 3   DROP INDEX public.index_execution_results_on_name;
       public         spp_user    false    270            v
           1259    103740 ,   index_execution_suites_on_name_and_parent_id    INDEX     t   CREATE UNIQUE INDEX index_execution_suites_on_name_and_parent_id ON execution_suites USING btree (name, parent_id);
 @   DROP INDEX public.index_execution_suites_on_name_and_parent_id;
       public         spp_user    false    265    265            �	           1259    29356 (   index_issue_categories_on_assigned_to_id    INDEX     h   CREATE INDEX index_issue_categories_on_assigned_to_id ON issue_categories USING btree (assigned_to_id);
 <   DROP INDEX public.index_issue_categories_on_assigned_to_id;
       public         spp_user    false    187            K
           1259    29384 &   index_issue_relations_on_issue_from_id    INDEX     d   CREATE INDEX index_issue_relations_on_issue_from_id ON issue_relations USING btree (issue_from_id);
 :   DROP INDEX public.index_issue_relations_on_issue_from_id;
       public         spp_user    false    242            L
           1259    29518 6   index_issue_relations_on_issue_from_id_and_issue_to_id    INDEX     �   CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON issue_relations USING btree (issue_from_id, issue_to_id);
 J   DROP INDEX public.index_issue_relations_on_issue_from_id_and_issue_to_id;
       public         spp_user    false    242    242            M
           1259    29385 $   index_issue_relations_on_issue_to_id    INDEX     `   CREATE INDEX index_issue_relations_on_issue_to_id ON issue_relations USING btree (issue_to_id);
 8   DROP INDEX public.index_issue_relations_on_issue_to_id;
       public         spp_user    false    242            �	           1259    29420 !   index_issue_statuses_on_is_closed    INDEX     Z   CREATE INDEX index_issue_statuses_on_is_closed ON issue_statuses USING btree (is_closed);
 5   DROP INDEX public.index_issue_statuses_on_is_closed;
       public         spp_user    false    189            �	           1259    29421 "   index_issue_statuses_on_is_default    INDEX     \   CREATE INDEX index_issue_statuses_on_is_default ON issue_statuses USING btree (is_default);
 6   DROP INDEX public.index_issue_statuses_on_is_default;
       public         spp_user    false    189            �	           1259    29419     index_issue_statuses_on_position    INDEX     Z   CREATE INDEX index_issue_statuses_on_position ON issue_statuses USING btree ("position");
 4   DROP INDEX public.index_issue_statuses_on_position;
       public         spp_user    false    189            �	           1259    29363    index_issues_on_assigned_to_id    INDEX     T   CREATE INDEX index_issues_on_assigned_to_id ON issues USING btree (assigned_to_id);
 2   DROP INDEX public.index_issues_on_assigned_to_id;
       public         spp_user    false    191            �	           1259    29367    index_issues_on_author_id    INDEX     J   CREATE INDEX index_issues_on_author_id ON issues USING btree (author_id);
 -   DROP INDEX public.index_issues_on_author_id;
       public         spp_user    false    191            �	           1259    29362    index_issues_on_category_id    INDEX     N   CREATE INDEX index_issues_on_category_id ON issues USING btree (category_id);
 /   DROP INDEX public.index_issues_on_category_id;
       public         spp_user    false    191            �	           1259    29392    index_issues_on_created_on    INDEX     L   CREATE INDEX index_issues_on_created_on ON issues USING btree (created_on);
 .   DROP INDEX public.index_issues_on_created_on;
       public         spp_user    false    191            �	           1259    29364     index_issues_on_fixed_version_id    INDEX     X   CREATE INDEX index_issues_on_fixed_version_id ON issues USING btree (fixed_version_id);
 4   DROP INDEX public.index_issues_on_fixed_version_id;
       public         spp_user    false    191            �	           1259    29366    index_issues_on_priority_id    INDEX     N   CREATE INDEX index_issues_on_priority_id ON issues USING btree (priority_id);
 /   DROP INDEX public.index_issues_on_priority_id;
       public         spp_user    false    191            �	           1259    29433 '   index_issues_on_root_id_and_lft_and_rgt    INDEX     `   CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON issues USING btree (root_id, lft, rgt);
 ;   DROP INDEX public.index_issues_on_root_id_and_lft_and_rgt;
       public         spp_user    false    191    191    191            �	           1259    29361    index_issues_on_status_id    INDEX     J   CREATE INDEX index_issues_on_status_id ON issues USING btree (status_id);
 -   DROP INDEX public.index_issues_on_status_id;
       public         spp_user    false    191            �	           1259    29365    index_issues_on_tracker_id    INDEX     L   CREATE INDEX index_issues_on_tracker_id ON issues USING btree (tracker_id);
 .   DROP INDEX public.index_issues_on_tracker_id;
       public         spp_user    false    191            

           1259    29388    index_journals_on_created_on    INDEX     P   CREATE INDEX index_journals_on_created_on ON journals USING btree (created_on);
 0   DROP INDEX public.index_journals_on_created_on;
       public         spp_user    false    211            
           1259    29383     index_journals_on_journalized_id    INDEX     X   CREATE INDEX index_journals_on_journalized_id ON journals USING btree (journalized_id);
 4   DROP INDEX public.index_journals_on_journalized_id;
       public         spp_user    false    211            
           1259    29382    index_journals_on_user_id    INDEX     J   CREATE INDEX index_journals_on_user_id ON journals USING btree (user_id);
 -   DROP INDEX public.index_journals_on_user_id;
       public         spp_user    false    211            h
           1259    29357    index_member_roles_on_member_id    INDEX     V   CREATE INDEX index_member_roles_on_member_id ON member_roles USING btree (member_id);
 3   DROP INDEX public.index_member_roles_on_member_id;
       public         spp_user    false    257            i
           1259    29358    index_member_roles_on_role_id    INDEX     R   CREATE INDEX index_member_roles_on_role_id ON member_roles USING btree (role_id);
 1   DROP INDEX public.index_member_roles_on_role_id;
       public         spp_user    false    257            �	           1259    29369    index_members_on_project_id    INDEX     N   CREATE INDEX index_members_on_project_id ON members USING btree (project_id);
 /   DROP INDEX public.index_members_on_project_id;
       public         spp_user    false    193            �	           1259    29368    index_members_on_user_id    INDEX     H   CREATE INDEX index_members_on_user_id ON members USING btree (user_id);
 ,   DROP INDEX public.index_members_on_user_id;
       public         spp_user    false    193            �	           1259    29435 '   index_members_on_user_id_and_project_id    INDEX     j   CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON members USING btree (user_id, project_id);
 ;   DROP INDEX public.index_members_on_user_id_and_project_id;
       public         spp_user    false    193    193            T
           1259    29342    index_messages_on_author_id    INDEX     N   CREATE INDEX index_messages_on_author_id ON messages USING btree (author_id);
 /   DROP INDEX public.index_messages_on_author_id;
       public         spp_user    false    246            U
           1259    29391    index_messages_on_created_on    INDEX     P   CREATE INDEX index_messages_on_created_on ON messages USING btree (created_on);
 0   DROP INDEX public.index_messages_on_created_on;
       public         spp_user    false    246            V
           1259    29341    index_messages_on_last_reply_id    INDEX     V   CREATE INDEX index_messages_on_last_reply_id ON messages USING btree (last_reply_id);
 3   DROP INDEX public.index_messages_on_last_reply_id;
       public         spp_user    false    246            �	           1259    29375    index_news_on_author_id    INDEX     F   CREATE INDEX index_news_on_author_id ON news USING btree (author_id);
 +   DROP INDEX public.index_news_on_author_id;
       public         spp_user    false    195            �	           1259    29393    index_news_on_created_on    INDEX     H   CREATE INDEX index_news_on_created_on ON news USING btree (created_on);
 ,   DROP INDEX public.index_news_on_created_on;
       public         spp_user    false    195            �	           1259    29416    index_projects_on_lft    INDEX     B   CREATE INDEX index_projects_on_lft ON projects USING btree (lft);
 )   DROP INDEX public.index_projects_on_lft;
       public         spp_user    false    197            �	           1259    29417    index_projects_on_rgt    INDEX     B   CREATE INDEX index_projects_on_rgt ON projects USING btree (rgt);
 )   DROP INDEX public.index_projects_on_rgt;
       public         spp_user    false    197            
           1259    29371    index_queries_on_project_id    INDEX     N   CREATE INDEX index_queries_on_project_id ON queries USING btree (project_id);
 /   DROP INDEX public.index_queries_on_project_id;
       public         spp_user    false    219            
           1259    29372    index_queries_on_user_id    INDEX     H   CREATE INDEX index_queries_on_user_id ON queries USING btree (user_id);
 ,   DROP INDEX public.index_queries_on_user_id;
       public         spp_user    false    219            
           1259    29343     index_repositories_on_project_id    INDEX     X   CREATE INDEX index_repositories_on_project_id ON repositories USING btree (project_id);
 4   DROP INDEX public.index_repositories_on_project_id;
       public         spp_user    false    221            !
           1259    29418    index_settings_on_name    INDEX     D   CREATE INDEX index_settings_on_name ON settings USING btree (name);
 *   DROP INDEX public.index_settings_on_name;
       public         spp_user    false    223            q
           1259    103726 '   index_test_suites_on_name_and_parent_id    INDEX     j   CREATE UNIQUE INDEX index_test_suites_on_name_and_parent_id ON test_suites USING btree (name, parent_id);
 ;   DROP INDEX public.index_test_suites_on_name_and_parent_id;
       public         spp_user    false    263    263            4
           1259    29373 !   index_time_entries_on_activity_id    INDEX     Z   CREATE INDEX index_time_entries_on_activity_id ON time_entries USING btree (activity_id);
 5   DROP INDEX public.index_time_entries_on_activity_id;
       public         spp_user    false    233            5
           1259    29396     index_time_entries_on_created_on    INDEX     X   CREATE INDEX index_time_entries_on_created_on ON time_entries USING btree (created_on);
 4   DROP INDEX public.index_time_entries_on_created_on;
       public         spp_user    false    233            6
           1259    29374    index_time_entries_on_user_id    INDEX     R   CREATE INDEX index_time_entries_on_user_id ON time_entries USING btree (user_id);
 1   DROP INDEX public.index_time_entries_on_user_id;
       public         spp_user    false    233            �	           1259    29353    index_tokens_on_user_id    INDEX     F   CREATE INDEX index_tokens_on_user_id ON tokens USING btree (user_id);
 +   DROP INDEX public.index_tokens_on_user_id;
       public         spp_user    false    201            
           1259    29360 !   index_user_preferences_on_user_id    INDEX     Z   CREATE INDEX index_user_preferences_on_user_id ON user_preferences USING btree (user_id);
 5   DROP INDEX public.index_user_preferences_on_user_id;
       public         spp_user    false    215            �	           1259    29377    index_users_on_auth_source_id    INDEX     R   CREATE INDEX index_users_on_auth_source_id ON users USING btree (auth_source_id);
 1   DROP INDEX public.index_users_on_auth_source_id;
       public         spp_user    false    205            �	           1259    29376    index_users_on_id_and_type    INDEX     I   CREATE INDEX index_users_on_id_and_type ON users USING btree (id, type);
 .   DROP INDEX public.index_users_on_id_and_type;
       public         spp_user    false    205    205            �	           1259    29486    index_users_on_type    INDEX     >   CREATE INDEX index_users_on_type ON users USING btree (type);
 '   DROP INDEX public.index_users_on_type;
       public         spp_user    false    205             
           1259    29415    index_versions_on_sharing    INDEX     J   CREATE INDEX index_versions_on_sharing ON versions USING btree (sharing);
 -   DROP INDEX public.index_versions_on_sharing;
       public         spp_user    false    207            E
           1259    29349    index_watchers_on_user_id    INDEX     J   CREATE INDEX index_watchers_on_user_id ON watchers USING btree (user_id);
 -   DROP INDEX public.index_watchers_on_user_id;
       public         spp_user    false    239            F
           1259    29350 1   index_watchers_on_watchable_id_and_watchable_type    INDEX     w   CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON watchers USING btree (watchable_id, watchable_type);
 E   DROP INDEX public.index_watchers_on_watchable_id_and_watchable_type;
       public         spp_user    false    239    239            0
           1259    29390 )   index_wiki_content_versions_on_updated_on    INDEX     j   CREATE INDEX index_wiki_content_versions_on_updated_on ON wiki_content_versions USING btree (updated_on);
 =   DROP INDEX public.index_wiki_content_versions_on_updated_on;
       public         spp_user    false    231            ,
           1259    29380     index_wiki_contents_on_author_id    INDEX     X   CREATE INDEX index_wiki_contents_on_author_id ON wiki_contents USING btree (author_id);
 4   DROP INDEX public.index_wiki_contents_on_author_id;
       public         spp_user    false    229            '
           1259    29348    index_wiki_pages_on_parent_id    INDEX     R   CREATE INDEX index_wiki_pages_on_parent_id ON wiki_pages USING btree (parent_id);
 1   DROP INDEX public.index_wiki_pages_on_parent_id;
       public         spp_user    false    227            (
           1259    29347    index_wiki_pages_on_wiki_id    INDEX     N   CREATE INDEX index_wiki_pages_on_wiki_id ON wiki_pages USING btree (wiki_id);
 /   DROP INDEX public.index_wiki_pages_on_wiki_id;
       public         spp_user    false    227            [
           1259    29386    index_wiki_redirects_on_wiki_id    INDEX     V   CREATE INDEX index_wiki_redirects_on_wiki_id ON wiki_redirects USING btree (wiki_id);
 3   DROP INDEX public.index_wiki_redirects_on_wiki_id;
       public         spp_user    false    248            
           1259    29339     index_workflows_on_new_status_id    INDEX     X   CREATE INDEX index_workflows_on_new_status_id ON workflows USING btree (new_status_id);
 4   DROP INDEX public.index_workflows_on_new_status_id;
       public         spp_user    false    209            
           1259    29337     index_workflows_on_old_status_id    INDEX     X   CREATE INDEX index_workflows_on_old_status_id ON workflows USING btree (old_status_id);
 4   DROP INDEX public.index_workflows_on_old_status_id;
       public         spp_user    false    209            
           1259    29338    index_workflows_on_role_id    INDEX     L   CREATE INDEX index_workflows_on_role_id ON workflows USING btree (role_id);
 .   DROP INDEX public.index_workflows_on_role_id;
       public         spp_user    false    209            �	           1259    28650    issue_categories_project_id    INDEX     W   CREATE INDEX issue_categories_project_id ON issue_categories USING btree (project_id);
 /   DROP INDEX public.issue_categories_project_id;
       public         spp_user    false    187            �	           1259    28696    issues_project_id    INDEX     C   CREATE INDEX issues_project_id ON issues USING btree (project_id);
 %   DROP INDEX public.issues_project_id;
       public         spp_user    false    191            
           1259    28866    journal_details_journal_id    INDEX     U   CREATE INDEX journal_details_journal_id ON journal_details USING btree (journal_id);
 .   DROP INDEX public.journal_details_journal_id;
       public         spp_user    false    213            
           1259    28865    journals_journalized_id    INDEX     a   CREATE INDEX journals_journalized_id ON journals USING btree (journalized_id, journalized_type);
 +   DROP INDEX public.journals_journalized_id;
       public         spp_user    false    211    211            W
           1259    29131    messages_board_id    INDEX     C   CREATE INDEX messages_board_id ON messages USING btree (board_id);
 %   DROP INDEX public.messages_board_id;
       public         spp_user    false    246            X
           1259    29132    messages_parent_id    INDEX     E   CREATE INDEX messages_parent_id ON messages USING btree (parent_id);
 &   DROP INDEX public.messages_parent_id;
       public         spp_user    false    246            �	           1259    28722    news_project_id    INDEX     ?   CREATE INDEX news_project_id ON news USING btree (project_id);
 #   DROP INDEX public.news_project_id;
       public         spp_user    false    195            b
           1259    29223    projects_trackers_project_id    INDEX     Y   CREATE INDEX projects_trackers_project_id ON projects_trackers USING btree (project_id);
 0   DROP INDEX public.projects_trackers_project_id;
       public         spp_user    false    251            c
           1259    29316    projects_trackers_unique    INDEX     h   CREATE UNIQUE INDEX projects_trackers_unique ON projects_trackers USING btree (project_id, tracker_id);
 ,   DROP INDEX public.projects_trackers_unique;
       public         spp_user    false    251    251            o
           1259    29579    queries_roles_ids    INDEX     X   CREATE UNIQUE INDEX queries_roles_ids ON queries_roles USING btree (query_id, role_id);
 %   DROP INDEX public.queries_roles_ids;
       public         spp_user    false    260    260            y
           1259    103754    test_suite_test_case_index    INDEX     d   CREATE UNIQUE INDEX test_suite_test_case_index ON test_cases USING btree (test_suite_id, issue_id);
 .   DROP INDEX public.test_suite_test_case_index;
       public         spp_user    false    267    267            7
           1259    29042    time_entries_issue_id    INDEX     K   CREATE INDEX time_entries_issue_id ON time_entries USING btree (issue_id);
 )   DROP INDEX public.time_entries_issue_id;
       public         spp_user    false    233            :
           1259    29041    time_entries_project_id    INDEX     O   CREATE INDEX time_entries_project_id ON time_entries USING btree (project_id);
 +   DROP INDEX public.time_entries_project_id;
       public         spp_user    false    233            �	           1259    29560    tokens_value    INDEX     @   CREATE UNIQUE INDEX tokens_value ON tokens USING btree (value);
     DROP INDEX public.tokens_value;
       public         spp_user    false    201            �	           1259    28537    unique_schema_migrations    INDEX     Y   CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);
 ,   DROP INDEX public.unique_schema_migrations;
       public         spp_user    false    171            
           1259    28815    versions_project_id    INDEX     G   CREATE INDEX versions_project_id ON versions USING btree (project_id);
 '   DROP INDEX public.versions_project_id;
       public         spp_user    false    207            I
           1259    29315    watchers_user_id_type    INDEX     V   CREATE INDEX watchers_user_id_type ON watchers USING btree (user_id, watchable_type);
 )   DROP INDEX public.watchers_user_id_type;
       public         spp_user    false    239    239            3
           1259    29021    wiki_content_versions_wcid    INDEX     `   CREATE INDEX wiki_content_versions_wcid ON wiki_content_versions USING btree (wiki_content_id);
 .   DROP INDEX public.wiki_content_versions_wcid;
       public         spp_user    false    231            -
           1259    29007    wiki_contents_page_id    INDEX     K   CREATE INDEX wiki_contents_page_id ON wiki_contents USING btree (page_id);
 )   DROP INDEX public.wiki_contents_page_id;
       public         spp_user    false    229            +
           1259    28994    wiki_pages_wiki_id_title    INDEX     R   CREATE INDEX wiki_pages_wiki_id_title ON wiki_pages USING btree (wiki_id, title);
 ,   DROP INDEX public.wiki_pages_wiki_id_title;
       public         spp_user    false    227    227            ^
           1259    29166    wiki_redirects_wiki_id_title    INDEX     Z   CREATE INDEX wiki_redirects_wiki_id_title ON wiki_redirects USING btree (wiki_id, title);
 0   DROP INDEX public.wiki_redirects_wiki_id_title;
       public         spp_user    false    248    248            &
           1259    28985    wikis_project_id    INDEX     A   CREATE INDEX wikis_project_id ON wikis USING btree (project_id);
 $   DROP INDEX public.wikis_project_id;
       public         spp_user    false    225            
           1259    29244    wkfs_role_tracker_old_status    INDEX     i   CREATE INDEX wkfs_role_tracker_old_status ON workflows USING btree (role_id, tracker_id, old_status_id);
 0   DROP INDEX public.wkfs_role_tracker_old_status;
       public         spp_user    false    209    209    209            �
   �  x����N#G���)��`�U]�]=�"
H�D�nnG}ܵb�-o�2�`�ÒX�%[����ס�/��>~��/?����<���f>��>��|v��q�=8������a���W|�M'wݡ�w��w�~�xd������$��Gb���_8�`��.c��|q�G��D[#�`�bʒqM�x4��wVW�:1t�����}��򅒳���S��.����v�}�����Kw1��k9�q�/��~�p�NT�j~��ؗ��m�c�0�>@/�ds�@�Q�Sc�����d]li;�0z4΢_�����Wş��C���8��O��k�����ߦ�Wk4�06hBͷ U
�
���TnK�<��r^�zEu���X��N�٠bC�lΛ��t`��78�@�X�[�	���\h�и� -sPl�P+� ��6p�$J̐�Z`����jR�����W<#ȚxGv)>�$�`��}/�D�� ��]ⵀ@4��!^��*��9�N����b����0�D0B,�R����dS������e�e�)�D�戒W���2�]F�s�E��h�4��􋆵���iƋ��
ܧ������p�;�1P �l��O�yO��_�I8ꑭ����'蟽��`�w�����,����1N�|l�����V+�1I��`����bf&��ƃ=�>h�e�f��㼎D�k`d̸s��i!M�\�{MjH⒉ވ�(n;F���Ƌe܃��O��M�=���1P	�Y�Kt�JӼ	�@P��^v�+��>�R��9PŇ�tnהAD�j;RS�;,��Ju{q*�}3��o�tRV�;Եɴ��ie,Vmљ������n0��}u����6.����gac5o}&u7h��.f+J�qS؇YO��q	;���uK�a���u�q�Nj��E���$�D�1Hu�;	�V�<a�"U`yh�AXg��<�Z�������f҄����J1Ɗv��waY�57��Ç}���      �
   
   x���          6   
   x���          /   
   x���          E   
   x���          -   
   x���          2   
   x���             
   x���          �
   
   x���          �
   
   x���          G   
   x���          �
   
   x���          �
   
   x���          �
   
   x���          <   e  x���1��V��~�vv ��{u��H���Bp vҚ���ޝ5������ɧ&ݜ/�J����t�ܽ���w�?�~{8�>?�������ۿ~���wn�����zs|yy=|:?��O_������q��||��������d�d�t��x8���Zt_����6=��o�k�%�����������k�������\#��=N���St_w�����R��J(Q�fB���	s4�PhZK�G�L�%+�(���F宥L�Yk)����;�D�ZK�;k)s4�ZJ��ZK�9k)K4�Zʈ�[KY�r�R�謵��Z��Zj�:�	�;k�s4�Zj��ZK�9k�K4�Z��[K]�r�2O�Yk�/ki��%��Z��ub����2����="g-����yD�e^�r�Ҧ謵��Zzz-�D�ZK�;kis4��Eh�������%-mD魥�Q�k�St�Z�e-Kz-�D�ZK�;k�s4�Zz����9k�K4�Z���[K_�rײL�YkY.k�,%��Z����e��^��"�ֲ���%-ˈ�[˲F�eL�Yk���鵌uj-�F�e���k-Bk-�G�e,�$�eD�e�Q�kY�謵�R�)=��lyj/k�jg0�E�bֶ��d־U�f�e��ѬcKM�[��g�i+=����<�2���a�T���i�*즶��M}�,����J��4�ք�i�:{A�Jo�z�����j�s��|%���W拏�R_l�����_�/	�����_�������< #&M�Ȁq)0)F��H�q)Y09F���ȃɀ0alF&L��
�fa�¸0�d�#��a�ø<�|�#!�'bd�d�)16#'&�H�IS1�b\,FZL���c�1c\2FfL���1rc2p�������c�Ǥ��1. #A&E�Ȑ�)2.##G&�H��)Y2LF����ȓɃ2eҤ�L��*�be��ذ�d���-��e�����|�0#a�&fd��)3ifFΌ�H�IQ3�fllFڌ��țɁ3g|rF�L��:c�3rg����4=#{��g�Ϥ��36@#��%hd��)4>C#�&�H��)Yt�[4���h����h��%��ȣ������H�KN�I���I��I�t��I����LXv      �
     x���Kk�0������^�{�SY�t���&Q�CvZ��t�a/�vF��ϲ����dYQn�^
/�q�u�W�Mnf,��!�1Z�r@�̹�QZ��H%�=��*��1V� ���e�]Rpj/,j��ϴI;ѫ0KB�O�툔����MI�bN��`<��%<H��ZC#��-F{B��v����T6�T��֟�G:Lk�w�C�w,���a��d���d�m�RjH����r�׍�ZN�=(��?>�RE��$�      T   �   x���v
Q���WH�HM.-��ϋO�+�,���M�+)Vs�	uV�0�QPwIMK,�)QG0����4��<�7�hRxf^J~y1�5#ʥ�jN���jA����jI��$��ЀC�H4��4eJ��F��CcbL�? .,�      R   
   x���          P   l   x���v
Q���WH�HM.-��ϋ/J-.�))Vs�	uV�0�QPH,.NMQ�Q���Ѵ��$J�P�[bf�:��:�r�I�j
��_��X�91)'a  ,Jw      N   
   x���          K   �   x���v
Q���WH�HM.-��ϋ/.�,I-Vs�	uV�0�QP��/Q�Q����Q04Ӵ��$F��z1�Z��C�9�zM0�Z��]/�N6C�jd@�^s'���]/�!e���;�#v�z�� .��m      D   
   x���          �
   j   x���v
Q���W�,..M�ON,IM�/�L-Vs�	uV�0�Q "u������L�dI������5�'1�u�x9��:E�8F����x ������ d�(      4   
   x���          �
   �   x��л
�@�>_1]Ҙga%!�B�H���(j0����;Ġ���Lq�{�,��!��D�H�j"$8��*)`�q����8�=�j�x�YVi��Z��!p�ˈD?kY�	�1�#�;M�L$��=b���]�|)`)��?��0�	��n�*
M�����P��,�J���l��            x��][s�8�~OU�Kc'��uٗ�m9Q�my%��yR�m�"�Q��������83�[5ӳ�m$ �|����?�8������r��������9��N�t�M�h|�?�.����Q�l��������[��9��\�^��G�������wF��d4�Ϗ��}��\g+�t�ϝ�t�cz�>eN�d��f�b�\;���]�r߿��1p{��/�3g��}����l�nZ^p��b��;w�3\.^���!_����7,�56��E������9���bz����̮$Æ���H�d�1N���,[8��,[;��������g�:/���={�f?�:]���j�_ee�>d�W����%��ͻ'�MS�M8g�Q��;X����K�oؙ�l�5$9
<?:��w�V���FQ��DG��V�Oܶ$q���o^e4J
����_?�ǻA=�y������`x=^Loz߯�ד�8�y�N��>����,�k�9H]�f����r����e��̦7,�k�!�9s�Ｕ�Y�l�ɣ������7�X?�eW:ʳ���ӿ��f�Ƹ_O]�t�&�3���:�����w�Y�LWy�=y��w�ӟ�C�Μu�L�r�7��
�n�����n�y��w�{��� 	���:_>��e����&x�y*`Dc${��t��L�!���q��@�������3/�w�?}�
�6����l�������U�0w��FY�Y��*sA��O8U��	iZ�2>���^؍B7L�(����x��w����c�ki�Vɒ�!t�G������%���~�h�����5�ڻvz��&�ʙ�~���K�%Y�?�\��?S:&;�m,i-9g-�Xսf<eU<�r�� (���Y����cd��"_��ɓ�c�Xg]6;��U�~u�6%��`} �K��o`t��<[���DN��L���u":$������!{�*]��?��b���� I#.#�=��bA���{?aRʙE��e�FV��B��oA����4��0��m7�:-�nC�iw#���j���Pj N�$��閒:������w������������Ǐ*��	�>�8�Ǐ.�<����"]�������g�x�({.V�t㉦����T.��B��!ό�
.B	��9�W��z��(s��}��S�u�_'z���ߎx�IWaR_�I������t%6Z����.uc��aˋ����A���n��-�K�0�%hh��&����R萮���n.�����zc�dN������-��wN��`q�%[f+|���I�
��D�{�Xp06��)I����9^6aw�y�K�@��Smh���K��bXg��<�Y����G?60�h����WC��9��K��4�w�<G��P����t�O�#��PR�C���>���s=��"p���N<�f	B���Fa�S����h��9��P��]�^N7�}*����J6��~'p���n��hTΐ?�mV%��
��*,�
V5^d�3d˥HYq㛥	I�98b�N> u�\����Ș��0�֚np��b�l]���n'IT�A�	�u�s;~�: g�&j�}�S蝝oa'+:����n�����}u8��FU��J�iK<�LrK�>�ϳżt��
n@$5�嬇y�U�
�}V,�s�x����8�NI>=�z��"���s*�*� ?q"H~�`�G����uOjU��e��MF^맳GI�.Q�t�@)���Z`BT��9�MB���Gl�QǱt����ķ��.����S1�,(VOG�k���ޕ40�b��zȢ����9]R�,���
ޣC��� �5��V��k�J�L�~�ЇP�� ��)�J��?J���L�L2�s@����eIxÿ*�ӈ��ǖ� ,6 !��=A����9k~Y�g�u�,��9,��:�1|̶	���[��xn��x+����n�k{�ZG{ݘ�l?��8��8��UKW;h�Ei:��+gdz3��M|}0�ҩ&T��lˆ0"�,�A;�����+����Q�p��</�;� |)S���憘��e3�<��f���3:����~܎����m���:\3
��e���>g#�L8�a��6Ҩ����Hԋ�/��6�7�Kځ�oۖ/:\��m�8ǽ����t���;-n�u*S٢�Ik��#�@kO�|���3��էu�7�^�7����0��OU`�+�I��b��Q=��5�赴K7kj�)�2�[�%�b�t�%�5�V�.���,�@���_�
pW��J{a��@�� i��X�e}�u���ŀ!��i�jm;�����*y�L����*Qn���|�`��#��	������Ћ2�>�h�,���T�⾞e+��K��kd�Nb�+�^)�'*�V49���h<�Ti̦�����L���W��Mt��p�5�[~z7hӈ��8t}��m�}�5P�����(��z����r���j�b��!���J��8��ƫz!��ش$C�߈E���i�
�DW�"�d=a���$Q�Ti��\L�ж�vHb�+�:�����XC&ؤ
�V��$�m@n��B��G�kl(Nt�����Z��$��'�	M����`�l����w�R�������,se LA�l�d�ɸW�x�����H�|dx�H��㨤x*�V����G/I�V�w�L(l��u�Vб�CiuO�����Sm;��1���eb��)64/F*���@i@!R!��J1@4)�pϭ��ޠX�9<���eU�!aw��{7՟���Lc���`x����tG�'S�U�*/�GX<���^��������0U�Ӵ������h��r�9ΞB����/�J&θ��嬮թ��m{�ն��9�WӃ�n�q�ji9hU��F��u��J#�f��6Oz���p4�f?�?�>�����v��l�R��;j�Yw�;7��sOo`������ܒ����`�٬v��x�c0x�~�t��R|��ۜ���	��rZ{�ȳ��cb���ʣ#���t��
���7�b�gBTiH�wW�Z=���
���7[Vc�p�P[��a^�u�0��D?I�<,��Y�j��6p���M�PEs�Q��ل��J�a8B)����-sf�"gd�r�s���LaB���|&Vѱ�#Q�*�K��S���Z�p$cQ^��;�K��Z=����ؗ���B���RF��r��<�T�<���;n^��8�l��q��f���OЏ֠�)��.*��@&
�`u1��w
���ga-�`����i*!,o�,�5�:�	Is U<�Фx���������)�ű�Y�3���rUU$Zv�\/���\>�i-�;��A�ج�G��8SrG�L�KT���
:�����ǉ���%'AL�`�����
"]��T��FU����%�]���������}�]��l>�xA"q���t5�4���rEMf��E�����\@ߥ\�4U;曱����g���B���S���]�QG�/�|�!Mf��?��'}�M�v�\iXw���a��|tt2�5;�{H�QG�#�^,���?�d.�����ŉ�.4��4�·��8@�-��տH��J}u/��+�c���Sf�����_�Tˣ��\)��i��J��f%����s�&���q�=�@��b?�l2\n���]��a���X���n�A�ǺF����M�p�؉����g�>��x�ޗ�����E�o��� jg��w�F���|��y�+���D��@�b�D�p�����+	$�; ���� n
���Rp�1��>���(ĘΙjɱ��� %�9CCR���/�})5q�z,�G�n�$�P�n6*61㶾vh�-E2�O���Ѫ�΅n�������z�q�;J�7ȶ��[��'�}���x��v��-��� ��=]-a2?R��V�������d(rQ��'��t�3�k���h��� gy���F�R�O$��WA����6i�����3]���ij�<������^��ʗ�u&��T�p}+����$�����+ h"�`\    �Joճ�[�K�z��~෴0�]���p�v��3y3��#���G���_q(�gR���"�J w�&mOkq[����3,)D9����I�Vi׉Zz@IP��﷕�k��Ɲn�q�a�rz+zdT�C����\�Ź\�������}�7�|�}������萓��C�/p(	�g���C�'�Gc���Z0 =N��z���D~�q8k�]��툦�u�	��������Ck�L�B�(H׎�:!\���

���T/a����FB�x�D�����>���i�\-]%���is�~*�C����	w�	�7i~���jc|�+`Z�j̶N}���G�Q��h�G��&P�k�Bh�{���7ӗYN���;7����0�Z~p�{g�rf�3zV� pr��|Jtd�{]�G.������:�	;�;�� _�Dp�dG���f�@?EA?�}:f�Ɗ٦��f?�bS������|��9#Gm�X�Oa�N�LʼZ~ۭ�
�GdS_]���R)�-t��>s������?���*�m�%�z�s����|�ɯ��v#p#R,I�C�zǍ���d���)�4����I�뭡5)�6�����ޑ���+��{=�8$#�wzIsdH�����'��c��w���-q�y�mX3��W�;��:į�wV�|j�.q
��/Gb���E�ak\C�ƪ��A���x�&���1��v��&��^��2|�w~>�]�]��������若�7-߸��-Ԟ���Z��J���LkK8}���q��0�&5Z�c���LՀ��.�Ͱ_1oi�Vf�w}�Ez覊�N� r-A�����G�O-�{%��E̡V�BR�������=H6!U��ݎ�Fkl%��H�jo;�����qڿ�r�Io4���N����Y}ȵN�)�ї�V��BPA��@��%��*��"{԰p��� Y�X�� PA�J��|U�`�j����NO�薏\�T�	�k]:�'��1��������d��"�H��А
�ƿ%�[�_д�������X7Q��i�izq\���.�v��|!�Я����,�I����TO:�d����ᘴ�+��b�d�i�yZ��j�/g� _���dՒ!�/W)R1f�}��@��oy��|w &a��tÎ�xA�U�-�i#�k�^�a�xb�� �|�z>�����>_1ςTH64��������e�]�c���<p��]�K�cS@�b�X�s�c�Z�?�#s�6�,�|���	v{A�֫9ё��a]� <Wn�q����� 0��Fq����֪w(0��ɍ����ϟ�W͍����N7����������z)f�ܗ�l������>}��eސ�A[ì1����@�n�"JC��Y�aZ�(JA��f5U�U��ϯ+�#�E4=)<��09���^�J,��6v�V;�$;���hӀe�b������������G'E���G�jx���Vvc&vC��ף0���r��B��g�h���R�~ �ӫ��ฮ�<h�A�ӌ�"M���Zn�o�uC�o������z۱�-�;�<�*�)!�9v&,{��������������<�X�sWo)��_�����޷��[��表PF�+gFcV`S������2�~NL��-��@�[X6��/��o�F+�ќh��2V�pN�?��b^й��E�?4o&�De*j�����^1����v��)�͝�m���b*��6u-5�x��-6sŮ687#��e|��"j�Ă�+e3�P���+l_z�;,s/�Z��bW+e��y�?�.8<(%h+VTf��Ry���s��%U�1�[S�R[��o��ʗw�T��UM����X�	���w��^+�D��J���G+���}�I���7:�B��Զ��.ϏNVЉ����? Z�[WJP�oМ���w,�W����Ac��g�f�7p� `�,
&�_ �~��n�!ƪ.��2V�$ ڢ�e�6;'I:T�˴A��4{�"|��#C�����k0�M��2`����
��۠`�!���k�Z��R���j�%W�Bc+�S�e��>1�
Z�� :�zw��LY`>c��:	Y-��}wm����0�h;�t��u��x�D���}߱��C�4~IK}U�r����bo�+�R��[�b�fuyi��7$���7�4+�!@��I�#�?a'�6K�<BJ�fe��`˱֛6�g!5$d۵1*gR6gћ�Uoe}�4�gG������a+���c�8a���2�J�;���9t��7�3vm�xPn�93�n�M�w���s�5�(���O��K=@�΋m�4<��T�f;���R��%vF[�~�<} ]Q�q�bW�}����2A�կ������]��̅Ág�d�*E���Á�r���(�����o��[��.��Ls.��4� lV����{R��m|=�kK����g��']P�Y�
�LT�p�e�ɿ�p��2I�Ӎ^��tn�sR<|5{���_f^�]cFQ<�t%ll� i�$�F��My]	mR�II��
u�mu^;�zU��?F��:�D?+�,��VK_;�P�j(x�����]m�A��i�_��;z�+��4�}D6�D3E���=�ǌdۈ�?1��I��j�j���B#��F�����Z��jt������
>���C�[ɟ$��x��1��!��v���oL��,��#���]��V�kZח�'��5e�"��d�}����O������N@*n�}�5��������U��U�`�.�P�aL��?�(xn����9��y�n�T}͋�,�=R��q:4���%��B�FEb�}ZC��� �����u+Mݦu�pP��v�E��w�Z�`I�n]e�R�z�r=&%%ƍ��Q		�@*�:�Q�Qa��V�`8�;D	#���ͥ�嵰���q�
!'f��<�Qd�J�|�)A�o7��Ͳ!��@����g9_����2DH���2��cq�b	��3�!����a�~t�P �ڀ�;�@���� k���E9)�5����/�����ڈ;6�fԛĽ�)WE��$���_�md�-��sG���k'�ٓ�4��Q�:�Y�fGk��c3�n��I�/ДfZxUKF�#�� oS��_�Vr�T~�p�$iޤ��M==���8��,�s��g�8�#�j��u j�Ӝ����)�������5��ȭ��{���=�KaOg��R����E\���g���hD�Jʇ"��wMU���j9����*tQM�^��|��薿ϗ@����X+�}=	��"�d�w��9	�'��	�zm��[#4W1B�m�b��@侑P6	&��U`��j6a>��'aʁ�w�]�A���`*�;u+������2#uAcY1b�L����hI�>�⼘i5��%��ĈV�KppR�k�>�RQh�� �=��G�V �p�6%�E�Fn�>�w��q#	V� �2�o��b�|ڮJ\�T�f}��4��*q��?����z9h� R������p��ME)�W-��+5���f�R�]OI���=�Or,��6���¤A�^���Ȉ�!l�@�ơ�J�V�><j(
e%���ŀ\%�v���h�� �1�fph���l���������"�}B���\��O��ti�1�GtF�M钾݅���\�O�xګT���5SbN�R*��:���.	�dވQ��=V�3XA����`�g��/O]�p�|y"�̾�
�{��C�%q�e:q��m'Ǩ,'��Y
|�~ ��Y�~RB0J��F1��ȋ�X�h�YBb�:Q�׫|ت8~�C�ɸ���+4x�KQ鋘+�ڷ��\�׏�t��Czc�C���0�J�U��ܧ��1 N�Rb��Aܓb��'ӭҩZ�1/��%	�lV��z�Yέ�m�2�
�`n�G�Z&��g���(q�v�R/s���_B��R"K�8g_�g��ZXeh�'ݪ��Jp�'Kt���.�VU3M�8�yAN������v`h�U�
��o�r�x�/����8�u��g�,[�.�|�� �  ��lK����]�����ͥQ �!S!��w�򚟕"���ֺL!tD���TJ����h��(�ZQ��������EQ %�(����U��v~߻�4m����wH����&ľ2hE�)�y��1��R�K��f�&U��&sl�o����B�WCz*Ѐn�8���"��j��V%}HI�P���b�~8����^���*�c�e<�`�� �
�����2��#Jk�8g&{*i�X>����	�l )ef�s�TY1�T|�c�z%
�6�!�a�ҥw�;V��j�ߎ�F��5e/:���"7k����ĝGbx�FI����٣�V��ɮ�Â��cAK�yEȞR����L�)v�SM*�īfh�zJL�$Z��H,�4@n��Cš�D�`��j���'T�f�L�w��4��P)j��o��ԕ�C�	.a"hE_6�ߞq����g����B�'�(R� Nx��Z�<���&.D��f���"����`�LK��Lm��j���8�#J"
�E�~�zOJ�݃���u��vn�����(�*�G�Z4�7��r��=��@��;��`�۶,���/�����������O����0Ci��!bR�v:�����o�Z���~��>)�2u�]�Z`��|�Pa��D�JѨ�M�4UBk&.�͋6.���ɧ�Y~sr��XO�Bw���6�A��l�!�+�r�e��Dl��v�kcy?��@��� &w�Ea�z�CU��g�W:�!�={Q����B����d8�c���U��}��9^Ozg����x�'=g�������
�յ����趏m_��a{���Kx��׏�g6�z���0^5��Mm�߹�{���?�٢�v��.���j3���⒜a#��k�M����&Z{��~؂�u:'^�$��9b�5� ��fV�����B@ ��>��Uuu�����q��-P�
�i�����2�O����T%��Č��q��JT����D��Z.���O]5��jAɇG�ǲ殈{2�p9�Oz�˱c�gJ��(�`�#ʫ.f�}܊!�Eʢ�,���6��G�<)��2ʇ��4!���+���R�v��]��EM�Z�X@�uX>��!S�L7��9]/ef��D�0)#���˵T�"�4M���qZ�s]mTv2�EQk�M�O.'�#��wb]��j��7d}z��	�������^[�_r-�o���{�	�Z���K#K��,	]ϢU?5�Ի(�bDJ�@��/��1�h���
]�!�@����bq24͌�+�S�|$�36-�~�*܈�Q�^@��y~k����醱�j���z�An�5p����*4�+�<����C�Z�{�ε%{'6��ژU���cQ�z����[��G�|M"�����vS�����#�L0o�^��IBI��~vDTT�3�R�)���e��<�k��g�<%Ἢ��$�/�����8�8����Y6�T4��l/�}�ճV4��'J���+�*(�wٮ����B`8��d��:1L�\��1Y?�2�W�'�<���U���L�w��g���v�2��ϹJ�B��-N_+䀰/��dXg#�w�#��-U��������nѳ��.3G� 8Z�.�q�P�M)�40��if[3k���>����A��v8�IXHM�qAI���n�B���(ʄAR��q�����{�L��4	\����a�4�]6��ͳ1k���L.3L?|"��jk1����������=�d��EY�)ǿ���iS��ō�*���+cʤ]��(�]�)K��X���*k�u�̂�}��7|����&%e��Uk	�MQX���_�xv�hE��X�� �����Ҧ}���S0@�� �P�P9�<d9���.1Q�C̭�팂+R+�1�$1Oo�>��s[a�p�r~��
�m��^�����+������v��}CW?��L���l�Z)���Q��i5B�%{ ��]�Ah�r)�ͮ/��5���LW�m��Y�6��$Q�x'49��\�d�H�j)��Ά���k�l�%�ߋ��&��M�i�[�� /�N���/�~��4Q{	-R�s�K���.4��5�-����m�V��<��*�fq������%r�`W4��~|����`�>�x��\��E�7�AK�]_
�w��2`��]��K�?��n� /�N�A�s^�W�H���ꗄ�	LAR���3�T�ń~�SS�L\��W�5֟l����b�p��;!Q���wO��:%�2
-��k����_G���C����q�ۭ}"S0�n��0E1�9^�S�B�H�f���X|$9�a2�PP���R�b횰��~li1����̓rZ��cАi���cഐ�G��yB�^�eP����!��v��	�Ja��i�%PDD'PFQUo�
�(k�r���z�%b8~CƮ��W��B]���D��ݾf��9�����;U�dN��ld��L��&�D��V���S��,)��(a�1[.�� 1��W� ���������녝��d�¨�0t��봪y5U7���Q'�t����+��|�[W��B��-B�ex���X��=�����/�.�ʽ�	�x��7�C��zT�^*�D\�WL��'MrJi�o��\��;�J�-l�jjӘ!��w+f�Lsqӷ��%Z��?Oa��|��W�Uk�ǥ0�Eg{D�ߨ����y�:>/�X�;̉`��g�;	&����J6�m6��{mz��n�� �$�Z��ɏQ ���I"/1ąEAz�1��b|�cX V�J"�gǒ�PN���*H8����Q���X�����Y��VF�����8�k�!ע��W��;�f8K!��@o�cfAr ���5��3��K\�H_ۈe���]V�z����D5B�%3�n��	V^��J,xO�0~�S5 h��j�-v: �*�ػ���E��;D�%|eDz���r�J�w�aB������x���<��[-L�&(�ݻ��-K         
  x��[_o�J���0��M�ks��x����M�I�:��>Y�l0X�����9c��fWZ5j�Ɔ�͙�sW7���[rus���;��!�O�$����n� �i���9K���Oc�>�x�{���/����zWPf��(�$�CȽe��n��s�ޒų��j�;7����dX��v|鱔	3tjtk`8��v2IY�K��3e�F⢐/c��~���˂��Į#K�l(����H��^��vB
:;ޣ1w��a��-���Mw�.a���ɚ���A{
�'�M��&]�H�2OR��-װ"9�M5y�q8'<��X��K5/r�*H�ޠ�	S�CZt
uV7��~��*�]��B-uz	��.���`1�n������2��+2gè`u�⤎"��8�w:G�	V@k�!O%H֠��1�`u��W�0@�FcV�R�M�ќ@[g�b/O����B���#�n��4����mh��sAʞ4?������>~4���wI�9g?8���#^0���f_��g�B�L=o)�&���P�mQ*VdH隓�vG��G�<M��!!�(&��,��X��A|�@<�����2�g����q���������̞\�R�=�=L����o�� F�^�4����(�@'6���m1Oܵ`��s�C��QyCXv��Γ]�N.��ǽ�?�(�O�C�k���ޓ�(哌�؏b?}&׻$%��̐�[�߅)k��[�����Ŭ�vpʦU��������0T�۹f#Pm~���#Pm�n�4���[��N��d-�J`�pkA 2�n�i��f�i��ⷅ�5	|1�z�P,��E(�S�8=!U�H�VJˮ���^LK���^d*Á!O�S� ��^%�W�X-y�:D�QT4���t���!J�������C1F�O&���+�����X�OdY�1@^"@���TbeV�צ�"��Y���j�5�8��}��G�-u�Ɗ��=�`u��}J�_�r$?��w�%�Ks6,r�K��Gh<�J[#4ul���ȃ��
V�F��FV�cT�7��=�Vw^�B�>�@v=/h�X���:b\��VYŎ˸��%[0)�K�����y�+�&
���b�6�yː�\�M�=�	K�J���O��w�P;V
�W/v�˓�.��E�1����EZ�(=�A�ԗ,e�.���7�l��sr�6��,Y3Xv�Ő� 4��A�e�������I^��G�Z�?
@>O^^Jf�0=Vq���/,�|�y�py��˄Lw��g���C��dp��%)m�(����#�'��.�ZT�~S��ͱa�D	m���@6����7��=�W)���o�����?�_�˶�,�m���X:��?�#e�$��;7�����ϳާ���zB>���~5MSzX=#�5$��qB.�D%�y��\��ݗLZs���e��;y,j���녷>��BE�5��}�p���r:a�]ؿ�F��dF�H�)�~���R�7[x�KSQ�kW�������\�	y���m=��������s�ݡ�I�	5�Z�-B�ת�AE������Ț��wƐ�#��8}���^�Xҁ�E�2e��/i�sJ���#� `3�7��5�0��$�u{�
�$̓)-� �+z<�8�0V�0��Nm�F�T~j���~�	�q5�)�?8�����'1�q8^����/�Q�J� !��������e�Z~�����N��HhX���KL�	Z��� ���:��5��p���*�t�H[������Az�9��޶�8��ˌ(�k���E�x�2�y�
�StJ	q1
��?}�7~ ���qk��]��/�[v�c3��_d
y����F��ϥ��.3�{��e��"�<'^$�rL��b��?V�K���vL����l�௽���-~i7��Q���8W�(��8S�(j Q�'r��)8��=8���}7W��Oq� �D`m��s���Ȋ��2Z�Њ��2`�pG�&$Ů=�e
��#-��To��'Qش.�u66s�^��t���b�ڮ�vI���{�v�� ��W�;>�BG%6�ؿj9XB-aH���%��4DܐT�J��r-6!Y���l޿X4}������'��X`9��i{�Hd�B*J�X%������'�H$8(���}�x�܃n�y����vy�8����"�����e�
w_7�w���5:-�f����T��?׾�Ƨ���D>��m_�F�EQ,8��GO^J~���]�A����l��IXr�d?1y��4'.��O��I�cz;9�6Q,��P�I�p�\w�����a�Q ��� �Y�9�}��7���{i/.ru�r��&�y�&�`�Bk3ɶh�)U�m�(�ueݨ
�&/�qZz�J.�(���-�N�3�T���ICZzk��ɫ^@�8dHKoMU�Z�Ca)���Ъ�ue�0U�e,���n�s�e���EQ�B��BZ�VK4-���7&q���֑u8aHUU!(��o�����T!5T��p��ֿf�ͮ�)8���~U���Z�         �  x��ZmS�8�>U�T�U����,K�K����r�E�ٺO�I�Ʊs�˿��%'�ƀrS3��V�_�����lzy�Nή���u]fEþ�~��؟��ߟN�fm~:`
�_�Ys���=;e�u՚���d���Ӳ55����}����g�Ұ��>��պlY�^ޘ��U!?l�
��{�.��ym��lF���Zvc�yY<���.o���v�Zzx[E�h�����<ϊ�������6��모���xF�N������iY^��W�"�gm^��2ŏ���;�p,��^O��3M�ݙ��,k�_�b���\�ݹ�oK臏>~��
�>�S(��'A<O�J��-4d��'oiNBs����z�&��D*���a"|�r<�j�B���fY�p`lW�#YX�#Z�ܙ���;�@��Z(�7V���$������od7Yc8����#谂��'
��ZӴl��{45)�"�x����W����e�5sSfu^qv�5�ϊ�>x�ę=�MSfѓT
M��@���A��@8�4�OZ����u�*����I &Zs(����н�Q�Y�ԉ�>��'.�fUdO�c����J���5��u�ș���lUht ��[R	V�)��[�N�eN�n���f�=2��D����������{�>pʽk7Ɣlfu<��V�p�RF�;��9z�шr���'���/e��~=��e����{��E�T#ʶ�</'2�.��a����((T�_L��O�tX�#���pc��UU�fO�\�z~�����j��3S�yk� #ˊx��M����c��s�-��M{��}^��&�G��n��"��7�I;>Y�����D��0|S�IwT�ۺ�<x	��?mZ�?5��´X����s��Iȵ�e�=�wi�u�N:�(�m�,�|e��gx^�$J����`'d��a^ٚ�R<d�x(���QF�LB8���Л2�H�l��"��#	`� ��|e]�J;�`�VM���2��W-;>?=�J�)熝U�T���tfm�E����}:8���z~�\C����}c�o�M^�M6$#�.�-;9&���? �1�}.� ��/������.?lVtf�eB������]�D����ac�=�s�<"������?!%=�L��Q"�o{�i�A�9q`�t	��` �@��6:C"��ˇ� \ɉNy("��s�F8!�&Rr��0�N7�kz��(i�d�� J��d���1!HK&�֔����'������]Ng�ߦ��b��ӓ���Ɍ�M�������ᗫ�%;����gzv�˔�N�M���������F��F��s*����~��:=f���� �<eG��3�=�WM<VI+�}�w��@��Fv�P�FE��C���u��HS�&�2M��ې� =҄�Pa�w��6[�+{Țy�#R"�ͫ�[� ��/ψ��"��X��YGN���0}X�]i����[��XP�ȊJ����`��0R�OIzO�h���7A�#��&�(y�r�v!�	!OI��+-k)�i�^�o���I��B�и������%Q�=>�I���ےe���j��ws�T��{�׼\ �������z�4!9 ����dE*9d��bA�272qv�J	��jqk��dѿ;l���e��e���9�K >�D�ǒM��ٴ����V�D���X���K6h�۳k��b���e#k
-�cs����&1UC�B"����u����4 ܧaE67/xB�H&Zr&�J�y�(<,�vII(�I�t�
��@;4���DhH2ISo#����B��Bn[�VKR�bm�iQArdY�G�'����\� �|�<��,>�A-7O�U>�zk= p_�5�
�������p��.� �/	%��ׁ��tBM�4���ֶGzQ[�B��������5p|S�\'���.�O�?rp���]����ZtJ"�>�,��Dz�:_P�B��C�����F[��mVе�/���X/Kz���~��ߴ3�m������ĥ%rR�J��౥B^�����aC���.�,����M�7�����@�����8G:m*���1`��l�Q!�pH|4+3�FTX�@F*��i�Fl������]�����Q��Z1T���s�Yス��c�`
ꔍY[:	b����,�A�'D���DTl:s[�R1o�
��=�E�l{0H��w���A�a 4:���V��>��e���+�c�ɀ�꫹�:��t�
�O���� ��/yQ6k�!��/AJ#逗�+P'��N��Sn�8aG�M���[�
���OO�?�H�%v�/�X��w�G<��Ŋ�(���~5f�֮�����8lq��b����#��W�n�=�r�?px;d����Yׇ�p���M����W�(m�"����ʻ^������+U��(�@d;ߞ;sہY�M��\��@r�G6i����SBr�)�oq����>�t����o�����%�R)�OQQ��xn`�4.!e J/
�D;{�,���!Ou�C��~�FN�)ݮ��t*��#���-1��(���A�7%kIK���ןt�J����fm�yjd�x�#��*��(l�vUi��[���ߔ��M�$)Ip�?��~zW~�}�����l��׈��˭��Cţ4L�wJ���H�Tm��t"��&M7������0s��d��K׵u�X�)�9L��dtۊ&r���Y�w��K�Q_j �8��ysOc�7j�'H�	�0u�IG}���h���:���=��!-��.�ԗQJ����$x�E��M�n,:�����V�k���&]�:aْ���XĲ�,/�y�cTO��.v�x㭄\X{��ٺ�������;w:���E�дY�n�qS�&�N�/��4�oG���Q�(�q8�n~��N~�֦+���V����3�9�f�\�7���iho�:d5�&Ve�BӛU�-ޑ��-;�6��Q��	���P=>m���7�ګ�%�xM-G�TQzszh~�R�ȅ;8�Ύ�`�ӝB�Ǡ�'萂J�j��� 4�_��8�d���xcR#�4�o|���X^���������e$R�O�F�e�qj��Kw���3�vЗf�]����Um[����{��>��Fz�!�ӌ'�l�?�pۿqH�z��!�V�Þ���p��w�N�Rc��ѿ>܂���H'R��с���� ˎ�ѥ�n���#�Sb��Z|]�5���Ko��(��.�ai<H Y�-}шC{s�9�+��O�m;ܗB�N���1�x=�������e�yЭ�������R�����2��w�b�M|��������ǐ���3� F��߿$&^҆�!q�(��÷(<��01B�*Mq	��5�@hG[\��t����f���(���d�h���
7�[^
ԭ{js����~ҍ�^�mù�t3%�C��E ��[���M�y�(J���A4�ʳ�oۈ�03�8�� A��u���A<0����e>Mnb-���!�ݢq �F��檌͛��\P_��èk��'"��%��z$������R��B�h����(���7� �X��߉�0J�юl�� ݃v8�n���s;�ctM��Vl/����*�����˼YR��ނ�ܺ�֫Ώ�^I��bJV*�n�E���=2�<,2���h�@�]X��f������u*�=6#���f}��ܧ�ow�.b�,��������#�����I,hb��7�iǟ�$l	�־�Bo��-m1Q�� �F��'�u�bd�=d�,���!w�����i��~���ٮJ��1]ԑ�u���ScF���+���~���l�^H�f�h�_,�H�"��N	�I����X�p���~]��w��"U2��"n��rW)h��g]��.�\(��u�{�9���F;��N��N�6�@�q7�r�z}b��-h��H�+��"ߧ�BUD�^C�Ç���i      C   w  x����j�@D{ŕ	������R�0b;m �.���?dFפ������݌�?�v��?����z��>>���O�x=\v��dC�χr��/���6�&	|�1�XM��Z��h
�����4R1K'�'��~��k.[HBs�!�40���b`B'E&U�o���悿�N�,%X'�����kZX�Is�z���9�#'�Z�rM�ظ�q-�������1ZbE���1ZZM6iZ��4-čL�Ғ��:�.uJ	@�>�p9y�t���k�d�Qw�_�̡FݙC��3�Z�4��򘥻$�Hw+�$:yO�<Ot�M	0����V�{�s�%% ��/�S�EM	�!:qO%0HA�=�y����!����� ��           x����n1��}��R���ÊE�H�� �l��%���V��/��>9>v�?|���e�����������?�o������f���vC��^�\@/�bo{qW�W�����>�y{s��LX9��;����.�œ0�	��ʆ�К�N���0�#����H��� e���/x�G������̢V��֣br!ڐ����,Jʟ��I�r��R�$
g���
ra�v/nY���,ݰ6����sͪ�v��Â��w�ke��ͼT͚l�0��nY��;��)}�:��D����?�.c(�wp��X]��9��Y�I�Ԧ�n�Y��Tli�X�]�OرM�>J������z��T��X�Rfe+˖��aR�.[Y�8�<aT9�"�ۨ�A�k	�gQݧ�$.V{"*��/�:E�x�Jc�v1-����A�Q=3�H,�b����S��)�1ݥ\%[��ͲC)2YK�aEǬ�l��[������Q}�����,ԯL�����R��fgR�J{��\ �����)pZ3���h�J���l��4�c �@4��JV��Xf�鈕Y�r ,f3mZ��� X�QiM�>���%��}L�ʿ���A�g���1�K���tr+jc�#{J�6��pd�� �a���"1҇L�<��l��b�f{D���U����Bda3��W	Q,��c���3�N��$�X��4�?]K���}J��=?�⿥�"+��D�bO�h�����Ҿ����o�w86=S��/5҂\�wg��U􈱤+W����ws���dv}�u������{��      8   
   x���             
   x���          ?   
   x���          A   
   x���                x��[�n�J��/@�������X��YŖO�� ����@Q-��)R�&��������'ٯ����D9s��ob7�����Uu��f6�މ˛�[�M��d�j�etu?���^C�\�㿞������vt~�Ǯ3�7�P
��/2���ʥX%�F�����I�k\�4�i���H?x�Z�Q��h�G��b̏W�S~OY�'b��NJ�ҵ8�wD�~M�(���*�1�J�z���%q��wGE�v���X�d�!\L�Zn����@���v�9un�78=��z�����N����i��7��@��|������}j�����$M�J���h�m>On�w� ���|*�q��0R�E��JL���L����f��ǣ/~��$����d"T$&�"��a��l����,Ń�5������ӡ��k^��l-eZ����L��F�.�����s���(�뵮3Z.U����{��k��t���w�v�|���,�,�Yd��O�Z�`�^TٱL�^���tԭް=p����9��6��#1*@4�h�R�.h�ο�n�������n<�	�*Leb��XT�
�1�l=�a��§�83�D��Y�k�6�(�#���eLeS"S?z(UAI,-�^�����i��ŗpa?�a�縮{:h��p�_>�;�V���=8R�-�������d�mvu9��o�������U��HDq*Ńz������Yӳ�܉��$!3|��j���T��r�7q�$8Ðj��h��U�����R.!I��iTl��.�q�$�Md��%+�q����'�G�K�Z��Li����-m�v1
Cq	UxR��u�$nb�8�V��B<6hޞJT&�԰5���1��[hɳ��,� �{Q��W��uAg�8���$����?���P;�P^�i�-��?4㗣:���j�����>�Gj����x�e,�o���D�J�m�ef�/t�]+��s��;O���!2潆�`2L^1���"d*~$|�"5���8��`u��>⧙��#��}�#�œ�,?sP��!+�n�fHi�F�"�T���}�Ҥ70 �Pd��XHRp��E�b�P�1-�R4�\Z��_��ug8�������6�����Sp�4N�SL�~6FӠT��>/�����2or~}K;s(���ݘ�ۈ9���k?�]�%����s���l@r(܍���v�� A��_�(K�9�&NY��+O"���G�!t�o2�S\�i��Z� L��\|"߰~VZ�b
�E��p7?��(������zY�w���j��y'?�XZ8�:x��|6�����zr{3���ё[�.T�.q�db1U]�Mr���D�-S�1�E�:�dK��aQ�w���U��������~� ��ܼE���_�wy�{��A�W̐¡�$<��t;�r��o�5��7;�i���7��ɐHO����k���El�gf�#G����+�P��ď�8��o�^hfI�_9Zp��iv����aSHk��y��j���I�n-�E¼�^��kԻ�z�^p[|Ɓ��J�\�WI��i��h�-f��c���MF��=9��v��6�4����k��qR�Uy���9��W8s���[b���V,���+&��dH�
�@�_���� ���<�5�Q���G����616M'� E����zX�`5�1"U��Y��}#��ZD�Ա�0��=���A�I����[�U9����
[�g��'�V�R���DȎ4+ԡ ��~�G[Þ������{��SA �hmzEw~R����'�u�D�D�i�Y��v��#�����~�=�b_MO )lu�݁�霶Z{����R�m����8�� �6��iC� �����}q�H�����(+����*e@�*NS�⣕����D��x��ǎ'��VHe��H����@���	g�A�XD�@;�T[�ݮR�kY2b��C�Q&�`�
�
��ہEфHp������%�9c���TV*�&��-V��Ef���o�E�2΁�kU �@ڷ�d��^H�����X�6ԆW.�ZO�oR:�	z�Á��TJɡ�w����4�m	��O���z��h� ��Rn:>b�!ⅎ�*4�FcH3s|������p�ѷ�"�5��K�c��ty)ꥲ�.�8�־-)�Ȯ������1���ǡ|���=�l#e�V���H��1�.��>z�2C�r续AT���G�:#�5�g�?�BZ��n�鶼��y1H��m�͒/�>��>��F�����j6���n<���3.P .Q�M%���4���B�g���)W�'��r��*�m��]���$u�g�T���]�����@��3h�N{��y1��E�	�i�=$�c�=����}Os/jK�T��+�1��p��{/���+5���GY9a錿��B�_<�=�T���ay+�"����)��3����"���U�����Hs���ܙXR�`��m��w��;xY0?�I.V��T�+h.�Ý7��i9$�_�B؏p�������^���u9�v�봪e�F_�6���i�Y�����՚J�?5A3��a�e/��+�{FH7<EM�^��A��:y���2�9��i;����Ԟ�"t!�a�眶��A�PM^����I�g�Hi҅�,KL凍b�g|�.��+�W�Nz����
�/S 
}���������e�"��k���w	��S0(��P����V��m
W	��&c��V��Fߊ2�#>�<�W��Rfs��6�-Y�����~q�1�XU��!�$QOX���%;̊�}��I�r���#�P�Y�1��ET�ʧ�
�Y ����+��ٖn3
�\��:D�e�Ÿ7UEq�6O�ʭCt?�*�X��kx���$O�c�K�d����3I�����>#����f��Q	� )�i!�Z)�pBr�p�굗�����n�>��C�×�j�=�}�_��5!���yh�3����iw��IĎ_O�n����=~�T%]�0�/��ŀ�ACd��}�_6���0�q΄n������ۯzz�D�Z�#t���q����˒h>>���\��wJʗ�;�?&��� 1���z���j�h��^�kz4����^��	hx/�?�Og����]~+���ZV|ʾ�4��9� àt�ʛ&�t���/��l�$i�d�INu�/�YڌW�m<ʴ�E�{��E�M)O��,g�Y���w�6�4��U '�iM~˶�Re3<?b$蔤;z{#7�p&@�l�qG��!+� ���%4�����]����#Ew�x�
Y\6cѕ��R�J�g�I�ͨ	��ݵ���7�/E�Ir�S�ퟥm�h6\�c	�#$�r/TXȺQŐ\Y��N���o��"���U�t��5����[���sۃ}���hRݍ�W�����&@�'gF$�y����1�~�8�ʷ7n�����&Cvf*�]��& ����4� pǏt_��|�I�9�`�UX8�	���5(r%*���4M��~���8��d��`霭e�X��Ͳ����Bq��H�ߋw�W�TÝ���Q.��"�D~���羒}��ؖ�A9(|S�udB�z2��۾���?�|Z���ks9�k)����"�&ೱ3qL�@��.2���J�}�+��؎�c�Y!b(�6����y����v����
stSޡ2�����0�6�]��ڰ��w�v�䇣�������?R�ݍ�D&��4������	��k|2��I9m�ʧnE�0�j���kPY��?�K#.��V��134x�b�a��ꆁ�ֽ-cS�3|�"�Ƒ��P�(�)�G�^�YH~v�Wp��J'O-���G�b�h��M$�щ-�1h\�đip, ��w
|@��봽v��ײ�vi�Ђ�t�ݞ70m��ckAp�ޱ@����.a����,SoU��y�)X�Mc�AY�&T��
��ݖ6NWb70<�¦�m�4��jf��V� ��KQr�����EC������y��3��A��q!P8~�99����Ulg�k�q��I�����?)�n�8͢�܀�u� s  F."�9��i:x�M]5��6�	(h��е�@.[g��W����/om�-�+mR@�.��G�,B1	�2��0.,��_eь�26g���dM ��ì��;m�H�E��\?�@&6����T?��{R�Ҽ��8y�͐�!v�rɀ!X�34	�3���ۿ�v�xu�mK&gk��2\A��+��������M���$1��xn�o||@��U	|q��-����m7��Xm�������~\�ȏ�VFΚ��y���Y����,z.K��ͼǀAxdNE��/���b1��\L��*�8������"%K�|�fƪ��|[�2��Y��0�x����r��4�� '�f�-�S[ب,�� ������nd^�풟����~�鎭���Cj�4w��@/H��:�_S*��_c���;����bR�kޘ|N��������P\�Js���s[�����b9�u;�M��z�����\��J?C�M�@>0�&�G�e��Otչm*2��\��z�mu��Zб��bD(�=&J�+�~���Ƈ���8��dJ7�]������MoX�)�� xJDS��7���.=/ްf�+]�|��A�:^�<�����7	)�F�ߏR���`����{���#����t}��J��8J�L�[��g��P#��+m�\���(ŒSr��#I�?F-{i�ˇ�;��w��NU%Z�"�ڔ��{{u�_����I}����,`vSE:E�ɥ+:4�K]NG��$�h>9��Gwc1�)*X�K��Mq�P%[3ؑr��C�N�V���cA(3��W2S�F�����kjFF���|�)�Az���W;�Ѝ�{�ۡס�q{�^I�5�'aJ�k�SH�V�_����      =   g  x��ֽJAF�>W���ž3�XY�HmE��J��G^@��0�����m�����l�O������p>�����{}x|Yﺛ�u��_m�����j��F�"U4�hT�h��D��� �h�1��(�hL�1��$�h̢1��"�h,�����S�z2��ZJ�����j�i������Jj�������j������Jk������z�n�7 �g:�]���&x ����^��c�����^�v�В�2b-%��$��гZb
-1���B��%���=��F7�+��D�D/B:��������ɦ��:F����3mt#�=M�@tO�"t��iHh����i���i���         �   x�5�AK1�������k=)�00���z)u��8�T�o�;�{iڗ������G�.H	^��nW��Ǯ�@s_F���+H�d�5,A
��pyA
��A����\;=F����J��<W\(� U
������~ʔ�tv���������\�,1����f�׷���2|��NJ7k)�z�)�(�`u4�H��4�����1�ؓW�      F   
   x���             
   x���          	   q  x��W=o�0��+��l�v���4�����+AS�E��IJ�}I��HYv� ]
m�w�}�#�����=d����L+&�y����}��j�Ϳ@B�����"C]�"�`��r��>�<'�V���!��L(1`@د!��+��i
*�H�t��V�J�֝�vẇjA0H5GS>���B���NQ�w�0Ƣ��@52s��4<�eT�̩n�UH�$H0�`�N��T��<�ҞJ��,�{�yt�SAW�^�Q�b0��APl4�GH͓9���j��k�E]uN5�g"���B��<��u�{*TQV��'i��NpF~W���P{1��ڑ�";��3���M��$4^d�p����P*�Q��j�<NفJ;u��1[/ʘ��ĚmĭjO�����M��]c���P��0,<e�k����O܉$-�")���>���Ri<{��G��"Rv��F�.����9b���ls�AW��V��Hj�ʪ��UO�odF�������p�N�d��#��e�:�NW�i%�r1����T�P����m-�gk��Ҽ��2�k{��|�)������N�����������̿�<a^O�9��L:q�ġɟ�l�@WU      �
   �  x���KoUF���H��/�b��%$�"+� ����EU�x��qn[Y�Q��s_U����~�xw���/wO��z�����/~{���??����Ͽ��p��[}���o��ߵ�upm�k���k�v�k�V�\L�)Q�ĝyJ�)ѧğ�J1hh��F1hĠ�F1hĠ�N:�>�A'�tbЉA'�b0�� ���`�A1�`��l�`#1�P�!1؈�F6b�����`';1�Q%;1؉�Nbp���� 18P)Abp�����$'18��INbp�j����"1���E.bp��\��B=��QI/��T�������zA����^Pa(��4t���� ]M�+r������WQ⽀�f1X�_`���#�7�UQez]Dj�]��]'���Z���l�Ɇ�+����5d���� �DNrG�+�g�.��<�7�U���r�����:�U�'p�����k%o�x����Z|'pS�;jН������N`G��8PS���D��ȏ��'���E�3��1lt�s���;Jmg�cO`�O^n`G�����B�d��>X3�g\�����Ʋ��ةZK�-���f��Ё���I�s5�ie&�;��;�ؼc���<&�w�*9�� �����8aH0k��r"���M��\����������c�3���D?j�L�4z���(���̅��=�?������:�tX#`������g7W0������?p�@:��1�����w,�u�0Ә.�Y� ��;��1����j���%������1�Ze@�Ϲ������A�+�JH.|��R
L	z}KزH0��9x=Z:22�Ý��!=�̝���gpc�\@�z*05������{���r���
f9��
ǫB2l��@�%+0��浆�z��e��h&d��<@��%{����V�Wp*���������I g��!�����hBv��z� 3�g���
C�����<`Ϫ@����ʏ*y9���(�h�U��	���4Y��X��p�b�Zy�I��#��ê\��:��X��r^�{�齂n�t����?zxz$7�`|���m0}���`�����ݙ
�3tg2��l�W��͛� L	͏      !   �  x��VKo�6����-`;"��^��)���I��Q̍$�$���;�+�Q�B��|�h�����/�����b�9վX��o����+����r+Di@�NA��O�����h�BBiED71K"ʖ�|Z<~��yWsՖ�������$l��o6Bs	�kW�کJ	�nK��ţ�$�s�&�$1��A��?�d�^/�DY�Cɥy����n�G���bw��y�3J��-�ً��iЉˡԢ�:�T���k�Bk{|S�
1Z76�:<�O�-M�4��[���3m�p	��=��D*�b@6��I���,�%K�U�=���{��{@j����d\)d�����.(�Cl��¨�7�D�цpD�{]{,����ų&b�ۗ�\�w*0�
�+����I�J�䀂�늇�&��<4�.��[7�$��$��Es����cu�[���6���n���F���X�"7Y���,Q�{��J�\=$������ ���;Ps�~���A1<�$"K:��4�:��n薆/��wp4��F�.���h�G�Sv�ێ�3��Wq���4A��|�S��\8��!���'�����Y�E��zPL_���Y�2:��s�J��O��#UO�H�(�ѽ�L'��Q���2�0Ȣ{��夊v����d�&Y~��
@ڲV�|��$(�;j^i�o�A��E]Je�=�<��$CD���a�w���������4���0���c��5�ށH�����ð��=���/��W���m0c���a�L8���┐%����,�}���e�oQ�o'����/�s��t�pX�~�e_��<��h�N5W{?B��{��i�咄n���
^C+���/x�����$�E������gpET��7-1x�ae�5�u�?�h4?:2�M��1��g���g�|�4yD�y�b^�0�|�5Li4��:��AD�$�X�ɼT+      M   X   x���v
Q���W(I-.�ON,N-Vs�	uV�0�Q !SMk.O�*u��Ȅ�Jc�Js�*M�f�1JM�& �Z�rq 4H:)      I   �   x����
�0��>E�(i�&mpr�P(-��U3b�����A�������]���������80o�?��my������6"e|7\��ox���s�m�I��,Vr~8���E.�|�����
��£*Ҟ�ɚ���*h�F>%#��Ϝ��\+$��S#pْ�M+]�`��J<������� hj[É"��8���ڊ��D��)��a�+"LR��TT7�-��hI��	��      +     x���Kk1�?�nja-�wO�`(ii��
5fI��9��wv7�W�v�4�Ə�a~H�������Z]\}T����f��?���������z��Bhod�O�G���g�w�7����ݵ?��~���?ܶۍnT�� ��X~�4J��H���g��E�z>}�n�z�.�ؗ�Fy�cO*<��b�!# K�����c{���s\��
�&:��5'Ex��}<1�� 퐭��.Z=�ր� ��9�1�SP�ր�a���-���\�"���]2h���i(�d3�a a4Nk@R����SS�=nT�U�׻v��}���BW��#Ř)ω}�;Mkt����Q��NW��DPD
}f���:�IϧU&ڻ<1jD)C0 2O��i�������OvA!�"���s�M"D�z>�=m��}{�$�e$|:Y�G������`�K:l���|u�q�ք)��O�@��nǺ�͞�F���"�j��6��=1���J�q#.ݗ��w�x��&D�J^/����0N�Ʃ��ߞ�E         �  x��ӻj1��O1�X:W�3�R�X�Nz]�Cv������1����t��������.�����������8,s\���r=�8(Ei��Z{�o�s/�J5"����|���dK���J�b�?]���a�sT�AR�@9Z�J�Y�P->أ���L7�u���w�)�ERDȎ��c@�ERt&-�<�")��%�0��3 �S�s�jnµw�"ʥjQ���ڠY'�E�PV��&;���W�ƨ{��ڡz�:� �Z�������U0��;c�s�Ro��s"��LXV�%�K�Q�:���m�����H{�N��Q�u6��*g��5�+"6�fé�;*s�$�$����wP�W&]ljqJlSkE��`�"�fcP5���ӹ���"m�kN�q�_;I�ў~���Z�Di��$*G�Ɖ����Qk���|K��k�ݓ�ث���z�         �   x��λ
�@��~�b�(�0��*b����F�eE�ٰ��)b�F���Sռ�7P�������XJ�8�`��:�AHo�!įc6���NHs��J[�g�R�x��)��)�������2���qFx�lU���aC��)���䤽�V{f�r�         5  x�ՔMK1���s��.4�V�'����^DBܝ���ɒd[�7m)���XeO�y�0o��Lg��9$��#t�j-�h�Rt�r��<���(��x�L�Q�\��U^a&���L��i��S�X_Q!A��ɥ����"��#��2�.+4y�>�i$wicȗN�r];���-K�;���+��tve�R�.P�ze:/�7���!�5R��&����YlCw��Wnd¥ۻ_j������Kx}���r���/�HW3���G#���ݟB�����_u�b�?��k���1����A\^�����'=B>         �  x���[oI�����]�������}VH��+����/�N"��o���&%�S�LsΩ~sq������Ň��]��O/�?���~���lv��r�Y߭67�}���<��yw���|���!(}��;��Ds�=io͞���o>���h�Y/�>��>�۲��=ԇ����goNn���OW�pך+���S���XW�8��{P�G(���pѫ��KX������8^l��n��m�u�6�H��&�A�x�$�LJ;l}��1,�N�9�\A������G�\�^��3
�e+j�\BM�8Zv.z�z��8��Φ`3��2,���PYg�C59:��p.����8�!�Kq��Eoo���v}���Z��N&f�����
��=IL�?��{��#b����w�2���#UͰk�m�I��j���w9�Iy����WW�g]�`2C��8DC>��KE�3�*
���K[5H�����ݷ=�>����*����戟=5�J�A�����7�bc��ף�9PO�ȟ�m)�h*˗јR*!WcJp)�$f,��.�6l��֔�7%��XY�JnP�6I聑��1�<��pݻO���үn'�n�f���w��'D��Ľ�J�My�����@M��� �)�cR�ۻP�2E���z@�F�n�n�׋�5.6�+�� �y��徲��]p�N��U��c�?W�X��$̝;�O�NB��0� ��gY���i4L��i[L��N3Z1�
���dg�y����f�4F-�@e������J���Ȯ����~Q70�c�m[�{�kb�!X��]�J��	����t/�L�mvpm'��!B�WF�#�E2$�YY�l�ED!�K
�Xw��ls\X�Y�Q;�b^I��������b�GK�6蠆�{X8��|�^W��~��@n�)5�٨}/Yj�i�b����:&��ƅ�<����ӎ4z_���Q`���sC.�ILMS[�«E�3l$���"ge6� �a���A���%�0;Z�6�a�ơ�
/��U�%-Q���1�q���،	κ���'�0� �D��2�,�L���j�ģ� Zm�@��>dP`$Z�Q�Z��b�d�J͎V����~}
�"=�bbC7H�6�����DG9�FʩORN�I'�=|�S�e���b����;�d�O|��z��?�         r   x���v
Q���W(K-*���+Vs�	uV�0�Q04�QP�H(Ꙩ�@���d����Z[���Y�������<��Z������WR��i��� )�$)      1   ^  x���1kGE{���s*�;�v�T.\����C�(��Yp1���TqX͝�t��^>||�ǧ�ˇO�?�����_�y}������>>~��Ǜ���o_�<?b<?�_{z�?�v �	X
8w��'\����{ �#"v�t�1���8v�r��D�g�}���Cp��x�ܷ�����V��ط��(I$��V7.���V7����c:����>����y�Gђ�D�_$�~�7.��H"�ɋ}�&B��qC"!z�E��7��Jc޼����"B�[�9ozޚ��y� B�[�.�1o��y��=���^D�.B�=���6�z��$B��A����9oz�nB��'z^��әw!�=r�3���=�y"�=���p���M��$B��"B�.}��5���y�k!_�� B�&W"罊9�_zgޓ=�E�>�~����D�xA����$B���KO�/W�O^D�7��]'��]!z�E��7ܺ�-Fb|������� D(I��8F#G�ф+��;�"�Xyb�A�^�KZ*�]�q������tl> �����%��8	1V�qV^��� D�%)�HIi�@hIi�@�I�(w@MJǹrR:�Г��!��!�����q…t�}|�Ji%T�Ji5T�J�t@WJG��R:.P�ґ進��M��tL7r����U�c��!�,��g)B���Wy�)}�P�ʑ�W�U���- �݈���\9�������&W��D�r>�ʕc�Y���re9|@�+G��\Yi�,��6W��C�+��Ε�א���k�se�5����]Yz��,��Dw#!hte�5D���*]Yv��,��LW�]C�+KH!ԕ%�P��RHue	)����b]YB
��,!�\W��B�+'���/?����]Y�ɮ,�fW��B�+K{�ڕ������^�ve9,��r�n@�+KH!ݵ%���n���NB�ol�����][������P�ڱ�	��-����ڱ�	����P�ڱ�	���k�z׎]N�w���zw#�w߄z׎\N�w���xז�N�wm�+Ի���];B:�޵��'Ի���|׎�N�w��{��~ ���"      )   
   x���          '   
   x���          %   
   x���          :   
   x���          #   �   x���;
�P��>��.
��ܼ��HqA"��k�)ܾc+���y�n+�^��^ێ��r�ЕO=K����Hn[j�m�۶��m�@�}�w�!0��ݖ��ʮ�t�%G[����G����hR��)Cڎ�"mIʑ�e�c��,�k���         �  x����jPE�|�t*���V)!�F�-�@"��%��î,dV+��5���\^��ts����xx��y��������՗�χ�5�����g=?�~���#�y���n��~��sw�����������w��.��/�W_�o�	�|~ ���?�g�]�3�n�h[������E�HShF�mMx&�.<��L�Sx&�eY ��G��Ix$ڞ�p�h{�3$�^�]�&<�z��v��3�N�h�-U ~�D;��HSY-R���8���3�o�3���#��14� ��1m��Kx&�-<�L�#���@!��i
�
�D;c>c����v�2L�Sx&�e��-<�J�#Ѯ,+�hWl�h�� |i
��D;��h��L������#��$<�v~	5k95�_|�!�&|G�ݶ& ~X� ~
�gIF�mV��S�NN�=R���j�����O\�@���$��n����1�W@P}���O�K �>9?�g����>C���է����� �>�N6	�����l��d��?f�>ś��0�>qH��Yb��'��P}�����Q���*�_�m�:�϶{!������3�o��	~�����������/�����7_	~�������Z�	~����w��0�WZ3ß�O��^��������9���=9?[�	~���j�� �Y�	~���a�'���_ ����m��#Y�	~����Z*�b�'���O�՟�w}� ��{A�?�'��n	���)����En��̶x�b͙�W����pK����'.!��A���/���| ���_Ɵ͓�gEg`�Yq~����ݏ�n��v9B�cg
��ć��Z|v��g��@��r�����o�3��^QO�����1__Q������1�_Q����Հ�))��OI�ǆ�?%Uk�����SR�g��3��@�,�!�-� ���U��_%������yrL��?9&CƟ�m�!���@�L�!�Ȑ?[�!�OI�3�n	~��b�)����Ɵ�5�C��!�m^��g���S���?56w�?5�0��V+�o�3���g��3%���g�� ���� �_-OZ|#�O�j�?����Ӽ��!>���g���Ef��I|Ɵ?*���cg���crf�鱸C��!�'����g�I|Ɵ��?#����gT>	~��g���3ć���!���?�6 &�f\N1��"��sv�� �5     