#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: stock
#------------------------------------------------------------

CREATE TABLE stock(
        id_stock Int  Auto_increment  NOT NULL
	,CONSTRAINT stock_PK PRIMARY KEY (id_stock)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: article
#------------------------------------------------------------

CREATE TABLE article(
        id_article              Int  Auto_increment  NOT NULL ,
        titre_livre             Varchar (100) ,
        tome_livre              Float ,
        isbn                    Int ,
        date_parution           Date ,
        auteur_livre            Varchar (100) ,
        editeur                 Varchar (100) ,
        distributeur            Varchar (100) ,
        diffuseur               Varchar (100) ,
        secteur_livre           Varchar (100) ,
        rayon_livre             Varchar (100) ,
        bon_achat               Float ,
        repas                   Varchar (100) ,
        boisson                 Varchar (100) ,
        dessert_divers          Varchar (100) ,
        prix_achat              Float ,
        remise_achat            Float ,
        taux_tva                Float NOT NULL ,
        prix_ht                 Float NOT NULL ,
        prix_ttc                Float NOT NULL ,
        secteur_bd              Bool ,
        secteur_jeunesse        Bool ,
        secteur_roman           Bool ,
        secteur_occasion        Bool ,
        cat_manga               Bool ,
        cat_comics              Bool ,
        cat_franco_belge        Bool ,
        cat_roman_graphique     Bool ,
        cat_alternatif          Bool ,
        cat_docu_bd             Bool ,
        cat_album               Bool ,
        cat_activitee           Bool ,
        cat_divers              Bool ,
        cat_roman               Bool ,
        qt_dispo_fournisseur    Int ,
        qt_stock                Int ,
        qt_depot                Int ,
        qt_reservation          Int ,
        qt_commande_fournisseur Int ,
        quantite                Int NOT NULL ,
        id_stock                Int NOT NULL
	,CONSTRAINT article_PK PRIMARY KEY (id_article)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournisseur
#------------------------------------------------------------

CREATE TABLE fournisseur(
        id_fournisseur  Int  Auto_increment  NOT NULL ,
        nom_fournisseur Varchar (100) NOT NULL ,
        n_rue           Varchar (10) ,
        rue             Varchar (100) ,
        ville           Varchar (100) ,
        code_postal     Int ,
        mail            Varchar (100) ,
        tel_fournisseur Varchar (15) ,
        nom_contact     Varchar (100) ,
        tel_contact     Varchar (15)
	,CONSTRAINT fournisseur_PK PRIMARY KEY (id_fournisseur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournir
#------------------------------------------------------------

CREATE TABLE fournir(
        id_article     Int NOT NULL ,
        id_fournisseur Int NOT NULL ,
        date           Date NOT NULL ,
        quantite       Int NOT NULL
	,CONSTRAINT fournir_PK PRIMARY KEY (id_article,id_fournisseur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: achat
#------------------------------------------------------------

CREATE TABLE achat(
        id_achat        Int  Auto_increment  NOT NULL ,
        type_vente      Varchar (100) NOT NULL ,
        mode_paiement   Varchar (100) ,
        date_paiement   Date ,
        date_commande   Date ,
        date_livraison  Date ,
        statut_paiement Bool ,
        date_jour       Date NOT NULL ,
        id_client       Int NOT NULL
	,CONSTRAINT achat_PK PRIMARY KEY (id_achat)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: client
#------------------------------------------------------------

CREATE TABLE client(
        id_client      Int  Auto_increment  NOT NULL ,
        nom_client     Varchar (100) NOT NULL ,
        prenom_client  Varchar (100) NOT NULL ,
        raison_sociale Varchar (100) ,
        n_rue          Varchar (10) ,
        rue            Varchar (100) ,
        ville          Varchar (100) ,
        code_postal    Int ,
        sexe           Varchar (50) ,
        age            Int ,
        mail           Varchar (100) ,
        tel_fixe       Varchar (15) ,
        tel_mobile     Varchar (15) ,
        date_jour      Date NOT NULL ,
        id_achat       Int NOT NULL
	,CONSTRAINT client_PK PRIMARY KEY (id_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: contient
#------------------------------------------------------------

CREATE TABLE contient(
        id_article         Int NOT NULL ,
        id_achat           Int NOT NULL ,
        quantitee          Int NOT NULL ,
        remise_forfaitaire Int
	,CONSTRAINT contient_PK PRIMARY KEY (id_article,id_achat)
)ENGINE=InnoDB;




ALTER TABLE article
	ADD CONSTRAINT article_stock0_FK
	FOREIGN KEY (id_stock)
	REFERENCES stock(id_stock);

ALTER TABLE fournir
	ADD CONSTRAINT fournir_article0_FK
	FOREIGN KEY (id_article)
	REFERENCES article(id_article);

ALTER TABLE fournir
	ADD CONSTRAINT fournir_fournisseur1_FK
	FOREIGN KEY (id_fournisseur)
	REFERENCES fournisseur(id_fournisseur);

ALTER TABLE achat
	ADD CONSTRAINT achat_client0_FK
	FOREIGN KEY (id_client)
	REFERENCES client(id_client);

ALTER TABLE achat 
	ADD CONSTRAINT achat_client0_AK 
	UNIQUE (id_client);

ALTER TABLE client
	ADD CONSTRAINT client_achat0_FK
	FOREIGN KEY (id_achat)
	REFERENCES achat(id_achat);

ALTER TABLE client 
	ADD CONSTRAINT client_achat0_AK 
	UNIQUE (id_achat);

ALTER TABLE contient
	ADD CONSTRAINT contient_article0_FK
	FOREIGN KEY (id_article)
	REFERENCES article(id_article);

ALTER TABLE contient
	ADD CONSTRAINT contient_achat1_FK
	FOREIGN KEY (id_achat)
	REFERENCES achat(id_achat);
