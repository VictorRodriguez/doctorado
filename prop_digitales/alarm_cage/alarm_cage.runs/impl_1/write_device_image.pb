
n
Command: %s
1870*	planAhead29
%open_checkpoint alarm_cage_routed.dcp2default:defaultZ12-2866h px� 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.08 ; elapsed = 00:00:00.06 . Memory (MB): peak = 2608.617 ; gain = 3.969 ; free physical = 22683 ; free virtual = 424452default:defaulth px� 
`
Loading part %s157*device2-
xcvc1802-viva1596-3HP-e-S2default:defaultZ21-403h px� 
~
*Unknown Tile Type, %s, given for group, %s266*device2
SLL2default:default2
SLL2default:defaultZ21-713h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2621.5862default:default2
0.0002default:default2
218992default:default2
416622default:defaultZ17-722h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
�
"Loaded Vivado IP repository '%s'.
1332*coregen2B
./home/vmrod/tools/Xilinx/Vivado/2020.3/data/ip2default:defaultZ19-2313h px� 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2020.32default:defaultZ1-479h px� 
k
)GCLK Deskew mode is set to %s via param.
1359*constraints2
Off2default:defaultZ18-5718h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
L
*Restoring timing data from binary archive.264*timingZ38-478h px� 
F
$Binary timing data restore complete.265*timingZ38-479h px� 
L
*Restoring constraints from binary archive.481*projectZ1-856h px� 
E
#Binary constraint restore complete.478*projectZ1-853h px� 
?
Reading XDEF placement.
206*designutilsZ20-206h px� 
D
Reading placer database...
1602*designutilsZ20-1892h px� 
=
Reading XDEF routing.
207*designutilsZ20-207h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2$
Read XDEF File: 2default:default2
00:00:00.142default:default2
00:00:00.172default:default2
3484.6952default:default2
0.0002default:default2
213282default:default2
410912default:defaultZ17-722h px� 
�
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
2.2000002default:default2
	26.9403612default:defaultZ20-1924h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common20
Finished XDEF File Restore: 2default:default2
00:00:022default:default2
00:00:022default:default2
3484.6952default:default2
291.5162default:default2
213282default:default2
410912default:defaultZ17-722h px� 
�
Y2 Level speed models with no predriver populated from models with predrivers.  Count = %s767*device2
652default:defaultZ21-2210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3714.9922default:default2
0.0002default:default2
208772default:default2
406402default:defaultZ17-722h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
'Checkpoint was created with %s build %s378*project2+
Vivado v2020.3 (64-bit)2default:default2
31732772default:defaultZ1-604h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
open_checkpoint: 2default:default2
00:00:382default:default2
00:00:582default:default2
3714.9922default:default2
1116.2812default:default2
208762default:default2
406392default:defaultZ17-722h px� 
s
Command: %s
53*	vivadotcl2B
.write_device_image -force -file alarm_cage.pdi2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xcvc18022default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xcvc18022default:defaultZ17-349h px� 
�
%Your %s license expires in %s day(s)
86*common2"
Implementation2default:default2
272default:defaultZ17-86h px� 
{
,Running DRC as a precondition to command %s
1349*	planAhead2&
write_device_image2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
eCannot write hardware definition file as there are no IPI block design hardware handoff files present584*projectZ1-1073h px� 
�
�Versal CIPS exists check - wdi: Versal designs must contain a CIPS IP in the netlist hierarchy to function properly. Please create an instance of the CIPS IP and configure it. Without a CIPS IP in the design, Vivado will not generate a CDO for the PMC, an elf for the PLM.%s*DRC28
  DRC|Project|CIPS_EXIST_WDI check2default:default8ZCIPS-2h px� 
�
�Unconstrained Logical Port: 4 out of 4 logical ports have no user assigned specific location constraint (LOC). This may cause I/O contention or incompatibility with the board power or connectivity affecting performance, signal integrity or in extreme cases cause damage to the device or the components to which it is connected. To correct this violation, specify all pin locations. This design will fail to generate a bitstream unless all logical ports have a user specified site LOC constraint defined.  To allow bitstream creation with unspecified pin locations (not recommended), use this command: set_property SEVERITY {Warning} [get_drc_checks UCIO-1].  NOTE: When using the Vivado Runs infrastructure (e.g. launch_runs Tcl command), add this command to a .tcl file and add that file as a pre-hook for write_bitstream step for the implementation run.  Problem ports: %s.%s*DRC2�
 ""
alarmalarm2default:default" 
masamasa2default:default"
tata2default:default"
tbtb2default:default2default:default2(
 DRC|Pin Planning2default:default8ZUCIO-1h px� 
Z
DRC finished with %s
1905*	planAhead2
2 Errors2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
R
+Error(s) found during DRC. Bitgen not run.
1345*	planAheadZ12-1345h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
242default:default2
12default:default2
02default:default2
32default:defaultZ4-41h px� 
T

%s failed
30*	vivadotcl2&
write_device_image2default:defaultZ4-43h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2(
write_device_image: 2default:default2
00:00:062default:default2
00:00:182default:default2
3957.6882default:default2
242.6952default:default2
206842default:default2
404462default:defaultZ17-722h px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Jun 22 21:51:35 20212default:defaultZ17-206h px� 


End Record