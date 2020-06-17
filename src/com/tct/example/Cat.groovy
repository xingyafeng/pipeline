package com.tct.example

class Cat {

    def name;

    Cat(name) {
        this.name = name
    }

    def getName() {
        return name
    }

    void setName(name) {
        this.name = name
    }

    void run() {
        def ret = this.getClass().getSimpleName() + " : " + name + " is runing ..."
        def tools = new tools()

        tools.i("$ret")
    }
}
