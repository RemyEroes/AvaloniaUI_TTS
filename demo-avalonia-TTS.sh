#!/bin/bash

# constantes
OUTPUT_PATH="$HOME/TTS_OUTPUT"

PHRASE="La Cigale, ayant chanté Tout l'été, Se trouva fort dépourvue Quand la bise fut venue. Pas un seul petit morceau De mouche ou de vermisseau. Elle alla crier famine Chez la Fourmi sa voisine, La priant de lui prêter Quelque grain pour subsister Jusqu'à la saison nouvelle."
LANGUE="$HOME/voices/fr_FR-mls-medium.onnx"

# Définir le fichier de sortie
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="${OUTPUT_PATH}/output_${TIMESTAMP}.wav"

# Commande pour générer le fichier audio
echo "$PHRASE" | $HOME/piper/piper --model "$LANGUE" --output_file "$OUTPUT_FILE"

# Vérifie si la première commande a réussi
if [ $? -eq 0 ]; then
    # Commande pour lire le fichier audio
    mplayer "$OUTPUT_FILE"
else
    echo "La génération du fichier audio a échoué."
fi