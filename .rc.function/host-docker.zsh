#!/usr/bin/env zsh

host-docker () {
	htopcfg="
# Beware! This file is rewritten by htop when settings are changed in the interface.
# The parser is also very primitive, and not human-friendly.
htop_version=3.1.1
config_reader_min_version=2
fields=0 48 17 18 38 39 40 2 46 47 49 1
sort_key=46
sort_direction=-1
tree_sort_key=0
tree_sort_direction=1
hide_kernel_threads=1
hide_userland_threads=1
shadow_other_users=0
show_thread_names=1
show_program_path=1
highlight_base_name=1
highlight_deleted_exe=1
highlight_megabytes=1
highlight_threads=1
highlight_changes=1
highlight_changes_delay_secs=5
find_comm_in_cmdline=1
strip_exe_from_cmdline=1
show_merged_command=1
tree_view=1
tree_view_always_by_pid=1
all_branches_collapsed=0
header_margin=1
detailed_cpu_time=1
cpu_count_from_one=1
show_cpu_usage=1
show_cpu_frequency=0
update_process_names=1
account_guest_in_cpu_meter=1
color_scheme=0
enable_mouse=1
delay=15
hide_function_bar=0
header_layout=two_50_50
column_meters_0=LeftCPUs Memory Swap
column_meter_modes_0=1 1 1
column_meters_1=RightCPUs Tasks LoadAverage Uptime
column_meter_modes_1=1 2 2 2
"
	docker run -it --rm --privileged --pid=host --name host-docker alpine sh -c "apk add htop bash; mkdir -p ~/.config/htop; echo '$htopcfg' > ~/.config/htop/htoprc; bash"
}
