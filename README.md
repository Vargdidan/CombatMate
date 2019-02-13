# CombatMate
A combat tool for DnD

## Initial design:

![Screenshot](https://user-images.githubusercontent.com/19270689/52703285-4e722900-2f7e-11e9-8fc5-30e18cd2f50e.png)


## Comments:
- Pressing one of the input-fields should promt a text-edit box to appear in the middle of the screen.
- The text-edit is summoned and connected to each input-field.
- Weapons should have a button for changing the current weapon. Should be a dropdown list.
- HP should be represented as a textureprogress.
- https://docs.godotengine.org/en/3.0/getting_started/step_by_step/ui_code_a_life_bar.html
- ~~Use a spritesheet for counting and select the correct frame corresponding to the value.~~
- **Spritesheet is a nice to have feature, use numbers in the first iteration**
- End turn should count down the effects (Rage, buffs and debuffs) and count up the number of turns.
- Holding the "End turn" button should end combat.
- Ending combat should reset turns and clear all temporary effects.
- Add a exhaustion to the design, place it under the HP bar.
- Death saves is on its own scene which is shown when HP reaches 0.
- Death saves scene should result in either going back to combat scene or to death scene.
- Death saves should have a reset of saves for after a long rest and a healed button.
- Turns is counted when a death save is registered.
