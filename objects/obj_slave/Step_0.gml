player_collision()
if(attack_speed_cooldown_remaining > 0)
{
	attack_speed_cooldown_remaining -= 1/room_speed
}
else if(currently_attacking)
{
	currently_attacking = false;
	send_move_command(Move.Left_Right,0)
	send_move_command(Move.Up_Down,0)
}