; ===========================================================================
; ---------------------------------------------------------------------------
; Flags section. None of this is required, but I added it here to
; make it easier to debug built ROMS! If you would like easier
; assistance from Aurora, please keep this section intact!
; ---------------------------------------------------------------------------
	dc.b "AMPS-v1.1"		; ident str

	if safe
		dc.b "s"		; safe mode enabled

	else
		dc.b " "		; safe mode disabled
	endif

	if FEATURE_FM6
		dc.b "F6"		; FM6 enabled
	endif

	if FEATURE_SFX_MASTERVOL
		dc.b "SM"		; sfx ignore master volume
	endif

	if FEATURE_UNDERWATER
		dc.b "UW"		; underwater mode enabled
	endif

	if FEATURE_MODULATION
		dc.b "MO"		; modulation enabled
	endif

	if FEATURE_MODENV
		dc.b "ME"		; modulation envelope enabled
	endif

	if FEATURE_PORTAMENTO
		dc.b "PM"		; portamento enabled
	endif

	if FEATURE_BACKUP
		dc.b "BA"		; backup enabled
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Define music and SFX
; ---------------------------------------------------------------------------

	if safe=0
		listings off		; if in safe mode, list data section.
	endif

__mus :=	MusOff

MusicIndex:
	; Sonic 3 Prototype OST
	ptrMusic CNZ1P, $20, CNZ2P, $20, ICZ1P, $20, ICZ2P, $20, LBZ1P, $20, LBZ2P, $20
	ptrMusic KnucklesP, $20, CompetitionMenuP, $20, CreditsP, $20, Unknown, $20

	; Sonic 3D OST
	ptrMusic GGZ1, $20, GGZ2, $20, RRZ1, $20, RRZ2, $20, VVZ1, $20, VVZ2, $20
	ptrMusic SSZ1, $20, SSZ2, $20, DDZ1, $20, DDZ2, $20, GGX1, $20, GGX2, $20
	ptrMusic PPZ1, $20, PPZ2, $20, Boss1, $20, Boss2, $20, Boss4, $20, FinalBossD, $20
	ptrMusic InvincibilityD, $20, Intro, $00, MenuD, $20, EndingD, $00, CreditsD, $00

	; Sonic 3 OST
	ptrMusic AIZ1, $20, AIZ2, $20, HCZ1, $20, HCZ2, $20, MGZ1, $20, MGZ2, $20
	ptrMusic CNZ1, $20, CNZ2, $20, ICZ1, $20, ICZ2, $20, LBZ1, $20, LBZ2, $20
	ptrMusic Miniboss, $20, EndBoss, $20, FinalBoss, $20, Knuckles, $20
	ptrMusic Invincibility, $20, ExtraLife, $00, TitleScreen, $00, Ending, $00
	ptrMusic Credits, $00, DataSelect, $20, CompetitionMenu, $20, Drowning, $20
	ptrMusic GotThroughAct, $00, GameOver, $00, Emerald, $00, Continue, $00
	ptrMusic ALZ, $20, BPZ, $20, DPZ, $20, CGZ, $20, EMZ, $20, SpecialStage, $00
	ptrMusic Gumball, $20, SlotMachine, $20, MagneticOrbs, $20

	; Sonic & Knuckles OST
	ptrMusic MHZ1, $20, MHZ2, $20, FBZ1, $20, FBZ2, $20, SOZ1, $20, SOZ2, $20
	ptrMusic LRZ1, $20, HPZ,  $20, SSZ,  $20, DEZ1, $20, DEZ2, $20, DDZ,  $20
	ptrMusic MinibossK, $20, KnucklesK, $20, InvincibilityK, $20, ExtraLifeK, $00
	ptrMusic TitleScreenK, $00, EndingK, $00, CreditsK, $00, SEGA, $00

MusCount =	__mus-MusOff		; number of installed music tracks
SFXoff =	__mus			; first SFX ID
__sfx :=	SFXoff
; ---------------------------------------------------------------------------

