#!/bin/sh

groupList() {
cat <<EOF
net_bt_admin:x:3001
net_bt:x:3002
inet:x:3003
net_raw:x:3004
net_admin:x:3005
net_bw_stats:x:3006
net_bw_acct:x:3007
net_bt_stack:x:3008
sdcard_r:x:1028
EOF
}

patchGroup() {
    [ -e /etc/group ] || {
        echo "Do not run this script at outside!"
        exit 1;
    };
    grep -q "net_bt_admin" /etc/group || {
        groupList >> /etc/group
    };
}

patchUser() {
    local user="$1"
    [ x$user = "x" ] && return;
    groupList | while read group; do
        group=$(echo $group | cut -d':' -f1)
        gpasswd -a "$user" $group || return;
    done
}

main() {
    [ $# -lt 1 ] && {
        echo "$0 <username>"
        exit 0;
    }; local user="$1";
    patchGroup;
    patchUser "$user";
}; main "$@";
