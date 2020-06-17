package com.tct.example

class Test implements Callback {

    def log
    def utils

    test(log, utils) {
        this.log = log
        this.utils = utils
    }

    def init() {
        log.v("test init ...")
        utils.print_env()
    }

    @Override
    void go() {
        log.i("hello go go go ....")
    }
}