SoundIndex:
; Sonic 3 & Knuckles
	ptrSFX	$01, RingRight
	ptrSFX	0, RingLeft, RingLoss, Splash, Break, Jump, Roll, Dash, Skid
	ptrSFX	0, AirDing, Bubble, Drown, SpikeHit, Death, Spindash, BossHit
	ptrSFX	0, FireShield, BubbleShield, ElectricShield, Flying, FlyTired
	ptrSFX	0, FireAttack, BubbleAttack, ElectricAttack, InstaAttack, Grab
	ptrSFX	0, GlideLand, GroundSlide, Shield, SuperTransform, SuperAlt
	ptrSFX	0, Flipper, Switch, Starpost, Signpost, Register, SuperEmerald
	ptrSFX	0, Collapse, BridgeCollapse, TrapDoor, Bumper, SmallBumpers, Clank
	ptrSFX	0, FanLatch, Explode, MissileExplode, MissileThrow, MissileShoot
	ptrSFX	0, Projectile, LevelProjectile, BossProjectile, Lazer, BossLazer
	ptrSFX	0, DoorOpen, DoorMove, DoorClose, FlamethrowerQuiet, PushBlock
	ptrSFX	0, SpikeMove, IceSpikes, FrostPuff, ThumpBoss, FloorThump, Thump
	ptrSFX	0, Crash, FlipBridge, BlockConveyor, Spring, SpringLatch, Blast
	ptrSFX	0, LaunchGrab, LaunchReady, LaunchGo, FloorLauncher, TubeLauncher
	ptrSFX	0, WaterfallSplash, SandSplash, SandwallRise, Transporter, Alarm
	ptrSFX	0, MushroomBounce, WeatherMachine, ChopTree, ChopStuck, LavaBall
	ptrSFX	0, PulleyMove, TunnelBooster, BalloonPlatform, Balloon, Charging
	ptrSFX	0, GravityMachine, Bouncy, GhostAppear, ChainTension, ChainTick
	ptrSFX	0, GravityLift, EnemyBreath, PulleyGrab, Lightning, Targeting
	ptrSFX	0, Hoverpad, MetalTransform, MetalLand, MetalSpark, BossRecovery
	ptrSFX	0, BossHitFloor, BossActivate, EnergyZap, BossZoom, BossMagma
	ptrSFX	0, BossHand, Continue, Error, BigRing, EnterSS, Goal, ActionBlock
	ptrSFX	0, Diamonds, SlotMachine, BlueSphere, AllSpheres, Perfect, Geyser
	ptrSFX	$80, SlideSkidQuiet, WaterSkid, WaveHover, FanSmall, FanBig
	ptrSFX	$80, FlamethrowerLoud, GravityTunnel, TurbineHum, GumballTab
	ptrSFX	$80, ConveyorPlatform, MagneticSpike, WindQuiet, WindLoud
	ptrSFX	$80, Rumble, BigRumble, SpikeBalls, LightTunnel, CannonTurn
	ptrSFX	$80, LeafBlower, LavaFall, BossPanic, LargeShip, EggmanSiren
	ptrSFX	$80, Rising, BossRotate, DeathEggRiseLoud, DeathEggRiseQuiet

; unused S3K sfx
	ptrSFX	$80, SlideSkidLoud
;	p-trSFX	$80, SlideSkidLoud, UnknownSaw, UnknownSpin, UnknownZap
;	p-trSFX	0, UnknownShield, UnknownCharge, UnknownShift, UnknownPump
;	p-trSFX	0, UnknownPowerUp, UnknownPowerDown, UnknownRise, UnknownPlink
;	p-trSFX	0, UnknownOminous, UnknownRevving, UnknownFlutter

; Sonic 3D sfx
;	p-trSFX	0, FlickyCollect, FlickyChirp, FlickyHurt, UnknownCharge, UnknownShieldBroken

SFXcount =	__sfx-SFXoff		; number of intalled sound effects
SFXlast =	__sfx
; ===========================================================================
; ---------------------------------------------------------------------------
; Define samples
; ---------------------------------------------------------------------------

