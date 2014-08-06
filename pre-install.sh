#!/bin/bash

function yum_install() {
    echo "yum install make gcc binutils gcc-c++ compat-libstdc++ elfutils-libelf-devel elfutils-libelf-devel-static ksh libaio libaio-devel numactl-devel sysstat unixODBC unixODBC-devel pcre-devel glibc.i686"
    sudo yum -y install make gcc binutils gcc-c++ compat-libstdc++ elfutils-libelf-devel elfutils-libelf-devel-static ksh libaio libaio-devel numactl-devel sysstat unixODBC unixODBC-devel pcre-devel glibc.i686
}

function create_user_group() {
    echo "create oracle user & dba group"
    sudo groupadd oinstall
    sudo groupadd dba
    sudo useradd -g oinstall -G dba -d /home/oracle oracle
    echo "create oracle user & group success!"
}

function create_all_oracle_directory() {
    echo "create all oracle directory"
    echo "  -> 数据库系统安装目录"
    sudo mkdir -p /app/server/oracle
    sudo chown -R oracle:oinstall /app/server/oracle
    sudo chmod -R 755 /app/server/oracle
    echo "  -> 数据库数据安装目录"
    sudo mkdir -p /app/data/oradata
    echo "  -> 数据备份目录"
    sudo mkdir /app/data/oradata_back
    echo "  -> 清单目录"
    sudo mkdir /app/data/inventory

    sudo chown -R oracle:oinstall /app/data

    sudo chmod -R 775 /app/server/oracle
    sudo chmod -R 775 /app/data
}

yum_install
create_user_group
create_all_oracle_directory
