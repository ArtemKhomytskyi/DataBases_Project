/*==============================================================*/
/* DBMS name:      SQL 8                                 */
/* Created on:     06.10.2023 12:55:43                          */
/*==============================================================*/
/*==============================================================*/
/* Table: CARDS                                                 */
/*==============================================================*/
create table CARDS (
   IDEVENT              INT                 not null,
   IDCARDS              INT IDENTITY(1, 1)               not null,
   IDPERSON             INT                 null,
   IDREFEREE            INT                 null,
   PLA_IDPERSON         INT                 null,
   IDPLAYER             INT                 null,
   CARDTYPE             VARCHAR(6)           not null,
   constraint PK_CARDS primary key (IDEVENT, IDCARDS)
);

/*==============================================================*/
/* Index: CARDS_PK                                              */
/*==============================================================*/
create unique index CARDS_PK on CARDS (
IDEVENT,
IDCARDS
);

/*==============================================================*/
/* Index: WHO_RECEIVES_FK                                       */
/*==============================================================*/
create  index WHO_RECEIVES_FK on CARDS (
PLA_IDPERSON,
IDPLAYER
);

/*==============================================================*/
/* Index: GIVEN_BY_FK                                           */
/*==============================================================*/
create  index GIVEN_BY_FK on CARDS (
IDPERSON,
IDREFEREE
);

/*==============================================================*/
/* Index: WHEN2_FK                                              */
/*==============================================================*/
create  index WHEN2_FK on CARDS (
IDEVENT
);

/*==============================================================*/
/* Table: COACHES                                               */
/*==============================================================*/
create table COACHES (
   IDPERSON             INT                 not null,
   IDCOACH              INT IDENTITY(1, 1)               not null,
   IDTEAM               INT                 null,
   constraint PK_COACHES primary key (IDPERSON, IDCOACH)
);

/*==============================================================*/
/* Index: COACHES_PK                                            */
/*==============================================================*/
create unique index COACHES_PK on COACHES (
IDPERSON,
IDCOACH
);

/*==============================================================*/
/* Index: WHO_IS_THE_COACH_FK                                   */
/*==============================================================*/
create  index WHO_IS_THE_COACH_FK on COACHES (
IDTEAM
);

/*==============================================================*/
/* Index: ROLE3_FK                                              */
/*==============================================================*/
create  index ROLE3_FK on COACHES (
IDPERSON
);

/*==============================================================*/
/* Table: EVENTS                                                */
/*==============================================================*/
create table EVENTS (
   IDEVENT              INT IDENTITY(1, 1)               not null,
   IDMATCH              INT                 null,
   PHASE                VARCHAR(40)          null,
   "TIME"               TIME                 null,
   constraint PK_EVENTS primary key (IDEVENT)
);

/*==============================================================*/
/* Index: EVENTS_PK                                             */
/*==============================================================*/
create unique index EVENTS_PK on EVENTS (
IDEVENT
);

/*==============================================================*/
/* Index: WHAT_HAPPENED_FK                                      */
/*==============================================================*/
create  index WHAT_HAPPENED_FK on EVENTS (
IDMATCH
);

/*==============================================================*/
/* Table: GOALS                                                 */
/*==============================================================*/
create table GOALS (
   IDEVENT              INT                 not null,
   IDGOAL               INT IDENTITY(1, 1)               not null,
   IDPERSON             INT                 null,
   IDPLAYER             INT                 null,
   PENALTY              BIT                not null,
   constraint PK_GOALS primary key (IDEVENT, IDGOAL)
);

/*==============================================================*/
/* Index: GOALS_PK                                              */
/*==============================================================*/
create unique index GOALS_PK on GOALS (
IDEVENT,
IDGOAL
);

/*==============================================================*/
/* Index: WHO_GOALS_FK                                          */
/*==============================================================*/
create  index WHO_GOALS_FK on GOALS (
IDPERSON,
IDPLAYER
);

/*==============================================================*/
/* Index: WHEN_FK                                               */
/*==============================================================*/
create  index WHEN_FK on GOALS (
IDEVENT
);