__samp :=	$80
SampleList:
	sample $0000, Stop, Stop			; 80 - Stop sample (DO NOT EDIT)
	sample $0100, Snare, Stop			; 81 - Snare
	sample $0100, Tom, Stop, HighTom		; 82 - High Tom
	sample $00CD, Tom, Stop, MidTom			; 83 - Mid Tom
	sample $00AB, Tom, Stop, LowTom			; 84 - Low Tom
	sample $0093, Tom, Stop, LowerTom		; 85 - Lower Tom

	sample $0100, Kick, Stop			; 86 - Kick
	sample $0100, KickSnare, Stop			; 87 - Kick Snare
	sample $0100, CrashCymbal, Stop			; 88 - Crash Cymbal
	sample $0100, RideCymbal, Stop			; 89 - Ride Cymbal
	sample $0100, MetalBlock, Stop, HighMetalBlock	; 8A - High Metal Hit
	sample $00D0, MetalBlock, Stop, LowMetalBlock	; 8B - Low Metal Hit
	sample $0100, MutedWood, Stop			; 8C - Muted Wood Block
	sample $0100, CowBell, Stop, HighCowBell	; 8D - High Cow Bell
	sample $00C7, CowBell, Stop, LowCowBell		; 8E - Low Cow Bell

	sample $0100, Clap, Stop			; 8F - Clap
	sample $0100, ElecTom, Stop, HighElecTom	; 90 - High Electric Tom
	sample $00C5, ElecTom, Stop, MidElecTom		; 91 - Mid Electric Tom
	sample $00A8, ElecTom, Stop, LowElecTom		; 92 - Low Electric Tom
	sample $008C, ElecTom, Stop, LowerElecTom	; 93 - Lower Electric Tom

	sample $0100, HeavyTom, Stop, HighHeavyTom	; 94 - High Heavy Tom
	sample $00CD, HeavyTom, Stop, MidHeavyTom	; 95 - Mid Heavy Tom
	sample $00B3, HeavyTom, Stop, LowHeavyTom	; 96 - Low Heavy Tom
	sample $0093, HeavyTom, Stop, LowerHeavyTom	; 97 - Lower Heavy Tom

	sample $0100, Timpani, Stop, HighTimpani	; 98 - High Timpani
	sample $00BA, Timpani, Stop, MidTimpani		; 99 - Mid Timpani
	sample $00A9, Timpani, Stop, LowTimpani		; 9A - Low Timpani
	sample $0100, LooseSnare, Stop			; 9B - Loose Snare
	sample $0100, VocalClick, Stop			; 9C - Vocal Click
	sample $0100, VocalKick, Stop			; 9D - Vocal Kick

	sample $0100, VocalSnare, Stop			; 9E - Vocal Snare
	sample $0100, JamHit, Stop			; 9F - Jam! Hit
	sample $0100, JamHitShort, Stop			; A0 - Short Jam! Hit
	sample $0100, GlassKick, Stop			; A1 - Glass Kick
	sample $0100, GlassSmash, Stop			; A2 - Glass Smash

	sample $0100, DanceSnare, Stop			; A3 - Dance Kick Snare
	sample $0100, DanceKick, Stop			; A4 - Dance Kick
	sample $0100, ComeOn, Stop			; A5 - Come On
	sample $0100, HeavySnare, Stop			; A6 - Dance Snare
	sample $0100, LowKick, Stop			; A7 - Low Kick
	sample $0100, LowKickShort, Stop		; A8 - Short Low Kick
	sample $0100, Whoo, Stop			; A9 - Whoo
	sample $0100, Go, Stop				; AA - Go
	sample $0100, SnareGo, Stop			; AB - Go with a Snare
	sample $0100, PowerTom, Stop			; AC - Power Tom

	sample $0100, Wood, Stop, HighWood		; AD - High Wood Block
	sample $00C4, Wood, Stop, LowWood		; AE - Low Wood Block
	sample $0100, Congo, Stop, HighCongo		; AF - High Congo Drum
	sample $00AE, Congo, Stop, LowCongo		; B0 - Low Congo Drum

	sample $0100, CrashHit, Stop			; B1 - Metal Crash Hit
	sample $0100, EchoClap, Stop, HighEchoClap	; B2 - High Echoed Clap
	sample $00C3, EchoClap, Stop, LowEchoClap	; B3 - Low Echoed Clap
	sample $0100, OrchHit, Stop, HighOrchHit	; B4 - High Orchestral Hit
	sample $00EF, OrchHit, Stop, MidOrchHit		; B5 - Mid Orchestral Hit
	sample $0100, KickUh, Stop			; B6 - Kick Uh
	sample $0100, ElecKick, Stop			; B7 - Eletric Kick
	sample $0100, SynthHit, Stop			; B8 - Synth Hit
	sample $0100, SynthHit, Stop, SynthHit2		; B9 - Synth Hit 2

	sample $0100, ReverseCrash, Stop		; BA - Reverse Fading Wind
	sample $0100, Scratch, Stop			; BB - Scratch
	sample $0100, SynthHit3, Stop			; BC - Synth Hit 3
	sample $0100, HeavyKick, Stop			; BD - Heavy Kick
	sample $0100, WhooCrash, Stop			; BE - Crash with a Whoo
	sample $0100, SideStick, Stop			; BF - Side Stick
	sample $0100, KickOh, Stop			; C0 - Kick Oh

	sample $00E1, OrchHit, Stop, LowOrchHit		; C1 - Low Orchestral Hit
	sample $00D1, OrchHit, Stop, LowerOrchHit	; C2 - Lower Orchestral Hit
	sample $00C9, OrchHit, Stop, LowestOrchHit	; C3 - Lowest Orchestral Hit
	sample $010B, OrchHit, Stop, HigherOrchHit	; C4 - Higher Orchestral Hit

	sample $0100, EchoClapS3, Stop, HighEchoClapS3	; C5 - High Echoed Clap (Sonic 3)
	sample $00C3, EchoClapS3, Stop, LowEchoClapS3	; C6 - Low Echoed Clap Hit (Sonic 3)

	sample $0100, LowerKick, Stop			; 9B - Lower Kick (Sonic 3D)
	sample $0100, BigOrchHit, Stop			; 9C - Orchestra Hit (Sonic 3D)
	sample $0100, SEGA, Stop			; C7 - SEGA
