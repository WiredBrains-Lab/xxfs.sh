xxh() {
    xxh128sum $1 | awk '{print $1}'
}

xxh_fname() {
    a=`echo $1 | cut -c1-1`
    b=`echo $1 | cut -c2-2`
    c=`echo $1 | cut -c3-3`
    d=`echo $1 | cut -c4-4`
    e=`echo $1 | cut -c5-5`
    
    echo "$root_dir/$a/$b/$c/$d/$e/$1"
}
