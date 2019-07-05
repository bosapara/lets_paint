local v = {
	{"white",      "White"},
	{"grey",       "Grey"},
	{"black",      "Black"},
	{"red",        "Red"},
	{"yellow",     "Yellow"},
	{"green",      "Green"},
	{"cyan",       "Cyan"},
	{"blue",       "Blue"},
	{"magenta",    "Magenta"},
	{"orange",     "Orange"},
	{"violet",     "Violet"},
	{"brown",      "Brown"},
	{"pink",       "Pink"},
	{"dark_grey",  "Dark Grey"},
	{"dark_green", "Dark Green"},	
			
}
for _, v in pairs(v) do

	minetest.register_tool("lets_paint:brush_"..v[1], {
		description = "Brush "..v[2],
		inventory_image = "brush_"..v[1]..".png",
		range = 40,

		on_place = function(itemstack, placer, pointed_thing)
		
			local npos = pointed_thing.under
			--local pos = placer:get_pos()

			local name = placer:get_player_name()

			if (npos.y < 400 or npos.y > 430 or npos.x < 91 or npos.x > 125 or npos.z < - 132 or npos.z > -98) then
			minetest.chat_send_player(name, (minetest.colorize("red","<Mr.Bot> "..name..", you can't use brush tool here!")))
			--placer:set_wielded_item("default:stick")
			itemstack:take_item()
			return itemstack
			end
			
			local item = placer:get_wielded_item():to_string()
		
			minetest.show_formspec(placer:get_player_name(), "brush_form", "size[11.5,8] bgcolor[#08080877;false] image_button_exit[1,1.5;1.5,1.5;wool_green.png;green;] image_button_exit[3,1.5;1.5,1.5;wool_red.png;red;] image_button_exit[5,1.5;1.5,1.5;wool_blue.png;blue;] image_button_exit[7,1.5;1.5,1.5;wool_yellow.png;yellow;] image_button_exit[9,1.5;1.5,1.5;wool_violet.png;violet;] image_button_exit[1,3.5;1.5,1.5;wool_dark_green.png;dark_green;] image_button_exit[3,3.5;1.5,1.5;wool_pink.png;pink;] image_button_exit[5,3.5;1.5,1.5;wool_cyan.png;cyan;] image_button_exit[7,3.5;1.5,1.5;wool_magenta.png;magenta;] image_button_exit[9,3.5;1.5,1.5;wool_brown.png;brown;] image_button_exit[1,5.5;1.5,1.5;wool_orange.png;orange;] image_button_exit[3,5.5;1.5,1.5;wool_white.png;white;] image_button_exit[5,5.5;1.5,1.5;wool_dark_grey.png;dark_grey;] image_button_exit[7,5.5;1.5,1.5;wool_black.png;black;] image_button_exit[9,5.5;1.5,1.5;wool_grey.png;grey;]")					
		
			
		end,
	
	})
	
	minetest.register_tool("lets_paint:bucket_"..v[1], {
		description = "Bucket "..v[2],
		inventory_image = "bucket_"..v[1]..".png",
		range = 40,

		on_place = function(itemstack, placer, pointed_thing)
		
			local npos = pointed_thing.under
			--local pos = placer:get_pos()

			local name = placer:get_player_name()

			if (npos.y < 400 or npos.y > 430 or npos.x < 91 or npos.x > 125 or npos.z < - 132 or npos.z > -98) then
			minetest.chat_send_player(name, (minetest.colorize("red","<Mr.Bot> "..name..", you can't use brush tool here!")))
			--placer:set_wielded_item("default:stick")
			itemstack:take_item()
			return itemstack
			end
			
			local item = placer:get_wielded_item():to_string()
		
			minetest.show_formspec(placer:get_player_name(), "brush_form", "size[11.5,8] bgcolor[#08080877;false] image_button_exit[1,1.5;1.5,1.5;wool_green.png;green;] image_button_exit[3,1.5;1.5,1.5;wool_red.png;red;] image_button_exit[5,1.5;1.5,1.5;wool_blue.png;blue;] image_button_exit[7,1.5;1.5,1.5;wool_yellow.png;yellow;] image_button_exit[9,1.5;1.5,1.5;wool_violet.png;violet;] image_button_exit[1,3.5;1.5,1.5;wool_dark_green.png;dark_green;] image_button_exit[3,3.5;1.5,1.5;wool_pink.png;pink;] image_button_exit[5,3.5;1.5,1.5;wool_cyan.png;cyan;] image_button_exit[7,3.5;1.5,1.5;wool_magenta.png;magenta;] image_button_exit[9,3.5;1.5,1.5;wool_brown.png;brown;] image_button_exit[1,5.5;1.5,1.5;wool_orange.png;orange;] image_button_exit[3,5.5;1.5,1.5;wool_white.png;white;] image_button_exit[5,5.5;1.5,1.5;wool_dark_grey.png;dark_grey;] image_button_exit[7,5.5;1.5,1.5;wool_black.png;black;] image_button_exit[9,5.5;1.5,1.5;wool_grey.png;grey;]")					
		
			
		end,
	
	})	
	
	
	
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname=="brush_form" then

		local item = player:get_wielded_item():to_string()

		for _, v in pairs(v) do
	
			if fields[v[1]] and string.match(item, "lets_paint:brush_") then

				player:set_wielded_item("lets_paint:brush_"..v[1])

			elseif fields[v[1]] and string.match(item, "lets_paint:bucket_") then
			
				player:set_wielded_item("lets_paint:bucket_"..v[1])
			
			end
								
		end

	end
