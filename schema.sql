create table Player (
    login   varchar(15) not null,
    name    varchar(15) not null,
    gender  char(1)     not null,
    address varchar(15) not null,
    joined  timestamp   not null,
    constraint Player_PK
        primary key (login)
);

-- ---------------------------------------------------------------------------
create table Race (
    race    varchar(15) not null,
    constraint Race_PK
        primary key (race)
);

-- ---------------------------------------------------------------------------
create table Avatar (
    login   varchar(15) not null,
    name    varchar(15) not null,
    gender  char(1),
    race    varchar(15) not null,
    constraint Avatar_PK
        primary key (login, name),
    constraint Avatar_of_Player_FK
        foreign key (login) references Player,
    constraint Avatar_has_Race_FK
        foreign key (race) references Race
);

-- ---------------------------------------------------------------------------
create table Realm (
    realm varchar(15) not null,
    constraint Realm_PK
        primary key (realm)
);

-- ---------------------------------------------------------------------------
create table Visit (
    login   varchar(15) not null,
    name    varchar(15) not null,
    realm   varchar(15) not null,
    day     date        not null,
    constraint Visit_PK
        primary key (login, realm, day),
    constraint Visit_Once_A_Day_UNIQ
        unique(login, day),
    constraint Visit_who_Player_FK
        foreign key (login) references Player,
    constraint Visit_with_Avatar_FK
        foreign key (login, name) references Avatar,
    constraint Visit_to_Realm_FK
        foreign key (realm) references Realm
);

-- ---------------------------------------------------------------------------
create table Quest (
    theme     varchar(15) not null,
    realm     varchar(15) not null,
    day       date        not null,
    succeeded time,
    constraint Quest_PK
        primary key (theme, realm, day),
    constraint Quest_in_Realm_FK
        foreign key (realm) references Realm
);

-- ---------------------------------------------------------------------------
create table Actor (
    login   varchar(15) not null,
    realm   varchar(15) not null,
    day     date        not null,
    theme   varchar(15) not null,
    role    varchar(15) not null,
    constraint Actor_PK
        primary key (login, realm, day, theme),
    constraint Actor_by_Visit_FK
        foreign key (login, realm, day) references Visit,
    constraint Actor_in_Quest_FK
        foreign key (theme, realm, day) references Quest
);

-- ---------------------------------------------------------------------------
create table Treasure (
    treasure  varchar(20) not null,
    sql       integer     not null,
    constraint Treasure_PK
        primary key (treasure)
);

-- ---------------------------------------------------------------------------
create table Loot (
    loot#     smallint    not null,
    treasure  varchar(20) not null,
    theme     varchar(15) not null,
    realm     varchar(15) not null,
    day       date        not null,
    login     varchar(15),
    constraint Loot_PK
        primary key (loot#, treasure, theme, realm, day),
    constraint Loot_is_Treasure_FK
        foreign key (treasure) references Treasure,
    constraint Loot_for_Quest_FK
        foreign key (theme, realm, day) references Quest,
    constraint Loot_given_Actor_FK -- Player who wins the piece
        foreign key (login, realm, day, theme) references Actor
);