/*==============================================================*/
/* Table: MATCHES                                               */
/*==============================================================*/
create table MATCHES (
   IDMATCH              INT IDENTITY(1, 1)               not null,
   IDPERSON             INT                 null,
   IDREFEREE            INT                 null,
   IDSTADIUM            INT                 null,
   IDSTAGE              INT                 null,
   DATEANDTIME          DATE                 not null,
   "GROUP"              VARCHAR(1)           null,
   EXTRATIME1           TIME                 not null,
   EXTRATIME2           TIME                 not null,
   EXTRATIMEEND         TIME                 not null,
   PENALTY              BIT               not null,
   constraint PK_MATCHES primary key (IDMATCH)
);

/*==============================================================*/
/* Index: MATCHES_PK                                            */
/*==============================================================*/
create unique index MATCHES_PK on MATCHES (
IDMATCH
);

/*==============================================================*/
/* Index: WHICH_STAGE_OF_THE_WORLD_CUP_FK                       */
/*==============================================================*/
create  index WHICH_STAGE_OF_THE_WORLD_CUP_FK on MATCHES (
IDSTAGE
);

/*==============================================================*/
/* Index: WHERE_FK                                              */
/*==============================================================*/
create  index WHERE_FK on MATCHES (
IDSTADIUM
);

/*==============================================================*/
/* Index: WHO_JUDGE_FK                                          */
/*==============================================================*/
create  index WHO_JUDGE_FK on MATCHES (
IDPERSON,
IDREFEREE
);

/*==============================================================*/
/* Table: PEOPLE                                                */
/*==============================================================*/
create table PEOPLE (
   IDPERSON             INT IDENTITY(1, 1)               not null,
   NAME                 VARCHAR(40)          not null,
   BD                   DATE                 not null,
   GENDER               VARCHAR(40)          not null,
   constraint PK_PEOPLE primary key (IDPERSON)
);

/*==============================================================*/
/* Index: PEOPLE_PK                                             */
/*==============================================================*/
create unique index PEOPLE_PK on PEOPLE (
IDPERSON
);

/*==============================================================*/
/* Table: PLAYERS                                               */
/*==============================================================*/
create table PLAYERS (
   IDPERSON             INT                 not null,
   IDPLAYER             INT IDENTITY(1, 1)               not null,
   IDEVENT              INT                 null,
   IDREPLACEMENT        INT                 null,
   IDTEAM               INT                 null,
   CAR_IDEVENT          INT                 null,
   IDCARDS              INT                 null,
   constraint PK_PLAYERS primary key (IDPERSON, IDPLAYER)
);

/*==============================================================*/
/* Index: PLAYERS_PK                                            */
/*==============================================================*/
create unique index PLAYERS_PK on PLAYERS (
IDPERSON,
IDPLAYER
);

/*==============================================================*/
/* Index: IN_WHICH_TEAM_FK                                      */
/*==============================================================*/
create  index IN_WHICH_TEAM_FK on PLAYERS (
IDTEAM
);

/*==============================================================*/
/* Index: WHO_RECEIVES2_FK                                      */
/*==============================================================*/
create  index WHO_RECEIVES2_FK on PLAYERS (
CAR_IDEVENT,
IDCARDS
);

/*==============================================================*/
/* Index: WHO_REPLACED_FK                                       */
/*==============================================================*/
create  index WHO_REPLACED_FK on PLAYERS (
IDEVENT,
IDREPLACEMENT
);

/*==============================================================*/
/* Index: ROLE_FK                                               */
/*==============================================================*/
create  index ROLE_FK on PLAYERS (
IDPERSON
);

/*==============================================================*/
/* Table: PLAYERS__IN_MATCH                                     */
/*==============================================================*/
create table PLAYERS__IN_MATCH (
   IDPERSON             INT                 null,
   IDPLAYER             INT                 null,
   IDMATCH              INT                 null,
   ISSTARTING           BIT                 not null
);

/*==============================================================*/
/* Index: WHO_PLAYS_FK                                          */
/*==============================================================*/
create  index WHO_PLAYS_FK on PLAYERS__IN_MATCH (
IDPERSON,
IDPLAYER
);

/*==============================================================*/
/* Index: IN_WHICH_MATCH_FK                                     */
/*==============================================================*/
create  index IN_WHICH_MATCH_FK on PLAYERS__IN_MATCH (
IDMATCH
);

/*==============================================================*/
/* Table: POSITIONS                                             */
/*==============================================================*/
create table POSITIONS (
   IDPOSITION           INT IDENTITY(1, 1)             not null,
   IDPERSON             INT                 not null,
   IDPLAYER             INT                 not null,
   POSITIONNAME         VARCHAR(40)          not null,
   constraint PK_POSITIONS primary key (IDPOSITION)
);

