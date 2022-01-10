/// @description Insert description here
// You can write your code in this editor

//combat / status
hp = 1000;
defence = 1;

//movement
movement_allowed = true;
move_speed = 5;
spd = move_speed;
mv_x = 0;
mv_y = 0;
mv_d = round(spd * (sqrt(2) / 2));

dir = 0;

//dodge roll
dodging = false;
dodge_pressed = 0;
dodge_time = 0.7 * room_speed;
dodge_speed = move_speed * 2.5 ;
dodge_delta = 0;
dodge_cooldown = 0.3 * room_speed;
dodge_cooldown_delta = 0;

//mana
mana = 100;
mana_max = 100;
mana_regen = 1 / room_speed;

//spells
/*
0 = neutral fire
1 = Aoe summon
2 = teleport
3 = lazor
4 = summon units
5 = summon turret
6 = summon wall
7 = 
*/
spells = [
	{
		cost : 5,
		reload : 0.4 * room_speed,
		cooldown : 0,
		unlocked: true
	},
	{
		cost : 20,
		reload : 2 * room_speed,
		cooldown : 0,
		unlocked: true
	},
]
current_spell = 0
spell_cooldown = 0
spells[0].cooldown = spells[0].reload
spells[1].cooldown = spells[1].reload
