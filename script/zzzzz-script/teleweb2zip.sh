#!/usr/bin/env bash

# if error;then exit
set -e

# exec shell
shellfs=$0

# init function
. "`dirname $0`/jenkins/yunovo_init.sh"

# 1.项目名
build_zip_project=
# 2.同步类型
build_zip_type=
# 3.同步版本
build_zip_version=

function handle_vairable() {

    # 1. 项目名
    build_zip_project=${zip_project:=}

    # 2. 同步类型
    build_zip_type=${zip_type:=}

    # 3. 同步版本
    build_zip_version=${zip_version:=}
}

function print_variable() {

    echo
    echo "JOBS = " ${JOBS}
    echo '-----------------------------------------'
    echo "build_zip_project = " ${build_zip_project}
    echo "build_zip_type    = " ${build_zip_type}
    echo "build_zip_version = " ${build_zip_version}
    echo '-----------------------------------------'
}

function init() {

    handle_vairable
    print_variable
}

# 执行压缩
function exec_zip() {

    log debug "ver_p    = ${ver_p}"
    log debug "zip_name = ${zip_name}"

    if [[ ! -f ${zip_name}.zip ]]; then
        sudo zip -v ${zip_name}.zip *.*
    else
        log info "The ${zip_name}.zip file is exist ... "
    fi
}

function zip_version() {

    local ver_p ret zip_name
    local pwd_one pwd_two
    local version=('5' '6' '7' '8' '9' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N')

    # 1级目录
    case ${build_zip_project} in

        tokyolitetmo|seattlevzw|seattletmo|apollo84gtmo)
            log print "normal mode .."

            ver_p=${rom_p}/${build_zip_project}/${build_zip_type}/${build_zip_version}
            zip_name=${build_zip_version}

            cd ${ver_p} > /dev/null
            exec_zip
            cd - > /dev/null
            ;;

        portotmo|thor84gvzw)
            # 2级目录
            case ${build_zip_type} in

                tmp|appli)

                    ret=${build_zip_version: -2} && ret=${ret:0:1}
                    log debug "ret = $ret"

                    # 3级目录 若版本号倒数第二位 为 ('5' '6' '7' '8' '9' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N') 的要特殊处理
                    case ${ret} in
                        3|4|5|6|7|8|9|A|B|C|D|E|F|G|H|I|J|K|L|M|N)
                            pwd_one=`pwd`
                            ver_p=${rom_p}/${build_zip_project}/${build_zip_type}/${build_zip_version}

                            cd ${ver_p} > /dev/null

                            for p in `find . -name *.MD5 | cut -d '/' -f 2-` ; do
                                pwd_two=`pwd`
                                ver_p=${rom_p}/${build_zip_project}/${build_zip_type}/${build_zip_version}/`dirname ${p}`
                                zip_name=_${build_zip_version}_`dirname ${p} | sed s#/#_#g`

                                cd ${ver_p} > /dev/null
                                exec_zip
                                cd ${pwd_two} > /dev/null
                            done

                            cd ${pwd_one} > /dev/null
                          ;;
                    *)
                        ver_p=${rom_p}/${build_zip_project}/${build_zip_type}/${build_zip_version}
                        zip_name=${build_zip_version}

                        cd ${ver_p} > /dev/null
                        exec_zip
                        cd - > /dev/null
                        ;;
                    esac
                    ;;

                userdebug)
                    # 3级目录 若版本号倒数第二位 为 p 则会特殊处理
                    ret=${build_zip_version: -2} && ret=${ret:0:1}
                    log debug "ret = $ret"

                    # 3级目录 若版本号倒数第二位 为 (P) 的要特殊处理
                    case ${ret} in
                        P)
                            pwd_one=`pwd`
                            ver_p=${rom_p}/${build_zip_project}/${build_zip_type}/${build_zip_version}

                            cd ${ver_p} > /dev/null

                            for p in `find . -name *.MD5 | cut -d '/' -f 2-` ; do
                                pwd_two=`pwd`
                                ver_p=${rom_p}/${build_zip_project}/${build_zip_type}/${build_zip_version}/`dirname ${p}`
                                zip_name=_${build_zip_version}_`dirname ${p} | sed s#/#_#g`

                                cd ${ver_p} > /dev/null
                                exec_zip
                                cd ${pwd_two} > /dev/null
                            done

                            cd ${pwd_one} > /dev/null
                            ;;
                        *)
                            ;;
                    esac
            esac
            ;;
        *)
            ;;
    esac
}

function sendEmail() {

    local isSend=

    if [[ "$1" ]]; then
        isSend=$1
    else
        log error "参数不正确."
    fi

    python ${script_p}/extend/sendemail.py ${build_zip_project} ${build_zip_type} ${build_zip_version} ${BUILD_USER_EMAIL} ${isSend}
}

function main() {

    local rom_p=/mfs_tablet/0_Shenzhen

    # 初始化
    init

    # 压缩版本 只包含.mbn 文件
    zip_version
    if [[ $? -eq 0 ]]; then
        sendEmail true
    else
        sendEmail false
    fi
}

main "$@"