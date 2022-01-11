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
			sprite_index = spr_player_palceholder;
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
if mouse_check_button(mb_left) && allow_cast{
	switch(current_spell){
		case 0: //Homing bolt
			if mana > spells[0].cost && spells[0].cooldown <= 0{
				mana -= spells[0].cost;
				s = instance_create_layer(x,y,"instances",obj_spell0)
				s.dir = player_aim
				spells[0].cooldown = spells[0].reload
			}
			break
		case 1: //AOE
			if mana > spells[1].cost && spells[1].cooldown <= 0{
				mana -= spells[0].cost;
				s = instance_create_layer(mouse_x,mouse_y,"instances",obj_spell1)
				spells[1].cooldown = spells[1].reload
			}
			break
		case 3: //LAZERBEAM!!!!!!
			if mana > spells[3].cost && spells[3].cooldown <= 0{
				allow_cast = false;
				laser = instance_create_layer(x,y,"instances",obj_spell2)
			}
			break
		case 5: //summon turret
			if mana > spells[5].cost && spells[5].cooldown <= 0{
				mana -= spells[5].cost;
				t = instance_create_layer(mouse_x,mouse_y, "instances", obj_unit)
				t.hp = 200
				t.move_speed = 0
				t.defence = 1
				t.attack_radius = 400
				t.sight_radius = 400
				t.attack_speed = 1 * room_speed
				t.memory = 0
				t.allow_knockback = false;
				t.knockback_resistance = 0
				t.sprite_index = spr_spell0
				t.damage = 20
				t.attack_mode = "ranged"
				spells[5].cooldown = spells[5].reload
			}
			
			break
	}
}
//cooldowns
if spells[0].cooldown > 0 {spells[0].cooldown--;}
if spells[1].cooldown > 0 {spells[1].cooldown--;}
if spells[2].cooldown > 0 {spells[2].cooldown--;}
if spells[3].cooldown > 0 {spells[3].cooldown--;}
if spells[4].cooldown > 0 {spells[4].cooldown--;}
if spells[5].cooldown > 0 {spells[5].cooldown--;}
mana += mana_regen;
if mana > mana_max {mana = mana_max;}

depth = -y