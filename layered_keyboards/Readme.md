# Layered keyboard

 Implement some feature of [qmk](https://docs.qmk.fm/#/features) using [AutoHotKey](https://www.autohotkey.com/)
 - 4 layer
 - mouse key

## Layers
 - short click layer key(LCtrl,LShift,RShift)
  - Left Control : layer 0(Normal)
  ![layer0](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer0.png) 
  - Left Shift : layer 1(Navigation, Mouse)
   Alt+j,k,l,i -> mouse move
  ![layer1](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer1.png) 
  - Right Shift : layer 2(Function), layer 3(Numpad)
  ![layer2](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer2.png) 
  ![layer3](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer3.png) 
  
## 60% and 40% keyboard blocking

A few variants of this script exist for people who want
* [QMK 60](qmk_60.ahk) A 60% keyboard
* [QMK 40](qmk_40.ahk) A 40% keyboard
* [QMK no top numbers](qmk_no_top_numbers.ahk) Only blocks the top number row

### QMK 60

The following keys groups were made inactive:

- Function keys
- printScreen Scrollock Pause
- Ins Home PgUp
- Del End PgDown
- nummeric pad
- cursor keys
  
The above keys and these keys in combination with a single modifier, Shift, Control, Alt or Windows are blocked.
I did not bother with removing them with combined modifiers. 

## QMK 40

The following keys groups were made inactive:

  ; - Same as 60% mentioned above
  ; - Top row nummeric keys and +  and -. 
  ;
  ; The ~ or backtick and the backspace aren not yet blocked. THese require sensible remapping first.

## QMK no top numbers

This variant only blocks the top numbers, like the 40% keyboard, but does not block any other keys.

## Blocking hack, map to F24

If I correctly understand the Autohotkey manual making a key do nothing should be done by just doing a return.
Unfortunately that had some weird side effects. For layer two we noticed that I could press type 7,8 and 9 using the keys on the second row from the bottom. However pressing _a_ for _1_, _s_ for _2_ etc. Did not work. Performing a Beep instead did not work. When I mapped to _q_ instead it worked. Instead of mapping to _q_, I mapped to _F24_. If you have _F24_ on your keyboard, I am curious to know what board that is.

## Future work

* A 40% and 60% variant with vim mapping for the cursor keys
* Improve the 40% keyboard in such a way that that _tilde_ and _backspace_ are also blocked and mapped on the row below.
  I am currently thinking abaut mapping it like a Planck Keyboard or similar.
* More vim functionality integrated from other scripts
* A variant that has the mapping of a Ducky keyboard instead of QMK 

## References

* Original layered keyboard script: copied from https://github.com/sj0000e/AutoHotKey