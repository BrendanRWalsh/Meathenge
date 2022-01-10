/// @description Insert description here
// You can write your code in this editor

target = obj_henge;
state = "attack_henge";

//movement
move_speed = 3;
sight_radius = 150;
wander_dist = 50;
memory = 2 * room_speed; //time before changing targets

//combat
max_hp = 100;
hp = max_hp;
damage = 1;
defence = 1;
attack_speed = room_speed / 1;
attack_cooldown = 0;
attack_radius = 50;
target_in_view = false;
target_memory = 0;
knocked_back = false;
recoil_time = 0
recoil_value = 0.3 * room_speed

//pathing stuff
use_grid = false;
if use_grid{
	path = path_add();
	alarm[0] = 1;
}