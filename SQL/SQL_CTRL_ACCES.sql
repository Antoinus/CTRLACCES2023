#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Personne
#------------------------------------------------------------

CREATE TABLE Personne(
        ID_Personne    Int NOT NULL ,
        NOM            TinyText NOT NULL ,
        Prenom         TinyText NOT NULL ,
        Mail           Text NOT NULL ,
        Telephone      Text NOT NULL ,
        HoraireArrivee Text ,
        HoraireDepart  Text
	,CONSTRAINT Personne_PK PRIMARY KEY (ID_Personne)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Badge_rfid
#------------------------------------------------------------

CREATE TABLE Badge_rfid(
        ID_Badge      Int NOT NULL ,
        Type_de_badge Bool NOT NULL ,
        ID_Personne   Int NOT NULL
	,CONSTRAINT Badge_rfid_PK PRIMARY KEY (ID_Badge)

	,CONSTRAINT Badge_rfid_Personne_FK FOREIGN KEY (ID_Personne) REFERENCES Personne(ID_Personne)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Porte
#------------------------------------------------------------

CREATE TABLE Porte(
        ID_Porte    Int NOT NULL ,
        Description Text NOT NULL
	,CONSTRAINT Porte_PK PRIMARY KEY (ID_Porte)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Autorisation
#------------------------------------------------------------

CREATE TABLE Autorisation(
        ID_Personne  Int NOT NULL ,
        ID_Porte     Int NOT NULL ,
        NivPrivilege Int NOT NULL ,
        Heure_Debut  Datetime NOT NULL ,
        Heure_Fin    Datetime NOT NULL ,
        JourSem      Date NOT NULL
	,CONSTRAINT Autorisation_PK PRIMARY KEY (ID_Personne,ID_Porte)

	,CONSTRAINT Autorisation_Personne_FK FOREIGN KEY (ID_Personne) REFERENCES Personne(ID_Personne)
	,CONSTRAINT Autorisation_Porte0_FK FOREIGN KEY (ID_Porte) REFERENCES Porte(ID_Porte)
)ENGINE=InnoDB;

