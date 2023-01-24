import RPi.GPIO as GPIO
import MFRC522

# Création d'un objet MFRC522
MIFAREReader = MFRC522.MFRC522()

# Boucle infinie pour lire les cartes
while True:
    # Recherche de cartes RFID
    (status, TagType) = MIFAREReader.MFRC522_Request(MIFAREReader.PICC_REQIDL)

    # Si une carte est détectée
    if status == MIFAREReader.MI_OK:
        print("Carte détectée")
    
    # Récupération de l'UID de la carte
    (status, uid) = MIFAREReader.MFRC522_Anticoll()
    
    # Si l'UID est lu avec succès
    if status == MIFAREReader.MI_OK:
        # Affiche l'UID de la carte
        print("UID de la carte : " + str(uid[0]) + "," + str(uid[1]) + "," + str(uid[2]) + "," + str(uid[3]))
