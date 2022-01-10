/// @description Insert description here
// You can write your code in this editor

//damge enemies

var _list = ds_list_create();
var _num = collision_ellipse_list(x-(sprite_width/2),y-(sprite_height/2),x+sprite_width,y+sprite_height,obj_enemy,false,true,_list,false);
if (_num > 0){
	for (var i = 0; i < _num; ++i;){
		_list[| i].hp -= damage;	
	}
}
ds_list_destroy(_list)


life--
if life <= 0 {instance_destroy()}


