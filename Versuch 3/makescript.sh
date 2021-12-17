#!/bin/sh
# 
toplevel_entity=std10_12_tb
echo "Erzeuge Waveform für Toplevel Entity \"$toplevel_entity\""

# Anlegen des Arbeistverzeichnisses (falls noch nicht da)
mkdir -p work

# Löschen des Inhalts
rm -f work/*

# Importieren ALLER .vhd Dateien
# in die Bibliothek mit dem Namen work
# Die Bibliothek wird im Directory work/ angelegt z.B. work-obj93.cf
ghdl -i  --work=work --workdir=work *.vhd
if [ $? -ne 0 ]; then exit 1; else echo "--> OK" ; fi # Bei Rückgabe 0 wars ok

# Analyse und Elaboration der VHDL Dateien in der Bibliothek work
# Letzter Parameter ist der Name der top-level Entity
# Es wird die auführbare Datei mit dem Namen der top-level Entity erzeugt
ghdl -m  --work=work -Pwork  --workdir=work $toplevel_entity
if [ $? -ne 0 ]; then exit 1; else echo "--> OK" ; fi # Bei Rückgabe 0 wars ok

# Aufruf der erzeugten Datei mit Simulationsparametern
# Es wird maximal bis zur --stop-time simuliert
# Es wird die vcd Datei "waveform.vcd" erzeugt
./$toplevel_entity --stop-time=600ns --wave="waveform.ghw"
if [ $? -ne 0 ]; then exit 1; else echo "--> OK" ; fi # Bei Rückgabe 0 wars ok

# Aufruf des Simulators als Child-Prozess (& dahinter), damit 
# sich dieses Script beenden kann
# --dump = Name der vcd Datei (hier waveform.vcd), 
#          die von der erzeugten Datei generiert wurde
# --save = Savefile von gtkwave, Einstellungen der Waveforms können 
#           gespeichert werden im Menü File -> "Write Save File"
gtkwave --dump=waveform.ghw --save ./gtkwave_config.gtkw &
