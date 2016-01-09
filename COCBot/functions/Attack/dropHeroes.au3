; #FUNCTION# ====================================================================================================================
; Name ..........: dropCC
; Description ...: Will drop heroes in a specific coordinates, only if slot is not -1
; Syntax ........: dropHeroes($x, $y, $KingSlot, $QueenSlot, $WardenSlot)
; Parameters ....: $x                   - X location.
;                  $y                   - Y location.
;                  $KingSlot            - King location in troop menu
;                  $QueenSlot            - King location in troop menu
;                  $WardenSlot            - King location in troop menu
; Return values .: None
; Author ........:
; Modified ......: KnowJack (June2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func dropHeroes($x, $y, $KingSlot = -1, $QueenSlot = -1, $WardenSlot = -1) ;Drops for king and queen and Grand Warden
	If $debugSetLog = 1 Then SetLog("dropHeroes KingSlot " &$KingSlot & " QueenSlot " & $QueenSlot & " WardenSlot " & $WardenSlot  , $Color_Purple)
	If _Sleep($iDelaydropHeroes1) Then Return
	Local $dropKing = False
	Local $dropQueen = False
	Local $dropWarden = False

	If $KingSlot <> -1 And (($iMatchMode <> $DB And $iMatchMode <> $LB) Or $KingAttack[$iMatchMode] = 1) Then
		$dropKing = True
	EndIf
	If $QueenSlot <> -1 And (($iMatchMode <> $DB And $iMatchMode <> $LB) Or $QueenAttack[$iMatchMode] = 1) Then
		$dropQueen = True
	EndIf
	If $WardenSlot <> -1 And (($iMatchMode <> $DB And $iMatchMode <> $LB) Or $WardenAttack[$iMatchMode] = 1) Then
		$dropWarden = True
	EndIf
	If $debugSetLog = 1 Then SetLog("drop KING = " & $dropKing, $Color_Purple)
	If $debugSetLog = 1 Then SetLog("drop QUEEN = " & $dropQueen, $Color_Purple)
	If $debugSetLog = 1 Then SetLog("drop WARDEN = " & $dropWarden, $Color_Purple)

	If $dropKing Then
		SetLog("Dropping King", $COLOR_BLUE)
		Click(GetXPosOfArmySlot($KingSlot, 68), 595 + $bottomOffsetY,1,0,"#0092") ;Select King 860x780
		If _Sleep($iDelaydropHeroes2) Then Return
		Click($x, $y,1,0,"#0093")
		$checkKPower = True
	EndIf

	If _Sleep($iDelaydropHeroes1) Then Return

	If $dropQueen Then
		SetLog("Dropping Queen", $COLOR_BLUE)
		Click(GetXPosOfArmySlot($QueenSlot, 68), 595 + $bottomOffsetY,1,0,"#0094") ;Select Queen 860x780
		If _Sleep($iDelaydropHeroes2) Then Return
		Click($x, $y,1,0,"#0095")
		$checkQPower = True
	EndIf

	If _Sleep($iDelaydropHeroes1) Then Return

	If $dropWarden Then
		SetLog("Dropping Grand Warden", $COLOR_BLUE)
		Click(GetXPosOfArmySlot($WardenSlot, 68), 595 + $bottomOffsetY,1,0,"#X998") ;Select Warden 860x780
		If _Sleep($iDelaydropHeroes2) Then Return
		Click($x, $y,1,0,"#x999")
		$checkWPower = True
	EndIf

EndFunc   ;==>dropHeroes
