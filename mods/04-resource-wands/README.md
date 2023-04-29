# Resource Wands

Adds Wands for Resource Collection
 
## Information

Mod Type: Content 

**Asset Types**

- Itemtypes: used to define items in the game
- Lang: used by the game to define the names of items defined in itemtypes
- Shapes: can be used by Itemtypes to add shapes to items
- Textures: can be used by Itemtypes to add textures to items
 
## Tutorial

This mod is part of 'VS Mods for Noobs', a guide to learning how to mod for VS from scratch

This example demonstrates:

1. Adding an Item to the Game
2. Adding a new item in a custom asset namespace
4. Adding Names to items
3. Adding Shapes to items
4. Adding Dynamic Material to Shapes
5. Creating multiple dynamic variations of an item
6. Adding resource collection tool properties to items
6. Adding first person and third person orientation roperties to items


### Tips & Tricks

- Resources are namespaced according to the name of the directory in assets
- shapes are json files that can be dynamically modified by assigning a texture to a texture property of the object. 

For example

./shapes/item/tool/wand.json

```json
	"textures": {
		"handle-material": "item/tool/wand-base",
		"magic-material": "item/tool/wand-base"
	},

	"elements": [
    ...
		"children": [
        ...
            "children": [
            ...        
                "name": "HaloX",
                ...
                "faces": {
                    "north": { "texture": "#magic-material", "uv": [ 0.0, 5.0, 1.0, 6.0 ] },
                    ...
                }
```


./itemtypes/wand.json

```json 
...
	textures: {
        "magic-material": { base: "item/tool/wand-overlay-{type}" }
	},
...
```

## Credits & References

- https://wiki.vintagestory.at/index.php/Modding:Advanced_JSON_Item
- Vintagestory/assets/survival/itemtypes/tool/pickaxe.json