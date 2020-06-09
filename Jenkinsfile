#!/usr/bin/env groovy
@Library('jenkinslibrary@master') _

"""
初始化对象
"""

def tools = new org.devops.tools()
def toemail = new org.devops.toemail()
def d = new org.devops.Dog("hahahahaha")

pipeline {
    agent {
        node {
            label "ws186"
            customWorkspace "/home/yafeng/jobs/${JOB_NAME}"
        }
    }

    environment {
        CC = 'clang'
    }

    stages {
        stage('Non-Parallel Stage') {
            steps {
                echo 'This stage will be executed first.'
            }
        }

        stage('Parallel Stage') {
            // when {
            //     not { branch 'master' }
            // }

            failFast true
            parallel {
                stage('Branch A') {
//                    agent {
//                        label "ws186"
//                    }
                    steps {
                        echo "On Branch A"
                        echo "Hello, ${CC}, nice to meet you."

                        // sh 'sleep 5'
                        // sh 'touch branch_a'
                        // sh 'touch branch_xxx'
                    }
                }

                stage('Branch B') {
                    // agent {
                    //     label "10.129.46.20"
                    // }
                    steps {
                        echo "On Branch B"

                        // sh 'sleep 5'
                        // sh 'touch branch_b'

                        script {
                            log.info 'Starting'
                            log.cmd  '测试是否成功？'
                            d.init()
                            d.setName("小黄")
                            println(d.getName())
                            d.run()
                            println(d.getName())

                            userEmail = "514779897@qq.com"
                            tools.PrintMes("测试 Share lib 成功","green")
                            // toemail.Email("代码质量阈错误！请及时修复！",userEmail)
                            def browsers = ['chrome', 'firefox']
                            for (int i = 0; i < browsers.size(); ++i) {
                                echo "Testing the ${browsers[i]} browser"
                            }
                        }
                    }
                }
            }
        }
    }
}
