pipeline {
    agent none

    stages {
        stage('Compile') {
            agent { label 'master' }
            steps {
                build job: 'one'
            }
        }
        stage('Test') {
            agent { label 'slave1' }
            steps {
                build job: 'two'
            }
        }
        stage('Package') {
            agent { label 'slave1' }
            steps {
                build job: 'three'
            }
        }
    }
}
