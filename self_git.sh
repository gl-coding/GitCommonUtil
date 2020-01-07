
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

#getDirFiles $1

function fileScan(){
    #sed 
    cat $1 | awk '/([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})/{print $0}'
    cat $1 | awk '/([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})/{print $0}'
}

function gitAddFiles(){
    for file in $1/*
    do
        if test -f $file
        then
            #echo $file
            scale=`du $file | awk -F " " '{print $1}'`
            if [ $scale -lt 1048576 ]; then
                echo "++++++++++++++++++++++"
                echo $file
                fileScan $file
            fi
        else
            gitAddFiles $file
        fi
    done
}

gitAddFiles "data"

function gitCommitFiles(){
    gitAddFiles $1
    git commit -m $2
    git push origin master
}

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

#getDirs $1

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

#getDirsAndFiles $1
