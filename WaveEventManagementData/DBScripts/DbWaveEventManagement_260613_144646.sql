-- User [User]
create table "public"."USER_3" (
   "CODICE_USER"  int4  not null,
   "SECRET_KEY"  varchar(255),
   "NOME"  varchar(255),
   "COGNOME"  varchar(255),
   "ETA"  int4,
   "EMAIL"  varchar(255),
   "SALDO_WALLET"  numeric(19, 2),
   "PASSWORD"  varchar(255),
   "USERNAME"  varchar(255),
  primary key ("CODICE_USER")
);


-- Prenotazione [cls1]
create table "public"."prenotazione" (
   "codice_prenotazione"  int4  not null,
   "data_prenotazione"  timestamp,
   "isattiva"  bool,
  primary key ("codice_prenotazione")
);


-- Evento [cls2]
create table "public"."evento" (
   "codice_evento"  int4  not null,
   "ispubblico"  varchar(255),
   "titolo"  varchar(255),
   "data_creazione"  timestamp,
   "data_inizio"  timestamp,
   "data_fine"  timestamp,
   "numero_posti"  int4,
   "costo_evento"  numeric(19, 2),
   "luogo"  varchar(255),
   "eta_minima"  int4,
   "descrizione"  varchar(255),
  primary key ("codice_evento")
);


-- Tipologia Evento [cls3]
create table "public"."tipologia_evento" (
   "codice_tipologia_evento"  int4  not null,
   "nome"  varchar(255),
  primary key ("codice_tipologia_evento")
);


-- Bacheca [cls4]
create table "public"."bacheca" (
   "codice_bacheca"  int4  not null,
   "nome_bacheca"  varchar(255),
  primary key ("codice_bacheca")
);


-- Messaggio [cls5]
create table "public"."messaggio" (
   "codice_messaggio"  int4  not null,
   "testo"  varchar(255),
   "creazione"  timestamp,
  primary key ("codice_messaggio")
);


-- User_Prenotazione [as1]
alter table "public"."prenotazione"  add column  "user_3_codice_user"  int4;
alter table "public"."prenotazione"   add constraint fk_prenotazione_user_3 foreign key ("user_3_codice_user") references "public"."USER_3" ("CODICE_USER");
create index "idx_prenotazione_user_3" on "public"."prenotazione"("user_3_codice_user");


-- Prenotazione_Evento [as2]
alter table "public"."prenotazione"  add column  "evento_codice_evento"  int4;
alter table "public"."prenotazione"   add constraint fk_prenotazione_evento foreign key ("evento_codice_evento") references "public"."evento" ("codice_evento");
create index "idx_prenotazione_evento" on "public"."prenotazione"("evento_codice_evento");


-- Organizza [as3]
alter table "public"."evento"  add column  "user_3_codice_user"  int4;
alter table "public"."evento"   add constraint fk_evento_user_3 foreign key ("user_3_codice_user") references "public"."USER_3" ("CODICE_USER");
create index "idx_evento_user_3" on "public"."evento"("user_3_codice_user");


-- Evento_TipologiaEvento [as4]
alter table "public"."evento"  add column  "tipologia_evento_codice_tipolo"  int4;
alter table "public"."evento"   add constraint fk_evento_tipologia_evento foreign key ("tipologia_evento_codice_tipolo") references "public"."tipologia_evento" ("codice_tipologia_evento");
create index "idx_evento_tipologia_evento" on "public"."evento"("tipologia_evento_codice_tipolo");


-- Evento_Bacheca [as5]
alter table "public"."bacheca"  add column  "evento_codice_evento"  int4;
alter table "public"."bacheca"   add constraint fk_bacheca_evento foreign key ("evento_codice_evento") references "public"."evento" ("codice_evento");
create index "idx_bacheca_evento" on "public"."bacheca"("evento_codice_evento");


-- Messaggio_Bacheca [as6]
alter table "public"."messaggio"  add column  "bacheca_codice_bacheca"  int4;
alter table "public"."messaggio"   add constraint fk_messaggio_bacheca foreign key ("bacheca_codice_bacheca") references "public"."bacheca" ("codice_bacheca");
create index "idx_messaggio_bacheca" on "public"."messaggio"("bacheca_codice_bacheca");


-- Messaggio_User [as7]
alter table "public"."messaggio"  add column  "user_3_codice_user"  int4;
alter table "public"."messaggio"   add constraint fk_messaggio_user_3 foreign key ("user_3_codice_user") references "public"."USER_3" ("CODICE_USER");
create index "idx_messaggio_user_3" on "public"."messaggio"("user_3_codice_user");


