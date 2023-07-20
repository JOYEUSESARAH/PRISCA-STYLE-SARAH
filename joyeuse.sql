/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  19/07/2023 12:33:39                      */
/*==============================================================*/


drop table if exists Clients;

drop table if exists Depenses;

drop table if exists Mesures;

drop table if exists Models;

drop table if exists Payement;

drop table if exists Personnels;

drop table if exists RendezVous;

drop table if exists Roles;

/*==============================================================*/
/* Table : Clients                                              */
/*==============================================================*/
create table Clients
(
   Idclients            int not null,
   Nom                  varchar(254),
   Prenom               varchar(254),
   Sexe                 varchar(254),
   Telephone            int,
   Email                varchar(254),
   Adresse              varchar(254),
   primary key (Idclients)
);

/*==============================================================*/
/* Table : Depenses                                             */
/*==============================================================*/
create table Depenses
(
   Iddepenses           int not null,
   Montant              int,
   Quantite             int,
   DateDepense          datetime,
   TypeDepense          varchar(254),
   primary key (Iddepenses),
   key AK_Identifiant_1 (Iddepenses)
);

/*==============================================================*/
/* Table : Mesures                                              */
/*==============================================================*/
create table Mesures
(
   Idmesure             int not null,
   Idclients            int not null,
   Idmodels             int not null,
   Poitrine             int,
   Longeur              int,
   Ceinture             int,
   Bassin               int,
   TourDeLaTaille       int,
   Hanche               int,
   Bas                  int,
   EcartDos             int,
   primary key (Idmesure)
);

/*==============================================================*/
/* Table : Models                                               */
/*==============================================================*/
create table Models
(
   Idmodels             int not null,
   NomModels            varchar(254),
   Homme                varchar(254),
   Femme                varchar(254),
   primary key (Idmodels)
);

/*==============================================================*/
/* Table : Payement                                             */
/*==============================================================*/
create table Payement
(
   Idpayement           int not null,
   Idclients            int,
   Numero               int,
   Montant              int,
   DatePaiement         datetime,
   Avance               int,
   ResteAPayer          int,
   primary key (Idpayement)
);

/*==============================================================*/
/* Table : Personnels                                           */
/*==============================================================*/
create table Personnels
(
   Idpersonnel          int not null,
   Nom                  varchar(254),
   Prenom               varchar(254),
   Adresse              varchar(254),
   Contact              int,
   primary key (Idpersonnel)
);

/*==============================================================*/
/* Table : RendezVous                                           */
/*==============================================================*/
create table RendezVous
(
   IdRendezVous         int not null,
   Idclients            int,
   DateRdv              datetime,
   primary key (IdRendezVous)
);

/*==============================================================*/
/* Table : Roles                                                */
/*==============================================================*/
create table Roles
(
   Id                   int not null,
   Typerole             varchar(254),
   primary key (Id)
);

alter table Mesures add constraint FK_Association1 foreign key (Idclients)
      references Clients (Idclients) on delete restrict on update restrict;

alter table Mesures add constraint FK_Association2 foreign key (Idmodels)
      references Models (Idmodels) on delete restrict on update restrict;

alter table Payement add constraint FK_Association4 foreign key (Idclients)
      references Clients (Idclients) on delete restrict on update restrict;

alter table RendezVous add constraint FK_Association5 foreign key (Idclients)
      references Clients (Idclients) on delete restrict on update restrict;