; ===========================================================================
; ---------------------------------------------------------------------------
; Define volume envelopes and their data
; ---------------------------------------------------------------------------

vNone =		$00
__venv :=	$01

VolEnvs:
	volenv 01, 02, 03, 04, 05, 06, 07, 08
	volenv 09, 0A, 0B, 0C, 0D, 0E, 0F, 10
	volenv 11, 12, 13, 14, 15, 16, 17, 18
	volenv 19, 1A, 1B, 1C, 1D, 1E, 1F, 20
	volenv 21, 22, 23, 24, 25, 26, 27
VolEnvs_End:
; ---------------------------------------------------------------------------

vd0E:
vd01:		dc.b $10, eStop

vd0F:
vd02:		dc.b $00, $10, $20, $30, $40, $7F, eStop

vd03:		dc.b $10, $08, $00, $00, $08, $10, $10, $10
		dc.b $10, $10, $10, $10, $10, $10, $10, $10
		dc.b $10, $18, $18, $18, $20, $20, $20, $28
		dc.b eHold

vd04:		dc.b $00, $00, $10, $18, $20, $20, $28, $28
		dc.b $28, $30, $30, eHold

vd05:		dc.b $18, $00, $08, $08, $08, $10, $18, $20
		dc.b $20, $28, eHold

vd06:		dc.b $00, $00, $08, $08, $10, $18, $20, $28
		dc.b $28, $30, $40, $38, $38, $30, eHold

vd07:		dc.b $01, $0C, $03, $0F, $02, $07, $03, $0F, eReset

vd08:		dc.b $00, $00, $00, $10, $18, $18, $20, $28
		dc.b $30, $38, $40, $48, $50, $58, $60, $7F
		dc.b eStop

