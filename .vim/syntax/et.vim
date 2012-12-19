" Vim syntax file
" Language:    Wolfenstein: Enemy Territory configuration file
" Maintainer:  Tobias Hoffmann <tobias_hoffmann@gmx.de>
" Last Change: 20 Aug 2008 11:41:51 Tobias Hoffmann <tobias_hoffmann@gmx.de>
" Credits:     Nikolai Weibull for the et syntax file which this filed is derived from

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword+=-,+

syn keyword etTodo    contained TODO FIXME XXX NOTE

syn region  etComment display oneline start='//' end='$' end=';' keepend contains=etTodo,@Spell
syn region  etString  display oneline start=+"+ skip=+\\\\\|\\"+ end=+"\|$+ contains=etNumbers, @etCommands,@etColors

syn case ignore

syn match etNumbers   display transparent '\<-\=\d\|\.\d' contains=etNumber,etFloat
syn match etNumber    contained display '\d\+\>'
syn match etFloat     contained display '\d\+\.\d*'
syn match etFloat     contained display '\.\d\+\>'


syn cluster etCommands     contains=etCommand


syn keyword etCommand      
	 \ +activate +attack +back +forward +leanleft +leanright +mapexpand +movedown +moveleft +moveright +moveup
	 \ +prone +reload +scores +speed +sprint +stats +topshots +zoom messagemode messagemode2 messagemode3
	 \ mp_fireteamadmin mp_fireteammsg mp_quickmessage mvactivate no notready openlimbomenu ready toggleconsole
	 \ togglemenu vote weapalt weapnext weaponbank yes zoomin
" vsay

