#!/bin/bash

terminalColorClear='\033[0m' 
terminalColorEmphasis='\033[1;32m' 
terminalColorError='\033[1;31m' 
terminalColorMessage='\033[1;33m' 
terminalColorWarning='\033[1;34m'

tiny-alert-error(){
  echo -e "\033[1;31m$1\033[0m" 
  exit 1
}

help() {
  echo -e "
compile -t <type> -i <input_dir> -o <out_dir>

  -t      指定编译类型,目前支持: grpcjs、grpcts、java
  -i      指定输入目录
  -o      指定输出目录
"
}


compile_type=
input_dir=
output_dir=

while getopts "t:i:o:h" arg ;do
  case $arg in
    t)
      if [ $OPTARG == "grpcjs" ] || [ $OPTARG == "grpcts" ] || [ $OPTARG == "java" ]; then
        compile_type=$OPTARG  
      fi
      ;;
    i)
      if [ -d $OPTARG ] && [ -r $OPTARG ]; then
        input_dir=$OPTARG
      fi 
      ;;
    o)
      if [ ! \( -e $OPTARG \) ];then
        mkdir -p $OPTARG
      fi
      if [ -d $OPTARG ] && [ -r $OPTARG ] && [ -w $OPTARG ];then
        output_dir=$OPTARG
      fi 
      ;;
    h)
      help
      exit 0
    ;;
    *)
      help
      exit 1
    ;;
  esac
done

if [ -z $compile_type ];then
  help
  tiny-alert-error "不支持的编译类型." 
fi

if [ -z $input_dir ];then
  help
  tiny-alert-error "输入目录不存在或没有读取权限." 
fi

if [ -z $output_dir ];then
  help
  tiny-alert-error "输出目录不存在或没有可写权限." 
fi

compile_type=$compile_type
input_dir=$(readlink -f $input_dir)
out_dir=$output_dir

protoFiles=$(find $input_dir -name *.proto)
total_number=0
for file in $protoFiles; do
  total_number=$(($total_number + 1))
done

current_index=0
str="\
====================\
====================\
====================\
====================\
====================\
"
arry=("\\" "|" "/" "-")
for proto_file in $protoFiles; do
  echo $input_dir
  case $compile_type in
    grpcts)
      protoc \
        --plugin=protoc-gen-grpc=$(which grpc_tools_node_protoc_plugin) \
        --plugin=protoc-gen-ts=$(which protoc-gen-ts) \
        --grpc_out=grpc_js:$out_dir \
        --ts_out=grpc_js:$out_dir \
        --js_out=import_style=commonjs,binary:$out_dir \
        --proto_path=$input_dir "$proto_file";
      ;;
    grpcjs)
      protoc \
        --plugin=protoc-gen-grpc=$(which grpc_tools_node_protoc_plugin) \
        --grpc_out=grpc_js:$out_dir \
        --js_out=import_style=commonjs,binary:$out_dir \
        --proto_path=$input_dir "$proto_file";
      ;;
    java)
      protoc \
        --plugin=protoc-gen-grpc-java=$(which protoc-gen-grpc-java) \
        --grpc-java_out=lite:"$out_dir" \
        --java_out=lite:"$out_dir" \
        --proto_path=$input_dir "$proto_file"
      ;;
    esac
    current_index=$(($current_index + 1))
    progress=$(($current_index * 100 / $total_number))
    printf "\r[%-100s][%d%%]%c" "${str:0:$progress}" "$progress" "${arry[$current_index%4]}"
done