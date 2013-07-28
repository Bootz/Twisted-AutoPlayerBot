objectdef cConfig inherits cBase
{
	variable collection:int Sliderx
	variable collection:bool Xboxx
	variable collection:string Combox
	variable collection:string GUIStrings
		
	method Initialize()
	{
	}	
	
	method Shutdown()
	{
		/* save Global and Toon */ 
		This:SaveGlobal
		This:SaveToon
		LavishSettings["Twisted"]:Export["config/settings.xml"]
	}
	
	/* this does nothing */
	method Pulse()
	{	
	}
	
	method LoadSaved()
	{
		LavishSettings:AddSet["Twisted"]
		LavishSettings["Twisted"]:Clear
		LavishSettings["Twisted"]:Import["config/settings.xml"]
		/* load global and toon */
		This:SetGlobalGUI
		This:SetToonGUI
	}

	method SetSetting(string branch, string name, string value)
	{
		if !${LavishSettings["Twisted"].FindSet[${branch}](exists)}
		{
			LavishSettings["Twisted"]:AddSet[${branch}]
		}
		LavishSettings["Twisted"].FindSet[${branch}].FindSetting[${name},0]:Set[${value}]
	}
	
	member GetSetting(string branch, string name, string defaultvalue = NULL)
	{
		if !${LavishSettings["Twisted"].FindSet[${branch}](exists)}
		{
			LavishSettings["Twisted"]:AddSet[${branch}]
		}
		return ${LavishSettings["Twisted"].FindSet[${branch}].FindSetting[${name},${defaultvalue}]}
	}	
	
	/* -------- GLOBAL SETTINGS -------- */
	/* these are options set in GUI that are global across all characters */
	method SetGlobalGUI()
	{		
		This:SetCheckBox["GlobalTwisted","chkLSOFormat","chkLSOFormat@Config@Pages@Twisted"]		
		This:SetCheckBox["GlobalTwisted","chkLogOutput","chkLogOutput@Config@Pages@Twisted"]		
		This:SetCheckBox["GlobalTwisted","chkTranslate","chkTranslate@Config@HumanPages@Human@Pages@Twisted"]
		This:SetCheckBox["GlobalTwisted","chkCaptureWhispers","chkCaptureWhispers@Config@HumanPages@Human@Pages@Twisted",TRUE]
		This:SetCheckBox["GlobalTwisted","chkAutoEmote","chkAutoEmote@Config@HumanPages@Human@Pages@Twisted"]
		This:SetCheckBox["GlobalTwisted","chkUseMount","chkUseMount@Config@Pages@Twisted"]	
		This:SetCheckBox["GlobalTwisted","chkHumanSoundOn","chkHumanSoundOn@Config@HumanPages@Human@Pages@Twisted",TRUE]	
		This:SetCheckBox["GlobalTwisted","chkSoundOn","chkSoundOn@Config@Pages@Twisted",TRUE]	
		This:SetCheckBox["GlobalTwisted","chkErrorSoundOn","chkErrorSoundOn@Config@Pages@Twisted",TRUE]	
		This:SetCheckBox["GlobalTwisted","chkDeathSoundOn","chkDeathSoundOn@Config@Pages@Twisted"]	
		This:SetCheckBox["GlobalTwisted","chkKillSoundOn","chkKillSoundOn@Config@Pages@Twisted"]	
		This:SetCombo["GlobalTwisted","cmbBotGlobalCooldown","cmbBotGlobalCooldown@Overview@Pages@Twisted"]
		This:SetSlider["GlobalTwisted","sldFollowRadius","sldFollowRadius@Config@HumanPages@Human@Pages@Twisted",80]
		This:SetSlider["GlobalTwisted","sldFollowAlertInterval","sldFollowAlertInterval@Config@HumanPages@Human@Pages@Twisted",60]
		This:SetSlider["GlobalTwisted","sldMaxFollows","sldMaxFollows@Config@HumanPages@Human@Pages@Twisted",3]
		This:SetSlider["GlobalTwisted","sldLongIntervalReset","sldLongIntervalReset@Config@HumanPages@Human@Pages@Twisted",36000]
		This:SetCheckBox["GlobalTwisted","chkActiveSonar","chkActiveSonar@Config@HumanPages@Human@Pages@Twisted",TRUE]
		This:SetCheckBox["GlobalTwisted","chkTrackFaction","chkTrackFaction@Config@HumanPages@Human@Pages@Twisted",TRUE]
		This:SetCheckBox["GlobalTwisted","chkTrackOppositeFaction","chkTrackOppositeFaction@Config@HumanPages@Human@Pages@Twisted",TRUE]	
		This:SetCheckBox["GlobalTwisted","chkTargetFollower","chkTargetFollower@Config@HumanPages@Human@Pages@Twisted"]
		This:SetCheckBox["GlobalTwisted","chkFollowLogout","chkFollowLogout@Config@HumanPages@Human@Pages@Twisted"]
		This:SetCheckBox["GlobalTwisted","chkStopOnFollow","chkStopOnFollow@Config@HumanPages@Human@Pages@Twisted"]
		This:SetCheckBox["GlobalTwisted","chkEmoteOnFollow","chkEmoteOnFollow@Config@HumanPages@Human@Pages@Twisted"]
		This:SetCheckBox["GlobalTwisted","chkBeepOnFollow","chkBeepOnFollow@Config@HumanPages@Human@Pages@Twisted",TRUE]	
		This:SetCheckBox["GlobalTwisted","chkNewLocOnFollow","chkNewLocOnFollow@Config@HumanPages@Human@Pages@Twisted"]
		This:SetSlider["GlobalTwisted","sldEmoteTimer","sldEmoteTimer@Config@HumanPages@Human@Pages@Twisted",90]
		This:SetSlider["GlobalTwisted","sldMaxTargetCollection","sldMaxTargetCollection@Overview@Pages@Twisted",5]
	}

	method SaveGlobal()
	{	
		This:SaveCheckBox["GlobalTwisted","chkLSOFormat"]				
		This:SaveCheckBox["GlobalTwisted","chkLogOutput"]		
		This:SaveCheckBox["GlobalTwisted","chkTranslate"]	
		This:SaveCheckBox["GlobalTwisted","chkCaptureWhispers"]	
		This:SaveCheckBox["GlobalTwisted","chkAutoEmote"]	
		This:SaveCheckBox["GlobalTwisted","chkUseMount"]
		This:SaveCheckBox["GlobalTwisted","chkHumanSoundOn"]	
		This:SaveCheckBox["GlobalTwisted","chkSoundOn"]	
		This:SaveCheckBox["GlobalTwisted","chkErrorSoundOn"]
		This:SaveCheckBox["GlobalTwisted","chkDeathSoundOn"]
		This:SaveCheckBox["GlobalTwisted","chkKillSoundOn"]		
		This:SaveCombo["GlobalTwisted","cmbBotGlobalCooldown"]
		This:SaveSlider["GlobalTwisted","sldFollowRadius"]
		This:SaveSlider["GlobalTwisted","sldFollowAlertInterval"]
		This:SaveSlider["GlobalTwisted","sldMaxFollows"]
		This:SaveSlider["GlobalTwisted","sldLongIntervalReSave"]
		This:SaveCheckBox["GlobalTwisted","chkActiveSonar"]
		This:SaveCheckBox["GlobalTwisted","chkTrackFaction"]
		This:SaveCheckBox["GlobalTwisted","chkTrackOppositeFaction"]	
		This:SaveCheckBox["GlobalTwisted","chkTargetFollower"]
		This:SaveCheckBox["GlobalTwisted","chkFollowLogout"]
		This:SaveCheckBox["GlobalTwisted","chkStopOnFollow"]
		This:SaveCheckBox["GlobalTwisted","chkEmoteOnFollow"]
		This:SaveCheckBox["GlobalTwisted","chkBeepOnFollow"]
		This:SaveCheckBox["GlobalTwisted","chkNewLocOnFollow"]		
		This:SaveSlider["GlobalTwisted","sldEmoteTimer"]
		This:SaveSlider["GlobalTwisted","sldMaxTargetCollection"]
		
	}
	
	/* -------- TOON SETTINGS -------- */
	/* these are options set in GUI that are global across a unique Toon */
	method SetToonGUI()
	{
		variable string uniqueToon = "${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Name}"	
		This:SetCheckBox[${uniqueToon},"chkGather","chkGather@Config@InvPages@Inventory@Pages@Twisted",TRUE]		
		This:SetCheckBox[${uniqueToon},"chkLoot","chkLoot@Config@InvPages@Inventory@Pages@Twisted",TRUE]
		This:SetCheckBox[${uniqueToon},"chkHarvestQuests","chkHarvestQuests@Config@InvPages@Inventory@Pages@Twisted",TRUE]
		This:SetCheckBox[${uniqueToon},"chkRoamHerb","chkRoamHerb@Config@InvPages@Inventory@Pages@Twisted",TRUE]
		This:SetCheckBox[${uniqueToon},"chkRoamMine","chkRoamMine@Config@InvPages@Inventory@Pages@Twisted",TRUE]
		This:SetCheckBox[${uniqueToon},"chkAttackPvP","chkAttackPvP@Config@Pages@Twisted"]	
		This:SetCheckBox[${uniqueToon},"chkDefendPvP","chkDefendPvP@Config@Pages@Twisted"]	
		This:SetCheckBox[${uniqueToon},"chkAutoEQ","chkAutoEQ@EQ@Pages@Twisted",TRUE]	
		This:SetCheckBox[${uniqueToon},"chkActionSlot","chkActionSlot@EQ@Pages@Twisted",TRUE]		
		This:SetCombo[${uniqueToon},"cmbLocTimer","cmbLocTimer@Grind@Pages@Twisted"]
		This:SetCombo[${uniqueToon},"cmbPullRange","cmbPullRange@Grind@Pages@Twisted"]
		This:SetCombo[${uniqueToon},"cmbAutoSell","cmbAutoSell@Config@InvPages@Inventory@Pages@Twisted"]
		This:SetCombo[${uniqueToon},"cmbAutoMule","cmbAutoMule@Config@InvPages@Inventory@Pages@Twisted"]
		This:SetSlider[${uniqueToon},"sldLogOutIn","sldLogOutIn@Logout@Pages@Twisted",240]
		This:SetSlider[${uniqueToon},"sldLogOutLevel","sldLogOutLevel@Logout@Pages@Twisted",70]	
		This:SetSlider[${uniqueToon},"sldMaxAdds","sldMaxAdds@Config@Pages@Twisted",3]
		This:SetSlider[${uniqueToon},"sldCorpseCamped","sldCorpseCamped@Config@Pages@Twisted",3]
		This:SetSlider[${uniqueToon},"sldDetectAddRadius","sldDetectAddRadius@Config@Pages@Twisted",20]			
		This:SetCombo[${uniqueToon},"leaveFreeSlots","leaveFreeSlots@Config@InvPages@Inventory@Pages@Twisted"]
		This:SetCheckBox[${uniqueToon},"chkUseMount","chkUseMount@Config@Pages@Twisted",TRUE]	
		This:SetCheckBox[${uniqueToon},"chkTakeFMToPOI","chkTakeFMToPOI@Blacklist@POIPages@POIs@Pages@Twisted"]		
		This:SetCheckBox[${uniqueToon},"chkTakeFMToGrind","chkTakeFMToGrind@Blacklist@POIPages@POIs@Pages@Twisted"]			
		This:SetCheckBox[${uniqueToon},"chkLearnFM","chkLearnFM@Blacklist@POIPages@POIs@Pages@Twisted",TRUE]		
		This:SetCheckBox[${uniqueToon},"chkWeaponSubTypeOnly","chkWeaponSubTypeOnly@EQ@Pages@Twisted"]		
		This:SetCheckBox[${uniqueToon},"chkPartyLeader","chkPartyLeader@PartyConfig@HumanPages@Human@Pages@Twisted"]	
		This:SetCheckBox[${uniqueToon},"chkCanTank","chkCanTank@PartyConfig@HumanPages@Human@Pages@Twisted"]	
		This:SetCheckBox[${uniqueToon},"chkRecordQuest","chkRecordQuest@Quest@HumanPages@Human@Pages@Twisted",FALSE]
		This:SetCheckBox[${uniqueToon},"chkPlayQuest","chkPlayQuest@Quest@HumanPages@Human@Pages@Twisted",FALSE]
		This:SetSlider[${uniqueToon},"sldPartyFollowDistance","sldPartyFollowDistance@PartyConfig@HumanPages@Human@Pages@Twisted",10]	
		This:SetSlider[${uniqueToon},"sldPartyNearDistance","sldPartyNearDistance@PartyConfig@HumanPages@Human@Pages@Twisted",30]
		This:SetSlider[${uniqueToon},"sldAssistRange","sldAssistRange@PartyConfig@HumanPages@Human@Pages@Twisted",100]			
	}
	
	method SaveToon()
	{
		variable string uniqueToon = "${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Name}"		
		This:SaveCheckBox[${uniqueToon},"chkGather"]	
		This:SaveCheckBox[${uniqueToon},"chkLoot"]
		This:SaveCheckBox[${uniqueToon},"chkHarvestQuests"]
		This:SaveCheckBox[${uniqueToon},"chkRoamMine"]
		This:SaveCheckBox[${uniqueToon},"chkRoamHerb"]
		This:SaveCheckBox[${uniqueToon},"chkAttackPvP"]
		This:SaveCheckBox[${uniqueToon},"chkDefendPvP"]
		This:SaveCheckBox[${uniqueToon},"chkAutoEQ"]
		This:SaveCheckBox[${uniqueToon},"chkActionSlot"]			
		This:SaveCombo[${uniqueToon},"cmbLocTimer"]
		This:SaveCombo[${uniqueToon},"cmbPullRange"]
		This:SaveCombo[${uniqueToon},"cmbAutoSell"]
		This:SaveCombo[${uniqueToon},"cmbAutoMule"]	
		This:SaveSlider[${uniqueToon},"sldLogOutIn"]
		This:SaveSlider[${uniqueToon},"sldLogOutLevel"]		
		This:SaveSlider[${uniqueToon},"sldMaxAdds"]
		This:SaveSlider[${uniqueToon},"sldCorpseCamped"]
		This:SaveSlider[${uniqueToon},"sldDetectAddRadius"]					
		This:SaveCombo[${uniqueToon},"leaveFreeSlots"]
		This:SaveCheckBox[${uniqueToon},"chkUseMount"]	
		This:SaveCheckBox[${uniqueToon},"chkTakeFMToPOI"]		
		This:SaveCheckBox[${uniqueToon},"chkTakeFMToGrind"]	
		This:SaveCheckBox[${uniqueToon},"chkLearnFM"]		
		This:SaveCheckBox[${uniqueToon},"chkWeaponSubTypeOnly"]	
		This:SaveCheckBox[${uniqueToon},"chkPartyLeader"]	
		This:SaveCheckBox[${uniqueToon},"chkCanTank"]			
		This:SaveCheckBox[${uniqueToon},"chkRecordQuest"]
		This:SaveCheckBox[${uniqueToon},"chkPlayQuest"]
		This:SaveSlider[${uniqueToon},"sldPartyFollowDistance"]
		This:SaveSlider[${uniqueToon},"sldPartyNearDistance"]		
		This:SaveSlider[${uniqueToon},"sldAssistRange"]			
	}

	/* -------- EDITBOX HANDLERS -------- */
	method SaveEditBox(string configSet, string settingName, string branch)
	{
		LavishSettings["Twisted"].FindSet["${configSet}"]:AddSetting["${settingName}","${UIElement["${branch}"].Text}"]
	}
	
	method LoadEditBox(string configSet, string settingName, string branch)
	{
		UIElement["${branch}"]:SetText[${LavishSettings["Twisted"].FindSet["${configSet}"].FindSetting["${settingName}"].String}]
	}

	
	/* -------- COMBOBOX HANDLERS -------- */
	/* on Load - note: stores guiString in a collection by settingName */
	method SetCombo(string configSet, string settingName, string guiString)
	{
		variable int i
		variable string settingText
		variable string comboText
		
		/* set saved settings */
		if ${LavishSettings["Twisted"].FindSet[${configSet}].FindSetting[${settingName}](exists)}
		{
			settingText:Set["${Config.GetSetting[${configSet},${settingName}]}"]
			for (i:Set[1] ; ${i} <=${UIElement[${guiString}].Items} ; i:Inc)   
			{    
				comboText:Set["${UIElement[${guiString}].Item[${i}]}"]
				if ${settingText.Equal[${comboText}]}        
				{       
					UIElement[${guiString}]:SelectItem[${i}]    
				}
			}
		}
		/* no need to set a default as this is handled in gui.xml */
		This.GUIStrings:Set[${settingName},${guiString}]
		This.Combox:Set[${settingName},"${This.GetCombo[${settingName}]}"]
	}	
	
	/* grabbing combo box info can be a pita, so this simplifies it */
	member GetCombo(string settingName)
	{
		variable string comboText = "${UIElement[${This.GUIStrings.Element[${settingName}]}].Item[${UIElement[${This.GUIStrings.Element[${settingName}]}].Selection}]}"
		return "${comboText}"
	}
	
	/* on GUI update - uses the guiString stored when slider was changed */
	method UpdateCombo(string settingName)
	{
		This:Debug[${settingName} at ${This.GUIStrings.Element[${settingName}]} is ${This.GetComboText[${settingName}]}]
		This.Combox:Set[${settingName},"${This.GetCombo[${settingName}]}"]
	}
	
	/* on Save */
	method SaveCombo(string configSet, string settingName)
	{
		This:SetSetting[${configSet},${settingName},${This.Combox.Element[${settingName}]}]
	}

	/* -------- SLIDER HANDLERS -------- */
	/* on Load - note: stores guiString in a collection by settingName */
	method SetSlider(string configSet, string settingName, string guiString, int defaultValue=0)
	{
		variable int sldvalue
		/* the set saved settings */
		if ${LavishSettings["Twisted"].FindSet[${configSet}].FindSetting[${settingName}](exists)}
		{
			sldvalue:Set[${Config.GetSetting[${configSet},${settingName}]}]
			if ${sldvalue} != ${UIElement[${guiString}].Value}     
			{       
				UIElement[${guiString}]:SetValue[${sldvalue}]     
			}
		}
		elseif ${defaultValue} != ${UIElement[${guiString}].Value}     
		{       
			UIElement[${guiString}]:SetValue[${defaultValue}]     
		}
		This.GUIStrings:Set[${settingName},${guiString}]
		This.Sliderx:Set[${settingName},${This.GetSlider[${settingName}]}]
	}	

	/* grabbing Slider info can be a pita, so this simplifies it */
	member GetSlider(string settingName)
	{
		variable int sldvalue = ${UIElement[${This.GUIStrings.Element[${settingName}]}].Value}
		return ${sldvalue}
	}
	
	/* on GUI update - uses the guiString stored when slider was changed */
	method UpdateSlider(string settingName)
	{
		This:Debug[${settingName} at ${This.GUIStrings.Element[${settingName}]} is ${This.GetSlider[${settingName}]}]
		This.Sliderx:Set[${settingName},${This.GetSlider[${settingName}]}]
	}
	
	/* on Save */
	method SaveSlider(string configSet, string settingName)
	{
		This:SetSetting[${configSet},${settingName},${This.Sliderx.Element[${settingName}]}]
	}
	
	/* -------- CHECKBOX HANDLERS -------- */
	/* on Load - note: stores guiString in a collection by settingName */
	method SetCheckBox(string configSet, string settingName, string guiString, bool defaultValue=FALSE)
	{
		variable bool xbox
		/* first set default values */
		if ${defaultValue}
		{
			UIElement[${guiString}]:SetChecked				
		}
		else
		{
			UIElement[${guiString}]:UnsetChecked	
		}			
		/* the set saved settings */
		if ${LavishSettings["Twisted"].FindSet[${configSet}].FindSetting[${settingName}](exists)}
		{
			xbox:Set[${Config.GetSetting[${configSet},${settingName}]}]
			if ${xbox}
			{
				UIElement[${guiString}]:SetChecked			
			}
			else
			{
				UIElement[${guiString}]:UnsetChecked	
			}
		}
		This.GUIStrings:Set[${settingName},${guiString}]
		This.Xboxx:Set[${settingName},${This.GetCheckbox[${settingName}]}]
	}	
	
	/* grabbing checkbox info can be a pita, so this simplifies it */
	member GetCheckbox(string settingName)
	{
		variable bool xbox = ${UIElement[${This.GUIStrings.Element[${settingName}]}].Checked}
		return ${xbox}
	}	
	
	/* grr -- i know there are two, dont touch */
	member GetCheckBox(string settingName)
	{
		return ${This.GetCheckbox[${settingName}]}
	}		
	
	/* on GUI update - uses the guiString stored when box was set */
	method UpdateCheckBox(string settingName)
	{
		This:Debug[${settingName} at ${This.GUIStrings.Element[${settingName}]} is ${This.GetCheckbox[${settingName}]}]
		This.Xboxx:Set[${settingName},${This.GetCheckbox[${settingName}]}]
	}
	
	/* on Save */
	method SaveCheckBox(string configSet, string settingName)
	{
		This:SetSetting[${configSet},${settingName},${This.Xboxx.Element[${settingName}]}]
	}
	
	/* -------- CLASS HANDLERS -------- */
	/* simplified load and save gui support for use in class routines */
	method SetClassCheckbox(string settingName, string tabName, bool defaultValue=FALSE)
	{
		variable string uniqueToon = "${Me.Name}${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Class}"	
		This:SetCheckBox[${uniqueToon},${settingName},"${settingName}@${tabName}@Pages@ClassGUI",${defaultValue}]
	}

	method SaveClassCheckbox(string settingName)
	{
		variable string uniqueToon = "${Me.Name}${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Class}"
		This:SaveCheckBox[${uniqueToon},${settingName}]		
	}

	method SetClassCombo(string settingName, string tabName)
	{
		variable string uniqueToon = "${Me.Name}${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Class}"	
		This:SetCombo[${uniqueToon},${settingName},"${settingName}@${tabName}@Pages@ClassGUI"]
	}

	method SaveClassCombo(string settingName)
	{
		variable string uniqueToon = "${Me.Name}${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Class}"
		This:SaveCombo[${uniqueToon},${settingName}]		
	}

	method SetClassSlider(string settingName, string tabName, int defaultValue=0)
	{
		variable string uniqueToon = "${Me.Name}${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Class}"	
		This:SetSlider[${uniqueToon},${settingName},"${settingName}@${tabName}@Pages@ClassGUI",${defaultValue}]
	}

	method SaveClassSlider(string settingName)
	{
		variable string uniqueToon = "${Me.Name}${ISXWoW.RealmName.Replace[',REMOVE,.,REMOVE]}${Me.Class}"
		This:SaveSlider[${uniqueToon},${settingName}]		
	}
}