/*==============================================================*/
/* Index: POSITIONS_PK                                          */
/*==============================================================*/
create unique index POSITIONS_PK on POSITIONS (
IDPOSITION
);

/*==============================================================*/
/* Index: ON_WHICH_POSITION_FK                                  */
/*==============================================================*/
create  index ON_WHICH_POSITION_FK on POSITIONS (
IDPERSON,
IDPLAYER
);

/*==============================================================*/
/* Table: REFEREES                                              */
/*==============================================================*/
create table REFEREES (
   IDPERSON             INT                 not null,
   IDREFEREE            INT IDENTITY(1, 1)               not null,
   COUNTRYCODE          VARCHAR(3)           not null,
   constraint PK_REFEREES primary key (IDPERSON, IDREFEREE)
);

/*==============================================================*/
/* Index: REFEREES_PK                                           */
/*==============================================================*/
create unique index REFEREES_PK on REFEREES (
IDPERSON,
IDREFEREE
);

/*==============================================================*/
/* Index: ROLE2_FK                                              */
/*==============================================================*/
create  index ROLE2_FK on REFEREES (
IDPERSON
);

/*==============================================================*/
/* Table: REPLACEMENTS                                          */
/*==============================================================*/
create table REPLACEMENTS (
   IDEVENT              INT                 not null,
   IDREPLACEMENT        INT IDENTITY(1, 1)               not null,
   constraint PK_REPLACEMENTS primary key (IDEVENT, IDREPLACEMENT)
);

/*==============================================================*/
/* Index: REPLACEMENTS_PK                                       */
/*==============================================================*/
create unique index REPLACEMENTS_PK on REPLACEMENTS (
IDEVENT,
IDREPLACEMENT
);

/*==============================================================*/
/* Index: WHEN3_FK                                              */
/*==============================================================*/
create  index WHEN3_FK on REPLACEMENTS (
IDEVENT
);

/*==============================================================*/
/* Table: STADIUMS                                              */
/*==============================================================*/
create table STADIUMS (
   IDSTADIUM            INT IDENTITY(1, 1)               not null,
   STADIUMNAME          VARCHAR(40)          not null,
   COUNTRYCODE          VARCHAR(3)           not null,
   TOWNNAME             VARCHAR(40)          not null,
   constraint PK_STADIUMS primary key (IDSTADIUM)
);

/*==============================================================*/
/* Index: STADIUMS_PK                                           */
/*==============================================================*/
create unique index STADIUMS_PK on STADIUMS (
IDSTADIUM
);

/*==============================================================*/
/* Table: STAGES                                                */
/*==============================================================*/
create table STAGES (
   IDSTAGE              INT IDENTITY(1, 1)              not null,
   STAGENAME            VARCHAR(40)          not null,
   DATESTART            DATE                 not null,
   DATEFINISH           DATE                 not null,
   constraint PK_STAGES primary key (IDSTAGE)
);

/*==============================================================*/
/* Index: STAGES_PK                                             */
/*==============================================================*/
create unique index STAGES_PK on STAGES (
IDSTAGE
);

/*==============================================================*/
/* Table: TEAMS                                                 */
/*==============================================================*/
create table TEAMS (
   IDTEAM               INT IDENTITY(1, 1)               not null,
   IDMATCH              INT                 null,
   IDPERSON             INT                 null,
   IDCOACH              INT                 null,
   TEAMNAME             VARCHAR(40)          not null,
   COUNTRYCODE          VARCHAR(3)           not null,
   "GROUP"              VARCHAR(1)           not null,
   constraint PK_TEAMS primary key (IDTEAM)
);

/*==============================================================*/
/* Index: TEAMS_PK                                              */
/*==============================================================*/
create unique index TEAMS_PK on TEAMS (
IDTEAM
);

/*==============================================================*/
/* Index: WHICH_TEAMS_PLAYS_FK                                  */
/*==============================================================*/
create  index WHICH_TEAMS_PLAYS_FK on TEAMS (
IDMATCH
);

/*==============================================================*/
/* Index: WHO_IS_THE_COACH2_FK                                  */
/*==============================================================*/
create  index WHO_IS_THE_COACH2_FK on TEAMS (
IDPERSON,
IDCOACH
);