end)


minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)

	local name = puncher:get_player_name()
	
	local item = puncher:get_wielded_item():to_string()
	
	local npos = pointed_thing.under
	
	
	local nn = minetest.get_node(npos).name	
	

	local control = puncher:get_player_control()
	
	

	
	
	if (npos.y < 400 or npos.y > 430 or npos.x < 91 or npos.x > 125 or npos.z < - 132 or npos.z > -98) and string.match(item, "lets_paint:") then
		
		puncher:set_wielded_item("")
		minetest.chat_send_player(name, (minetest.colorize("red","<Mr.Bot> "..name..", you can't use brush tool here!")))


	elseif string.match(item, "lets_paint:brush_") and control.sneak == true then
	
		for _, v in pairs(v) do

			if puncher:get_wielded_item():get_name() == "lets_paint:brush_"..v[1] and node.name ~= "air" and string.match(node.name, "wool:") and not string.match(node.name, "carpet") then
			


				local pos1 = {x=npos.x-1, y=pos.y - 1 , z=npos.z-1}
				local pos2 = {x=npos.x+1, y=pos.y + 1, z=npos.z+1}
				for _,pos in ipairs(minetest.find_nodes_in_area(pos1, pos2, {"group:wool"})) do
					minetest.set_node(pos, {name="wool:"..v[1]})
				end

										
			end
								
		end	

		
	elseif string.match(item, "lets_paint:brush_") and not control.sneak == true then
	
		for _, v in pairs(v) do

			if puncher:get_wielded_item():get_name() == "lets_paint:brush_"..v[1] and node.name ~= "air" and string.match(node.name, "wool:") and not string.match(node.name, "carpet") then
			
				minetest.set_node(pos, {name="wool:"..v[1]})
										
			end
								
		end	
		
		
	elseif string.match(item, "lets_paint:bucket_") then


		for _, v in pairs(v) do

			if puncher:get_wielded_item():get_name() == "lets_paint:bucket_"..v[1] and node.name ~= "air" and string.match(node.name, "wool:") and not string.match(node.name, "carpet") then


				local pos1 = {x=npos.x-15, y=pos.y - 15 , z=npos.z-15}
				local pos2 = {x=npos.x+15, y=pos.y + 15, z=npos.z+15}
				for _,pos in ipairs(minetest.find_nodes_in_area(pos1, pos2, {"group:wool"})) do
					minetest.set_node(pos, {name="wool:"..v[1]})
				end
												
			end
								
		end	
	

	end



end)


