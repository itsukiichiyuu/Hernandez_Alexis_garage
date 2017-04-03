programme garage

//BUT Creer des tableaux qui stock les voitures dans des garages qui sont tous remplis au début par l'utilisateur
//ENTREE des tableaux a remplir par l'utilisateur
//SORTIE des tableaux complétés

CONS
	AnneAcuelle=2017
	nbGarage=2
	nbMaxVoiture=15
	nbMinVoiture=6

type
	Marque=(Lamborghini,Ferrari,Bentley,Tesla,Mercedes)

	Energie=(Essence,Diesel,GPL,Electrique,Hybride)

	Date=ENREGISTREMENT
		Jour:ENTIER
		Mois:ENTIER
		Annee:ENTIER
	FINENREGISTREMENT

	donnees= ENREGISTREMENT
		N: ENTIER
		voie: CHAINE
		CP: ENTIER
		Ville: CHAINE
		Pays: CHAINE
		NTel: CHAINE
		email: CHAINE
	FINENREGISTREMENT

	garage= ENREGISTREMENT
		nom: CHAINE
		adresse: donnees
		capacite: ENTIER
	FINENREGISTREMENT

	voiture= ENREGISTREMENT
		Marque5: Marque
		Modele: CHAINE
		Energie5: Energie
		PuissF: ENTIER
		PuissD: ENTIER
		Couleur: CHAINE
		Option: CHAINE
		Mill: ENTIER
		PrixN: ENTIER
		Argus: ENTIER
		DateC: Date
		Age: ENTIER
		Plaque: CHAINE
	FINENREGISTREMENT

	TabGarage: tableau[1..nbGarage] en ENTIER
	TabVoiture: tableau[nbMinVoiture..nbMaxVoiture] en ENTIER

//BUT remplir le tableau de garage
//ENTREE le tableau
//SORTIE le tableau remplis
PROCEDURE FabGarage(var GarageTab:TabGarage)
var
	i:ENTIER
DEBUT
	POUR i<- 1 A nbGarage FAIRE

		ECRIRE "Garage n°" & i
		ECRIRE "Entrez le nom du garage"
		LIRE GarageTab[i].nom

		ECRIRE "Entrez l'adresse du garage"
		ECRIRE "Entrez le N°"
		LIRE GarageTab[i].adresse.N

		ECRIRE "Entrez la voie"
		LIRE GarageTab[i].adresse.voie

		ECRIRE "Entre le code postal"
		LIRE GarageTab[i].adresse.CP

		ECRIRE "Entrez la ville"
		LIRE GarageTab[i].adresse.ville

		ECRIRE "Entrez le pays"
		LIRE GarageTab[i].adresse.pays

		ECRIRE "Entrez le numéro de téléphone"
		LIRE GarageTab[i].adresse.NTel

		ECRIRE "Entrez l'adresse E-mail"
		LIRE GarageTab[i].adresse.email

	FINPOUR
FINPROCEDURE

//BUT calculer l'argus de la voiture
//ENTREE le tableau voiture
//SORTIE le tableau voiture mis a jour
FONCTION calculArgus(var VoitureTab:TabVoiture,i:integer)	
DEBUT
	CAS VoitureTab[i].Age PARMIS
	CAS	0:VoitureTab[i].Argus <- VoitureTab[i].PrixN

	CAS	1:VoitureTab[i].Argus <- VoitureTab[i].PrixN - ((VoitureTab[i].PrixN*25) /100)

	CAS	2:VoitureTab[i].Argus <- VoitureTab[i].PrixN - ((VoitureTab[i].PrixN*25) /100)
								 VoitureTab[i].PrixN - ((VoitureTab[i].PrixN*10) /100)

	CAS	3:VoitureTab[i].Argus <- VoitureTab[i].PrixN - ((VoitureTab[i].PrixN*25) /100)
								 VoitureTab[i].PrixN - ((VoitureTab[i].PrixN*10) /100)
								 VoitureTab[i].PrixN - ((VoitureTab[i].PrixN*10) /100)
	CASPARDEFAUT
		VoitureTab[i].Argus <- 0

	FINCASPARMIS
	calculArgus:=VoitureTab[i].Argus
FINFONCTION

//BUT remplir le tableau de voiture
//ENTREE le tableau
//SORTIE le tableau remplis
PROCEDURE FabVoiture(var VoitureTab:TabVoiture,var nbVoiture:ENTIER)
var
	i:ENTIER
DEBUT
	ECRIRE "Combien de voitures avez-vous ?"
	LIRE nbVoiture

	POUR i<-1 A nbVoiture

		ECRIRE "Entrez la marque de la voiture"
		LIRE VoitureTab[i].marque

		ECRIRE "Entrez le modele de la voiture"
		LIRE VoitureTab[i].modele

		ECRIRE "Entrez l'energie qu'utilise la voiture"
		LIRE VoitureTab[i].energie

		ECRIRE "Entrez la puissance fiscale de votre voiture"
		LIRE VoitureTab[i].PuissF

		ECRIRE "Entrez la puissance dynamique"
		LIRE VoitureTab[i].PuissD

		ECRIRE "Entrez la couleur du véhicule"
		LIRE VoitureTab[i].couleur

		ECRIRE "Entrez les options du véhicule (avec des # entre chaque option)"
		LIRE VoitureTab[i].option

		ECRIRE "Entrez l'année du modèle (millesime)"
		LIRE VoitureTab[i].Mill

		ECRIRE "Entrez le prix du modèle (valeur neuf)"
		LIRE VoitureTab[i].PrixN

		ECRIRE "Entrez la date de mise en circulation"
		ECRIRE "Entrez le jour"
		LIRE VoitureTab[i].DateC.Jour

		ECRIRE "Entrez le mois"
		LIRE VoitureTab[i].DateC.Mois

		ECRIRE "Entrez l'année"
		LIRE VoitureTab[i].DateC.Annee

		VoitureTab[i].Age<- AnneAcuelle-VoitureTab[i].DateC.Annee

		calculArgus(VoitureTab,i)

	FINPOUR
FINPROCEDURE
		
var
	GarageTab:TabGarage
	VoitureTab:TabVoiture
	nbVoiture:ENTIER

DEBUT

	FabGarage(GarageTab)
	FabVoiture(VoitureTab)

FIN