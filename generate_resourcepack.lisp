(require :uiop)

(let* ((desktop-path (merge-pathnames "Desktop/lisp_data/sample.RP/" (user-homedir-pathname)))
        ;;(resourcepack-name (car(last (pathname-directory desktop-path))))
        (assets-path (merge-pathnames "assets/" desktop-path))
        (minecraft-path (merge-pathnames "minecraft/" assets-path))
        (lzaq-path (merge-pathnames "lzaq/" assets-path))
        (pack.mcmeta-path (merge-pathnames "pack.mcmeta" desktop-path))
        (pack.png-path (merge-pathnames "pack.png" desktop-path))
        (gpu_warnlist-path (merge-pathnames "gpu_warnlist.json" assets-path))
        (regional_compliancies-path (merge-pathnames "regional_compliancies.json" assets-path))
        (sounds-path (merge-pathnames "sounds.json" assets-path))
        (mainPaths (list lzaq-path minecraft-path)))

;;フォルダの作成
(ensure-directories-exist desktop-path)
(ensure-directories-exist assets-path)
(ensure-directories-exist minecraft-path)
(ensure-directories-exist lzaq-path)

(with-open-file (stream pack.mcmeta-path
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)
                        (format stream "{
  \"pack\": {
    \"pack_format\": 69,
    \"min_format\": [69.0],
    \"max_format\": 69,
    \"description\": {
      \"text\": \". \",
      \"extra\": [
        {
          \"text\": \"Created By \",
          \"extra\": [
            {
              \"text\": \"LaspberyAqua\",
              \"color\": \"dark_aqua\"
            }
          ]
        }
      ]
    }
  }
}"))

(with-open-file (stream pack.png-path
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create))

(with-open-file (stream gpu_warnlist-path
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create))

(with-open-file (stream regional_compliancies-path
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create))

(with-open-file (stream sounds-path
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create))