vd16:
vd09:		dc.b $18, $10, $08, $08, $00, $00, $08, $10
		dc.b $18, $20, eHold

vd0A:		dc.b $08, $00, $00, $00, $00, $08, $08, $08
		dc.b $10, $10, $10, $18, $18, $18, $18, $20
		dc.b $20, $20, $28, $28, eHold

vd0B:		dc.b $10, $20, $30, $40, $30, $20, $10, $00
		dc.b $F0, eReset

vd0C:		dc.b $00, $00, $08, $08, $18, $18, $20, $28
		dc.b eStop

vd0D:		dc.b $00, eHold

vd10:		dc.b $08, $08, $08, $00, $00, $00, eHold

vd11:		dc.b $08, $08, $08, $00, $00, $00, eHold

vd12:		dc.b $18, $00, $08, $08, $08, $10, $08, $20
		dc.b $20, $28, eHold

vd13:		dc.b $00, $00, $08, $08, $10, $18, $20, $28
		dc.b $28, $30, $40, $38, $38, $30, eHold

vd14:		dc.b $50, $28, $00, $20, $40, eStop

vd15:		dc.b $00, $00, $00, $10, $18, $18, $20, $28
		dc.b $30, $38, $40, $48, $50, $58, $60, $78
		dc.b eStop

vd17:		dc.b $08, $00, $00, $00, $00, $08, $08, $08
		dc.b $10, $10, $10, $10, $18, $18, $18, $20
		dc.b $20, $20, $28, $28, eHold

vd18:		dc.b $10, $20, $30, $40, $30, $20, $10, $00
		dc.b eReset

vd19:		dc.b $00, $00, $08, $08, $18, $18, $20, $28
		dc.b eStop

vd1A:		dc.b $00, $02, $04, $06, $08, $16, eStop

vd1B:		dc.b $00, $00, $08, $08, $18, $18, $20, $28
		dc.b eStop

vd1C:		dc.b $20, $20, $20, $20, $18, $18, $18, $18
		dc.b $10, $10, $10, $10, $08, $08, $08, $08
		dc.b eStop

vd1D:		dc.b $00, $00, $00, $00, $08, $08, $08, $08
		dc.b $10, $10, $10, $10, $18, $18, $18, $18
		dc.b $20, $20, $20, $20, $28, $28, $28, $28
		dc.b $30, $30, $30, $30, $38, $38, $38, $38
		dc.b $40, $40, $40, $40, $48, $48, $48, $48
		dc.b $50, $50, $50, $50, eHold

vd1E:		dc.b $00, $50, eStop

vd1F:		dc.b $00, $10, $20, eHold

vd20:		dc.b $30, $20, $10, $00, $00, $00, $00, $00
		dc.b $08, $10, $20, $30, eHold

vd21:		dc.b $00, $20, $20, $20, $20, $20, $20, $20
		dc.b $20, $20, $20, $30, $30, $30, $40, $40
		dc.b $50, eStop

vd22:		dc.b $00, $10, $18, $20, $30, $38, eHold

vd23:		dc.b $10, $08, $00, $00, $00, $10, $20, $38
		dc.b eHold

vd24:		dc.b $78, $08, $28, eStop

vd25:		dc.b $40, $30, $10, $18, $20, $28, $30, $38
		dc.b $40, $48, $50, $58, $60, $68, $78, $78
		dc.b $7F, eStop

vd26:		dc.b $00, $00, $00, $00, $00, $00, $00, $00
		dc.b $00, $00, $08, $08, $08, $08, $08, $08
		dc.b $08, $08, $08, $08, $10, $10, $10, $10
		dc.b $10, $10, $10, $10, $10, $10, $18, $18
		dc.b $18, $18, $18, $18, $18, $18, $18, $18
		dc.b $20, $20, $20, $20, $20, $20, $20, $20
		dc.b $20, $20, $28, $28, $28, $28, $28, $28
		dc.b $28, $28, $28, $28, $30, $30, $30, $30
		dc.b $30, $30, $30, $30, $30, $30, $38, $38
		dc.b $38, $38, $38, $38, $38, $38, $38, $38
		dc.b $40, $40, $40, $40, $40, $40, $40, $40
		dc.b $40, $40, $48, $48, $48, $48, $48, $48
		dc.b $48, $48, eStop