syn keyword etKey
	\ , - . 0 1 2 3 4 5 6 7 8 9 = ALT CAPSLOCK CTRL DEL END ESCAPE F1 F10 F11 F12 F2 F3 F4 KP_5 KP_DEL KP_DOWNARROW
	\ KP_END KP_ENTER KP_HOME KP_INS KP_LEFTARROW KP_PGDN KP_PGUP KP_PLUS KP_RIGHTARROW KP_UPARROW MOUSE1 MOUSE2
	\ MOUSE3 MWHEELDOWN MWHEELUP PGDN PGUP RIGHTARROW SPACE TAB ` a b c d e f g l m q r s t u w x y ~

syn keyword etDirective
	\ bind seta unbindall unsafe

syn keyword etVariable
	\ URL bot_enable bot_minplayers cf_wstats cf_wtopshots cg_announcer cg_atmosphericEffects cg_autoAction
	\ cg_autoReload cg_autoactivate cg_autoswitch cg_blinktime cg_bloodDamageBlend cg_bloodFlash cg_bloodTime
	\ cg_bobpitch cg_bobroll cg_bobup cg_bobyaw cg_brassTime cg_cameraOrbitDelay cg_complaintPopUp cg_coronafardist
	\ cg_coronas cg_crosshairAlpha cg_crosshairAlphaAlt cg_crosshairColor cg_crosshairColorAlt cg_crosshairHealth
	\ cg_crosshairPulse cg_crosshairSize cg_crosshairX cg_crosshairY cg_cursorHints cg_cycleAllWeaps
	\ cg_deferPlayers cg_descriptiveText cg_draw2D cg_drawBuddies cg_drawCompass cg_drawCrosshair
	\ cg_drawCrosshairNames cg_drawCrosshairPickups cg_drawFPS cg_drawFireteamOverlay cg_drawGun cg_drawNotifyText
	\ cg_drawReinforcementTime cg_drawRoundTimer cg_drawSmallPopupIcons cg_drawSnapshot cg_drawSpreadScale
	\ cg_drawStatus cg_drawTeamOverlay cg_drawWeaponIconFlash cg_fastSolids cg_fov cg_gibs cg_instanttapout
	\ cg_lagometer cg_marktime cg_noAmmoAutoSwitch cg_noTaunt cg_noVoiceChats cg_noVoiceText cg_popupLimboMenu
	\ cg_predictItems cg_printObjectiveInfo cg_quickMessageAlt cg_railTrailTime cg_recording_statusline cg_runpitch
	\ cg_runroll cg_selectedPlayer cg_selectedPlayerName cg_shadows cg_showblood cg_specHelp cg_stereoSeparation
	\ cg_teamChatHeight cg_teamChatTime cg_teamChatsOnly cg_useScreenshotJPEG cg_useWeapsForZoom cg_viewsize
	\ cg_voiceSpriteTime cg_weaponCycleDelay cg_wolfparticles cg_zoomDefaultBinoc cg_zoomDefaultFG
	\ cg_zoomDefaultSniper cg_zoomDefaultSnooper cg_zoomStepBinoc cg_zoomStepFG cg_zoomStepSnooper cg_zoomfov
	\ cg_zoomstepsniper cl_allowDownload cl_anonymous cl_autoupdate cl_doubletapdelay cl_freelook cl_language
	\ cl_maxPing cl_maxpackets cl_mouseAccel cl_packetdup cl_pitchspeed cl_punkbuster cl_run cl_timeNudge
	\ cl_wwwDownload cl_yawspeed cm_playerCurveClip com_hunkMegs com_introplayed com_maxfps com_recommended
	\ com_recommendedSet com_soundMegs com_watchdog com_watchdog_cmd com_zoneMegs con_autoclear con_debug
	\ demo_avifpsF1 demo_avifpsF2 demo_avifpsF3 demo_avifpsF4 demo_avifpsF5 demo_drawTimeScale demo_infoWindow
	\ fraglimit g_altStopwatchMode g_antilag g_autoFireteams g_banIPs g_complaintlimit g_disableComplaints
	\ g_doWarmup g_enforcemaxlives g_fastResMsec g_fastres g_filterBan g_filtercams g_friendlyFire
	\ g_heavyWeaponRestriction g_inactivity g_ipcomplaintlimit g_landminetimeout g_lms_followTeamOnly
	\ g_lms_lockTeams g_lms_matchlimit g_lms_roundlimit g_lms_teamForceBalance g_log g_logSync g_maxGameClients
	\ g_maxlives g_maxlivesRespawnPenalty g_motd g_noTeamSwitching g_spAwards g_spScores1 g_spScores2 g_spScores3
	\ g_spScores4 g_spScores5 g_spSkill g_spVideos g_spectatorInactivity g_teamForceBalance g_voiceChatsAllowed
	\ g_warmup in_dgamouse in_joystick in_mouse in_shiftedkeys in_subframe joy_threshold m_filter m_forward m_pitch
	\ m_side m_yaw match_latejoin match_minplayers match_mutespecs match_readypercent match_timeoutcount
	\ match_timeoutlength match_warmupDamage name r_allowExtensions r_ati_fsaa_samples r_ati_truform_normalmode
	\ r_ati_truform_pointmode r_ati_truform_tess r_clampToEdge r_colorbits r_customaspect r_customheight
	\ r_customwidth r_depthbits r_detailtextures r_dlightBacks r_drawSun r_dynamiclight r_ext_ATI_pntriangles
	\ r_ext_NV_fog_dist r_ext_compiled_vertex_array r_ext_compressed_textures r_ext_gamma_control
	\ r_ext_multitexture r_ext_texture_env_add r_ext_texture_filter_anisotropic r_facePlaneCull r_fastsky r_finish
	\ r_flares r_fullscreen r_gamma r_glDriver r_glIgnoreWicked3D r_highQualityVideo r_ignoreFastPath
	\ r_ignoreGLErrors r_ignorehwgamma r_inGameVideo r_lastValidRenderer r_lodCurveError r_lodbias r_mode
	\ r_normallength r_nv_fogdist_mode r_oldMode r_overBrightBits r_picmip r_primitives r_railCoreWidth
	\ r_railSegmentLength r_railWidth r_rmse r_roundImagesDown r_simpleMipMaps r_smp r_stencilbits r_stereo
	\ r_subdivisions r_swapInterval r_textureAnisotropy r_textureMode r_texturebits r_trisColor rate
	\ refereePassword s_bits s_channels s_defaultsound s_doppler s_khz s_mixPreStep s_mixahead s_musicvolume
	\ s_separation s_volume s_wavonly sensitivity server1 server10 server11 server12 server13 server14 server15
	\ server16 server2 server3 server4 server5 server6 server7 server8 server9 server_autoconfig server_motd0
	\ server_motd1 server_motd2 server_motd3 server_motd4 server_motd5 snaps snddevice sv_allowDownload
	\ sv_dl_maxRate sv_floodProtect sv_fullmsg sv_hostname sv_lanForceRate sv_master2 sv_master3 sv_master4
	\ sv_master5 sv_maxPing sv_maxRate sv_maxclients sv_minPing sv_minguidage sv_punkbuster sv_wwwBaseURL
	\ sv_wwwDlDisconnected sv_wwwDownload sv_wwwFallbackURL team_maxPanzers team_maxplayers team_nocontrols
	\ timelimit ui_autoredirect ui_bigFont ui_browserGameType ui_browserMaster ui_browserShowAntilag
	\ ui_browserShowEmptyOrFull ui_browserShowFriendlyFire ui_browserShowMaxlives ui_browserShowPasswordProtected
	\ ui_browserShowPunkBuster ui_browserShowTeamBalanced ui_browserShowWeaponsRestricted ui_browserSortKey
	\ ui_campaignIndex ui_ctf_capturelimit ui_ctf_friendly ui_ctf_timelimit ui_currentCampaign
	\ ui_currentCampaignCompleted ui_currentMap ui_currentNetCampaign ui_currentNetMap ui_dedicated
	\ ui_ffa_fraglimit ui_ffa_timelimit ui_gametype ui_glCustom ui_handedness ui_joinGametype ui_mapIndex ui_master
	\ ui_menuFiles ui_netGametype ui_netSource ui_profile_mousePitch ui_r_gamma ui_r_mode ui_rate ui_sensitivity
	\ ui_serverStatusTimeOut ui_showtooltips ui_smallFont ui_teamArenaFirstRun ui_team_fraglimit ui_team_friendly
	\ ui_team_timelimit vm_cgame vm_game vm_ui vote_allow_antilag vote_allow_comp vote_allow_friendlyfire
	\ vote_allow_gametype vote_allow_kick vote_allow_map vote_allow_mutespecs vote_allow_muting vote_allow_nextmap
	\ vote_allow_pub vote_allow_referee vote_allow_shuffleteamsxp vote_allow_swapteams vote_allow_timelimit
	\ vote_allow_warmupdamage vote_limit vote_percent


syn cluster etColors    contains=etRed,etGreen,etYellow,etBlue,etCyan,etPurple,etWhite,etOrange,etGrey,etBlack,etShadow

syn region etRed        contained start=+\^1+hs=e+1 end=+[$^"\n]+he=e-1
syn region etGreen      contained start=+\^2+hs=e+1 end=+[$^"\n]+he=e-1
syn region etYellow     contained start=+\^3+hs=e+1 end=+[$^"\n]+he=e-1
syn region etBlue       contained start=+\^4+hs=e+1 end=+[$^"\n]+he=e-1
syn region etCyan       contained start=+\^5+hs=e+1 end=+[$^"\n]+he=e-1
syn region etPurple     contained start=+\^6+hs=e+1 end=+[$^"\n]+he=e-1
syn region etWhite      contained start=+\^7+hs=e+1 end=+[$^"\n]+he=e-1
syn region etOrange     contained start=+\^8+hs=e+1 end=+[$^"\n]+he=e-1
syn region etGrey       contained start=+\^9+hs=e+1 end=+[$^"\n]+he=e-1
syn region etBlack      contained start=+\^0+hs=e+1 end=+[$^"\n]+he=e-1
syn region etShadow     contained start=+\^[Xx]+hs=e+1 end=+[$^"\n]+he=e-1

hi def link etComment      Comment
hi def link etTodo         Todo
hi def link etString       String
hi def link etNumber       Number
hi def link etFloat        Number
hi def link etDirective    Normal
hi def link etCommand      etCommands
hi def link etCommands     Statement
hi def link etVariable	   PreProc
hi def link etKey	   Identifier


"hi Normal		guifg=#C7D4E2       guibg=#162433
"hi NonText		guifg=#4A6480
"hi constant		guifg=#00CC00
"hi identifier		guifg=white  
"hi statement		guifg=#F9BB00       gui=none
"hi type			guifg=white         gui=underline

hi etRed                ctermfg=Red         guifg=Red
hi etGreen              ctermfg=Green       guifg=Green
hi etYellow             ctermfg=Yellow      guifg=Yellow
hi etBlue               ctermfg=Blue        guifg=Blue
hi etCyan               ctermfg=Cyan        guifg=Cyan
hi etPurple             ctermfg=DarkMagenta guifg=Purple
hi etWhite              ctermfg=White       guifg=White
hi etBlack              ctermfg=Black       guifg=Black
hi etOrange             ctermfg=Brown       guifg=Orange
hi etGrey               ctermfg=LightGrey   guifg=LightGrey
hi etShadow             cterm=underline     gui=underline

let b:current_syntax = "et"

let &cpo = s:cpo_save
unlet s:cpo_save

