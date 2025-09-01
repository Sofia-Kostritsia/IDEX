; Home Y
M98 P"0:/sys/homey.g" L1

;G28 X
;G28 U
M98 P"0:/sys/homex.g"
M98 P"0:/sys/homeu.g"

if exists(param.L) && exists(param.S)
  M98 P"0:/sys/bed.g" L1 S1 Z1
elif exists(param.L)
  M98 P"0:/sys/bed.g" L1 Z1
elif exists(param.S)
  M98 P"0:/sys/bed.g" S1 Z1
else
  M98 P"0:/sys/bed.g" Z1
if result !=0
  M98 P"0:/sys/led/fault.g"
  echo >>"Error: Cancelled due to True Bed Leveling Error"
  abort "Error: Cancelled due to True Bed Leveling Error"

if !exists(param.S)
  G1 X-999 U999 F18000 Y150 Z100 F18000

M204 T5000