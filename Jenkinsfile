pipeline {
    agent { label 'master' }

    stages {
        stage('Compile') {
            steps {
                build job: 'compile'
            }
        }
        stage('Test') {
            steps {
                build job: 'test'
            }
            post {
                success {
                    script {
                        currentBuild.result = 'SUCCESS'
                    }
                }
                failure {
                    script {
                        currentBuild.result = 'FAILURE'
                        error('Stopping the pipeline due to Test stage failure.')
                    }
                }
            }
        }
        stage('Package') {
            when {
                expression {
                    currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                build job: 'package'
            }
        }
        stage('Ansible Deploy') {
            when {
                expression {
                    currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                build job: 'ansible-deploy'
            }
        }
    }
}
