pipeline {
    agent { label 'slave1' }

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
        }
        stage('Package') {
            steps {
                build job: 'package'
            }
        }
    }
}
