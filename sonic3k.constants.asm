; Equates section - names for variables

; ---------------------------------------------------------------------------
; Object Status Table offsets
; ---------------------------------------------------------------------------

; universally followed object conventions:
render_flags =		  4 ; bitfield ; refer to SCHG for details
height_pixels =		  6 ; byte
width_pixels =		  7 ; byte
priority =		  8 ; word ; in units of $80
art_tile =		 $A ; word ; PCCVH AAAAAAAAAAA ; P = priority, CC = palette line, V = y-flip; H = x-flip, A = starting cell index of art
mappings =		 $C ; long
x_pos =			$10 ; word, or long when extra precision is required
y_pos =			$14 ; word, or long when extra precision is required
mapping_frame =		$22 ; byte
; ---------------------------------------------------------------------------
; conventions followed by most objects:
routine =		  5 ; byte
x_vel =			$18 ; word
y_vel =			$1A ; word
y_radius =		$1E ; byte ; collision height / 2
x_radius =		$1F ; byte ; collision width / 2
anim =			$20 ; byte
prev_anim =		$21 ; byte ; when this isn't equal to anim the animation restarts
anim_frame =		$23 ; byte
anim_frame_timer =	$24 ; byte
angle =			$26 ; byte ; angle about axis into plane of the screen (00 = vertical, 360 degrees = 256)
status =		$2A ; bitfield ; refer to SCHG for details
; ---------------------------------------------------------------------------
; conventions followed by many objects but not Sonic/Tails/Knuckles:
x_pixel =		x_pos ; word ; x-coordinate for objects using screen positioning
y_pixel =		y_pos ; word ; y-coordinate for objects using screen positioning
collision_flags =	$28 ; byte ; TT SSSSSS ; TT = collision type, SSSSSS = size
collision_property =	$29 ; byte ; usage varies, bosses use it as a hit counter
shield_reaction =	$2B ; byte ; bit 3 = bounces off shield, bit 4 = negated by fire shield, bit 5 = negated by lightning shield, bit 6 = negated by bubble shield
subtype =		$2C ; byte
ros_bit =		$3B ; byte ; the bit to be cleared when an object is destroyed if the ROS flag is set
ros_addr =		$3C ; word ; the RAM address whose bit to clear when an object is destroyed if the ROS flag is set
routine_secondary =	$3C ; byte ; used by monitors for this purpose at least
vram_art =		$40 ; word ; address of art in VRAM (same as art_tile * $20)
parent =		$42 ; word ; address of the object that owns or spawned this one, if applicable
child_dx = 		$42 ; byte ; X offset of child relative to parent
child_dy = 		$43 ; byte ; Y offset of child relative to parent
parent3 = 		$46 ; word ; parent of child objects
parent2 =		$48 ; word ; several objects use this instead
respawn_addr =		$48 ; word ; the address of this object's entry in the respawn table
; ---------------------------------------------------------------------------
; conventions specific to Sonic/Tails/Knuckles:
ground_vel =		$1C ; word ; overall velocity along ground, not updated when in the air
double_jump_property =	$25 ; byte ; remaining frames of flight / 2 for Tails, gliding-related for Knuckles
flip_angle =		$27 ; byte ; angle about horizontal axis (360 degrees = 256)
status_secondary =	$2B ; byte ; see SCHG for details
air_left =		$2C ; byte
flip_type =		$2D ; byte ; bit 7 set means flipping is inverted, lower bits control flipping type
object_control =	$2E ; byte ; bit 0 set means character can jump out, bit 7 set means he can't
double_jump_flag =	$2F ; byte ; meaning depends on current character, see SCHG for details
flips_remaining =	$30 ; byte
flip_speed =		$31 ; byte
move_lock =		$32 ; word ; horizontal control lock, counts down to 0
invulnerability_timer =	$34 ; byte ; decremented every frame
invincibility_timer =	$35 ; byte ; decremented every 8 frames
speed_shoes_timer =	$36 ; byte ; decremented every 8 frames
status_tertiary =	$37 ; byte ; see SCHG for details
character_id =		$38 ; byte ; 0 for Sonic, 1 for Tails, 2 for Knuckles
scroll_delay_counter =	$39 ; byte ; incremented each frame the character is looking up/down, camera starts scrolling when this reaches 120
next_tilt =		$3A ; byte ; angle on ground in front of character
tilt =			$3B ; byte ; angle on ground
stick_to_convex =	$3C ; byte ; used to make character stick to convex surfaces such as the rotating discs in CNZ
spin_dash_flag =	$3D ; byte ; bit 1 indicates spin dash, bit 7 indicates forced roll
spin_dash_counter =	$3E ; word
jumping =		$40 ; byte
interact =		$42 ; word ; RAM address of the last object the character stood on
default_y_radius =	$44 ; byte ; default value of y_radius
default_x_radius =	$45 ; byte ; default value of x_radius
top_solid_bit =		$46 ; byte ; the bit to check for top solidity (either $C or $E)
lrb_solid_bit =		$47 ; byte ; the bit to check for left/right/bottom solidity (either $D or $F)
; ---------------------------------------------------------------------------
; conventions followed by some/most bosses:
boss_hitcount2 =	$29
; ---------------------------------------------------------------------------
; when childsprites are activated (i.e. bit #6 of render_flags set)
mainspr_childsprites 	= $16	; amount of child sprites
sub2_x_pos		= $18	;x_vel
sub2_y_pos		= $1A	;y_vel
sub2_mapframe		= $1D
sub3_x_pos		= $1E	;y_radius
sub3_y_pos		= $20	;anim
sub3_mapframe		= $23	;anim_frame
sub4_x_pos		= $24	;anim_frame_timer
sub4_y_pos		= $26	;angle
sub4_mapframe		= $29	;collision_property
sub5_x_pos		= $2A	;status
sub5_y_pos		= $2C	;subtype
sub5_mapframe		= $2F
sub6_x_pos		= $30
sub6_y_pos		= $32
sub6_mapframe		= $35
sub7_x_pos		= $36
sub7_y_pos		= $38
sub7_mapframe		= $3B
sub8_x_pos		= $3C
sub8_y_pos		= $3E
sub8_mapframe		= $41
sub9_x_pos		= $42
sub9_y_pos		= $44
sub9_mapframe		= $47
next_subspr		= $6
; ---------------------------------------------------------------------------
; property of all objects:
object_size =		$4A ; the size of an object's status table entry
next_object =		object_size
; ---------------------------------------------------------------------------
; unknown or inconsistently used offsets that are not applicable to sonic/tails:
objoff_12 =		2+x_pos
objoff_16 =		2+y_pos
objoff_1C =		$1C
objoff_1D =		$1D
objoff_27 =		$27
objoff_2E =		$2E
objoff_2F =		$2F
objoff_30 =		$30
 enum   objoff_31=$31,objoff_32=$32,objoff_33=$33,objoff_34=$34,objoff_35=$35,objoff_36=$36,objoff_37=$37
 enum 	objoff_38=$38,objoff_39=$39,objoff_3A=$3A,objoff_3B=$3B,objoff_3C=$3C,objoff_3D=$3D,objoff_3E=$3E
 enum 	objoff_3F=$3F,objoff_40=$40,objoff_41=$41,objoff_42=$42,objoff_43=$43,objoff_44=$44,objoff_45=$45
 enum 	objoff_46=$46,objoff_47=$47,objoff_48=$48,objoff_49=$49

 ; ---------------------------------------------------------------------------
; Bits 3-6 of an object's status after a SolidObject call is a
; bitfield with the following meaning:
p1_standing_bit   = 3
p2_standing_bit   = p1_standing_bit + 1

p1_standing       = 1<<p1_standing_bit
p2_standing       = 1<<p2_standing_bit

pushing_bit_delta = 2
p1_pushing_bit    = p1_standing_bit + pushing_bit_delta
p2_pushing_bit    = p1_pushing_bit + 1

p1_pushing        = 1<<p1_pushing_bit
p2_pushing        = 1<<p2_pushing_bit


standing_mask     = p1_standing|p2_standing
pushing_mask      = p1_pushing|p2_pushing

; ---------------------------------------------------------------------------
; Controller Buttons
;
; Buttons bit numbers
button_up:			EQU	0
button_down:			EQU	1
button_left:			EQU	2
button_right:			EQU	3
button_B:			EQU	4
button_C:			EQU	5
button_A:			EQU	6
button_start:			EQU	7
; Buttons masks (1 << x == pow(2, x))
button_up_mask:			EQU	1<<button_up	; $01
button_down_mask:		EQU	1<<button_down	; $02
button_left_mask:		EQU	1<<button_left	; $04
button_right_mask:		EQU	1<<button_right	; $08
button_B_mask:			EQU	1<<button_B	; $10
button_C_mask:			EQU	1<<button_C	; $20
button_A_mask:			EQU	1<<button_A	; $40
button_start_mask:		EQU	1<<button_start	; $80

; ---------------------------------------------------------------------------
; Player Status Variables
Status_Facing       = 0
Status_InAir        = 1
Status_Roll         = 2
Status_OnObj        = 3
Status_RollJump     = 4
Status_Push         = 5
Status_Underwater   = 6

; ---------------------------------------------------------------------------
; Player status_secondary variables
Status_Shield       = 0
Status_Invincible   = 1
Status_SpeedShoes   = 2

Status_FireShield   = 4
Status_LtngShield   = 5
Status_BublShield   = 6

; ---------------------------------------------------------------------------
; Elemental Shield DPLC variables
LastLoadedDPLC      = $34
Art_Address         = $38
DPLC_Address        = $3C

; ---------------------------------------------------------------------------
; Address equates
; ---------------------------------------------------------------------------

; Z80 addresses
Z80_RAM =			$A00000 ; start of Z80 RAM
Z80_RAM_end =			$A02000 ; end of non-reserved Z80 RAM
Z80_bus_request =		$A11100
Z80_reset =			$A11200

SRAM_access_flag =		$A130F1
Security_addr =			$A14000
; ---------------------------------------------------------------------------

; I/O Area
HW_Version =			$A10001
HW_Port_1_Data =		$A10003
HW_Port_2_Data =		$A10005
HW_Expansion_Data =		$A10007
HW_Port_1_Control =		$A10009
HW_Port_2_Control =		$A1000B
HW_Expansion_Control =		$A1000D
HW_Port_1_TxData =		$A1000F
HW_Port_1_RxData =		$A10011
HW_Port_1_SCtrl =		$A10013
HW_Port_2_TxData =		$A10015
HW_Port_2_RxData =		$A10017
HW_Port_2_SCtrl =		$A10019
HW_Expansion_TxData =		$A1001B
HW_Expansion_RxData =		$A1001D
HW_Expansion_SCtrl =		$A1001F
; ---------------------------------------------------------------------------

; VDP addresses
VDP_data_port =			$C00000
VDP_control_port =		$C00004
PSG_input =			$C00011
; ---------------------------------------------------------------------------

; RAM addresses

Sprite_table_buffer_2 =		ramaddr(   $FF7880 ) ; $280 bytes ; alternate sprite table for player 1 in competition mode
Sprite_table_buffer_P2 =	ramaddr(   $FF7B00 ) ; $280 bytes ; sprite table for player 2 in competition mode
Sprite_table_buffer_P2_2 =	ramaddr(   $FF7D80 ) ; $280 bytes ; alternate sprite table for player 2 in competition mode

	phase $FFFF0000
RAM_start =			*
Chunk_table			ds.b $8000		; chunk (128x128) definitions, $80 bytes per definition

Level_layout_header		ds.b 8			; first word = chunks per FG row, second word = chunks per BG row, third word = FG rows, fourth word = BG rows
Level_layout_main		ds.b $FF8		; $40 word-sized line pointers followed by actual layout data
Object_respawn_table_2 =	Level_layout_header+$400; $200 bytes ; respawn table used by glowing spheres bonus stage, because... Reasons?
Ring_status_table_2 =		Level_layout_header+$600; $300 bytes ; rinng status table used by glowing spheres bonus stage, because... Reasons?
Block_table			ds.b $1800		; block (16x16) definitions, 8 bytes per definition, spece for $300 blocks
SStage_collision_response_list = Block_table+$1400	; $100 bytes ; sprite collision list during a special stage
SStage_unkA500 =		Block_table+$1500	; unknown special stage array
SStage_unkA600 =		Block_table+$1600	; unknown special stage array
HScroll_table			ds.b $200		; array of background scroll positions for the level. WARNING: some references are before this label
_unkA880 =			HScroll_table+$80	; used in SSZ screen/background events
_unkA8E0 =			HScroll_table+$E0	; used in SSZ screen/background events
Nem_code_table			ds.b $200		; code table is built up here and then used during decompression
Sprite_table_input		ds.b $400		; 8 priority levels, $80 bytes per level

Object_RAM =			*			; $1FCC bytes ; $4A bytes per object, 110 objects
Player_1			ds.b object_size	; main character in 1 player mode, player 1 in Competition mode
Player_2			ds.b object_size	; Tails in a Sonic and Tails game, player 2 in Competition mode
Reserved_object_3		ds.b object_size	; during a level, an object whose sole purpose is to clear the collision response list is stored here
Dynamic_object_RAM		ds.b object_size*78	; $1A04 bytes ; 84 objects
Dynamic_object_RAM_end =	*
Level_object_RAM =		Dynamic_object_RAM_end	; $4EA bytes ; various fixed in-level objects		; unknown
Breathing_bubbles		ds.b object_size	; for the main character
Breathing_bubbles_P2		ds.b object_size	; for Tails in a Sonic and Tails game
Super_stars =			*			; for Super Sonic and Super Knuckles
Tails_tails_2P			ds.b object_size	; Tails' tails in Competition mode
Tails_tails			ds.b object_size	; Tails' tails
Dust				ds.b object_size
Dust_P2				ds.b object_size
Shield				ds.b object_size
Shield_P2		;	ds.b object_size	; left over from Sonic 2 I'm guessing
Invincibility_stars_P2	;	ds.b object_size*3
Invincibility_stars		ds.b object_size*4
Wave_Splash			ds.b object_size	; Obj_HCZWaveSplash is loaded here
Object_RAM_end =		*
Object_clr_end =		*

Kos_decomp_buffer		ds.b $1000		; each module in a KosM archive is decompressed here and then DMAed to VRAM
H_scroll_buffer			ds.b $380		; horizontal scroll table is built up here and then DMAed to VRAM
Collision_response_list		ds.b $80		; only objects in this list are processed by the collision response routines
Stat_table =			*			; used by Tails' AI in a Sonic and Tails game
Pos_table_P2			ds.b $100		; used by Player 2 in competition mode
Pos_table 			ds.b $100		;
Ring_status_table		ds.b $400		; 1 word per ring
Ring_status_table_end =		*
Emerald_flicker_flag =		*			; controls the emerald flicker in save screen and special stage results.
Object_respawn_table		ds.b $300		; 1 byte per object, every object in the level gets an entry

DMA_queue			ds.w $12*7		; stores all the VDP commands necessary to initiate a DMA transfer
DMA_queue_slot			ds.l 1			; points to the next free slot on the queue
Save_pointer			ds.l 1			; pointer to the active save slot in 1 player mode
Competition_saved_data		ds.b $54		; saved data from Competition Mode
Saved_data			ds.b $54		; saved data from 1 player mode

Drvmem				ds.b $5A2		; this area is reserved for AMPS

Camera_RAM =			*			; various camera and scroll-related variables are stored here
H_scroll_amount			ds.w 1			; number of pixels camera scrolled horizontally in the last frame * $100
V_scroll_amount			ds.w 1			; number of pixels camera scrolled vertically in the last frame * $100
H_scroll_amount_P2		ds.w 1
V_scroll_amount_P2		ds.w 1
_unkEE08			ds.b 1			; this is actually unused
			ds.b 1				; unused
Scroll_lock			ds.b 1			; if this is set scrolling routines aren't called
Scroll_lock_P2			ds.b 1
Camera_target_min_X_pos		ds.w 1
Camera_target_max_X_pos		ds.w 1
Camera_target_min_Y_pos		ds.w 1
Camera_target_max_Y_pos		ds.w 1
Camera_min_X_pos		ds.w 1
Camera_max_X_pos		ds.w 1
Camera_min_Y_pos		ds.w 1
Camera_max_Y_pos		ds.w 1			; this is the only one which ever differs from its target value
Camera_min_X_pos_P2		ds.w 1
Camera_max_X_pos_P2		ds.w 1
Camera_min_Y_pos_P2		ds.w 1
Camera_max_Y_pos_P2		ds.w 1
H_scroll_frame_offset		ds.w 1			; if this is non-zero with value x, horizontal scrolling will be based on the player's position x / $100 + 1 frames ago
Pos_table_index			ds.w 1			; goes up in increments of 4
H_scroll_frame_offset_P2	ds.w 1
Pos_table_index_P2		ds.w 1
Distance_from_top		ds.w 1			; the vertical scroll manager scrolls the screen until the player's distance from the top of the screen is equal to this (or between this and this + $40 when in the air). $60 by default
Distance_from_top_P2		ds.w 1
Deform_lock			ds.b 1
			ds.b 1				; unused
Camera_max_Y_pos_changing	ds.b 1			; set when the maximum camera Y pos is undergoing a change
Dynamic_resize_routine		ds.b 1
			ds.b 5				; unused
Fast_V_scroll_flag		ds.b 1			; if this is set vertical scroll when the player is on the ground and has a speed of less than $800 is capped at 24 pixels per frame instead of 6
V_scroll_value_P2_copy		ds.l 1			; upper word for foreground, lower word for background
Camera_X_diff			ds.w 1			; difference between Camera_X_pos_copy and Camera_X_pos_BG_copy, used for background collision in SSZ and other levels
Camera_Y_diff			ds.w 1			; difference between Camera_Y_pos_copy and Camera_Y_pos_BG_copy, used for background collision in SSZ and other levels
Ring_start_addr_ROM		ds.l 1			; address in the ring layout of the first ring whose X position is >= camera X position - 8
Ring_end_addr_ROM		ds.l 1			; address in the ring layout of the first ring whose X position is >= camera X position + 328
Ring_start_addr_RAM		ds.w 1			; address in the ring status table of the first ring whose X position is >= camera X position - 8
			ds.w 1				; unused
Apparent_zone_and_act =		*
Apparent_zone			ds.b 1			; always equal to actual zone
Apparent_act			ds.b 1			; for example, after AIZ gets burnt, this indicates act 1 even though it's actually act 2
Palette_fade_timer		ds.w 1			; the palette gets faded in until this timer expires
_unkEE52			ds.l 1			; something to do with competition mode
_unkEE56			ds.l 1			; something to do with competition mode. Wiki said this was to do with demos, but I doubt that's the case
_unkEE5A			ds.b 1
			ds.b 1				; unused
_unkEE5C			ds.w 1
Act3_flag			ds.b 1			; set when entering LRZ 3 or DEZ 3 directly from previous act. Prevents title card from loading
			ds.b 1				; unused
Camera_X_pos_P2			ds.l 1
Camera_Y_pos_P2			ds.l 1
Camera_X_pos_P2_copy		ds.w 1
			ds.w 1				; unused
Camera_Y_pos_P2_copy		ds.w 1
			ds.w 1				; unused
_unkEE70			ds.w 1			; it is unclear how this is used
			ds.w 1				; unused
_unkEE74			ds.w 1			; it is unclear how this is used
			ds.w 1				; unused
Camera_X_pos			ds.l 1
Camera_Y_pos			ds.l 1
Camera_X_pos_copy		ds.l 1
Camera_Y_pos_copy		ds.l 1
Camera_X_pos_rounded		ds.w 1			; rounded down to the nearest block boundary ($10th pixel)
Camera_Y_pos_rounded		ds.w 1			; rounded down to the nearest block boundary ($10th pixel)
Camera_X_pos_BG_copy		ds.w 1
_unkEE8E			ds.w 1			; various uses in screen/background events and competition mode

Camera_Y_pos_BG_copy		ds.l 1
Camera_X_pos_BG_rounded		ds.w 1			; rounded down to the nearest block boundary ($10th pixel)
Camera_Y_pos_BG_rounded		ds.w 1			; rounded down to the nearest block boundary ($10th pixel)
_unkEE98			ds.l 1			; various uses in screen/background events and competition mode
_unkEE9C			ds.l 1			; various uses in screen/background events and competition mode
_unkEEA0			ds.w 1			; various uses in screen/background events and competition mode
_unkEEA2			ds.w 1			; various uses in screen/background events and competition mode
Plane_double_update_flag	ds.w 1			; set when two block are to be updated instead of one (i.e. the camera's scrolled by more than $10 pixels)
Special_V_int_routine		ds.w 1
Screen_X_wrap_value		ds.w 1			; set to $FFFF
Screen_Y_wrap_value		ds.w 1			; either $7FF or $FFF
Camera_Y_pos_mask		ds.w 1			; either $7F0 or $FF0
Layout_row_index_mask		ds.w 1			; either $3C or $7C

_unkEEB0			ds.w 1			;
Special_events_routine		ds.w 1			; routine counter for various special events. Used for example with LBZ2 Death Egg sequence
Events_fg_0			ds.w 1			; various flags used by screen events
Events_fg_1			ds.w 1			; various flags used by screen events
Events_fg_2			ds.w 1			; various flags used by screen events
_unkEEBA			ds.w 1			; only used in Sonic 3
Level_repeat_offset		ds.w 1			; the number of pixels the screen was moved this frame, used to offset level objects horizontally. Used only for level repeat sections, such as AIZ airship.
Events_fg_3			ds.w 1			; various flags used by screen events
Events_routine_fg		ds.w 1			; screen events routine counter
Events_routine_bg		ds.w 1			; background events routine counter
Events_fg_4			ds.w 1			; various flags used by screen events
Events_fg_5			ds.w 1			; various flags used by screen events
Draw_delayed_position		ds.w 1			; position to redraw screen from. Screen is reloaded 1 row at a time to avoid game lag
Draw_delayed_rowcount		ds.w 1			; number of rows for screen redrawing. Screen is reloaded 1 row at a time to avoid game lag
Screen_shake_flag		ds.w 1			; flag for enabling screen shake. Negative values cause screen to shake infinitely, positive values make the screen shake for a short amount of time
Screen_shake_offset		ds.w 1			; vertical offset when screen_shake_flag is enabled. This is added to camera position later
Screen_shake_last_offset	ds.w 1			; value of Screen_shake_offset for the previous frame

Events_bg			ds.b $18		; $18 bytes ; various flags used by background events
SStage_results_object_addr =	Events_bg+$E		; word ; RAM address of the special stage results object
FBZ_cloud_addr =		*			; $14 bytes ; addresses for cloud objects in FBZ2
Vscroll_buffer =		*			; $50 bytes ; vertical scroll buffer used in various levels
_unkEEEA			ds.w 1			; various unknown uses for EEEA
			ds.w 1				; used in some instances (see above)
_unkEEEE			ds.w 1			; used exclusively in SSZ background events code
			ds.w 1				; used in some instances (see above)
_unkEEF2			ds.w 1			; used exclusively in SSZ background events code
_unkEEF4			ds.w 1			; used exclusively in SSZ background events code
_unkEEF6			ds.l 1			; used exclusively in SSZ background events code
_unkEEFA			ds.w 1			; used exclusively in SSZ background events code
			ds.b $3E			; used in some instances (see above)

Spritemask_flag			ds.w 1			; when set, indicates that special sprites are used for sprite masking
Use_normal_sprite_table		ds.w 1			; if this is set Sprite_table_buffer and Sprite_table_buffer_P2 will be DMAed instead of Sprite_table_buffer_2 and Sprite_table_buffer_P2_2
Switch_sprite_table		ds.w 1			; if set, switches the state of Use_normal_sprite_table
Event_LBZ2_DeathEgg =		*			; if set, Launch Base 2 Death Egg is currently rising
_unkEF40_1			ds.l 1			; used as a part of calculating decimal scores
_unkEF44_1 =			*			; used as a jump pointer in vint 1E, unknown why this is used
_unkEF44_2			ds.l 1			; used as a part of calculating decimal scores
Competition_menu_selection	ds.b 1			; 0 = Grandprix, 1 = Matchrace, 2 = Timeattack. 3 = Exit
Not_ghost_flag			ds.b 1			; set if Player 2 in competition mode isn't a ghost of player 1
Competition_menu_zone		ds.b 1			; competition mode zone id. This is different from the zone order in game
Dataselect_entry		ds.b 1			; the selected save entry in data select menu. This includes no save and delete options, too
Dataselect_nosave_player	ds.w 1			; Player mode for NO SAVE option in data select menu
Competition_menu_monitors	ds.b 1			; 0 = Enabled, FF = Disabled
			ds.b 1				; unused
Demo_start_button		ds.b 1			; keeps track of whether controller 1 has pressed the start button. May be used by the demo data itself
			ds.b 1				; unused
Demo_data_addr			ds.l 1			; keeps getting incremented as the demo progresses
SRAM_mask_interrupts_flag	ds.w 1			; if this is set SRAM routines will mask all interrupts (by setting the SR to $2700)
			ds.w 1				; unused
Object_index_addr		ds.l 1			; points to either the object index for S3 levels or that for S&K levels
Act3_ring_count			ds.w 1			; stores ring count during act 3 transition
Act3_timer			ds.l 1			; stores timer during act 3 transition
Camera_Y_pos_coarse_back	ds.w 1			; Camera_Y_pos_coarse - $80
Glide_screen_shake		ds.w 1			; alternate screen shaking flag only used when hyper knuckles hits a wall after gliding
_unkEF68			ds.w 1			; stores a tile used in special stage results screen, unknown purpose
Special_stage_zone_and_act	ds.w 1			; stored zone and act during special stage results screen?
HPZ_special_stage_completed	ds.w 1			; set if special stage was completed. This determines which cutscene to play when entering HPZS
Current_special_stage_2		ds.b 1			; seems to be just a copy of Current_special_stage
			ds.b 1				; unused
HPZ_current_special_stage	ds.b 1			; seems to be just a copy of Current_special_stage used specifically for HPZS
			ds.b 1				; unused
Ending_running_flag		ds.w 1			; the only thing this does is prevent the game from pausing
Plane_buffer_2_addr		ds.l 1			; the address of the second plane buffer to process, if applicable
Demo_hold_counter		ds.b 1			; the number of frames to hold the current buttons. This only applies to S&K demos
Demo_hold_buttons		ds.b 1			; the buttons to hold. This only applies to S&K demos
Demo_number			ds.w 1			; the currently running demo
			ds.l 1				; unused

Ring_consumption_table =	*			; $80 bytes ; stores the addresses of all rings currently being consumed
Ring_consumption_count		ds.w 1			; the number of rings being consumed currently
Ring_consumption_list		ds.w $3F		; the remaining part of the ring consumption table
SStage_layout_buffer =		*			; $600 bytes ; yes, this area is used to for special stage layouts!
Plane_buffer			ds.b $480		; used by level drawing routines
VRAM_buffer			ds.b $80		; used to temporarily hold data while it is being transferred from one VRAM location to another
Target_water_palette		ds.b $80		; used by palette fading routines
Water_palette			ds.b $80		; this is what actually gets displayed
Water_palette_line_2 =		Water_palette+$20	; $20 bytes
Water_palette_line_3 =		Water_palette+$40	; $20 bytes
Water_palette_line_4 =		Water_palette+$60	; $20 bytes
Target_palette			ds.b $80		; used by palette fading routines
Target_palette_line_2 =		Target_palette+$20	; $20 bytes
Target_palette_line_3 =		Target_palette+$40	; $20 bytes
Target_palette_line_4 =		Target_palette+$60	; $20 bytes
Normal_palette			ds.b $80
Normal_palette_line_2 =		Normal_palette+$20	; $20 bytes
Normal_palette_line_3 =		Normal_palette+$40	; $20 bytes
Normal_palette_line_4 =		Normal_palette+$60	; $20 bytes

Game_mode			ds.b 1
			ds.b 1				; unused
Ctrl_1_logical =		*			; both held and pressed
Ctrl_1_held_logical		ds.b 1
Ctrl_1_pressed_logical		ds.b 1
Ctrl_1 =			*			; both held and pressed
Ctrl_1_held			ds.b 1			; all held buttons
Ctrl_1_pressed			ds.b 1			; buttons being pressed newly this frame
Ctrl_2 =			*			; both held and pressed
Ctrl_2_held			ds.b 1
Ctrl_2_pressed			ds.b 1
_tempF608		ds.b 6				; this is used in Sonic 3 Alone, but unused in Sonic & Knuckles and Sonic 3 Complete

VDP_reg_1_command		ds.w 1			; AND the lower byte by $BF and write to VDP control port to disable display, OR by $40 to enable
			ds.l 1				; unused
Demo_timer			ds.w 1			; the time left for a demo to start/run
V_scroll_value =		*			; both foreground and background
V_scroll_value_FG		ds.w 1
V_scroll_value_BG		ds.w 1
_unkF61A			ds.l 1			; unused
V_scroll_value_P2 =		*
V_scroll_value_FG_P2		ds.w 1
V_scroll_value_BG_P2		ds.w 1
Teleport_active_timer		ds.b 1			; left over from Sonic 2
Teleport_active_flag		ds.b 1			; left over from Sonic 2
H_int_counter_command		ds.w 1			; contains a command to write to VDP register $0A (line interrupt counter)
H_int_counter =			H_int_counter_command+1	; just the counter part of the command
Palette_fade_info =		*			; both index and count
Palette_fade_index		ds.b 1			; colour to start fading from
Palette_fade_count		ds.b 1			; the number of colours to fade
Lag_frame_count			ds.w 1			; more specifically, the number of times V-int routine 0 has run. Reset at the end of a normal frame
V_int_routine			ds.b 1
H_int_counter_last		ds.b 1			; last value for h-int counter
Sprites_drawn			ds.b 1			; used to ensure the sprite limit isn't exceeded
			ds.b 1				; unused
Water_palette_data_addr		ds.l 1			; points to the water palette data for the current level
Palette_cycle_counter0		ds.w 1			; various counters and variables for palette cycles
Palette_cycle_counter1		ds.w 1			; various counters and variables for palette cycles
RNG_seed			ds.l 1			; used by the random number generator
Game_paused			ds.w 1
			ds.l 1				; unused
DMA_trigger_word		ds.w 1			; transferred from RAM to avoid crashing the Mega Drive
			ds.w 1				; unused
H_int_flag			ds.w 1			; unless this is set H-int will return immediately

Water_level			ds.w 1			; keeps fluctuating
Mean_water_level		ds.w 1			; the steady central value of the water level
Target_water_level		ds.w 1
Water_speed			ds.b 1			; this is added to or subtracted from Mean_water_level every frame till it reaches Target_water_level
Water_entered_counter		ds.b 1			; incremented when entering and exiting water, read by the the floating AIZ spike log, cleared on level initialisation and dynamic events of certain levels
Water_full_screen_flag		ds.b 1			; set if water covers the entire screen (i.e. the underwater pallete should be DMAed during V-int rather than the normal palette)
Do_Updates_in_H_int		ds.b 1			; if this is set Do_Updates will be called from H-int instead of V-int
Palette_cycle_counters		ds.b $C			; various counters and variables for palette cycles
Palette_frame			ds.w 1
Palette_timer			ds.b 1
Super_palette_status		ds.b 1			 ; appears to be a flag for the palette's current status: '0' for 'off', '1' for 'fading', -1 for 'fading done'
_unkF660			ds.w 1
_unkF662			ds.w 1			 ; unused
Background_collision_flag	ds.b 1			 ; if set, background collision is enabled
Disable_death_plane		ds.b 1			 ; if set, going below the screen wont kill the player
Hyper_Sonic_flash_timer		ds.b 1			 ; used for Hyper Sonic's double jump move
Super_Tails_flag		ds.b 1
Palette_frame_Tails		ds.b 1			 ; Tails would use Palette_frame and Palette_timer, but they're reserved for his Super Flickies
Palette_timer_Tails		ds.b 1
Ctrl_2_logical =		*			 ; both held and pressed
Ctrl_2_held_logical		ds.b 1
Ctrl_2_pressed_logical		ds.b 1
_unkF66C			ds.b 1
			ds.b 3				; unused
Super_frame_count		ds.w 1
			ds.l 1				; unused
Scroll_force_positions		ds.b 1			; if this is set scrolling will be based on the two variables below rather than the player's actual position
			ds.b 1				; unused
Scroll_forced_X_pos		ds.w 1
			ds.w 1				; unused
Scroll_forced_Y_pos		ds.w 1			; note: must be exactly 4 bytes after Scroll_forced_X_pos
			ds.w 1				; unused

Tails_CPU_interact		ds.w 1			; RAM address of the last object Tails stood on while controlled by AI
Tails_CPU_idle_timer		ds.w 1			; counts down while controller 2 is idle, when it reaches 0 the AI takes over
Tails_CPU_flight_timer		ds.w 1			; counts up while Tails is respawning, when it reaches 300 he drops into the level
			ds.w 1				; unused
Tails_CPU_routine		ds.w 1			; Tails' current AI routine in a Sonic and Tails game
Tails_CPU_target_X		ds.w 1			; Tails' target x-position
Tails_CPU_target_Y		ds.w 1			; Tails' target y-position
_unkF70E			ds.b 1
_unkF70F			ds.b 1
Rings_manager_routine		ds.b 1
Level_started_flag		ds.b 1
_unkF712			ds.b $1C		; ??? ; unknown object respawn table
AIZ1_palette_cycle_flag		ds.b 1			; selects which palette cycles are used in AIZ1
Water_flag			ds.b 1
Conveyor_belt_load_array	ds.b $E			; each subtype of hcz conveyor belt uses a different byte to check if it's already loaded. Since they're so wide, the object loader may try loading them multiple times
Flying_carrying_Sonic_flag	ds.b 1			; set when Tails carries Sonic in a Sonic and Tails game
Flying_picking_Sonic_timer	ds.b 1			; until this is 0 Tails can't pick Sonic up
_unkF740			ds.w 1
			ds.w 1				; unused
_unkF744			ds.w 1
Tails_CPU_star_post_flag	ds.b 1			; copy of Last_star_post_hit, sets Tails' starting behavior in a Sonic and Tails game
			ds.b 1				; unused
Ctrl_1_title =			*			; copy of Ctrl_1, used on the title screen
Ctrl_1_held_title		ds.b 1
Ctrl_1_pressed_title		ds.b 1
_unkF74A			ds.b 1
_unkF74B			ds.b 1
_unkF74C			ds.w 1
_unkF74E			ds.b 1
Disable_wall_grab		ds.b 1			; if set, disables Knuckles wall grab
Max_speed			ds.w 1
Acceleration			ds.w 1
Deceleration			ds.w 1
Player_prev_frame		ds.b 1			; used by DPLC routines to detect whether a DMA transfer is required
			ds.b 1				; unused
Primary_Angle			ds.b 1
			ds.b 1				; unused
Secondary_Angle			ds.b 1
			ds.b 1				; unused

Object_load_routine		ds.b 1			; routine counter for the object loading manager
			ds.b 1				; unused
Camera_X_pos_coarse		ds.w 1			; rounded down to the nearest chunk boundary (128th pixel)
Camera_Y_pos_coarse		ds.w 1			; rounded down to the nearest chunk boundary (128th pixel)
Object_load_addr_front		ds.l 1			; the address inside the object placement data of the first object whose X pos is >= Camera_X_pos_coarse + $280
Object_load_addr_back		ds.l 1			; the address inside the object placement data of the first object whose X pos is >= Camera_X_pos_coarse - $80
Object_respawn_index_front	ds.w 1			; the object respawn table index for the object at Obj_load_addr_front
Object_respawn_index_back	ds.w 1			; the object respawn table index for the object at Obj_load_addr_back
Pal_fade_delay			ds.w 1			; timer for palette fade routines
Collision_addr			ds.l 1			; points to the primary or secondary collision data as appropriate
Boss_flag			ds.b 1			; set if a boss fight is going on
			ds.b 5				; unused
_unkF7B0			ds.b 4

Primary_collision_addr		ds.l 1
Secondary_collision_addr	ds.l 1
			ds.l 1				; unused
MHZ_pollen_counter		ds.b 1			; number of currently active pollen or leaves in MHZ
_unkF7C1			ds.b 1
_unkF7C2			ds.b 1
_unkF7C3			ds.b 1
_unkF7C4			ds.w 1
Reverse_gravity_flag		ds.b 1
_unkF7C7			ds.b 1
WindTunnel_flag			ds.b 1
WindTunnel_flag_P2		ds.b 1
Ctrl_1_locked			ds.b 1
Ctrl_2_locked			ds.b 1
			ds.l 1				; unused
Chain_bonus_counter		ds.w 1
Time_bonus_countdown		ds.w 1			; used on the results screen
Ring_bonus_countdown		ds.w 1			; used on the results screen
			ds.l 1				; unused
Camera_X_pos_coarse_back	ds.w 1			; Camera_X_pos_coarse - $80
_unkF7DC			ds.w 1
Player_prev_frame_P2		ds.b 1			; used by DPLC routines to detect whether a DMA transfer is required
Player_prev_frame_P2_tail	ds.b 1			; used by DPLC routines to detect whether a DMA transfer is required
Level_trigger_array		ds.b $10		; used by buttons, etc.
Anim_Counters			ds.b $10		; each word stores data on animated level art, including duration and current frame

Sprite_table_buffer		ds.b $280
_unkFA80			ds.w 1			; unused
_unkFA82			ds.b 1
_unkFA83			ds.b 1
_unkFA84			ds.w 1
_unkFA86			ds.w 1
_unkFA88			ds.b 1
_unkFA89			ds.b 1
_unkFA8A			ds.w 1
_unkFA8C			ds.w 1			; unused?
_unkFA8E			ds.w 1
_unkFA90			ds.w 1
Target_camera_max_X_pos		ds.w 1			; the target camera maximum x-position
Target_camera_min_X_pos		ds.w 1			; the target camera minimum x-position
Target_camera_min_Y_pos		ds.w 1			; the target camera minimum y-position
Target_camera_max_Y_pos		ds.w 1			; the target camera maximum y-position
Slotted_object_bits		ds.w 1			; bits to determine which slots are used for slotted objects
			ds.b 6				; unused
_unkFAA2			ds.b 1
_unkFAA3			ds.b 1
_unkFAA4			ds.w 1
Signpost_addr			ds.w 1			; address of the currently active signpost object. Hidden monitors use this for bouncing
_unkFAA8			ds.b 1
_unkFAA9			ds.b 1
End_of_level_flag		ds.b 1			; set if end of level is current active, for example after beating a boss
_unkFAAB			ds.b 1
_unkFAAC			ds.b 1
_unkFAAD			ds.b 1
_unkFAAE			ds.w 1
_unkFAB0			ds.w 1
_unkFAB2			ds.w 1
_unkFAB4			ds.w 1
_unkFAB6			ds.w 1
_unkFAB8			ds.b 1
_unkFAB9			ds.b 1
_unkFABA			ds.w 1
_unkFABC			ds.b 1
_unkFABD			ds.b 1
_unkFABE			ds.b 1			; unused?
Palette_rotation_disable	ds.b 1			; if set, palette rotation scripts are disabled
_unkFAC0			ds.b 1
_unkFAC1			ds.b 1
_unkFAC2			ds.w 1
_unkFAC4			ds.w 1
			ds.w 1				; unused
_unkFAC8			ds.w 1
			ds.w 1				; unused
_unkFACC			ds.b 1
_unkFACD			ds.b 1
Pal_fade_delay2			ds.w 1			; timer for palette fade from white routine
Palette_rotation_custom		ds.l 1			; custom routine for palette rotation scripts
Palette_rotation_data		ds.w 9			; data used by palette rotation scripts. Last word must always be 0
_unkFAF0			ds.w 1
			ds.w 1				; unused
_unkFAF4			ds.w 1
			ds.w 1				; unused
_unkFAF8			ds.w 1
_unkFAFA			ds.w 1
_unkFAFC			ds.w 1

Restart_level_flag		ds.w 1
Level_frame_counter		ds.w 1			; the number of frames which have elapsed since the level started
Debug_object			ds.b 1			; the current position in the debug mode object list
			ds.b 1				; unused
Debug_placement_mode =		*			; both routine and type
Debug_placement_routine		ds.b 1
Debug_placement_type		ds.b 1			; 0 = normal gameplay, 1 = normal object placement, 2 = frame cycling
Debug_camera_delay		ds.b 1
Debug_camera_speed		ds.b 1
V_int_run_count			ds.l 1			; the number of times V-int has run
Current_zone_and_act =		*
Current_zone			ds.b 1
Current_act			ds.b 1
Life_count			ds.b 1
			ds.b 3				; unused
Current_special_stage		ds.b 1
			ds.b 1				; unused
Continue_count			ds.b 1
Super_Sonic_Knux_flag		ds.b 1
Time_over_flag			ds.b 1
Extra_life_flags		ds.b 1
Update_HUD_life_count		ds.b 1
Update_HUD_ring_count		ds.b 1
Update_HUD_timer		ds.b 1
Update_HUD_score		ds.b 1
Ring_count			ds.w 1
Timer				ds.l 1
Timer_minute =			Timer+1
Timer_second =			Timer+2
Timer_frame =			Timer+3			; the second gets incremented when this reaches 60
Score				ds.l 1
Last_star_post_hit		ds.b 1

; the following variables are all saved when hitting a star post
Saved_last_star_post_hit	ds.b 1
Saved_zone_and_act		ds.w 1
Saved_X_pos			ds.w 1
Saved_Y_pos			ds.w 1
Saved_ring_count		ds.w 1
Saved_timer			ds.l 1
Saved_art_tile			ds.w 1
Saved_solid_bits		ds.w 1			; copy of Player 1's top_solid_bit and lrb_solid_bit
Saved_camera_X_pos		ds.w 1
Saved_camera_Y_pos		ds.w 1
Saved_mean_water_level		ds.w 1
Saved_water_full_screen_flag	ds.b 1
Saved_extra_life_flags		ds.b 1
Saved_camera_max_Y_pos		ds.w 1
Saved_dynamic_resize_routine	ds.b 1
Saved_status_secondary		ds.b 1
Special_bonus_entry_flag	ds.b 1			; 1 for entering a Special Stage, 2 for entering a Bonus Stage

; the following variables are all saved when entering a special stage
Saved2_last_star_post_hit	ds.b 1
Saved2_zone_and_act		ds.w 1
Saved2_X_pos			ds.w 1
Saved2_Y_pos			ds.w 1
Saved2_ring_count		ds.w 1
Saved2_timer			ds.l 1
Saved2_art_tile			ds.w 1
Saved2_solid_bits		ds.w 1
Saved2_camera_X_pos		ds.w 1
Saved2_camera_Y_pos		ds.w 1
Saved2_mean_water_level		ds.w 1
Saved2_water_full_screen_flag	ds.b 1
Saved2_extra_life_flags		ds.b 1
Saved2_camera_max_Y_pos		ds.w 1
Saved2_dynamic_resize_routine	ds.b 1

LRZ_rocks_routine		ds.b 1			; routine counter for lrz special rocks
LRZ_rocks_addr_front		ds.l 1			; the address inside the lrz rocks data of the first rock whose X pos is >= Camera_X_pos_coarse + $280
LRZ_rocks_addr_back		ds.l 1			; the address inside the lrz rocks data of the first rock whose X pos is >= Camera_X_pos_coarse - $80
Oscillating_table		ds.b $42		; various oscillating variables
Oscillating_table_end =		*			; end of oscillating data array
_unkFEB0			ds.b 1
_unkFEB1			ds.b 1
Rings_frame_timer		ds.b 1
Rings_frame			ds.b 1
_unkFEB4			ds.b 1
_unkFEB5			ds.b 1
Ring_spill_anim_counter		ds.b 1
Ring_spill_anim_frame		ds.b 1
Ring_spill_anim_accum		ds.b 1
			ds.b 1				; unused
AIZ_vine_angle			ds.w 1			; controls the angle of AIZ giant vines
			ds.w 1				; unused
_unkFEBE			ds.b 1			; unused
Extra_life_flags_P2		ds.b 1
Max_speed_P2			ds.w 1
Acceleration_P2			ds.w 1
Deceleration_P2			ds.w 1
Life_count_P2			ds.b 1			; left over from Sonic 2
_unkFEC7			ds.b 1			; used in competition mode
Total_ring_count		ds.w 1			; left over from Sonic 2
Total_ring_count_P2		ds.w 1			; left over from Sonic 2
Monitors_broken			ds.w 1			; left over from Sonic 2. Apparently Sonic 3 developers liked copypasting, since gaining a life from rings also increments this counter
Monitors_broken_P2		ds.w 1			; left over from Sonic 2
Ring_count_P2			ds.w 1			; left over from Sonic 2
Timer_P2			ds.l 1			; left over from Sonic 2
Timer_minute_P2 =		Timer_P2+1		; left over from Sonic 2
Score_P2			ds.l 1			; left over from Sonic 2
_unkFEDA			ds.b 1
			ds.b 1				; unused
_unkFEDC			ds.b 1
_unkFEDD			ds.b 1
_unkFEDE			ds.b 1			; unused
			ds.b $23			; unused
Results_screen_2P		ds.w 1			; left over from Sonic 2
Perfect_rings_left		ds.w 1			; left over from Sonic 2
_unkFF06			ds.w 1			; uknown
Player_mode			ds.w 1			; 0 = Sonic and Tails, 1 = Sonic alone, 2 = Tails alone, 3 = Knuckles alone
Player_option			ds.w 1			; option selected on level select, data select screen or Sonic & Knuckles title screen
			ds.w 1				; unused

Kos_decomp_queue_count		ds.w 1			; the number of pieces of data on the queue. Sign bit set indicates a decompression is in progress
Kos_decomp_stored_registers	ds.w 20			; allows decompression to be spread over multiple frames
Kos_decomp_stored_SR		ds.w 1
Kos_decomp_bookmark		ds.l 1			; the address within the Kosinski queue processor at which processing is to be resumed
Kos_description_field		ds.w 1			; used by the Kosinski queue processor the same way the stack is used by the normal Kosinski decompression routine
Kos_decomp_queue		ds.l 2*4		; 2 longwords per entry, first is source location and second is decompression location
Kos_decomp_source =		Kos_decomp_queue	; long ; the compressed data location for the first entry in the queue
Kos_decomp_destination =	Kos_decomp_queue+4	; long ; the decompression location for the first entry in the queue
Kos_modules_left		ds.b 1			; the number of modules left to decompresses. Sign bit set indicates a module is being decompressed/has been decompressed
			ds.b 1				; unused
Kos_last_module_size		ds.w 1			; the uncompressed size of the last module in words. All other modules are $800 words
Kos_module_queue		ds.w 3*4		; 6 bytes per entry, first longword is source location and next word is VRAM destination
Kos_module_source =		Kos_module_queue	; long ; the compressed data location for the first module in the queue
Kos_module_destination =	Kos_module_queue+4	; word ; the VRAM destination for the first module in the queue

Nem_decomp_queue		ds.b 6*$10		; 6 bytes per entry, first longword is source location and next word is VRAM destination
Nem_decomp_source =		Nem_decomp_queue	; long ; the compressed data location for the first entry in the queue
Nem_decomp_destination =	Nem_decomp_queue+4	; word ; destination in VRAM for the first entry in the queue
Nem_decomp_vars =		*			; $20 bytes ; various variables used by the Nemesis decompression queue processor
Nem_write_routine		ds.l 1			; points to either Nem_PCD_WriteRowToVDP or Nem_PCD_WriteRowToVDP_XOR
Nem_repeat_count		ds.l 1			; stored repeat count for the current palette index
Nem_palette_index		ds.l 1			; the current palette index
Nem_previous_row		ds.l 1			; used in XOR mode
Nem_data_word			ds.l 1			; contains the current compressed word being processed
Nem_shift_value			ds.l 1			; the number of bits the data word needs to be shifted by
Nem_patterns_left		ds.w 1			; the number of patterns remaining to be decompressed
Nem_frame_patterns_left		ds.w 1			; the number of patterns remaining to be decompressed in the current frame
			ds.l 1				; unused?

_unkFF7C			ds.w 1
_unkFF7E			ds.w 1
Level_select_repeat		ds.w 1			; delay counter for repeating the button press. Allows the menu move even when up/down is held down
Level_select_option		ds.w 1			; the current selected option in the level select
Sound_test_sound		ds.w 1
Title_screen_option		ds.b 1
			ds.b 1				; unused
Current_zone_2P			ds.b 1			; left over from Sonic 2, used only in Sonic 3 Alone
Current_act_2P			ds.b 1			; left over from Sonic 2, used only in Sonic 3 Alone
Competition_mode_monitors	ds.b 1			; 0 = Enabled, FF = Disabled.
Competition_mode_type		ds.b 1			; 0 = grand prix, 3 = match race, -1 = time attack
Options_menu_box		ds.b 1			; this is used in Sonic 3 Alone, but unused in Sonic & Knuckles and Sonic 3 Complete
			ds.b 1				; unused
Total_bonus_countup		ds.w 1			; the total points to be added due to various bonuses this frame in the end of level results screen
Level_music			ds.w 1
Collected_special_ring_array	ds.l 1			; each bit indicates a special stage entry ring in the current zone
Saved2_status_secondary		ds.b 1
Respawn_table_keep		ds.b 1			; if set, respawn table is not reset during level load
_unkFF98			ds.w 1			; this is used in Sonic 3 Alone, but unused in Sonic & Knuckles and Sonic 3 Complete
Saved_apparent_zone_and_act	ds.w 1
Saved2_apparent_zone_and_act	ds.w 1
			ds.b 1				; unused

Blue_spheres_header_flag	ds.b 1			; 0 = SEGA GENESIS, 1 = SEGA MEGA DRIVE
Blue_spheres_mode		ds.b 1			; 0 = single stage, 1 = full game
Blue_spheres_menu_flag		ds.b 1			; 0 = NO WAY!, 1 = normal, bit 7 set = entering a code
Blue_spheres_current_stage	ds.b 4			; the layout parts that make up the current stage
Blue_spheres_current_level	ds.l 1			; number shown at the top of the full game menu
Blue_spheres_option		ds.b 1			; 0 = level, 1 = start, 2 = code
Blue_spheres_progress_flag	ds.b 1			; 0 = normal, -1 = disabled (single stage mode or using a code from single stage mode)
Blue_spheres_difficulty		ds.b 1			; value currently displayed
Blue_spheres_target_difficulty	ds.b 1			; byte ; value read from the layout
SK_alone_flag			ds.w 1			; -1 if Sonic 3 isn't locked on
Emerald_count =			*			; both chaos and super emeralds
Chaos_emerald_count		ds.b 1
Super_emerald_count		ds.b 1
Collected_emeralds_array	ds.b 7			; 1 byte per emerald, 0 = not collected, 1 = chaos emerald collected, 2 = grey super emerald, 3 = super emerald collected
			ds.b 1				; unused

Emeralds_converted_flag		ds.b 1			; set if at least one emerald has been converted to a super emerald
SK_special_stage_flag		ds.b 1			; set if a Sonic & Knuckles special stage is being run
Title_anim_buffer		ds.b 1			; status of the title animation buffer. Changes 2 different nametables in VDP while the other is being processed
Title_anim_delay		ds.b 1			; title animation delay counter
Title_anim_frame		ds.b 1			; title animation frame number
			ds.b 1				; unused
Next_extra_life_score		ds.l 1
Next_extra_life_score_P2	ds.l 1			; left over from Sonic 2
Ending_demo_number		ds.w 1			; zone for the ending demos, unused
Debug_P1_mappings		ds.l 1			; player 1 mappings while in debug mode
Debug_P2_mappings		ds.w 1			; long! ; player 2 mappings while in debug mode
Demo_mode_flag			ds.w 1
Next_demo_number		ds.w 1
Blue_spheres_stage_flag		ds.b 1			; set if a Blue Sphere special stage is being run
			ds.b 1				; unused
V_blank_cycles			ds.w 1			; the number of cycles between V-blanks
ConsoleRegion =			*			; equate used by AMPS
Graphics_flags			ds.b 1			; bit 7 set := English system, bit 6 set := PAL system
			ds.b 1				; unused
Debug_mode_flag			ds.w 1
			ds.l 1				; unused
Level_select_flag		ds.b 1
Slow_motion_flag		ds.b 1			; Sonic 3 has a different address... So uh... Yes
Debug_cheat_flag		ds.w 1			; set if the debug cheat's been entered
Level_select_cheat_counter	ds.w 1			; progress entering level select cheat, unused
Debug_mode_cheat_counter	ds.w 1			; progress entering debug mode cheat, unused
Competition_mode		ds.w 1			; 0 = Sonic, 1 = Tails, 2 = Knuckles
P1_character			ds.b 1			; Sonic 3 has a different address... So uh... Yes
P2_character			ds.b 1			; Sonic 3 has a different address... So uh... Yes
			ds.l 1				; unused

V_int_jump			ds.b 6			; contains an instruction to jump to the V-int handler
V_int_addr =			V_int_jump+2		; long
H_int_jump			ds.b 6			; contains an instruction to jump to the H-int handler
H_int_addr =			H_int_jump+2		; long
Checksum_string			ds.l 1			; set to 'SM&K' or 'init' once the checksum routine has run
Stack_contents			ds.b $100		; stack contents
System_stack =			*			; this is the top of the stack, it grows downwards
_dbgFFDC =			*			; seems like a leftover constant. Existed in Sonic 1 and Sonic 2 as well
_dbgFFDD =			*			; seems like a leftover constant. Existed in Sonic 1 and Sonic 2 as well
_dbgFFDE =			*			; seems like a leftover constant. Existed in Sonic 1 and Sonic 2 as well
_dbgFFDF =			*			; seems like a leftover constant. Existed in Sonic 1 and Sonic 2 as well

.check =	(*)&$FFFFFF
	if (.check>0)&(.check<$FF0000)
		fatal "Sonic & Knuckles RAM definitions are too large by $\{*} bytes!"
	endif

; extra Special Stage variables
	phase Pos_table_P2
SStage_scalar_index_0		ds.w 1			; unknown scalar table index value
SStage_scalar_index_1		ds.w 1			; unknown scalar table index value
SStage_scalar_index_2		ds.w 1			; unknown scalar table index value
SStage_scalar_result_0		ds.l 1			; unknown scalar table results values
SStage_scalar_result_1		ds.l 1			; unknown scalar table results values
SStage_scalar_result_2		ds.l 1			; unknown scalar table results values
		ds.b $A
SStage_scalar_result_3		ds.l 1			; unknown scalar table results values
Special_stage_anim_frame	ds.w 1			; special stage globe's current animation frame, $10 and higher is turning
Special_stage_X_pos		ds.w 1
Special_stage_Y_pos		ds.w 1
Special_stage_angle		ds.b 1			; $00 = north, $40 = west, $80 = south, $C0 = east
			ds.b 1				; unused
Special_stage_velocity		ds.w 1			; player's movement speed, negative when going backwards
Special_stage_turning		ds.b 1			; direction of next turn, 4 = left, -4 = right
Special_stage_bumper_lock	ds.b 1			; if set, the player can't start advancing by pressing up
Special_stage_prev_anim_frame	ds.b 1
			ds.b 2				; unused
Special_stage_palette_frame	ds.b 1			; same as Special_stage_anim_frame, but set to 0 while turning
Special_stage_turn_lock		ds.b 1			; if set, the player can't turn
Special_stage_advancing		ds.b 1			; set when the player player presses up
Special_stage_jumping		ds.b 1			; $80 = normal jump, $81 = spring
Special_stage_fade_timer	ds.b 1			; counts up when leaving the special stage
Special_stage_prev_X_pos	ds.w 1
Special_stage_prev_Y_pos	ds.w 1
Special_stage_spheres_left	ds.w 1
Special_stage_ring_count	ds.w 1
Special_stage_sphere_HUD_flag	ds.b 1
Special_stage_extra_life_flags	ds.b 1			; byte ; when bit 7 is set, the ring HUD is updated
Special_stage_rate_timer	ds.w 1			; when this reaches 0, the special stage speeds up
Special_stage_jumping_P2	ds.b 1			; $80 = normal jump, $81 = spring
			ds.b 1				; unused
Special_stage_rings_left	ds.w 1
Special_stage_rate		ds.w 1			; player's maximum speed in either direction
Special_stage_palette_addr	ds.l 1			; ROM address of the stage's color palette
Special_stage_clear_timer	ds.w 1			; counts up after getting the last sphere, when it reaches $100 the emerald appears
Special_stage_clear_routine	ds.b 1			; if set, the player can't jump
Special_stage_emerald_timer	ds.b 1			; counts down when the emerald appears, when it reaches 0 the emerald sound plays
Special_stage_interact		ds.w 1			; address of the last bumper touched, or the emerald at the end of the stage
Special_stage_started		ds.b 1			; set when the player begins moving at the start of the stage
			ds.b 1				; unused
SStage_extra_sprites		ds.b $70		; some extra sprite info for special stages

	phase _unkF712+8
CNZ_bumper_routine		ds.b 1			; left over from Sonic 2
CNZ_bumper_unk			ds.b 1			; left over from Sonic 2 ; set only, never used again
CNZ_visible_bumpers_start	ds.l 1			; left over from Sonic 2
CNZ_Visible_bumpers_end		ds.l 1			; left over from Sonic 2
CNZ_Visible_bumpers_start_P2	ds.l 1			; left over from Sonic 2
CNZ_Visible_bumpers_end_P2	ds.l 1			; left over from Sonic 2

	phase Stat_table+$12
_unkE412			ds.w 1			; unused, but referenced in sphere test
_unkE414			ds.w 1			; used in sphere test
_unkE416			ds.w 1			; used in sphere test
Sphere_test_address		ds.w 1			; address of the sphere test object
	dephase
; ---------------------------------------------------------------------------
; Art tile stuff
palette_line_0      =      (0<<13)
palette_line_1      =      (1<<13)
palette_line_2      =      (2<<13)
palette_line_3      =      (3<<13)
high_priority       =      (1<<15)
tile_mask           =      $07FF
drawing_mask        =      $7FFF

; ---------------------------------------------------------------------------
; VRAM and tile art base addresses.
; VRAM Reserved regions.
VRAM_Plane_A_Name_Table               = $C000	; Extends until $CFFF
VRAM_Plane_B_Name_Table               = $E000	; Extends until $EFFF

; Menu background.
ArtTile_ArtKos_S3MenuBG               = $0001

; Competition mode.
ArtTile_ArtKos_Competition_LevSel     = $029F
ArtTile_ArtKos_Competition_ModeSel    = $034A
ArtTile_ArtKos_Competition_Results    = $034A
ArtTile_ArtKos_Competition_CharSel    = $05C9

; Save screen.
ArtTile_ArtKos_Save_Misc              = $029F
ArtTile_ArtKos_Save_Extra             = $0454

; ---------------------------------------------------------------------------
; Universal locations.

; Universal (used on all standard levels).
ArtTile_Monitors                      = $04C4
ArtTile_CutsceneKnux                  = $04DA
ArtTile_Player_1                      = $0680
ArtTile_Player_2                      = $06A0
ArtTile_Player_2_Tail                 = $06B0
ArtTile_Ring                          = $06BC
ArtTile_Shield                        = $079C
ArtTile_Shield_Sparks                 = $07BB
ArtTile_DashDust                      = $07E0
ArtTile_DashDust_P2                   = $07F0
