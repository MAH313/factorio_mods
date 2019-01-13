
--Nuclear grenade
local NukeNade_projectile = table.deepcopy(data.raw.projectile['grenade'])

NukeNade_projectile.name = 'nuke_nade_projectile'
NukeNade_projectile.action = {
   {
      action_delivery = {
         target_effects = {
            {
               entity_name = "big-artillery-explosion",
               type = "create-entity"
            },
            {
               check_buildability = true,
               entity_name = "small-scorchmark",
               type = "create-entity"
            }
         },
         type = "instant"
      },
      type = "direct"
   },
   {
      action_delivery = {
         target_effects = {
            {
               damage = {
                  amount = 100,
                  type = "explosion"
               },
               type = "damage"
            },
            {
               entity_name = "big-artillery-explosion",
               type = "create-entity"
            }
         },
         type = "instant"
      },
      radius = 13,
      type = "area"
   }
}

local NukeNade = table.deepcopy(data.raw.capsule['grenade'])

NukeNade.name = "nuke_nade"
NukeNade.icons= {
   {
      icon=NukeNade.icon,
      tint={r=0,
      		g=1,
      		b=0,
      		a=0.3}
   },
}

NukeNade.capsule_action.attack_parameters.range = 30
NukeNade.capsule_action.attack_parameters.cooldown = 30

NukeNade.capsule_action.attack_parameters.ammo_type = {
	action = {
		action_delivery = {
            projectile = "nuke_nade_projectile",
            starting_speed = 0.5,
            type = "projectile"
      	},
      	type = "direct"
   },
   category = "grenade",
   target_type = "position"
}

local recipe_NukeNade = table.deepcopy(data.raw.recipe["grenade"])
recipe_NukeNade.enabled = false
recipe_NukeNade.name = "nuke_nade"
recipe_NukeNade.ingredients = {{"grenade",1},{"uranium-238",1}}
recipe_NukeNade.result = "nuke_nade"
--recipe_NukeNade.energy_required = 1

data:extend{NukeNade,
            recipe_NukeNade,
            NukeNade_projectile}

table.insert(data.raw["technology"]["uranium-ammo"].effects, {type = "unlock-recipe",recipe = "nuke_nade"})