vd27:		dc.b $00, $10, $10, $10, $18, $18, $18, $20
		dc.b $20, $20, $28, $28, eStop
		even
; ===========================================================================
; ---------------------------------------------------------------------------
; Define volume envelopes and their data
; ---------------------------------------------------------------------------

mNone =		$00
__menv :=	$01

ModEnvs:
	modenv 01, 02, 03, 04, 05, 06, 07, 08
ModEnvs_End:
; ---------------------------------------------------------------------------

	if FEATURE_MODENV
md02:		dc.b  $00

md01:		dc.b  $01, $02, $01, $00,-$01,-$02,-$03,-$04
		dc.b -$03,-$02,-$01, eHold

md03:		dc.b  $00, $00, $00, $00, $13, $26, $39, $4C
		dc.b  $5F, $72, $7F, $72, eHold

md04:		dc.b  $01, $02, $03, $02, $01, $00,-$01,-$02
		dc.b -$03,-$02,-$01, $00, eLoop, $00

md05:		dc.b  $00, $00, $01, $03, $01, $00,-$01,-$03
		dc.b -$01, $00, eLoop, $02

md06:		dc.b  $00, $00, $00, $00, $00, $0A, $14, $1E
		dc.b  $14, $0A, $00,-$0A,-$14,-$1E,-$14,-$0A
        	dc.b eLoop, $04

md07:		dc.b  $00, $00, $00, $00, $16, $2C, $42, $2C
		dc.b  $16, $00,-$16,-$2C,-$42,-$2C,-$16
		dc.b eLoop,  $03

md08:		dc.b  $01, $02, $03, $04, $03, $02, $01, $00
		dc.b -$01,-$02,-$03,-$04,-$03,-$02,-$01, $00
        	dc.b eLoop, $01
		even
	endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Include music, sound effects and voice bank
; ---------------------------------------------------------------------------

	include "AMPS/Voices.s2a"	; include universal voice bank

; include SFX and music
sfxaddr:	incSFX
musaddr:	incMus
musend:
; ===========================================================================
; ---------------------------------------------------------------------------
; Include samples and filters
; ---------------------------------------------------------------------------

		align	$8000		; must be aligned to bank. By the way, these are also set in Z80.asm. Be sure to check it out
fLog:		binclude "AMPS/filters/Logarithmic.dat"	; logarithmic filter (no filter)
;fLinear:	binclude "AMPS/filters/Linear.dat"	; linear filter (no filter)

dacaddr:	asdata Z80E_Read*(MaxPitch/$100), $00
SWF_Stop:	asdata $8000-(2*Z80E_Read*(MaxPitch/$100)), $80
SWFR_Stop:	asdata Z80E_Read*(MaxPitch/$100), $00
; ---------------------------------------------------------------------------

	incSWF	Snare, Tom, Kick, KickSnare, CrashCymbal, RideCymbal, MetalBlock, MutedWood, Wood
	incSWF	CowBell, Clap, ElecTom, HeavyTom, Timpani, LooseSnare, VocalClick, VocalKick, SEGA
	incSWF	VocalSnare, JamHit, JamHitShort, GlassKick, GlassSmash, DanceSnare, DanceKick, Go
	incSWF	ComeOn, HeavySnare, LowKick, LowKickShort, Whoo, SnareGo, PowerTom, LowerKick
	incSWF	Congo, CrashHit, EchoClap, EchoClapS3, KickUh, ElecKick, SynthHit, ReverseCrash
	incSWF	SynthHit3, HeavyKick, WhooCrash, SideStick, KickOh, BigOrchHit, OrchHit, Scratch
	even

	listing on			; continue source listing
; ===========================================================================
