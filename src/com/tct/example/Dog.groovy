package com.tct.example

class Dog {

    def name

    def log
    def utils

    def toemail

    Dog(name) {
        this.name = name
    }

    Dog(name, log, utils) {
        this.name = name
        this.log = log
        this.utils = utils

        init()
    }

    def getName() {
        tools.i("get name $name")
        return name
    }

    void setName(name) {
        this.name = name
        tools.i("set name $name")
    }

    def run() {
        setName("小小鸟")
        tools.i("测试 库之前的调用关系")
    }

    def init() {
        log.i("dog init ...")

        if (tools == null) {
            tools = new tools()
            tools.i("dog init ...")
        }

        if (toemail == null) {
            toemail = new toemail()
        }
    }

    static void main(String[] args) {

        Dog d = new Dog()
        d.setName("dahuang")
        println(d.getName())
        d.run()
        println(d.getName())
    }
}
