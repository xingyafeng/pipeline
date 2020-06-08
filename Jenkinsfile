#!/usr/bin/env groovy

pipeline {
    agent {
        node {
            label "WS186"
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
                    agent {
                        label "WS186"
                    }
                    steps {
                        echo "On Branch A"
                        echo "Hello, ${CC}, nice to meet you."

                        sh 'sleep 5'
                        sh 'touch branch_a'
                        sh 'touch branch_xxx'
                    }
                }
                stage('Branch B') {
                    agent {
                        label "10.129.46.20"
                    }
                    steps {
                        echo "On Branch B"
                        sh 'sleep 5'
                        sh 'touch branch_b'
                        script {
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