(dolist (contents-path mainPaths)
        (let* ((atlases-path (merge-pathnames "atlases/" contents-path))
               (blockstates-path (merge-pathnames "blockstates/" contents-path))
               (equipment-path (merge-pathnames "equipment/" contents-path))
               (font-path (merge-pathnames "font/" contents-path))
               (items-path (merge-pathnames "items/" contents-path))
               (lang-path (merge-pathnames "lang/" contents-path))
               (models-path (merge-pathnames "models/" contents-path))
               (overlays-path (merge-pathnames "overlays/" contents-path))
               (particles-path (merge-pathnames "particles/" contents-path))
               (post_effect-path (merge-pathnames "post_effect/" contents-path))
               (shaders-path (merge-pathnames "shaders/" contents-path))
               (texts-path (merge-pathnames "texts/" contents-path))
               (textures-path (merge-pathnames "textures/" contents-path))
               (waypoint_style-path (merge-pathnames "waypoint_style/" contents-path))
               
               (include_font-path (merge-pathnames "include/" font-path))

               (block_models-path (merge-pathnames "block/" models-path))
               (item_models-path (merge-pathnames "item/" models-path))

               (core-path (merge-pathnames "core/" shaders-path))
               (include_shaders-path (merge-pathnames "include/" shaders-path))
               (post-path (merge-pathnames "post/" shaders-path))
               
               (block_textures-path (merge-pathnames "block/" textures-path))
               (colormap-path (merge-pathnames "colormap/" textures-path))
               (effect-path (merge-pathnames "effect/" textures-path))
               (entity-path (merge-pathnames "entity/" textures-path))
               (environment-path (merge-pathnames "environment/" textures-path))
               (font_textures-path (merge-pathnames "font/" textures-path))
               (gui-path (merge-pathnames "gui/" textures-path))
               (item_textures-path (merge-pathnames "item" textures-path))
               (map-path (merge-pathnames "map/" textures-path))
               (misc-path (merge-pathnames "misc/" textures-path))
               (mob_effect-path (merge-pathnames "mob_effect/" textures-path))
               (painting-path (merge-pathnames "painting/" textures-path))
               (particle-path (merge-pathnames "particle/" textures-path))
               (trims-path (merge-pathnames "trims/" textures-path))
                )
        (dolist (entry `((,atlases-path "atlases")
                         (,blockstates-path "blockstates")
                         (,equipment-path "equipment")
                         (,font-path "font")
                         (,items-path "items")
                         (,lang-path "lang")
                         (,models-path "models")
                         (,overlays-path "overlays")
                         (,particles-path "particles")
                         (,post_effect-path "post_effect")
                         (,shaders-path "shaders")
                         (,texts-path "texts")
                         (,textures-path "textures")
                         (,waypoint_style-path "waypoint_style")
                         
                         (,include_font-path "include")
                         (,block_models-path "block")
                         (,item_models-path "item")
                         (,core-path "core")
                         (,include_shaders-path "include")
                         (,post-path "post")
                         (,block_textures-path "block")
                         (,colormap-path "colormap")
                         (,effect-path "effect")
                         (,entity-path "entity")
                         (,environment-path "environment")
                         (,font_textures-path "font")
                         (,gui-path "gui")
                         (,item_textures-path "item")
                         (,map-path "map")
                         (,misc-path "misc")
                         (,mob_effect-path "mob_effect")
                         (,painting-path "painting")
                         (,particle-path "particle")
                         (,trims-path "trims")))
        (ensure-directories-exist (first entry)))

(dolist (contents-path mainPaths)
        (dolist (subdir '("allay/" "armorstand/" "axolotl/" "banner/" "bear/" "bed/" "bee/" "bell/" "boat/" "breeze/" "camel/" "cat/" "chest/" "chest_boat/" "chicken/" "conduit/" "copper_golem/" "cow/" "creaking/" "creeper/" "decorated_pot/" "end_crystal/" "enderdragon/" "enderman/" "equipment/" "fish/" "fox/" "frog/" "ghast/" "goat/" "hoglin/" "horse/" "illager/" "iron_golem/" "llama/" "panda/" "parrot/" "pig/" "piglin/" "player/" "projectiles/" "rabbit/" "sheep/" "shield/" "shulker/" "signs/" "skeleton/" "slime/" "sniffer/" "squid/" "strider/" "tadpole/" "turtle/" "villager/" "warden/" "wither/" "wolf/" "zombie/" "zombie_villager/"))
        (ensure-directories-exist (merge-pathnames subdir entity-path))))

(let ((equipment-textures-path (merge-pathnames "equipment/" entity-path)))
      (dolist (contents-path mainPaths) 
        (dolist (subdir '("camel_saddle/" "donkey_saddle/" "happy_ghast_body/" "horse_body/" "horse_saddle/" "humanoid/" "humanoid_leggings/" "llama_body/" "mule_saddle/" "pig_saddle/" "skeleton_horse_saddle/" "strider_saddle/" "wings/" "wolf_body/" "zombie_horse_saddle/"))
        (ensure-directories-exist (merge-pathnames subdir equipment-textures-path)))))

(let ((player-textures-path (merge-pathnames "player/" entity-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("slim/" "wide/"))
        (ensure-directories-exist (merge-pathnames subdir player-textures-path)))))

(let ((signs-textures-path (merge-pathnames "signs/" entity-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("hanging/"))
        (ensure-directories-exist (merge-pathnames subdir signs-textures-path)))))

(let ((villager-textures-path (merge-pathnames "villager/" entity-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("profession/" "profession_level/" "type/"))
        (ensure-directories-exist (merge-pathnames subdir villager-textures-path)))))

(let ((zombie_villager-textures-path (merge-pathnames "zombie_villager/" entity-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("profession/" "profession_level/" "type/"))
        (ensure-directories-exist (merge-pathnames subdir zombie_villager-textures-path)))))

;;gui
(let ((advancements-path (merge-pathnames "advancements/" gui-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("backgrounds/"))
        (ensure-directories-exist (merge-pathnames subdir advancements-path)))))

(let ((container-path (merge-pathnames "container/" gui-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("creative_inventory/"))
        (ensure-directories-exist (merge-pathnames subdir container-path)))))

(let ((title-path (merge-pathnames "title/" gui-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("background/"))
        (ensure-directories-exist (merge-pathnames subdir title-path)))))

(let ((gui-singledir-path (merge-pathnames "gui/" textures-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("hanging_signs/" "presets/" "realms/"))
          (ensure-directories-exist (merge-pathnames subdir gui-singledir-path)))))

(let ((sprite-path (merge-pathnames "sprites/" gui-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("advancements/" "boss_bar/" "container/" "dialog/" "gamemode_switcher/" "hud/" "icon/" "notification/" "pending_invite/" "player_list/" "popup/" "realm_status/" "recipe_book/" "server_list/" "social_interactions/" "spectator/" "statistics/" "toast/" "tooltip/" "tansferable_list/" "widget/" "world_list/"))
          (ensure-directories-exist (merge-pathnames subdir sprite-path)))))

(let* ((sprite-path (merge-pathnames "sprites/" gui-path))
      (sprites-container-path (merge-pathnames "container/" sprite-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("anvil/" "beacon/" "blast_furnace/" "brewing-stand/" "bundle/" "cartography_table/" "crafter/" "creatve_inventory/" "enchanting_table/" "furnace/" "grindstone/" "horse/" "inventory/" "loom/" "slot/" "smithing/" "smoker/" "stonecutter/" "villager/"))
          (ensure-directories-exist (merge-pathnames subdir sprites-container-path)))))

(let ((decorations-path (merge-pathnames "map/" textures-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("decorations/"))
          (ensure-directories-exist (merge-pathnames subdir decorations-path)))))

(let ((trims-path (merge-pathnames "trims/" textures-path)))
      (dolist (contents-path mainPaths)
        (dolist (subdir '("color_palettes/" "entity/" "items/"))
          (ensure-directories-exist (merge-pathnames subdir trims-path)))))

(let ((trims-path (merge-pathnames "tirms/" textures-path))
      (trims-entity-path (merge-pathnames "entity/" trims-path)))
        (dolist (contents-path mainPaths)
          (dolist (subdir '("humanoid/" "humanoid_leggings/"))
            (ensure-directories-exist (merge-pathnames subdir trims-entity-path)))))


))
)