"""

输出pipeline环境变量

"""

def print_env() {

    log.i("------------------ print env")

    """分支名"""
    log.i("BRANCH_NAME:  ${env.BRANCH_NAME}")

    """分支信息"""
    log.i("CHANGE_ID:  ${env.CHANGE_ID}")
    log.i("CHANGE_URL:  ${env.CHANGE_URL}")
    log.i("CHANGE_FORK:  ${env.CHANGE_FORK}")
    log.i("CHANGE_TITLE:  ${env.CHANGE_TITLE}")
    log.i("CHANGE_AUTHOR:  ${env.CHANGE_AUTHOR}")
    log.i("CHANGE_TARGET:  ${env.CHANGE_TARGET}")
    log.i("CHANGE_BRANCH:  ${env.CHANGE_BRANCH}")
    log.i("CHANGE_AUTHOR_EMAIL:  ${env.CHANGE_AUTHOR_EMAIL}")
    log.i("CHANGE_AUTHOR_DISPLAY_NAME:  ${env.CHANGE_AUTHOR_DISPLAY_NAME}")

    """TAG信息"""
    log.i("TAG_NAME:  ${env.TAG_NAME}")
    log.i("TAG_DATE:  ${env.TAG_DATE}")
    log.i("TAG_UNIXTIME:  ${env.TAG_UNIXTIME}")
    log.i("TAG_TIMESTAMP:  ${env.TAG_TIMESTAMP}")

    """BUILD信息"""
    log.i("BUILD_ID:  ${env.BUILD_ID}")
    log.i("BUILD_URL:  ${env.BUILD_URL}")
    log.i("BUILD_NUMBER:  ${env.BUILD_NUMBER}")
    log.i("BUILD_DISPLAY_NAME:  ${env.BUILD_DISPLAY_NAME}")

    """JOB信息"""
    log.i("JOB_URL:  ${env.JOB_URL}")
    log.i("JOB_NAME:  ${env.JOB_NAME}")
    log.i("JOB_BASE_NAME:  ${env.JOB_BASE_NAME}")
    log.i("EXECUTOR_NUMBER:  ${env.EXECUTOR_NUMBER}")

    """NODE信息"""
    log.i("NODE_NAME:  ${env.NODE_NAME}")
    log.i("NODE_LABELS:  ${env.NODE_LABELS}")
    log.i("WORKSPACE:  ${env.WORKSPACE}")
    log.i("JENKINS_HOME:  ${env.JENKINS_HOME}")
    log.i("JENKINS_URL:  ${env.JENKINS_URL}")
}