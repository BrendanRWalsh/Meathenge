/// @description Insert description here
// You can write your code in this editor


// read keypresses
mv_x = keyboard_check(ord("D")) - keyboard_check(ord("A"))
mv_y = keyboard_check(ord("S")) - keyboard_check(ord("W"))
dodge_pressed = keyboard_check(vk_shift)
//spell selection
if keyboard_check_pressed(ord(1)){	if spells[0].unlocked {current_spell = 0;}}
if keyboard_check_pressed(ord(2)){	if spells[1].unlocked {current_spell = 1;}}
if keyboard_check_pressed(ord(3)){	if spells[2].unlocked {current_spell = 2;}}
if keyboard_check_pressed(ord(4)){	if spells[3].unlocked {current_spell = 3;}}
if keyboard_check_pressed(ord(5)){	if spells[4].unlocked {current_spell = 4;}}
if keyboard_check_pressed(ord(6)){	if spells[5].unlocked {current_spell = 5;}}
if keyboard_check_pressed(ord(7)){	if spells[6].unlocked {current_spell = 6;}}
if keyboard_check_pressed(ord("E")){

}
//movement
if movement_allowed {
	//dodge movement
	if dodging {
		dodge_delta--
		if dodge_delta <= 0 {
			dodging  = false;
			dodge_cooldown_delta = dodge_cooldown;
			sprite_index = spr_player_idle;
		} else {
			mv_x = lengthdir_x(dodge_speed,dir)
			mv_y = lengthdir_y(dodge_speed,dir)
			x += mv_x
			y += mv_y 
			dodge_delta--
		}
	
	} else { //regular movement
		//clamp diagonal movement
		if (mv_y != 0) && (mv_x != 0) {
			spd = mv_d
		} else { spd = move_speed}
	
		//check if dodge 
		if dodge_pressed && dodge_cooldown_delta <= 0{
			dodging = true;
			dodge_delta = dodge_time
			spell_cooldown = dodge_time
			sprite_index = spr_player_dodge
		}
		if dodge_cooldown_delta > 0 {dodge_cooldown_delta--}
		//change player direction
		player_aim = point_direction(x,y,mouse_x,mouse_y)
		dir = point_direction(x,y,x + mv_x * spd,y + mv_y*spd)
	
		//finally, move the player
		x += mv_x * spd
		y += mv_y * spd
		}
}

//spellcast
if mouse_check_button(mb_left){
	switch(current_spell){
		case 0:
			if mana > spells[0].cost && spells[0].cooldown <= 0{
				mana -= spells[0].cost;
				s = instance_create_layer(x,y,"instances",obj_spell0)
				s.dir = player_aim
				spells[0].cooldown = spells[0].reload
			}
			break
		case 1:
			if mana > spells[1].cost && spells[1].cooldown <= 0{
				mana -= spells[0].cost;
				s = instance_create_layer(mouse_x,mouse_y,"instances",obj_spell1)
				spells[1].cooldown = spells[1].reload
			}
			break
	}
}
//cooldowns
if spells[0].cooldown > 0 {spells[0].cooldown--;}
if spells[1].cooldown > 0 {spells[1].cooldown--;}
mana += mana_regen;
if mana > mana_max {mana = mana_max;}

depth = -y