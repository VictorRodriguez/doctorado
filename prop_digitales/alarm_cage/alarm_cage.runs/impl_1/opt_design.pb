
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px� 
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
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px� 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.30 ; elapsed = 00:00:00.28 . Memory (MB): peak = 3157.711 ; gain = 64.031 ; free physical = 21795 ; free virtual = 415382default:defaulth px� 
g

Starting %s Task
103*constraints2,
Cache Timing Information2default:defaultZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
O
:Ending Cache Timing Information Task | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 3245.305 ; gain = 87.594 ; free physical = 21491 ; free virtual = 412342default:defaulth px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
;
&Phase 1 Retarget | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
02default:default2
02default:defaultZ31-389h px� 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
G
2Phase 2 Constant propagation | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
02default:default2
02default:defaultZ31-389h px� 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px� 
8
#Phase 3 Sweep | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
02default:defaultZ31-389h px� 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px� 
�
PPhase BUFG optimization inserted %s global clock buffer(s) for CLOCK_LOW_FANOUT.553*opt2
02default:defaultZ31-1077h px� 
D
/Phase 4 BUFG optimization | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2%
BUFG optimization2default:default2
02default:default2
02default:default2
02default:defaultZ31-662h px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px� 
�
dSRL Remap converted %s SRLs to %s registers and converted %s registers of register chains to %s SRLs546*opt2
02default:default2
02default:default2
02default:default2
02default:defaultZ31-1064h px� 
N
9Phase 5 Shift Register Optimization | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px� 
x

Phase %s%s
101*constraints2
6 2default:default2+
Post Processing Netlist2default:defaultZ18-101h px� 
J
5Phase 6 Post Processing Netlist | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2+
Post Processing Netlist2default:default2
02default:default2
02default:defaultZ31-389h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Retarget                     |               0  |               0  |                                              0  |
|  Constant propagation         |               0  |               0  |                                              0  |
|  Sweep                        |               0  |               0  |                                              0  |
|  BUFG optimization            |               0  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                              0  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
I
4Ending Logic Optimization Task | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.01 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
\

Starting %s Task
103*constraints2!
Final Cleanup2default:defaultZ18-103h px� 
D
/Ending Final Cleanup Task | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
b

Starting %s Task
103*constraints2'
Netlist Obfuscation2default:defaultZ18-103h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3426.2422default:default2
0.0002default:default2
213082default:default2
410512default:defaultZ17-722h px� 
J
5Ending Netlist Obfuscation Task | Checksum: cfc759fb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 3426.242 ; gain = 0.000 ; free physical = 21308 ; free virtual = 410512default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272default:default2
12default:default2
42default:default2
02default:defaultZ4-41h px� 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:00:062default:default2
00:00:082default:default2
3426.2422default:default2
340.5662default:default2
213082default:default2
410512default:defaultZ17-722h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2[
G/home/vmrod/vivado/alarm_cage/alarm_cage.runs/impl_1/alarm_cage_opt.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
pExecuting : report_drc -file alarm_cage_drc_opted.rpt -pb alarm_cage_drc_opted.pb -rpx alarm_cage_drc_opted.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2w
creport_drc -file alarm_cage_drc_opted.rpt -pb alarm_cage_drc_opted.pb -rpx alarm_cage_drc_opted.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
�
�Ignoring request to add DRC rule check '%s' to factory rule deck '%s'. Customization is not allowed for factory DRC rule decks. Please create a user copy of the factory DRC rule deck which can then be customized.
26*drc2
PDCNXA-32default:default2$
bitstream_checks2default:defaultZ23-32h px� 
�
�Ignoring request to add DRC rule check '%s' to factory rule deck '%s'. Customization is not allowed for factory DRC rule decks. Please create a user copy of the factory DRC rule deck which can then be customized.
26*drc2
PDCNXA-32default:default2
default2default:defaultZ23-32h px� 
�
�Ignoring request to add DRC rule check '%s' to factory rule deck '%s'. Customization is not allowed for factory DRC rule decks. Please create a user copy of the factory DRC rule deck which can then be customized.
26*drc2
PDCNXA-32default:default2

eco_checks2default:defaultZ23-32h px� 
�
�Ignoring request to add DRC rule check '%s' to factory rule deck '%s'. Customization is not allowed for factory DRC rule decks. Please create a user copy of the factory DRC rule deck which can then be customized.
26*drc2
PDCNXA-42default:default2$
bitstream_checks2default:defaultZ23-32h px� 
�
�Ignoring request to add DRC rule check '%s' to factory rule deck '%s'. Customization is not allowed for factory DRC rule decks. Please create a user copy of the factory DRC rule deck which can then be customized.
26*drc2
PDCNXA-42default:default2
default2default:defaultZ23-32h px� 
�
�Ignoring request to add DRC rule check '%s' to factory rule deck '%s'. Customization is not allowed for factory DRC rule decks. Please create a user copy of the factory DRC rule deck which can then be customized.
26*drc2
PDCNXA-42default:default2

eco_checks2default:defaultZ23-32h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
Y2 Level speed models with no predriver populated from models with predrivers.  Count = %s767*device2
652default:defaultZ21-2210h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
 2-168*	vivadotcl2�
M/home/vmrod/vivado/alarm_cage/alarm_cage.runs/impl_1/alarm_cage_drc_opted.rptM/home/vmrod/vivado/alarm_cage/alarm_cage.runs/impl_1/alarm_cage_drc_opted.rpt2default:default8h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
report_drc: 2default:default2
00:01:012default:default2
00:01:212default:default2
5632.3552default:default2
2166.0942default:default2
195962default:default2
393492default:defaultZ17-722h px� 


End Record