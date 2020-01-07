#get all files in a root dir
function getDirFiles(){
    for file in $1/*
    do
        if test -f $file
        then
            echo $file
        else
            getDirFiles $file
        fi
    done
}

#getDirFiles data

#get all dirs in a root dir
function getDirs(){
    echo $1
    for file in $1/*
    do
        if test -f $file
        then
            #echo $file
            arr=(${arr[*]} $file)
        else
            getDirs $file
        fi
    done
}

#getDirs data

#get all dirs and files in a root dir
function getDirsAndFiles(){
    echo $1
    for file in $1/*
    do
        if test -f $file
        then
            echo $file
        else
            getDirsAndFiles $file
        fi
    done
}

#getDirsAndFiles data
