-- Vorgehensweise
--  - Marker auf Map platzieren, Zielbeschreibung hinzuf�gen
--  - Textnachricht "Neue Mission befohlen"
--  - Zyklische Nachricht "Missionen aktiv, siehe F10Map" alle 5 Minuten wiederholen (global)


trigger.action.outText( "Mission tut was", 30)
trigger.action.removeMark(Trainbridge_id)